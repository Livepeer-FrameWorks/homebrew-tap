#!/bin/bash
set -euo pipefail

# Auto-update Homebrew tap formulas and casks when a new release is published.
# Called from monorepo release.yml manifest job.
#
# Usage: ./bump.sh <version> <github-token>

VERSION="${1:?Usage: bump.sh <version> <github-token>}"
GITHUB_TOKEN="${2:?Missing github token}"

REPO="Livepeer-FrameWorks/monorepo"
TAP_REPO="Livepeer-FrameWorks/homebrew-tap"
RELEASE_URL="https://github.com/${REPO}/releases/download/v${VERSION}"

echo "Bumping homebrew-tap to v${VERSION}"

WORK_DIR="$(mktemp -d)"
trap 'rm -rf "${WORK_DIR}"' EXIT

# Download release assets and compute checksums
declare -A SHAS
for artifact in \
  "frameworks-cli-v${VERSION}-darwin-arm64.zip" \
  "frameworks-cli-v${VERSION}-linux-arm64.tar.gz" \
  "frameworks-cli-v${VERSION}-linux-amd64.tar.gz"; do
  echo "Downloading ${artifact}..."
  curl -sL "${RELEASE_URL}/${artifact}" -o "${WORK_DIR}/${artifact}"
  SHAS["${artifact}"]="$(shasum -a 256 "${WORK_DIR}/${artifact}" | awk '{print $1}')"
  echo "  SHA256: ${SHAS["${artifact}"]}"
done

# Check if tray app zip exists (optional)
TRAY_SHA=""
TRAY_ARTIFACT="FrameWorks-v${VERSION}.zip"
if curl -sfL -o "${WORK_DIR}/${TRAY_ARTIFACT}" "${RELEASE_URL}/${TRAY_ARTIFACT}" 2>/dev/null; then
  TRAY_SHA="$(shasum -a 256 "${WORK_DIR}/${TRAY_ARTIFACT}" | awk '{print $1}')"
  echo "Tray app SHA256: ${TRAY_SHA}"
fi

# Clone the tap repo
git clone "https://x-access-token:${GITHUB_TOKEN}@github.com/${TAP_REPO}.git" "${WORK_DIR}/tap"
cd "${WORK_DIR}/tap"

# Update CLI formula
sed -i.bak "s/version \".*\"/version \"${VERSION}\"/" Formula/frameworks-cli.rb

# Update SHA256 values in order of appearance: darwin-arm64, linux-arm64, linux-amd64
python3 -c "
import re

content = open('Formula/frameworks-cli.rb').read()

shas = {
    'darwin-arm64': '${SHAS["frameworks-cli-v${VERSION}-darwin-arm64.zip"]}',
    'linux-arm64': '${SHAS["frameworks-cli-v${VERSION}-linux-arm64.tar.gz"]}',
    'linux-amd64': '${SHAS["frameworks-cli-v${VERSION}-linux-amd64.tar.gz"]}',
}

sha_pattern = re.compile(r'sha256 \"[a-fA-F0-9PLACEHOLDER]+\"')
matches = list(sha_pattern.finditer(content))
order = ['darwin-arm64', 'linux-arm64', 'linux-amd64']

# Replace in reverse to preserve positions
for i in range(min(len(matches), len(order)) - 1, -1, -1):
    m = matches[i]
    content = content[:m.start()] + 'sha256 \"' + shas[order[i]] + '\"' + content[m.end():]

open('Formula/frameworks-cli.rb', 'w').write(content)
"

# Update tray cask if artifact exists
if [ -n "${TRAY_SHA}" ]; then
  sed -i.bak "s/version \".*\"/version \"${VERSION}\"/" Casks/frameworks.rb
  sed -i.bak "s/sha256 \".*\"/sha256 \"${TRAY_SHA}\"/" Casks/frameworks.rb
  rm -f Casks/frameworks.rb.bak
fi

rm -f Formula/frameworks-cli.rb.bak

# Commit and push
git config user.name "frameworks-ci[bot]"
git config user.email "frameworks-ci[bot]@users.noreply.github.com"
git add -A
git commit -m "bump to v${VERSION}" || { echo "No changes to commit"; exit 0; }
git push origin HEAD

echo "Homebrew tap updated to v${VERSION}"

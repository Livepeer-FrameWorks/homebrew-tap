class FrameworksCli < Formula
  desc "FrameWorks CLI - Multi-tenant live streaming platform management"
  homepage "https://github.com/Livepeer-FrameWorks/monorepo"
  version "0.2.28"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-darwin-arm64.zip"
      sha256 "459ca5001a981517689dcb153936e1aa0c5f5b8a0b12cf508a4ca3f9019c161a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "8047466a38c425f7a4d66b2164617349e231c13d63e155ab3a195553161b5f6e"
    end
    on_intel do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "235eac8e05cee73025b681e77d20e862f07fe849797c8081eccf5fd2905c6262"
    end
  end

  def install
    bin.install "frameworks"
  end

  test do
    assert_match "frameworks", shell_output("#{bin}/frameworks --version")
  end
end

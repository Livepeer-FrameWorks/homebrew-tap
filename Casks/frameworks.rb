cask "frameworks" do
  version "0.2.2-rc1"
  sha256 "daf56a86fde5f0ce70014fb91b33c863dcb472aaccd89568bf7f0161e7269b27"

  url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/FrameWorks-v#{version}.zip"
  name "FrameWorks"
  desc "FrameWorks desktop client for live streaming platform management"
  homepage "https://github.com/Livepeer-FrameWorks/monorepo"

  depends_on macos: ">= :sonoma"

  app "FrameWorks.app"

  zap trash: [
    "~/Library/Application Support/FrameWorks",
    "~/Library/Preferences/com.livepeer.frameworks.plist",
    "~/Library/Caches/com.livepeer.frameworks",
    "~/Library/Logs/FrameWorks",
  ]
end

cask "frameworks" do
  version "0.3.14"
  sha256 "5a2f03eee08608d96feacd95a011635a33025412bbe2665d3f512aef33481a1e"

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

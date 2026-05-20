cask "frameworks" do
  version "0.2.46"
  sha256 "7dae70fd87e303f3573b18a719c516b30723b6aadffd995d4bed6e6c2b774e52"

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

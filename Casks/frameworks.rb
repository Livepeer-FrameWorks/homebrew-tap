cask "frameworks" do
  version "0.3.1"
  sha256 "30a02cfcbaaf95a871bccec2ea82fcf6246169e26ad6247446ae746b7f3ff268"

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

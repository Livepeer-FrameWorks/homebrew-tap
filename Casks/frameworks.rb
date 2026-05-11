cask "frameworks" do
  version "0.2.32"
  sha256 "330a441d010dff89f7fff82df9b05d579f9b47e4ac8c79f36773e3db49d51fb3"

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

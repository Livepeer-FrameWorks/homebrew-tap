class FrameworksCli < Formula
  desc "FrameWorks CLI - Multi-tenant live streaming platform management"
  homepage "https://github.com/Livepeer-FrameWorks/monorepo"
  version "0.2.46"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-darwin-arm64.zip"
      sha256 "be5c94b420e3a931a3729b61618dded3c257dfc4470f8e644c2e5c071496489a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "14d41305d1aac843d06e6c392de68ca4ee8f3b34d2c4deb6e88b99352345727e"
    end
    on_intel do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "41c7c807249d8b6e6717b3c7e9ec03ea6ba52a6595eaa50d5eebd0d210a384eb"
    end
  end

  def install
    bin.install "frameworks"
  end

  test do
    assert_match "frameworks", shell_output("#{bin}/frameworks --version")
  end
end

class FrameworksCli < Formula
  desc "FrameWorks CLI - Multi-tenant live streaming platform management"
  homepage "https://github.com/Livepeer-FrameWorks/monorepo"
  version "0.2.0-rc2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-darwin-arm64.tar.gz"
      sha256 "064d9183f5eec2be4f996b6a4a38b8b3dd4d782f76d7cbec257a7c2a2ed0c623"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "77424c6175208eb6beac14e03be2b6653713cf8e869c9f6e0038b34ffa93e3e6"
    end
    on_intel do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "38e6f46a0046c8d66c57d11e61cfb8f85ee8ed26d1d1de77fd949f268fcac1c2"
    end
  end

  def install
    bin.install "frameworks"
  end

  test do
    assert_match "frameworks", shell_output("#{bin}/frameworks --version")
  end
end

class FrameworksCli < Formula
  desc "FrameWorks CLI - Multi-tenant live streaming platform management"
  homepage "https://github.com/Livepeer-FrameWorks/monorepo"
  version "0.2.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-darwin-arm64.zip"
      sha256 "4e1fa1cbfa6ca6d7c9566f585ba7771beac7bfeac9fbfa2e92bdb2a9a55fa7e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "9049ca3fe11d3bf60bf4785ce02c80647b97017a3f108ed3c277e0f270ef0a3a"
    end
    on_intel do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "45ff44bf03f8c36cfa67436ae5328cadabf25abb69182dcb7612be4908c82957"
    end
  end

  def install
    bin.install "frameworks"
  end

  test do
    assert_match "frameworks", shell_output("#{bin}/frameworks --version")
  end
end

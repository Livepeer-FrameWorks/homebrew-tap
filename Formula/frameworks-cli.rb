class FrameworksCli < Formula
  desc "FrameWorks CLI - Multi-tenant live streaming platform management"
  homepage "https://github.com/Livepeer-FrameWorks/monorepo"
  version "0.2.93"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-darwin-arm64.zip"
      sha256 "d22c58598de53fd50b80d26c4f5b0926dc87218c36a8c1152d11bb67ac95fb41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "3fe81064d6a4fcc7f91fb5d21fe7d71555973d8edaa4c4493ff2fa48816fc82f"
    end
    on_intel do
      url "https://github.com/Livepeer-FrameWorks/monorepo/releases/download/v#{version}/frameworks-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "f6fd287442f3e4720b46befb5e7a1da39fc2f6cc0238d1bbaa3f59debc952231"
    end
  end

  def install
    bin.install "frameworks"
  end

  test do
    assert_match "frameworks", shell_output("#{bin}/frameworks --version")
  end
end

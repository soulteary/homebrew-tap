class Grantseal < Formula
  desc "Zero-dependency offline licensing protocol and CLI built on Ed25519"
  homepage "https://github.com/soulteary/grantseal"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.0/grantseal_1.1.0_darwin_arm64.tar.gz"
      sha256 "785ab69c78528eaa9a3b2fecf158b5e0bfdd032f3736f45efcb35b973e3dbba5"
    else
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.0/grantseal_1.1.0_darwin_amd64.tar.gz"
      sha256 "6cb20c6fb4604c24a30707db2d79f49af3907dc0ea33f22f083886aeb07bee02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.0/grantseal_1.1.0_linux_arm64.tar.gz"
      sha256 "3653a3394e2d3309f293fb5d2c3f5902592a81bb2a596db381376d92ad4c6159"
    else
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.0/grantseal_1.1.0_linux_amd64.tar.gz"
      sha256 "e1f1ec9eaf6c88752a5dd038cbf4ff81717a0d8f2bded0352ead946be5b2f77f"
    end
  end

  def install
    bin.install "license-tool"
  end

  test do
    assert_match "license-tool", shell_output("#{bin}/license-tool version 2>&1")
  end
end

class Grantseal < Formula
  desc "Zero-dependency offline licensing protocol and CLI built on Ed25519"
  homepage "https://github.com/soulteary/grantseal"
  version "1.1.3"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.3/grantseal_1.1.3_darwin_arm64.tar.gz"
      sha256 "56430cd2ed1c2225994a3b7980b2de97c0b52ab9af1657fe347c4d64f798c9d0"
    else
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.3/grantseal_1.1.3_darwin_amd64.tar.gz"
      sha256 "e750ead91f76db560856961191f5a09ce5ff1f88728ee7f86166e27c4dbb2f42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.3/grantseal_1.1.3_linux_arm64.tar.gz"
      sha256 "1a2d70bed4ee1ad6a805f1e8b89b0562477f5ee29256e2598dff9be988a8860a"
    else
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.3/grantseal_1.1.3_linux_amd64.tar.gz"
      sha256 "043ac03f189a337dad555821553d1622680c903f3cff4ca8d32fa730b337f19d"
    end
  end

  def install
    bin.install "license-tool"
  end

  test do
    assert_match "license-tool", shell_output("#{bin}/license-tool version 2>&1")
  end
end

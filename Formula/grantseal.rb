class Grantseal < Formula
  desc "Zero-dependency offline licensing protocol and CLI built on Ed25519"
  homepage "https://github.com/soulteary/grantseal"
  version "1.1.2"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.2/grantseal_1.1.2_darwin_arm64.tar.gz"
      sha256 "2cf125b47f78a84e6195580b1e311438de035be70d1c894ca27e31a2a6ad8b03"
    else
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.2/grantseal_1.1.2_darwin_amd64.tar.gz"
      sha256 "abdfa5f9cc0d752b8dc6addced9cf85822a2db4b8027df8e7a93e25c80061b7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.2/grantseal_1.1.2_linux_arm64.tar.gz"
      sha256 "03765d2e1fecc5858754d60bd6435019dfd9d089dba536919086c90a6506bc49"
    else
      url "https://github.com/soulteary/grantseal/releases/download/v1.1.2/grantseal_1.1.2_linux_amd64.tar.gz"
      sha256 "f992a72511484d1fbbd258104f0d4469485cd41c29de22396e7da37aa5b3c76b"
    end
  end

  def install
    bin.install "license-tool"
  end

  test do
    assert_match "license-tool", shell_output("#{bin}/license-tool version 2>&1")
  end
end

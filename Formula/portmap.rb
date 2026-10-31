class Portmap < Formula
  desc "General-purpose TCP/UDP port forwarding tool written in Go"
  homepage "https://github.com/soulteary/portmap"
  version "1.3.4"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.3.4/portmap_1.3.4_darwin_arm64.tar.gz"
      sha256 "1d8b8f923bcc0838d56e1dc85e91873b77731a36d7fd0a147c4bcd3c103a3bc3"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.3.4/portmap_1.3.4_darwin_amd64.tar.gz"
      sha256 "dd77afab2c7ea760a10fc888b6a51887b8c2d7ccee99bfe61f904c6d071f04d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.3.4/portmap_1.3.4_linux_arm64.tar.gz"
      sha256 "fde180d2379039b3a7b6d207dc298abd773762efa6c7e83c6e3d9eef5b01919b"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.3.4/portmap_1.3.4_linux_amd64.tar.gz"
      sha256 "c20fce3e75252df17e5a64236522bbc6386566489486857cc04dc4f5f28fa510"
    end
  end

  def install
    bin.install "portmap"
  end

  test do
    assert_match "portmap", shell_output("#{bin}/portmap -version 2>&1")
  end
end

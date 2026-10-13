class Portmap < Formula
  desc "General-purpose TCP/UDP port forwarding tool written in Go"
  homepage "https://github.com/soulteary/portmap"
  version "1.3.1"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.3.1/portmap_1.3.1_darwin_arm64.tar.gz"
      sha256 "40c85a0f7fdb70325a9137f54877ee6799a383a3822e9c757181ead5568aa859"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.3.1/portmap_1.3.1_darwin_amd64.tar.gz"
      sha256 "ed9000d4e69e7bd0753647222619c6189364bd29610b18cc4e5457b91651de81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.3.1/portmap_1.3.1_linux_arm64.tar.gz"
      sha256 "3e204fe5c422d5dcef13f30d65e29992c8a9a1a34e14baf7e15e5b26f19ce4ec"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.3.1/portmap_1.3.1_linux_amd64.tar.gz"
      sha256 "5025b90ac1f4a1dcd11ae45a9b556bae8bb6c87d0957274f8089b1f2b0800db4"
    end
  end

  def install
    bin.install "portmap"
  end

  test do
    assert_match "portmap", shell_output("#{bin}/portmap -version 2>&1")
  end
end

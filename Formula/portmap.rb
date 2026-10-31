class Portmap < Formula
  desc "General-purpose TCP/UDP port forwarding tool written in Go"
  homepage "https://github.com/soulteary/portmap"
  version "1.3.5"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.3.5/portmap_1.3.5_darwin_arm64.tar.gz"
      sha256 "2ba83123566365edcd20ebc5deb8dd271acc45094de15ab7645bf98573c9b73f"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.3.5/portmap_1.3.5_darwin_amd64.tar.gz"
      sha256 "f283172990fc68182762593d1a20224b5a2528d3450956c60fbc97a71cca332b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.3.5/portmap_1.3.5_linux_arm64.tar.gz"
      sha256 "9394cda1766d1d83512a70ce5475d4857ed538c36f73d9763249dc7a04d786de"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.3.5/portmap_1.3.5_linux_amd64.tar.gz"
      sha256 "aa288cb74c5c220e38dc2b407a33e68f507be6a2c557542d060a8745dcf6cb72"
    end
  end

  def install
    bin.install "portmap"
  end

  test do
    assert_match "portmap", shell_output("#{bin}/portmap -version 2>&1")
  end
end

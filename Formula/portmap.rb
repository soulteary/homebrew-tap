class Portmap < Formula
  desc "General-purpose TCP/UDP port forwarding tool written in Go"
  homepage "https://github.com/soulteary/portmap"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.1.0/portmap_1.1.0_darwin_arm64.tar.gz"
      sha256 "50345077deb30f696876f96a317c7abe6bf441426d7441315f0c6ae4ff39a522"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.1.0/portmap_1.1.0_darwin_amd64.tar.gz"
      sha256 "59797e0c46eb864e3f106bc3fd292e798246fdfe64bf59c9a9eb4b70e0dc6f89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.1.0/portmap_1.1.0_linux_arm64.tar.gz"
      sha256 "25def0c12087623ba65f4881ea231ab8bb33ca416231083ae61cb76683fad3d6"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.1.0/portmap_1.1.0_linux_amd64.tar.gz"
      sha256 "355eca4c36359a6b189247f5b7a63e04cff28e0097c0e305b830f95c511557c2"
    end
  end

  def install
    bin.install "portmap"
  end

  test do
    assert_match "portmap", shell_output("#{bin}/portmap -version 2>&1")
  end
end

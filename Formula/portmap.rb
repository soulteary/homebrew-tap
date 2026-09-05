class Portmap < Formula
  desc "General-purpose TCP/UDP port forwarding tool written in Go"
  homepage "https://github.com/soulteary/portmap"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.2.0/portmap_1.2.0_darwin_arm64.tar.gz"
      sha256 "5d2ba7df705334ae595c0e56bc9011c14120e75cd52e590275a1680314825ea9"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.2.0/portmap_1.2.0_darwin_amd64.tar.gz"
      sha256 "1df81d086e85ba59a4736dea8134fd9cfaee4af0873c4d9529599faf66a52efc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.2.0/portmap_1.2.0_linux_arm64.tar.gz"
      sha256 "11b36279901984e118686f055f76a2dd7ca201996c87f21dcf4ef12baa73d949"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.2.0/portmap_1.2.0_linux_amd64.tar.gz"
      sha256 "791cbb18557f2023d8c6195e38d1f08eaf3f42e5c9b8a5ac0cd8c0cfa444568e"
    end
  end

  def install
    bin.install "portmap"
  end

  test do
    assert_match "portmap", shell_output("#{bin}/portmap -version 2>&1")
  end
end

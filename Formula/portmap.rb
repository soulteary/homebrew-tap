class Portmap < Formula
  desc "General-purpose TCP/UDP port forwarding tool written in Go"
  homepage "https://github.com/soulteary/portmap"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.4.0/portmap_1.4.0_darwin_arm64.tar.gz"
      sha256 "5fd64e02d03375b26180de86fb3db9d5896c76a2f8c122cd3b98db08533583da"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.4.0/portmap_1.4.0_darwin_amd64.tar.gz"
      sha256 "eedd43360e3e4f2855d778aff76f9e9a544d86ca38646c3375a8a6a9e084e4c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.4.0/portmap_1.4.0_linux_arm64.tar.gz"
      sha256 "cb0db84b553a3096f8fbc6381d31399bf674a44e24fb53bfa51ff1f7915dc1cc"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.4.0/portmap_1.4.0_linux_amd64.tar.gz"
      sha256 "8c0ea0ff4ae6d31ec3d326552426da9d80a6a7a32f3c76b6e688b9175435c974"
    end
  end

  def install
    bin.install "portmap"
  end

  test do
    assert_match "portmap #{version}", shell_output("#{bin}/portmap -version 2>&1")
    assert_match "-upstream", shell_output("#{bin}/portmap forward -help 2>&1")
  end
end

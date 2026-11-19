class Portmap < Formula
  desc "General-purpose TCP/UDP port forwarding tool written in Go"
  homepage "https://github.com/soulteary/portmap"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.5.0/portmap_1.5.0_darwin_arm64.tar.gz"
      sha256 "2165127dfe9c5ef90848730406966fbc3d3bdc65cbc860bfbcad90e4dedd2871"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.5.0/portmap_1.5.0_darwin_amd64.tar.gz"
      sha256 "0f20067e6f3a8fa904ee2be5c3be1c480c701c4bd671e4e2e33872888875812a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/portmap/releases/download/v1.5.0/portmap_1.5.0_linux_arm64.tar.gz"
      sha256 "8a297e8edcfa11108957b0d6622a009824306e8c2c3b7f3f4c737d83c9b00dc8"
    else
      url "https://github.com/soulteary/portmap/releases/download/v1.5.0/portmap_1.5.0_linux_amd64.tar.gz"
      sha256 "a24064c182dcddec28eaf6a80f06431c4da88550f8597533df65dda963ad868d"
    end
  end

  def install
    bin.install "portmap"
  end

  test do
    assert_match "portmap #{version}", shell_output("#{bin}/portmap -version 2>&1")
    assert_match "-upstream", shell_output("#{bin}/portmap forward -help 2>&1")
    assert_match "-stats-endpoint", shell_output("#{bin}/portmap proxy -help 2>&1")
    assert_match "-journal", shell_output("#{bin}/portmap stats -help 2>&1")
  end
end

class Splitdns < Formula
  desc "Safe CLI for managing suffix-based Split DNS on macOS"
  homepage "https://github.com/soulteary/splitdns"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/splitdns/releases/download/v1.1.0/splitdns_1.1.0_darwin_arm64.tar.gz"
      sha256 "7f91fd2a3a5213b3754cbffaec4e00251f09908e65c6365ef5f77e107870de2c"
    else
      url "https://github.com/soulteary/splitdns/releases/download/v1.1.0/splitdns_1.1.0_darwin_amd64.tar.gz"
      sha256 "bc6737e495c15896bfa5c9046699eb745cea35fc580b70794da6fdcea16068bc"
    end
  end

  def install
    bin.install "splitdns"
  end

  test do
    assert_match "splitdns", shell_output("#{bin}/splitdns version 2>&1")
  end
end

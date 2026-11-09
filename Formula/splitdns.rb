class Splitdns < Formula
  desc "Safe CLI for managing suffix-based Split DNS on macOS"
  homepage "https://github.com/soulteary/splitdns"
  version "1.1.2"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/splitdns/releases/download/v1.1.2/splitdns_1.1.2_darwin_arm64.tar.gz"
      sha256 "c224ececd9883fa9c16f8c2b7448572198e2a023e2e34739ad1664be01ee519a"
    else
      url "https://github.com/soulteary/splitdns/releases/download/v1.1.2/splitdns_1.1.2_darwin_amd64.tar.gz"
      sha256 "ac5912ede8e39a33d4955112be65177b32269f882a6a30fb98d5ec482aa0c482"
    end
  end

  def install
    bin.install "splitdns"
  end

  test do
    assert_match "splitdns", shell_output("#{bin}/splitdns version 2>&1")
  end
end

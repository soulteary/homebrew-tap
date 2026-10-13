class Splitdns < Formula
  desc "Safe CLI for managing suffix-based Split DNS on macOS"
  homepage "https://github.com/soulteary/splitdns"
  version "1.1.1"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/splitdns/releases/download/v1.1.1/splitdns_1.1.1_darwin_arm64.tar.gz"
      sha256 "c233973d4829e86df841921793eea521683af89e9d8a59ca0cf133bb2036edcd"
    else
      url "https://github.com/soulteary/splitdns/releases/download/v1.1.1/splitdns_1.1.1_darwin_amd64.tar.gz"
      sha256 "db8e515121ccea47c2ac2baff6c52e2a75388afd7e7654cd1b4ada2bbd40b59e"
    end
  end

  def install
    bin.install "splitdns"
  end

  test do
    assert_match "splitdns", shell_output("#{bin}/splitdns version 2>&1")
  end
end

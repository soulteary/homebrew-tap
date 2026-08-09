class NginxFormatter < Formula
  desc "Small and easy-to-use Nginx configuration formatting tool (CLI & GUI)"
  homepage "https://github.com/soulteary/nginx-formatter"
  version "2.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.1.0/nginx-formatter_2.1.0_darwin_arm64.tar.gz"
      sha256 "64552d244b97b3e5d8b149686c10b1a2a465772306da9328ad83f6a76bfca8ca"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.1.0/nginx-formatter_2.1.0_darwin_amd64.tar.gz"
      sha256 "ebd84980604feb80f9cafa86c27f2415f34a3028721ff3f8f30ed08036f0ede3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.1.0/nginx-formatter_2.1.0_linux_arm64.tar.gz"
      sha256 "1805facbd4ee40e29e79e5e9c46a453e8fb09482f254c9dca450eeec05b4404d"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.1.0/nginx-formatter_2.1.0_linux_amd64.tar.gz"
      sha256 "a9722693d6ab13fa5f85e13e2c4496e4e68dc9ba1f0617a84c95904b1160819f"
    end
  end

  def install
    bin.install "nginx-formatter"
  end

  test do
    assert_match "nginx-formatter", shell_output("#{bin}/nginx-formatter -help 2>&1")
  end
end

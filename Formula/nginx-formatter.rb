class NginxFormatter < Formula
  desc "Small and easy-to-use Nginx configuration formatting tool (CLI & GUI)"
  homepage "https://github.com/soulteary/nginx-formatter"
  version "2.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.3.0/nginx-formatter_2.3.0_darwin_arm64.tar.gz"
      sha256 "33c77b08fe22ba5efa65e7bab411f4a9f1dd4402ee07f6e68501b27a99bdf554"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.3.0/nginx-formatter_2.3.0_darwin_amd64.tar.gz"
      sha256 "c5e4fbedb61c36fbbb3e222afab12aac3e99b88fe146e9b1e815436519051b24"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.3.0/nginx-formatter_2.3.0_linux_arm64.tar.gz"
      sha256 "73500dc998744b4198aa5a9a5213b9b1d6bee77feabde2557e9dd1f9723163c7"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.3.0/nginx-formatter_2.3.0_linux_amd64.tar.gz"
      sha256 "bb4cc47079432d4965e0b7106f6351a3a78b95122733665a66625576b216ece8"
    end
  end

  def install
    bin.install "nginx-formatter"
  end

  test do
    assert_match "nginx-formatter", shell_output("#{bin}/nginx-formatter -help 2>&1")
  end
end

class NginxFormatter < Formula
  desc "Small and easy-to-use Nginx configuration formatting tool (CLI & GUI)"
  homepage "https://github.com/soulteary/nginx-formatter"
  version "2.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.2.0/nginx-formatter_2.2.0_darwin_arm64.tar.gz"
      sha256 "a1b9693029659a004dd6f511ff4af7f89b87de568c708ed6c6436838f6452e54"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.2.0/nginx-formatter_2.2.0_darwin_amd64.tar.gz"
      sha256 "85192e158f08711450bb8515b95a2cfe93de774f4676f6b13b73fd76a5fd61bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.2.0/nginx-formatter_2.2.0_linux_arm64.tar.gz"
      sha256 "e154093f28eb45117e3e757f76de87a6ee0fdd5535d9ae43b8a2aab9c5bb703f"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.2.0/nginx-formatter_2.2.0_linux_amd64.tar.gz"
      sha256 "39dd3daf71a1a3ac36091f05211583c41cdb23a563915ea7e2e4188505d697a0"
    end
  end

  def install
    bin.install "nginx-formatter"
  end

  test do
    assert_match "nginx-formatter", shell_output("#{bin}/nginx-formatter -help 2>&1")
  end
end

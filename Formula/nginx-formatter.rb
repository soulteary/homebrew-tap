class NginxFormatter < Formula
  desc "Small and easy-to-use Nginx configuration formatting tool (CLI & GUI)"
  homepage "https://github.com/soulteary/nginx-formatter"
  version "2.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.0.0/nginx-formatter_2.0.0_darwin_arm64.tar.gz"
      sha256 "c077bedd6357f6277025cac2de6d99da795f45ec4eb7ea441d6a94c21a5eafb4"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.0.0/nginx-formatter_2.0.0_darwin_amd64.tar.gz"
      sha256 "37b95265282bf214098db5adc952fa0b3e31afc9c59426086f4a50b338025504"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.0.0/nginx-formatter_2.0.0_linux_arm64.tar.gz"
      sha256 "cc9034009b8e7a30866da6826459823bbe969884d1322de34898c58cfba4a93d"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.0.0/nginx-formatter_2.0.0_linux_amd64.tar.gz"
      sha256 "63a85b1a34cc5ce29f70cc1da3e4e072fbf95ef8df3bc566deee7e9b113fe51f"
    end
  end

  def install
    bin.install "nginx-formatter"
  end

  test do
    assert_match "nginx-formatter", shell_output("#{bin}/nginx-formatter -help 2>&1")
  end
end

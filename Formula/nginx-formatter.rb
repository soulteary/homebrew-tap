class NginxFormatter < Formula
  desc "Small and easy-to-use Nginx configuration formatting tool (CLI & GUI)"
  homepage "https://github.com/soulteary/nginx-formatter"
  version "2.6.2"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.6.2/nginx-formatter_2.6.2_darwin_arm64.tar.gz"
      sha256 "b943c1d2eb5538abff04bc7ac38f72ec2ea6a1f4205ff414896d0039eec7fbe5"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.6.2/nginx-formatter_2.6.2_darwin_amd64.tar.gz"
      sha256 "12683392bd519d7f0dd93b5f09df2de76b65ed8a2f096153b509c9e2d41ddb90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.6.2/nginx-formatter_2.6.2_linux_arm64.tar.gz"
      sha256 "3285c453252311fa738b4c434acf5d09ee5ec808a53719e3581aff85e8c76e3d"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.6.2/nginx-formatter_2.6.2_linux_amd64.tar.gz"
      sha256 "447973ea691ca747acf56f78d7b3f9c54327944333e4e35a06fc5571587d5063"
    end
  end

  def install
    bin.install "nginx-formatter"
  end

  test do
    assert_match "nginx-formatter", shell_output("#{bin}/nginx-formatter --help 2>&1")
  end
end

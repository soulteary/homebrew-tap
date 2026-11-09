class NginxFormatter < Formula
  desc "Small and easy-to-use Nginx configuration formatting tool (CLI & GUI)"
  homepage "https://github.com/soulteary/nginx-formatter"
  version "2.6.3"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.6.3/nginx-formatter_2.6.3_darwin_arm64.tar.gz"
      sha256 "9c4817c57e0c51a30f236201acf448428ecf220eb23f6b0a854c9a95b46104c9"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.6.3/nginx-formatter_2.6.3_darwin_amd64.tar.gz"
      sha256 "3538e8d1d9d0803ca7d5d306555a0dafac0f9562fb4670ea5bb5fc2ccaf22a1e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.6.3/nginx-formatter_2.6.3_linux_arm64.tar.gz"
      sha256 "fe6b7b4e24dda843163586420db135ebfe5d37f57b5df9c56a5dc40748dbff3d"
    else
      url "https://github.com/soulteary/nginx-formatter/releases/download/v2.6.3/nginx-formatter_2.6.3_linux_amd64.tar.gz"
      sha256 "dead22abe88c36c41f95937d1ae4f4c270de77473d3eb7dc15f9796844a38b27"
    end
  end

  def install
    bin.install "nginx-formatter"
  end

  test do
    assert_match "nginx-formatter", shell_output("#{bin}/nginx-formatter --help 2>&1")
  end
end

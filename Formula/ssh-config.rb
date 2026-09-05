class SshConfig < Formula
  desc "Manage SSH config with YAML/JSON round-trip support"
  homepage "https://github.com/soulteary/ssh-config"
  url "https://github.com/soulteary/ssh-config/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "37df5c517585679cb9692133e02ae95f4c0402d3d6504b96274d49e2f2e09cc4"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version} -X main.builtBy=homebrew"
    system "go", "build", *std_go_args(ldflags:), "."
  end

  test do
    assert_match "ssh-config", shell_output("#{bin}/ssh-config -help 2>&1")
  end
end

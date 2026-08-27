class SshConfig < Formula
  desc "Manage SSH config with YAML/JSON round-trip support"
  homepage "https://github.com/soulteary/ssh-config"
  url "https://github.com/soulteary/ssh-config/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "2ecc8caf146819c9b16e09a1f430050b98619f284b28acc3230be1d39488a5aa"
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

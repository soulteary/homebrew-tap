class SshConfig < Formula
  desc "Manage SSH config with YAML/JSON round-trip support"
  homepage "https://github.com/soulteary/ssh-config"
  url "https://github.com/soulteary/ssh-config/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "37df5c517585679cb9692133e02ae95f4c0402d3d6504b96274d49e2f2e09cc4"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    # Source tarball has no .git metadata; pin the v3.1.0 tag commit explicitly.
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=7b0e4be36478e8553d8a3cdc33de4be6852a3ae2
      -X main.date=#{time.iso8601}
      -X main.builtBy=homebrew
      -X main.treeState=clean
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match "ssh-config", shell_output("#{bin}/ssh-config -help 2>&1")
    output = shell_output("#{bin}/ssh-config --version")
    assert_match version.to_s, output
    assert_match "7b0e4be36478e8553d8a3cdc33de4be6852a3ae2", output
    assert_match "by homebrew", output
    assert_match "tree state clean", output
    refute_match(/commit none|built unknown|tree state unknown/, output)
  end
end

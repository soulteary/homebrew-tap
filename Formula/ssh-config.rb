class SshConfig < Formula
  desc "Manage SSH config with YAML/JSON round-trip support"
  homepage "https://github.com/soulteary/ssh-config"
  url "https://github.com/soulteary/ssh-config/archive/refs/tags/v3.2.0.tar.gz"
  sha256 "146dd8f95414f9b8c6c3b7fbb27f567ea899d32d9a56178e8e551b6b2b443572"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    # Source tarball has no .git metadata; pin the v3.2.0 tag commit explicitly.
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=8709142704efb9144056321e2cf4e0a0b4af5854
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
    assert_match "8709142704efb9144056321e2cf4e0a0b4af5854", output
    assert_match "by homebrew", output
    assert_match "tree state clean", output
    refute_match(/commit none|built unknown|tree state unknown/, output)
  end
end

class SshConfig < Formula
  desc "Manage SSH config with YAML/JSON round-trip support"
  homepage "https://github.com/soulteary/ssh-config"
  url "https://github.com/soulteary/ssh-config/archive/refs/tags/v3.2.1.tar.gz"
  sha256 "4376d4434ff0b8c6a7cb87d940e78bcfd28f6007d0358dee0faedaf2b982f8ae"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    # Source tarball has no .git metadata; pin the v3.2.1 tag commit explicitly.
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=7eb4d9a14c0b74948d4ab6a24462b45dfef3e658
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
    assert_match "7eb4d9a14c0b74948d4ab6a24462b45dfef3e658", output
    assert_match "by homebrew", output
    assert_match "tree state clean", output
    refute_match(/commit none|built unknown|tree state unknown/, output)
  end
end

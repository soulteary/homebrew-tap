class Starbridge < Formula
  desc "CLI and MCP tools for Parallels Desktop and Windows development"
  homepage "https://github.com/soulteary/starbridge"
  if Hardware::CPU.arm?
    url "https://github.com/soulteary/starbridge/releases/download/v0.1.0/starbridge_0.1.0_darwin_arm64.tar.gz"
    sha256 "5c70ca300c5f4f947697f72c0c7dad1d9b39bd5f36914ad55e6ff1618bb70f34"
  else
    url "https://github.com/soulteary/starbridge/releases/download/v0.1.0/starbridge_0.1.0_darwin_amd64.tar.gz"
    sha256 "be499c9747237d1ce3c0aaf4285524fdca32a20de808a4314a1f3b7671e5c3b8"
  end
  version "0.1.0"
  license "GPL-3.0-only"

  depends_on macos: :ventura

  def install
    libexec.install buildpath.children
    bin.install_symlink libexec/"starbridge"
  end

  def caveats
    <<~EOS
      The complete release, including Windows helpers, docs, examples and tests, is installed in:
        #{libexec}
      Windows helper source:
        #{libexec}/guest/windows
      Installation and usage guide:
        #{libexec}/docs/USAGE.md

      VM management requires a Parallels Desktop edition with CLI support.
      Windows guest actions also require Parallels Tools and the paired helper.
      Homebrew does not install Parallels, copy helpers into Windows or start VMs.

      bootstrap.install requires a physical absolute source_dir without symlinks.
      Use the Cellar helper path above; resolve any opt path with pwd -P first.
    EOS
  end

  test do
    require "json"
    require "open3"

    run = lambda do |*args|
      stdout, stderr, status = Open3.capture3((bin/"starbridge").to_s, *args)
      assert status.success?, stderr
      assert_empty stderr
      stdout
    end

    assert_equal "starbridge #{version}\n", run.call("--version")
    assert_match "Usage: starbridge", run.call("--help")

    missing_prlctl = testpath/"never-installed-prlctl"
    refute_path_exists missing_prlctl
    preview = JSON.parse(run.call("--prlctl", missing_prlctl.to_s, "--dry-run",
                                  "vm", "start", "starbridge-homebrew-fixture"))
    assert_equal true, preview["ok"]
    assert_equal true, preview.fetch("data")["dry_run"]
    assert_equal true, preview.fetch("data")["mutation"]
    assert_equal [missing_prlctl.to_s, "start", "starbridge-homebrew-fixture"], preview.fetch("data")["argv"]

    helpers = %w[
      desktop-bridge.ps1
      developer-bridge.ps1
      developer/files.ps1
      developer/screenshot.ps1
      developer/system.ps1
      developer/tasks.ps1
      developer/ui-actions.ps1
      developer/ui-query.ps1
      developer/visual-flow.ps1
      developer/workers/screenshot-capabilities-worker.ps1
      developer/workers/screenshot-core.ps1
      developer/workers/screenshot-native.ps1
      developer/workers/screenshot-wgc.cs
      developer/workers/screenshot-worker.ps1
      developer/workers/task-native.cs
      developer/workers/task-worker.ps1
      developer/workers/ui-action-core.ps1
      developer/workers/ui-action-worker.ps1
      developer/workers/ui-core.ps1
      developer/workers/ui-input-native.ps1
      developer/workers/ui-query-worker.ps1
      developer/workers/visual-core.ps1
      developer/workers/visual-worker.ps1
    ]
    helpers.each { |path| assert_predicate libexec/"guest/windows"/path, :file? }
    %w[docs examples tests/windows tests/fixtures].each { |path| assert_predicate libexec/path, :directory? }
    %w[README.md LICENSE THIRD_PARTY_NOTICES.md BUILD.txt INSTALL.txt go.mod guest/windows/README.md
       docs/USAGE.md examples/codex-mcp.toml tests/windows/run-developer-contracts.ps1
       tests/fixtures/parameters.json].each { |path| assert_predicate libexec/path, :file? }
  end
end

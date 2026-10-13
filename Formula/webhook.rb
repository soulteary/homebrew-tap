class Webhook < Formula
  desc "Hardened and observable webhook-to-command runner"
  homepage "https://github.com/soulteary/webhook"
  url "https://github.com/soulteary/webhook/archive/refs/tags/7.3.2.tar.gz"
  sha256 "2acd01096e3bca548b06b273dcce8721f42d92c8604934b9c5a46ba7f3fb3dbc"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/soulteary/webhook/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/webhook -version")
  end
end

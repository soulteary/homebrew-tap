class Webhook < Formula
  desc "Hardened and observable webhook-to-command runner"
  homepage "https://github.com/soulteary/webhook"
  url "https://github.com/soulteary/webhook/archive/refs/tags/7.1.0.tar.gz"
  sha256 "8c438f7894a9111a919fec642ecd37c89266f23e8366fa62ef0d9efc64569f47"
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

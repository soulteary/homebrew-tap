class Webhook < Formula
  desc "Hardened and observable webhook-to-command runner"
  homepage "https://github.com/soulteary/webhook"
  url "https://github.com/soulteary/webhook/archive/refs/tags/7.4.0.tar.gz"
  sha256 "64395f573de836e6b0d7b0ad186e0103c91d1e8679f5574ad3689858c1a089ed"
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

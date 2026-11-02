class Webhook < Formula
  desc "Hardened and observable webhook-to-command runner"
  homepage "https://github.com/soulteary/webhook"
  url "https://github.com/soulteary/webhook/archive/refs/tags/7.3.4.tar.gz"
  sha256 "d5e9b1471b6541e78ac6af9330a90eed64913ecadbb642946d2172ccfd602d33"
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

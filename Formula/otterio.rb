class Otterio < Formula
  desc "S3-compatible object storage server"
  homepage "https://github.com/soulteary/otterio"
  version "2026-06-07T11-32-46Z"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-darwin-arm64",
          using: :nounzip
      sha256 "cd800402dd54839009eafe1660840209cf3e431815633c63b2e99e81fe025c2f"
    else
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-darwin-amd64",
          using: :nounzip
      sha256 "922871ceed3984132e8fca083ab210d2196b4f37119bad1033fd7775d6a7efca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-linux-arm64",
          using: :nounzip
      sha256 "2a1fc60d991b9a538425dbb63370dde07971e28df32b427a16013cca73b0e813"
    elsif Hardware::CPU.ppc64le?
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-linux-ppc64le",
          using: :nounzip
      sha256 "4d08687f5fd71e81059c4b8f3fff655c175aee41f31174caf1953b9d543dc729"
    else
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-linux-amd64",
          using: :nounzip
      sha256 "7bdc7a1bde5b638b47a40220a06cf7975bd4a8e5cbfa486ae088a614cfe7082e"
    end
  end

  def install
    bin.install cached_download => "otterio"
    (bin/"otterio").chmod 0755
  end

  test do
    assert_match "otterio", shell_output("#{bin}/otterio --help 2>&1")
  end
end
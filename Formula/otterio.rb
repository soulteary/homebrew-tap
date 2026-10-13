class Otterio < Formula
  desc "S3-compatible object storage server"
  homepage "https://github.com/soulteary/otterio"
  version "2026-10-10T16-38-05Z"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-darwin-arm64",
          using: :nounzip
      sha256 "48b673ad0e03723eeeedb2ab5773569093b426d8fa04e132d17183ac7afb6f9c"
    else
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-darwin-amd64",
          using: :nounzip
      sha256 "49acc47974c61aff7f5fb023e4986b45b5eefbdcc77ffc02c6cbc338b859dc42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-linux-arm64",
          using: :nounzip
      sha256 "9adb375f03a3faf2a8eee3bdb9342724b710217cedeb265acc7cc5e2d16aa54b"
    elsif Hardware::CPU.ppc64le?
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-linux-ppc64le",
          using: :nounzip
      sha256 "e447bb161be980263a6949b163b4d736506147ec9951bbb84c89110c672cdaa2"
    else
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-linux-amd64",
          using: :nounzip
      sha256 "bcb20daffca3a3c0dc0b78728a98788fd5f0a53551f1b60671aecdae8a3ef1e4"
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

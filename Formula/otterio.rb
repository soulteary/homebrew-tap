class Otterio < Formula
  desc "S3-compatible object storage server"
  homepage "https://github.com/soulteary/otterio"
  version "2026-10-28T07-52-43Z"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura

    if Hardware::CPU.arm?
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-darwin-arm64",
          using: :nounzip
      sha256 "cb22346766c479a7427839a7307f050df834af71809e92167c3f97cb6182e450"
    else
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-darwin-amd64",
          using: :nounzip
      sha256 "8a4f8ed66e156bb338d4ff8584d13487fa21c620fc5334d75c337b5030221833"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-linux-arm64",
          using: :nounzip
      sha256 "771c9eb9ec089ca4469242bcac053d5e138a8653e4e849aa51cfd77280b860c8"
    elsif Hardware::CPU.ppc64le?
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-linux-ppc64le",
          using: :nounzip
      sha256 "345ebf2345f19250e66515dc88d8d262254e56aae3d8eb8cdb31079fbb332771"
    else
      url "https://github.com/soulteary/otterio/releases/download/RELEASE.#{version}/otterio-linux-amd64",
          using: :nounzip
      sha256 "4fd0cb2983a1b464dc380d6e97803d58fde235cace09e827951d950d5159bf05"
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

class SshConfig < Formula
  desc "Manage SSH config with YAML/JSON round-trip support"
  homepage "https://github.com/soulteary/ssh-config"
  version "2.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/ssh-config/releases/download/v2.0.0/ssh-config_Darwin_arm64.tar.gz"
      sha256 "1b086f8c551761a085be15f35b54c62c6a74571e5fd73c015f0a871a252b4319"
    else
      url "https://github.com/soulteary/ssh-config/releases/download/v2.0.0/ssh-config_Darwin_x86_64.tar.gz"
      sha256 "e5972713c1d88b3a47feee5f6a7a2c71e6f4216e45236dc7909044566b844bb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soulteary/ssh-config/releases/download/v2.0.0/ssh-config_Linux_arm64.tar.gz"
      sha256 "8f9bfa3204c903e480d96e8c86c0b47259af051a941c13cb79a31af4faaa63b2"
    else
      url "https://github.com/soulteary/ssh-config/releases/download/v2.0.0/ssh-config_Linux_x86_64.tar.gz"
      sha256 "62277ba988a89feab29fc519596e1f875c63dcf1ad12a08a5cd6d5f44aa5514e"
    end
  end

  def install
    bin.install "ssh-config"
  end

  test do
    assert_match "ssh-config", shell_output("#{bin}/ssh-config -help 2>&1")
  end
end

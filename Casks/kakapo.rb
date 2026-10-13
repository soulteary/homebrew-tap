cask "kakapo" do
  version "2026.10.11"
  sha256 "41696a0a93d9793c67b3c3b6a81b0790604f03cc9da468602254a2113bff6ed2"

  url "https://github.com/soulteary/kakapo/releases/download/v#{version}/kakapo-v#{version}-macos-universal.app.zip"
  name "Kakapo"
  desc "Smart cross-language desktop translator with multi-provider parallel comparison"
  homepage "https://github.com/soulteary/kakapo"

  depends_on macos: :ventura

  app "kakapo.app"

  zap trash: "~/Library/Application Support/Kakapo"
end

cask "kakapo" do
  version "2026.08.09"
  sha256 "c827adc131e6f129cd711ff0f78fa7d5bb7343544992a8db3701863e60099e8f"

  url "https://github.com/soulteary/kakapo/releases/download/v#{version}/kakapo-v#{version}-macos-universal.app.zip"
  name "Kakapo"
  desc "Smart cross-language desktop translator with multi-provider parallel comparison"
  homepage "https://github.com/soulteary/kakapo"

  depends_on macos: :big_sur

  app "kakapo.app"

  zap trash: [
    "~/Library/Application Support/Kakapo",
  ]
end

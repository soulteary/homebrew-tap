cask "kakapo" do
  version "2026.11.02"
  sha256 "9a52fcfb6d4fd64ceb67b3c3a9a18b4b5f26925773d661a26fbaf6b76b05b2c9"

  url "https://github.com/soulteary/kakapo/releases/download/v#{version}/kakapo-v#{version}-macos-universal.app.zip"
  name "Kakapo"
  desc "Smart cross-language desktop translator with multi-provider parallel comparison"
  homepage "https://github.com/soulteary/kakapo"

  depends_on macos: :ventura

  app "kakapo.app"

  zap trash: "~/Library/Application Support/Kakapo"
end

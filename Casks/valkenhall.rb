cask "valkenhall" do
  version "0.15.2"
  sha256 "a3ad4906c4277768c057baef8f5f240dc62862c99edc78e5c6d71a732fd279bf"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.15.2-arm64.dmg"
  name "Valkenhall"
  desc "Desktop card game arena for Sorcery TCG"
  homepage "https://valkenhall.com"

  deprecate! date: "2026-04-27", because: "Valkenhall is no longer distributed via Homebrew. Download the signed and notarized DMG directly from https://valkenhall.com — the in-app auto-updater will then keep you on the latest version. This Homebrew tap will be removed on 2026-06-22."

  depends_on arch: :arm64

  app "Valkenhall.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Valkenhall.app"]
  end

  uninstall quit: "com.valkenhall.app"

  zap trash: [
    "~/Library/Application Support/com.valkenhall.app",
    "~/Library/Caches/com.valkenhall.app",
    "~/Library/Preferences/com.valkenhall.app.plist",
  ]
end

cask "valkenhall" do
  version "0.11.2"
  sha256 "7596da0a3c65022e3867fc768bd5d4f7713cee2adc1a5755c7200256dff54822"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.11.2-arm64.dmg"
  name "Valkenhall"
  desc "Desktop card game arena for Sorcery TCG"
  homepage "https://github.com/ByteMirror/valkenhall"

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

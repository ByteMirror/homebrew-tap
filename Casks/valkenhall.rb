cask "valkenhall" do
  version "0.11.1"
  sha256 "850884849b4a0d96698aef67ab071e1d8af70602962449ce0f67f61f7e780faf"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.11.1-arm64.dmg"
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

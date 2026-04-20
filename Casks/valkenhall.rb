cask "valkenhall" do
  version "0.13.0"
  sha256 "15adb4566e89a49725bcc9f5fcc135f3011ac07511c6969c363a554ba2c3ac4c"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.13.0-arm64.dmg"
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

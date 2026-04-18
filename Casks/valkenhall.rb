cask "valkenhall" do
  version "0.11.0"
  sha256 "3877c10df1025053b49692b7f5e3737996a488e4aa761e010b17e12e61e42752"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.11.0-arm64.dmg"
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

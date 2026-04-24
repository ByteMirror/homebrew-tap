cask "valkenhall" do
  version "0.14.0"
  sha256 "baac888145c7a30bd916d10ff1160d22d3648ffedd9cb9ec498bbf3ceb688907"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.14.0-arm64.dmg"
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

cask "valkenhall" do
  version "0.11.3"
  sha256 "08be3787ef1936387ea13928e7018599ba9beaa401ce7558e8552035663525a1"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.11.3-arm64.dmg"
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

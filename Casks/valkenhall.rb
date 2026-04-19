cask "valkenhall" do
  version "0.12.0"
  sha256 "d23855b8cae495caefac04e6a56992d90f6f29c35b52c70c8fcc3c2e4a8c9876"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.12.0-arm64.dmg"
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

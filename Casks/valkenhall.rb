cask "valkenhall" do
  version "0.8.0"
  sha256 "038b5fe511d6aef53dbd32fa3dde66cb9643657832e19b5d488716fa71d83f92"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/stable-macos-arm64-Valkenhall.dmg"
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

cask "valkenhall" do
  version "0.9.1"
  sha256 "c57e336eedd81e7bba2bf6a6d4d90e75fc128010f8dff79be6ca1f5eda49dde4"

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

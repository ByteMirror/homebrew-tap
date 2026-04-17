cask "valkenhall" do
  version "0.10.6-rc1"
  sha256 "6b125ab8c0b13bf3bb9f10d9bac7f93e430d6480253d910ba75d83fc99fd2931"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.10.6-rc1-arm64.dmg"
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

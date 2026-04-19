cask "valkenhall" do
  version "0.12.1"
  sha256 "76c327a35f68f0c78636c4f3fe65150120596fc108a4dc4b163e6645f90b8e96"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.12.1-arm64.dmg"
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

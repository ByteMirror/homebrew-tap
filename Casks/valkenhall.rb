cask "valkenhall" do
  version "0.13.1"
  sha256 "5d70459524e8b960995f223a66a70f640072bed43624b82bfa0d554edb7b6e08"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.13.1-arm64.dmg"
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

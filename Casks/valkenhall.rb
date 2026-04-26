cask "valkenhall" do
  version "0.15.0"
  sha256 "4f9b051c5260edf46871292d5967c990d0a8b7962fb0e8ba0e6dc4b46830151b"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.15.0-arm64.dmg"
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

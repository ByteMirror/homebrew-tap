cask "valkenhall" do
  version "0.11.4"
  sha256 "ccf91b52c84f657d61f8747bda1121897a9571326332942eec5414b5aacd17b4"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/Valkenhall-0.11.4-arm64.dmg"
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

cask "valkenhall" do
  version "0.3.0"
  sha256 "6030896d7c17469ebaf352bf52e9b7319895ac7c4b32f45498ec0b0797da688e"

  url "https://github.com/ByteMirror/valkenhall/releases/download/v#{version}/stable-macos-arm64-valkenhall.dmg"
  name "Valkenhall"
  desc "Desktop card game arena for Sorcery TCG"
  homepage "https://github.com/ByteMirror/valkenhall"

  depends_on arch: :arm64

  app "valkenhall.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/valkenhall.app"]
  end

  uninstall quit: "dev.fabianurbanek.valkenhall"

  zap trash: [
    "~/Library/Application Support/valkenhall",
    "~/Library/Caches/valkenhall",
    "~/Library/Preferences/dev.fabianurbanek.valkenhall.plist",
  ]
end

cask "valkenhall" do
  version "0.3.8"
  sha256 "0350972400c2362aea4de94c56f4c5c5bff147fe3e54a87bbe79fdac1218843f"

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

  uninstall quit: "dev.fabianurbanek.valkenhall"

  zap trash: [
    "~/Library/Application Support/dev.fabianurbanek.valkenhall",
    "~/Library/Caches/dev.fabianurbanek.valkenhall",
    "~/Library/Preferences/dev.fabianurbanek.valkenhall.plist",
  ]
end

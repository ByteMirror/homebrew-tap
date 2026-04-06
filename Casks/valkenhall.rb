cask "valkenhall" do
  version "0.3.1"
  sha256 "176fb49d00ae4e52d243707d80e7c5df10026bce6227e50b90db06e8d66fd19b"

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

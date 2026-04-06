cask "valkenhall" do
  version "0.3.20"
  sha256 "cdd669e54abeaf0b3224fd6e7265e0bb5df2378fd94a1c77af32ada02cda82b2"

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

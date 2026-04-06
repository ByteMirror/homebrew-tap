cask "valkenhall" do
  version "0.3.13"
  sha256 "02ce1e821a633fe82c77bfaddd23978a95975ee159da49b54856f1b88f425e60"

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

cask "logoer" do
  version "0.4.0"
  sha256 "0a2e358a0a4fda55942514b9f250c6362978bc9e8d6624c63375dd6f52e4a999"

  url "https://github.com/loprx/Logoer/releases/download/#{version}/Logoer-v#{version}-macos-arm64.zip"
  name "Logoer"
  desc "Replace the Apple logo in the menu bar with a custom image"
  homepage "https://github.com/loprx/Logoer"

  depends_on arch: :arm64
  depends_on :macos

  app "Logoer.app"

  # The bundle is ad-hoc signed and not notarized, so Gatekeeper rejects the
  # quarantined copy. Logoer is an LSUIElement menu-bar app: when Gatekeeper
  # blocks it there is no Dock icon and no window to explain why, and `open`
  # fails with error -128 without showing a dialog. Dropping the quarantine
  # flag keeps the install usable (Homebrew 7 no longer has `quarantine false`
  # or `--no-quarantine`).
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Logoer.app"]
  end

  zap trash: [
    "~/Library/Containers/com.lihaoyun6.Logoer",
    "~/Library/Preferences/com.lihaoyun6.Logoer.plist",
  ]

  caveats <<~EOS
    Logoer is ad hoc signed and has not been notarized by Apple. The install
    removes the quarantine flag so it can launch; if you later re-download the
    zip by hand, clear it yourself with:
      xattr -dr com.apple.quarantine /Applications/Logoer.app

    Auto-Mask (turned on automatically for non-Apple logo styles) needs the
    Screen Recording permission to read the menu bar colour.
  EOS
end

cask "logoer" do
  version "0.3.0"
  sha256 "8b4fe35592b7f19b65d476d386c1ec522fee0f86305cee73af8f4b1e98c7386d"

  url "https://github.com/loprx/Logoer/releases/download/#{version}/Logoer-v#{version}-macos-arm64.zip"
  name "Logoer"
  desc "Replace the Apple logo in the macOS menu bar with a custom image"
  homepage "https://github.com/loprx/Logoer"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Logoer.app"

  zap trash: [
    "~/Library/Containers/com.lihaoyun6.Logoer",
    "~/Library/Preferences/com.lihaoyun6.Logoer.plist",
  ]

  caveats <<~EOS
    Logoer is ad hoc signed and has not been notarized by Apple.
    If macOS blocks its first launch and you trust this build, open
    System Settings > Privacy & Security and choose Open Anyway for Logoer.
    See https://support.apple.com/102445

    Auto-Mask (turned on automatically for non-Apple logo styles) needs the
    Screen Recording permission to read the menu bar colour.
  EOS
end

cask "discmate" do
  version "0.3.10"
  sha256 "58ef8e9950b6b868a3cfa608105627a02b4d356bd8ef6aeb636b24b78d76cc33"

  url "https://github.com/loprx/discmate/releases/download/v#{version}/DiscMate-v#{version}-macos-arm64.zip"
  name "DiscMate"
  desc "Optical disc burning utility with incremental data append"
  homepage "https://github.com/loprx/discmate"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "DiscMate.app"

  caveats <<~EOS
    DiscMate is ad hoc signed and has not been notarized by Apple.
    If macOS blocks its first launch and you trust this build, open
    System Settings > Privacy & Security and choose Open Anyway for DiscMate.
    See https://support.apple.com/102445
  EOS
end

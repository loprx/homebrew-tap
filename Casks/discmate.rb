cask "discmate" do
  version "0.3.3"
  sha256 "24edaceaa588c2e2031f3c2ae4cdbf6704a8b0f69ccd4146316d31c61fbaad74"

  url "https://github.com/loprx/discmate/releases/download/v#{version}/DiscMate-v#{version}-macos-arm64.zip"
  name "DiscMate"
  desc "Optical disc burning utility with incremental data append"
  homepage "https://github.com/loprx/discmate"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "DiscMate.app"

  caveats <<~EOS
    DiscMate is ad hoc signed and has not been notarized by Apple.
    If macOS blocks its first launch and you trust this build, open
    System Settings > Privacy & Security and choose Open Anyway for DiscMate.
    See https://support.apple.com/102445
  EOS
end

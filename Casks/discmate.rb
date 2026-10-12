cask "discmate" do
  version "0.3.0"
  sha256 "9a598f162563867f7781ad0e58d082d11e4a46a4c2dd479d210d3c2445fe24b7"

  url "https://github.com/loprx/discmate/releases/download/v#{version}/DiscMate-v#{version}-macos-arm64.zip"
  name "DiscMate"
  desc "Optical disc burning utility with incremental data append"
  homepage "https://github.com/loprx/discmate"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "DiscMate.app"
end

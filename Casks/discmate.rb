cask "discmate" do
  version "0.3.11"
  sha256 "5bbdd2749eb40452fbada01262f31c9471cb870e5617ae9eb6c05c13dcb7cfbf"

  url "https://github.com/loprx/discmate/releases/download/v#{version}/DiscMate-v#{version}-macos-arm64.zip"
  name "DiscMate"
  desc "Optical disc burning utility with incremental data append"
  homepage "https://github.com/loprx/discmate"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "DiscMate.app"

  # The bundle is ad-hoc signed and not notarized, so Gatekeeper rejects the
  # quarantined copy on first launch. Drop the flag during install so the app
  # opens straight away (Homebrew 7 removed both `quarantine false` and
  # `--no-quarantine`). This only clears the attribute on the installed bundle;
  # it does not change Gatekeeper or any other system security setting.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DiscMate.app"]
  end

  caveats <<~EOS
    DiscMate is ad hoc signed and has not been notarized by Apple. The install
    clears the quarantine flag so it can launch; if you later download the ZIP
    by hand, clear it yourself with:
      xattr -dr com.apple.quarantine /Applications/DiscMate.app

    The latest-session read-only mount helper asks for an administrator
    password each time it is used.
  EOS
end

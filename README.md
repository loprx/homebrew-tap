# loprx/homebrew-tap

Homebrew tap for [eureka-cli](https://github.com/loprx/eureka-cli), [DiscMate](https://github.com/loprx/discmate) and [Logoer](https://github.com/loprx/Logoer).

| Package | Install | Update |
| --- | --- | --- |
| eureka-cli | `brew install loprx/tap/eureka-cli` | `brew upgrade loprx/tap/eureka-cli` |
| DiscMate (Apple Silicon, macOS 13+) | `brew install --cask loprx/tap/discmate` | `brew upgrade --cask loprx/tap/discmate` |
| Logoer (Apple Silicon, macOS 11+) | `brew install --cask loprx/tap/logoer` | `brew upgrade --cask loprx/tap/logoer` |

Run `brew update` before upgrading to fetch the latest cask. Using a fully qualified name (`loprx/tap/discmate`, `loprx/tap/logoer`) trusts that cask without trusting every item in this tap; see [Homebrew Tap Trust](https://docs.brew.sh/Tap-Trust).

DiscMate is an experimental ad hoc signed app. macOS may block its first launch because it is not notarized. If you trust the downloaded build, follow [Apple's Open Anyway steps](https://support.apple.com/102445) in System Settings → Privacy & Security. The cask does not remove quarantine or disable Gatekeeper. See the [DiscMate README](https://github.com/loprx/discmate#readme) for the verified media workflow and limitations.

Logoer is an ad hoc signed menu bar app and is not notarized either. Because it has no Dock icon and no menu bar item, a Gatekeeper block fails silently with no dialog to click, so its cask clears the quarantine flag on install. It is arm64-only.

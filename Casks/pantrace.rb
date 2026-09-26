cask "pantrace" do
  version "1.0.11"
  sha256 "b079bf9f986f55e74ae66f1794422ad578139307e6b47a21116b2b8be7235088"

  url "https://github.com/PanterSoft/Pantrace/releases/download/v#{version}/Pantrace-macos.dmg"
  name "Pantrace"
  desc "CAN bus tracer with DBC decoding"
  homepage "https://github.com/PanterSoft/Pantrace"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Pantrace.app"

  zap trash: [
    "~/Library/Preferences/dev.pantrace.pantrace.plist",
    "~/Library/Saved Application State/dev.pantrace.pantrace.savedState",
  ]

  # The build is ad-hoc signed, so Gatekeeper quarantines it on first launch.
  caveats <<~EOS
    Pantrace is not notarised. If macOS refuses to open it:
      xattr -dr com.apple.quarantine "/Applications/Pantrace.app"
  EOS
end

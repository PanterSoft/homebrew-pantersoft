cask "pantrace" do
  version "1.0.6"
  sha256 "a2c06e99d546f5c80ac0385298a0224acb86c81cc8170b0ffdc25a6b7c3c8795"

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

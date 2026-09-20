cask "pantrace" do
  version "1.0.7"
  sha256 "9bf4acd82d1dc74f9a12acc5678c7efac01c1c74c76c97967dd45b4880085093"

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

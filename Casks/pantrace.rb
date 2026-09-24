cask "pantrace" do
  version "1.0.8"
  sha256 "3d3aba7c886c1ec09e31166e5cbf988c84a95e577d30cd6449fc67e0fd7b619b"

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

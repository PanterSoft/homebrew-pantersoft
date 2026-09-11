cask "cantracer" do
  version "1.0.5"
  sha256 "57b071ed44a380c0b45141479831cc131267827cf9e2ba166931895afac017b9"

  url "https://github.com/PanterSoft/CANtracer/releases/download/v#{version}/CANtracer-macos.dmg"
  name "CANtracer"
  desc "CAN bus tracer with DBC decoding"
  homepage "https://github.com/PanterSoft/CANtracer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "CANtracer.app"

  zap trash: [
    "~/Library/Preferences/dev.cantracer.cantracer.plist",
    "~/Library/Saved Application State/dev.cantracer.cantracer.savedState",
  ]

  # The build is ad-hoc signed, so Gatekeeper quarantines it on first launch.
  caveats <<~EOS
    CANtracer is not notarised. If macOS refuses to open it:
      xattr -dr com.apple.quarantine "/Applications/CANtracer.app"
  EOS
end

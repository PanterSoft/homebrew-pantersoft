cask "cantracer" do
  version "1.0.4"
  sha256 "d84e4850d4d405f083257c109dedcd8840688014f8040c2eba4a59f36030cdf6"

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

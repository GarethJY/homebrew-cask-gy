cask "cloudflare-warp" do
  version "2024.12.554.0"
  sha256 "1cc6d8a35452216165000266e13a03ac893dfc6b13302ea226fea6357c907a6d"

  url "https://1111-releases.cloudflareclient.com/mac/Cloudflare_WARP_#{version}.pkg",
      verified: "1111-releases.cloudflareclient.com/mac/"
  name "Cloudflare WARP"
  desc "Free app that makes your Internet safer"
  homepage "https://cloudflarewarp.com/"

  livecheck do
    # :sparkle strategy using appcenter url cannot be used - see below link
    # https://github.com/Homebrew/homebrew-cask/pull/109118#issuecomment-887184248
    url "https://1111-releases.cloudflareclient.com/mac/latest"
    regex(/Cloudflare[._-]WARP[._-]v?(\d+(?:\.\d+)+)\.pkg/i)
    strategy :header_match
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  pkg "Cloudflare_WARP_#{version}.pkg"

  uninstall launchctl: [
              "com.cloudflare.1dot1dot1dot1.macos.loginlauncherapp",
              "com.cloudflare.1dot1dot1dot1.macos.warp.daemon",
            ],
            quit:      "com.cloudflare.1dot1dot1dot1.macos",
            pkgutil:   "com.cloudflare.1dot1dot1dot1.macos"

  zap trash: [
    "/Library/LaunchDaemons/com.cloudflare.1dot1dot1dot1.macos.warp.daemon.plist",
    "~/Library/Application Scripts/com.cloudflare.1dot1dot1dot1.macos.loginlauncherapp",
    "~/Library/Application Support/com.cloudflare.1dot1dot1dot1.macos",
    "~/Library/Caches/com.cloudflare.1dot1dot1dot1.macos",
    "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.cloudflare.1dot1dot1dot1.macos",
    "~/Library/Containers/com.cloudflare.1dot1dot1dot1.macos.loginlauncherapp",
    "~/Library/HTTPStorages/com.cloudflare.1dot1dot1dot1.macos",
    "~/Library/HTTPStorages/com.cloudflare.1dot1dot1dot1.macos.binarycookies",
    "~/Library/Preferences/com.cloudflare.1dot1dot1dot1.macos.plist",
    "~/Library/WebKit/com.cloudflare.1dot1dot1dot1.macos",
  ]
end

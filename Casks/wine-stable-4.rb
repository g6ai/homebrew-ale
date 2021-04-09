cask "wine-stable-4" do
  version "4.0.3"

  url "https://dl.winehq.org/wine-builds/macosx/pool/winehq-stable-#{version}.pkg"
  name "WineHQ-stable"
  desc "Compatibility layer to run Windows applications"
  homepage "https://wiki.winehq.org/MacOS"

  livecheck do
    url "https://dl.winehq.org/wine-builds/macosx/download.html"
    strategy :page_match
    regex(%r{href=.*?/winehq-stable-(\d+(?:\.\d+)*)\.pkg}i)
  end

  depends_on cask: "xquartz"

  app "Wine Stable.app", target: "Wine Stable 4.app"

  uninstall delete:  "/Applications/Wine Stable 4.app"

  caveats <<~EOS
    #{token} installs support for running 64 bit applications in Wine, which is considered experimental.
    If you do not want 64 bit support, you should download and install the #{token} package manually.
  EOS
end

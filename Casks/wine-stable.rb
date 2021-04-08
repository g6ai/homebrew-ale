cask "wine-stable-4" do
  version "4.0.3"
  sha256 "de2b23342edfa29a1518d8940992e855d30b3416084964311f184c9fdfb146a5"

  url "https://dl.winehq.org/wine-builds/macosx/pool/winehq-stable-#{version}.pkg"
  name "WineHQ-stable"
  desc "Compatibility layer to run Windows applications"
  homepage "https://wiki.winehq.org/MacOS"

  livecheck do
    url "https://dl.winehq.org/wine-builds/macosx/download.html"
    strategy :page_match
    regex(%r{href=.*?/winehq-stable-(\d+(?:\.\d+)*)\.pkg}i)
  end

  conflicts_with cask: [
    "wine-devel",
    "wine-staging",
  ]
  depends_on cask: "xquartz"

  pkg "winehq-stable-#{version}.pkg",
      choices: [
        {
          "choiceIdentifier" => "choice3",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 1,
        },
      ]

  app "Wine stable.app", target: "Wine stable 4.app"

  uninstall delete:  "/Applications/Wine stable 4.app"

  caveats <<~EOS
    #{token} installs support for running 64 bit applications in Wine, which is considered experimental.
    If you do not want 64 bit support, you should download and install the #{token} package manually.
  EOS
end
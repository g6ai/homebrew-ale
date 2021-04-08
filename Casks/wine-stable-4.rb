cask "wine-stable-4" do
  version "4.0.3"
  sha256 "6d5ed6db6f10ff8c3460e6cc7aa33cfaf80229013bb792577b5ddb32e8141f23"

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

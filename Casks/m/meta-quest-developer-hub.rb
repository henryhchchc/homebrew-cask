cask "meta-quest-developer-hub" do
  version "5.7.2,d0f420eae84e5e302b3a44637ebe5cc2"
  sha256 "95328846a2abf6341f81768a9eb15da2990e043af77759548acde01533922625"

  url "https://www.oculus.com/x2asset/electron-apps/odh/#{version.csv.second}/Meta%20Quest%20Developer%20Hub-#{version.csv.first}.zip"
  name "meta-quest-developer-hub"
  desc "VR development tool"
  homepage "https://developer.oculus.com/meta-quest-developer-hub/"

  livecheck do
    url "https://www.oculus.com/electron-updates/mqdh/latest-mac.yml"
    regex(%r{([^/]+)/Meta\s+Quest\s+Developer\s+Hub[._-]v?(\d+(?:\.\d+)+)\.zip}i)
    strategy :electron_builder do |item, regex|
      match = item["path"]&.match(regex)
      next if match.blank?

      "#{match[2]},#{match[1]}"
    end
  end

  depends_on macos: ">= :catalina"

  app "Meta Quest Developer Hub.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.oculus.odh.sfl*",
    "~/Library/Application Support/Meta Quest Developer Hub",
    "~/Library/Application Support/odh",
    "~/Library/Preferences/com.oculus.odh.plist",
    "~/Library/Saved Application State/com.oculus.odh.savedState",
  ]

  caveats do
    license "https://developer.oculus.com/licenses/oculussdk"
  end
end

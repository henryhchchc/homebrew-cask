cask "diskcatalogmaker" do
  version "8.6.0"
  sha256 "380a0bc4f1fca91157f1fcf9ca665b9665235a2704e547823d45e612ad39bbe7"

  url "https://download.diskcatalogmaker.com/download/zip/DiskCatalogMaker#{version.no_dots}.zip"
  name "DiskCatalogMaker"
  desc "Toast-bundled version of DiskCatalogMaker"
  homepage "https://diskcatalogmaker.com/"

  livecheck do
    url "https://download.diskcatalogmaker.com/zip/DiskCatalogMaker.zip"
    strategy :header_match do |headers|
      match = headers["location"].match(/DiskCatalogMaker(\d+)f?(\d+)\.zip/i)
      next if match.blank?

      "#{match[1].split("", 3).reject(&:empty?).join(".")}.#{match[2]}"
    end
  end

  depends_on macos: ">= :el_capitan"

  app "DiskCatalogMaker.app"

  zap trash: [
    "~/Library/Application Support/com.mac.fujisoft.DiskCatalogMaker",
    "~/Library/Application Support/DiskCatalogMaker",
    "~/Library/Caches/com.mac.fujisoft.DiskCatalogMaker",
    "~/Library/Caches/DiskCatalogMaker",
    "~/Library/Logs/DiskCatalogMaker",
    "~/Library/Preferences/com.mac.fujisoft.DiskCatalogMaker.plist",
    "~/Library/Saved Application State/com.mac.fujisoft.DiskCatalogMaker.savedState",
  ]
end

cask 'exist-db' do
  version '5.1.0'
  sha256 '10072ca152101d163a1bbd3860e5014c00d8600bfad5f6b4cf330089edbc8e24'

  # bintray.com/artifact/download/existdb was verified as official when first introduced to the cask
  url "https://bintray.com/artifact/download/existdb/releases/eXist-db-#{version}.dmg"
  appcast 'https://github.com/eXist-db/exist/releases.atom'
  name 'eXist-db'
  homepage 'https://exist-db.org/exist/apps/homepage/index.html'

  app 'eXist-db.app'

  zap trash: '~/Library/Application Support/org.exist'

  caveats do
    depends_on_java '8+'
  end
end

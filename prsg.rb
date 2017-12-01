class Prsg < Formula
  desc "Generate pseudo-random string of n characters."
  homepage "https://github.com/nickolasburr/homebrew-pfa"
  url "https://gist.githubusercontent.com/nickolasburr/a49073af159254f784c17673619b99c0/raw/15c1a5b7483495d23b38b81dea538dae7513839f/prsg"
  sha256 "d7b9582b3d2878b9094ca79745ba7020119955cb68d6c6f1f29bf285b6370668"
  version "1.0.0"

  def install
    bin.install "prsg"
  end

  test do
    system "prsg", "15"
  end
end

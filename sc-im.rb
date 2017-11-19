class ScIm < Formula
  desc "SC-IM - Spreadsheet Calculator Improvised -- An ncurses spreadsheet program for terminal"
  homepage "https://github.com/andmarti1424/sc-im"
  url "https://github.com/andmarti1424/sc-im/archive/v0.6.0.tar.gz"
  sha256 "5da644d380ab3752de283b83cce18c3ba12b068d0762c44193c34367a0dcbc38"
  version "0.6.0"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 "44648a2715d0a3709c66d2c2f520c9077f410fe33ccf89f66ae10503ae7ebe14" => :high_sierra
    sha256 "44648a2715d0a3709c66d2c2f520c9077f410fe33ccf89f66ae10503ae7ebe14" => :sierra
    sha256 "44648a2715d0a3709c66d2c2f520c9077f410fe33ccf89f66ae10503ae7ebe14" => :el_capitan
    sha256 "44648a2715d0a3709c66d2c2f520c9077f410fe33ccf89f66ae10503ae7ebe14" => :yosemite
  end

  depends_on "ncurses"

  def install
    system "mkdir bin"

    Dir.chdir("src")
    system "make && cp scim ../bin/scim"
    system "gzip -c sc-im.1 > scim.1.gz"

    bin.install "scim"
    man1.install "scim.1.gz"
  end

  test do
    system "scim", "--help"
  end
end

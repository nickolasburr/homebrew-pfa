class Keuka < Formula
  desc "SSL/TLS handshake analysis utility"
  homepage "https://github.com/nickolasburr/keuka"
  url "https://github.com/nickolasburr/keuka/archive/1.0.3.tar.gz"
  sha256 "e6bdcd5c31128901849a2fe2d0a3404829ce44a0ada369b555da811d0b183446"
  revision 1

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 high_sierra: "49e63b13d4f7820ebac695f484f233932b4c53034de20256e033785aed92bd6d"
    sha256 sierra:      "553d595c8872e6cadf0bc327760cc5bf969191da835e531a09f99289dbfe0ba5"
    sha256 el_capitan:  "a1240a1cd1b6e5cc9778d9cb110e002e2aff2f7fca885cdd78e812ac688f1502"
    sha256 yosemite:    "7ba8ff2b66667d9318d26290e4bafa857d795f8a86ca46bd6ea6e8eacf708910"
  end

  depends_on "openssl" => :required

  def install
    system "make"

    bin.install "keuka"
    man1.install "man/keuka.1.gz"
  end

  test do
    system "keuka", "www.openssl.org"
  end
end

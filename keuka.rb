class Keuka < Formula
  desc "SSL/TLS handshake analysis utility"
  homepage "https://github.com/nickolasburr/keuka"
  url "https://github.com/nickolasburr/keuka/archive/1.0.3.tar.gz"
  sha256 "776d1807d38167e0de95ba5d2bc8f4785c772c56d1dca7d1d0d5c5bf59aeb772"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 "53d33c2158720a39dedaed8e92811b8b2340046ade0658065d8d8d04e4b8382e" => :high_sierra
    sha256 "53d33c2158720a39dedaed8e92811b8b2340046ade0658065d8d8d04e4b8382e" => :sierra
    sha256 "53d33c2158720a39dedaed8e92811b8b2340046ade0658065d8d8d04e4b8382e" => :el_capitan
    sha256 "53d33c2158720a39dedaed8e92811b8b2340046ade0658065d8d8d04e4b8382e" => :yosemite
  end

  depends_on "openssl" => :required

  def install
    system "make"

    bin.install "keuka"
    man1.install "man/keuka.1.gz"
  end

  test do
    system "keuka www.openssl.org"
  end
end

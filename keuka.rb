class Keuka < Formula
  desc "SSL/TLS handshake analysis utility"
  homepage "https://github.com/nickolasburr/keuka"
  url "https://github.com/nickolasburr/keuka/archive/1.0.2.tar.gz"
  sha256 "32deb4cd860765d4ea036689eaba36ca8b130e9fd5e34ffab15ce62e53bfa24d"
  version "1.0.2"

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

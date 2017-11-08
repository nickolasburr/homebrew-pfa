class Keuka < Formula
  desc "SSL/TLS handshake analysis utility."
  homepage "https://github.com/nickolasburr/keuka"
  url "https://github.com/nickolasburr/keuka/archive/1.0.2.tar.gz"
  sha256 "32deb4cd860765d4ea036689eaba36ca8b130e9fd5e34ffab15ce62e53bfa24d"
  version "1.0.2"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 "a1f9ff86311d9fdd7c9f8f4a229f03b00b205d0aac91766887f5a83007f83925" => :high_sierra
    sha256 "a1f9ff86311d9fdd7c9f8f4a229f03b00b205d0aac91766887f5a83007f83925" => :sierra
    sha256 "a1f9ff86311d9fdd7c9f8f4a229f03b00b205d0aac91766887f5a83007f83925" => :el_capitan
    sha256 "a1f9ff86311d9fdd7c9f8f4a229f03b00b205d0aac91766887f5a83007f83925" => :yosemite
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

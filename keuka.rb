class Keuka < Formula
  desc "SSL/TLS handshake analysis utility."
  homepage "https://github.com/nickolasburr/keuka"
  url "https://github.com/nickolasburr/keuka/archive/1.0.0.tar.gz"
  sha256 "d741fa6e37ac7c45f05d5b19fc8b4ac5b037f9293c8cee44f7c89cac7996539c"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 "0a66ad110201f3f586e38c3a3f5db63ccf2c9ac8f9942cd22cb0149b14466d75" => :high_sierra
    sha256 "0a66ad110201f3f586e38c3a3f5db63ccf2c9ac8f9942cd22cb0149b14466d75" => :sierra
    sha256 "0a66ad110201f3f586e38c3a3f5db63ccf2c9ac8f9942cd22cb0149b14466d75" => :el_capitan
    sha256 "0a66ad110201f3f586e38c3a3f5db63ccf2c9ac8f9942cd22cb0149b14466d75" => :yosemite
  end

  depends_on "openssl" => :required

  def install
    system "make"

    bin.install "keuka"
  end

  test do
    system "keuka www.openssl.org"
  end
end

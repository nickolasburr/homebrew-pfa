class Keuka < Formula
  desc "SSL/TLS handshake analysis utility."
  homepage "https://github.com/nickolasburr/keuka"
  url "https://github.com/nickolasburr/keuka/archive/1.0.0.tar.gz"
  sha256 "d741fa6e37ac7c45f05d5b19fc8b4ac5b037f9293c8cee44f7c89cac7996539c"

  depends_on "openssl" => :required

  def install
    system "make"

    bin.install "keuka"
  end

  test do
    system "keuka www.openssl.org"
  end
end

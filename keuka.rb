class Keuka < Formula
  desc "SSL/TLS handshake analysis utility"
  homepage "https://github.com/nickolasburr/keuka"
  url "https://github.com/nickolasburr/keuka/archive/1.0.6.tar.gz"
  sha256 "f1f6641c7f6662632ab21f950a6618122447d7eabdd166e424420e95bdad4204"

  depends_on "openssl"

  def install
    system "make"

    bin.install "keuka"
    man1.install "man/keuka.1.gz"
  end

  test do
    system "keuka", "www.openssl.org"
  end
end

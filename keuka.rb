class Keuka < Formula
  desc "SSL/TLS handshake analysis utility"
  homepage "https://github.com/nickolasburr/keuka"
  url "https://github.com/nickolasburr/keuka/archive/1.0.4.tar.gz"
  sha256 "b7475f4343234e0fad671e2cb5bd3fc244660c01b9b9beabef0953547b4ad941"

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

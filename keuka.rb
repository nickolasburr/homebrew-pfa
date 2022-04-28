class Keuka < Formula
  desc "SSL/TLS handshake analysis utility"
  homepage "https://github.com/nickolasburr/keuka"
  url "https://github.com/nickolasburr/keuka/archive/1.0.5.tar.gz"
  sha256 "ae403045025b4bad41493d8d61424e0df59eb728b1ca7730c71e8833232722c0"

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

class Keuka < Formula
  desc "SSL/TLS handshake analysis utility."
  homepage "https://github.com/nickolasburr/keuka"
  url "https://github.com/nickolasburr/keuka/archive/1.0.1.tar.gz"
  sha256 "1ecaaaf0465403fda0feff20c09949ff84d0d1dcdc729789d719e84094994cd6"
  version "1.0.1"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 "8290859640dcd30359ca8d5829061f2fd9de55b80c0d706a16fb2cad0f022747" => :high_sierra
    sha256 "8290859640dcd30359ca8d5829061f2fd9de55b80c0d706a16fb2cad0f022747" => :sierra
    sha256 "8290859640dcd30359ca8d5829061f2fd9de55b80c0d706a16fb2cad0f022747" => :el_capitan
    sha256 "8290859640dcd30359ca8d5829061f2fd9de55b80c0d706a16fb2cad0f022747" => :yosemite
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

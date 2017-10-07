class Rename < Formula
  desc "Linux rename ported to Darwin"
  homepage "https://github.com/nickolasburr/homebrew-ppf"
  url "https://www.kernel.org/pub/linux/utils/util-linux/v2.31/util-linux-2.31-rc2.tar.gz"
  sha256 "ec0343fcbf54103d8d077fabf50410f638e5e1c244447eb40d8e93c7ecdebaf2"

  depends_on "gettext" => :required
  depends_on "libtool" => :required
  depends_on "pkg-config" => :required

  def install
    system "./autogen.sh"
    system "./configure"
    system "make rename"

    bin.install "rename"
    man1.install "misc-utils/rename.1"
  end

  test do
    system "touch testing.txt"
    system "rename testing success testing.txt"
  end
end

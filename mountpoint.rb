class Mountpoint < Formula
  desc "Ported version of mountpoint to Darwin"
  homepage "http://download.savannah.gnu.org/releases/sysvinit"
  url "http://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2"
  sha256 "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519"

  def install
    system "cc", "src/mountpoint.c", "-o", "mountpoint"
    bin.install "mountpoint"
    man1.install "man/mountpoint.1"
  end

  test do
    system "mountpoint", "/"
  end
end
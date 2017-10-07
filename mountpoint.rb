class Mountpoint < Formula
  desc "Linux mountpoint ported to Darwin"
  homepage "https://github.com/nickolasburr/homebrew-ppf"
  url "http://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2"
  sha256 "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519"

  def install
    system "/usr/bin/sed -i '' 's@#include <sys/stat.h>@#include <sys/types.h>\\\n#include <sys/stat.h>@' src/mountpoint.c"
    system "/usr/bin/cc", "-Wno-everything", "src/mountpoint.c", "-o", "mountpoint"

    bin.install "mountpoint"
    man1.install "man/mountpoint.1"
  end

  test do
    system "mountpoint", "/"
  end
end

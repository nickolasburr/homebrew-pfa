class Rng < Formula
  desc "Copy range of lines from file or stdin to stdout."
  homepage "https://github.com/nickolasburr/rng"
  url "https://github.com/nickolasburr/rng/archive/1.0.0.tar.gz"
  sha256 "df11af038bec750f657008cddcc7ca8a54d9ba149977de23dd08c96bd57cacfb"
  revision 1

  def install
    system "make"

    bin.install "rng"
    man1.install "man/rng.1.gz"
  end

  test do
    filename = "rng.txt"
    File.open(filename, "w") { |f| f.write("One\nTwo") }

    cmd = %W(#{bin}/rng 2, #{filename})
    assert_equal "Two", pipe_output(cmd, File.read(filename)).lines.last.chomp
  end
end

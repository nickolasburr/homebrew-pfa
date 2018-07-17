class Rng < Formula
  desc "Copy range of lines from file or stdin to stdout."
  homepage "https://github.com/nickolasburr/rng"
  url "https://github.com/nickolasburr/rng/archive/1.0.0.tar.gz"
  sha256 "9c099d4d7bdbf0b9354f13e6104833ef472bc3f4f1a80ef21faba143dcb32ca0"
  revision 2

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

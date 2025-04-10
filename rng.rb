class Rng < Formula
  desc "Print range of lines to stdout"
  homepage "https://github.com/nickolasburr/rng"
  url "https://github.com/nickolasburr/rng/archive/1.0.4.tar.gz"
  sha256 "d21dfccdc106e09341b5ccd37b90d197c483c1da11464e02daaed44abb708c39"

  def install
    system "make"

    bin.install "rng"
    man1.install "man/rng.1.gz"
  end

  test do
    filename = "rng.txt"
    File.open(filename, "w") { |f| f.write("One\nTwo") }

    cmd = %W[#{bin}/rng 2 #{filename}]
    assert_equal "Two", pipe_output(cmd, File.read(filename)).lines.last.chomp
  end
end

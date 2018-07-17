class Rng < Formula
  desc "Copy range of lines from file or stdin to stdout."
  homepage "https://github.com/nickolasburr/rng"
  url "https://github.com/nickolasburr/rng/archive/1.0.0.tar.gz"
  sha256 "cebc32cc492b50355f99c8dc6ccb4c779f10b963ff4b2c4d7523447e4cb7e8d4"

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

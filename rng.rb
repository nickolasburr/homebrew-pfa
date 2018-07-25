class Rng < Formula
  desc "Copy range of lines from file or stdin to stdout."
  homepage "https://github.com/nickolasburr/rng"
  url "https://github.com/nickolasburr/rng/archive/1.0.1.tar.gz"
  sha256 "dbc3c50e4d82296c839532c2db081e58cfeb2246308e35b53319d72cdbae151b"

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

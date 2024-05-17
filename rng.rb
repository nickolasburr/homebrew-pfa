class Rng < Formula
  desc "Print range of lines to stdout"
  homepage "https://github.com/nickolasburr/rng"
  url "https://github.com/nickolasburr/rng/archive/1.0.3.tar.gz"
  sha256 "25d2e98612d897b699dd80093c831fe0f7dc0aaeec4bcb82c09818ce8cb5b8d5"

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

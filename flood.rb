class Flood < Formula
  desc     "Rapidly repeat a command"
  homepage "https://github.com/sjmulder/flood"
  url      "https://github.com/sjmulder/flood/archive/1.0-rc1.tar.gz"
  sha256   "dfc79d3595db8f566ca58821d324e0f77fe0b36ff3768b2f709c29cf208cede2"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "${bin}/flood", "-n1", "ls"
  end
end

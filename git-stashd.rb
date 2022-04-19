class GitStashd < Formula
  desc "Git autostashing daemon"
  homepage "https://github.com/nickolasburr/git-stashd"
  url "https://github.com/nickolasburr/git-stashd/archive/1.0.2.tar.gz"
  sha256 "bd7f6ebb3c4ed65f7af518762bc00dd8c448d0b58bc45dcea19d3f85145c972e"

  depends_on "cmake" 
  depends_on "openssl" 

  def install
    system "make"

    bin.install "git-stashd"
    man1.install "man/git-stashd.1.gz"
  end

  test do
    system "git", "init"
    system "git", "stashd", "--help"
  end
end

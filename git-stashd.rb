class GitStashd < Formula
  desc "Git autostashing daemon."
  homepage "https://github.com/nickolasburr/git-stashd"
  url "https://github.com/nickolasburr/git-stashd/archive/1.0.2.tar.gz"
  sha256 "bd7f6ebb3c4ed65f7af518762bc00dd8c448d0b58bc45dcea19d3f85145c972e"
  version "1.0.2"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 "5d99f1e81a38ed4031b9ffbf8defce0790ea0e2bc9d44ade41f84d9dc06260ff" => :sierra
    sha256 "5d99f1e81a38ed4031b9ffbf8defce0790ea0e2bc9d44ade41f84d9dc06260ff" => :el_capitan
  end

  depends_on "openssl" => :required
  depends_on "cmake" => :required

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

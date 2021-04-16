class GitStashd < Formula
  desc "Git autostashing daemon"
  homepage "https://github.com/nickolasburr/git-stashd"
  url "https://github.com/nickolasburr/git-stashd/archive/1.0.2.tar.gz"
  version "1.0.2"
  sha256 "bd7f6ebb3c4ed65f7af518762bc00dd8c448d0b58bc45dcea19d3f85145c972e"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 high_sierra: "4fc11134b1cb971dbc18da4b46c7f0a7838247cc983531abdd27b8098d7c6158"
    sha256 sierra:      "4fc11134b1cb971dbc18da4b46c7f0a7838247cc983531abdd27b8098d7c6158"
    sha256 el_capitan:  "4fc11134b1cb971dbc18da4b46c7f0a7838247cc983531abdd27b8098d7c6158"
    sha256 yosemite:    "4fc11134b1cb971dbc18da4b46c7f0a7838247cc983531abdd27b8098d7c6158"
  end

  depends_on "cmake" => :required
  depends_on "openssl" => :required

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

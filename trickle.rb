class Trickle < Formula
  desc "Slow pipe and terminal"
  homepage "https://github.com/sjmulder/trickle"
  url "https://github.com/sjmulder/trickle/archive/1.0.tar.gz"
  sha256 "b1029f75e43136cb0651ab61b23ec46e215cd4effd8294424961f7d70686ee59"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 high_sierra: "fe39f8f291744a994e25155e130a87e22820752f94e3aaa8ebf9b0a176f71977"
    sha256 sierra:      "fe39f8f291744a994e25155e130a87e22820752f94e3aaa8ebf9b0a176f71977"
    sha256 el_capitan:  "fe39f8f291744a994e25155e130a87e22820752f94e3aaa8ebf9b0a176f71977"
    sha256 yosemite:    "fe39f8f291744a994e25155e130a87e22820752f94e3aaa8ebf9b0a176f71977"
  end

  def install
    system "make", "LDLIBS_tritty="
    system "gzip -c trickle.1 > trickle.1.gz"
    system "gzip -c tritty.1 > tritty.1.gz"

    bin.install "trickle"
    bin.install "tritty"

    man1.install "trickle.1.gz"
    man1.install "tritty.1.gz"
  end

  test do
    system "ls | trickle -b9600"
  end
end

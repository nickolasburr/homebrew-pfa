class Trickle < Formula
  desc "Slow pipe and terminal."
  homepage "https://github.com/sjmulder/trickle"
  url "https://github.com/sjmulder/trickle/archive/1.0.tar.gz"
  sha256 "b1029f75e43136cb0651ab61b23ec46e215cd4effd8294424961f7d70686ee59"
  version "1.0"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 "fe39f8f291744a994e25155e130a87e22820752f94e3aaa8ebf9b0a176f71977" => :high_sierra
    sha256 "fe39f8f291744a994e25155e130a87e22820752f94e3aaa8ebf9b0a176f71977" => :sierra
    sha256 "fe39f8f291744a994e25155e130a87e22820752f94e3aaa8ebf9b0a176f71977" => :el_capitan
    sha256 "fe39f8f291744a994e25155e130a87e22820752f94e3aaa8ebf9b0a176f71977" => :yosemite
  end

  def install
    system "make LDLIBS_tritty="
  end

  test do
    system "ls | trickle -b9600"
  end
end

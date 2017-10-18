class DarwinFree < Formula
  desc "Command line memory status tool for MacOS X, similar to free(1) on Linux."
  homepage "https://github.com/dcantrell/darwin-free"
  url "https://github.com/dcantrell/darwin-free/archive/v0.5.1.tar.gz"
  sha256 "3ecb8624898daec1d7968ba420f5c71b74b6306e1dc3038b9862fe64e9e6fcd0"
  version "0.5.1"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 "91a11f0cf126482c32aac32b2eb848657f8508221b8fc74be26ea89af36e3f04" => :high_sierra
    sha256 "91a11f0cf126482c32aac32b2eb848657f8508221b8fc74be26ea89af36e3f04" => :sierra
    sha256 "91a11f0cf126482c32aac32b2eb848657f8508221b8fc74be26ea89af36e3f04" => :el_capitan
    sha256 "91a11f0cf126482c32aac32b2eb848657f8508221b8fc74be26ea89af36e3f04" => :yosemite
  end

  def install
    cflags = %q(-O2 -Wall -std=c99 -D_FREE_VERSION="\"${VER}\"")

    system "make CFLAGS='#{cflags}'"
    system "gzip -c free.1 > free.1.gz"

    bin.install "free"
    man1.install "free.1.gz"
  end

  test do
    system "free -V"
  end
end

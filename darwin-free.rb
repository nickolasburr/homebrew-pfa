class DarwinFree < Formula
  desc "Command line memory status tool for MacOS X, similar to free(1) on Linux."
  homepage "https://github.com/dcantrell/darwin-free"
  url "https://github.com/dcantrell/darwin-free/archive/v0.5.1.tar.gz"
  sha256 "3ecb8624898daec1d7968ba420f5c71b74b6306e1dc3038b9862fe64e9e6fcd0"
  version "0.5.1"

  def install
    cflags = %q(-O2 -Wall -std=c99 -D_FREE_VERSION="\"${VER}\"")

    system "make CFLAGS='#{cflags}'"

    bin.install "free"
    man1.install "free.1"
  end

  test do
    system "free -V"
  end
end

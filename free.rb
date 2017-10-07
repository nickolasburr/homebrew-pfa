class Free < Formula
  desc "Darwin version of free utility"
  homepage "https://github.com/nickolasburr/homebrew-ppf"
  url "https://github.com/dcantrell/darwin-free/archive/v0.5.1.tar.gz"
  sha256 "3ecb8624898daec1d7968ba420f5c71b74b6306e1dc3038b9862fe64e9e6fcd0"

  cflags = %q(-O2 -Wall -std=c99 -D_FREE_VERSION="\"${VER}\"")

  def install
    system "make CFLAGS='#{cflags}'"

    bin.install "free"
    man1.install "free.1"
  end

  test do
    system "free -V"
  end
end

class Alphanum < Formula
  desc "Generate pseudo-random alphanumeric string of n characters"
  homepage "https://github.com/nickolasburr/homebrew-pfa"
  url "https://gist.githubusercontent.com/nickolasburr/f12148ad7d37d2f54816620a3ad19c7c/raw/be948f98e24f7a4509f9eaa7e9ad1ed18298b27b/alphanum"
  version "1.0.0"
  sha256 "8e00ab587f11d505b7f43806347ec5f54c2f37bf0a751369f220069b5f0db1f4"

  def install
    bin.install "alphanum"
  end

  test do
    system "alphanum", "15"
  end
end

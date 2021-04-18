class Battery < Formula
  desc "macOS utility for analyzing  properties"
  homepage "https://github.com/nickolasburr/battery"
  url "https://github.com/nickolasburr/battery/archive/1.0.0.tar.gz"
  sha256 "60a90ceee563e79873f564d4edfaaba4d2f2a0974fda522da50b2cb924162117"

  def install
    bin.install "battery"
  end

  test do
    system "battery", "--help"
  end
end

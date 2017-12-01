class Extract < Formula
  desc "Extract various archive types."
  homepage "https://gist.github.com/nickolasburr/c679c0ff8864660ef6fc702a23dcdbc8"
  url "https://gist.githubusercontent.com/nickolasburr/c679c0ff8864660ef6fc702a23dcdbc8/raw/d4447ea1489241b0df85ba35596d99e6d1f2bb4c/extract"
  sha256 "19221bfce1fe681632dab66d660e2ac2fa324f82a8e7f2d94621b3ec750ecaf0"
  version "1.0.0"

  def install
    bin.install "extract"
  end

  test do
    file = "test.txt"
    arch = "#{file}.tar.gz"
    path = "#{testpath}/#{file}"

    path.write <<-EOS
      Hello, world!
    EOS

    system "tar czf #{testpath}/#{arch} #{path}" or raise "Unable to create archive #{arch}"
    system "#{bin}/extract #{testpath}/#{arch}" or raise "Unable to extract archive #{arch}"
  end
end

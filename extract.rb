class Extract < Formula
  desc "Various archive types"
  homepage "https://github.com/nickolasburr/homebrew-pfa"
  url "https://gist.githubusercontent.com/nickolasburr/c679c0ff8864660ef6fc702a23dcdbc8/raw/d4447ea1489241b0df85ba35596d99e6d1f2bb4c/extract"
  version "1.0.0"
  sha256 "19221bfce1fe681632dab66d660e2ac2fa324f82a8e7f2d94621b3ec750ecaf0"

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

    system("tar", "czf", "#{testpath}/#{arch}", path.to_s) || raise("Unable to create archive #{arch}")
    system("#{bin}/extract", "#{testpath}/#{arch}") || raise("Unable to extract archive #{arch}")
  end
end

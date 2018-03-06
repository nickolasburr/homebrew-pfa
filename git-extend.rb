class GitExtend < Formula
  desc "Extend Git builtins with command wrappers."
  homepage "https://github.com/nickolasburr/git-extend"
  url "https://github.com/nickolasburr/git-extend/archive/1.0.0.tar.gz"
  sha256 "ddaf15b11d5331887fa708232c3c69ced2f07b98a2073428ad4f84badaa0f84a"

  def install
    script = "#{bin}/git-extend"
    target = "git"

    Dir.chdir("src")
    ln_sf script target

    bin.install script
    bin.install target
  end

  test do
    system "git", "init"
    system "git", "extend", "--path"
  end
end

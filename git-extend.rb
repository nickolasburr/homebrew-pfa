class GitExtend < Formula
  desc "Extend Git builtins with command wrappers."
  homepage "https://github.com/nickolasburr/git-extend"
  url "https://github.com/nickolasburr/git-extend/archive/1.0.1.tar.gz"
  sha256 ""

  unless Formula["git"].nil?
    keg_only <<~EOS
      you have Git installed with Homebrew, and git-extend installs
      a symbolic link from git-extend -> git in HOMEBREW_PREFIX/bin.
    EOS
  end

  def install
    source = "git-extend"
    target = "git"

    system("make", "build", "GITPREFIX=#{HOMEBREW_PREFIX}") if keg_only?

    Dir.chdir("bin") do
      ln_sf source, target

      bin.install source
      bin.install target
    end
  end

  test do
    system "git", "init"
    system "git", "extend", "--path"
  end
end

class GitExtend < Formula
  desc "Extend Git builtins with command wrappers"
  homepage "https://github.com/nickolasburr/git-extend"
  url "https://github.com/nickolasburr/git-extend/archive/1.0.2.tar.gz"
  sha256 "046994da4cd72dc2ae95f7744e7f0efbc30877248d60b749875291116f1ae450"

  keg_only <<~EOS
    git-extend(1) installs a symbolic link from git-extend -> git,
    which would cause conflicts with Homebrew installation of Git
  EOS

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

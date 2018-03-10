class GitExtend < Formula
  desc "Extend Git builtins with command wrappers"
  homepage "https://github.com/nickolasburr/git-extend"
  url "https://github.com/nickolasburr/git-extend/archive/1.0.2.tar.gz"
  sha256 "af5f72812d2d571663296ec933ffda224a5ada2187775cf562e501b98fbcbcaf"

  keg_only <<~EOS
    git-extend(1) installs a symbolic link from git-extend -> git,
    which would cause conflicts with Homebrew installation of Git
  EOS

  def install
    source = "git-extend"
    target = "git"

    system("make", "build", "GITPREFIX=#{HOMEBREW_PREFIX}") if Formula["git"].installed?

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

class GitExtend < Formula
  desc "Extend Git builtins with command wrappers."
  homepage "https://github.com/nickolasburr/git-extend"
  url "https://github.com/nickolasburr/git-extend/archive/1.0.0.tar.gz"
  sha256 "a5e6273679597f2d49e4089c2a80ddcce2efadc091dceab5229515e614bedf55"

  def install
    Dir.chdir("bin")

    source = "git-extend"
    target = "git"

    bin.install source
    bin.install_symlink source => target
  end

  test do
    system "git", "init"
    system "git", "extend", "--path"
  end
end

class GitExtend < Formula
  desc "Extend Git builtins with command wrappers."
  homepage "https://github.com/nickolasburr/git-extend"
  url "https://github.com/nickolasburr/git-extend/archive/1.0.1.tar.gz"
  sha256 "57c71929a00bc647c8c9df8ddcce4221ebbbfea2b3c79ad958779c8fb8c037db"

  option "with-alt-prefix", "Install git-extend with alternate prefix /usr/local/alt"
  option "with-homebrew-git", "Configure git-extend to use Homebrew's version of Git. Implies --with-alt-prefix"

  conflicts_with "git", :because => "both install symlinks at #{HOMEBREW_PREFIX}/bin/git" unless build.with? "alt-prefix"

  def install
    Dir.chdir("bin")

    source = "git-extend"
    target = "git"

    if build.with? "alt-prefix"
      alt_dir = "#{HOMEBREW_PREFIX}/alt"
      alt_bin = "#{alt_dir}/bin"

      if build.with? "homebrew-git"
        system "make", "build", "GITPREFIX=#{HOMEBREW_PREFIX}"
      end

      system "make", "install", "PREFIX=#{alt_dir}"

      alt_bin.install source
      alt_bin.install_symlink source => target
    else
      bin.install source
      bin.install_symlink source => target
    end
  end

  test do
    system "git", "init"
    system "git", "extend", "--path"
  end
end

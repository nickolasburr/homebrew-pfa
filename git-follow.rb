class GitFollow < Formula
  desc "Follow lifetime changes of a pathspec in Git."
  homepage "https://github.com/nickolasburr/git-follow"
  url "https://github.com/nickolasburr/git-follow/archive/1.1.5.tar.gz"
  sha256 "d71bf48e92d4dc37505cd5427fc7fa2fcb9b4f0604e4ad593c10252675934dcb"

  def install
    bin.install "git-follow"
    man1.install "git-follow.1.gz"
  end

  test do
    system "git", "init"
    system "git", "follow", "--help"
  end
end

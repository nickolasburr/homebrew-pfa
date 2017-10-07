class GitFollow < Formula
  desc "Follow lifetime changes of a pathspec in Git."
  homepage "https://github.com/nickolasburr/git-follow"
  url "https://github.com/nickolasburr/git-follow/archive/1.1.4.tar.gz"
  sha256 "c305381110903b5c9d9779e530a872e1f634f63bab221b8f457e32456e7fc52d"

  def install
    bin.install "git-follow"
    man1.install "git-follow.1.gz"
  end

  test do
    system "git", "init"
    system "git", "follow", "--help"
  end
end

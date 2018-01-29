class GitFollow < Formula
  desc "Follow lifetime changes of a pathspec in Git."
  homepage "https://github.com/nickolasburr/git-follow"
  url "https://github.com/nickolasburr/git-follow/archive/1.1.5.tar.gz"
  sha256 "2618d3a2437c3c85dc018c1ef6ddba7ef9040cf94fbab8d0e088e2497918c575"
  revision 3

  def install
    target = "git-follow"

    (etc/target).mkpath
    (etc/target).install "src"

    bin.install "#{target}"
    man1.install "man/#{target}.1.gz"
  end

  test do
    system "git init"
    system "git follow --version"
  end
end

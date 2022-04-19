class ScIm < Formula
  desc "- Spreadsheet Calculator Improvised -- An ncurses spreadsheet program for terminal"
  homepage "https://github.com/andmarti1424/sc-im"
  url "https://github.com/andmarti1424/sc-im/archive/v0.6.0.tar.gz"
  sha256 "5da644d380ab3752de283b83cce18c3ba12b068d0762c44193c34367a0dcbc38"
  revision 3
  head "https://github.com/andmarti1424/sc-im.git", branch: "freeze"

  patch :DATA

  def install
    Dir.chdir("src") do
      system "make", "prefix=#{prefix}"
      system "make", "prefix=#{prefix}", "install"
    end
  end

  test do
    input = <<~EOS
      let A1=1+1
      getnum A1
    EOS

    cmd = %W[#{bin}/scim --nocurses --quit_afterload 2>/dev/null | tail -n 1]

    assert_equal "nowide 2", pipe_output(cmd, input).lines.last.chomp
  end
end
__END__
diff --git a/src/Makefile b/src/Makefile
index 779f8bb..3443037 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -18,7 +18,7 @@ MANDIR  = $(prefix)/man/man1
 
 ifeq ($(shell uname -s),Darwin)
   NCURSES_CFLAGS ?=
-  NCURSES_LIBS   ?= -lncursesw
+  NCURSES_LIBS   ?= -lncurses
 else ifeq ($(shell pkg-config --exists ncursesw || echo 'no'),no)
   NCURSES_CFLAGS ?=
   NCURSES_LIBS   ?= -lncursesw
diff --git a/src/tui.c b/src/tui.c
index 21f809b..121f65a 100644
--- a/src/tui.c
+++ b/src/tui.c
@@ -78,7 +78,7 @@ SCREEN * sstdout;
 srange * ranges;
 
 void ui_start_screen() {
-    sstderr = newterm(NULL, stderr, NULL);
+    sstderr = newterm(NULL, stderr, stdin);
     noecho();
     sstdout = newterm(NULL, stdout, stdin);
     set_term(sstdout);

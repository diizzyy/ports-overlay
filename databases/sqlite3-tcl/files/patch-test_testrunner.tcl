--- test/testrunner.tcl.orig	2026-05-24 19:55:29 UTC
+++ test/testrunner.tcl
@@ -270,6 +270,15 @@ switch -nocase -glob -- $tcl_platform(os) {
     set TRG(run)         run.sh
     set TRG(runcmd)      "bash run.sh"
   }
+  *freebsd* {
+    set TRG(platform)    linux
+    set TRG(make)        make.sh
+    set TRG(makecmd)     "sh make.sh"
+    set TRG(testfixture) testfixture
+    set TRG(shell)       sqlite3
+    set TRG(run)         run.sh
+    set TRG(runcmd)      "sh run.sh"
+  }
   *openbsd* {
     set TRG(platform)    linux
     set TRG(make)        make.sh

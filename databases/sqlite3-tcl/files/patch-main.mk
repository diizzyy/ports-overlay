--- main.mk.orig	2025-06-28 14:24:16 UTC
+++ main.mk
@@ -1810,7 +1811,7 @@ tcltest:	./testfixture$(T.exe)
 # The veryquick.test TCL tests.
 #
 tcltest:	./testfixture$(T.exe)
-	./testfixture$(T.exe) $(TOP)/test/veryquick.test $(TESTOPTS)
+	mkdir $(TOP)/testdir && touch $(TOP)/test-out.txt && chown nobody $(TOP)/testdir $(TOP)/test-out.txt && su -m nobody -c "./testfixture$(T.exe) $(TOP)/test/veryquick.test $(TESTOPTS)"
 
 #
 # Runs all the same tests cases as the "tcltest" target but uses

--- main.mk.orig	2025-06-28 14:24:16 UTC
+++ main.mk
@@ -140,6 +140,7 @@ libdir      ?= $(exec_prefix)/lib
 exec_prefix ?= $(prefix)
 bindir      ?= $(exec_prefix)/bin
 libdir      ?= $(exec_prefix)/lib
+libdatadir  ?= $(exec_prefix)/libdata
 # This makefile does not use any of:
 # sbindir        ?= $(exec_prefix)/sbin
 # sysconfdir     ?= /etc
@@ -469,7 +470,7 @@ install-dir.include = $(DESTDIR)$(includedir)
 install-dir.bin = $(DESTDIR)$(bindir)
 install-dir.lib = $(DESTDIR)$(libdir)
 install-dir.include = $(DESTDIR)$(includedir)
-install-dir.pkgconfig = $(DESTDIR)$(libdir)/pkgconfig
+install-dir.pkgconfig = $(DESTDIR)$(libdatadir)/pkgconfig
 install-dir.man1 = $(DESTDIR)$(mandir)/man1
 install-dir.all = $(install-dir.bin) $(install-dir.include) \
   $(install-dir.lib) $(install-dir.man1) \

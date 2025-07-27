--- examples/vwebp.c.orig	2025-07-08 00:20:00 UTC
+++ examples/vwebp.c
@@ -28,7 +28,7 @@
 #if defined(HAVE_GLUT_GLUT_H)
 #include <GLUT/glut.h>
 #else
-#include <GL/glut.h>
+#include <GL/freeglut.h>
 #ifdef FREEGLUT
 #include <GL/freeglut.h>
 #endif

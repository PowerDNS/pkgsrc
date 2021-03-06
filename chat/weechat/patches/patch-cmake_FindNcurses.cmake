$NetBSD: patch-cmake_FindNcurses.cmake,v 1.4 2019/09/17 11:30:27 nia Exp $

Don't try to look for ncurses.h, so FAKE_NCURSES works for netbsd curses.

--- cmake/FindNcurses.cmake.orig	2019-09-08 06:13:58.000000000 +0000
+++ cmake/FindNcurses.cmake
@@ -22,7 +22,7 @@ if(NCURSES_FOUND)
 endif()
 
 find_path(NCURSES_INCLUDE_PATH
-  NAMES ncurses.h curses.h
+  NAMES curses.h ncurses.h
   PATH_SUFFIXES ncursesw ncurses
   PATHS /usr/include /usr/local/include /usr/pkg/include
 )
@@ -41,7 +41,7 @@ if(NCURSESW_LIBRARY)
   set(NCURSES_LIBRARY ${NCURSESW_LIBRARY})
 else()
   find_library(NCURSES_LIBRARY
-    NAMES ncurses
+    NAMES curses ncurses
     PATHS /lib /usr/lib /usr/local/lib /usr/pkg/lib
   )
   find_package(PkgConfig QUIET)

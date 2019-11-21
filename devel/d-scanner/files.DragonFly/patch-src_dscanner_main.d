--- src/dscanner/main.d	2019-02-15 04:03:10.000000000 -0800
+++ src/dscanner/main.d	2019-06-28 18:01:36.433520000 -0700
@@ -400,6 +400,7 @@
 version (linux) version = useXDG;
 version (BSD) version = useXDG;
 version (FreeBSD) version = useXDG;
+version (DragonFlyBSD) version = useXDG;
 version (OSX) version = useXDG;
 
 /**

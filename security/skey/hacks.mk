# $NetBSD: hacks.mk,v 1.5 2018/07/04 13:40:36 jperkin Exp $

.if !defined(SKEY_HACKS_MK)
SKEY_HACKS_MK=	# defined

### [Sun Jul  9 13:16:14 CDT 2006 : schwarz]
### pkgsrc expects troff-style man pages on all platforms
###
PKG_HACKS+=		enforce-troff-style-man-pages
# the following line is only to specify mansubdir
CONFIGURE_ARGS+=	--with-catman=man
SUBST_CLASSES+=		tsmp
SUBST_MESSAGE.tsmp=	enforce use of troff style man pages
SUBST_STAGE.tsmp=	pre-configure
SUBST_FILES.tsmp=	configure
SUBST_SED.tsmp=		-e 's,$$(CATMAN),$$(TROFFMAN),g'

### [Sun Jul  9 13:20:30 CDT 2006 : schwarz]
### IRIX 5 does not have usleep()
###
.if !empty(MACHINE_PLATFORM:MIRIX-5*)
PKG_HACKS+=		use-sginap-instead-of-usleep
SUBST_CLASSES+=		sginap
SUBST_MESSAGE.sginap=	use sginap() instead of usleep()
SUBST_STAGE.sginap=	pre-configure
SUBST_FILES.sginap=	skeyinit.c skeylogin.c
SUBST_SED.sginap=	-e 's,usleep(100000),sginap(CLK_TCK/10),g'
.endif

### [Sun Jul  9 14:11:23 CDT 2006 : schwarz]
### IRIX 5 does not define 64 bit types in sys/types.h
###
.if !empty(MACHINE_PLATFORM:MIRIX-5*)
PKG_HACKS+=		missing-u_int64_t
CPPFLAGS+=		-DMISSING_U_INT64_T
.endif

.endif

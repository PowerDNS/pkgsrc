# $NetBSD: Makefile,v 1.8 2020/01/26 17:31:29 rillig Exp $

DISTNAME=	lua-${LUA_VERSION}
PKGNAME=	lua51-${LUA_VERSION}
PKGREVISION=	3
CATEGORIES=	lang
MASTER_SITES=	http://www.lua.org/ftp/
MASTER_SITES+=	http://www.tecgraf.puc-rio.br/lua/ftp/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.lua.org/
COMMENT=	Powerful light-weight language for extending applications
LICENSE=	mit

.include "../../lang/lua51/version.mk"

CONFLICTS+=	lua-[0-9]*

.include "../../mk/bsd.prefs.mk"

USE_LIBTOOL=	yes
USE_TOOLS+=	gmake
MAKE_ENV+=	DLLIB=${BUILDLINK_LDADD.dl:Q}
MAKE_ENV+=	INSTALL_DATA=${INSTALL_DATA:Q}
CFLAGS+=	-DLUA_ROOT=\"${PREFIX}/\"

MAKE_FLAGS+=	CC=cc

DOCDIR=		${PREFIX}/share/doc/lua-5.1
EGDIR=		${PREFIX}/share/examples/lua-5.1

# pkg/47587 lua not linked to pthread causes issues with modules
PTHREAD_OPTS+=		native

.include "../../mk/pthread.buildlink3.mk"

.if defined(PTHREAD_TYPE) && ${PTHREAD_TYPE} == "native"
CFLAGS+=	-pthread
LDFLAGS+=	-pthread
.endif

.if ${OPSYS} == "FreeBSD"
BUILD_TARGET=	freebsd
.elif !empty(OPSYS:M*BSD*) || ${OPSYS} == "DragonFly"
BUILD_TARGET=	bsd
.elif ${OPSYS} == "Linux"
BUILD_TARGET=	linux
.elif ${OPSYS} == "Darwin"
BUILD_TARGET=	macosx
.elif ${OPSYS} == "SunOS"
BUILD_TARGET=	solaris
.elif ${OPSYS} == "AIX"
BUILD_TARGET=	aix
.else
BUILD_TARGET=	generic
.endif

PKGCONFIG_OVERRIDE=	${WRKSRC}/etc/lua.pc

INSTALLATION_DIRS+=	lib/pkgconfig

SUBST_CLASSES+=		pc-prefix
SUBST_FILES.pc-prefix+=	${WRKSRC}/etc/lua.pc
SUBST_SED.pc-prefix+=	-e "s,/usr/local,${PREFIX},"
SUBST_STAGE.pc-prefix=	post-build

post-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${DOCDIR}
	set -e; \
	cd ${WRKSRC}; for f in README COPYRIGHT HISTORY; do		\
		${INSTALL_DATA} "$$f" ${DESTDIR}${DOCDIR};		\
	done
	set -e; \
	cd ${WRKSRC}/doc; for f in *.html *.gif; do			\
		${INSTALL_DATA} "$$f" ${DESTDIR}${DOCDIR};		\
	done
	${INSTALL_DATA_DIR} ${DESTDIR}${EGDIR}
	set -e; \
	cd ${WRKSRC}/test; for f in README *.lua; do			\
		${INSTALL_DATA} "$$f" ${DESTDIR}${EGDIR};		\
	done
	${INSTALL_DATA_DIR} ${DESTDIR}${EGDIR}/etc
	set -e; \
	cd ${WRKSRC}/etc; for f in README *.c *.ico *.lua; do \
		${INSTALL_DATA} "$$f" ${DESTDIR}${EGDIR}/etc;		\
	done
	${INSTALL_DATA} ${WRKSRC}/etc/lua.pc \
	    ${DESTDIR}${PREFIX}/lib/pkgconfig/lua-5.1.pc

.include "../../mk/readline.buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

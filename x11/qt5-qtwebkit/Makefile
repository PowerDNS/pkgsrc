# $NetBSD: Makefile,v 1.73 2020/03/10 22:09:15 wiz Exp $

DISTNAME=	qtwebkit-${QTWKVERSION}
PKGNAME=	qt5-qtwebkit-${QTWKVERSION:S/-/./}
PKGREVISION=	5
MASTER_SITES=	${MASTER_SITE_GITHUB:=qtwebkit/}
GITHUB_PROJECT=	qtwebkit
GITHUB_RELEASE=	${DISTNAME}
CATEGORIES=	x11

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/qtwebkit/qtwebkit/wiki
COMMENT=	Qt5 WebView module
LICENSE=	gnu-lgpl-v2.1 AND gnu-gpl-v3
EXTRACT_SUFX=	.tar.xz

BUILD_DEPENDS+=	${PYPKGPREFIX}-expat-[0-9]*:../../textproc/py-expat

QTWKVERSION=	5.212.0-alpha3

PYTHON_VERSIONS_ACCEPTED=	27 # as of 5.212.0-alpha2

.include "../../mk/dlopen.buildlink3.mk"
BUILDLINK_TRANSFORM+=   opt:-ldl:${BUILDLINK_LDADD.dl:M*}

USE_LANGUAGES=		c c++11
USE_TOOLS+=		gmake perl:build pkg-config bison flex sed
USE_CMAKE=		yes
CMAKE_ARG_PATH=		..
CONFIGURE_DIRS=		_build
CMAKE_INSTALL_PREFIX=	${PREFIX}/qt5
TEST_TARGET=		test

CMAKE_ARGS+=		-DPORT=Qt
CMAKE_ARGS+=		-DENABLE_TOOLS=OFF
CMAKE_ARGS+=		-DCMAKE_BUILD_TYPE=Release
CMAKE_ARGS+=		-DSHARED_CORE:BOOL=ON
CMAKE_ARGS+=		-DUSE_SYSTEM_MALLOC:BOOL=ON
CMAKE_ARGS+=		-DUSE_LD_GOLD:BOOL=OFF
CMAKE_ARGS+=		-DENABLE_API_TESTS=OFF

CMAKE_ARGS+=		-DKDE_INSTALL_LIBEXECDIR=${CMAKE_INSTALL_PREFIX}/libexec
#CMAKE_ARGS+=		-DLIBEXEC_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}/libexec

GCC_REQD+=	4.9

pre-configure:
	${MKDIR} ${WRKSRC}/_build

# wcstof(3) etc. is used in C++ code.
CFLAGS.NetBSD+=		-D_NETBSD_SOURCE

## for GL_GLEXT_LEGACY with GL/gl.h error, GL_ARB_shader_objects is not defined.
#BUILDLINK_TRANSFORM+=	rm:-Wundef

# avoid creating a .qt directory in the users home directory
SCRIPTS_ENV+=		HOME=${WRKDIR}

BUILD_DEPENDS+=		gperf-[0-9]*:../../devel/gperf

REPLACE_PERL+=		Source/WebKit2/Scripts/generate-forwarding-headers.pl

#MAKE_ENV+=		QTDIR=${QTDIR}
INSTALL_ENV+=		INSTALL_ROOT=${DESTDIR}
INSTALLATION_DIRS+=	lib/pkgconfig

.if ${_USE_CWRAPPERS} == "yes"
BUILDLINK_TRANSFORM+=	R:${WRKSRC}/lib:${QTDIR}/lib
.else
BUILDLINK_TRANSFORM+=	rpath:${WRKSRC}/lib:${QTDIR}/lib
.endif

.if ${OPSYS} == "NetBSD" && ${MACHINE_CPU:U} == "arm"
LDFLAGS+=	-Wl,-no-keep-memory -Wl-reduce-memory
.endif

# 64-bit atomic ops are required
.if ${MACHINE_ARCH} == "i386"
CXXFLAGS+=	-march=i586
.endif

post-install:
.for i in Qt5WebKit.pc Qt5WebKitWidgets.pc
	cd ${DESTDIR}${PREFIX}/lib/pkgconfig && \
	ln -f -s ${QTDIR}/lib/pkgconfig/${i} ${i}
.endfor

.include "../../databases/sqlite3/buildlink3.mk"
.if ${OPSYS} == "Darwin" || ${OPSYS} == "Linux" || ${OPSYS} == "NetBSD"
.include "../../devel/libexecinfo/buildlink3.mk"
.endif
.include "../../graphics/libwebp/buildlink3.mk"
.include "../../mk/curses.buildlink3.mk"
.include "../../textproc/hyphen/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../textproc/libxslt/buildlink3.mk"
.if ${OPSYS} != "Darwin"
# https://github.com/GStreamer/gst-plugins-bad/commit/b9e15fddb14b2cde6470255794ef130523885e9f
BUILDLINK_API_DEPENDS.gst-plugins1-base+=	gst-plugins1-base>=1.15.1
.include "../../multimedia/gst-plugins1-base/buildlink3.mk"
.include "../../x11/libXcomposite/buildlink3.mk"
.endif
.include "../../x11/qt5-qtdeclarative/buildlink3.mk"
.include "../../x11/qt5-qtlocation/buildlink3.mk"
.include "../../x11/qt5-qtmultimedia/buildlink3.mk"
.include "../../x11/qt5-qtsensors/buildlink3.mk"
.include "../../x11/qt5-qtwebchannel/buildlink3.mk"
PYTHON_FOR_BUILD_ONLY=			yes
.include "../../lang/python/tool.mk"
.include "../../lang/ruby/buildlink3.mk"
BUILDLINK_DEPMETHOD.${RUBY_BASE}=	build
.include "../../mk/bsd.pkg.mk"

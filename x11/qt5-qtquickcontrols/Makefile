# $NetBSD: Makefile,v 1.39 2020/03/10 22:09:14 wiz Exp $

DISTNAME=	qtquickcontrols-everywhere-src-${QTVERSION}
PKGNAME=	qt5-qtquickcontrols-${QTVERSION}
PKGREVISION=	2
COMMENT=	Qt5 module for QuickControls

BUILD_TARGET=		sub-src
MAKE_ENV+=		QTDIR=${QTDIR}

INSTALL_ENV+=		INSTALL_ROOT=${DESTDIR}

.include "../../x11/qt5-qtbase/Makefile.common"

.include "../../x11/qt5-qtdeclarative/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

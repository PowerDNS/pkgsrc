# $NetBSD: Makefile,v 1.22 2020/03/10 22:09:09 wiz Exp $

DISTNAME=	kguiaddons-${KF5VER}
PKGREVISION=	2
CATEGORIES=	x11

HOMEPAGE=	https://community.kde.org/Frameworks
COMMENT=	Addons to QtGui
LICENSE=	gnu-gpl-v2 AND gnu-lgpl-v2.1

.include "../../meta-pkgs/kde/kf5.mk"

USE_TOOLS+=	pkg-config

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtx11extras/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

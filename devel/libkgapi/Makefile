# $NetBSD: Makefile,v 1.20 2020/03/08 16:49:15 wiz Exp $

DISTNAME=	libkgapi-2.2.0
PKGREVISION=	18
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_KDE:=libkgapi/2.2.0/src/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.kde.org/
COMMENT=	KDE-based library for accessing various Google services
LICENSE=	gnu-gpl-v2

BUILD_DEPENDS+=	automoc4>=0.9.83:../../devel/automoc4

USE_CMAKE=	yes
USE_LANGUAGES=	c c++


.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../devel/qjson/buildlink3.mk"
.include "../../misc/kdepimlibs4/buildlink3.mk"
.include "../../x11/kdelibs4/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"

# $NetBSD: Makefile,v 1.26 2020/03/10 22:10:40 wiz Exp $

PKGREVISION= 2
.include "../../meta-pkgs/mate/Makefile.common"

DISTNAME=	mate-media-${VERSION:R}.2
CATEGORIES=	multimedia

COMMENT=	MATE media tools for MATE Desktop
LICENSE=	gnu-gpl-v2 AND gnu-fdl-v1.1 AND gnu-lgpl-v2

EXTRACT_USING=	gtar

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}

INSTALL_MAKE_FLAGS+=	sysconfdir=${PREFIX}/share/examples/mate-media

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../audio/libcanberra/buildlink3.mk"
.include "../../audio/libmatemixer/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/mate-desktop/buildlink3.mk"
.include "../../x11/mate-panel/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

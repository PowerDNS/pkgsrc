# $NetBSD: Makefile,v 1.2 2020/01/31 18:40:13 wiz Exp $

DISTNAME=	xbanish-1.6
PKGREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=jcs/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pho@cielonegro.org
HOMEPAGE=	https://github.com/jcs/xbanish/
COMMENT=	Banish the mouse cursor when typing
LICENSE=	modified-bsd

MAKE_FLAGS+=	MANDIR=${PREFIX}/${PKGMANDIR}/man1
MAKE_FLAGS+=	LDPATH=${X11_LDFLAGS:Q}\ ${LDFLAGS:Q}

.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXfixes/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

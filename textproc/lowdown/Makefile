# $NetBSD: Makefile,v 1.7 2020/03/07 22:17:01 fcambus Exp $

DISTNAME=	lowdown-0.6.1
CATEGORIES=	textproc
MASTER_SITES=	https://kristaps.bsd.lv/lowdown/snapshots/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://kristaps.bsd.lv/lowdown/
COMMENT=	Simple Markdown translator
LICENSE=	2-clause-bsd

HAS_CONFIGURE=	yes

SUBST_CLASSES+=		install
SUBST_SED.install+=	-e 's,/usr/local,${PREFIX},' \
			-e 's,^MANDIR=.*,MANDIR=${PREFIX}/${PKGMANDIR},' \
			-e '/^CC=.*/d'						\
			-e '/^CFLAGS=.*/d'					\
			-e '/^LDFLAGS=.*/d'
SUBST_FILES.install+=	configure
SUBST_STAGE.install=	pre-configure
SUBST_MESSAGE.install=	Fixing installation path.

.include "../../mk/bsd.pkg.mk"

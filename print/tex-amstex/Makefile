# $NetBSD: Makefile,v 1.5 2020/01/18 23:33:32 rillig Exp $

DISTNAME=	amstex
PKGNAME=	tex-${DISTNAME}-2.2.49810
TEXLIVE_REV=	49810

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://ctan.org/pkg/amstex
COMMENT=	American Mathematical Society plain TeX macros
LICENSE=	lppl-1.3c

DEPENDS+=	tex-tex-[0-9]*:../../print/tex-tex

INSTALLATION_DIRS=	bin

TEX_FORMATS+=	"amstex pdftex - -translate-file=cp227.tcx *amstex.ini\\n"

TEXLIVE_UNVERSIONED=	yes
.include "../../print/texlive/package.mk"

post-install:
	${LN} -sf pdftex ${DESTDIR}${PREFIX}/bin/amstex

.include "../../mk/bsd.pkg.mk"

# $NetBSD: Makefile,v 1.6 2019/08/11 13:20:47 wiz Exp $

DISTNAME=	inc-0.06
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:S/${MODULE_DIR}/${AUTHOR_DIR}/}
MODULE_DIR=	modules/by-module
AUTHOR_DIR=	authors/id/I/IN/INGY

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/inc
COMMENT=	Smart @INC Processing
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=		auto/inc/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"

# $NetBSD: Makefile,v 1.1 2020/03/20 17:05:10 taca Exp $

DISTNAME=	actioncable-${RAILS_VERSION}
PKGNAME=	${RUBY_PKGPREFIX}-actioncable${RUBY_RAILS}-${RAILS_VERSION}
CATEGORIES=	www

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.rubyonrails.org/
COMMENT=	Toolkit for building modeling frameworks (part of Rails 6.0)
LICENSE=	mit

DEPENDS+=	${RUBY_ACTIONPACK_DEPENDS}
DEPENDS+=	${RUBY_PKGPREFIX}-nio4r>=2.0:../../net/ruby-nio4r
DEPENDS+=	${RUBY_PKGPREFIX}-websocket-driver>=0.6.1:../../www/ruby-websocket-driver

USE_LANGUAGES=	# none

RUBY_RAILS_ACCEPTED=	60
RUBY_RAILS_STRICT_DEP=	yes

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"

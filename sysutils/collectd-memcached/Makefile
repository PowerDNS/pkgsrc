# $NetBSD: Makefile,v 1.3 2019/08/11 13:23:05 wiz Exp $

COLLECTD_PACKAGE=	memcached
COLLECTD_PLUGINS=	memcachec memcached

COMMENT=		Statistics collection daemon - memcached plugins
PKGREVISION=		2

.include "../../sysutils/collectd/Makefile.common"

CONFIGURE_ARGS+=	--with-libmemcached=${BUILDLINK_PREFIX.libmemcached}

.include "../../devel/libmemcached/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

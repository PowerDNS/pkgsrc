# $NetBSD: Makefile,v 1.26 2020/03/08 16:51:09 wiz Exp $

PKGNAME=		libprelude-python-${VERSION}
PKGREVISION=		14
COMMENT=		Python bindings to LibPrelude

.include "../../security/libprelude/Makefile.common"

CONFIGURE_ARGS+=	--with-python
CONFIGURE_ENV+=		PYTHON=${PYTHONBIN:Q}
PY_PATCHPLIST=		yes

BUILD_DIRS=		bindings/low-level/python bindings/python

PKG_OPTIONS_VAR=	PKG_OPTIONS.libprelude
PKG_SUPPORTED_OPTIONS=	debug

PYTHON_VERSIONS_ACCEPTED=	27 # not yet ported as of 0.9.24.1

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mdebug)
CFLAGS=			-O0 -ggdb
.endif

.include "../../devel/libltdl/convenience.mk"
.include "../../lang/python/application.mk"
.include "../../lang/python/extension.mk"
.include "../../security/gnutls/buildlink3.mk"
.include "../../security/gnutls/libgnutls-config.mk"
.include "../../security/libprelude/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

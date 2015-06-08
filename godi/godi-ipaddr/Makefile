.include "../../mk/bsd.prefs.mk"

VERSION=	2.6.1
ONAME=		ipaddr
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-ipaddr-2.6.1
DISTFILES=	ipaddr-2.6.1.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/mirage/ocaml-ipaddr
COMMENT=	IP (and MAC) address representation library

DEPENDS+=  godi-type_conv-*:../../godi/godi-type_conv
DEPENDS+=  godi-sexplib-*:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit-*:../../godi/godi-ounit


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"

.include "../../mk/bsd.prefs.mk"

VERSION=	2.0.0
ONAME=		base64
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-base64-2.0.0
DISTFILES=	base64-2.0.0.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/mirage/ocaml-base64
COMMENT=	Base64 encoding and decoding library

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=       godi-bytes>=0:../../godi/godi-bytes
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"

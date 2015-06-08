.include "../../mk/bsd.prefs.mk"

ONAME=		lambda-term
PKG=		godi-${ONAME}
VERSION=        1.8
FINODE=		1136
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       lambda-term-1.8
DISTFILES=      lambda-term-1.8.tar.xz
CATEGORIES=     godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/diml/lambda-term
COMMENT=	cross-platform library for manipulating the terminal

DEPENDS+=  godi-react>=1.0.0:../../godi/godi-react
DEPENDS+= godi-ocaml>=4.01:../../godi/godi-ocaml
DEPENDS+= godi-zed>=1.2:../../godi/godi-zed
DEPENDS+= godi-lwt>=2.4.0:../../godi/godi-lwt

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-camlp4>=0:../../godi/godi-camlp4

CONFIGURE_ARGS+=	--enable-camlp4
WINOASIS=		yes
#WINOASIS_USE_BASH=	yes


.include "../../mk/bsd.pkg.mk"


.include "../../mk/bsd.prefs.mk"

VERSION=	0.18.3
ONAME=		cohttp
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-cohttp-0.18.3
DISTFILES=	cohttp-0.18.3.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/mirage/ocaml-cohttp
COMMENT=	HTTP library for Lwt, Async and Mirage

BUILD_DEPENDS+=  godi-cmdliner>=0.9.4:../../godi/godi-cmdliner
DEPENDS+=  godi-alcotest-*:../../godi/godi-alcotest
DEPENDS+=  godi-magic-mime-*:../../godi/godi-magic-mime
DEPENDS+=  godi-base64>=2.0.0:../../godi/godi-base64
DEPENDS+=  godi-conduit>=0.7.0:../../godi/godi-conduit
BUILD_DEPENDS+=  godi-ounit-*:../../godi/godi-ounit
BUILD_DEPENDS+=	 godi-findlib-*:../../godi/godi-findlib

DEPENDS+=	godi-re-*:../../godi/godi-re
DEPENDS+=	godi-fieldslib>=109.20.00:../../godi/godi-fieldslib
DEPENDS+=	godi-uri>=1.9.0:../../godi/godi-uri
DEPENDS+=	godi-sexplib>=109.53.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml>=4.01.0:../../godi/godi-ocaml
DEPENDS+= 	godi-lwt>=2.4:../../godi/godi-lwt
DEPENDS+= 	godi-stringext>=0:../../godi-stringext

WINOASIS=		yes
WINOASIS_DISABLE_TESTS=	yes

CONFIGURE_ARGS+=	--enable-lwt --disable-nettests --enable-lwt-unix

.include "../../mk/bsd.pkg.mk"

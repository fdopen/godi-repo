.include "../../mk/bsd.prefs.mk"

VERSION=	0.2.6
ONAME=		gapi-ocaml
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	gapi-ocaml-0.2.6
DISTFILES=	gapi-ocaml-0.2.6.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/1468/
HOMEPAGE=	http://gapi-ocaml.forge.ocamlcore.org
COMMENT=	A simple OCaml client for Google Services

DEPENDS+=	godi-extlib-*:../../godi/godi-extlib
DEPENDS+=	godi-xmlm-*:../../godi/godi-xmlm
DEPENDS+=	godi-curl-*:../../godi/godi-curl
DEPENDS+=	godi-yojson-*:../../godi/godi-yojson
DEPENDS+=	godi-cryptokit-*:../../godi/godi-cryptokit
DEPENDS+=	godi-ocamlnet-*:../../godi/godi-ocamlnet
DEPENDS+=	godi-ocaml>=3.12.0:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-pa_monad_custom-*:../../godi/godi-pa_monad_custom
BUILD_DEPENDS+= godi-ounit-*:../../godi/godi-ounit


WINOASIS=		yes

.include "../../mk/bsd.pkg.mk"

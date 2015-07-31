.include "../../mk/bsd.prefs.mk"

VERSION=	1.4.1
#INODE=		1152
PKG=		godi-csv
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	csv-1.4.1
DISTFILES=	csv-1.4.1.tar.gz
CATEGORIES=	godi
#MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/1376/
HOMEPAGE=	https://github.com/Chris00/ocaml-csv
COMMENT=	CSV library for OCaml

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib-*:../../godi/godi-findlib

WINOASIS=		yes
#WINOASIS_DISABLE_TESTS= undef
#WINOASIS_DISABLE_DOCS=	undef


.include "../../mk/bsd.pkg.mk"

.include "../../mk/bsd.prefs.mk"

VERSION=	1.3.0
INODE=		1152
PKG=		godi-csv
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	csv-1.3.0
DISTFILES=	csv-1.3.0.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/1172/
HOMEPAGE=	https://forge.ocamlcore.org/projects/csv/
COMMENT=	CSV library for OCaml

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml

BUILD_DEPENDS+=	godi-findlib-*:../../godi/godi-findlib

WINOASIS=		yes
WINOASIS_DISABLE_TESTS= undef
WINOASIS_DISABLE_DOCS=	undef


.include "../../mk/bsd.pkg.mk"

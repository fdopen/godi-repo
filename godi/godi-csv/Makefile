.include "../../mk/bsd.prefs.mk"

VERSION=	1.3.2
INODE=		1152
PKG=		godi-csv
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	csv-1.3.2
DISTFILES=	csv-1.3.2.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/1298/
HOMEPAGE=	https://forge.ocamlcore.org/projects/csv/
COMMENT=	CSV library for OCaml

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml

BUILD_DEPENDS+=	godi-findlib-*:../../godi/godi-findlib

WINOASIS=		yes
#WINOASIS_DISABLE_TESTS= undef
#WINOASIS_DISABLE_DOCS=	undef


.include "../../mk/bsd.pkg.mk"

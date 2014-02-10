.include "../../mk/bsd.prefs.mk"

VERSION=	20120615
PKG=		godi-getopt
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	ocaml-getopt
DISTFILES=	ocaml-getopt-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/896/
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=	https://forge.ocamlcore.org/projects/ocaml-getopt/
COMMENT=	Parsing of command line arguments

DEPENDS+=	godi-ocaml>=3.07:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib


WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

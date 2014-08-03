.include "../../mk/bsd.prefs.mk"

VERSION=        4.02beta
PKGREVISION=	0
PKGNAME=        godi-ocaml-manual-${VERSION}
DISTNAME=       htmlman
DISTFILES=      ocaml-4.02beta-refman-html.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://caml.inria.fr/pub/distrib/ocaml-4.02/
#MASTER_SITES=   http://www.ocaml-programming.de/godi-backup/
HOMEPAGE=       http://caml.inria.fr/
COMMENT=        The manual for OCaml

post-configure:
	cp files/Makefile ${WRKSRC}

post-install:
	mkdir -p ${LOCALBASE}/doc/godi-ocaml-manual/html
	cp -R ${WRKSRC}/* ${LOCALBASE}/doc/godi-ocaml-manual/html
	rm ${LOCALBASE}/doc/godi-ocaml-manual/html/Makefile

.include "../../mk/bsd.pkg.mk"

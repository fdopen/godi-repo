.include "../../mk/bsd.prefs.mk"

VERSION=        4.01
PKGREVISION=	0
PKGNAME=        godi-ocaml-manual-${VERSION}
DISTNAME=       htmlman
DISTFILES=      ocaml-${VERSION}-refman-html.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://caml.inria.fr/pub/distrib/ocaml-${VERSION}/
HOMEPAGE=       http://caml.inria.fr/
COMMENT=        The manual for OCaml

post-configure:
	cp files/Makefile ${WRKSRC}

post-install:
	mkdir -p ${LOCALBASE}/doc/godi-ocaml-manual/html
	cp -R ${WRKSRC}/* ${LOCALBASE}/doc/godi-ocaml-manual/html
	rm ${LOCALBASE}/doc/godi-ocaml-manual/html/Makefile

.include "../../mk/bsd.pkg.mk"

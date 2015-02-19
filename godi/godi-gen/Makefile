.include "../../mk/bsd.prefs.mk"

VERSION=	0.2.4
PKG=		godi-gen
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	gen-0.2.4
DISTFILES=	gen-0.2.4.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/c-cube/gen/
COMMENT=	Iterators for OCaml, both restartable and consumable.

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=1.1:../../godi/godi-ounit
BUILD_DEPENDS+= godi-qtest>=0:../../godi/godi-qtest

WINOASIS=		yes

post-build:
	${GMAKE} -C ${WRKSRC:Q} qtest

.include "../../mk/bsd.pkg.mk"

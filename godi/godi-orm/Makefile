.include "../../mk/bsd.prefs.mk"

VERSION=	0.7.0
ONAME=		orm
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	mirage-orm-2f3d980
DISTFILES=	orm-0.7.0.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	
COMMENT=	backend to persist ML values

DEPENDS+=  godi-dyntype>=0.9.0:../../godi/godi-dyntype
DEPENDS+=  godi-sqlite3-*:../../godi/godi-sqlite3
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4-*:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile>=0:../../godi/godi-ocamlmakefile

AUTOGENERATE_PLIST=	yes

post-extract:
	cp ${LOCALBASE}/share/OCamlMakefile ${WRKSRC}

pre-build:
	echo ${CAML_LD_LIBRARY_PATH_TEST}

post-install:
	${MKDIR}	${AUTOGENERATE_IMAGE:Q}/doc/${PKGBASE:Q}
.for f in LICENSE NEWS README.md TODO
	${INSTALL} -m 0644 ${WRKSRC}/${f} ${AUTOGENERATE_IMAGE:Q}/doc/${PKGBASE:Q}
.endfor




.include "../../mk/bsd.pkg.mk"

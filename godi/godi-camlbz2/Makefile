.include "../../mk/bsd.prefs.mk"

# This date was taken from the CHANGES file.
VERSION=	0.6.0
ONAME=		camlbz2
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}

PKGREVISION=	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi
FINODE=		72
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${FINODE}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://camlbz2.forge.ocamlcore.org/
COMMENT=	bzip2 bindings

PATH:=		${LOCALBASE}/bin:${PATH}

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+=	base-bzip2>=1:../../base/base-bzip2
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi-findlib
USE_GMAKE=	yes

ALL_TARGET=	all doc
MINGW_AUTOTOOLS_BUILD=yes

HAS_CONFIGURE=	yes
CONFIGURE_ARGS+= --prefix=${LOCALBASE} --docdir=${LOCALBASE}/doc/${PKG}
#CONFIGURE_ARGS+=--with-libdir=${LOCALBASE}/lib/ocaml/pkg-lib

CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV}
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}	PKGBASE=${PKGBASE:Q}

post-extract:
	@cp files/configure ${WRKSRC} 
	@chmod 0755 ${WRKSRC}/configure

post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKG}
	${MKDIR} ${LOCALBASE}/doc/${PKG}/html
.	for F in COPYING BUGS ChangeLog LICENSE README ROADMAP
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKG}
.	endfor
	cp ${WRKSRC}/doc/* ${LOCALBASE}/doc/${PKG}/html


.include "../../mk/bsd.pkg.mk"

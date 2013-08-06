.include "../../mk/bsd.prefs.mk"

VERSION= 	0.6
PKGNAME= 	godi-ocaml-text-${VERSION}
PKGREVISION= 	1
DISTNAME=	ocaml-text-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi
FINODE=		937
MASTER_SITES= 	http://forge.ocamlcore.org/frs/download.php/${FINODE}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocaml-text.forge.ocamlcore.org/
COMMENT=	A library dealing with text as sequence of unicode characters.

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
DEPENDS+=	godi-pcre>=6:../../godi/godi-pcre
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-libiconv>=0:../../base/base-libiconv
.endif

BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

pre-clean:
	${RM} -f patches/patch-win*

post-extract:
	${MKDIR} patches
	${CP} files/patch-win* patches

post-install:
	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/examples
	${CP} ${WRKSRC}/examples/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/examples

CONFIGURE_ARGS+=		--enable-pcre
WINOASIS=		 	yes
CONFIGURE_ENV+=			GODI_PREFIX=${LOCALBASE}


.include "../../mk/bsd.pkg.mk"

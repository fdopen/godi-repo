.include "../../mk/bsd.prefs.mk"

VERSION= 	0.7.1
PKGNAME= 	godi-ocaml-text-${VERSION}
PKGREVISION= 	0
DISTNAME=	ocaml-text-0.7.1
DISTFILES=	text-0.7.1.tar.gz
CATEGORIES=	godi
FINODE=		937
MASTER_SITES= 	${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocaml-text.forge.ocamlcore.org/
COMMENT=	A library dealing with text as sequence of unicode characters.

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4>0:../../godi/godi-camlp4
DEPENDS+=	godi-pcre>=6:../../godi/godi-pcre
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-win-iconv>=0:../../base/base-win-iconv
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

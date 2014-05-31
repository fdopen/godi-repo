.include "../../mk/bsd.prefs.mk"

VERSION=	1.2
PKGREVISION=	1
PKGNAME=	godi-inifiles-${VERSION}
DISTNAME=	inifiles-${VERSION}
DISTFILES=	inifiles-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES= http://homepage.mac.com/letaris/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://homepage.mac.com/letaris/
COMMENT=	ini format config file parsing

DEPENDS+=	godi-pcre>=5.03.3:../../godi/godi-pcre
DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile-[0-9]*:../../godi/godi-ocamlmakefile

WINGMAKE=	yes

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif
ALL_TARGET+=	htdoc

post-extract:
	cp ${LOCALBASE}/share/OCamlMakefile ${WRKSRC}

DOCUMENT_DIRS+=doc/inifiles/html

.include "../../mk/bsd.pkg.mk"

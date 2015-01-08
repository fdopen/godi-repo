.include "../../mk/bsd.prefs.mk"

VERSION= 	0.3.0
ONAME=		omonad
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tar.xz
CATEGORIES=	godi
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/yallop/omonad/
COMMENT=	Monad programming through ppx

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
DEPENDS+=	godi-ppx_tools>=0.99.1:../../godi/godi-ppx_tools
BUILD_DEPENDS+= godi-findlib>0:../../godi/godi-findlib

post-extract:
	@echo '# OASIS_START' > ${WRKSRC:Q}/_tags
	@echo '# OASIS_STOP' >> ${WRKSRC:Q}/_tags

WINOASIS=	yes
WINOASIS_SETUP= yes

.include "../../mk/bsd.pkg.mk"

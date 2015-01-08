.include "../../mk/bsd.prefs.mk"

VERSION= 	1.0.0
ONAME=		ppx_overload
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	compiler-libs-hack-${VERSION}
DISTFILES=	compiler-libs-hack-${VERSION}.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://bitbucket.org/camlspotter/compiler-libs-hack/
COMMENT=	SML style simple but user definable overloading

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
DEPENDS+=	godi-ppx_tools>=0.99.1:../../godi/godi-ppx_tools
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake

WINGMAKE=	yes
ALL_TARGET=	-C ppx default
MAKE_FLAGS+=	BINDIR=${PREFIX:Q}/bin

.include "../../mk/bsd.pkg.mk"

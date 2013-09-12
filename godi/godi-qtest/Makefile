.include "../../mk/bsd.prefs.mk"

VERSION=	2.0.1
PKG=		godi-qtest
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	iTeML-${VERSION}/qtest
DISTFILES=	v${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://github.com/vincent-hugot/iTeML/archive/
HOMEPAGE=	http://batteries.vhugot.com/qtest/
COMMENT=	Quick Unit Tests for OCaml


BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+=	godi-ocaml>3.12.0:../../godi/godi-ocaml
DEPENDS+=	godi-ounit>=1.1:../../godi/godi-ounit

WINOASIS=	 yes
WINOASIS_SETUP=	 yes
WINOASIS_DISABLE_TESTS= undef
WINOASIS_DISABLE_DOCS=  undef


.include "../../mk/bsd.pkg.mk"

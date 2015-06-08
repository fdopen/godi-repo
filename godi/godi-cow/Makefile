.include "../../mk/bsd.prefs.mk"

VERSION=	1.2.1
ONAME=		cow
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-cow-1.2.1
DISTFILES=	cow-1.2.1.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/mirage/ocaml-cow
COMMENT=	XML, JSON, HTML, CSS, and Markdown syntax and libraries

DEPENDS+=  godi-dyntype>=0.9.0:../../godi/godi-dyntype
DEPENDS+=  godi-ezjsonm>=0.4.0:../../godi/godi-ezjsonm
DEPENDS+=  godi-xmlm>=1.1.1:../../godi/godi-xmlm
DEPENDS+=  godi-camlp4-*:../../godi/godi-camlp4
DEPENDS+=  godi-re-*:../../godi/godi-re
DEPENDS+=  godi-omd>=0.8.2:../../godi/godi-omd
BUILD_DEPENDS+=  godi-ounit-*:../../godi/godi-ounit
DEPENDS+=  godi-type_conv>=108.07.00:../../godi/godi-type_conv
DEPENDS+=  godi-uri>=1.3.9:../../godi/godi-uri
DEPENDS+=  godi-ulex-*:../../godi/godi-ulex
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINGMAKE=	yes

.include "../../mk/bsd.pkg.mk"

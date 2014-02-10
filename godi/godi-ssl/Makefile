.include "../../mk/bsd.prefs.mk"

VERSION=	0.4.6
PKGREVISION=	0
PKGNAME=	godi-ssl-${VERSION}
DISTNAME=	ocaml-ssl-${VERSION}
DISTFILES=	ocaml-ssl-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://downloads.sourceforge.net/project/savonet/ocaml-ssl/0.4.6/
MAINTAINER=	jmaloberti@gmail.com
HOMEPAGE=	http://savonet.sourceforge.net/
COMMENT=	The Secure Socket Layer

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile>=6.10.0:../../godi/godi-ocamlmakefile

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-ssl>=0:../../base/base-ssl
.endif

MINGW_AUTOTOOLS_BUILD=yes

PATH:=		${LOCALBASE}/bin:${PATH}

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

#MAKE_FLAGS+=    "OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile"
# 2007-08-05: Commenting out MAKE_FLAGS since the shared
# OCamlMakefile doesn't work. (Gerd Stolpmann <gerd@gerd-stolpmann.de>)

HAS_CONFIGURE=  yes
USE_GMAKE=	yes

.include "../../mk/bsd.pkg.mk"

.include "../../mk/bsd.prefs.mk"

VERSION=	0.4.7
PKGREVISION=	0
PKGNAME=	godi-ssl-${VERSION}
DISTNAME=	ocaml-ssl-${VERSION}
DISTFILES=	ocaml-ssl-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=savonet/}
HOMEPAGE=	http://savonet.sourceforge.net/
COMMENT=	The Secure Socket Layer

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile>=6.10.0:../../godi/godi-ocamlmakefile

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-ssl>=0:../../base/base-ssl
LDFLAGS+= -lcrypto -lws2_32 -lgdi32 -lcrypt32
.endif

WINGMAKE=	yes
MINGW_AUTOTOOLS_BUILD=yes
HAS_CONFIGURE=  yes

# 2007-08-05: Commenting out MAKE_FLAGS since the shared
# OCamlMakefile doesn't work. (Gerd Stolpmann <gerd@gerd-stolpmann.de>)
MAKE_FLAGS+=    "OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile"

WINGMAKE_HTML_DIR= doc/html


.include "../../mk/bsd.pkg.mk"

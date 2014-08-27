.include "../../mk/bsd.prefs.mk"

VERSION=	3.7.5alpha
PKGREVISION=	0
PKGNAME=	godi-ocamlnet-${VERSION}
DISTNAME=	ocamlnet-${VERSION}
DISTFILES=	ocamlnet-${VERSION}.tar.xz
CATEGORIES=	godi
MASTER_SITES=	http://download.camlcity.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://projects.camlcity.org/projects/ocamlnet.html
COMMENT=	base library for network protocols


DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+=       godi-cryptgps>=0.2.1:../../godi/godi-cryptgps
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
#BUILD_DEPENDS+= godi-camlp4>=0:../../godi/godi-camlp4

# godi-tools-1.6 is the first version that processes CONFLICTS
# correctly. By requiring it we are sure...
# THIS DOES NOT WORK! Would introduce the circular dependency
# ocamlnet --> tools --> equeue --> ocamlnet
# BUILD_DEPENDS+= godi-tools>=1.6:../../godi/godi-tools


.ifdef GODI_CONSOLE_SUPPORTS_CONFLICTS
CONFLICTS=	godi-equeue<2.2
CONFLICTS+=	godi-netclient<2.2
CONFLICTS+=	godi-rpc<2.2
.endif

WINGMAKE=	yes
HAS_CONFIGURE=	yes
CONFIGURE_ARGS+=-bindir ${LOCALBASE:Q}/bin
CONFIGURE_ARGS+=-datadir ${LOCALBASE_NATIVE:Q}/share/godi-ocamlnet
CONFIGURE_ARGS+=-disable-pcre
CONFIGURE_ARGS+=-disable-full-pcre
CONFIGURE_ARGS+=-disable-gtk
CONFIGURE_ARGS+=-disable-gtk2
CONFIGURE_ARGS+=-disable-tcl
CONFIGURE_ARGS+=-disable-ssl
CONFIGURE_ARGS+=-disable-zip
CONFIGURE_ARGS+=-disable-crypto
CONFIGURE_ARGS+=-disable-apache
CONFIGURE_ARGS+=-without-nethttpd
CONFIGURE_ARGS+=-without-rpc-auth-dh

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

.if defined(W32PORT) && ${W32PORT} == "mingw"
.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
CONFIGURE_ARGS+=-cpp ${MINGW_TOOL_PREFIX}cpp.exe
.endif
.endif

post-extract:
	${RM} -f ${WRKSRC:Q}/src/netsys/unixsupport_w32.c

post-install:
	cd ${WRKSRC:Q} && ${PAX} -rw -pp examples ${PREFIX:Q}/doc/godi-ocamlnet

.include "../../mk/bsd.pkg.mk"

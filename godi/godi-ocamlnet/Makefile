.include "../../mk/bsd.prefs.mk"

VERSION=	3.7.3
PKGREVISION=	0
PKGNAME=	godi-ocamlnet-${VERSION}
DISTNAME=	ocamlnet-${VERSION}
DISTFILES=	ocamlnet-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://download.camlcity.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://projects.camlcity.org/projects/ocamlnet.html
COMMENT=	base library for network protocols

# Basically, you can set this still to "no". However, in this case
# there will be an install conflict with godi-ocamlnet-pcre. Not
# recommended.
GODI_OCAMLNET_NO_PCRE ?= yes

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+=       godi-cryptgps>=0.2.1:../../godi/godi-cryptgps
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

.if ${GODI_OCAMLNET_NO_PCRE} != "yes"
DEPENDS+=	godi-pcre>=5:../../godi/godi-pcre
.endif

# godi-tools-1.6 is the first version that processes CONFLICTS
# correctly. By requiring it we are sure...
# THIS DOES NOT WORK! Would introduce the circular dependency
# ocamlnet --> tools --> equeue --> ocamlnet
# BUILD_DEPENDS+= godi-tools>=1.6:../../godi/godi-tools

# TODO: -prefer-netcgi

.ifdef GODI_CONSOLE_SUPPORTS_CONFLICTS
CONFLICTS=	godi-equeue<2.2
CONFLICTS+=	godi-netclient<2.2
CONFLICTS+=	godi-rpc<2.2
.endif

PATH:=		${LOCALBASE}/bin:${PATH}

HAS_CONFIGURE=	yes
CONFIGURE_ARGS+=-bindir "${LOCALBASE}/bin"
CONFIGURE_ARGS+=-datadir ${LOCALBASE_NATIVE}/share/godi-ocamlnet
CONFIGURE_ARGS+=-with-nethttpd -with-rpc-auth-dh

.if ${GODI_OCAMLNET_NO_PCRE} != "yes"
CONFIGURE_ARGS+=-enable-pcre
.endif

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

.if defined(W32PORT) && ${W32PORT} == "mingw"
pre-clean:
	${RM} -f patches/patch-win*
post-extract:
	${CP} files/patch-win* patches

.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
CONFIGURE_ARGS+=-cpp ${MINGW_TOOL_PREFIX}cpp
.endif
.endif


pre-install:
	${MKDIR} ${PREFIX}/lib/ocaml/pkg-lib/stublibs

post-install:
	mkdir -p ${PREFIX}/doc/godi-ocamlnet
.	for F in LICENSE LICENSE.GPL LICENSE.LGPL INSTALL ChangeLog RELNOTES
	    cp ${WRKSRC}/${F} ${PREFIX}/doc/godi-ocamlnet
.	endfor
	cp -R ${WRKSRC}/doc/html-main ${PREFIX}/doc/godi-ocamlnet/html
	cp -R ${WRKSRC}/examples ${PREFIX}/doc/godi-ocamlnet

.include "../../mk/bsd.pkg.mk"

.include "../../mk/bsd.prefs.mk"

VERSION=	3.7.4
PKGNAME=	godi-ocamlnet-ssl-${VERSION}
PKGREVISION=	0
DISTNAME=	ocamlnet-${VERSION}
DISTFILES=	ocamlnet-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://download.camlcity.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://projects.camlcity.org/projects/ocamlnet.html
COMMENT=	SSL extension for ocamlnet

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
DEPENDS+=	godi-ssl>=0:../../godi/godi-ssl
DEPENDS+=	godi-ocamlnet==${VERSION}:../../godi/godi-ocamlnet

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-camlp4>=0:../../godi/godi-camlp4

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-disable-core
CONFIGURE_ARGS+=-enable-ssl

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

MAKE_FLAGS+= "INC_NETSYS=-package netsys"
MAKE_FLAGS+= "INC_NETSTRING=-package netstring"
MAKE_FLAGS+= "INC_EQUEUE=-package equeue"
MAKE_FLAGS+= "INC_NETCGI2=-package netcgi2"
MAKE_FLAGS+= "INC_NETPLEX=-package netplex"
MAKE_FLAGS+= "INC_NETCAMLBOX=-package netcamlbox"
MAKE_FLAGS+= "INC_RPC=-package rpc"
MAKE_FLAGS+= "INC_SHELL=-package shell"
MAKE_FLAGS+= "INC_NETGSSAPI=-package netgssapi"

.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
CONFIGURE_ARGS+=-cpp ${MINGW_TOOL_PREFIX}cpp
.endif

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-ssl>=0:../../base/base-ssl
pre-clean:
	${RM} -f patches/patch-win*

post-extract:
	${CP} files/patch-win* patches
.endif

post-install:
	${MKDIR} ${PREFIX}/doc/godi-ocamlnet-ssl
	cd ${WRKSRC} && \
	${CP} LICENSE ${PREFIX}/doc/godi-ocamlnet-ssl
	${ECHO} "See package godi-ocamlnet for further documentation." \
		>${PREFIX}/doc/godi-ocamlnet-ssl/README.GODI


.include "../../mk/bsd.pkg.mk"

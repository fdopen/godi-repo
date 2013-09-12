.include "../../mk/bsd.prefs.mk"

VERSION=6.11
NAME=camlp5
PKGNAME=godi-${NAME}-${VERSION}
PKGREVISION=0
DISTNAME=${NAME}-${VERSION}
DISTFILES=${DISTNAME}.tgz
CATEGORIES=godi
MASTER_SITES=http://pauillac.inria.fr/~ddr/camlp5/distrib/src/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=http://pauillac.inria.fr/~ddr/camlp5/
COMMENT=pre-processor-pretty-printer for ocaml

HAS_CONFIGURE=yes

#CONFIGURE_ARGS=--transitional
USE_GMAKE=yes

.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET= world.opt
.else
ALL_TARGET= world
.endif

DEPENDS+=godi-ocaml>=3.08:../godi-ocaml

.include "../../mk/bsd.pkg.mk"

.include "../../mk/bsd.prefs.mk"

VERSION=20140301
VERSIONNAME=Neon
PKG=apps-frama-c
PKGNAME=        ${PKG}-${VERSION}
DISTNAME=       frama-c-${VERSIONNAME}-${VERSION}
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     apps
MASTER_SITES=   http://frama-c.com/download/
MAINTAINER=     Virgile Prevosto <virgile.prevosto@m4x.org>
HOMEPAGE=       http://frama-c.com/
COMMENT=        Framework for analysis of C programs


DEPENDS+=       godi-ocaml>=3.08:../../godi/godi-ocaml
DEPENDS+=       godi-lablgtk2>=20051028:../../godi/godi-lablgtk2
DEPENDS+=       apps-coq>=8.4:../apps-coq
DEPENDS+=       apps-alt-ergo>=0.9.4:../apps-altergo
DEPENDS+=       godi-ocamlgraph>=1.8.5:../../godi/godi-ocamlgraph
DEPENDS+=       godi-zarith>=1.2.1:../../godi/godi-zarith
USE_GMAKE=      yes

HAS_CONFIGURE=   yes
CONFIGURE_ARGS+= --prefix ${LOCALBASE_NATIVE}


.include "../../mk/bsd.pkg.mk"

.include "../../mk/bsd.prefs.mk"

# PLEASE NO "-" IN VERSION STRINGS! IT BADLY BREAKS THE GODI SERVER! [gs]

MAJOR_VERSION=8.4
MINOR_VERSION=3
VERSION=        ${MAJOR_VERSION}.${MINOR_VERSION}
DVERSION=	${MAJOR_VERSION}pl${MINOR_VERSION}
PKG=            apps-coq
PKGREVISION=
PKGNAME=        ${PKG}-${VERSION}
DISTNAME=       coq-${DVERSION}
DISTFILES=      coq-${DVERSION}.tar.gz
CATEGORIES=     apps
MASTER_SITES=   http://coq.inria.fr/distrib/V${DVERSION}/files/
MAINTAINER=     Virgile Prevosto <virgile.prevosto@m4x.org>
HOMEPAGE=       http://coq.inria.fr
COMMENT=        Interactive proof assistant

CONF_COQ_WITH_IDE?=yes
#CONF_COQ_DOCUMENTATION?=yes

DEPENDS+=       godi-ocaml>=3.08:../../godi/godi-ocaml

.if ${GODI_HAVE_OCAMLOPT} == "yes"
CONFIGURE_ARGS+= -opt
COQIDE_BUILD=opt
.else
COQIDE_BUILD=byte
.endif

CONFIGURE_ARGS+= -debug

#.if ${CONF_COQ_DOCUMENTATION} == "yes"
#DEPENDS+= apps-hevea>=1.05:../../apps/apps-hevea
#.else
CONFIGURE_ARGS+= -with-doc no
#.endif

.if ${CONF_COQ_WITH_IDE} == "yes"
DEPENDS+=       godi-lablgtk2>=20051028:../../godi/godi-lablgtk2
CONFIGURE_ARGS+= -coqide ${COQIDE_BUILD}
.else
CONFIGURE_ARGS+= -coqide no
.endif

DEPENDS+=	godi-camlp5>=5.01:../../godi/godi-camlp5

USE_GMAKE=      yes

HAS_CONFIGURE=   yes
CONFIGURE_ARGS+= --prefix `cygpath -m ${PREFIX}`
CONFIGURE_ARGS+= --emacslib ${PREFIX}/share/emacs/site-lisp
CONFIGURE_ARGS+= --coqdocdir ${PREFIX}/share/texmf/tex/latex/misc
CONFIGURE_ARGS+= --libdir `cygpath -m ${PREFIX}/lib/coq`

ALL_TARGET=      world

#post-extract:
#	${CP} files/undo_lablgtk_ge212.mli ${WRKSRC}/ide

#post-patch:
#	${RM} ${WRKSRC}/contrib/dp/*.orig

post-install:
	${MKDIR} ${LOCALBASE}/doc/apps-coq
.	for F in LICENSE COPYRIGHT CREDITS
	  ${CP} ${WRKSRC}/${F} ${LOCALBASE}/doc/apps-coq
.	endfor

.include "../../mk/bsd.pkg.mk"

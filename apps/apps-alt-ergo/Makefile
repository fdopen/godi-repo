.include "../../mk/bsd.prefs.mk"


VERSION=        0.9.4

PKGREVISION=
PKGNAME=        apps-alt-ergo-${VERSION}
DISTNAME=       alt-ergo-0.94
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     apps
MASTER_SITES=   http://alt-ergo.lri.fr/http/${DISTNAME}/
MAINTAINER=     Virgile Prevosto <virgile.prevosto@m4x.org>
HOMEPAGE=       http://alt-ergo.lri.fr
COMMENT=        Automated first-order theorem prover

PKG=            apps-alt-ergo

DEPENDS+=       godi-ocaml>=3.08:../../godi/godi-ocaml
DEPENDS+=       godi-ocamlgraph>=0.95:../../godi/godi-ocamlgraph
USE_GMAKE=      yes

GNU_CONFIGURE=   yes

CONF_ALTERGO_ENABLE_GUI?=auto

# remove any existing archive of alt-ergo 0.8, as it has silently changed
# without version number update...
#pre-fetch:
#	${RM} -f ${DISTDIR}/${DISTFILES}


.if ${CONF_ALTERGO_ENABLE_GUI} == "yes"
DEPENDS+=godi-lablgtk2>=20090925:../../godi/godi-lablgtk2
ALL_TARGET=all gui
INSTALL_TARGET=install install-gui
.endif

.if ${CONF_ALTERGO_ENABLE_GUI} == "auto"
DEPENDS+=godi-lablgtk2>=20090925:../../godi/godi-lablgtk2
ALL_TARGET=all gui
INSTALL_TARGET=install install-gui
.endif

preconfigure:
.  if ${CONF_ALTERGO_ENABLE_GUI} == "yes"
	@if ${GODI_LABLGTK2_USE_SOURCEVIEW2} != "yes"; then \
	  ${ECHO} \
	    "Alt-ergo GUI needs gtksourceview2, but lablgtk2 has not been \
compiled against it. It is likely that this is because your system does not \
have gtksourceview2 headers and/or library. In order to be able to compile \
Alt-ergo GUI, please do the following steps:"; \
	  ${ECHO} "1 - Install gtksourceview library and headers."; \
	  ${ECHO} "This step is system-dependent."; \
	  ${ECHO} "e.g. apt-get install libgtksourceview2-dev (Debian/Ubuntu)"; \
          ${ECHO} "or emerge gtksourceview2 (Gentoo)"; \
          ${ECHO} "2 - Add godi-lablgtk2 to the list of packages"; \
          ${ECHO} "  godi_console wish -build godi-lablgtk2"; \
	  ${ECHO} "3 - Ask godi to proceed with the installation"; \
	  ${ECHO} "  godi_console perform -wishes"; \
	  exit 2; \
	fi
.  endif

.include "../../mk/bsd.pkg.mk"

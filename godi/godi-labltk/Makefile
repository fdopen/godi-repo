.include "../../mk/bsd.prefs.mk"

VERSION=	4.02beta1
ONAME=		labltk
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	${ONAME}-4.02-beta1
DISTFILES=	${ONAME}-4.02-beta1.tar.gz
CATEGORIES=	godi
MNODE=		1409
MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/${MNODE}/
HOMEPAGE=	https://forge.ocamlcore.org/projects/labltk/
COMMENT=	LablTk is an interface to the Tcl/Tk GUI framework

DEPENDS+=	godi-ocaml>=4.02:../../godi/godi-ocaml
DEPENDS+=	base-tcltk>=8.6:../../base/base-tcltk
DEPENDS+=	base-tcltk<8.7:../../base/base-tcltk

MAKEFILE=	${WRKSRC:Q}/Makefile.nt


.if defined(W32PORT) && ${W32PORT} == "mingw"
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}
.endif


do-configure:
	@${ECHO} "WHERE=${LOCALBASE}/lib/ocaml/std-lib" > ${WRKSRC:Q}/config/Makefile
	@${ECHO} "include ${LOCALBASE}/lib/ocaml/std-lib/Makefile.config" >> ${WRKSRC:Q}/config/Makefile
	@${ECHO} "TK_DEFS=-I${LOCALBASE}/include" >> ${WRKSRC:Q}/config/Makefile
	@${ECHO} "TK_LINK=-lws2_32 ${LOCALBASE}/lib/libtcl86.dll.a ${LOCALBASE}/lib/libtk86.a" >> ${WRKSRC:Q}/config/Makefile

ALL_TARGET= all allopt
INSTALL_TARGET=	install installopt

post-install:
	@${MKDIR} ${LOCALBASE:Q}/lib/ocaml/pkg-lib/labltk
	@${INSTALL} -m 0644 ${PKGDIR:Q}/files/META ${LOCALBASE:Q}/lib/ocaml/pkg-lib/labltk
	@${MKDIR} ${LOCALBASE:Q}/doc/${PKGBASE:Q}
.for f in Changes README.mlTk
	@${INSTALL} -m 0644 ${WRKSRC:Q}/${f:Q} ${LOCALBASE:Q}/doc/${PKGBASE:Q}
.endfor
	@${MKDIR} ${LOCALBASE:Q}/doc/${PKGBASE:Q}/examples
	@cd ${WRKSRC:Q}/examples_labltk && ${PAX} -rw -pp . ${LOCALBASE:Q}/doc/${PKGBASE:Q}/examples
.if defined(W32PORT) && ${W32PORT} == "mingw"
	@${SETENV} ${ADD_ENV} bash files/install --add-links
.endif


.include "../../mk/bsd.pkg.mk"

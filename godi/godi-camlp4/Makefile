.include "../../mk/bsd.prefs.mk"

VERSION=	4.02.0beta3
PKGNAME=	godi-camlp4-${VERSION}
PKGREVISION=    0
DISTNAME=	camlp4-4.02
DISTFILES=	camlp4-${VERSION}.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/ocaml/camlp4
COMMENT=	Caml Preprocessor and Pretty-Printer

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
#BUILD_DEPENDS+= godi-findlib>=1:../../godi/godi-findlib

HAS_CONFIGURE=	yes

ALL_TARGET=	all camlp4/META

.if defined(W32PORT) && ${W32PORT} == "mingw"
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}
.endif

# post-install:
# 	${MKDIR} ${LOCALBASE:Q}/doc/${PKGBASE:Q}
#.for f in CHANGES.md LICENSE README.md
# 	${INSTALL} -m 0444 ${WRKSRC:Q}/${f:Q} ${LOCALBASE:Q}/doc/${PKGBASE:Q}
# .endfor
# 	${MKDIR} ${LOCALBASE:Q}/lib/ocaml/pkg-lib/camlp4
# 	${ECHO} 'directory = "+camlp4"' >${LOCALBASE:Q}/lib/ocaml/pkg-lib/camlp4/META
# 	cd ${LOCALBASE:Q}/lib/ocaml/site-lib && \
# 	  ${CAT} camlp4/META >> ${LOCALBASE:Q}/lib/ocaml/pkg-lib/camlp4/META && \
# 	  ${RM} camlp4/META && \
# 	  ${MV} camlp4 ${LOCALBASE:Q}/lib/ocaml/std-lib
# .if defined(W32PORT) && ${W32PORT} == "mingw"
# 	@${SETENV} ${ADD_ENV} bash files/install --add-links
# .endif
# 	${RM} ${LOCALBASE:Q}/bin/camlp4boot
#${INSTALL} -m 0444 ${WRKSRC:Q}/camlp4/META ${LOCALBASE:Q}/lib/ocaml/pkg-lib/camlp4

post-install:
	${RM} ${LOCALBASE:Q}/bin/camlp4boot
	${MKDIR} ${LOCALBASE:Q}/doc/${PKGBASE:Q}
.for f in CHANGES.md LICENSE README.md
	${INSTALL} -m 0444 ${WRKSRC:Q}/${f:Q} ${LOCALBASE:Q}/doc/${PKGBASE:Q}
.endfor
	${MKDIR} ${LOCALBASE:Q}/lib/ocaml/pkg-lib/camlp4
	${INSTALL} -m 0444 ${WRKSRC:Q}/camlp4/META ${LOCALBASE:Q}/lib/ocaml/pkg-lib/camlp4
.if defined(W32PORT) && ${W32PORT} == "mingw"
	@${SETENV} ${ADD_ENV} bash files/install --add-links
.endif


.include "../../mk/bsd.pkg.mk"

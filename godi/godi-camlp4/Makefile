.include "../../mk/bsd.prefs.mk"

VERSION=	0.0.2
PKGNAME=	godi-camlp4-${VERSION}
PKGREVISION=    2
DISTNAME=	camlp4-trunk
DISTFILES=	camlp4-${VERSION}.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/ocaml/camlp4
COMMENT=	Caml Preprocessor and Pretty-Printer

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml

HAS_CONFIGURE=	yes

ALL_TARGET=	all camlp4/META

.if defined(W32PORT) && ${W32PORT} == "mingw"
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}
.endif

post-install:
	${RM} ${LOCALBASE:Q}/bin/camlp4boot
	${MKDIR} ${LOCALBASE:Q}/doc/${PKGBASE:Q}
.for f in Changes LICENSE README.md
	${INSTALL} -m 0444 ${WRKSRC:Q}/${f:Q} ${LOCALBASE:Q}/doc/${PKGBASE:Q}
.endfor
	${MKDIR} ${LOCALBASE:Q}/lib/ocaml/pkg-lib/camlp4
	${INSTALL} -m 0444 ${WRKSRC:Q}/camlp4/META ${LOCALBASE:Q}/lib/ocaml/pkg-lib/camlp4
.if defined(W32PORT) && ${W32PORT} == "mingw"
	@${SETENV} ${ADD_ENV} bash files/install --add-links
.endif

.include "../../mk/bsd.pkg.mk"

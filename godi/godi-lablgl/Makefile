.include "../../mk/bsd.prefs.mk"

GODI_PLIST=	yes

VERSION=	1.05
MNODE=		1254
PKGNAME=	godi-lablgl-${VERSION}
PKGREVISION=	0
DISTNAME=	lablGL
DISTFILES=	lablgl-20120306.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${MNODE}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/lablgl.html
COMMENT=	OpenGL interface

DEPENDS+=	godi-ocaml>=3.05:../../godi/godi-ocaml
DEPENDS+= 	base-freeglut>=0:../../base/base-freeglut
#DEPENDS+=	base-tcltk>=0:../../base/base-tcltk
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi-findlib
BUILD_DEPENDS+= godi-camlp4>=0:../../godi-camlp4

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

CFLAGS +=-DWIN32

ALL_TARGET=	glut lib
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=    glutopt libopt
.endif

pre-configure:
.if !defined(W32PORT) || ${W32PORT} != "mingw"
	@echo "*********************************************"
	@echo "*** lablgl   is only available for mingw  ***"
	@echo "*********************************************"
	@false
.else
	cp files/Makefile.config ${WRKSRC}
.endif


post-install:
	${MKDIR} ${LOCALBASE}/doc/godi-lablgl
.	for F in CHANGES COPYRIGHT README
	    ${CP} ${WRKSRC}/${F} ${LOCALBASE}/doc/godi-lablgl
.	endfor
	${MKDIR} ${LOCALBASE}/doc/godi-lablgl/examples
	${MKDIR} ${LOCALBASE}/doc/godi-lablgl/examples/Togl
	${CP} ${WRKSRC}/Togl/examples/* ${LOCALBASE}/doc/godi-lablgl/examples/Togl
	${MKDIR} ${LOCALBASE}/doc/godi-lablgl/examples/LablGlut
	( cd ${WRKSRC}/LablGlut/examples && ${PAX} -rw -p am * ${LOCALBASE}/doc/godi-lablgl/examples/LablGlut )
	${CP} files/META ${LOCALBASE}/lib/ocaml/pkg-lib/lablGL
#${RM} -f ${LOCALBASE}/lib/ocaml/std-lib/lablGL
#${LN} -s ${LOCALBASE}/lib/ocaml/pkg-lib/lablGL ${LOCALBASE}/lib/ocaml/std-lib/lablGL

.include "../../mk/bsd.pkg.mk"

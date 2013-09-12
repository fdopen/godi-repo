.include "../../mk/bsd.prefs.mk"

VERSION= 	0.7.3
PKG=		godi-magic
PKGNAME= 	${PKG}-${VERSION}
PKGREVISION= 	0
DISTNAME=	ocaml-magic-${VERSION}
DISTFILES=	ocaml-magic-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES= 	http://downloads.sourceforge.net/project/ocaml-magic/ocaml-magic/0.7/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://sourceforge.net/projects/ocaml-magic/
COMMENT=	binding for libmagic

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile>=0:../../godi/godi-ocamlmakefile

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${LOCALBASE}
CONFIGURE_ARGS+=--docdir=${LOCALBASE}/doc/${PKG}
CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV}

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}


USE_GMAKE=	yes
INSTALL_TARGET= install
ALL_TARGET=	byte
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif
ALL_TARGET+=	doc

MAKE_FLAGS+=    "OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile"


.if !defined(W32PORT) || ${W32PORT} == "cygwin" 
BUILD_DEPENDS+= conf-magic>=0:../../conf/conf-magic
.if exists(${LOCALBASE}/lib/godi/conf-magic.mk)
.include "${LOCALBASE}/lib/godi/conf-magic.mk"
.endif

.if ${CONF_MAGIC_INCDIR} != "/usr/include" && ${CONF_MAGIC_INCDIR} != ""
CFLAGS+=-I${CONF_MAGIC_INCDIR}
.endif

.if ${CONF_MAGIC_LIBDIR} != "/usr/lib" && ${CONF_MAGIC_LIBDIR} != ""
LDFLAGS+=-L${CONF_MAGIC_LIBDIR}
.if ${CONF_MAGIC_NEED_RPATH} == "yes"
LDFLAGS+=-Wl,${ELF_RPATH_FLAG}${CONF_MAGIC_NEED_RPATH}
.endif
.endif

.else
DEPENDS+= base-magic>=0:../../base/base-magic

.endif



post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKG}
.	for DOC in LICENSE ChangeLog README
	    install -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKG}/${DOC}
.	endfor
	cd ${WRKSRC:Q}/doc && ${PAX} -rw -pp html ${PREFIX}/doc/${PKG}

.include "../../mk/bsd.pkg.mk"

# This file was automatically generated by godiva version 0.9.7
.include "../../mk/bsd.prefs.mk"

VERSION=        1.0.9
PKGNAME=        godi-biniou-${VERSION}
PKGREVISION=    0
DISTNAME=       biniou-${VERSION}
DISTFILES=      biniou-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/biniou
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://mjambon.com/biniou.html
COMMENT=        Flexible binary data format

# confopt defaults:


AUTOGENERATE_PLIST = yes
PKG  =          godi-biniou
MAKE_FLAGS=     PREFIX=${PREFIX} LIBDIR=${PREFIX}/lib BINDIR=${PREFIX}/bin MANDIR=${PREFIX}/man 
DEPENDS+= godi-ocaml-[0-9]*:../../godi/godi-ocaml
DEPENDS+= godi-easy-format-[0-9]*:../../godi/godi-easy-format
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

# HAS_CONFIGURE = yes

USE_GMAKE = yes

MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

pre-configure-copy:
.	if exists(files)
	    cd files && ${PAX} -rw -pp . ${WRKSRC}
.	endif

pre-configure: pre-configure-copy

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+= opt
.endif
ALL_TARGET+= test

post-install:
	mkdir -p ${PREFIX}/doc/${PKG}
.	for DOC in LICENSE
	    if [ -d ${WRKSRC}/${DOC} ]; then cd ${WRKSRC} && ${PAX} -rw -pp ${DOC} ${PREFIX}/doc/${PKG}; else install -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKG}; fi
.	endfor

.include "../../mk/bsd.pkg.mk"

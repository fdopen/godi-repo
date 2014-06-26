.include "../../mk/bsd.prefs.mk"

GODI_FINDLIB_TOOLBOX?=  no

VERSION=	1.5.1
PKGNAME=	godi-findlib-${VERSION}
PKGREVISION=	0
DISTNAME=	findlib-${VERSION}
CATEGORIES=	godi
MASTER_SITES=	http://download.camlcity.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://projects.camlcity.org/projects/findlib.html
COMMENT=	The findlib/ocamlfind package manager

#BUILD_DEPENDS+= godi-ocaml-src-*:../../godi/godi-ocaml-src
DEPENDS+=       godi-ocaml>=3.07:../../godi/godi-ocaml

# Adjust PATH such that version of godi is prepended. This has
# only an effect on commands where PATH is explicitly passed (e.g.
# configure).
PATH:=		${LOCALBASE}/bin:${PATH}

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-bindir ${LOCALBASE_NATIVE}/bin \
		-mandir ${LOCALBASE_NATIVE}/man \
		-sitelib ${LOCALBASE_NATIVE}/lib/ocaml/pkg-lib \
		-config ${LOCALBASE_NATIVE}/etc/findlib.conf

EXEC_SUFFIX=

# bash has problems with CRLF, but ash does it as intended:
.ifdef W32PORT
CONFIGURE_SCRIPT=dash configure
EXEC_SUFFIX=.exe
.endif

USE_GMAKE=	yes

GODI_FINDLIB_TOOLBOX?=no

.if ${GODI_FINDLIB_TOOLBOX} == "yes"
DEPENDS+=	godi-ocaml-labltk-*:../../godi/godi-ocaml-labltk
CONFIGURE_ARGS+=-with-toolbox
.endif

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif


.if defined(W32PORT) && ${W32PORT} == "mingw"
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
pre-clean:
	${RM} -f patches/patch-win*
post-extract:
	${CP} files/patch-win* patches
.endif

# TODO: pre-configure: make interfaces-list
post-configure:
	@# Delete META files of packages not to install
.if !defined(W32PORT) && ${W32PORT} != "mingw"
	rm -f ${WRKSRC:Q}/site-lib-src/graphics/META
	rm -f ${WRKSRC:Q}/site-lib-src/labltk/META
.endif
	rm -f ${WRKSRC:Q}/site-lib-src/dbm/META
	${SED} -i 's|\(^PARTS.*\)bytes\(.*\)$$|\1\2|' ${WRKSRC:Q}/Makefile.config
SEP=	:
.if ${OPSYS:MCYGWIN*} != ""
SEP=	;
.endif


LOCALBASE_NATIVE?=${LOCALBASE}

post-build:
        # Replace findlib.conf
	echo "destdir=\"${LOCALBASE_NATIVE}/lib/ocaml/site-lib\"" \
		>work/${DISTNAME}/findlib.conf
	echo "path=\"${LOCALBASE_NATIVE}/lib/ocaml/pkg-lib${SEP}${LOCALBASE_NATIVE}/lib/ocaml/site-lib\"" \
		>>work/${DISTNAME}/findlib.conf
.	if ${GODI_HAVE_OCAMLOPT} == "yes"
	    echo "ocamlc=\"ocamlc.opt${EXEC_SUFFIX}\"" \
		>>work/${DISTNAME}/findlib.conf
	    echo "ocamlopt=\"ocamlopt.opt${EXEC_SUFFIX}\"" \
		>>work/${DISTNAME}/findlib.conf
.	    if exists(${LOCALBASE}/bin/ocamldep.opt${EXEC_SUFFIX})
	        echo "ocamldep=\"ocamldep.opt${EXEC_SUFFIX}\"" \
		    >>work/${DISTNAME}/findlib.conf
.     endif
.	    if exists(${LOCALBASE}/bin/ocamldoc.opt${EXEC_SUFFIX})
	        echo "ocamldoc=\"ocamldoc.opt${EXEC_SUFFIX}\"" \
		    >>work/${DISTNAME}/findlib.conf
.     endif
.	endif

#        # Remove make_wizard.pattern (otherwise it would be installed)
#.	if ${GODI_FINDLIB_TOOLBOX} != "yes"
#	     rm -f ${WRKSRC}/toolbox/make_wizard.pattern
#.	endif

post-install:
        # Generate and install findlib-BUILD.conf
	echo "destdir=\"${LOCALBASE_NATIVE}/lib/ocaml/pkg-lib\"" \
		>${LOCALBASE}/etc/findlib-BUILD.conf
	echo "path=\"${LOCALBASE_NATIVE}/lib/ocaml/pkg-lib\"" \
		>>${LOCALBASE}/etc/findlib-BUILD.conf
.	if ${GODI_HAVE_OCAMLOPT} == "yes"
	    echo "ocamlc=\"ocamlc.opt${EXEC_SUFFIX}\"" \
		>>${LOCALBASE}/etc/findlib-BUILD.conf
	    echo "ocamlopt=\"ocamlopt.opt${EXEC_SUFFIX}\"" \
		>>${LOCALBASE}/etc/findlib-BUILD.conf
.	    if exists(${LOCALBASE}/bin/ocamldep.opt${EXEC_SUFFIX})
	        echo "ocamldep=\"ocamldep.opt${EXEC_SUFFIX}\"" \
		    >>${LOCALBASE}/etc/findlib-BUILD.conf
.     endif
.	    if exists(${LOCALBASE}/bin/ocamldoc.opt${EXEC_SUFFIX})
	        echo "ocamldoc=\"ocamldoc.opt${EXEC_SUFFIX}\"" \
		    >>${LOCALBASE}/etc/findlib-BUILD.conf
.     endif
.	endif

        # Docs:
	mkdir -p ${LOCALBASE}/doc/godi-findlib
.	for file in doc/README doc/QUICKSTART LICENSE
	    cp ${WRKSRC}/${file} \
		${LOCALBASE}/doc/godi-findlib
.	endfor
	mkdir -p ${LOCALBASE}/doc/godi-findlib/html
	mkdir -p ${LOCALBASE}/doc/godi-findlib/html/guide-html
	mkdir -p ${LOCALBASE}/doc/godi-findlib/html/ref-html
	mkdir -p ${LOCALBASE}/doc/godi-findlib/html/ref-html/lib
# .if defined(W32PORT) && ${W32PORT} == "mingw"
# 	mkdir -p ${LOCALBASE}/lib/godi/scripts
# 	cp files/godi-ocamlfind_install files/godi-ocamlfind_deinstall ${LOCALBASE}/lib/godi/scripts
# 	@chmod u+x ${LOCALBASE}/lib/godi/scripts/godi-ocamlfind_install ${LOCALBASE}/lib/godi/scripts/godi-ocamlfind_deinstall
# .endif
	cp ${WRKSRC}/doc/guide-html/*.html \
	    ${LOCALBASE}/doc/godi-findlib/html/guide-html
	cp ${WRKSRC}/doc/ref-html/*.html \
	    ${LOCALBASE}/doc/godi-findlib/html/ref-html
	cp ${WRKSRC}/doc/ref-html/lib/*.html \
	    ${LOCALBASE}/doc/godi-findlib/html/ref-html/lib
	cp ${WRKSRC}/doc/ref-html/lib/*.css \
	    ${LOCALBASE}/doc/godi-findlib/html/ref-html/lib


.include "../../mk/bsd.pkg.mk"

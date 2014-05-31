.include "../../mk/bsd.prefs.mk"

# ensure these variables are set:
OCAML_CONF_ARGS?=

# Access to the svn repository (since October 2009):
OCAML_SVN_CHECKOUT?=	no
OCAML_SVN_ARGS?=	--non-interactive
OCAML_SVN_PATH?=	/ocaml/trunk
# Possible paths:
# - /ocaml/trunk:           latest development version
# - /ocaml/version/3.11     latest update of this release
# - /ocaml/release/3.11.1   exactly this release 


# This is the official version string
OVERSION= 	4.02beta

# This is the GODI version string, sometimes slightly modified
VERSION=	4.02.0beta

.if ${OCAML_CVS_CHECKOUT} != "yes" && ${OCAML_SVN_CHECKOUT} != "yes"
DISTNAME=	ocaml-4.02
PKGREVISION=	0
# Note: godi_admin takes the first occurrence of PKGREVISION in the
# file when assembling available.new.
.else
DISTNAME=	ocaml
PKGREVISION=	100
.endif

# Note: ${PKGREVISION} == 99 is reserved for the CVS/SVN revision.

PKGNAME=	godi-ocaml-src-${VERSION}

.if ${OCAML_CVS_CHECKOUT} != "yes" && ${OCAML_SVN_CHECKOUT} != "yes"
DISTFILES=	ocaml-${OVERSION}.tar.xz
.else
DISTFILES=
.endif

CATEGORIES=	godi
#MASTER_SITES=   http://caml.inria.fr/distrib/ocaml-4.01/
MASTER_SITES=	http://caml.inria.fr/pub/distrib/ocaml-4.02/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://caml.inria.fr
COMMENT=	OCaml sources (required for GODI builds)

.if !defined(W32PORT)
HAS_CONFIGURE=	yes
.endif
CONFIGURE_ARGS= -bindir ${LOCALBASE}/bin
CONFIGURE_ARGS+=-libdir ${LOCALBASE}/lib/ocaml/std-lib
CONFIGURE_ARGS+=-mandir ${LOCALBASE}/man/man1
CONFIGURE_ARGS+=-cc '${CC}'
CONFIGURE_ARGS+=-no-graph -no-tk

# We assume FreeBSD's threading support is KSE-based since 6.0. 
# It probably was introduced earlier, but I could not find out
# when exactly by reading the release notes. The old libc_r
# threading library is flawed and should not be used.

.if ${OPSYS} == "FreeBSD"
.if ${OS_MAJOR_VERSION:M[012345]} != ""
CONFIGURE_ARGS+=-no-pthread
.endif
.endif

.if defined(CREATE_SHLIBS) && ${CREATE_SHLIBS} == "no"
CONFIGURE_ARGS+=-no-shared-libs
.endif
CONFIGURE_ARGS+=${OCAML_CONF_ARGS}

MAKEFILE=	Makefile.godi
ALL_TARGET=	repack

# lib is included into the search path, so there can be
# special versions of standard libraries for godi

OCAML_LDOPTS= 	-L${LOCALBASE}/lib
.if defined(ELF_RPATH_FLAG) && ${ELF_RPATH} == "yes"
OCAML_LDOPTS+=	-Wl,${ELF_RPATH_FLAG}${LOCALBASE}/lib
.endif


# On windows (both mingw and cygwin), check for GODI_BOOT_FLEXDLL
.if ${OPSYS} == "CYGWIN" && defined(GODI_BOOT_FLEXDLL)
PATH:=		${GODI_BOOT_FLEXDLL}:${PATH}
#MAKE_ENV+=      FLEXDIR=${GODI_BOOT_FLEXDLL}
.endif

#.if ${OPSYS} == "CYGWIN" && !defined(GODI_BOOT_FLEXDLL)
#MAKE_ENV+=      FLEXDIR=${LOCALBASE_NATIVE}/lib/flexdll
#.endif

# OCAML_CONF_ARGS can be used on the command-line to pass further
# config arguments

post-extract:
.if ${OCAML_SVN_CHECKOUT} == "yes"
	cd ${WRKDIR} && \
	svn checkout ${OCAML_SVN_ARGS} \
               http://caml.inria.fr/svn${OCAML_SVN_PATH} ocaml
# .elif ${OVERSION} != ${VERSION}
# 	cd ${WRKDIR} && \
# 	${RM} -rf ocaml-${VERSION} && \
# 	${MV} ocaml-${OVERSION} ocaml-${VERSION}
.endif


# .if defined(W32PORT) && ${W32PORT} == "mingw"
# 	${CP} files/patch-win* patches

# pre-clean:
# 	${RM} -f patches/patch-win*
# .endif


# pre-configure: Create Makefile.godi. It is copied from the "files"
# directory, and a number of variable assignments are dynamically
# added for easy access from Makefile.godi

pre-configure:
	${CP} files/Makefile.godi ${WRKSRC}
	${ECHO} "DISTNAME=${DISTNAME}" >>${WRKSRC}/Makefile.godi
	${ECHO} "PREFIX=${PREFIX}" >>${WRKSRC}/Makefile.godi
	${ECHO} "LOCALBASE=${LOCALBASE}" >>${WRKSRC}/Makefile.godi
.if defined(W32PORT)
	@${SETENV} ${MAKE_ENV} sh -c \
	'if ! flexlink -help >/dev/null 2>/dev/null; then \
		echo "*** flexlink not found"; exit 1; \
	fi'
.endif

# post-configure: (1) Modifies the config/Makefile the configure script
# has written. The $(GODI_LDOPTS) are inserted into the *LINKOPTS
# variables O'Caml uses when the C compiler is called to link
# executables. $(GODI_LDOPTS) contain at least -L and -Wl,-R options
# for the additional directories where libraries can reside.
# Note that $(GODI_LDOPTS) is also taken by ocamlmklib, so the
# produced shared libraries have RPATH set.
#
# (2) Create config-summary.mk for easy access of properties.


LOCALBASE_NATIVE?=${LOCALBASE}


.if defined(W32PORT)
.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64"
MAKEFILE_MINGW=${WRKSRC}/config/Makefile.mingw64
OCAML_BUILD_FLAGS ?= -march=x86-64 -mtune=generic -O2 -g
.else
MAKEFILE_MINGW=${WRKSRC}/config/Makefile.mingw
OCAML_BUILD_FLAGS ?= -march=i686 -mtune=generic -O2 -g
.endif
.endif

post-configure:
	: # (1)
.if defined(W32PORT)
	${CP} ${WRKSRC}/config/m-nt.h ${WRKSRC}/config/m.h
	${CP} ${WRKSRC}/config/s-nt.h ${WRKSRC}/config/s.h
	${SED} -e 's|^PREFIX=.*$$|PREFIX=${LOCALBASE_NATIVE}|' \
	       -e 's|^BINDIR=.*$$|BINDIR=\$$(PREFIX)/bin|' \
	       -e 's|^LIBDIR=.*$$|LIBDIR=\$$(PREFIX)/lib/ocaml/std-lib|' \
	       -e 's|^DISTRIB=.*$$|DISTRIB=\$$(PREFIX)/doc/godi-ocaml|' \
	       -e 's|^MANDIR=.*$$|MANDIR=\$$(PREFIX)/man/man1|' \
	       -e 's|^FLEXDIR=.*$$|FLEXDIR=\$$(shell \$$(FLEXLINK) -where)/../lib/flexdll|' \
	       -e 's|-O |${OCAML_BUILD_FLAGS} |' \
	       ${MAKEFILE_MINGW} >${WRKSRC}/config/Makefile.tmp
	${MV} ${WRKSRC}/config/Makefile.tmp ${WRKSRC}/config/Makefile
#.if defined(GODI_BOOT_FLEXDLL)
#	${ECHO} "FLEXDIR=${GODI_BOOT_FLEXDLL}" >>${WRKSRC}/config/Makefile
#.else
#	${ECHO} "FLEXDIR=${LOCALBASE}/lib/flexdll" >>${WRKSRC}/config/Makefile
#.endif
.endif
	${ECHO} "GODI_LDOPTS=${OCAML_LDOPTS}" >>${WRKSRC}/config/Makefile
	: # (2)
	${RM} -f ${WRKDIR}/config-summary.mk
	${ECHO} "# The configuration of the O'Caml compiler (godi-ocaml-src)" >>${WRKDIR}/config-summary.mk
	${ECHO} "# (don't include this file from your package Makefile)" >>${WRKDIR}/config-summary.mk
	if ${GREP} 'ARCH=none' ${WRKSRC}/config/Makefile >/dev/null; then   \
	    ${ECHO} "GODI_HAVE_OCAMLOPT=no" >>${WRKDIR}/config-summary.mk;  \
	else                                                                \
	    ${ECHO} "GODI_HAVE_OCAMLOPT=yes" >>${WRKDIR}/config-summary.mk; \
	fi
	if ${GREP} 'OTHERLIBRARIES=.*systhreads' ${WRKSRC}/config/Makefile >/dev/null; then \
	    ${ECHO} "GODI_THREAD_MODEL=pthr" >>${WRKDIR}/config-summary.mk; \
	else                                                                \
	    ${ECHO} "GODI_THREAD_MODEL=bthr" >>${WRKDIR}/config-summary.mk; \
	fi
	if ${GREP} 'SUPPORTS_SHARED_LIBRARIES=true'  ${WRKSRC}/config/Makefile >/dev/null; then \
	    ${ECHO} "GODI_HAVE_DLL=yes" >>${WRKDIR}/config-summary.mk;      \
	else                                                                \
	    ${ECHO} "GODI_HAVE_DLL=no" >>${WRKDIR}/config-summary.mk;       \
	fi
	if ${GREP} 'PROFILING=prof' ${WRKSRC}/config/Makefile >/dev/null; then \
	    ${ECHO} "GODI_HAVE_PROF=yes" >>${WRKDIR}/config-summary.mk;     \
	else                                                                \
	    ${ECHO} "GODI_HAVE_PROF=no" >>${WRKDIR}/config-summary.mk;      \
	fi
	${ECHO} "GODI_HAVE_OCAMLOPT_PACK=revised" >>${WRKDIR}/config-summary.mk; \
	if ${GREP} "CMXS=cmxs" ${WRKSRC}/config/Makefile >/dev/null; then \
	    ${ECHO} "GODI_HAVE_OCAMLOPT_DLL=yes" >>${WRKDIR}/config-summary.mk; \
	else                                                                    \
	    ${ECHO} "GODI_HAVE_OCAMLOPT_DLL=no" >>${WRKDIR}/config-summary.mk;  \
	fi

.include "../../mk/bsd.pkg.mk"

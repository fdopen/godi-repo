.include "../../mk/bsd.prefs.mk"  
VERSION=2.0.4
PKGNAME=godi-bitstring-${VERSION}  
PKGREVISION=0
DISTNAME=ocaml-bitstring-${VERSION} 
DISTFILES=${DISTNAME}.tar.gz  
CATEGORIES=godi
MASTER_SITES=https://bitstring.googlecode.com/files/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=http://code.google.com/p/bitstring/
COMMENT=Erlang-style bitstrings and matching over bitstrings as a syntax extension
HAS_CONFIGURE=yes
MAKE_ENV+= ${BUILD_OCAMLFIND_ENV}
DEPENDS+=godi-ocaml>=3.10.0:../../godi/godi-ocaml
USE_GMAKE=yes
.if ${GODI_HAVE_OCAMLOPT} == "yes"  
ALL_TARGET= all opt doc 
.else  
ALL_TARGET= all doc
.endif

MINGW_AUTOTOOLS_BUILD=yes
post-install :
	${MKDIR} ${LOCALBASE}/doc/godi-bitstring
	${CP} -R ${WRKSRC}/COPYING ${LOCALBASE}/doc/godi-bitstring
	${CP} -R ${WRKSRC}/html ${LOCALBASE}/doc/godi-bitstring

.include "../../mk/bsd.pkg.mk" 

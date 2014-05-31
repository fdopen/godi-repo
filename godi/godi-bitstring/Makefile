.include "../../mk/bsd.prefs.mk"  
VERSION=	2.0.4
PKGNAME=	godi-bitstring-${VERSION}  
PKGREVISION=	0
DISTNAME=	ocaml-bitstring-${VERSION} 
DISTFILES=	${DISTNAME}.tar.gz  
CATEGORIES=	godi
MASTER_SITES=	https://bitstring.googlecode.com/files/
HOMEPAGE=	http://code.google.com/p/bitstring/
COMMENT=	Erlang-style bitstrings and matching over bitstrings as a syntax extension

DEPENDS+=	godi-ocaml>=3.10.0:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4

MINGW_AUTOTOOLS_BUILD=yes
HAS_CONFIGURE=	yes

WINGMAKE=	yes
DOCUMENT_DIRS+=	html

ALL_TARGET=	all 
.if ${GODI_HAVE_OCAMLOPT} == "yes"  
ALL_TARGET+=	opt
.endif
ALL_TARGET+=	doc

.include "../../mk/bsd.pkg.mk" 

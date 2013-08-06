.include "../../mk/bsd.prefs.mk"

PKG=		base-bzip2
VERSION=	1.0.6
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	bzip2-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	base
MASTER_SITES=   http://www.bzip.org/${VERSION}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.bzip.org/
COMMENT=	high-quality data compressor

MAKEFILE=	Makefile.godi
USE_GMAKE=	yes

post-extract:
	cp files/* ${WRKSRC}


.include "../../mk/bsd.pkg.mk"

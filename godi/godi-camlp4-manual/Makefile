.include "../../mk/bsd.prefs.mk"

VERSION=        20051029
PKGNAME=        godi-camlp4-manual-${VERSION}
PKGREVISION=	1
DISTNAME=       manual-camlp4
DISTFILES=      manual-camlp4-${VERSION}.tar.gz
DISTFILES+=     tutorial-camlp4-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   ${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://caml.inria.fr/
COMMENT=        The manuals for Camlp4

post-configure:
	cp files/Makefile ${WRKSRC}

post-install:
	mkdir -p ${PREFIX}/doc/godi-camlp4-manual
	cp -R ${WRKDIR}/manual-camlp4 ${PREFIX}/doc/godi-camlp4-manual/
	cp -R ${WRKDIR}/tutorial-camlp4 ${PREFIX}/doc/godi-camlp4-manual/
	rm ${PREFIX}/doc/godi-camlp4-manual/manual-camlp4/Makefile

.include "../../mk/bsd.pkg.mk"

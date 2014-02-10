.include "../../mk/bsd.prefs.mk"

VERSION=        0.0.2
PKGNAME=        godi-ocaml-xdg-basedir-${VERSION}
PKGREVISION=    1
DISTNAME=       ocaml-xdg-basedir-${VERSION}
DISTFILES=      ocaml-xdg-basedir-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/902/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://forge.ocamlcore.org/projects/ocaml-xdg-basedir
COMMENT=        XDG basedir location for data/cache/configuration files

PKG = godi-ocaml-xdg-basedir
DEPENDS+= godi-ocaml>=3.06:../../godi/godi-ocaml
DEPENDS+= godi-fileutils>=0.4.2:../../godi/godi-fileutils
BUILD_DEPENDS+= godi-ounit>=1.1.0:../../godi/godi-ounit
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

WINOASIS=	yes
WINOASIS_DISABLE_TESTS= undef
WINOASIS_DISABLE_DOCS= undef


.include "../../mk/bsd.pkg.mk"

.include "../../mk/bsd.prefs.mk"

VERSION=	24.3
XPMVERSION=	3.5.8
MNODE=          1304	
PKGREVISION=	3
PKG=		apps-emacs
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	opt
DISTFILES=	tuareg-2.0.7.tar.gz color-theme-6.6.0.tar.gz emacs-${VERSION}-bin-i386.zip emacs-${VERSION}.tar.xz libxpm-${XPMVERSION}-w32-src.zip v1.3.1.tar.gz
EXTRACT_ONLY=	tuareg-2.0.7.tar.gz color-theme-6.6.0.tar.gz v1.3.1.tar.gz
CATEGORIES=	apps
MASTER_SITES=	http://ftp.gnu.org/gnu/emacs/windows/ http://ftp.gnu.org/gnu/emacs/ http://forge.ocamlcore.org/frs/download.php/${MNODE}/ http://download.savannah.gnu.org/releases-redirect/

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://www.gnu.org/software/emacs/
COMMENT=	emacs for windows

BUILD_DEPENDS+= godi-ocaml-src>=3.12:../../godi-ocaml-src

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}

pre-configure:
.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
	@echo "*********************************************"
	@echo "*** emacs is only available for Windows ***"
	@echo "*********************************************"
	@false
.endif

pre-extract:
	@${MKDIR} -p ${WRKDIR:Q}/opt

post-extract:
	@${CP} files/* ${WRKDIR:Q}
	@${CHMOD} 755 ${WRKDIR:Q}/install.sh
	@cd ${WRKDIR:Q} && \
	  cd opt && \
	  ${LOCALBASE}/sbin/bsdtar.exe -xf ${CYGWIN_ROOT:Q}${DISTDIR:Q}/emacs-${VERSION}-bin-i386.zip && \
	  ${MV} emacs-* emacs 
	@cd ${WRKDIR:Q} && tar -xf "${LOCALBASE}/lib/godi/saved-src/ocaml.txz"

BUILD_SCRIPT= ${WRKDIR:Q}/install.sh

do-install:
	@cd ${WRKDIR} && ${FIND} opt/emacs ! -type d >${PLIST_SRC} \
	 && ${PAX} -rw -pp opt ${LOCALBASE:Q}
	@${SETENV} ${ADD_ENV} bash files/install --add-links



.include "../../mk/bsd.pkg.mk"

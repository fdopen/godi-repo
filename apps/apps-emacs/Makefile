.include "../../mk/bsd.prefs.mk"

VERSION=	24.4.1
#XPMVERSION=	3.5.8
MNODE=          1304	
PKGREVISION=	0
PKG=		apps-emacs
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	opt
COMPANY_VERSION= 0.8.6
YASNIPPET_VERSION=0.8.0
DISTFILES=	tuareg-2.0.8.tar.xz popup-el-0.5.0.tar.xz color-theme-6.6.0.tar.gz auto-complete-1.4.0.tar.xz company-mode-${COMPANY_VERSION}.tar.xz yasnippet-${YASNIPPET_VERSION}.tar.xz emacs-24.4_${MINGW_WORDSIZE}.tar.xz #emacs-24.4_32.tar.xz
CATEGORIES=	apps
#MASTER_SITES=	http://ftp.gnu.org/gnu/emacs/windows/ http://ftp.gnu.org/gnu/emacs/ http://forge.ocamlcore.org/frs/download.php/${MNODE}/ http://download.savannah.gnu.org/releases-redirect/

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://www.gnu.org/software/emacs/
COMMENT=	emacs for windows

BUILD_DEPENDS+= godi-ocaml-src>=3.12:../../godi-ocaml-src

PATH:=		${LOCALBASE}/bin:${PATH}
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
	@cd ${WRKDIR:Q} && ${MV} emacs opt
	@cd ${WRKDIR:Q} && tar -xf "${LOCALBASE}/lib/godi/saved-src/ocaml.txz"

BUILD_SCRIPT= ${WRKDIR:Q}/install.sh

do-install:
	@cd ${WRKDIR} && ${FIND} opt/emacs ! -type d >${PLIST_SRC} \
	 && ${PAX} -rw -pp opt ${LOCALBASE:Q}
	@${SETENV} ${ADD_ENV} bash files/install --add-links



.include "../../mk/bsd.pkg.mk"

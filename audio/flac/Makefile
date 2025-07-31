PORTNAME=	flac
DISTVERSION=	1.5.0
PORTEPOCH=	1
CATEGORIES=	audio
MASTER_SITES=	https://github.com/xiph/${PORTNAME}/releases/download/${DISTVERSION}/ \
		https://downloads.xiph.org/releases/${PORTNAME}/

PATCH_SITES=	https://github.com/xiph/flac/commit/
PATCHFILES=	8d648456a2d7444d54a579e365bab4c815ac6873.patch:-p1 \
		22ad63f7157eac08734e4e4fe780f33dad05dd5f.patch:-p1

MAINTAINER=	naddy@FreeBSD.org
COMMENT=	Free lossless audio codec
WWW=		https://www.xiph.org/flac/

LICENSE=	BSD3CLAUSE GFDL GPLv2 LGPL21
LICENSE_COMB=	multi
LICENSE_FILE_BSD3CLAUSE=${WRKSRC}/COPYING.Xiph
LICENSE_FILE_GFDL=	${WRKSRC}/COPYING.FDL
LICENSE_FILE_GPLv2=	${WRKSRC}/COPYING.GPL
LICENSE_FILE_LGPL21=	${WRKSRC}/COPYING.LGPL

LIB_DEPENDS=	libogg.so:audio/libogg

USES=		cmake:testing compiler:c11 cpe iconv pathfix pkgconfig tar:xz
CPE_VENDOR=	flac_project
USE_LDCONFIG=	yes

# Preserve UTF-8 filenames in test/flac-to-flac-metadata-test-files/.
# They are referenced by the test suite.
EXTRACT_CMD=	${SETENV} LC_ALL=C.UTF-8 ${TAR}

CMAKE_OFF=	BUILD_EXAMPLES \
		BUILD_TESTING \
		WITH_FORTIFY_SOURCE \
		WITH_STACK_PROTECTOR
CMAKE_ON=	BUILD_SHARED_LIBS \
		CMAKE_DISABLE_FIND_PACKAGE_Doxygen \
		CMAKE_DISABLE_FIND_PACKAGE_Git \
		CMAKE_DISABLE_FIND_PACKAGE_Intl
CMAKE_ARGS=	-DCMAKE_INSTALL_DOCDIR=${DOCSDIR}

OPTIONS_DEFINE=	DOCS

CMAKE_DOC_BOOL=	BUILD_DOCS

.include <bsd.port.pre.mk>

# test_libFLAC:
# "iterator claims file is writable when tester thinks it should not be"
.if ${UID} == 0
CMAKE_ARGS+=	-DCMAKE_CTEST_ARGUMENTS="-E;'libFLAC'"
pre-test:
	@${ECHO_MSG} "===>  Disabling tests that cannot be run as root"
.endif

.include <bsd.port.post.mk>

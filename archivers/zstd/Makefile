PORTNAME=	zstd
DISTVERSION=	1.5.7
CATEGORIES=	archivers
MASTER_SITES=	https://github.com/facebook/${PORTNAME}/releases/download/v${DISTVERSION}/

PATCH_SITES=	https://github.com/facebook/zstd/commit/
PATCHFILES=	6af3842118ea5325480b403213b2a9fbed3d3d74.patch:-p1

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Fast real-time compression algorithm
WWW=		https://facebook.github.io/zstd/ \
		https://github.com/facebook/zstd

LICENSE=	BSD3CLAUSE GPLv2
LICENSE_COMB=	dual
LICENSE_FILE_BSD3CLAUSE=${WRKSRC}/../../LICENSE
LICENSE_FILE_GPLv2=	${WRKSRC}/../../COPYING

LIB_DEPENDS=	liblz4.so:archivers/liblz4

USES=		cmake:testing cpe pathfix pkgconfig tar:zst
CPE_PRODUCT=	zstandard
CPE_VENDOR=	facebook
USE_LDCONFIG=	yes

PATCH_WRKSRC=	${WRKDIR}/${DISTNAME}
WRKSRC_SUBDIR=	build/cmake

PLIST_SUB=	DISTVERSION=${DISTVERSION}

CMAKE_TESTING_ON=	ZSTD_BUILD_TESTS

CMAKE_ON=	ZSTD_LZ4_SUPPORT \
		ZSTD_LZMA_SUPPORT

CMAKE_ARGS=	-DCMAKE_C_VISIBILITY_PRESET=hidden \
		-DCMAKE_CTEST_ARGUMENTS="-E;'fuzzer'"

OPTIONS_DEFINE=		OPTIMIZED_CFLAGS
OPTIONS_DEFAULT=	OPTIMIZED_CFLAGS

OPTIMIZED_CFLAGS_VARS=	CFLAGS+=-O3

post-install:
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/programs/zstd-frugal ${STAGEDIR}${PREFIX}/bin
	${RLN} zstd.1 ${STAGEDIR}${PREFIX}/share/man/man1/zstdmt.1

.include <bsd.port.mk>

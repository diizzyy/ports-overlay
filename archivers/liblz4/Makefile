PORTNAME=	lz4
DISTVERSION=	1.10.0
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	archivers
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/v${DISTVERSION}/
PKGNAMEPREFIX=	lib

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	LZ4 compression library, lossless and very fast
WWW=		https://lz4.org/ \
		https://github.com/lz4/lz4

LICENSE=	BSD2CLAUSE GPLv2
LICENSE_COMB=	multi
LICENSE_FILE_BSD2CLAUSE=${WRKSRC}/../../lib/LICENSE
LICENSE_FILE_GPLv2=	${WRKSRC}/../../programs/COPYING

# We're bootstrapping using muon and samurai as zstd depends on this port
# and as of Python 3.14 zstd is a requirement. As unit tests requires
# Python you need to install (lib)lz4 before building and running unit tests

USES=		cpe shebangfix meson:muon ninja:samurai python:env,test
CPE_VENDOR=	lz4_project
SHEBANG_FILES=	../../tests/*.py
USE_LDCONFIG=	yes

PORTSCOUT=	limit:^[0-9]*\.

WRKSRC_SUBDIR=	build/meson

PLIST_SUB=	DISTVERSION=${DISTVERSION}

ALL_TARGET=

MESON_ARGS=	-Ddefault_library=shared \
		-Dossfuzz=false \
		-Dprograms=true

OPTIONS_DEFINE=	TEST

TEST_ALL_TARGET=
TEST_MESON_TRUE=	tests

post-patch:
	@${REINPLACE_CMD} -e 's|%%DISTVERSION%%|${DISTVERSION}|g' \
	    ${PATCH_WRKSRC}/meson.build

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/${PKGBASE}.so.${DISTVERSION}
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

do-test:
	(cd ${TEST_WRKSRC} && ${SETENV} ${CONFIGURE_CMD} ${TEST_TARGET} -j ${MAKE_JOBS_NUMBER} -R)

.include <bsd.port.mk>

PORTNAME=	lz4
DISTVERSION=	1.11.1
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
# and if you're using older versions we need to declare it
TEST_DEPENDS=	liblz4>0:archivers/liblz4

USES=		cpe shebangfix meson:muon ninja:samurai python:env,test
CPE_VENDOR=	lz4_project
SHEBANG_FILES=	../../tests/bench/*.py \
		../../tests/compat/*.py
USE_LDCONFIG=	yes

WRKSRC_SUBDIR=	build/meson
ALL_TARGET=

PLIST_SUB=	DISTVERSION=${DISTVERSION}

MESON_ARGS=	-Ddefault_library=shared \
		-Dossfuzz=false \
		-Dprograms=true

post-patch:
	@${REINPLACE_CMD} -e 's|%%DISTVERSION%%|${DISTVERSION}|g' \
	    ${PATCH_WRKSRC}/meson.build

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/${PKGBASE}.so.${DISTVERSION}
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

pre-test:
	@if [ ! -e ${WRKDIR}/.meson_build_tests ]; then \
		${RM} ${CONFIGURE_COOKIE} ${BUILD_COOKIE}; \
		${MAKE} -C${.CURDIR} build MESON_ARGS="${MESON_ARGS} --reconfigure -Dtests=true"; \
		${TOUCH} ${WRKDIR}/.meson_build_tests; \
	fi

do-test:
	# Excessive parallization breaks unit tests
	(cd ${TEST_WRKSRC} && ${SETENV} ${CONFIGURE_CMD} ${TEST_TARGET} -j 4 -R -d dots)

.include <bsd.port.mk>

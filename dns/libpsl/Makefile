PORTNAME=	libpsl
DISTVERSION=	0.23.0
CATEGORIES=	dns
MASTER_SITES=	https://github.com/rockdaboot/${PORTNAME}/releases/download/${DISTVERSION}/

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	C library to handle the Public Suffix List
WWW=		https://github.com/rockdaboot/libpsl

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	public_suffix_list>=0:dns/public_suffix_list

USES=		localbase:ldflags meson pkgconfig python:build shebangfix tar:lz
SHEBANG_FILES=	src/psl-make-dafsa
USE_LDCONFIG=	yes

EXTRACT_AFTER_ARGS=	--exclude ${PORTNAME}-${DISTVERSION}/src/suffixes_dafsa.h \
			--exclude ${PORTNAME}-${DISTVERSION}/tests/psl.dafsa \
			--exclude ${PORTNAME}-${DISTVERSION}/tests/psl_ascii.dafsa \
			--no-same-owner --no-same-permissions

TEST_TARGET=	test

MESON_ARGS=	--default-library=both \
		-Dtests=false \
		-Dpsl_file=${LOCALBASE}/share/public_suffix_list/public_suffix_list.dat \
		-Dpsl_testfile=${LOCALBASE}/share/public_suffix_list/test_psl.txt

OPTIONS_SINGLE=		IDNA
OPTIONS_SINGLE_IDNA=	ICU IDN2
OPTIONS_DEFAULT=	IDN2

ICU_DESC=		Use devel/icu (IDNA2008 UTS\#46 library)
IDN2_DESC=		Use dns/libidn2 (IDNA2008 library)

ICU_LIB_DEPENDS=	libicuuc.so:devel/icu
ICU_MESON_ON=		-Druntime=libicu

IDN2_USES=		iconv
IDN2_LIB_DEPENDS=	libidn2.so:dns/libidn2 \
			libunistring.so:devel/libunistring
IDN2_MESON_ON=		-Druntime=libidn2

pre-test:
	@if [ ! -e ${WRKDIR}/.meson_build_tests ]; then \
	  ${RM} ${CONFIGURE_COOKIE} ${BUILD_COOKIE}; \
	  ${MAKE} -C${.CURDIR} build MESON_ARGS="${MESON_ARGS} --reconfigure -Dtests=true"; \
	  ${TOUCH} ${WRKDIR}/.meson_build_tests; \
	fi

post-install:
	${RM} ${STAGEDIR}${PREFIX}/bin/psl-make-dafsa ${STAGEDIR}${PREFIX}/share/man/man1/psl-make-dafsa.1

.include <bsd.port.mk>

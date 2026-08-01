PORTNAME=	json-c
DISTVERSION=	0.19
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/${PORTNAME}-${DISTVERSION}-20260627/ \
		https://s3.amazonaws.com/json-c_releases/releases/

PATCH_SITES=	https://github.com/json-c/json-c/commit/
PATCHFILES=	54f55260115bb91ecb973381bc1038167808e105.patch:-p1 \
		f291fa81c6f21d925ea771a8cca597f5886309cc.patch:-p1 \
		16e394ba960555fe7bc169e81745a7a0527d7a3a.patch:-p1 \
		9d116a5d38cc1d406d4599e2436e608333e4e4f1.patch:-p1 \
		eed664e06a3cb6ebb0cd7a458527ed3e853394a3.patch:-p1 \
		e248056aa170783f7bf4cc88dcbb1664096449a3.patch:-p1 \
		70f3169bae5f2306fbb1a70e02b3f6ade96e47f4.patch:-p1

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	JSON (JavaScript Object Notation) implementation in C
WWW=		https://github.com/json-c/json-c/wiki

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/COPYING

TEST_DEPENDS=	xxd>=0:sysutils/xxd

USES=		cmake:testing compiler:c11 cpe
USE_LDCONFIG=	yes

CMAKE_OFF=	BUILD_TESTING
CMAKE_ON_amd64=	ENABLE_RDRAND
CMAKE_ON=	CMAKE_DISABLE_FIND_PACKAGE_Doxygen \
		DISABLE_EXTRA_LIBS \
		${CMAKE_ON_${ARCH}}

.include <bsd.port.mk>

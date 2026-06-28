PORTNAME=	json-c
DISTVERSION=	0.19
CATEGORIES=	devel
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/${PORTNAME}-${DISTVERSION}-20260627/ \
		https://s3.amazonaws.com/json-c_releases/releases/

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	JSON (JavaScript Object Notation) implementation in C
WWW=		https://github.com/json-c/json-c/wiki

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake:testing compiler:c11 cpe
USE_LDCONFIG=	yes

CMAKE_OFF=	BUILD_TESTING
CMAKE_ON_amd64=	ENABLE_RDRAND
CMAKE_ON=	CMAKE_DISABLE_FIND_PACKAGE_Doxygen \
		DISABLE_EXTRA_LIBS \
		${CMAKE_ON_${ARCH}}

.include <bsd.port.mk>

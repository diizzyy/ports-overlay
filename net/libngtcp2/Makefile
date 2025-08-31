PORTNAME=	ngtcp2
DISTVERSION=	1.15.0
CATEGORIES=	net
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/v${DISTVERSION}/
PKGNAMEPREFIX=	lib

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Implementation of QUIC protocol
WWW=		https://nghttp2.org/ngtcp2/ \
		https://github.com/ngtcp2/ngtcp2

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes

CMAKE_OFF=	BUILD_TESTING \
		ENABLE_BORINGSSL \
		ENABLE_OPENSSL \
		ENABLE_PICOTLS \
		ENABLE_STATIC_LIB
CMAKE_ON=	ENABLE_LIB_ONLY

OPTIONS_DEFINE=	GNUTLS WOLFSSL
OPTIONS_DEFAULT=GNUTLS
OPTIONS_SUB=	yes

GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls
GNUTLS_CMAKE_BOOL=	ENABLE_GNUTLS

WOLFSSL_LIB_DEPENDS=	libwolfssl.so:security/wolfssl
WOLFSSL_CMAKE_BOOL=	ENABLE_WOLFSSL

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MGNUTLS} || ${PORT_OPTIONS:MWOLFSSL}
PLIST_FILES=	include/ngtcp2/ngtcp2_crypto.h
.endif

.include <bsd.port.mk>

PORTNAME=	llhttp
DISTVERSIONPREFIX=	release/v
DISTVERSION=	9.3.1
CATEGORIES=	www

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Port of http_parser to llparse
WWW=		https://llhttp.org/ \
		https://github.com/nodejs/llhttp

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake cpe pathfix

USE_GITHUB=	yes
GH_ACCOUNT=	nodejs

PLIST_SUB=	DISTVERSION=${DISTVERSION}

OPTIONS_DEFINE=	STATIC
OPTIONS_SUB=	yes

STATIC_CMAKE_BOOL=	LLHTTP_BUILD_STATIC_LIBS

.include <bsd.port.mk>

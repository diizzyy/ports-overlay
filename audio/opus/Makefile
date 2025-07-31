PORTNAME=	opus
DISTVERSION=	1.5.2
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	https://github.com/xiph/${PORTNAME}/releases/download/v${DISTVERSION}/ \
		https://downloads.xiph.org/releases/${PORTNAME}/

MAINTAINER=	naddy@FreeBSD.org
COMMENT=	IETF audio codec
WWW=		https://opus-codec.org/

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe meson python:build shebangfix
CPE_VENDOR=	opus-codec
SHEBANG_FILES=	meson/*.py
USE_LDCONFIG=	yes

MESON_ARGS=	-Ddefault_library=both \
		-Dcustom-modes=true \
		-Ddocs=disabled \
		-Dextra-programs=disabled

.include <bsd.port.options.mk>

.if ${ARCH} != "arm"
MESON_ARGS+=	-Dasm=disabled
.endif

.include <bsd.port.mk>

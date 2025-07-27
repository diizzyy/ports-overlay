PORTNAME=	webp
DISTVERSION=	1.6.0
CATEGORIES=	graphics
MASTER_SITES=	http://downloads.webmproject.org/releases/${PORTNAME}/ \
		https://storage.googleapis.com/downloads.webmproject.org/releases/${PORTNAME}/
DISTNAME=	libwebp-${DISTVERSION}

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Google WebP image format conversion tool
WWW=		https://developers.google.com/speed/webp

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake compiler:c11 pathfix pkgconfig
USE_LDCONFIG=	yes

PORTSCOUT=	limit:^[0-9\.]*$$

CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	CMAKE_DISABLE_FIND_PACKAGE_SDL \
		CMAKE_SKIP_INSTALL_RPATH \
		WEBP_BUILD_EXTRAS

OPTIONS_DEFINE=	IMGCONV X11
OPTIONS_DEFAULT=IMGCONV
OPTIONS_SUB=	yes

IMGCONV_DESC=		Install converters to/from WebP

IMGCONV_LIB_DEPENDS=	libgif.so:graphics/giflib \
			libpng.so:graphics/png \
			libtiff.so:graphics/tiff
IMGCONV_USES=		jpeg
IMGCONV_CMAKE_BOOL=	WEBP_BUILD_CWEBP WEBP_BUILD_DWEBP \
			WEBP_BUILD_GIF2WEBP WEBP_BUILD_IMG2WEBP

X11_USES=		gl localbase:ldflags
X11_USE=		GL=glu,glut,opengl
X11_CMAKE_BOOL=		WEBP_BUILD_VWEBP

.include <bsd.port.mk>

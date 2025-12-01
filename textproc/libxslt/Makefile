PORTNAME=	libxslt
DISTVERSION=	1.1.45
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	desktop@FreeBSD.org
COMMENT=	XML stylesheet transformation library
WWW=		https://gitlab.gnome.org/GNOME/libxslt/

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/Copyright

USES=		cmake:testing cpe gnome pathfix pkgconfig tar:xz
CPE_VENDOR=	xmlsoft
USE_GNOME=	libxml2
USE_LDCONFIG=	yes

PLIST_SUB=	LIBVERSION=${DISTVERSION}

CMAKE_TESTING_ON=	LIBXSLT_WITH_TESTS

CMAKE_OFF=	LIBXSLT_WITH_TESTS \
		LIBXSLT_WITH_PYTHON

OPTIONS_DEFINE=	CRYPTO PLUGINS
OPTIONS_DEFAULT=CRYPTO PLUGINS
OPTIONS_SUB=	yes

CRYPTO_DESC=	Enable crypto support
PLUGINS_DESC=	Enable dynamically-loaded plugins support

CRYPTO_LIB_DEPENDS=	libgcrypt.so:security/libgcrypt
CRYPTO_CMAKE_BOOL=	LIBXSLT_WITH_CRYPTO

PLUGINS_CMAKE_BOOL=	LIBXSLT_WITH_MODULES

post-install-PLUGINS-on:
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/libxslt-plugins

.include <bsd.port.mk>

PORTNAME=	lcms2
DISTVERSION=	2.17
CATEGORIES=	graphics
MASTER_SITES=	https://github.com/mm2/Little-CMS/releases/download/lcms${DISTVERSION}/

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Accurate, fast, and small-footprint color management engine
WWW=		https://www.littlecms.com/ \
		https://github.com/mm2/Little-CMS

LICENSE=	GPLv3

USES=		cpe meson pkgconfig
CPE_VENDOR=	littlecms
CPE_PRODUCT=	little_cms_color_engine
USE_LDCONFIG=	yes

PLIST_SUB=	DISTVERSION=${DISTVERSION}

MESON_ARGS=	-Dfastfloat=true \
		-Dthreaded=true \
		-Dutils=true

OPTIONS_DEFINE=	DOCS JPEGICC TEST TIFFICC
OPTIONS_DEFAULT=JPEGICC TIFFICC
OPTIONS_SUB=	yes

JPEGICC_DESC=	Build color profile applier for JPEG
TIFFICC_DESC=	Build color profile applier for TIFF

JPEGICC_USES=		jpeg
JPEGICC_MESON_ENABLED=	jpeg

TEST_MESON_ENABLED=	tests

TIFFICC_LIB_DEPENDS=	libtiff.so:graphics/tiff
TIFFICC_MESON_ENABLED=	tiff

post-install-DOCS-on:
	${MKDIR} ${STAGEDIR}${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/*.pdf ${STAGEDIR}${DOCSDIR}/

.include <bsd.port.mk>

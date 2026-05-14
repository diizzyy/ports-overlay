PORTNAME=	libzen
DISTVERSION=	0.4.41.20260414
CATEGORIES=	multimedia

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	ZenLib used by MediaInfo and its library
WWW=		https://mediaarea.net/en/MediaInfo \
		https://github.com/MediaArea/ZenLib

LICENSE=	ZLIB
LICENSE_FILE=	${WRKSRC}/../../License.txt

USES=		cmake compiler:c++17-lang dos2unix pathfix pkgconfig tar:xz
DOS2UNIX_GLOB=	*.c *.cmake.in *.cpp *.h *.pc.in *.txt
DOS2UNIX_WRKSRC=${WRKDIR}
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	MediaArea
GH_PROJECT=	ZenLib
GH_TAGNAME=	65458b3

WRKSRC_SUBDIR=	Project/CMake

CMAKE_ARGS=	-DCMAKE_CXX_STANDARD=17

post-patch:
	@${REINPLACE_CMD} -e '/^Libs_Static/d' ${PATCH_WRKSRC}/libzen.pc.in

.include <bsd.port.mk>

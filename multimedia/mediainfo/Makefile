PORTNAME=	mediainfo
DISTVERSION=	25.10
CATEGORIES=	multimedia
MASTER_SITES=	https://mediaarea.net/download/source/${PORTNAME}/${DISTVERSION}/
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Provides technical and tag information for video and audio files
WWW=		https://mediaarea.net/en/MediaInfo \
		https://github.com/MediaArea/MediaInfo

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/../../../License.html

LIB_DEPENDS=	libmediainfo.so:multimedia/libmediainfo \
		libzen.so:multimedia/libzen

USES=		autoreconf compiler:c++11-lang cpe dos2unix libtool pathfix \
		pkgconfig tar:xz
CPE_VENDOR=	mediaarea
DOS2UNIX_GLOB=	*.c *.cpp *.h
DOS2UNIX_WRKSRC=${WRKDIR}
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/MediaInfo/Project/GNU/CLI

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/mediainfo

.include <bsd.port.mk>

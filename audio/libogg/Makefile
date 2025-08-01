PORTNAME=	libogg
DISTVERSION=	1.3.6
PORTREVISION=	1
PORTEPOCH=	4
CATEGORIES=	audio
MASTER_SITES=	https://github.com/xiph/ogg/releases/download/v${DISTVERSION}/ \
		https://downloads.xiph.org/releases/ogg/

MAINTAINER=	naddy@FreeBSD.org
COMMENT=	Ogg bitstream library
WWW=		https://www.xiph.org/ogg/

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake pathfix tar:xz
USE_LDCONFIG=	yes

CFLAGS+=	-fsigned-char

CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	INSTALL_DOCS

OPTIONS_DEFINE=	DOCS

DOCS_CMAKE_BOOL=	INSTALL_DOCS

post-install-DOCS-on:
	${MKDIR} ${STAGEDIR}${DOCSDIR}/${PORTNAME}
	${INSTALL_MAN} \
	    ${WRKSRC}/doc/*.html \
	    ${WRKSRC}/doc/*.png \
	    ${WRKSRC}/doc/*.txt  \
	    ${STAGEDIR}${DOCSDIR}
	${INSTALL_MAN} \
	    ${WRKSRC}/doc/libogg/*.css \
	    ${WRKSRC}/doc/libogg/*.html \
	    ${STAGEDIR}${DOCSDIR}/${PORTNAME}

.include <bsd.port.mk>

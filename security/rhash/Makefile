PORTNAME=	rhash
DISTVERSION=	1.4.6
CATEGORIES=	security
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	danfe@FreeBSD.org
COMMENT=	Utility and library for computing and checking of file hashes
WWW=		https://rhash.sourceforge.net/

LICENSE=	BSD0CLAUSE
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe
CPE_VENDOR=	${PORTNAME}_project
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/RHash-${DISTVERSION}

INSTALL_TARGET=	install install-lib-so-link install-pkg-config

PORTDOCS=	ChangeLog README.md

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix="${PREFIX}" \
		--mandir="${PREFIX}/share/man" \
		--pkgconfigdir="${PREFIX}/libdata/pkgconfig" \
		--enable-lib-static \
		--enable-openssl-runtime \
		--extra-cflags="${CFLAGS}" \
		--extra-ldflags="${LDFLAGS}"

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_USES=		gettext localbase:ldflags
NLS_CONFIGURE_ON=	--enable-gettext
NLS_INSTALL_TARGET=	install-gmo

post-patch:
	@${REINPLACE_CMD} -e '/BYTE_ORDER/s,__,_,g' \
		${WRKSRC}/librhash/byte_order.h

post-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}

do-test:
	${CP} ${WRKSRC}/lib${PORTNAME}/lib${PORTNAME}.so* ${WRKSRC}
	cd ${WRKSRC}/tests && ${SH} test_rhash.sh --full --shared ${WRKSRC}/rhash

.include <bsd.port.mk>

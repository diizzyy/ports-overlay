PORTNAME=	libxml2
DISTVERSION=	2.15.2
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	desktop@FreeBSD.org
COMMENT=	XML parser library for GNOME
WWW=		http://xmlsoft.org/

LICENSE=	MIT

USES=		cpe iconv meson pkgconfig:both tar:xz
CPE_VENDOR=	xmlsoft
USE_LDCONFIG=	yes

PLIST_SUB+=	LIBVERSION=${DISTVERSION}

MESON_ARGS=	-Ddocs=disabled \
		-Dpython=disabled \
		-Dsysconfdir=${LOCALBASE}/share

OPTIONS_DEFINE=		DOCS ICU READLINE THREAD_ALLOC
OPTIONS_DEFAULT=	READLINE
OPTIONS_SUB=		yes

READLINE_DESC=		History for xmllint
THREAD_ALLOC_DESC=	Per-thread memory (DEVELOPERS ONLY!)

ICU_LIB_DEPENDS=		libicuuc.so:devel/icu
ICU_MESON_ENABLED=		icu

READLINE_LIB_DEPENDS=		libreadline.so:devel/readline
READLINE_MESON_ENABLED=		history \
				readline

THREAD_ALLOC_MESON_ENABLED=	thread-alloc

post-patch:
	@${REINPLACE_CMD} -e "/^subdir('example')/d" \
	    ${PATCH_WRKSRC}/meson.build

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/*.1 ${STAGEDIR}${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/dist-doc/*.1 ${STAGEDIR}${PREFIX}/share/man/man1

post-install-DOCS-on:
	${MKDIR} ${STAGEDIR}${DOCSDIR}/html
	${INSTALL_MAN} ${WRKSRC}/dist-doc/*.html ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC}/dist-doc/html && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR}/html)

.include <bsd.port.mk>

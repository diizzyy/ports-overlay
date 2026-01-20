PORTNAME=	libxml2
DISTVERSION=	2.15.1
PORTREVISION=	2
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME \
		https://gitlab.gnome.org/GNOME/libxml2/-/jobs/5670921/artifacts/download?dummy=/:docs
DISTFILES=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX} \
		${PORTNAME}-${DISTVERSION}-docs.zip:docs
DIST_SUBDIR=	gnome
EXTRACT_ONLY=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}

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

post-extract:
	${MKDIR} ${WRKSRC}/docs
	${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${_DISTDIR}/${ALLFILES:M*docs*} -C ${WRKSRC}/docs --include install/share/man/man1 --include install/share/doc/libxml2 --exclude *xsltproc* --strip-components 2 ${EXTRACT_AFTER_ARGS}

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/man/man1/*.1 ${STAGEDIR}${PREFIX}/share/man/man1
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC}/docs/doc/libxml2 && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>

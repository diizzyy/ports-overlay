PORTNAME=	libxml2
DISTVERSION=	2.15.1
PORTREVISION=	1
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

OPTIONS_DEFINE=		ICU READLINE THREAD_ALLOC
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

.include <bsd.port.mk>

PORTNAME=	sqlite3
DISTVERSION=	3.53.2
PORTEPOCH=	1
CATEGORIES=	databases
MASTER_SITES=	https://www3.sqlite.org/2026/:sqlite3src \
		https://www2.sqlite.org/2026/:sqlite3src \
		https://www.sqlite.org/2026/:sqlite3src
DISTFILES=	sqlite-src-${DISTVERSION:C/\.([[:digit:]])[[:>:]]/0\1/g:S/.//g}00.zip:sqlite3src

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT?=	Library that implements an embeddable SQL database engine
WWW=		https://sqlite.org/

LICENSE=	PD
LICENSE_FILE=	${WRKSRC}/LICENSE.md

.ifndef SQLITE3_SLAVE
FLAVORS=	default icu
FLAVOR?=	${FLAVORS:[1]}
icu_PKGNAMESUFFIX=	-icu
.endif
USES+=		cpe gmake libtool ncurses
CPE_VENDOR=	sqlite
CPE_PRODUCT=	sqlite
USE_LDCONFIG=	yes

USE_GITHUB=	nodefault
GH_ACCOUNT=	antirez:linenoisesrc
GH_PROJECT=	linenoise:linenoisesrc
GH_TAGNAME=	2.0:linenoisesrc

HAS_CONFIGURE=	yes
WRKSRC=		${WRKDIR}/${_DISTFILES:Msqlite*:R}

# SQLite lacks full support for FreeBSD so we need to tell what
# features the os supports, see ${WRKSRC}/src/os_unix.c for a list.
# Please do no sort definitions, follow ordering as in source file
# Additionally keep in sync with ${WRKSRC}/sqlite_cfg.h
# (after "make configure" stage)
# For HAVE_MALLOC_USABLE_SIZE and HAVE_STRCHRNUL see
# https://sqlite.org/compile.html
CPPFLAGS+=	-DHAVE_FCHMOD=1 \
		-DHAVE_POSIX_FALLOCATE=1 \
		-DHAVE_FCHOWN=1 \
		-DHAVE_READLINK=1 \
		-DHAVE_LSTAT=1 \
		-DHAVE_STRERROR_R=1 \
		-DHAVE_MALLOC_USABLE_SIZE=1 \
		-DHAVE_STRCHRNUL=1

# These options along with upstream defaults and CONFIGURE_ARGS are
# considered "standard" by most distros so follow suit to avoid
# foot-shooting
# Checked: Alpine Linux, Arch Linux, Debian, Fedora, Gentoo, SUSE
CFLAGS+=	-DSQLITE_ENABLE_FTS3_PARENTHESIS \
		-DSQLITE_ENABLE_UNLOCK_NOTIFY \
		-DSQLITE_SECURE_DELETE \
		-DSQLITE_SOUNDEX \
		-DSQLITE_USE_URI=1

.ifndef SQLITE3_SLAVE
PLIST_SUB=	DISTVERSION=${DISTVERSION}
.endif

MAKE_JOBS_UNSAFE=yes

CONFIGURE_ENV+=	CCACHE=none
CONFIGURE_ARGS+=--prefix=${PREFIX} \
		--disable-amalgamation \
		--fts3 \
		--all \
		--update-limit \
		--column-metadata \
		--disable-readline \
		--with-linenoise=${WRKDIR}/linenoise-2.0 \
		--soname=legacy
.if !defined(SQLITE3_SLAVE) || ${SQLITE3_SLAVE} != tcl
CONFIGURE_ARGS+=--disable-tcl
.endif

OPTIONS_DEFINE=	APIARMOR HIDDENCOLUMNS ICU LIKENOBLOBS NORMALIZE RBU \
		SQLOFFSET STRICTSUBTYPE STMTVTAB
.if defined(FLAVOR) && ${FLAVOR} == icu
OPTIONS_DEFAULT=	ICU
.else
OPTIONS_EXCLUDE+=	ICU
.endif

APIARMOR_DESC=		Enable logic to detect misuse of API
HIDDENCOLUMNS_DESC=	Enable hidden columns for virtual tables
LIKENOBLOBS_DESC=	Disable BLOB operands to the LIKE and GLOB operators
NORMALIZE_DESC=		Enable sqlite3_normalized_sql API
RBU_DESC=		Enable RBU extension
SQLOFFSET_DESC=		Enable sqlite_offset(X) SQL function
STMTVTAB_DESC=		Enable SQLITE_STMT virtual table logic
STRICTSUBTYPE_DESC=	Enable SQLITE_STRICT_SUBTYPE

APIARMOR_CPPFLAGS=	-DSQLITE_ENABLE_API_ARMOR

HIDDENCOLUMNS_CFLAGS=	-DSQLITE_ENABLE_HIDDEN_COLUMNS

ICU_USES=		localbase:ldflags
ICU_LIB_DEPENDS=	libicudata.so:devel/icu
ICU_CONFIGURE_ON=	--with-icu-cflags="-I${LOCALBASE}/include" \
			--with-icu-ldflags="-L${LOCALBASE}/lib -licui18n -licuuc -licudata"

LIKENOBLOBS_CFLAGS=	-DSQLITE_LIKE_DOESNT_MATCH_BLOBS

NORMALIZE_CFLAGS=	-DSQLITE_ENABLE_NORMALIZE

RBU_CFLAGS=		-DSQLITE_ENABLE_RBU

SQLOFFSET_CFLAGS=	-DSQLITE_ENABLE_OFFSET_SQL_FUNC

STMTVTAB_CFLAGS=	-DSQLITE_ENABLE_STMTVTAB

STRICTSUBTYPE_CPPFLAGS=	-DSQLITE_STRICT_SUBTYPE=1

# Clean up files so slave ports gets a clean tree
.ifndef SQLITE3_SLAVE
post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/sqlite3
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/lib${PORTNAME}.so.${DISTVERSION}
.else
post-install:
	@${RM} ${STAGEDIR}${PREFIX}/bin/sqlite3
	@${RM} -r ${STAGEDIR}${PREFIX}/include
	@${RM} ${STAGEDIR}${PREFIX}/lib/libsqlite3.*
	@${RM} -r ${STAGEDIR}${PREFIX}/lib/pkgconfig
	@${RM} -r ${STAGEDIR}${PREFIX}/libdata
	@${RM} -r ${STAGEDIR}${PREFIX}/share
.  if ${SQLITE3_SLAVE} == tcl
	${INSTALL_PROGRAM} ${WRKSRC}/sqlite3_analyzer ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/sqltclsh ${STAGEDIR}${PREFIX}/bin/sqlite3_sqltclsh
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKDIR}/${SUB_FILES} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/contrib/sqlitecon.tcl ${STAGEDIR}${EXAMPLESDIR}
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/tcl${TCL_VER}/${PORTNAME}/libsqlite${DISTVERSION}.so
.  endif
.  if ${SQLITE3_SLAVE} == tools
	${INSTALL_PROGRAM} ${WRKSRC}/dbdump ${STAGEDIR}${PREFIX}/bin/sqlite3_dbdump
	${INSTALL_PROGRAM} ${WRKSRC}/showdb ${STAGEDIR}${PREFIX}/bin/sqlite3_showdb
	${INSTALL_PROGRAM} ${WRKSRC}/showstat4 ${STAGEDIR}${PREFIX}/bin/sqlite3_showstat4
	${INSTALL_PROGRAM} ${WRKSRC}/showjournal ${STAGEDIR}${PREFIX}/bin/sqlite3_showjournal
	${INSTALL_PROGRAM} ${WRKSRC}/showwal ${STAGEDIR}${PREFIX}/bin/sqlite3_showwal
	${INSTALL_PROGRAM} ${WRKSRC}/sqldiff ${STAGEDIR}${PREFIX}/bin/sqlite3_sqldiff
	${INSTALL_PROGRAM} ${WRKSRC}/sqlite3_rsync ${STAGEDIR}${PREFIX}/bin
.  endif
.endif

pre-test:
.if make(test) && !defined(SQLITE3_SLAVE) || (make(test) && defined(SQLITE3_SLAVE) && ${SQLITE3_SLAVE} != tcl)
	@${ECHO_MSG} "Unit tests requires Tcl and needs to be run under the databases/sqlite3-tcl port"
.endif

.include <bsd.port.mk>

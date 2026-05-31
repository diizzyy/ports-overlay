PORTREVISION=	0

PKGNAMEPREFIX=tcl-
PKGNAMESUFFIX=-tcl

COMMENT=	SQLite TCL extension and sqlite_analyzer utility
MASTERDIR=	${.CURDIR}/../sqlite3

USES=		sqlite tcl:build,test,run

# Tell master port we're a slave port
SQLITE3_SLAVE=	tcl

PATCHDIR=	${.CURDIR}/files
FILESDIR=	${.CURDIR}/files

DESCR=		${.CURDIR}/pkg-descr
PLIST=
PLIST_FILES=	bin/sqlite3_analyzer \
		bin/sqlite3_sqltclsh \
		lib/tcl${TCL_VER}/${PORTNAME}/libsqlite${DISTVERSION}.so \
		lib/tcl${TCL_VER}/${PORTNAME}/pkgIndex.tcl \
		share/examples/sqlite3/example.tcl \
		share/examples/sqlite3/sqlitecon.tcl

PLIST_SUB=	TCL_VER=${TCL_VER}

SUB_FILES=	example.tcl
SUB_LIST=	TCLSH_CMD=${TCLSH}

ALL_TARGET=	tcl sqlite3_analyzer sqltclsh
TEST_TARGET=	test

MAKE_ARGS=	LINK_TOOLS_DYNAMICALLY=1

CONFIGURE_ENV=	TCLLIBDIR=${TCL_LIBDIR}/${PORTNAME}
CONFIGURE_ARGS=	--with-tcl=${TCL_LIBDIR}

OPTIONS_EXCLUDE=	${OPTIONS_DEFINE}

# Cleanup and install is in databases/sqlite3/Makefile as
# post-install is already defined

.include "${MASTERDIR}/Makefile"

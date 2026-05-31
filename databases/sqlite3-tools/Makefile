PORTREVISION=	0

PKGNAMESUFFIX=	-tools

COMMENT=	SQLite utilities/tools
MASTERDIR=	${.CURDIR}/../sqlite3

USES=		sqlite

# Tell master port we're a slave port
SQLITE3_SLAVE=	tools

DESCR=		${.CURDIR}/pkg-descr
PLIST=		
PLIST_FILES=	bin/sqlite3_dbdump \
		bin/sqlite3_showdb \
		bin/sqlite3_showstat4 \
		bin/sqlite3_showjournal \
		bin/sqlite3_showwal \
		bin/sqlite3_sqldiff

ALL_TARGET=	dbdump showdb showjournal showstat4 showwal sqldiff

MAKE_ARGS=	LINK_TOOLS_DYNAMICALLY=1

OPTIONS_EXCLUDE=	${OPTIONS_DEFINE}

# Cleanup and install is in databases/sqlite3/Makefile as
# post-install is already defined

.include "${MASTERDIR}/Makefile"

#
# Updating notes: see multimedia/x264/Makefile.

PORTREVISION=	0
PKGNAMEPREFIX=	lib

COMMENT=	H.264/MPEG-4 AVC Video Encoding (Library)
MASTERDIR=	${.CURDIR}/../x264

# Clear dependency on libx264 (itself), see x264/Makefile
LIB_DEPENDS=

USE_LDCONFIG=	yes

CFLAGS_riscv64=	-fPIC
LDFLAGS_i386=	-Wl,-znotext
LDFLAGS_armv6=	-Wl,-znotext
LDFLAGS_armv7=	-Wl,-znotext

# Don't import PLIST_FILES from multimedia/x264
PLIST_FILES=
PLIST_SUB+=	X264BUILD=${DISTVERSION:R:E}
PLIST=		${.CURDIR}/pkg-plist

MESON_ARGS=	-Dcli=false

OPTIONS_DEFINE_aarch64=	ASM
OPTIONS_DEFINE_amd64=	ASM
OPTIONS_DEFAULT_aarch64=ASM
OPTIONS_DEFAULT_amd64=	ASM
OPTIONS_EXCLUDE=	BASH FFMS GPAC LAVF LSMASH SWSCALE

ASM_BUILD_DEPENDS=	${ASM_BUILD_DEPENDS_${ARCH}}
ASM_BUILD_DEPENDS_amd64=nasm>=2.13:devel/nasm
ASM_MESON_ENABLED=	asm

.include "${MASTERDIR}/Makefile"

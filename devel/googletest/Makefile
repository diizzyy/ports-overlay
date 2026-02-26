PORTNAME=	googletest
DISTVERSION=	1.17.0
CATEGORIES=	devel
MASTER_SITES=	https://github.com/google/${PORTNAME}/releases/download/v${DISTVERSION}/

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Framework for writing C++ tests on a variety of platforms
WWW=		https://google.github.io/googletest/ \
		https://github.com/google/googletest

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake:testing compiler:c++17-lang python:test shebangfix
SHEBANG_FILES=	googletest/test/*.py
USE_LDCONFIG=	yes

PLIST_SUB=	DISTVERSION=${DISTVERSION}

CMAKE_TESTING_ON=	gmock_build_tests \
			gtest_build_tests

CMAKE_ON=	BUILD_GMOCK \
		BUILD_SHARED_LIBS
CMAKE_ARGS=	-DCMAKE_CXX_STANDARD=17 \
		-DCMAKE_CTEST_ARGUMENTS="-E;'gmock-matchers-comparisons_test|googletest-port-test'"


.include <bsd.port.mk>

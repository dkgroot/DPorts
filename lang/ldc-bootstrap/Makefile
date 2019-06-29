# $FreeBSD$
PORTNAME=		ldc-bootstrap
PORTVERSION=		0.17.6
DISTVERSIONPREFIX=	v
CATEGORIES=		lang

MAINTAINER=		ddegroot@talon.nl
COMMENT=		LLVM-based bootstrap D compiler

LICENSE=		BSD3CLAUSE

BROKEN_armv6=		fails to compile: Error: undefined identifier _jmp_buf, did you mean alias jmp_buf?
BROKEN_armv7=		fails to compile: Error: undefined identifier _jmp_buf, did you mean alias jmp_buf?
BROKEN_i386=		function core.bitop.bsf (uint v) is not callable using argument types (ulong)
BROKEN_powerpc64=	fails to compile: cc1plus: error: unrecognized command line option "-std=c++11"

LLVM_VER=		70
BUILD_DEPENDS+=		llvm${LLVM_VER}>0:devel/llvm${LLVM_VER}
BUILD_DEPENDS+=		${LOCALBASE}/lib/libconfig.so:devel/libconfig
USES= 			ninja cmake:insource compiler
USE_LDCONFIG=   	yes

CONFLICTS_INSTALL=      ldc-bootstrap

.if !defined(PREFIX)
PREFIX=			${LOCALBASE}/ldc-ltsmaster
.endif

USE_GITHUB=		yes
GH_ACCOUNT=		ldc-developers
GH_PROJECT=		ldc
GH_TUPLE=		ldc-developers:druntime:13b1ccf:druntimelts/runtime/druntime \
			ldc-developers:phobos:1d758b2:phoboslts/runtime/phobos

LLVM_CONFIG=		${LOCALBASE}/bin/llvm-config${LLVM_VER}

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64" || ${ARCH} == "aarch64"
CFLAGS+=		-fPIC
CMAKE_ARGS+=            -DRT_CFLAGS="-fPIC"
.endif

CMAKE_ARGS+=		-DCMAKE_C_COMPILER:PATH="${CC}"
CMAKE_ARGS+=		-DCMAKE_CXX_COMPILER:PATH="${CXX}"
#CMAKE_ARGS+=		-DBUILD_SHARED_LIBS:BOOL=OFF
#CMAKE_ARGS+=		-DBUILD_SHARED:BOOL=OFF
#CMAKE_ARGS+=		-DLDC_LIB_TYPE:STRING="STATIC"
CMAKE_ARGS+=		-DLLVM_CONFIG:PATH=${LLVM_CONFIG}

.if ${OPSYS} == FreeBSD && ${OSVERSION} >= 1200000
.if ${OSVERSION} >= 1200031
EXTRA_PATCHES+=		${PATCHDIR}/ino64-*
.endif
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|$${llvm_config_names}|${LLVM_CONFIG}|g' \
		${WRKSRC}/cmake/Modules/FindLLVM.cmake

post-stage:
	(cd ${STAGEDIR}${PREFIX}/include/d/core/; rm stdc/errno.c threadasm.S) 	
	(cd ${STAGEDIR}${PREFIX}/include/d/ldc/; rm arm_unwind.c eh_asm.S msvc.c osx_tls.c)

.include <bsd.port.post.mk>

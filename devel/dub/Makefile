# $FreeBSD: head/devel/dub/Makefile 494892 2019-03-07 06:09:27Z acm $

PORTNAME=	dub
PORTVERSION=	1.18.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	acm@FreeBSD.org
COMMENT=	Package and build manager for D applications and libraries

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		dlang
LIB_DEPENDS=	libcurl.so:ftp/curl

USE_GITHUB=	yes
GH_ACCOUNT=	dlang

PLIST_FILES=	bin/${PORTNAME}

OPTIONS_DEFINE=	LTO
OPTIONS_DEFAULT=LTO
LTO_DESC=	Build with LTO enabled

DUB_FLAGS=	-ofbin/dub -w -version=DubUseCurl -version=DubApplication

.if !defined(WITH_DEBUG)
DFLAGS+=	-release --O -L--export-dynamic
.	if exists(${LOCALBASE}/bin/ld.gold)
DFLAGS+=	-linker=gold
.	endif
.else
DFLAGS+=	-O -g
.endif

.if S{PORT_OPTIONS:MLTO}
DFLAGS+=	-flto=full
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%PORTVERSION%%|${PORTVERSION}|g' ${WRKSRC}/source/dub/version_.d

do-build:
	cd ${WRKSRC} && DFLAGS="${DFLAGS}" ${DCOMPILER_DMD} ${DUB_FLAGS} -Isource @build-files.txt

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${PORTNAME} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>

# Created by: Alonso Cardenas Marquez <acm@FreeBSD.org>
# $FreeBSD: head/devel/libdparse/Makefile 494902 2019-03-07 06:18:01Z acm $

PORTNAME=	libdparse
PORTVERSION=	0.13.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	acm@FreeBSD.org
COMMENT=	Library for lexing and parsing D source code

LICENSE=	BSL

BUILD_DEPENDS=	${LOCALBASE}/lib/libmir-core.a:devel/mir-core \
		${LOCALBASE}/lib/libstdx-allocator.a:devel/stdx-allocator

USES=		dlang
DLANG_USES=	dub

USE_GITHUB=	yes
GH_ACCOUNT=	dlang-community

post-patch:
	${REINPLACE_CMD} '11,13d' ${WRKSRC}/dub.json

do-install:
	@${MKDIR} ${STAGEDIR}${D_INCLUDE_DIR}
	@${MKDIR} ${STAGEDIR}${D_LIB_DIR}
	${INSTALL_DATA} ${WRKSRC}/libdparse.a ${STAGEDIR}${D_LIB_DIR}
	cd ${WRKSRC}/src && ${COPYTREE_SHARE} . ${STAGEDIR}${D_INCLUDE_DIR} "-name *\.d"

.include <bsd.port.mk>

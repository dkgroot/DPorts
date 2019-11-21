# $FreeBSD: head/devel/stdx-allocator/Makefile 494895 2019-03-07 06:11:57Z acm $

PORTNAME=	stdx-allocator
PORTVERSION=	2.77.5
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	acm@FreeBSD.org
COMMENT=	Containers backed on dlang by std.experimental.allocator

LICENSE=	BSL

BUILD_DEPENDS=	${LOCALBASE}/lib/libmir-core.a:devel/mir-core

USES=		dlang
DLANG_USES=	dub

USE_GITHUB=	yes
GH_ACCOUNT=	dlang-community

post-patch:
	${REINPLACE_CMD} '6d' ${WRKSRC}/dub.sdl

do-install:
	@${MKDIR} ${STAGEDIR}${D_INCLUDE_DIR}
	@${MKDIR} ${STAGEDIR}${D_LIB_DIR}
	${INSTALL_DATA} ${WRKSRC}/libstdx-allocator.a ${STAGEDIR}${D_LIB_DIR}
	cd ${WRKSRC}/source && ${COPYTREE_SHARE} . ${STAGEDIR}${D_INCLUDE_DIR} "-name *\.d"

.include <bsd.port.mk>

# Created by: Alonso Cardenas Marquez <acm@FreeBSD.org>
# $FreeBSD: head/devel/dsymbol/Makefile 494900 2019-03-07 06:16:17Z acm $

PORTNAME=	dsymbol
PORTVERSION=	0.9.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	acm@FreeBSD.org
COMMENT=	Symbol lookup support for libdparse

LICENSE=	BSL

BUILD_DEPENDS=	${LOCALBASE}/lib/libmir-core.a:devel/mir-core \
		${LOCALBASE}/lib/libdparse.a:devel/libdparse \
		${LOCALBASE}/lib/libemsi_containers.a:devel/containers \
		${LOCALBASE}/lib/libstdx-allocator.a:devel/stdx-allocator

USES=		pkgconfig dlang
DLANG_USES=	dub
USE_GITHUB=	yes
GH_ACCOUNT=	dlang-community

post-patch:
	${REINPLACE_CMD} -e '7,11d' ${WRKSRC}/dub.json
	${REINPLACE_CMD} -e 's@cache.clear@cache.destroy@g' \
		${WRKSRC}/src/dsymbol/modulecache.d

do-install:
	@${MKDIR} ${STAGEDIR}${D_INCLUDE_DIR}
	@${MKDIR} ${STAGEDIR}${D_LIB_DIR}
	${INSTALL_DATA} ${WRKSRC}/libdsymbol.a ${STAGEDIR}${D_LIB_DIR}
	cd ${WRKSRC}/src && ${COPYTREE_SHARE} . ${STAGEDIR}${D_INCLUDE_DIR} "-name *\.d"

.include <bsd.port.mk>

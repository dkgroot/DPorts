# Created by: Alonso Cardenas Marquez <acm@FreeBSD.org>
# $FreeBSD: head/devel/containers/Makefile 494894 2019-03-07 06:10:46Z acm $

PORTNAME=	containers
DISTVERSION=	0.8.0-alpha.14
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	acm@FreeBSD.org
COMMENT=	Containers backed on dlang by std.experimental.allocator

LICENSE=	BSL

BUILD_DEPENDS=	${LOCALBASE}/lib/libmir-core.a:devel/mir-core \
		${LOCALBASE}/lib/libstdx-allocator.a:devel/stdx-allocator

USES=           dlang
DLANG_USES=     dub

USE_GITHUB=	yes
#GH_ACCOUNT=	economicmodeling
GH_ACCOUNT=	dlang-community

post-patch:
	${REINPLACE_CMD} -e "s|%%LOCALBASE%%|${LOCALBASE}|g" ${WRKSRC}/dub.json

do-install:
	@${MKDIR} ${STAGEDIR}${D_INCLUDE_DIR}
	@${MKDIR} ${STAGEDIR}${D_LIB_DIR}
	${INSTALL_DATA} ${WRKSRC}/libemsi_containers.a ${STAGEDIR}${D_LIB_DIR}
	cd ${WRKSRC}/src && ${COPYTREE_SHARE} . ${STAGEDIR}${D_INCLUDE_DIR} "-name *\.d"

.include <bsd.port.mk>

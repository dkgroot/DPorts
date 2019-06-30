# $FreeBSD: head/devel/mir-core/Makefile 494903 2019-03-07 06:18:27Z acm $

PORTNAME=	mir-core
PORTVERSION=	1.0.2
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	acm@FreeBSD.org
COMMENT=	base software building blocks and conventions

LICENSE=	BSL

USES=		dlang
DLANG_USES=	dub

USE_GITHUB=	yes
GH_ACCOUNT=	libmir

do-install:
	@${MKDIR} ${STAGEDIR}${D_INCLUDE_DIR}
	@${MKDIR} ${STAGEDIR}${D_LIB_DIR}
	${INSTALL_DATA} ${WRKSRC}/libmir-core.a ${STAGEDIR}${D_LIB_DIR}
	cd ${WRKSRC}/source && ${COPYTREE_SHARE} . ${STAGEDIR}${D_INCLUDE_DIR} "-name *\.d"

.include <bsd.port.mk>

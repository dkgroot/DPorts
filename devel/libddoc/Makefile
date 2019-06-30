# Created by: Alonso Cardenas Marquez <acm@FreeBSD.org>
# $FreeBSD: head/devel/libddoc/Makefile 494901 2019-03-07 06:17:33Z acm $

PORTNAME=	libddoc
PORTVERSION=	0.7.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	acm@FreeBSD.org
COMMENT=	D implementation of the DDoc macro system

LICENSE=	BSL

BUILD_DEPENDS=	${LOCALBASE}/lib/libdparse.a:devel/libdparse

USES=		dlang
DLANG_USES=	dub

USE_GITHUB=	yes
GH_ACCOUNT=	economicmodeling
# Note that beta.1 is a perfectly acceptable version, this is not required at
# all.
GH_TAGNAME=	${DISTVERSIONFULL:S/beta/beta./}

post-patch:
	${REINPLACE_CMD} -e '22,24d' ${WRKSRC}/dub.json

do-install:
	@${MKDIR} ${STAGEDIR}${D_INCLUDE_DIR}
	@${MKDIR} ${STAGEDIR}${D_LIB_DIR}
	${INSTALL_DATA} ${WRKSRC}/bin/libddoc.a ${STAGEDIR}${D_LIB_DIR}
	cd ${WRKSRC}/src && ${COPYTREE_SHARE} . ${STAGEDIR}${D_INCLUDE_DIR} "-name *\.d"

.include <bsd.port.mk>

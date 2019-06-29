# Created by: Alonso Cardenas Marquez <acm@FreeBSD.org>
# $FreeBSD: head/devel/d-scanner/Makefile 494896 2019-03-07 06:13:04Z acm $

PORTNAME=	d-scanner
PORTVERSION=	0.8.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	acm@FreeBSD.org
COMMENT=	Swiss-army knife for D source code

LICENSE=	BSL

BUILD_DEPENDS=	${LOCALBASE}/lib/libemsi_containers.a:devel/containers \
		${LOCALBASE}/lib/libdsymbol.a:devel/dsymbol \
		${LOCALBASE}/lib/libinifiled.a:devel/inifiled \
		${LOCALBASE}/lib/libddoc.a:devel/libddoc \
		${LOCALBASE}/lib/libdparse.a:devel/libdparse \
		${LOCALBASE}/lib/libmir-core.a:devel/mir-core \
		${LOCALBASE}/lib/libstdx-allocator.a:devel/stdx-allocator \
		
USES=		pkgconfig dlang
DLANG_USES=	dub rdmd

USE_GITHUB=	yes
GH_ACCOUNT=	dlang-community
GH_PROJECT=	D-Scanner

PLIST_FILES=	bin/dscanner

post-patch:
	${REINPLACE_CMD} 's|%%D_LIBS%%|-L${D_LIB_DIR}|g' ${WRKSRC}/dub.json

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/dscanner ${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>

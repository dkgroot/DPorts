# Created by: Alonso Cardenas Marquez <acm@FreeBSD.org>
# $FreeBSD: head/lang/dlang-tools/Makefile 494893 2019-03-07 06:09:55Z acm $

PORTNAME=	tools
PORTVERSION=	2.089.0
DISTVERSIONPREFIX=	v
CATEGORIES=	lang
PKGNAMEPREFIX=	dlang-

MAINTAINER=	acm@FreeBSD.org
COMMENT=	Ancillary tools for the D programming language compiler

LICENSE=	BSL

BUILD_DEPENDS=	${LOCALBASE}/lib/libdparse.a:devel/libdparse

USES=		dlang

USE_GITHUB=	yes
GH_ACCOUNT=	dlang

TOOLS_LIST=	catdoc changed checkwhitespace contributors ddemangle detab dget rdmd tolf

do-build:
.for f in ${TOOLS_LIST}
	${DCOMPILER} ${WRKSRC}/${f}.d -of=${WRKSRC}/${f}
.endfor
	cd ${WRKSRC}/DustMite && ${DCOMPILER} dustmite.d splitter.d -of=${WRKSRC}/dustmite

do-install:
.for f in ${TOOLS_LIST} dustmite
	${INSTALL_PROGRAM} ${WRKSRC}/${f} ${STAGEDIR}${PREFIX}/bin/
.endfor
	${INSTALL_MAN} ${WRKSRC}/man/man1/rdmd.1 ${STAGEDIR}${MAN1PREFIX}/man/man1

.include <bsd.port.mk>

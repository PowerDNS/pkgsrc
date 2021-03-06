# $NetBSD: buildlink3.mk,v 1.2 2018/03/07 11:57:37 wiz Exp $

BUILDLINK_TREE+=	libXpresent

.if !defined(LIBXPRESENT_BUILDLINK3_MK)
LIBXPRESENT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libXpresent+=	libXpresent>=1.0.0
BUILDLINK_PKGSRCDIR.libXpresent?=	../../x11/libXpresent

.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXfixes/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../x11/xorgproto/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.endif	# LIBXPRESENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-libXpresent

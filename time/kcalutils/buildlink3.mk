# $NetBSD: buildlink3.mk,v 1.4 2020/03/10 22:09:02 wiz Exp $

BUILDLINK_TREE+=	kcalutils

.if !defined(KCALUTILS_BUILDLINK3_MK)
KCALUTILS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kcalutils+=	kcalutils>=17.12.1
BUILDLINK_ABI_DEPENDS.kcalutils?=		kcalutils>=19.12.1nb2
BUILDLINK_PKGSRCDIR.kcalutils?=		../../time/kcalutils

.include "../../misc/kidentitymanagement/buildlink3.mk"
.include "../../time/kcalendarcore/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# KCALUTILS_BUILDLINK3_MK

BUILDLINK_TREE+=	-kcalutils

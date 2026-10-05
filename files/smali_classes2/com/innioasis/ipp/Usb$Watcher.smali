.class final Lcom/innioasis/ipp/Usb$Watcher;
.super Landroid/os/Binder;
.source "Usb.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Usb;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Watcher"
.end annotation

.field final static DESC:Ljava/lang/String; = "android.app.IActivityController"

.method constructor <init>()V
  .registers 3
  .line 70
    invoke-direct { p0 }, Landroid/os/Binder;-><init>()V
  .line 71
    const/4 v0, 0
    const-string v1, "android.app.IActivityController"
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/ipp/Usb$Watcher;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V
  .line 72
    return-void
.end method

.method protected onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
  .catchall { :L3 .. :L4 } :L10
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L11 .. :L12 } :L13
  .catchall { :L15 .. :L16 } :L17
  .registers 8
  .line 76
    const/4 v0, 0
    const/4 v1, 1
    if-lt p1, v1, :L15
    const/4 v2, 5
    if-le p1, v2, :L0
    goto :L15
  :L0
  .line 83
    const/4 p4, 4
    if-eq p1, p4, :L2
    if-ne p1, v2, :L1
    goto :L2
  :L1
    const/4 p4, 1
    goto :L3
  :L2
    const/4 p4, 0
  :L3
  .line 85
    const-string v2, "android.app.IActivityController"
    invoke-virtual { p2, v2 }, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V
  .line 86
    if-ne p1, v1, :L8
    invoke-virtual { p2 }, Landroid/os/Parcel;->readInt()I
    move-result p1
    if-eqz p1, :L8
  .line 87
    sget-object p1, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;
    invoke-interface { p1, p2 }, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Landroid/content/Intent;
  .line 88
    invoke-static { }, Lcom/innioasis/ipp/Usb;->access$100()Landroid/content/ComponentName;
    move-result-object p2
    invoke-virtual { p1 }, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;
    move-result-object p1
    invoke-virtual { p2, p1 }, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z
    move-result p1
  :L4
    if-eqz p1, :L8
  .line 89
    nop
  :L5
  .line 90
    invoke-static { }, Lcom/innioasis/ipp/Usb;->access$200()Landroid/os/Handler;
    move-result-object p1
    new-instance p2, Lcom/innioasis/ipp/Usb$Open;
    invoke-direct { p2 }, Lcom/innioasis/ipp/Usb$Open;-><init>()V
    invoke-virtual { p1, p2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L6
    goto :L9
  :L7
  .line 93
    move-exception p1
    goto :L11
  :L8
  .line 94
    move v0, p4
  :L9
    goto :L11
  :L10
  .line 93
    move-exception p1
    move v0, p4
  :L11
  .line 96
    invoke-virtual { p3 }, Landroid/os/Parcel;->writeNoException()V
  .line 97
    invoke-virtual { p3, v0 }, Landroid/os/Parcel;->writeInt(I)V
  :L12
  .line 99
    goto :L14
  :L13
  .line 98
    move-exception p1
  :L14
  .line 100
    return v1
  :L15
  .line 78
    invoke-super { p0, p1, p2, p3, p4 }, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    move-result p1
  :L16
    return p1
  :L17
  .line 79
    move-exception p1
  .line 80
    return v0
.end method

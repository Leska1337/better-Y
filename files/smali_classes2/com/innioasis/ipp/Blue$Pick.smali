.class final Lcom/innioasis/ipp/Blue$Pick;
.super Ljava/lang/Object;
.implements Lcom/innioasis/music/util/SubMenuDialog$Callback;
.source "Blue.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Blue;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Pick"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/BluetoothActivity;

.field private final d:Landroid/bluetooth/BluetoothDevice;

.method constructor <init>(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 3
  .line 79
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 80
    iput-object p1, p0, Lcom/innioasis/ipp/Blue$Pick;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
  .line 81
    iput-object p2, p0, Lcom/innioasis/ipp/Blue$Pick;->d:Landroid/bluetooth/BluetoothDevice;
  .line 82
    return-void
.end method

.method public select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 5
  .line 85
    if-nez p2, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 86
    const/4 p2, 1
    if-nez p1, :L2
    return p2
  :L2
  .line 87
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Pick;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
    const v1, 2131821101
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    iget-object p1, p0, Lcom/innioasis/ipp/Blue$Pick;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Pick;->d:Landroid/bluetooth/BluetoothDevice;
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Blue;->access$000(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
    goto :L4
  :L3
  .line 88
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Pick;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
    const v1, 2131821102
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/BluetoothActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L4
    iget-object p1, p0, Lcom/innioasis/ipp/Blue$Pick;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Pick;->d:Landroid/bluetooth/BluetoothDevice;
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Blue;->access$100(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  :L4
  .line 89
    return p2
.end method

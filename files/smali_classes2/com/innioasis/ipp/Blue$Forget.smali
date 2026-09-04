.class final Lcom/innioasis/ipp/Blue$Forget;
.super Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;
.source "Blue.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Blue;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Forget"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/BluetoothActivity;

.field private final d:Landroid/bluetooth/BluetoothDevice;

.method constructor <init>(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 3
  .line 108
    invoke-direct { p0 }, Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;-><init>()V
  .line 109
    iput-object p1, p0, Lcom/innioasis/ipp/Blue$Forget;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
  .line 110
    iput-object p2, p0, Lcom/innioasis/ipp/Blue$Forget;->d:Landroid/bluetooth/BluetoothDevice;
  .line 111
    return-void
.end method

.method public cancel()V
  .registers 1
  .line 113
    return-void
.end method

.method public confirm()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 117
    sget-object v0, Lcom/innioasis/y1/utils/BLUtils;->INSTANCE:Lcom/innioasis/y1/utils/BLUtils;
    iget-object v1, p0, Lcom/innioasis/ipp/Blue$Forget;->d:Landroid/bluetooth/BluetoothDevice;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/BLUtils;->unPairDevice(Landroid/bluetooth/BluetoothDevice;)Z
  :L1
  .line 120
    goto :L3
  :L2
  .line 118
    move-exception v0
  :L3
  .line 121
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Forget;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/BluetoothActivity;->setMark(I)V
  .line 122
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Forget;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Blue;->access$200(Lcom/innioasis/y1/activity/BluetoothActivity;Z)V
  .line 123
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Forget;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Blue;->access$300(Lcom/innioasis/y1/activity/BluetoothActivity;)V
  .line 124
    return-void
.end method

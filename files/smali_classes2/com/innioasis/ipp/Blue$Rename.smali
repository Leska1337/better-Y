.class final Lcom/innioasis/ipp/Blue$Rename;
.super Ljava/lang/Object;
.implements Lcom/innioasis/y1/utils/InputMethodDialog$Callback;
.source "Blue.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Blue;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Rename"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/BluetoothActivity;

.field private final d:Landroid/bluetooth/BluetoothDevice;

.field private live:Landroidx/lifecycle/MutableLiveData;

.method constructor <init>(Lcom/innioasis/y1/activity/BluetoothActivity;Landroid/bluetooth/BluetoothDevice;)V
  .registers 3
  .line 163
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 164
    iput-object p1, p0, Lcom/innioasis/ipp/Blue$Rename;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
  .line 165
    iput-object p2, p0, Lcom/innioasis/ipp/Blue$Rename;->d:Landroid/bluetooth/BluetoothDevice;
  .line 166
    return-void
.end method

.method public onBack()V
  .catchall { :L0 .. :L6 } :L12
  .catchall { :L7 .. :L10 } :L12
  .registers 6
  :L0
  .line 179
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Rename;->live:Landroidx/lifecycle/MutableLiveData;
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Landroidx/lifecycle/MutableLiveData;->getValue()Ljava/lang/Object;
    move-result-object v0
  :L2
  .line 180
    if-nez v0, :L3
    const-string v0, ""
    goto :L4
  :L3
    invoke-static { v0 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
  :L4
  .line 181
    invoke-static { }, Lcom/innioasis/ipp/Blue;->access$400()Landroid/content/SharedPreferences;
    move-result-object v1
  .line 182
    iget-object v2, p0, Lcom/innioasis/ipp/Blue$Rename;->d:Landroid/bluetooth/BluetoothDevice;
    invoke-virtual { v2 }, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
    move-result-object v2
  .line 183
    if-eqz v1, :L11
    if-nez v2, :L5
    goto :L11
  :L5
  .line 184
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v3
  :L6
    const-string v4, "bt_name:"
    if-nez v3, :L8
  :L7
    invoke-interface { v1 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface { v0 }, Landroid/content/SharedPreferences$Editor;->commit()Z
    goto :L9
  :L8
  .line 185
    invoke-interface { v1 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v1
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2, v0 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface { v0 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L9
  .line 186
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Rename;->a:Lcom/innioasis/y1/activity/BluetoothActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Blue;->access$300(Lcom/innioasis/y1/activity/BluetoothActivity;)V
  :L10
  .line 189
    goto :L13
  :L11
  .line 183
    return-void
  :L12
  .line 187
    move-exception v0
  :L13
  .line 190
    return-void
.end method

.method public onInit(Landroidx/lifecycle/MutableLiveData;)V
  .registers 2
  .line 169
    iput-object p1, p0, Lcom/innioasis/ipp/Blue$Rename;->live:Landroidx/lifecycle/MutableLiveData;
  .line 170
    return-void
.end method

.method seed(Ljava/lang/String;)V
  .registers 3
  .line 174
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Rename;->live:Landroidx/lifecycle/MutableLiveData;
    if-eqz v0, :L0
    invoke-virtual { v0, p1 }, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V
  :L0
  .line 175
    return-void
.end method

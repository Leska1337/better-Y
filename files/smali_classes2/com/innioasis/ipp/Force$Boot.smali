.class final Lcom/innioasis/ipp/Force$Boot;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Force.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Force;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Boot"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 232
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Force$1;)V
  .registers 2
  .line 232
    invoke-direct { p0 }, Lcom/innioasis/ipp/Force$Boot;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L6
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L14 .. :L15 } :L16
  .registers 6
  .line 234
    const-string v0, "ippForce"
    invoke-static { }, Lcom/innioasis/ipp/Force;->saveState()V
  .line 241
    nop
  .line 243
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
  .line 244
    if-nez v2, :L1
    const/4 v2, 0
    goto :L2
  :L1
  .line 245
    const-string v3, "power"
    invoke-virtual { v2, v3 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/os/PowerManager;
  :L2
  .line 246
    if-eqz v2, :L4
  .line 247
    const-string v3, ""
    invoke-virtual { v2, v3 }, Landroid/os/PowerManager;->reboot(Ljava/lang/String;)V
  :L3
  .line 248
    const/4 v2, 1
    goto :L5
  :L4
  .line 246
    const/4 v2, 0
  :L5
  .line 252
    goto :L7
  :L6
  .line 250
    move-exception v2
  .line 251
    const-string v3, "PowerManager.reboot failed"
    invoke-static { v0, v3, v2 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    const/4 v2, 0
  :L7
  .line 253
    if-eqz v2, :L8
    const-wide/16 v2, 20000
    goto :L9
  :L8
    const-wide/16 v2, 3000
  :L9
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Force;->access$500(J)V
  .line 254
    invoke-static { }, Lcom/innioasis/ipp/Force;->access$600()I
    move-result v2
  .line 255
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "still here; system_server pid="
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static { v0, v3 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
  .line 256
    if-lez v2, :L14
  :L10
  .line 258
    invoke-static { v2 }, Landroid/os/Process;->killProcess(I)V
  :L11
  .line 261
    goto :L13
  :L12
  .line 259
    move-exception v0
  :L13
  .line 262
    const-wide/16 v2, 4000
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Force;->access$500(J)V
  :L14
  .line 265
    invoke-static { }, Landroid/os/Process;->myPid()I
    move-result v0
    invoke-static { v0 }, Landroid/os/Process;->killProcess(I)V
  :L15
  .line 268
    goto :L17
  :L16
  .line 266
    move-exception v0
  .line 267
    invoke-static { v1 }, Lcom/innioasis/ipp/Force;->access$702(Z)Z
  :L17
  .line 269
    return-void
.end method

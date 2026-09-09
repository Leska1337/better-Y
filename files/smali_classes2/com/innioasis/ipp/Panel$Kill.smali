.class final Lcom/innioasis/ipp/Panel$Kill;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Panel.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Panel;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Kill"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 245
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Panel$1;)V
  .registers 2
  .line 245
    invoke-direct { p0 }, Lcom/innioasis/ipp/Panel$Kill;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L4 .. :L5 } :L6
  .registers 5
  .line 247
    const-string v0, "/system/bin/surfaceflinger"
    invoke-static { v0 }, Lcom/innioasis/ipp/Force;->pidOf(Ljava/lang/String;)I
    move-result v0
  .line 248
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "restarting surfaceflinger, pid="
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "ippPanel"
    invoke-static { v2, v1 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
  .line 249
    if-lez v0, :L3
  :L0
  .line 251
    invoke-static { v0 }, Landroid/os/Process;->killProcess(I)V
  :L1
  .line 254
    goto :L3
  :L2
  .line 252
    move-exception v0
  .line 253
    const-string v1, "kill surfaceflinger failed"
    invoke-static { v2, v1, v0 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
  :L3
  .line 256
    const-wide/16 v0, 6000
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Panel;->access$100(J)V
  .line 259
    const-string v0, "system_server"
    invoke-static { v0 }, Lcom/innioasis/ipp/Force;->pidOf(Ljava/lang/String;)I
    move-result v0
  .line 260
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "still here; system_server pid="
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v2, v1 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
  .line 261
    if-lez v0, :L7
  :L4
  .line 263
    invoke-static { v0 }, Landroid/os/Process;->killProcess(I)V
  :L5
  .line 266
    goto :L7
  :L6
  .line 264
    move-exception v0
  :L7
  .line 268
    return-void
.end method

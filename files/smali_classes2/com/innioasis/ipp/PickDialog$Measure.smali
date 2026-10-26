.class final Lcom/innioasis/ipp/PickDialog$Measure;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PickDialog.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PickDialog;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Measure"
.end annotation

.field private final d:Lcom/innioasis/ipp/PickDialog;

.method constructor <init>(Lcom/innioasis/ipp/PickDialog;)V
  .registers 2
  .line 405
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    return-void
.end method

.method private post([J)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 437
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v0 }, Lcom/innioasis/ipp/PickDialog;->access$300(Lcom/innioasis/ipp/PickDialog;)Landroid/app/Activity;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/PickDialog$Apply;
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-direct { v1, v2, p1 }, Lcom/innioasis/ipp/PickDialog$Apply;-><init>(Lcom/innioasis/ipp/PickDialog;[J)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L1
  .line 439
    goto :L3
  :L2
  .line 438
    move-exception p1
  :L3
  .line 440
    return-void
.end method

.method public run()V
  .registers 18
  .line 408
    move-object/from16 v0, p0
    iget-object v1, v0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v1 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v1
    array-length v1, v1
    const/4 v2, 1
    add-int/2addr v1, v2
    new-array v1, v1, [J
  .line 409
    const-wide/16 v3, -1
    invoke-static { v1, v3, v4 }, Ljava/util/Arrays;->fill([JJ)V
  .line 410
    nop
  .line 411
    const-wide/16 v3, 0
    const/4 v5, 0
    const/4 v6, 0
  :L0
    iget-object v7, v0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v7 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v7
    array-length v7, v7
    const-string v8, " ms"
    const-string v9, " bytes +"
    const-string v10, ": "
    const-string v11, "pick size "
    const-string v12, "ipplab"
    if-ge v6, v7, :L3
  .line 412
    iget-object v7, v0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v7 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v7
    aget v7, v7, v6
    invoke-static { v7 }, Lcom/innioasis/ipp/Pick;->inTotal(I)Z
    move-result v7
    if-nez v7, :L1
    goto :L2
  :L1
  .line 413
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v13
  .line 414
    iget-object v7, v0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v7 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v7
    aget v7, v7, v6
    move-wide v15, v3
    invoke-static { v7 }, Lcom/innioasis/ipp/Pick;->size(I)J
    move-result-wide v2
  .line 415
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v4, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    iget-object v7, v0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v7 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v7
    aget v7, v7, v6
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
  .line 416
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v9
    sub-long/2addr v9, v13
    invoke-virtual { v4, v9, v10 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
  .line 415
    invoke-static { v12, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 417
    add-int/lit8 v4, v6, 1
    aput-wide v2, v1, v4
  .line 418
    add-long/2addr v2, v15
    move-wide v3, v2
  :L2
  .line 411
    add-int/lit8 v6, v6, 1
    const/4 v2, 1
    goto :L0
  :L3
  .line 420
    move-wide v15, v3
    aput-wide v15, v1, v5
  .line 421
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/PickDialog$Measure;->post([J)V
  .line 422
    invoke-virtual { v1 }, [J->clone()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [J
  .line 423
    nop
  .line 424
    const/4 v2, 0
  :L4
    iget-object v3, v0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v3 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v3
    array-length v3, v3
    if-ge v5, v3, :L7
  .line 425
    iget-object v3, v0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v3 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v3
    aget v3, v3, v5
    invoke-static { v3 }, Lcom/innioasis/ipp/Pick;->inTotal(I)Z
    move-result v3
    if-nez v3, :L6
    iget-object v3, v0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/PickDialog;->isShowing()Z
    move-result v3
    if-nez v3, :L5
    goto :L6
  :L5
  .line 426
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 427
    add-int/lit8 v4, v5, 1
    iget-object v6, v0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v6 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v6
    aget v6, v6, v5
    invoke-static { v6 }, Lcom/innioasis/ipp/Pick;->size(I)J
    move-result-wide v6
    aput-wide v6, v1, v4
  .line 428
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v6, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    iget-object v7, v0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v7 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v7
    aget v7, v7, v5
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    aget-wide v13, v1, v4
    invoke-virtual { v6, v13, v14 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
  .line 429
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
    sub-long/2addr v6, v2
    invoke-virtual { v4, v6, v7 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  .line 428
    invoke-static { v12, v2 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 430
    const/4 v2, 1
  :L6
  .line 424
    add-int/lit8 v5, v5, 1
    goto :L4
  :L7
  .line 432
    if-eqz v2, :L8
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/PickDialog$Measure;->post([J)V
  :L8
  .line 433
    return-void
.end method

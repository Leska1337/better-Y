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
  .line 447
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    return-void
.end method

.method private post([J)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 473
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v0 }, Lcom/innioasis/ipp/PickDialog;->access$400(Lcom/innioasis/ipp/PickDialog;)Landroid/app/Activity;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/PickDialog$Apply;
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-direct { v1, v2, p1 }, Lcom/innioasis/ipp/PickDialog$Apply;-><init>(Lcom/innioasis/ipp/PickDialog;[J)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L1
  .line 475
    goto :L3
  :L2
  .line 474
    move-exception p1
  :L3
  .line 476
    return-void
.end method

.method public run()V
  .registers 10
  .line 450
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v0 }, Lcom/innioasis/ipp/PickDialog;->access$300(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v0
    array-length v0, v0
    const/4 v1, 1
    add-int/2addr v0, v1
    new-array v0, v0, [J
  .line 451
    const-wide/16 v2, -1
    invoke-static { v0, v2, v3 }, Ljava/util/Arrays;->fill([JJ)V
  .line 452
    nop
  .line 453
    const-wide/16 v2, 0
    const/4 v4, 0
    const/4 v5, 0
  :L0
    iget-object v6, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v6 }, Lcom/innioasis/ipp/PickDialog;->access$300(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v6
    array-length v6, v6
    if-ge v5, v6, :L3
  .line 454
    iget-object v6, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v6 }, Lcom/innioasis/ipp/PickDialog;->access$300(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v6
    aget v6, v6, v5
    invoke-static { v6 }, Lcom/innioasis/ipp/Pick;->inTotal(I)Z
    move-result v6
    if-nez v6, :L1
    goto :L2
  :L1
  .line 455
    iget-object v6, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v6 }, Lcom/innioasis/ipp/PickDialog;->access$300(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v6
    aget v6, v6, v5
    invoke-static { v6 }, Lcom/innioasis/ipp/Pick;->size(I)J
    move-result-wide v6
  .line 456
    add-int/lit8 v8, v5, 1
    aput-wide v6, v0, v8
  .line 457
    add-long/2addr v2, v6
  :L2
  .line 453
    add-int/lit8 v5, v5, 1
    goto :L0
  :L3
  .line 459
    aput-wide v2, v0, v4
  .line 460
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/PickDialog$Measure;->post([J)V
  .line 461
    invoke-virtual { v0 }, [J->clone()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [J
  .line 462
    nop
  .line 463
    const/4 v2, 0
  :L4
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v3 }, Lcom/innioasis/ipp/PickDialog;->access$300(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v3
    array-length v3, v3
    if-ge v4, v3, :L7
  .line 464
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v3 }, Lcom/innioasis/ipp/PickDialog;->access$300(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v3
    aget v3, v3, v4
    invoke-static { v3 }, Lcom/innioasis/ipp/Pick;->inTotal(I)Z
    move-result v3
    if-nez v3, :L6
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/PickDialog;->isShowing()Z
    move-result v3
    if-nez v3, :L5
    goto :L6
  :L5
  .line 465
    add-int/lit8 v2, v4, 1
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v3 }, Lcom/innioasis/ipp/PickDialog;->access$300(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v3
    aget v3, v3, v4
    invoke-static { v3 }, Lcom/innioasis/ipp/Pick;->size(I)J
    move-result-wide v5
    aput-wide v5, v0, v2
  .line 466
    const/4 v2, 1
  :L6
  .line 463
    add-int/lit8 v4, v4, 1
    goto :L4
  :L7
  .line 468
    if-eqz v2, :L8
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/PickDialog$Measure;->post([J)V
  :L8
  .line 469
    return-void
.end method

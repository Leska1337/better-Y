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
  .line 424
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    return-void
.end method

.method public run()V
  .catchall { :L2 .. :L3 } :L4
  .registers 8
  .line 427
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v0 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v0
    array-length v0, v0
    add-int/lit8 v0, v0, 1
    new-array v0, v0, [J
  .line 428
    nop
  .line 429
    const-wide/16 v1, 0
    const/4 v3, 0
    const/4 v4, 0
  :L0
    iget-object v5, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v5 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v5
    array-length v5, v5
    if-ge v4, v5, :L1
  .line 430
    iget-object v5, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v5 }, Lcom/innioasis/ipp/PickDialog;->access$200(Lcom/innioasis/ipp/PickDialog;)[I
    move-result-object v5
    aget v5, v5, v4
    invoke-static { v5 }, Lcom/innioasis/ipp/Pick;->size(I)J
    move-result-wide v5
  .line 431
    add-int/lit8 v4, v4, 1
    aput-wide v5, v0, v4
  .line 432
    add-long/2addr v1, v5
  .line 429
    goto :L0
  :L1
  .line 434
    aput-wide v1, v0, v3
  :L2
  .line 436
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v1 }, Lcom/innioasis/ipp/PickDialog;->access$300(Lcom/innioasis/ipp/PickDialog;)Landroid/app/Activity;
    move-result-object v1
    new-instance v2, Lcom/innioasis/ipp/PickDialog$Apply;
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog$Measure;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-direct { v2, v3, v0 }, Lcom/innioasis/ipp/PickDialog$Apply;-><init>(Lcom/innioasis/ipp/PickDialog;[J)V
    invoke-virtual { v1, v2 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L3
  .line 439
    goto :L5
  :L4
  .line 437
    move-exception v0
  :L5
  .line 440
    return-void
.end method

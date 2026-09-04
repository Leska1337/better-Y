.class final Lcom/innioasis/ipp/PickDialog$Apply;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PickDialog.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PickDialog;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Apply"
.end annotation

.field private final d:Lcom/innioasis/ipp/PickDialog;

.field private final out:[J

.method constructor <init>(Lcom/innioasis/ipp/PickDialog;[J)V
  .registers 3
  .line 448
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 449
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog$Apply;->d:Lcom/innioasis/ipp/PickDialog;
  .line 450
    iput-object p2, p0, Lcom/innioasis/ipp/PickDialog$Apply;->out:[J
  .line 451
    return-void
.end method

.method public run()V
  .registers 6
  .line 454
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog$Apply;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/PickDialog;->isShowing()Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 455
    const/4 v0, 0
  :L1
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog$Apply;->out:[J
    array-length v1, v1
    if-ge v0, v1, :L2
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog$Apply;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v1 }, Lcom/innioasis/ipp/PickDialog;->access$400(Lcom/innioasis/ipp/PickDialog;)[J
    move-result-object v1
    array-length v1, v1
    if-ge v0, v1, :L2
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog$Apply;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v1 }, Lcom/innioasis/ipp/PickDialog;->access$400(Lcom/innioasis/ipp/PickDialog;)[J
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog$Apply;->out:[J
    aget-wide v3, v2, v0
    aput-wide v3, v1, v0
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 456
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog$Apply;->d:Lcom/innioasis/ipp/PickDialog;
    invoke-static { v0 }, Lcom/innioasis/ipp/PickDialog;->access$100(Lcom/innioasis/ipp/PickDialog;)V
  .line 457
    return-void
.end method

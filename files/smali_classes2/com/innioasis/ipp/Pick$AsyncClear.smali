.class final Lcom/innioasis/ipp/Pick$AsyncClear;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Pick.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Pick;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "AsyncClear"
.end annotation

.field private final mask:I

.method constructor <init>(I)V
  .registers 2
  .line 240
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput p1, p0, Lcom/innioasis/ipp/Pick$AsyncClear;->mask:I
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 244
    iget v0, p0, Lcom/innioasis/ipp/Pick$AsyncClear;->mask:I
    invoke-static { v0 }, Lcom/innioasis/ipp/Pick;->clear(I)V
  .line 245
    iget v0, p0, Lcom/innioasis/ipp/Pick$AsyncClear;->mask:I
    and-int/lit8 v1, v0, 4
    if-eqz v1, :L1
    const/16 v1, 11
    and-int/2addr v0, v1
    if-eq v0, v1, :L1
  .line 246
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Pick;->access$100(Landroid/content/Context;)V
  :L1
  .line 249
    goto :L3
  :L2
  .line 248
    move-exception v0
  :L3
  .line 250
    invoke-static { }, Lcom/innioasis/ipp/Pick;->access$200()V
  .line 251
    return-void
.end method

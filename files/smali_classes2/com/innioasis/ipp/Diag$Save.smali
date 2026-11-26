.class final Lcom/innioasis/ipp/Diag$Save;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Diag.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Diag;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Save"
.end annotation

.field private final a:Landroid/app/Activity;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 2
  .line 512
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Diag$Save;->a:Landroid/app/Activity;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L6 .. :L7 } :L8
  .registers 4
  .line 515
    nop
  :L0
  .line 517
    invoke-static { }, Lcom/innioasis/ipp/Diag$Heap;->flagged()Z
    move-result v0
    if-eqz v0, :L1
    new-instance v0, Lcom/innioasis/ipp/Diag$Heap;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Diag$Heap;-><init>()V
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Diag$Heap;->run()V
  :L1
  .line 519
    goto :L3
  :L2
  .line 518
    move-exception v0
  :L3
  .line 521
    iget-object v0, p0, Lcom/innioasis/ipp/Diag$Save;->a:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->report(Landroid/content/Context;)Ljava/io/File;
    move-result-object v0
  :L4
  .line 524
    goto :L6
  :L5
  .line 522
    move-exception v0
    const/4 v0, 0
  :L6
  .line 526
    iget-object v1, p0, Lcom/innioasis/ipp/Diag$Save;->a:Landroid/app/Activity;
    new-instance v2, Lcom/innioasis/ipp/Diag$Note;
    invoke-direct { v2, v1, v0 }, Lcom/innioasis/ipp/Diag$Note;-><init>(Landroid/app/Activity;Ljava/io/File;)V
    invoke-virtual { v1, v2 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L7
  .line 528
    goto :L9
  :L8
  .line 527
    move-exception v0
  :L9
  .line 529
    return-void
.end method

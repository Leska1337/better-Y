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
  .line 350
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Diag$Save;->a:Landroid/app/Activity;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  .line 353
    nop
  :L0
  .line 355
    iget-object v0, p0, Lcom/innioasis/ipp/Diag$Save;->a:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->report(Landroid/content/Context;)Ljava/io/File;
    move-result-object v0
  :L1
  .line 358
    goto :L3
  :L2
  .line 356
    move-exception v0
    const/4 v0, 0
  :L3
  .line 360
    iget-object v1, p0, Lcom/innioasis/ipp/Diag$Save;->a:Landroid/app/Activity;
    new-instance v2, Lcom/innioasis/ipp/Diag$Note;
    invoke-direct { v2, v1, v0 }, Lcom/innioasis/ipp/Diag$Note;-><init>(Landroid/app/Activity;Ljava/io/File;)V
    invoke-virtual { v1, v2 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L4
  .line 363
    goto :L6
  :L5
  .line 361
    move-exception v0
  :L6
  .line 364
    return-void
.end method

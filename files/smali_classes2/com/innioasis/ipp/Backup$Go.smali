.class final Lcom/innioasis/ipp/Backup$Go;
.super Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;
.source "Backup.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Backup;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Go"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final f:Ljava/io/File;

.method constructor <init>(Landroid/app/Activity;Ljava/io/File;)V
  .registers 3
  .line 447
    invoke-direct { p0 }, Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;-><init>()V
  .line 448
    iput-object p1, p0, Lcom/innioasis/ipp/Backup$Go;->a:Landroid/app/Activity;
  .line 449
    iput-object p2, p0, Lcom/innioasis/ipp/Backup$Go;->f:Ljava/io/File;
  .line 450
    return-void
.end method

.method public cancel()V
  .registers 1
  .line 452
    return-void
.end method

.method public confirm()V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 461
    new-instance v0, Lcom/innioasis/ipp/Backup$Start;
    iget-object v1, p0, Lcom/innioasis/ipp/Backup$Go;->a:Landroid/app/Activity;
    iget-object v2, p0, Lcom/innioasis/ipp/Backup$Go;->f:Ljava/io/File;
    invoke-direct { v0, v1, v2 }, Lcom/innioasis/ipp/Backup$Start;-><init>(Landroid/app/Activity;Ljava/io/File;)V
  :L0
  .line 463
    iget-object v1, p0, Lcom/innioasis/ipp/Backup$Go;->a:Landroid/app/Activity;
    invoke-virtual { v1 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    const-wide/16 v2, 400
    invoke-virtual { v1, v0, v2, v3 }, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 466
    goto :L3
  :L2
  .line 464
    move-exception v1
  .line 465
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Backup$Start;->run()V
  :L3
  .line 467
    return-void
.end method

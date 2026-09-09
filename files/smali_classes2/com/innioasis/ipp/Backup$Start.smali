.class final Lcom/innioasis/ipp/Backup$Start;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Backup.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Backup;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Start"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final f:Ljava/io/File;

.method constructor <init>(Landroid/app/Activity;Ljava/io/File;)V
  .registers 3
  .line 475
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 476
    iput-object p1, p0, Lcom/innioasis/ipp/Backup$Start;->a:Landroid/app/Activity;
  .line 477
    iput-object p2, p0, Lcom/innioasis/ipp/Backup$Start;->f:Ljava/io/File;
  .line 478
    return-void
.end method

.method public run()V
  .registers 5
  .line 481
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$Start;->a:Landroid/app/Activity;
    const v1, 2131821126
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Backup;->access$300(Landroid/app/Activity;I)Lcom/innioasis/y1/utils/LoadingDialog;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Backup;->access$202(Lcom/innioasis/y1/utils/LoadingDialog;)Lcom/innioasis/y1/utils/LoadingDialog;
  .line 482
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Backup$RestoreRun;
    iget-object v2, p0, Lcom/innioasis/ipp/Backup$Start;->a:Landroid/app/Activity;
    iget-object v3, p0, Lcom/innioasis/ipp/Backup$Start;->f:Ljava/io/File;
    invoke-direct { v1, v2, v3 }, Lcom/innioasis/ipp/Backup$RestoreRun;-><init>(Landroid/app/Activity;Ljava/io/File;)V
    const-string v2, "ipp-restore"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 483
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 484
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 485
    return-void
.end method

.class final Lcom/innioasis/ipp/Backup$RestoreRun;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Backup.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Backup;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "RestoreRun"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final f:Ljava/io/File;

.method constructor <init>(Landroid/app/Activity;Ljava/io/File;)V
  .registers 3
  .line 509
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 510
    iput-object p1, p0, Lcom/innioasis/ipp/Backup$RestoreRun;->a:Landroid/app/Activity;
  .line 511
    iput-object p2, p0, Lcom/innioasis/ipp/Backup$RestoreRun;->f:Ljava/io/File;
  .line 512
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L4 .. :L5 } :L6
  .catchall { :L8 .. :L9 } :L10
  .registers 4
  .line 515
    nop
  :L0
  .line 517
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$RestoreRun;->a:Landroid/app/Activity;
    iget-object v1, p0, Lcom/innioasis/ipp/Backup$RestoreRun;->f:Ljava/io/File;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Backup;->restore(Landroid/content/Context;Ljava/io/File;)Z
    move-result v0
  :L1
  .line 520
    goto :L3
  :L2
  .line 518
    move-exception v0
  .line 519
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "restore failed: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
    const/4 v0, 0
  :L3
  .line 521
    if-eqz v0, :L8
  :L4
  .line 523
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    iget-object v1, p0, Lcom/innioasis/ipp/Backup$RestoreRun;->a:Landroid/app/Activity;
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/util/Other;->reboot(Landroid/content/Context;)V
  :L5
  .line 526
    goto :L7
  :L6
  .line 524
    move-exception v0
  .line 525
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "reboot after restore failed: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L7
  .line 527
    return-void
  :L8
  .line 530
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$RestoreRun;->a:Landroid/app/Activity;
    new-instance v1, Lcom/innioasis/ipp/Backup$Failed;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Backup$Failed;-><init>(Landroid/app/Activity;)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L9
  .line 533
    goto :L11
  :L10
  .line 531
    move-exception v0
  :L11
  .line 534
    return-void
.end method

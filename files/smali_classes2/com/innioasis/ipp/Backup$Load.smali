.class final Lcom/innioasis/ipp/Backup$Load;
.super Lcom/innioasis/ipp/BackupDialog$Go;
.source "Backup.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Backup;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Load"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final fs:[Ljava/io/File;

.method constructor <init>(Landroid/app/Activity;[Ljava/io/File;)V
  .registers 3
  .line 426
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog$Go;-><init>()V
  .line 427
    iput-object p1, p0, Lcom/innioasis/ipp/Backup$Load;->a:Landroid/app/Activity;
  .line 428
    iput-object p2, p0, Lcom/innioasis/ipp/Backup$Load;->fs:[Ljava/io/File;
  .line 429
    return-void
.end method

.method public go(I)V
  .registers 9
  .line 432
    if-ltz p1, :L1
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$Load;->fs:[Ljava/io/File;
    array-length v0, v0
    if-lt p1, v0, :L0
    goto :L1
  :L0
  .line 435
    new-instance v1, Lcom/innioasis/y1/utils/DialogUtil;
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$Load;->a:Landroid/app/Activity;
    const/4 v2, 0
    const v3, 2131886360
    invoke-direct { v1, v0, v2, v3 }, Lcom/innioasis/y1/utils/DialogUtil;-><init>(Landroid/app/Activity;ZI)V
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$Load;->a:Landroid/app/Activity;
  .line 436
    const v2, 2131821119
    invoke-virtual { v0, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$Load;->a:Landroid/app/Activity;
  .line 437
    const v3, 2131821125
    invoke-virtual { v0, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v3
    new-instance v4, Lcom/innioasis/ipp/Backup$Go;
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$Load;->a:Landroid/app/Activity;
    iget-object v5, p0, Lcom/innioasis/ipp/Backup$Load;->fs:[Ljava/io/File;
    aget-object p1, v5, p1
    invoke-direct { v4, v0, p1 }, Lcom/innioasis/ipp/Backup$Go;-><init>(Landroid/app/Activity;Ljava/io/File;)V
    const/4 v5, 0
    const/4 v6, 1
  .line 435
    invoke-virtual/range { v1 .. v6 }, Lcom/innioasis/y1/utils/DialogUtil;->setDialogTitle(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;ZZ)Landroid/app/Dialog;
  .line 439
    return-void
  :L1
  .line 432
    return-void
.end method

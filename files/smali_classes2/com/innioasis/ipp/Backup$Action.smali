.class final Lcom/innioasis/ipp/Backup$Action;
.super Lcom/innioasis/ipp/BackupDialog$Go;
.source "Backup.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Backup;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Action"
.end annotation

.field private final a:Landroid/app/Activity;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 2
  .line 122
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog$Go;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Backup$Action;->a:Landroid/app/Activity;
    return-void
.end method

.method public go(I)V
  .registers 2
  .line 125
    if-nez p1, :L0
  .line 126
    iget-object p1, p0, Lcom/innioasis/ipp/Backup$Action;->a:Landroid/app/Activity;
    invoke-static { p1 }, Lcom/innioasis/ipp/Backup;->startSave(Landroid/app/Activity;)V
    goto :L1
  :L0
  .line 128
    iget-object p1, p0, Lcom/innioasis/ipp/Backup$Action;->a:Landroid/app/Activity;
    invoke-static { p1 }, Lcom/innioasis/ipp/Backup;->askLoad(Landroid/app/Activity;)V
  :L1
  .line 130
    return-void
.end method

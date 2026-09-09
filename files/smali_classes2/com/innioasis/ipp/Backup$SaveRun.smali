.class final Lcom/innioasis/ipp/Backup$SaveRun;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Backup.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Backup;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "SaveRun"
.end annotation

.field private final a:Landroid/app/Activity;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 2
  .line 149
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Backup$SaveRun;->a:Landroid/app/Activity;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  .line 152
    nop
  :L0
  .line 154
    iget-object v0, p0, Lcom/innioasis/ipp/Backup$SaveRun;->a:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Backup;->save(Landroid/content/Context;)Ljava/io/File;
    move-result-object v0
  :L1
  .line 157
    goto :L3
  :L2
  .line 155
    move-exception v0
  .line 156
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "backup failed: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
    const/4 v0, 0
  :L3
  .line 159
    iget-object v1, p0, Lcom/innioasis/ipp/Backup$SaveRun;->a:Landroid/app/Activity;
    new-instance v2, Lcom/innioasis/ipp/Backup$Saved;
    invoke-direct { v2, v1, v0 }, Lcom/innioasis/ipp/Backup$Saved;-><init>(Landroid/app/Activity;Ljava/io/File;)V
    invoke-virtual { v1, v2 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L4
  .line 162
    goto :L6
  :L5
  .line 160
    move-exception v0
  :L6
  .line 163
    return-void
.end method

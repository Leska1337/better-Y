.class final Lcom/innioasis/ipp/BackupDialog$Repaint;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "BackupDialog.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/BackupDialog;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Repaint"
.end annotation

.field private final d:Lcom/innioasis/ipp/BackupDialog;

.method constructor <init>(Lcom/innioasis/ipp/BackupDialog;)V
  .registers 2
  .line 153
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/BackupDialog$Repaint;->d:Lcom/innioasis/ipp/BackupDialog;
    return-void
.end method

.method public run()V
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 156
    iget-object v0, p0, Lcom/innioasis/ipp/BackupDialog$Repaint;->d:Lcom/innioasis/ipp/BackupDialog;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/BackupDialog;->isShowing()Z
    move-result v0
    if-eqz v0, :L4
    iget-object v0, p0, Lcom/innioasis/ipp/BackupDialog$Repaint;->d:Lcom/innioasis/ipp/BackupDialog;
    invoke-static { v0 }, Lcom/innioasis/ipp/BackupDialog;->access$000(Lcom/innioasis/ipp/BackupDialog;)Z
    move-result v0
    if-eqz v0, :L0
    goto :L4
  :L0
  .line 157
    iget-object v0, p0, Lcom/innioasis/ipp/BackupDialog$Repaint;->d:Lcom/innioasis/ipp/BackupDialog;
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/BackupDialog;->access$002(Lcom/innioasis/ipp/BackupDialog;Z)Z
  .line 159
    const/4 v0, 0
  :L1
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog$Repaint;->d:Lcom/innioasis/ipp/BackupDialog;
    invoke-static { v1 }, Lcom/innioasis/ipp/BackupDialog;->access$100(Lcom/innioasis/ipp/BackupDialog;)Lcom/innioasis/ipp/Column;
    move-result-object v1
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Column;->paintAll()V
  :L2
  .line 161
    iget-object v1, p0, Lcom/innioasis/ipp/BackupDialog$Repaint;->d:Lcom/innioasis/ipp/BackupDialog;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/BackupDialog;->access$002(Lcom/innioasis/ipp/BackupDialog;Z)Z
  .line 162
    nop
  .line 163
    return-void
  :L3
  .line 161
    move-exception v1
    iget-object v2, p0, Lcom/innioasis/ipp/BackupDialog$Repaint;->d:Lcom/innioasis/ipp/BackupDialog;
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/BackupDialog;->access$002(Lcom/innioasis/ipp/BackupDialog;Z)Z
  .line 162
    throw v1
  :L4
  .line 156
    return-void
.end method

.class final Lcom/innioasis/ipp/BackupDialog$Paint;
.super Lcom/innioasis/ipp/Column$Painter;
.source "BackupDialog.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/BackupDialog;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Paint"
.end annotation

.field private final d:Lcom/innioasis/ipp/BackupDialog;

.method constructor <init>(Lcom/innioasis/ipp/BackupDialog;)V
  .registers 2
  .line 176
    invoke-direct { p0 }, Lcom/innioasis/ipp/Column$Painter;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/BackupDialog$Paint;->d:Lcom/innioasis/ipp/BackupDialog;
    return-void
.end method

.method public paint(I)V
  .registers 3
  .line 178
    iget-object v0, p0, Lcom/innioasis/ipp/BackupDialog$Paint;->d:Lcom/innioasis/ipp/BackupDialog;
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/BackupDialog;->access$200(Lcom/innioasis/ipp/BackupDialog;I)V
    return-void
.end method

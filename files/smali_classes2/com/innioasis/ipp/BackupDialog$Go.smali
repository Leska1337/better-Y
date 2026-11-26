.class public abstract Lcom/innioasis/ipp/BackupDialog$Go;
.super Ljava/lang/Object;
.source "BackupDialog.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/BackupDialog;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 1033
  name = "Go"
.end annotation

.method public constructor <init>()V
  .registers 1
  .line 27
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public abstract go(I)V
.end method

.method public go(IZ)V
  .registers 3
  .line 32
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/BackupDialog$Go;->go(I)V
  .line 33
    return-void
.end method

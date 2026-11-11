.class final Lcom/innioasis/ipp/M3u$ExportGo;
.super Lcom/innioasis/ipp/BackupDialog$Go;
.source "M3u.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3u;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "ExportGo"
.end annotation

.field private final e:Lcom/innioasis/ipp/M3u$Export;

.method constructor <init>(Lcom/innioasis/ipp/M3u$Export;)V
  .registers 2
  .line 225
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog$Go;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/M3u$ExportGo;->e:Lcom/innioasis/ipp/M3u$Export;
    return-void
.end method

.method public go(I)V
  .registers 4
  .line 228
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$ExportGo;->e:Lcom/innioasis/ipp/M3u$Export;
    const/4 v1, 0
    invoke-virtual { v0, p1, v1 }, Lcom/innioasis/ipp/M3u$Export;->answer(IZ)V
  .line 229
    return-void
.end method

.method public go(IZ)V
  .registers 4
  .line 233
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$ExportGo;->e:Lcom/innioasis/ipp/M3u$Export;
    invoke-virtual { v0, p1, p2 }, Lcom/innioasis/ipp/M3u$Export;->answer(IZ)V
  .line 234
    return-void
.end method

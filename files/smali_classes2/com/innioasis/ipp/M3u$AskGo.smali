.class final Lcom/innioasis/ipp/M3u$AskGo;
.super Lcom/innioasis/ipp/BackupDialog$Go;
.source "M3u.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3u;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "AskGo"
.end annotation

.field private final ask:Lcom/innioasis/ipp/M3u$Ask;

.method constructor <init>(Lcom/innioasis/ipp/M3u$Ask;)V
  .registers 2
  .line 609
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog$Go;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/M3u$AskGo;->ask:Lcom/innioasis/ipp/M3u$Ask;
    return-void
.end method

.method public go(I)V
  .registers 4
  .line 612
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$AskGo;->ask:Lcom/innioasis/ipp/M3u$Ask;
    const/4 v1, 0
    invoke-virtual { v0, p1, v1 }, Lcom/innioasis/ipp/M3u$Ask;->answer(IZ)V
  .line 613
    return-void
.end method

.method public go(IZ)V
  .registers 4
  .line 617
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$AskGo;->ask:Lcom/innioasis/ipp/M3u$Ask;
    invoke-virtual { v0, p1, p2 }, Lcom/innioasis/ipp/M3u$Ask;->answer(IZ)V
  .line 618
    return-void
.end method

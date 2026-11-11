.class final Lcom/innioasis/ipp/M3uBase$Answer;
.super Lcom/innioasis/ipp/BackupDialog$Go;
.source "M3uBase.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3uBase;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Answer"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final path:Ljava/lang/String;

.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 3
  .line 227
    invoke-direct { p0 }, Lcom/innioasis/ipp/BackupDialog$Go;-><init>()V
  .line 228
    iput-object p1, p0, Lcom/innioasis/ipp/M3uBase$Answer;->a:Landroid/app/Activity;
  .line 229
    iput-object p2, p0, Lcom/innioasis/ipp/M3uBase$Answer;->path:Ljava/lang/String;
  .line 230
    return-void
.end method

.method public go(I)V
  .registers 3
  .line 233
    if-nez p1, :L0
    iget-object p1, p0, Lcom/innioasis/ipp/M3uBase$Answer;->path:Ljava/lang/String;
    invoke-static { p1 }, Lcom/innioasis/ipp/M3uBase;->put(Ljava/lang/String;)Z
    goto :L1
  :L0
  .line 234
    const/4 v0, 1
    if-ne p1, v0, :L1
    iget-object p1, p0, Lcom/innioasis/ipp/M3uBase$Answer;->a:Landroid/app/Activity;
    iget-object v0, p0, Lcom/innioasis/ipp/M3uBase$Answer;->path:Ljava/lang/String;
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/M3uBase;->edit(Landroid/app/Activity;Ljava/lang/String;)V
  :L1
  .line 235
    return-void
.end method

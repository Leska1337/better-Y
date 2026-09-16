.class final Lcom/innioasis/ipp/Diag$Note;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Diag.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Diag;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Note"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final f:Ljava/io/File;

.method constructor <init>(Landroid/app/Activity;Ljava/io/File;)V
  .registers 3
  .line 383
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Diag$Note;->a:Landroid/app/Activity;
    iput-object p2, p0, Lcom/innioasis/ipp/Diag$Note;->f:Ljava/io/File;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 387
    iget-object v0, p0, Lcom/innioasis/ipp/Diag$Note;->f:Ljava/io/File;
    if-nez v0, :L1
  .line 388
    iget-object v0, p0, Lcom/innioasis/ipp/Diag$Note;->a:Landroid/app/Activity;
    const v1, 2131821114
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->access$100(Landroid/content/Context;I)V
    goto :L2
  :L1
  .line 390
    iget-object v1, p0, Lcom/innioasis/ipp/Diag$Note;->a:Landroid/app/Activity;
    const/4 v2, 1
    new-array v2, v2, [Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v0
    const/4 v3, 0
    aput-object v0, v2, v3
    const v0, 2131821113
    invoke-virtual { v1, v0, v2 }, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Diag;->access$200(Landroid/content/Context;Ljava/lang/String;)V
  :L2
  .line 394
    goto :L4
  :L3
  .line 392
    move-exception v0
  :L4
  .line 395
    return-void
.end method

.class final Lcom/innioasis/ipp/Saver$WallLoad;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Saver.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Saver;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "WallLoad"
.end annotation

.field private final c:Landroid/content/Context;

.field private final path:Ljava/lang/String;

.field private final show:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
  .registers 4
  .line 402
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 403
    iput-object p1, p0, Lcom/innioasis/ipp/Saver$WallLoad;->c:Landroid/content/Context;
  .line 404
    iput-object p2, p0, Lcom/innioasis/ipp/Saver$WallLoad;->path:Ljava/lang/String;
  .line 405
    if-nez p3, :L0
    const/4 p1, 0
    goto :L1
  :L0
    new-instance p1, Ljava/lang/ref/WeakReference;
    invoke-direct { p1, p3 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L1
    iput-object p1, p0, Lcom/innioasis/ipp/Saver$WallLoad;->show:Ljava/lang/ref/WeakReference;
  .line 406
    return-void
.end method

.method public run()V
  .registers 5
  .line 410
    iget-object v0, p0, Lcom/innioasis/ipp/Saver$WallLoad;->c:Landroid/content/Context;
    iget-object v1, p0, Lcom/innioasis/ipp/Saver$WallLoad;->path:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Saver;->loadWall(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 411
    if-eqz v0, :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Saver$WallLoad;->show:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L0
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$000()Landroid/os/Handler;
    move-result-object v1
    if-eqz v1, :L0
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$000()Landroid/os/Handler;
    move-result-object v1
    new-instance v2, Lcom/innioasis/ipp/Saver$WallShow;
    iget-object v3, p0, Lcom/innioasis/ipp/Saver$WallLoad;->show:Ljava/lang/ref/WeakReference;
    invoke-direct { v2, v3, v0 }, Lcom/innioasis/ipp/Saver$WallShow;-><init>(Ljava/lang/ref/WeakReference;Landroid/graphics/Bitmap;)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L0
  .line 412
    return-void
.end method

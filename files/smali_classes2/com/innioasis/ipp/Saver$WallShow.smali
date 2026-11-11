.class final Lcom/innioasis/ipp/Saver$WallShow;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Saver.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Saver;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "WallShow"
.end annotation

.field private final b:Landroid/graphics/Bitmap;

.field private final show:Ljava/lang/ref/WeakReference;

.method constructor <init>(Ljava/lang/ref/WeakReference;Landroid/graphics/Bitmap;)V
  .registers 3
  .line 419
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 420
    iput-object p1, p0, Lcom/innioasis/ipp/Saver$WallShow;->show:Ljava/lang/ref/WeakReference;
  .line 421
    iput-object p2, p0, Lcom/innioasis/ipp/Saver$WallShow;->b:Landroid/graphics/Bitmap;
  .line 422
    return-void
.end method

.method public run()V
  .registers 4
  .line 426
    iget-object v0, p0, Lcom/innioasis/ipp/Saver$WallShow;->show:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/widget/ImageView;
  .line 427
    if-nez v0, :L0
    return-void
  :L0
  .line 428
    invoke-virtual { v0 }, Landroid/widget/ImageView;->getContext()Landroid/content/Context;
    move-result-object v1
  .line 430
    instance-of v2, v1, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz v2, :L1
    check-cast v1, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v1
    const/4 v2, 3
    if-ne v1, v2, :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Saver$WallShow;->b:Landroid/graphics/Bitmap;
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L1
  .line 431
    return-void
.end method

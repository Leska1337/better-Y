.class final Lcom/innioasis/ipp/MenuStyle$Drop;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "MenuStyle.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/MenuStyle;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Drop"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 317
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 2
  .line 319
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->access$002(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 320
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->access$102(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 321
    return-void
.end method

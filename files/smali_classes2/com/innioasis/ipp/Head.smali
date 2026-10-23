.class public final Lcom/innioasis/ipp/Head;
.super Ljava/lang/Object;
.source "Head.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Head$Backdrop;
  }
.end annotation

.method public constructor <init>()V
  .registers 1
  .line 15
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static backdrop(Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 23
    if-nez p0, :L0
    return-void
  :L0
  .line 24
    sget-object v0, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
  .line 25
    if-eqz v0, :L4
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v1
    if-eqz v1, :L1
    goto :L4
  :L1
  .line 26
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 27
    new-instance v2, Lcom/innioasis/ipp/Head$Backdrop;
    invoke-direct { v2, p0, v0 }, Lcom/innioasis/ipp/Head$Backdrop;-><init>(Landroid/view/View;Landroid/graphics/Bitmap;)V
  .line 28
    if-nez v1, :L2
  .line 29
    invoke-virtual { p0, v2 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    goto :L3
  :L2
  .line 31
    const/4 v0, 2
    new-array v0, v0, [Landroid/graphics/drawable/Drawable;
  .line 32
    const/4 v3, 0
    aput-object v2, v0, v3
  .line 33
    const/4 v2, 1
    aput-object v1, v0, v2
  .line 34
    new-instance v1, Landroid/graphics/drawable/LayerDrawable;
    invoke-direct { v1, v0 }, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 37
    goto :L6
  :L4
  .line 25
    return-void
  :L5
  .line 36
    move-exception p0
  :L6
  .line 38
    return-void
.end method

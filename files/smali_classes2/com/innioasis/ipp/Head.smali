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
  .catchall { :L0 .. :L4 } :L6
  .registers 8
  .line 23
    if-nez p0, :L0
    return-void
  :L0
  .line 24
    sget-object v0, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
  .line 25
    if-eqz v0, :L5
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v1
    if-eqz v1, :L1
    goto :L5
  :L1
  .line 26
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 27
    new-instance v2, Lcom/innioasis/ipp/Head$Backdrop;
    invoke-direct { v2, p0, v0 }, Lcom/innioasis/ipp/Head$Backdrop;-><init>(Landroid/view/View;Landroid/graphics/Bitmap;)V
  .line 29
    new-instance v0, Lcom/innioasis/ipp/Bar$PlatePart;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Bar$PlatePart;-><init>(Landroid/view/View;)V
  .line 30
    const/4 v3, 1
    const/4 v4, 0
    const/4 v5, 2
    if-nez v1, :L2
    new-array v1, v5, [Landroid/graphics/drawable/Drawable;
    aput-object v2, v1, v4
    aput-object v0, v1, v3
    goto :L3
  :L2
    const/4 v6, 3
    new-array v6, v6, [Landroid/graphics/drawable/Drawable;
    aput-object v2, v6, v4
    aput-object v1, v6, v3
    aput-object v0, v6, v5
    move-object v1, v6
  :L3
  .line 31
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;
    invoke-direct { v0, v1 }, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L4
  .line 33
    goto :L7
  :L5
  .line 25
    return-void
  :L6
  .line 32
    move-exception p0
  :L7
  .line 34
    return-void
.end method

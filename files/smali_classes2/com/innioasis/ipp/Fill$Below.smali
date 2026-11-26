.class final Lcom/innioasis/ipp/Fill$Below;
.super Landroid/graphics/drawable/Drawable;
.source "Fill.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Fill;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Below"
.end annotation

.field private final group:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroid/view/ViewGroup;)V
  .registers 3
  .line 87
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 88
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Fill$Below;->group:Ljava/lang/ref/WeakReference;
  .line 89
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .catchall { :L0 .. :L9 } :L11
  .registers 11
  :L0
  .line 94
    iget-object v0, p0, Lcom/innioasis/ipp/Fill$Below;->group:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 95
    invoke-static { }, Lcom/innioasis/ipp/Theme;->rowBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v2
  .line 96
    if-eqz v0, :L10
    if-nez v2, :L1
    goto :L10
  :L1
  .line 98
    nop
  .line 99
    nop
  .line 100
    const/4 v1, 0
    const/4 v3, 0
    move-object v3, v1
    const/4 v4, 0
  :L2
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v5
    if-ge v4, v5, :L5
  .line 101
    invoke-virtual { v0, v4 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v5
  .line 102
    invoke-virtual { v5 }, Landroid/view/View;->getVisibility()I
    move-result v6
    if-nez v6, :L4
    invoke-virtual { v5 }, Landroid/view/View;->getHeight()I
    move-result v6
    const/4 v7, 2
    if-gt v6, v7, :L3
    goto :L4
  :L3
  .line 103
    nop
  .line 104
    move-object v3, v1
    move-object v1, v5
  :L4
  .line 100
    add-int/lit8 v4, v4, 1
    goto :L2
  :L5
  .line 106
    if-nez v1, :L6
    return-void
  :L6
  .line 107
    invoke-virtual { v1 }, Landroid/view/View;->getHeight()I
    move-result v7
  .line 108
    if-eqz v3, :L7
    invoke-virtual { v1 }, Landroid/view/View;->getTop()I
    move-result v4
    invoke-virtual { v3 }, Landroid/view/View;->getTop()I
    move-result v3
    sub-int/2addr v4, v3
    invoke-static { v7, v4 }, Ljava/lang/Math;->max(II)I
    move-result v3
    move v6, v3
    goto :L8
  :L7
    move v6, v7
  :L8
  .line 109
    invoke-virtual { v1 }, Landroid/view/View;->getLeft()I
    move-result v3
    invoke-virtual { v1 }, Landroid/view/View;->getRight()I
    move-result v4
    invoke-virtual { v1 }, Landroid/view/View;->getTop()I
    move-result v5
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v8
    move-object v1, p1
    invoke-static/range { v1 .. v8 }, Lcom/innioasis/ipp/Fill;->access$000(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIIIII)V
  :L9
  .line 111
    goto :L12
  :L10
  .line 96
    return-void
  :L11
  .line 110
    move-exception p1
  :L12
  .line 112
    return-void
.end method

.method public getOpacity()I
  .registers 2
  .line 122
    const/4 v0, -3
    return v0
.end method

.method public setAlpha(I)V
  .registers 2
  .line 115
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 2
  .line 118
    return-void
.end method

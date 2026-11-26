.class final Lcom/innioasis/ipp/Bar$PlatePart;
.super Landroid/graphics/drawable/Drawable;
.source "Bar.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Bar;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "PlatePart"
.end annotation

.field private final host:Landroid/view/View;

.method constructor <init>(Landroid/view/View;)V
  .registers 2
  .line 993
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 994
    iput-object p1, p0, Lcom/innioasis/ipp/Bar$PlatePart;->host:Landroid/view/View;
  .line 995
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 999
    iget-object v0, p0, Lcom/innioasis/ipp/Bar$PlatePart;->host:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$000(Landroid/view/View;)Lcom/innioasis/ipp/Bar;
    move-result-object v0
  .line 1000
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Bar$PlatePart;->host:Landroid/view/View;
    invoke-static { v0, p1, v1 }, Lcom/innioasis/ipp/Bar;->access$100(Lcom/innioasis/ipp/Bar;Landroid/graphics/Canvas;Landroid/view/View;)V
  :L1
  .line 1002
    goto :L3
  :L2
  .line 1001
    move-exception p1
  :L3
  .line 1003
    return-void
.end method

.method public getOpacity()I
  .registers 2
  .line 1012
    const/4 v0, -3
    return v0
.end method

.method public setAlpha(I)V
  .registers 2
  .line 1006
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 2
  .line 1009
    return-void
.end method

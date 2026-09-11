.class final Lcom/innioasis/ipp/Photos$Rule;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "Photos.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Photos;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Rule"
.end annotation

.field final paint:Landroid/graphics/Paint;

.method constructor <init>()V
  .registers 2
  .line 214
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 215
    new-instance v0, Landroid/graphics/Paint;
    invoke-direct { v0 }, Landroid/graphics/Paint;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Photos$Rule;->paint:Landroid/graphics/Paint;
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .registers 10
  .line 218
    const/4 v1, 0
    const/4 v2, 0
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I
    move-result p2
    int-to-float v3, p2
    const/high16 v4, 0x40000000
    iget-object v5, p0, Lcom/innioasis/ipp/Photos$Rule;->paint:Landroid/graphics/Paint;
    move-object v0, p1
    invoke-virtual/range { v0 .. v5 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 219
    return-void
.end method

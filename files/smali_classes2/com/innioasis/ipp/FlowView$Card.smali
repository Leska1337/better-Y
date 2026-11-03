.class public final Lcom/innioasis/ipp/FlowView$Card;
.super Landroid/view/View;
.source "FlowView.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/FlowView;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Card"
.end annotation

.field private b:Landroid/graphics/Bitmap;

.field private final fade:Landroid/graphics/Paint;

.field private final from:Landroid/graphics/Rect;

.field private final half:Landroid/graphics/Paint;

.field private final paint:Landroid/graphics/Paint;

.field private final seam:Landroid/graphics/Rect;

.field private final to:Landroid/graphics/RectF;

.field private final whole:Landroid/graphics/Rect;

.method public constructor <init>(Landroid/content/Context;)V
  .registers 7
  .line 459
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 450
    new-instance p1, Landroid/graphics/Paint;
    const/4 v0, 2
    invoke-direct { p1, v0 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView$Card;->paint:Landroid/graphics/Paint;
  .line 451
    invoke-static { }, Lcom/innioasis/ipp/FlowView;->access$000()Landroid/graphics/Paint;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView$Card;->fade:Landroid/graphics/Paint;
  .line 452
    sget-object p1, Lcom/innioasis/ipp/Flow;->MIR:Landroid/graphics/Rect;
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView$Card;->from:Landroid/graphics/Rect;
  .line 453
    new-instance p1, Landroid/graphics/Rect;
    const/4 v1, 0
    const/16 v2, 184
    invoke-direct { p1, v1, v1, v2, v2 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView$Card;->whole:Landroid/graphics/Rect;
  .line 454
    new-instance p1, Landroid/graphics/Rect;
    const/16 v3, 180
    const/16 v4, 182
    invoke-direct { p1, v1, v3, v2, v4 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView$Card;->seam:Landroid/graphics/Rect;
  .line 455
    new-instance p1, Landroid/graphics/Paint;
    invoke-direct { p1, v0 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView$Card;->half:Landroid/graphics/Paint;
  .line 456
    new-instance p1, Landroid/graphics/RectF;
    invoke-direct { p1 }, Landroid/graphics/RectF;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView$Card;->to:Landroid/graphics/RectF;
  .line 460
    const/4 p1, 0
    invoke-virtual { p0, v0, p1 }, Lcom/innioasis/ipp/FlowView$Card;->setLayerType(ILandroid/graphics/Paint;)V
  .line 461
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 9
  .line 470
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView$Card;->b:Landroid/graphics/Bitmap;
    if-nez v0, :L0
    return-void
  :L0
  .line 471
    nop
  .line 472
    nop
  .line 474
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView$Card;->to:Landroid/graphics/RectF;
    const/4 v1, 0
    const/high16 v2, 0x43340000
    const/high16 v3, 0x43380000
    const/high16 v4, 0x43360000
    invoke-virtual { v0, v1, v2, v3, v4 }, Landroid/graphics/RectF;->set(FFFF)V
  .line 475
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView$Card;->half:Landroid/graphics/Paint;
    const/16 v2, 112
    invoke-virtual { v0, v2 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 476
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView$Card;->b:Landroid/graphics/Bitmap;
    iget-object v2, p0, Lcom/innioasis/ipp/FlowView$Card;->seam:Landroid/graphics/Rect;
    iget-object v5, p0, Lcom/innioasis/ipp/FlowView$Card;->to:Landroid/graphics/RectF;
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView$Card;->half:Landroid/graphics/Paint;
    invoke-virtual { p1, v0, v2, v5, v6 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 477
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 478
    const/high16 v0, 0x43B60000
    invoke-virtual { p1, v1, v0 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 479
    const/high16 v0, 0x3F800000
    const/high16 v2, 0xBF800000
    invoke-virtual { p1, v0, v2 }, Landroid/graphics/Canvas;->scale(FF)V
  .line 480
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView$Card;->to:Landroid/graphics/RectF;
    const/high16 v2, 0x42B80000
    invoke-virtual { v0, v1, v2, v3, v4 }, Landroid/graphics/RectF;->set(FFFF)V
  .line 481
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView$Card;->b:Landroid/graphics/Bitmap;
    iget-object v2, p0, Lcom/innioasis/ipp/FlowView$Card;->from:Landroid/graphics/Rect;
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView$Card;->to:Landroid/graphics/RectF;
    iget-object v5, p0, Lcom/innioasis/ipp/FlowView$Card;->paint:Landroid/graphics/Paint;
    invoke-virtual { p1, v0, v2, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 482
    invoke-static { }, Lcom/innioasis/ipp/Flow;->fade()Landroid/graphics/Bitmap;
    move-result-object v0
    iget-object v2, p0, Lcom/innioasis/ipp/FlowView$Card;->to:Landroid/graphics/RectF;
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView$Card;->fade:Landroid/graphics/Paint;
    const/4 v5, 0
    invoke-virtual { p1, v0, v5, v2, v4 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 483
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 484
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView$Card;->to:Landroid/graphics/RectF;
    invoke-virtual { v0, v1, v1, v3, v3 }, Landroid/graphics/RectF;->set(FFFF)V
  .line 485
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView$Card;->b:Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/innioasis/ipp/FlowView$Card;->whole:Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/innioasis/ipp/FlowView$Card;->to:Landroid/graphics/RectF;
    iget-object v3, p0, Lcom/innioasis/ipp/FlowView$Card;->paint:Landroid/graphics/Paint;
    invoke-virtual { p1, v0, v1, v2, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 486
    return-void
.end method

.method public setSlide(Landroid/graphics/Bitmap;)V
  .registers 2
  .line 464
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView$Card;->b:Landroid/graphics/Bitmap;
  .line 465
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView$Card;->invalidate()V
  .line 466
    return-void
.end method

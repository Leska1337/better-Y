.class final Lcom/innioasis/ipp/Nav$Layer;
.super Landroid/view/View;
.source "Nav.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Nav;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Layer"
.end annotation

.field private final run:Lcom/innioasis/ipp/Nav$Run;

.method constructor <init>(Lcom/innioasis/ipp/Nav$Run;)V
  .registers 3
  .line 657
    iget-object v0, p1, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-direct { p0, v0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 658
    iput-object p1, p0, Lcom/innioasis/ipp/Nav$Layer;->run:Lcom/innioasis/ipp/Nav$Run;
  .line 659
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Nav$Layer;->setWillNotDraw(Z)V
  .line 660
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 3
  .line 664
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Layer;->run:Lcom/innioasis/ipp/Nav$Run;
    invoke-virtual { v0, p0, p1 }, Lcom/innioasis/ipp/Nav$Run;->draw(Lcom/innioasis/ipp/Nav$Layer;Landroid/graphics/Canvas;)V
  .line 665
    return-void
.end method

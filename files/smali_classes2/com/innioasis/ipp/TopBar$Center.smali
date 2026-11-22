.class final Lcom/innioasis/ipp/TopBar$Center;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnLayoutChangeListener;
.source "TopBar.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/TopBar;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Center"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 217
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/TopBar$1;)V
  .registers 2
  .line 217
    invoke-direct { p0 }, Lcom/innioasis/ipp/TopBar$Center;-><init>()V
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
  .registers 10
  .line 220
    invoke-virtual { p1 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p3
    check-cast p3, Landroid/view/View;
  .line 221
    if-nez p3, :L0
    return-void
  :L0
  .line 222
    const p5, 2131362410
    invoke-virtual { p3, p5 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object p5
  .line 223
    instance-of p6, p5, Lcom/innioasis/ipp/TopBar$Order;
    if-eqz p6, :L1
    check-cast p5, Lcom/innioasis/ipp/TopBar$Order;
    iget-boolean p5, p5, Lcom/innioasis/ipp/TopBar$Order;->centered:Z
    if-eqz p5, :L1
    const/4 p5, 1
    goto :L2
  :L1
    const/4 p5, 0
  :L2
  .line 224
    if-eqz p5, :L3
    invoke-virtual { p3 }, Landroid/view/View;->getWidth()I
    move-result p3
    int-to-float p3, p3
    const/high16 p5, 0x40000000
    div-float/2addr p3, p5
    add-int/2addr p2, p4
    int-to-float p2, p2
    div-float/2addr p2, p5
    sub-float/2addr p3, p2
    goto :L4
  :L3
    const/4 p3, 0
  :L4
    invoke-virtual { p1, p3 }, Landroid/view/View;->setTranslationX(F)V
  .line 225
    return-void
.end method

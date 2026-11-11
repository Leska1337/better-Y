.class final Lcom/innioasis/ipp/Tone$Fit;
.super Ljava/lang/Object;
.implements Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;
.source "Tone.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Tone;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Fit"
.end annotation

.field private final rv:Landroidx/recyclerview/widget/RecyclerView;

.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 501
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Tone$Fit;->rv:Landroidx/recyclerview/widget/RecyclerView;
    return-void
.end method

.method public onChildViewAttachedToWindow(Landroid/view/View;)V
  .registers 7
  .line 505
    const v0, 2131362459
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/TextView;
  .line 506
    const v1, 2131362437
    invoke-virtual { p1, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
    check-cast p1, Landroid/widget/TextView;
  .line 507
    if-eqz v0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 508
    iget-object v1, p0, Lcom/innioasis/ipp/Tone$Fit;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I
    move-result v1
    if-lez v1, :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Tone$Fit;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I
    move-result v1
    goto :L2
  :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Tone$Fit;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I
    div-int/lit8 v1, v1, 2
  :L2
  .line 509
    iget-object v2, p0, Lcom/innioasis/ipp/Tone$Fit;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
  .line 510
    invoke-virtual { v0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    invoke-virtual { v0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
    invoke-static { v0 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v0
    float-to-double v3, v0
    invoke-static { v3, v4 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v3
    double-to-int v0, v3
    sub-int v0, v1, v0
    const/high16 v3, 0x41A00000
    mul-float v2, v2, v3
    float-to-int v2, v2
    sub-int/2addr v0, v2
  .line 513
    invoke-virtual { p1 }, Landroid/widget/TextView;->getMaxLines()I
    move-result v2
    const/4 v3, 1
    if-eq v2, v3, :L3
    invoke-virtual { p1, v3 }, Landroid/widget/TextView;->setSingleLine(Z)V
  :L3
  .line 514
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { p1, v2 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 515
    div-int/lit8 v1, v1, 3
    invoke-static { v0, v1 }, Ljava/lang/Math;->max(II)I
    move-result v0
  .line 516
    invoke-virtual { p1 }, Landroid/widget/TextView;->getMaxWidth()I
    move-result v1
    if-eq v1, v0, :L4
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setMaxWidth(I)V
  :L4
  .line 517
    return-void
  :L5
  .line 507
    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
  .registers 2
  .line 520
    return-void
.end method

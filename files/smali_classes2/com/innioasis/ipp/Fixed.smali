.class public Lcom/innioasis/ipp/Fixed;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "Fixed.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Fixed$Self;,
    Lcom/innioasis/ipp/Fixed$Heal;
  }
.end annotation

.field private final heal:Lcom/innioasis/ipp/Fixed$Heal;

.field private healAt:J

.field private healDue:Z

.field private laying:Z

.field private lh:I

.field private lw:I

.field private mb:I

.field private ml:I

.field private mr:I

.field private mt:I

.field private posted:Z

.field private final self:Lcom/innioasis/ipp/Fixed$Self;

.field private selfLaying:Z

.method public constructor <init>(Landroid/content/Context;)V
  .registers 2
  .line 19
    invoke-direct { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V
  .line 30
    new-instance p1, Lcom/innioasis/ipp/Fixed$Self;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Fixed$Self;-><init>(Lcom/innioasis/ipp/Fixed;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed;->self:Lcom/innioasis/ipp/Fixed$Self;
  .line 119
    new-instance p1, Lcom/innioasis/ipp/Fixed$Heal;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Fixed$Heal;-><init>(Lcom/innioasis/ipp/Fixed;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed;->heal:Lcom/innioasis/ipp/Fixed$Heal;
  .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .registers 3
  .line 23
    invoke-direct { p0, p1, p2 }, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .line 30
    new-instance p1, Lcom/innioasis/ipp/Fixed$Self;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Fixed$Self;-><init>(Lcom/innioasis/ipp/Fixed;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed;->self:Lcom/innioasis/ipp/Fixed$Self;
  .line 119
    new-instance p1, Lcom/innioasis/ipp/Fixed$Heal;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Fixed$Heal;-><init>(Lcom/innioasis/ipp/Fixed;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed;->heal:Lcom/innioasis/ipp/Fixed$Heal;
  .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .registers 4
  .line 27
    invoke-direct { p0, p1, p2, p3 }, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .line 30
    new-instance p1, Lcom/innioasis/ipp/Fixed$Self;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Fixed$Self;-><init>(Lcom/innioasis/ipp/Fixed;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed;->self:Lcom/innioasis/ipp/Fixed$Self;
  .line 119
    new-instance p1, Lcom/innioasis/ipp/Fixed$Heal;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Fixed$Heal;-><init>(Lcom/innioasis/ipp/Fixed;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed;->heal:Lcom/innioasis/ipp/Fixed$Heal;
  .line 28
    return-void
.end method

.method static synthetic access$002(Lcom/innioasis/ipp/Fixed;Z)Z
  .registers 2
  .line 16
    iput-boolean p1, p0, Lcom/innioasis/ipp/Fixed;->posted:Z
    return p1
.end method

.method static synthetic access$100(Lcom/innioasis/ipp/Fixed;)Z
  .registers 1
  .line 16
    invoke-direct { p0 }, Lcom/innioasis/ipp/Fixed;->contained()Z
    move-result p0
    return p0
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/Fixed;)V
  .registers 1
  .line 16
    invoke-direct { p0 }, Lcom/innioasis/ipp/Fixed;->passUp()V
    return-void
.end method

.method static synthetic access$302(Lcom/innioasis/ipp/Fixed;Z)Z
  .registers 2
  .line 16
    iput-boolean p1, p0, Lcom/innioasis/ipp/Fixed;->selfLaying:Z
    return p1
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/Fixed;)Z
  .registers 1
  .line 16
    iget-boolean p0, p0, Lcom/innioasis/ipp/Fixed;->healDue:Z
    return p0
.end method

.method static synthetic access$402(Lcom/innioasis/ipp/Fixed;Z)Z
  .registers 2
  .line 16
    iput-boolean p1, p0, Lcom/innioasis/ipp/Fixed;->healDue:Z
    return p1
.end method

.method static synthetic access$500(Lcom/innioasis/ipp/Fixed;)J
  .registers 3
  .line 16
    iget-wide v0, p0, Lcom/innioasis/ipp/Fixed;->healAt:J
    return-wide v0
.end method

.method static synthetic access$502(Lcom/innioasis/ipp/Fixed;J)J
  .registers 3
  .line 16
    iput-wide p1, p0, Lcom/innioasis/ipp/Fixed;->healAt:J
    return-wide p1
.end method

.method private contained()Z
  .registers 5
  .line 48
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->getWidth()I
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L5
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->getHeight()I
    move-result v0
    if-eqz v0, :L5
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    if-eqz v0, :L5
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->getWindowToken()Landroid/os/IBinder;
    move-result-object v0
    if-nez v0, :L0
    goto :L5
  :L0
  .line 49
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 50
    if-eqz v0, :L4
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    iget v3, p0, Lcom/innioasis/ipp/Fixed;->lw:I
    if-ne v2, v3, :L4
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    iget v3, p0, Lcom/innioasis/ipp/Fixed;->lh:I
    if-eq v2, v3, :L1
    goto :L4
  :L1
  .line 51
    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v2, :L3
  .line 52
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 53
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    iget v3, p0, Lcom/innioasis/ipp/Fixed;->ml:I
    if-ne v2, v3, :L2
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    iget v3, p0, Lcom/innioasis/ipp/Fixed;->mt:I
    if-ne v2, v3, :L2
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    iget v3, p0, Lcom/innioasis/ipp/Fixed;->mr:I
    if-ne v2, v3, :L2
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    iget v2, p0, Lcom/innioasis/ipp/Fixed;->mb:I
    if-eq v0, v2, :L3
  :L2
    return v1
  :L3
  .line 55
    const/4 v0, 1
    return v0
  :L4
  .line 50
    return v1
  :L5
  .line 48
    return v1
.end method

.method private passUp()V
  .registers 1
  .line 116
    invoke-super { p0 }, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V
  .line 117
    return-void
.end method

.method protected onAttachedToWindow()V
  .registers 3
  .line 124
    invoke-super { p0 }, Landroidx/recyclerview/widget/RecyclerView;->onAttachedToWindow()V
  .line 125
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed;->heal:Lcom/innioasis/ipp/Fixed$Heal;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 126
    return-void
.end method

.method protected onDetachedFromWindow()V
  .registers 3
  .line 129
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed;->heal:Lcom/innioasis/ipp/Fixed$Heal;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 130
    invoke-super { p0 }, Landroidx/recyclerview/widget/RecyclerView;->onDetachedFromWindow()V
  .line 131
    return-void
.end method

.method protected onLayout(ZIIII)V
  .catchall { :L0 .. :L1 } :L5
  .registers 8
  .line 68
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed;->laying:Z
  .line 70
    const/4 v1, 0
  :L0
    invoke-super/range { p0 .. p5 }, Landroidx/recyclerview/widget/RecyclerView;->onLayout(ZIIII)V
  :L1
  .line 72
    iput-boolean v1, p0, Lcom/innioasis/ipp/Fixed;->laying:Z
  .line 73
    nop
  .line 74
    iget-boolean p1, p0, Lcom/innioasis/ipp/Fixed;->selfLaying:Z
    if-nez p1, :L2
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed;->healDue:Z
  :L2
  .line 75
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
  .line 76
    if-nez p1, :L3
    return-void
  :L3
  .line 77
    iget p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I
    iput p2, p0, Lcom/innioasis/ipp/Fixed;->lw:I
  .line 78
    iget p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I
    iput p2, p0, Lcom/innioasis/ipp/Fixed;->lh:I
  .line 79
    instance-of p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz p2, :L4
  .line 80
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 81
    iget p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    iput p2, p0, Lcom/innioasis/ipp/Fixed;->ml:I
  .line 82
    iget p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    iput p2, p0, Lcom/innioasis/ipp/Fixed;->mt:I
  .line 83
    iget p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    iput p2, p0, Lcom/innioasis/ipp/Fixed;->mr:I
  .line 84
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    iput p1, p0, Lcom/innioasis/ipp/Fixed;->mb:I
  :L4
  .line 86
    return-void
  :L5
  .line 72
    move-exception p1
    iput-boolean v1, p0, Lcom/innioasis/ipp/Fixed;->laying:Z
  .line 73
    throw p1
.end method

.method protected onMeasure(II)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 59
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed;->laying:Z
  .line 61
    const/4 v0, 0
  :L0
    invoke-super { p0, p1, p2 }, Landroidx/recyclerview/widget/RecyclerView;->onMeasure(II)V
  :L1
  .line 63
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed;->laying:Z
  .line 64
    nop
  .line 65
    return-void
  :L2
  .line 63
    move-exception p1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed;->laying:Z
  .line 64
    throw p1
.end method

.method public requestLayout()V
  .registers 2
  .line 36
    iget-boolean v0, p0, Lcom/innioasis/ipp/Fixed;->laying:Z
    if-nez v0, :L2
    invoke-direct { p0 }, Lcom/innioasis/ipp/Fixed;->contained()Z
    move-result v0
    if-nez v0, :L0
    goto :L2
  :L0
  .line 40
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->forceLayout()V
  .line 41
    iget-boolean v0, p0, Lcom/innioasis/ipp/Fixed;->posted:Z
    if-nez v0, :L1
  .line 42
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Fixed;->posted:Z
  .line 43
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed;->self:Lcom/innioasis/ipp/Fixed$Self;
    invoke-virtual { p0, v0 }, Lcom/innioasis/ipp/Fixed;->postOnAnimation(Ljava/lang/Runnable;)V
  :L1
  .line 45
    return-void
  :L2
  .line 37
    invoke-super { p0 }, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V
  .line 38
    return-void
.end method

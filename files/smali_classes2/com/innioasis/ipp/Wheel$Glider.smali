.class final Lcom/innioasis/ipp/Wheel$Glider;
.super Ljava/lang/Object;
.implements Landroid/view/Choreographer$FrameCallback;
.source "Wheel.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wheel;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Glider"
.end annotation

.field private final static G:Lcom/innioasis/ipp/Wheel$Glider;

.field private final static RATE:F = 14.0F

.field private final static VMAX:F = 6000.0F

.field private final static VMIN:F = 400.0F

.field private static last:J

.field private static left:F

.field private static running:Z

.field private static view:Ljava/lang/ref/WeakReference;

.method static constructor <clinit>()V
  .registers 2
  .line 564
    new-instance v0, Lcom/innioasis/ipp/Wheel$Glider;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Glider;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
  .line 565
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 558
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static stop()V
  .registers 2
  .line 585
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 586
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 587
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 588
    return-void
.end method

.method static to(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 571
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L0
  .line 572
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 573
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  :L0
  .line 575
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 576
    int-to-float p0, p1
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 577
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-nez p0, :L1
    if-eqz p1, :L1
  .line 578
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 579
    const-wide/16 p0, 0
    sput-wide p0, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 580
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L1
  .line 582
    return-void
.end method

.method public doFrame(J)V
  .registers 11
  .line 591
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 592
    const/4 v1, 0
    const/4 v2, 0
    if-eqz v0, :L8
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    if-eqz v3, :L8
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float v3, v3, v2
    if-nez v3, :L0
    goto/16 :L8
  :L0
  .line 597
    const-wide/32 v3, 1000000
    div-long/2addr p1, v3
  .line 598
    sget-wide v3, Lcom/innioasis/ipp/Wheel$Glider;->last:J
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-nez v7, :L1
    const v3, 1015222895
    goto :L2
  :L1
    sub-long v3, p1, v3
    long-to-float v3, v3
    const/high16 v4, 0x447A0000
    div-float/2addr v3, v4
    const v4, 1028443341
    invoke-static { v4, v3 }, Ljava/lang/Math;->min(FF)F
    move-result v3
  :L2
  .line 599
    sput-wide p1, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 600
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
  .line 601
    const/high16 p2, 0x41600000
    mul-float p2, p2, p1
    const v4, 1169915904
    invoke-static { v4, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p2
    const/high16 v4, 0x43C80000
    invoke-static { v4, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
  .line 602
    mul-float p2, p2, v3
    const/high16 v3, 0x3F800000
    invoke-static { v3, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
    invoke-static { p1, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 603
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpg-float p2, p2, v2
    if-gez p2, :L3
    neg-int p1, p1
  :L3
  .line 604
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result p2
  .line 605
    invoke-virtual { v0, v1, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 606
    sget v4, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    int-to-float p1, p1
    sub-float/2addr v4, p1
    sput v4, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 608
    invoke-static { v4 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpg-float p1, p1, v3
    if-ltz p1, :L4
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result p1
    if-ne p1, p2, :L5
  :L4
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  :L5
  .line 609
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-eqz p1, :L6
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
    goto :L7
  :L6
  .line 610
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  :L7
  .line 611
    return-void
  :L8
  .line 593
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 594
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 595
    return-void
.end method

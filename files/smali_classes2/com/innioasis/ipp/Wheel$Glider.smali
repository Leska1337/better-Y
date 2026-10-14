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

.field private static alloc:I

.field private static counting:Z

.field private static last:J

.field private static left:F

.field private static running:Z

.field private static total:F

.field private static view:Ljava/lang/ref/WeakReference;

.method static constructor <clinit>()V
  .registers 2
  .line 588
    new-instance v0, Lcom/innioasis/ipp/Wheel$Glider;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Glider;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
  .line 589
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 582
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static done(Landroidx/recyclerview/widget/RecyclerView;)F
  .registers 3
  .line 643
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p0, :L1
    sget p0, Lcom/innioasis/ipp/Wheel$Glider;->total:F
    const/high16 v0, 0x3F800000
    cmpg-float p0, p0, v0
    if-gez p0, :L0
    goto :L1
  :L0
    sget p0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p0 }, Ljava/lang/Math;->abs(F)F
    move-result p0
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->total:F
    div-float/2addr p0, v1
    sub-float/2addr v0, p0
    goto :L2
  :L1
    const/high16 v0, 0xBF800000
  :L2
    return v0
.end method

.method static left(Landroidx/recyclerview/widget/RecyclerView;)F
  .registers 2
  .line 638
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p0, :L0
    sget p0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static measured()V
  .registers 5
  .line 631
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result v0
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
    sub-int/2addr v0, v1
    div-int/lit16 v0, v0, 1024
  .line 632
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    int-to-long v3, v0
    sub-long/2addr v1, v3
    const-string v0, "alloc KB"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 633
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 634
    return-void
.end method

.method static stop()V
  .registers 2
  .line 616
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 617
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 618
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 619
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->total:F
  .line 620
    return-void
.end method

.method static to(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 595
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L0
  .line 596
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 597
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  :L0
  .line 599
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 600
    int-to-float p0, p1
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 601
    invoke-static { p1 }, Ljava/lang/Math;->abs(I)I
    move-result p0
    int-to-float p0, p0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->total:F
  .line 602
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1000()Z
    move-result p0
    const/4 v0, 1
    if-eqz p0, :L2
  .line 603
    const-string p0, "playlists wrap"
    invoke-static { p0 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;)V
  .line 604
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
    if-nez p0, :L1
    invoke-static { }, Landroid/os/Debug;->startAllocCounting()V
  :L1
  .line 605
    sput-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
  .line 606
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
  :L2
  .line 608
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-nez p0, :L3
    if-eqz p1, :L3
  .line 609
    sput-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 610
    const-wide/16 p0, 0
    sput-wide p0, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 611
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L3
  .line 613
    return-void
.end method

.method public doFrame(J)V
  .registers 14
  .line 647
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 648
    const/4 v1, 0
    const/4 v2, 0
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    if-eqz v3, :L10
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float v3, v3, v2
    if-nez v3, :L0
    goto/16 :L10
  :L0
  .line 655
    const-wide/32 v3, 1000000
    div-long/2addr p1, v3
  .line 656
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
  .line 657
    sput-wide p1, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 658
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
  .line 659
    const/high16 p2, 0x41600000
    mul-float p2, p2, p1
    const v4, 1169915904
    invoke-static { v4, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p2
    const/high16 v4, 0x43C80000
    invoke-static { v4, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
  .line 660
    mul-float p2, p2, v3
    const/high16 v3, 0x3F800000
    invoke-static { v3, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
    invoke-static { p1, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 661
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpg-float p2, p2, v2
    if-gez p2, :L3
    neg-int p1, p1
  :L3
  .line 662
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result p2
  .line 663
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 664
    invoke-virtual { v0, v1, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 665
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
    sub-long/2addr v6, v4
    const-wide/16 v8, 4
    cmp-long v10, v6, v8
    if-ltz v10, :L4
    const-string v6, "scroll"
    invoke-static { v6, v4, v5 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L4
  .line 666
    sget v4, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    int-to-float p1, p1
    sub-float/2addr v4, p1
    sput v4, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 669
    invoke-static { v4 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpg-float p1, p1, v3
    if-ltz p1, :L5
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result p1
    if-ne p1, p2, :L7
  :L5
  .line 670
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpl-float p1, p1, v3
    if-ltz p1, :L6
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->total:F
  :L6
  .line 671
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  :L7
  .line 673
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-eqz p1, :L8
  .line 674
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
    goto :L9
  :L8
  .line 676
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 677
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  :L9
  .line 679
    return-void
  :L10
  .line 649
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 650
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 651
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->total:F
  .line 652
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  .line 653
    return-void
.end method

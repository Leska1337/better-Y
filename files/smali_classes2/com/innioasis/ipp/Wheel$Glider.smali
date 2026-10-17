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

.field private static easeAt:J

.field private static easeMs:I

.field private static easeTotal:I

.field private static last:J

.field private static left:F

.field private static running:Z

.field private static view:Ljava/lang/ref/WeakReference;

.method static constructor <clinit>()V
  .registers 2
  .line 646
    new-instance v0, Lcom/innioasis/ipp/Wheel$Glider;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Glider;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
  .line 647
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 640
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static left(Landroidx/recyclerview/widget/RecyclerView;)F
  .registers 2
  .line 698
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
  .line 691
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result v0
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
    sub-int/2addr v0, v1
    div-int/lit16 v0, v0, 1024
  .line 692
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    int-to-long v3, v0
    sub-long/2addr v1, v3
    const-string v0, "alloc KB"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 693
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 694
    return-void
.end method

.method static stop()V
  .registers 2
  .line 680
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 681
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 682
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 683
    return-void
.end method

.method static to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 7
  .line 657
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L0
  .line 658
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 659
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  :L0
  .line 661
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 662
    int-to-float v0, p1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 663
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
  .line 664
    sput p1, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
  .line 665
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  .line 666
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1100()Z
    move-result p2
    const/4 v2, 1
    if-eqz p2, :L2
  .line 667
    new-instance p2, Ljava/lang/StringBuilder;
    invoke-direct { p2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "grid wrap "
    invoke-virtual { p2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Frames;->start(Ljava/lang/String;Z)V
  .line 668
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
    if-nez p0, :L1
    invoke-static { }, Landroid/os/Debug;->startAllocCounting()V
  :L1
  .line 669
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
  .line 670
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
  :L2
  .line 672
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-nez p0, :L3
    if-eqz p1, :L3
  .line 673
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 674
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 675
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L3
  .line 677
    return-void
.end method

.method public doFrame(J)V
  .registers 14
  .line 702
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 703
    const/4 v1, 0
    const/4 v2, 0
    if-eqz v0, :L13
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    if-eqz v3, :L13
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float v3, v3, v2
    if-nez v3, :L0
    goto/16 :L13
  :L0
  .line 709
    const-wide/32 v3, 1000000
    div-long/2addr p1, v3
  .line 710
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
  .line 711
    sput-wide p1, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 713
    sget v4, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
    const/high16 v7, 0x3F800000
    if-lez v4, :L6
  .line 714
    sget-wide v8, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    cmp-long v3, v8, v5
    if-nez v3, :L3
    const-wide/16 v5, 16
    sub-long v5, p1, v5
    sput-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  :L3
  .line 715
    sget-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    sub-long/2addr p1, v5
    long-to-float p1, p1
    int-to-float p2, v4
    div-float/2addr p1, p2
    invoke-static { v7, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
  .line 716
    sub-float p2, v7, p1
  .line 717
    cmpl-float p1, p1, v7
    if-ltz p1, :L4
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    goto :L5
  :L4
  .line 718
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
    int-to-float p1, p1
    mul-float v3, p2, p2
    mul-float v3, v3, p2
    sub-float p2, v7, v3
    mul-float p1, p1, p2
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
    int-to-float p2, p2
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    sub-float/2addr p2, v3
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p2
    sub-int/2addr p1, p2
  :L5
  .line 719
    goto :L7
  :L6
  .line 720
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
  .line 721
    const/high16 p2, 0x41600000
    mul-float p2, p2, p1
    const v4, 1169915904
    invoke-static { v4, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p2
    const/high16 v4, 0x43C80000
    invoke-static { v4, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
  .line 722
    mul-float p2, p2, v3
    invoke-static { v7, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
    invoke-static { p1, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 723
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpg-float p2, p2, v2
    if-gez p2, :L7
    neg-int p1, p1
  :L7
  .line 725
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result p2
  .line 726
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 727
    invoke-virtual { v0, v1, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 728
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sub-long/2addr v5, v3
    const-wide/16 v8, 4
    cmp-long v10, v5, v8
    if-ltz v10, :L8
    const-string v5, "scroll"
    invoke-static { v5, v3, v4 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L8
  .line 729
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    int-to-float v4, p1
    sub-float/2addr v3, v4
    sput v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 731
    invoke-static { v3 }, Ljava/lang/Math;->abs(F)F
    move-result v3
    cmpg-float v3, v3, v7
    if-ltz v3, :L9
    if-eqz p1, :L10
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result p1
    if-ne p1, p2, :L10
  :L9
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  :L10
  .line 732
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-eqz p1, :L11
  .line 733
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
    goto :L12
  :L11
  .line 735
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 736
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  :L12
  .line 738
    return-void
  :L13
  .line 704
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 705
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 706
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  .line 707
    return-void
.end method

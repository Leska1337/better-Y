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

.field private final static LIST_RATE:F = 24.0F

.field private final static RATE:F = 14.0F

.field private final static VMAX:F = 6000.0F

.field private final static VMIN:F = 400.0F

.field private static aimDown:Z

.field private static aimPos:I

.field private static alloc:I

.field private static counting:Z

.field private static easeAt:J

.field private static easeMs:I

.field private static easeTotal:I

.field private static last:J

.field private static left:F

.field private static rate:F

.field private static running:Z

.field private static view:Ljava/lang/ref/WeakReference;

.method static constructor <clinit>()V
  .registers 2
  .line 738
    const/high16 v0, 0x41600000
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
  .line 745
    new-instance v0, Lcom/innioasis/ipp/Wheel$Glider;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Glider;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
  .line 746
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  .line 788
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 731
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static aim(IZ)V
  .registers 2
  .line 792
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 793
    sput-boolean p1, Lcom/innioasis/ipp/Wheel$Glider;->aimDown:Z
  .line 794
    return-void
.end method

.method static left(Landroidx/recyclerview/widget/RecyclerView;)F
  .registers 2
  .line 822
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

.method static list()V
  .registers 1
  .line 742
    const/high16 v0, 0x41C00000
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
  .line 743
    return-void
.end method

.method private static measured()V
  .registers 5
  .line 815
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result v0
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
    sub-int/2addr v0, v1
    div-int/lit16 v0, v0, 1024
  .line 816
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    int-to-long v3, v0
    sub-long/2addr v1, v3
    const-string v0, "alloc KB"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 817
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 818
    return-void
.end method

.method private static reaim(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 4
  .line 798
    sget v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    if-gez v0, :L0
    return-void
  :L0
  .line 799
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 800
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-eqz v1, :L1
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v0
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 801
    if-nez v0, :L3
    return-void
  :L3
  .line 802
    sget-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->aimDown:Z
    const/4 v2, 0
    if-eqz v1, :L4
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Wheel;->access$1500(Landroid/view/View;Z)I
    move-result v0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result p0
    sub-int/2addr v1, p0
    sub-int/2addr v0, v1
    goto :L5
  :L4
  .line 803
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Wheel;->access$1600(Landroid/view/View;Z)I
    move-result v0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result p0
    sub-int/2addr v0, p0
  :L5
  .line 804
    sget p0, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
    if-lez p0, :L6
    sget p0, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
    int-to-float v1, v0
    sget v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    sub-float/2addr v1, v2
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
    add-int/2addr p0, v1
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
  :L6
  .line 805
    int-to-float p0, v0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 806
    const/4 p0, -1
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 807
    return-void
.end method

.method static stop()V
  .registers 2
  .line 781
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 782
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 783
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 784
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 785
    return-void
.end method

.method static to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 7
  .line 756
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L0
  .line 757
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 758
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  :L0
  .line 760
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 761
    int-to-float v0, p1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 762
    const/high16 v0, 0x41600000
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
  .line 763
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 764
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
  .line 765
    sput p1, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
  .line 766
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  .line 767
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1100()Z
    move-result p2
    const/4 v2, 1
    if-eqz p2, :L2
  .line 768
    new-instance p2, Ljava/lang/StringBuilder;
    invoke-direct { p2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "glide wrap "
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
  .line 769
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
    if-nez p0, :L1
    invoke-static { }, Landroid/os/Debug;->startAllocCounting()V
  :L1
  .line 770
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
  .line 771
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
  :L2
  .line 773
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-nez p0, :L3
    if-eqz p1, :L3
  .line 774
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 775
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 776
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L3
  .line 778
    return-void
.end method

.method public doFrame(J)V
  .registers 15
  .line 826
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 827
    if-eqz v0, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel$Glider;->reaim(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 828
    const/4 v1, 0
    const/4 v2, 0
    if-eqz v0, :L20
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    if-eqz v3, :L20
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float v3, v3, v1
    if-nez v3, :L1
    goto/16 :L20
  :L1
  .line 834
    const-wide/32 v3, 1000000
    div-long/2addr p1, v3
  .line 835
    sget-wide v3, Lcom/innioasis/ipp/Wheel$Glider;->last:J
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-nez v7, :L2
    const v3, 1015222895
    goto :L3
  :L2
    sub-long v3, p1, v3
    long-to-float v3, v3
    const/high16 v4, 0x447A0000
    div-float/2addr v3, v4
    const v4, 1028443341
    invoke-static { v4, v3 }, Ljava/lang/Math;->min(FF)F
    move-result v3
  :L3
  .line 836
    sput-wide p1, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 838
    sget v4, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
    const/high16 v7, 0x3F800000
    if-lez v4, :L7
  .line 839
    sget-wide v8, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    cmp-long v3, v8, v5
    if-nez v3, :L4
    const-wide/16 v5, 16
    sub-long v5, p1, v5
    sput-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  :L4
  .line 840
    sget-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    sub-long/2addr p1, v5
    long-to-float p1, p1
    int-to-float p2, v4
    div-float/2addr p1, p2
    invoke-static { v7, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
  .line 841
    sub-float p2, v7, p1
  .line 842
    cmpl-float p1, p1, v7
    if-ltz p1, :L5
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    goto :L6
  :L5
  .line 843
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
  :L6
  .line 844
    goto :L8
  :L7
  .line 845
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
  .line 846
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
    mul-float p2, p2, p1
    const v4, 1169915904
    invoke-static { v4, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p2
    const/high16 v4, 0x43C80000
    invoke-static { v4, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
  .line 847
    mul-float p2, p2, v3
    invoke-static { v7, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
    invoke-static { p1, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 848
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpg-float p2, p2, v1
    if-gez p2, :L8
    neg-int p1, p1
  :L8
  .line 853
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p2
    if-lez p2, :L9
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result p2
    div-int/lit8 p2, p2, 2
    invoke-virtual { v0, p2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object p2
    goto :L10
  :L9
    const/4 p2, 0
  :L10
  .line 854
    if-nez p2, :L11
    const/4 v3, 0
    goto :L12
  :L11
    invoke-virtual { p2 }, Landroid/view/View;->getTop()I
    move-result v3
  :L12
  .line 855
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 856
    invoke-virtual { v0, v2, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 857
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v8
    sub-long/2addr v8, v4
    const-wide/16 v10, 4
    cmp-long v6, v8, v10
    if-ltz v6, :L13
    const-string v6, "scroll"
    invoke-static { v6, v4, v5 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L13
  .line 858
    sget v4, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    int-to-float v5, p1
    sub-float/2addr v4, v5
    sput v4, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 859
    if-eqz p1, :L14
    if-eqz p2, :L14
    invoke-virtual { p2 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p1
    if-ne p1, v0, :L14
    invoke-virtual { p2 }, Landroid/view/View;->getTop()I
    move-result p1
    if-ne p1, v3, :L14
    const/4 p1, 1
    goto :L15
  :L14
    const/4 p1, 0
  :L15
  .line 860
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p2 }, Ljava/lang/Math;->abs(F)F
    move-result p2
    cmpg-float p2, p2, v7
    if-ltz p2, :L16
    if-eqz p1, :L17
  :L16
    sput v1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  :L17
  .line 861
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v1
    if-eqz p1, :L18
  .line 862
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
    goto :L19
  :L18
  .line 864
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 865
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  :L19
  .line 867
    return-void
  :L20
  .line 829
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 830
    sput v1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 831
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  .line 832
    return-void
.end method

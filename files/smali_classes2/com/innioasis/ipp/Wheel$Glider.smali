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
  .line 739
    const/high16 v0, 0x41600000
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
  .line 746
    new-instance v0, Lcom/innioasis/ipp/Wheel$Glider;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Glider;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
  .line 747
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  .line 789
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 732
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static aim(IZ)V
  .registers 2
  .line 793
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 794
    sput-boolean p1, Lcom/innioasis/ipp/Wheel$Glider;->aimDown:Z
  .line 795
    return-void
.end method

.method private static atEnd(Landroidx/recyclerview/widget/RecyclerView;Z)Z
  .registers 7
  .line 803
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  .line 804
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
  .line 805
    const/4 v2, 1
    if-eqz v0, :L8
    if-nez v1, :L0
    goto :L8
  :L0
  .line 806
    const/4 v3, 0
    if-eqz p1, :L1
    sub-int/2addr v1, v2
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 807
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I
    move-result v4
  .line 808
    if-eqz p1, :L5
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p1
    sub-int/2addr p1, v2
    if-ne v4, p1, :L3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Wheel;->access$1500(Landroid/view/View;Z)I
    move-result p1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result p0
    sub-int/2addr v0, p0
    if-gt p1, v0, :L3
    goto :L4
  :L3
    const/4 v2, 0
  :L4
    return v2
  :L5
  .line 809
    if-nez v4, :L6
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Wheel;->access$1600(Landroid/view/View;Z)I
    move-result p1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result p0
    if-lt p1, p0, :L6
    goto :L7
  :L6
    const/4 v2, 0
  :L7
    return v2
  :L8
  .line 805
    return v2
.end method

.method static left(Landroidx/recyclerview/widget/RecyclerView;)F
  .registers 2
  .line 838
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
  .line 743
    const/high16 v0, 0x41C00000
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
  .line 744
    return-void
.end method

.method private static measured()V
  .registers 5
  .line 831
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result v0
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
    sub-int/2addr v0, v1
    div-int/lit16 v0, v0, 1024
  .line 832
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    int-to-long v3, v0
    sub-long/2addr v1, v3
    const-string v0, "alloc KB"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 833
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 834
    return-void
.end method

.method private static reaim(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 4
  .line 814
    sget v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    if-gez v0, :L0
    return-void
  :L0
  .line 815
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 816
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
  .line 817
    if-nez v0, :L3
    return-void
  :L3
  .line 818
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
  .line 819
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Wheel;->access$1600(Landroid/view/View;Z)I
    move-result v0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result p0
    sub-int/2addr v0, p0
  :L5
  .line 820
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
  .line 821
    int-to-float p0, v0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 822
    const/4 p0, -1
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 823
    return-void
.end method

.method static stop()V
  .registers 2
  .line 782
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 783
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 784
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 785
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 786
    return-void
.end method

.method static to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 7
  .line 757
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L0
  .line 758
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 759
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  :L0
  .line 761
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 762
    int-to-float v0, p1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 763
    const/high16 v0, 0x41600000
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
  .line 764
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 765
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
  .line 766
    sput p1, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
  .line 767
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  .line 768
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1100()Z
    move-result p2
    const/4 v2, 1
    if-eqz p2, :L2
  .line 769
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
  .line 770
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
    if-nez p0, :L1
    invoke-static { }, Landroid/os/Debug;->startAllocCounting()V
  :L1
  .line 771
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
  .line 772
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
  :L2
  .line 774
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-nez p0, :L3
    if-eqz p1, :L3
  .line 775
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 776
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 777
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L3
  .line 779
    return-void
.end method

.method public doFrame(J)V
  .registers 13
  .line 842
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 843
    if-eqz v0, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel$Glider;->reaim(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 844
    const/4 v1, 0
    const/4 v2, 0
    if-eqz v0, :L16
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    if-eqz v3, :L16
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float v3, v3, v2
    if-nez v3, :L1
    goto/16 :L16
  :L1
  .line 850
    const-wide/32 v3, 1000000
    div-long/2addr p1, v3
  .line 851
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
  .line 852
    sput-wide p1, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 854
    sget v4, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
    const/high16 v7, 0x3F800000
    if-lez v4, :L7
  .line 855
    sget-wide v8, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    cmp-long v3, v8, v5
    if-nez v3, :L4
    const-wide/16 v5, 16
    sub-long v5, p1, v5
    sput-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  :L4
  .line 856
    sget-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    sub-long/2addr p1, v5
    long-to-float p1, p1
    int-to-float p2, v4
    div-float/2addr p1, p2
    invoke-static { v7, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
  .line 857
    sub-float p2, v7, p1
  .line 858
    cmpl-float p1, p1, v7
    if-ltz p1, :L5
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    goto :L6
  :L5
  .line 859
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
  .line 860
    goto :L8
  :L7
  .line 861
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
  .line 862
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
    mul-float p2, p2, p1
    const v4, 1169915904
    invoke-static { v4, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p2
    const/high16 v4, 0x43C80000
    invoke-static { v4, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
  .line 863
    mul-float p2, p2, v3
    invoke-static { v7, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
    invoke-static { p1, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 864
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpg-float p2, p2, v2
    if-gez p2, :L8
    neg-int p1, p1
  :L8
  .line 866
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 867
    invoke-virtual { v0, v1, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 868
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sub-long/2addr v5, v3
    const-wide/16 v8, 4
    cmp-long p2, v5, v8
    if-ltz p2, :L9
    const-string p2, "scroll"
    invoke-static { p2, v3, v4 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L9
  .line 869
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    int-to-float p1, p1
    sub-float/2addr p2, p1
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 870
    invoke-static { p2 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpg-float p1, p1, v7
    if-ltz p1, :L12
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-lez p1, :L10
    const/4 p1, 1
    goto :L11
  :L10
    const/4 p1, 0
  :L11
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Wheel$Glider;->atEnd(Landroidx/recyclerview/widget/RecyclerView;Z)Z
    move-result p1
    if-eqz p1, :L13
  :L12
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  :L13
  .line 871
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-eqz p1, :L14
  .line 872
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
    goto :L15
  :L14
  .line 874
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 875
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  :L15
  .line 877
    return-void
  :L16
  .line 845
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 846
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 847
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  .line 848
    return-void
.end method

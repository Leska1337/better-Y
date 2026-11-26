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

.field private final static OMEGA:F = 30.0F

.field private static aimDown:Z

.field private static aimPos:I

.field private static easeAt:J

.field private static easeMs:I

.field private static easeTotal:I

.field private static frac:F

.field private static last:J

.field private static left:F

.field private static running:Z

.field private static vel:F

.field private static view:Ljava/lang/ref/WeakReference;

.method static constructor <clinit>()V
  .registers 2
  .line 659
    new-instance v0, Lcom/innioasis/ipp/Wheel$Glider;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Glider;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
  .line 660
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  .line 699
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 649
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static aim(IZ)V
  .registers 2
  .line 703
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 704
    sput-boolean p1, Lcom/innioasis/ipp/Wheel$Glider;->aimDown:Z
  .line 705
    return-void
.end method

.method private static atEnd(Landroidx/recyclerview/widget/RecyclerView;Z)Z
  .registers 7
  .line 713
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  .line 714
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
  .line 715
    const/4 v2, 1
    if-eqz v0, :L8
    if-nez v1, :L0
    goto :L8
  :L0
  .line 716
    const/4 v3, 0
    if-eqz p1, :L1
    sub-int/2addr v1, v2
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 717
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I
    move-result v4
  .line 718
    if-eqz p1, :L5
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p1
    sub-int/2addr p1, v2
    if-ne v4, p1, :L3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Wheel;->access$600(Landroid/view/View;Z)I
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
  .line 719
    if-nez v4, :L6
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Wheel;->access$1200(Landroid/view/View;Z)I
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
  .line 715
    return v2
.end method

.method static left(Landroidx/recyclerview/widget/RecyclerView;)F
  .registers 2
  .line 737
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

.method private static reaim(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 4
  .line 724
    sget v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    if-gez v0, :L0
    return-void
  :L0
  .line 725
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 726
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
  .line 727
    if-nez v0, :L3
    return-void
  :L3
  .line 728
    sget-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->aimDown:Z
    const/4 v2, 0
    if-eqz v1, :L4
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Wheel;->access$600(Landroid/view/View;Z)I
    move-result v0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result p0
    sub-int/2addr v1, p0
    sub-int/2addr v0, v1
    goto :L5
  :L4
  .line 729
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Wheel;->access$1200(Landroid/view/View;Z)I
    move-result v0
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result p0
    sub-int/2addr v0, p0
  :L5
  .line 730
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
  .line 731
    int-to-float p0, v0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 732
    const/4 p0, -1
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 733
    return-void
.end method

.method static stop()V
  .registers 2
  .line 692
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-eqz v0, :L0
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L0
  .line 693
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 694
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 695
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 696
    return-void
.end method

.method static to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 5
  .line 670
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L0
  .line 671
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 672
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  :L0
  .line 674
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 675
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-nez p0, :L1
  .line 676
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
  .line 677
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
  :L1
  .line 679
    int-to-float v0, p1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 680
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 681
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
  .line 682
    sput p1, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
  .line 683
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  .line 684
    if-nez p0, :L2
    if-eqz p1, :L2
  .line 685
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 686
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 687
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L2
  .line 689
    return-void
.end method

.method public doFrame(J)V
  .registers 14
  .line 741
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 742
    if-eqz v0, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel$Glider;->reaim(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 743
    const/4 v1, 0
    const/4 v2, 0
    if-eqz v0, :L18
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    if-eqz v3, :L18
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float v3, v3, v2
    if-nez v3, :L1
    goto/16 :L18
  :L1
  .line 748
    const-wide/32 v3, 1000000
    div-long/2addr p1, v3
  .line 749
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
  .line 750
    sput-wide p1, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 752
    sget v4, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
    const/high16 v7, 0x41700000
    const/high16 v8, 0x3F800000
    if-lez v4, :L7
  .line 753
    sget-wide v9, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    cmp-long v3, v9, v5
    if-nez v3, :L4
    const-wide/16 v5, 16
    sub-long v5, p1, v5
    sput-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  :L4
  .line 754
    sget-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    sub-long/2addr p1, v5
    long-to-float p1, p1
    int-to-float p2, v4
    div-float/2addr p1, p2
    invoke-static { v8, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
  .line 755
    sub-float p2, v8, p1
  .line 756
    cmpl-float p1, p1, v8
    if-ltz p1, :L5
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    goto :L6
  :L5
  .line 757
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
    int-to-float p1, p1
    mul-float v3, p2, p2
    mul-float v3, v3, p2
    sub-float p2, v8, v3
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
  .line 758
    goto :L9
  :L7
  .line 759
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    neg-float p1, p1
  .line 760
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
    const/high16 v4, 0x41F00000
    mul-float v5, p1, v4
    add-float/2addr p2, v5
  .line 761
    const/high16 v5, 0xC1F00000
    mul-float v5, v5, v3
    float-to-double v5, v5
    invoke-static { v5, v6 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v5
    double-to-float v5, v5
  .line 762
    mul-float v6, p2, v3
    add-float/2addr v6, p1
    mul-float v6, v6, v5
  .line 763
    sget v9, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
    mul-float p2, p2, v4
    mul-float p2, p2, v3
    sub-float/2addr v9, p2
    mul-float v9, v9, v5
    sput v9, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
  .line 764
    invoke-static { v6 }, Ljava/lang/Math;->abs(F)F
    move-result p2
    const/high16 v3, 0x3F000000
    cmpg-float p2, p2, v3
    if-gez p2, :L8
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
    invoke-static { p2 }, Ljava/lang/Math;->abs(F)F
    move-result p2
    cmpg-float p2, p2, v7
    if-gez p2, :L8
  .line 765
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 766
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
  .line 767
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
    goto :L9
  :L8
  .line 769
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
    sub-float/2addr v6, p1
    add-float/2addr p2, v6
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
  .line 770
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 771
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
    int-to-float v3, p1
    sub-float/2addr p2, v3
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
  :L9
  .line 774
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 775
    invoke-virtual { v0, v1, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 776
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sub-long/2addr v5, v3
    const-wide/16 v9, 4
    cmp-long p2, v5, v9
    if-ltz p2, :L10
    const-string p2, "scroll"
    invoke-static { p2, v3, v4 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L10
  .line 777
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    int-to-float p1, p1
    sub-float/2addr p2, p1
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 778
    invoke-static { p2 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpg-float p1, p1, v8
    if-gez p1, :L11
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpg-float p1, p1, v7
    if-ltz p1, :L14
  :L11
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-lez p1, :L12
    const/4 p1, 1
    goto :L13
  :L12
    const/4 p1, 0
  :L13
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Wheel$Glider;->atEnd(Landroidx/recyclerview/widget/RecyclerView;Z)Z
    move-result p1
    if-eqz p1, :L15
  :L14
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  :L15
  .line 779
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-eqz p1, :L16
  .line 780
    invoke-static { }, Lcom/innioasis/ipp/Loop;->animating()V
  .line 781
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
    goto :L17
  :L16
  .line 783
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  :L17
  .line 785
    return-void
  :L18
  .line 744
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 745
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 746
    return-void
.end method

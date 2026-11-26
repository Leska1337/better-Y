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

.field private final static OMEGA:F = 22.0F

.field private static aimDown:Z

.field private static aimPos:I

.field private static alloc:I

.field private static counting:Z

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
  .line 771
    new-instance v0, Lcom/innioasis/ipp/Wheel$Glider;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Glider;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
  .line 772
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  .line 818
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 761
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static aim(IZ)V
  .registers 2
  .line 822
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 823
    sput-boolean p1, Lcom/innioasis/ipp/Wheel$Glider;->aimDown:Z
  .line 824
    return-void
.end method

.method private static atEnd(Landroidx/recyclerview/widget/RecyclerView;Z)Z
  .registers 7
  .line 832
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  .line 833
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
  .line 834
    const/4 v2, 1
    if-eqz v0, :L8
    if-nez v1, :L0
    goto :L8
  :L0
  .line 835
    const/4 v3, 0
    if-eqz p1, :L1
    sub-int/2addr v1, v2
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 836
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I
    move-result v4
  .line 837
    if-eqz p1, :L5
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p1
    sub-int/2addr p1, v2
    if-ne v4, p1, :L3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Wheel;->access$700(Landroid/view/View;Z)I
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
  .line 838
    if-nez v4, :L6
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Wheel;->access$1300(Landroid/view/View;Z)I
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
  .line 834
    return v2
.end method

.method static left(Landroidx/recyclerview/widget/RecyclerView;)F
  .registers 2
  .line 867
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
  .line 860
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result v0
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
    sub-int/2addr v0, v1
    div-int/lit16 v0, v0, 1024
  .line 861
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    int-to-long v3, v0
    sub-long/2addr v1, v3
    const-string v0, "alloc KB"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 862
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 863
    return-void
.end method

.method private static reaim(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 4
  .line 843
    sget v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    if-gez v0, :L0
    return-void
  :L0
  .line 844
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 845
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
  .line 846
    if-nez v0, :L3
    return-void
  :L3
  .line 847
    sget-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->aimDown:Z
    const/4 v2, 0
    if-eqz v1, :L4
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Wheel;->access$700(Landroid/view/View;Z)I
    move-result v0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result p0
    sub-int/2addr v1, p0
    sub-int/2addr v0, v1
    goto :L5
  :L4
  .line 848
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Wheel;->access$1300(Landroid/view/View;Z)I
    move-result v0
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result p0
    sub-int/2addr v0, p0
  :L5
  .line 849
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
  .line 850
    int-to-float p0, v0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 851
    const/4 p0, -1
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 852
    return-void
.end method

.method static stop()V
  .registers 3
  .line 810
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->DBG:Z
    const/4 v1, 0
    if-eqz v0, :L0
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-eqz v0, :L0
    sget v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float v0, v0, v1
    if-eqz v0, :L0
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "glider stop left "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " from "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->caller()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
  :L0
  .line 811
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-eqz v0, :L1
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v2, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { v0, v2 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L1
  .line 812
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 813
    sput v1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 814
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 815
    return-void
.end method

.method static to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 7
  .line 782
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L0
  .line 783
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 784
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  :L0
  .line 786
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 787
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-nez v0, :L1
  .line 788
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
  .line 789
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
  :L1
  .line 791
    int-to-float v0, p1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 792
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 793
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
  .line 794
    sput p1, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
  .line 795
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  .line 796
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$900()Z
    move-result p2
    const/4 v2, 1
    if-eqz p2, :L3
  .line 797
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
  .line 798
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
    if-nez p0, :L2
    invoke-static { }, Landroid/os/Debug;->startAllocCounting()V
  :L2
  .line 799
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
  .line 800
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
  :L3
  .line 802
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-nez p0, :L4
    if-eqz p1, :L4
  .line 803
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 804
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 805
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L4
  .line 807
    return-void
.end method

.method public doFrame(J)V
  .registers 14
  .line 871
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 872
    if-eqz v0, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel$Glider;->reaim(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 873
    const/4 v1, 0
    const/4 v2, 0
    if-eqz v0, :L22
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    if-eqz v3, :L22
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float v3, v3, v2
    if-nez v3, :L1
    goto/16 :L22
  :L1
  .line 879
    const-wide/32 v3, 1000000
    div-long/2addr p1, v3
  .line 880
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
  .line 881
    sput-wide p1, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 883
    sget v4, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
    const/high16 v7, 0x41700000
    const/high16 v8, 0x3F800000
    if-lez v4, :L7
  .line 884
    sget-wide v9, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    cmp-long v3, v9, v5
    if-nez v3, :L4
    const-wide/16 v5, 16
    sub-long v5, p1, v5
    sput-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  :L4
  .line 885
    sget-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    sub-long/2addr p1, v5
    long-to-float p1, p1
    int-to-float p2, v4
    div-float/2addr p1, p2
    invoke-static { v8, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
  .line 886
    sub-float p2, v8, p1
  .line 887
    cmpl-float p1, p1, v8
    if-ltz p1, :L5
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    goto :L6
  :L5
  .line 888
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
  .line 889
    goto :L9
  :L7
  .line 890
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    neg-float p1, p1
  .line 891
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
    const/high16 v4, 0x41B00000
    mul-float v5, p1, v4
    add-float/2addr p2, v5
  .line 892
    const/high16 v5, 0xC1B00000
    mul-float v5, v5, v3
    float-to-double v5, v5
    invoke-static { v5, v6 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v5
    double-to-float v5, v5
  .line 893
    mul-float v6, p2, v3
    add-float/2addr v6, p1
    mul-float v6, v6, v5
  .line 894
    sget v9, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
    mul-float p2, p2, v4
    mul-float p2, p2, v3
    sub-float/2addr v9, p2
    mul-float v9, v9, v5
    sput v9, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
  .line 895
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
  .line 896
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 897
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
  .line 898
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
    goto :L9
  :L8
  .line 900
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
    sub-float/2addr v6, p1
    add-float/2addr p2, v6
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
  .line 901
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 902
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
    int-to-float v3, p1
    sub-float/2addr p2, v3
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->frac:F
  :L9
  .line 905
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 906
    invoke-virtual { v0, v1, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 907
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sub-long/2addr v5, v3
    const-wide/16 v9, 4
    cmp-long p2, v5, v9
    if-ltz p2, :L10
    const-string p2, "scroll"
    invoke-static { p2, v3, v4 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L10
  .line 908
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    int-to-float p1, p1
    sub-float/2addr p2, p1
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 909
    sget-boolean p1, Lcom/innioasis/ipp/Wheel;->DBG:Z
    const/4 p2, 1
    if-eqz p1, :L13
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpl-float p1, p1, v8
    if-ltz p1, :L13
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-lez p1, :L11
    const/4 p1, 1
    goto :L12
  :L11
    const/4 p1, 0
  :L12
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Wheel$Glider;->atEnd(Landroidx/recyclerview/widget/RecyclerView;Z)Z
    move-result p1
    if-eqz p1, :L13
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "glider atEnd left "
    invoke-virtual { p1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-virtual { p1, v3 }, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v3, " "
    invoke-virtual { p1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->edge(Landroidx/recyclerview/widget/RecyclerView;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
  :L13
  .line 910
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpg-float p1, p1, v8
    if-gez p1, :L14
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->vel:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpg-float p1, p1, v7
    if-ltz p1, :L17
  :L14
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-lez p1, :L15
    goto :L16
  :L15
    const/4 p2, 0
  :L16
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Wheel$Glider;->atEnd(Landroidx/recyclerview/widget/RecyclerView;Z)Z
    move-result p1
    if-eqz p1, :L18
  :L17
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  :L18
  .line 911
    sget-boolean p1, Lcom/innioasis/ipp/Wheel;->DBG:Z
    if-eqz p1, :L19
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-nez p1, :L19
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string p2, "glider done "
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->edge(Landroidx/recyclerview/widget/RecyclerView;)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
  :L19
  .line 912
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-eqz p1, :L20
  .line 913
    invoke-static { }, Lcom/innioasis/ipp/Loop;->animating()V
  .line 914
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
    goto :L21
  :L20
  .line 916
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 917
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  :L21
  .line 919
    return-void
  :L22
  .line 874
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 875
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 876
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  .line 877
    return-void
.end method

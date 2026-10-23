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
  .line 887
    const/high16 v0, 0x41600000
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
  .line 894
    new-instance v0, Lcom/innioasis/ipp/Wheel$Glider;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Glider;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
  .line 895
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  .line 938
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 880
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static aim(IZ)V
  .registers 2
  .line 942
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 943
    sput-boolean p1, Lcom/innioasis/ipp/Wheel$Glider;->aimDown:Z
  .line 944
    return-void
.end method

.method private static atEnd(Landroidx/recyclerview/widget/RecyclerView;Z)Z
  .registers 7
  .line 952
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  .line 953
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
  .line 954
    const/4 v2, 1
    if-eqz v0, :L8
    if-nez v1, :L0
    goto :L8
  :L0
  .line 955
    const/4 v3, 0
    if-eqz p1, :L1
    sub-int/2addr v1, v2
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 956
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I
    move-result v4
  .line 957
    if-eqz p1, :L5
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p1
    sub-int/2addr p1, v2
    if-ne v4, p1, :L3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Wheel;->access$1900(Landroid/view/View;Z)I
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
  .line 958
    if-nez v4, :L6
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Wheel;->access$2000(Landroid/view/View;Z)I
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
  .line 954
    return v2
.end method

.method static left(Landroidx/recyclerview/widget/RecyclerView;)F
  .registers 2
  .line 987
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
  .line 891
    const/high16 v0, 0x41C00000
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
  .line 892
    return-void
.end method

.method private static measured()V
  .registers 5
  .line 980
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result v0
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
    sub-int/2addr v0, v1
    div-int/lit16 v0, v0, 1024
  .line 981
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    int-to-long v3, v0
    sub-long/2addr v1, v3
    const-string v0, "alloc KB"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  .line 982
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 983
    return-void
.end method

.method private static reaim(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 4
  .line 963
    sget v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    if-gez v0, :L0
    return-void
  :L0
  .line 964
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 965
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
  .line 966
    if-nez v0, :L3
    return-void
  :L3
  .line 967
    sget-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->aimDown:Z
    const/4 v2, 0
    if-eqz v1, :L4
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Wheel;->access$1900(Landroid/view/View;Z)I
    move-result v0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result p0
    sub-int/2addr v1, p0
    sub-int/2addr v0, v1
    goto :L5
  :L4
  .line 968
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Wheel;->access$2000(Landroid/view/View;Z)I
    move-result v0
    sget v1, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result p0
    sub-int/2addr v0, p0
  :L5
  .line 969
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
  .line 970
    int-to-float p0, v0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 971
    const/4 p0, -1
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 972
    return-void
.end method

.method static stop()V
  .registers 3
  .line 930
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
  .line 931
    sget-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-eqz v0, :L1
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v2, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { v0, v2 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L1
  .line 932
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 933
    sput v1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 934
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 935
    return-void
.end method

.method static to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 7
  .line 905
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L0
  .line 906
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 907
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
  :L0
  .line 909
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 910
    int-to-float v0, p1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 911
    const/high16 v0, 0x41600000
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
  .line 912
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel$Glider;->aimPos:I
  .line 913
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
  .line 914
    sput p1, Lcom/innioasis/ipp/Wheel$Glider;->easeTotal:I
  .line 915
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  .line 916
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1500()Z
    move-result p2
    const/4 v2, 1
    if-eqz p2, :L2
  .line 917
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
  .line 918
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
    if-nez p0, :L1
    invoke-static { }, Landroid/os/Debug;->startAllocCounting()V
  :L1
  .line 919
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->counting:Z
  .line 920
    invoke-static { }, Landroid/os/Debug;->getThreadAllocSize()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Wheel$Glider;->alloc:I
  :L2
  .line 922
    sget-boolean p0, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
    if-nez p0, :L3
    if-eqz p1, :L3
  .line 923
    sput-boolean v2, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 924
    sput-wide v0, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 925
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel$Glider;->G:Lcom/innioasis/ipp/Wheel$Glider;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L3
  .line 927
    return-void
.end method

.method public doFrame(J)V
  .registers 13
  .line 991
    sget-object v0, Lcom/innioasis/ipp/Wheel$Glider;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 992
    if-eqz v0, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel$Glider;->reaim(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 993
    const/4 v1, 0
    const/4 v2, 0
    if-eqz v0, :L20
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    if-eqz v3, :L20
    sget v3, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float v3, v3, v2
    if-nez v3, :L1
    goto/16 :L20
  :L1
  .line 999
    const-wide/32 v3, 1000000
    div-long/2addr p1, v3
  .line 1000
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
  .line 1001
    sput-wide p1, Lcom/innioasis/ipp/Wheel$Glider;->last:J
  .line 1003
    sget v4, Lcom/innioasis/ipp/Wheel$Glider;->easeMs:I
    const/high16 v7, 0x3F800000
    if-lez v4, :L7
  .line 1004
    sget-wide v8, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    cmp-long v3, v8, v5
    if-nez v3, :L4
    const-wide/16 v5, 16
    sub-long v5, p1, v5
    sput-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
  :L4
  .line 1005
    sget-wide v5, Lcom/innioasis/ipp/Wheel$Glider;->easeAt:J
    sub-long/2addr p1, v5
    long-to-float p1, p1
    int-to-float p2, v4
    div-float/2addr p1, p2
    invoke-static { v7, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
  .line 1006
    sub-float p2, v7, p1
  .line 1007
    cmpl-float p1, p1, v7
    if-ltz p1, :L5
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    goto :L6
  :L5
  .line 1008
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
  .line 1009
    goto :L8
  :L7
  .line 1010
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
  .line 1011
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->rate:F
    mul-float p2, p2, p1
    const v4, 1169915904
    invoke-static { v4, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p2
    const/high16 v4, 0x43C80000
    invoke-static { v4, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
  .line 1012
    mul-float p2, p2, v3
    invoke-static { v7, p2 }, Ljava/lang/Math;->max(FF)F
    move-result p2
    invoke-static { p1, p2 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 1013
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpg-float p2, p2, v2
    if-gez p2, :L8
    neg-int p1, p1
  :L8
  .line 1015
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 1016
    invoke-virtual { v0, v1, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 1017
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sub-long/2addr v5, v3
    const-wide/16 v8, 4
    cmp-long p2, v5, v8
    if-ltz p2, :L9
    const-string p2, "scroll"
    invoke-static { p2, v3, v4 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L9
  .line 1018
    sget p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    int-to-float p1, p1
    sub-float/2addr p2, p1
    sput p2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 1019
    sget-boolean p1, Lcom/innioasis/ipp/Wheel;->DBG:Z
    const/4 p2, 1
    if-eqz p1, :L12
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpl-float p1, p1, v7
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
    if-eqz p1, :L12
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
  :L12
  .line 1020
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p1
    cmpg-float p1, p1, v7
    if-ltz p1, :L15
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-lez p1, :L13
    goto :L14
  :L13
    const/4 p2, 0
  :L14
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Wheel$Glider;->atEnd(Landroidx/recyclerview/widget/RecyclerView;Z)Z
    move-result p1
    if-eqz p1, :L16
  :L15
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  :L16
  .line 1021
    sget-boolean p1, Lcom/innioasis/ipp/Wheel;->DBG:Z
    if-eqz p1, :L17
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-nez p1, :L17
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
  :L17
  .line 1022
    sget p1, Lcom/innioasis/ipp/Wheel$Glider;->left:F
    cmpl-float p1, p1, v2
    if-eqz p1, :L18
  .line 1023
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
    goto :L19
  :L18
  .line 1025
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 1026
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  :L19
  .line 1028
    return-void
  :L20
  .line 994
    sput-boolean v1, Lcom/innioasis/ipp/Wheel$Glider;->running:Z
  .line 995
    sput v2, Lcom/innioasis/ipp/Wheel$Glider;->left:F
  .line 996
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->measured()V
  .line 997
    return-void
.end method

.class public final Lcom/innioasis/ipp/Wheel;
.super Ljava/lang/Object;
.source "Wheel.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Wheel$Rest;,
    Lcom/innioasis/ipp/Wheel$Now;,
    Lcom/innioasis/ipp/Wheel$AlphaDbg;,
    Lcom/innioasis/ipp/Wheel$Step;,
    Lcom/innioasis/ipp/Wheel$Glider;,
    Lcom/innioasis/ipp/Wheel$Settle;,
    Lcom/innioasis/ipp/Wheel$Release;
  }
.end annotation

.field private final static ACCEL:Z = false

.field private final static ACCEL_MAX_ROWS:I = 6

.field private final static ACCEL_MAX_SHORT:I = 2

.field private final static ACCEL_RESET_MS:J = 250L

.field private final static ACCEL_SMOOTH:F = 0.125F

.field private final static ACCEL_START:F = 10.0F

.field private final static ACCEL_START_SHORT:F = 12.0F

.field final static DBG:Z = false

.field private final static GLIDE_ROWS:I = 4

.field private final static HOLD_MAX_MS:J = 500L

.field private final static NOW:Lcom/innioasis/ipp/Wheel$Now;

.field private final static PANEL_MS:I = 70

.field private final static RELEASE:Lcom/innioasis/ipp/Wheel$Release;

.field private final static REST:Lcom/innioasis/ipp/Wheel$Rest;

.field private final static STEP:Lcom/innioasis/ipp/Wheel$Step;

.field private final static UI:Landroid/os/Handler;

.field private final static WRAP_LIST_ROWS:I = 15

.field private final static WRAP_MAX_MS:I = 450

.field private final static WRAP_MS:I = 180

.field private final static WRAP_ROW_MS:I = 45

.field private static accelAt:J

.field private static accelLong:Z

.field private static accelV:F

.field private static accelWho:Ljava/lang/Object;

.field private static busy:Z

.field private final static gliding:Ljava/util/WeakHashMap;

.field private static heldRv:Ljava/lang/ref/WeakReference;

.field private static heldWrap:Z

.field private static jumping:Z

.field private static lastAdapter:Ljava/lang/ref/WeakReference;

.field private static lastPos:I

.field private static lastRv:Ljava/lang/ref/WeakReference;

.field private final static level:Ljava/util/WeakHashMap;

.field private static painted:Ljava/lang/String;

.field private static painting:Z

.field private static panelAt:J

.field private static panelHost:Ljava/lang/ref/WeakReference;

.field private static panelTitle:Ljava/lang/String;

.field private static releasing:Z

.field private static restPos:I

.field private static restRv:Ljava/lang/ref/WeakReference;

.field static stepAt:J

.field private static stepFrom:I

.field private static stepOn:Z

.field private static stepRv:Ljava/lang/ref/WeakReference;

.field private static stickyWrap:Z

.field private static tuned:Ljava/lang/ref/WeakReference;

.field private static tunedLm:Ljava/lang/ref/WeakReference;

.field private static wrapping:Z

.method static constructor <clinit>()V
  .registers 2
  .line 119
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 129
    sput v0, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 131
    new-instance v0, Lcom/innioasis/ipp/Wheel$Rest;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Rest;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
  .line 132
    new-instance v0, Lcom/innioasis/ipp/Wheel$Now;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Now;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->NOW:Lcom/innioasis/ipp/Wheel$Now;
  .line 358
    new-instance v0, Lcom/innioasis/ipp/Wheel$Step;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Step;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->STEP:Lcom/innioasis/ipp/Wheel$Step;
  .line 600
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->UI:Landroid/os/Handler;
  .line 601
    new-instance v0, Lcom/innioasis/ipp/Wheel$Release;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Release;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->RELEASE:Lcom/innioasis/ipp/Wheel$Release;
  .line 642
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
  .line 922
    new-instance v0, Ljava/io/File;
    const-string v1, "/data/local/tmp/ippbar"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->DBG:Z
  .line 960
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()J
  .registers 2
  .line 22
    sget-wide v0, Lcom/innioasis/ipp/Wheel;->panelAt:J
    return-wide v0
.end method

.method static synthetic access$1000()Z
  .registers 1
  .line 22
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->heldWrap:Z
    return v0
.end method

.method static synthetic access$1002(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->heldWrap:Z
    return p0
.end method

.method static synthetic access$102(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->busy:Z
    return p0
.end method

.method static synthetic access$1102(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->releasing:Z
    return p0
.end method

.method static synthetic access$1200(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 2
  .line 22
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
    return-void
.end method

.method static synthetic access$1300(Landroid/view/View;Z)I
  .registers 2
  .line 22
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p0
    return p0
.end method

.method static synthetic access$202(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 22
    sput-object p0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$300()Landroid/os/Handler;
  .registers 1
  .line 22
    sget-object v0, Lcom/innioasis/ipp/Wheel;->UI:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$400()Z
  .registers 1
  .line 22
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
    return v0
.end method

.method static synthetic access$402(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
    return p0
.end method

.method static synthetic access$500()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 22
    sget-object v0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$502(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 22
    sput-object p0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$600()I
  .registers 1
  .line 22
    sget v0, Lcom/innioasis/ipp/Wheel;->stepFrom:I
    return v0
.end method

.method static synthetic access$700(Landroid/view/View;Z)I
  .registers 2
  .line 22
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p0
    return p0
.end method

.method static synthetic access$800()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 22
    sget-object v0, Lcom/innioasis/ipp/Wheel;->heldRv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$802(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 22
    sput-object p0, Lcom/innioasis/ipp/Wheel;->heldRv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$900()Z
  .registers 1
  .line 22
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    return v0
.end method

.method static synthetic access$902(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    return p0
.end method

.method static caller()Ljava/lang/String;
  .registers 5
  .line 934
    new-instance v0, Ljava/lang/Throwable;
    invoke-direct { v0 }, Ljava/lang/Throwable;-><init>()V
    invoke-virtual { v0 }, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;
    move-result-object v0
  .line 935
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 936
    const/4 v2, 2
  :L0
    array-length v3, v0
    if-ge v2, v3, :L1
    const/4 v3, 5
    if-ge v2, v3, :L1
    aget-object v3, v0, v2
    invoke-virtual { v3 }, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/16 v4, 58
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v3
    aget-object v4, v0, v2
    invoke-virtual { v4 }, Ljava/lang/StackTraceElement;->getLineNumber()I
    move-result v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    const/16 v4, 32
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    add-int/lit8 v2, v2, 1
    goto :L0
  :L1
  .line 937
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method static dbg(Ljava/lang/String;)V
  .registers 3
  .line 925
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "bardbg "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    const-string v0, "ipp"
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 926
    return-void
.end method

.method public static drop(Landroid/app/Activity;)Z
  .registers 1
  .line 73
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->busy(Landroid/app/Activity;)Z
    move-result p0
    if-nez p0, :L1
    invoke-static { }, Lcom/innioasis/ipp/Loop;->afterWrap()Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method static edge(Landroidx/recyclerview/widget/RecyclerView;)Ljava/lang/String;
  .registers 4
  .line 929
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v0
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 930
    if-nez v0, :L2
    const-string p0, "-"
    goto :L3
  :L2
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "first "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I
    move-result v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "@"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v0
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " pad "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L3
    return-object p0
.end method

.method private static end(Landroid/view/View;Z)I
  .registers 4
  .line 948
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
    move-result-object v0
  .line 949
    const/4 v1, 0
    if-eqz p1, :L2
    invoke-virtual { p0 }, Landroid/view/View;->getRight()I
    move-result p0
    if-nez v0, :L0
    goto :L1
  :L0
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
  :L1
    add-int/2addr p0, v1
    return p0
  :L2
  .line 950
    invoke-virtual { p0 }, Landroid/view/View;->getBottom()I
    move-result p0
    if-nez v0, :L3
    goto :L4
  :L3
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
  :L4
    add-int/2addr p0, v1
    return p0
.end method

.method public static extra(Ljava/lang/Object;)I
  .registers 8
  .line 98
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 99
    sget-wide v2, Lcom/innioasis/ipp/Wheel;->accelAt:J
    sub-long v2, v0, v2
  .line 100
    sget-object v4, Lcom/innioasis/ipp/Wheel;->accelWho:Ljava/lang/Object;
    if-ne p0, v4, :L0
    const-wide/16 v4, 250
    cmp-long v6, v2, v4
    if-lez v6, :L1
  :L0
    const/4 v4, 0
    sput v4, Lcom/innioasis/ipp/Wheel;->accelV:F
  :L1
  .line 101
    sput-object p0, Lcom/innioasis/ipp/Wheel;->accelWho:Ljava/lang/Object;
  .line 102
    sput-wide v0, Lcom/innioasis/ipp/Wheel;->accelAt:J
  .line 103
    const-wide/16 v0, 1
    invoke-static { v0, v1, v2, v3 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide v0
    long-to-float p0, v0
    const/high16 v0, 0x447A0000
    div-float/2addr v0, p0
    const/high16 p0, 0x42C80000
    invoke-static { p0, v0 }, Ljava/lang/Math;->min(FF)F
    move-result p0
  .line 104
    sget v0, Lcom/innioasis/ipp/Wheel;->accelV:F
    sub-float/2addr p0, v0
    const/high16 v1, 0x3E000000
    mul-float p0, p0, v1
    add-float/2addr v0, p0
    sput v0, Lcom/innioasis/ipp/Wheel;->accelV:F
  .line 105
    sget-boolean p0, Lcom/innioasis/ipp/Wheel;->accelLong:Z
    if-eqz p0, :L2
    const/high16 v1, 0x41200000
    goto :L3
  :L2
    const/high16 v1, 0x41400000
  :L3
    div-float/2addr v0, v1
  .line 106
    const/high16 v1, 0x3F800000
    const/4 v2, 0
    cmpg-float v1, v0, v1
    if-gtz v1, :L4
    return v2
  :L4
  .line 107
    if-eqz p0, :L5
    const/4 p0, 6
    goto :L6
  :L5
    const/4 p0, 2
  :L6
  .line 108
    mul-float v1, v0, v0
    mul-float v1, v1, v0
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v0
    invoke-static { p0, v0 }, Ljava/lang/Math;->min(II)I
    move-result p0
    add-int/lit8 p0, p0, -1
    invoke-static { v2, p0 }, Ljava/lang/Math;->max(II)I
    move-result p0
    return p0
.end method

.method public static fast(Lcom/innioasis/y1/base/BaseActivity;)Z
  .registers 1
  .line 30
    const/4 p0, 0
    return p0
.end method

.method static flushRows()V
  .registers 4
  .line 371
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 372
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Wheel;->STEP:Lcom/innioasis/ipp/Wheel$Step;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 373
    const-wide/16 v2, 0
    invoke-virtual { v1, v2, v3 }, Lcom/innioasis/ipp/Wheel$Step;->doFrame(J)V
  .line 374
    return-void
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .registers 5
  .line 252
    if-nez p0, :L0
    return-void
  :L0
  .line 253
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 254
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p3 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
  .line 255
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 256
    invoke-static { p0, p2, p3 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 257
    return-void
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .catchall { :L0 .. :L19 } :L20
  .registers 9
  .line 415
    if-nez p0, :L0
    return-void
  :L0
  .line 416
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Wheel;->stepAt:J
  .line 417
    sget v0, Lcom/innioasis/ipp/Wheel;->lastPos:I
    if-eq p1, v0, :L1
    invoke-static { }, Lcom/innioasis/ipp/Loop;->moved()V
  :L1
  .line 418
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->tune(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 421
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 423
    const/4 v0, 0
    if-eqz p2, :L17
  .line 424
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v1
  .line 426
    sget-object v2, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    const/4 v3, -1
    if-eqz v2, :L2
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-ne v2, p0, :L2
    sget-object v2, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L2
  .line 427
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-ne v2, p2, :L2
    sget v2, Lcom/innioasis/ipp/Wheel;->lastPos:I
    goto :L3
  :L2
    const/4 v2, -1
  :L3
  .line 429
    if-lt v2, v1, :L4
    goto :L5
  :L4
    move v3, v2
  :L5
  .line 432
    if-ltz v3, :L6
    invoke-static { p0, p2, v3, v1 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v2
    if-eqz v2, :L6
    invoke-static { p0, p2, p1, v1 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v2
    if-nez v2, :L7
  :L6
  .line 433
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L7
  .line 438
    add-int/lit8 v2, v1, -1
    const/4 v4, 1
    if-eq v3, v2, :L8
    if-gez v3, :L9
  :L8
    if-eqz p1, :L12
  :L9
    if-eqz v3, :L10
    if-gez v3, :L11
  :L10
    if-ne p1, v2, :L11
    goto :L12
  :L11
    const/4 v2, 0
    goto :L13
  :L12
    const/4 v2, 1
  :L13
  .line 440
    sget-boolean v5, Lcom/innioasis/ipp/Wheel;->stickyWrap:Z
    if-nez v5, :L15
    if-le v1, v4, :L14
    if-eqz v2, :L14
    if-ltz v3, :L15
    sub-int v1, p1, v3
  .line 441
    invoke-static { v1 }, Ljava/lang/Math;->abs(I)I
    move-result v1
    if-gt v1, v4, :L15
    invoke-static { }, Lcom/innioasis/ipp/Loop;->justWrapped()Z
    move-result v1
    if-eqz v1, :L14
    goto :L15
  :L14
    const/4 v4, 0
    goto :L16
  :L15
    nop
  :L16
    sput-boolean v4, Lcom/innioasis/ipp/Wheel;->wrapping:Z
  .line 442
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->stickyWrap:Z
  .line 443
    goto :L18
  :L17
  .line 444
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->wrapping:Z
  :L18
  .line 446
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 447
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object p2
    sput-object p2, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
  .line 448
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 450
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L19
  .line 452
    goto :L21
  :L20
  .line 451
    move-exception p0
  :L21
  .line 453
    return-void
.end method

.method private static glide(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
  .registers 10
  .line 657
    instance-of v0, p1, Landroidx/recyclerview/widget/GridLayoutManager;
    if-nez v0, :L0
    invoke-static { p0, p1, p2, p3, p4 }, Lcom/innioasis/ipp/Wheel;->glideList(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
    move-result p0
    return p0
  :L0
  .line 658
    sget-object v0, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    const/4 v1, 0
    if-eqz v0, :L14
    if-gez p3, :L1
    goto :L14
  :L1
  .line 659
    move-object v0, p1
    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanCount()I
    move-result v0
  .line 660
    const/4 v2, 1
    if-le p2, p4, :L2
    const/4 v3, 1
    goto :L3
  :L2
    const/4 v3, 0
  :L3
  .line 661
    if-eqz v3, :L4
    move v4, p4
    goto :L5
  :L4
    move v4, p3
  :L5
    invoke-virtual { p1, v4 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p1
  .line 662
    if-lez v0, :L13
    if-nez p1, :L6
    goto :L13
  :L6
  .line 663
    if-eqz v3, :L7
    div-int/2addr p2, v0
    div-int/2addr p4, v0
    sub-int/2addr p2, p4
    goto :L8
  :L7
    div-int/2addr p3, v0
    div-int/2addr p2, v0
    sub-int p2, p3, p2
  :L8
  .line 665
    sget-boolean p3, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-nez p3, :L12
    if-lt p2, v2, :L12
    const/4 p3, 4
    if-le p2, p3, :L9
    goto :L12
  :L9
  .line 666
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p3
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p4
    sub-int/2addr p3, p4
  .line 667
    if-eqz v3, :L10
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    mul-int p2, p2, p3
    add-int/2addr p1, p2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result p2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result p3
    sub-int/2addr p2, p3
    sub-int/2addr p1, p2
    goto :L11
  :L10
  .line 668
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p1
    mul-int p2, p2, p3
    sub-int/2addr p1, p2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result p2
    sub-int/2addr p1, p2
  :L11
  .line 669
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Wheel$Glider;->to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 670
    return v2
  :L12
  .line 665
    return v1
  :L13
  .line 662
    return v1
  :L14
  .line 658
    return v1
.end method

.method private static glideList(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
  .registers 14
  .line 680
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    const/4 v1, 0
    if-eqz v0, :L20
    if-ltz p3, :L20
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v0
    const/4 v2, 1
    if-ne v0, v2, :L20
    sget-object v0, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L0
    goto/16 :L20
  :L0
  .line 683
    if-le p2, p4, :L1
    const/4 v7, 1
    goto :L2
  :L1
    const/4 v7, 0
  :L2
  .line 684
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v0
  .line 685
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v4
    sub-int/2addr v3, v4
  .line 686
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v4
  .line 687
    if-eqz v7, :L3
    sub-int v5, p2, p4
    goto :L4
  :L3
    sub-int v5, p3, p2
  :L4
  .line 688
    if-lt v5, v2, :L19
    sget-boolean v6, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-eqz v6, :L5
    const/16 v6, 15
    goto :L6
  :L5
    const/4 v6, 4
  :L6
    if-le v5, v6, :L7
    goto :L19
  :L7
  .line 690
    if-eqz v4, :L10
  .line 691
    invoke-static { v4, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    invoke-static { v4, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p3
    sub-int/2addr p1, p3
  .line 692
    if-eqz v7, :L8
    invoke-static { v4, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p3
    sub-int/2addr p3, v3
    goto :L9
  :L8
    invoke-static { v4, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p3
    sub-int/2addr p3, v0
  :L9
    move v8, p1
    move v4, p3
    goto :L15
  :L10
  .line 694
    if-eqz v7, :L11
    move p3, p4
  :L11
    invoke-virtual { p1, p3 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p1
  .line 695
    if-nez p1, :L12
    return v1
  :L12
  .line 696
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p3
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p4
    sub-int/2addr p3, p4
  .line 697
    if-eqz v7, :L13
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    mul-int p4, v5, p3
    add-int/2addr p1, p4
    sub-int/2addr p1, v3
    goto :L14
  :L13
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p1
    mul-int p4, v5, p3
    sub-int/2addr p1, p4
    sub-int/2addr p1, v0
  :L14
    move v4, p1
    move v8, p3
  :L15
  .line 699
    if-nez v4, :L16
    return v2
  :L16
  .line 700
    sget-boolean p1, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-eqz p1, :L17
    mul-int/lit8 v5, v5, 45
    add-int/lit16 v5, v5, 180
    const/16 p1, 450
    invoke-static { p1, v5 }, Ljava/lang/Math;->min(II)I
    move-result v1
    move v5, v1
    goto :L18
  :L17
    const/4 v5, 0
  :L18
    move-object v3, p0
    move v6, p2
    invoke-static/range { v3 .. v8 }, Lcom/innioasis/ipp/Wheel;->listGlide(Landroidx/recyclerview/widget/RecyclerView;IIIZI)V
  .line 701
    return v2
  :L19
  .line 688
    return v1
  :L20
  .line 681
    return v1
.end method

.method public static glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .registers 3
  .line 646
    if-nez p0, :L0
    return-void
  :L0
  .line 647
    if-eqz p1, :L1
    sget-object p1, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p1, p0, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L2
  :L1
  .line 648
    sget-object p1, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { p1, p0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 649
    return-void
.end method

.method public static gotoLevel(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 7
  .line 975
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 976
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->set(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/ListAdapter;)V
  .line 977
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
  .line 978
    sget-object v1, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p1 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 979
    instance-of v2, v1, [I
    if-eqz v2, :L1
    check-cast v1, [I
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 980
    if-eqz v1, :L3
    const/4 v2, 0
    aget v3, v1, v2
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v4
    neg-int v4, v4
    if-lt v3, v4, :L3
    aget v3, v1, v2
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result p1
    if-ge v3, p1, :L3
    const/4 p1, 2
    aget p1, v1, p1
    if-ne p1, v0, :L3
  .line 981
    aget p1, v1, v2
    const/4 v0, 1
    aget v0, v1, v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
    goto :L4
  :L3
  .line 983
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/SongRows;->select(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L4
  .line 985
    return-void
  :L5
  .line 975
    return-void
.end method

.method static held(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 2
  .line 611
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Wheel;->heldRv:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static hold(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 4
  .line 604
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->held(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    if-eqz v0, :L0
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->heldWrap:Z
    if-nez v0, :L1
  :L0
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-eqz v0, :L2
  :L1
    const/4 v0, 1
    goto :L3
  :L2
    const/4 v0, 0
  :L3
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->heldWrap:Z
  .line 605
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->heldRv:Ljava/lang/ref/WeakReference;
  .line 606
    sget-object p0, Lcom/innioasis/ipp/Wheel;->UI:Landroid/os/Handler;
    sget-object v0, Lcom/innioasis/ipp/Wheel;->RELEASE:Lcom/innioasis/ipp/Wheel$Release;
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 607
    const-wide/16 v1, 500
    invoke-virtual { p0, v0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 608
    return-void
.end method

.method static jumpNow(Landroidx/recyclerview/widget/RecyclerView;I)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 578
    const/4 v0, 0
    if-eqz p0, :L5
  :L0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v1
    if-nez v1, :L1
    goto :L5
  :L1
  .line 579
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 580
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->releasing:Z
  .line 581
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->jumping:Z
  .line 582
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L2
    goto :L4
  :L3
  .line 583
    move-exception p0
  :L4
  .line 585
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->releasing:Z
  .line 586
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->jumping:Z
  .line 587
    nop
  .line 588
    return-void
  :L5
  .line 585
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->releasing:Z
  .line 586
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->jumping:Z
  .line 578
    return-void
.end method

.method private static listGlide(Landroidx/recyclerview/widget/RecyclerView;IIIZI)V
  .registers 7
  .line 710
    div-int/lit8 p5, p5, 2
  .line 711
    if-nez p2, :L2
    if-lez p5, :L2
    invoke-static { p1 }, Ljava/lang/Math;->abs(I)I
    move-result v0
    if-le v0, p5, :L2
  .line 712
    if-lez p1, :L0
    sub-int p5, p1, p5
    goto :L1
  :L0
    add-int/2addr p5, p1
  :L1
  .line 713
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 714
    const/4 v0, 0
    invoke-virtual { p0, v0, p5 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 715
    sub-int/2addr p1, p5
  :L2
  .line 717
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Wheel$Glider;->to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 718
    invoke-static { p3, p4 }, Lcom/innioasis/ipp/Wheel$Glider;->aim(IZ)V
  .line 719
    return-void
.end method

.method private static longList(Lcom/innioasis/y1/base/BaseActivity;)Z
  .registers 2
  .line 51
    instance-of v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/SongListActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/AlbumsActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/ArtistsActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/GenresActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/FilesActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/PlaylistsActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/PlayListActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/SearchActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SearchVideoActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/PlayerActivity;
    if-nez v0, :L1
    instance-of p0, p0, Lcom/innioasis/y1/activity/BookMarkActivity;
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method private static margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
  .registers 2
  .line 954
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p0
  .line 955
    instance-of v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v0, :L0
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return-object p0
.end method

.method public static noteLevel(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L2 } :L4
  .registers 6
  :L0
  .line 965
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 966
    if-eqz v0, :L3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-nez v1, :L1
    goto :L3
  :L1
  .line 967
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 968
    sget-object v3, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    const/4 v4, 3
    new-array v4, v4, [I
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->first(Landroid/view/View;)I
    move-result p0
    aput p0, v4, v1
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result p0
    const/4 v1, 1
    aput p0, v4, v1
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p0
    const/4 v1, 2
    aput p0, v4, v1
    invoke-virtual { v3, v0, v4 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 970
    goto :L5
  :L3
  .line 966
    return-void
  :L4
  .line 969
    move-exception p0
  :L5
  .line 971
    return-void
.end method

.method private static paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 461
    const/4 v0, 0
    if-ltz p2, :L6
    if-lt p2, p3, :L0
    goto :L6
  :L0
  .line 462
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p3
  .line 463
    instance-of v1, p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L1
    return v0
  :L1
  .line 464
    check-cast p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { p3, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p3
  .line 466
    const/4 v1, 1
    if-nez p3, :L2
    return v1
  :L2
  .line 467
    invoke-virtual { p0, p3 }, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object p0
  .line 468
    if-nez p0, :L3
    return v0
  :L3
  .line 469
    invoke-virtual { p1, p0, p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->bindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  :L4
  .line 470
    return v1
  :L5
  .line 471
    move-exception p0
  .line 472
    return v0
  :L6
  .line 461
    return v0
.end method

.method static paintPanel()V
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  .line 196
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Wheel;->panelAt:J
  .line 197
    invoke-static { }, Lcom/innioasis/ipp/Eq;->paint()V
  .line 198
    sget-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 199
    instance-of v2, v0, Lcom/innioasis/y1/activity/SettingActivity;
    if-eqz v2, :L2
    move-object v3, v0
    check-cast v3, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-static { v3 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v3
    if-eqz v3, :L2
    return-void
  :L2
  .line 200
    sget-object v3, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 201
    sput-object v1, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 202
    sput-object v1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 203
    if-eqz v2, :L7
    if-eqz v3, :L7
  .line 204
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->painting:Z
  .line 206
    const/4 v1, 0
  :L3
    sput-object v3, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 207
    check-cast v0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { v0, v3 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  :L4
    goto :L6
  :L5
  .line 208
    move-exception v0
  :L6
  .line 210
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->painting:Z
  .line 211
    nop
  :L7
  .line 213
    return-void
.end method

.method static panelAtRest()Z
  .registers 1
  .line 186
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->busy:Z
    xor-int/lit8 v0, v0, 1
    return v0
.end method

.method public static panelShows(Ljava/lang/String;)Z
  .registers 2
  .line 191
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static panelUpdate(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 4
  .line 168
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
  .line 169
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 170
    sput-object p1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 171
    return v1
  :L0
  .line 173
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->busy:Z
    if-eqz v0, :L2
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->painting:Z
    if-eqz v0, :L1
    goto :L2
  :L1
  .line 177
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 178
    sput-object p1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 179
    return v1
  :L2
  .line 174
    sput-object p1, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 175
    const/4 p0, 0
    return p0
.end method

.method private static postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 4
  .line 149
    sget-object v0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
  .line 150
    sput p1, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 151
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Wheel;->busy:Z
  .line 152
    sget-object p1, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 153
    const-wide/16 v0, 70
    invoke-virtual { p0, p1, v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 154
    sget-object p1, Lcom/innioasis/ipp/Wheel;->NOW:Lcom/innioasis/ipp/Wheel$Now;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 155
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  .line 156
    return-void
.end method

.method public static refollow(Landroidx/recyclerview/widget/RecyclerView$Adapter;I)Z
  .registers 4
  .line 238
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  :L1
  .line 239
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, p0, :L2
    goto :L3
  :L2
  .line 240
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->stickyWrap:Z
  .line 241
    invoke-static { v0, p1, p0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 242
    const/4 p0, 1
    return p0
  :L3
  .line 239
    const/4 p0, 0
    return p0
.end method

.method static releaseSoon(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 616
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->held(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p0
    if-nez p0, :L0
    return-void
  :L0
  .line 617
    sget-object p0, Lcom/innioasis/ipp/Wheel;->UI:Landroid/os/Handler;
    sget-object v0, Lcom/innioasis/ipp/Wheel;->RELEASE:Lcom/innioasis/ipp/Wheel$Release;
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 618
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 619
    return-void
.end method

.method public static restart(Ljava/lang/Object;)V
  .registers 3
  .line 113
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel;->accelV:F
  .line 114
    sput-object p0, Lcom/innioasis/ipp/Wheel;->accelWho:Ljava/lang/Object;
  .line 115
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Wheel;->accelAt:J
  .line 116
    return-void
.end method

.method private static retarget(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;I)Z
  .registers 14
  .line 726
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v0
  .line 727
    const/4 v1, 0
    const/4 v2, 0
    cmpl-float v1, v0, v1
    if-eqz v1, :L8
    instance-of v1, p1, Landroidx/recyclerview/widget/GridLayoutManager;
    if-eqz v1, :L0
    goto :L8
  :L0
  .line 728
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p1
  .line 729
    if-nez p1, :L1
    return v2
  :L1
  .line 730
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v1
  .line 731
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v4
    sub-int/2addr v3, v4
  .line 732
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 733
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result v4
    sub-int/2addr v4, v0
  .line 734
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    sub-int/2addr p1, v0
  .line 735
    if-le p1, v3, :L2
    sub-int v1, p1, v3
    goto :L4
  :L2
    if-ge v4, v1, :L3
    sub-int v1, v4, v1
    goto :L4
  :L3
    const/4 v1, 0
  :L4
  .line 736
    const/4 v3, 1
    if-eqz v1, :L7
    add-int v6, v0, v1
    const/4 v7, 0
    if-lez v1, :L5
    const/4 v9, 1
    goto :L6
  :L5
    const/4 v9, 0
  :L6
    sub-int v10, p1, v4
    move-object v5, p0
    move v8, p2
    invoke-static/range { v5 .. v10 }, Lcom/innioasis/ipp/Wheel;->listGlide(Landroidx/recyclerview/widget/RecyclerView;IIIZI)V
  :L7
  .line 737
    return v3
  :L8
  .line 727
    return v2
.end method

.method public static rows(Landroidx/recyclerview/widget/RecyclerView;I)V
  .catchall { :L0 .. :L13 } :L14
  .registers 9
  :L0
  .line 266
    invoke-static { }, Lcom/innioasis/ipp/Loop;->afterWrap()Z
    move-result v0
    if-eqz v0, :L1
    return-void
  :L1
  .line 267
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 268
    if-nez v0, :L2
    return-void
  :L2
  .line 269
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->model()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v1
  .line 270
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Follow;->touched(Landroid/view/View;Ljava/lang/Object;)V
  .line 271
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 272
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v4
  .line 273
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Alpha;->step(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
    move-result v5
    if-eqz v5, :L4
  .line 274
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
  .line 275
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p1
    if-eq p1, v4, :L3
  .line 276
    sget-boolean p1, Lcom/innioasis/ipp/Wheel;->DBG:Z
    if-eqz p1, :L3
  .line 277
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v0, "alpha step "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    sub-long v0, v5, v2
    invoke-virtual { p1, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, " ms"
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
  .line 278
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    new-instance v0, Lcom/innioasis/ipp/Wheel$AlphaDbg;
    invoke-direct { v0, v5, v6, p0 }, Lcom/innioasis/ipp/Wheel$AlphaDbg;-><init>(JLandroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { p1, v0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L3
  .line 281
    return-void
  :L4
  .line 283
    invoke-static { p0 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 285
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Bar;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v2
    if-eqz v2, :L5
    return-void
  :L5
  .line 286
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->cursor()I
    move-result v0
  .line 287
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v2
  .line 288
    const/4 v3, 1
    if-ne p1, v3, :L6
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v4
    sub-int/2addr v4, v3
    if-lt v2, v4, :L9
    goto :L7
  :L6
    if-gtz v2, :L9
  :L7
  .line 290
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->flushRows()V
  .line 291
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Loop;->fromShuffle(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
    move-result v4
    if-eqz v4, :L8
    return-void
  :L8
  .line 293
    if-gez v2, :L9
    return-void
  :L9
  .line 295
    if-ne p1, v3, :L10
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toNext()V
    goto :L11
  :L10
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toPrevious()V
  :L11
  .line 296
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    if-ne v3, v2, :L12
  .line 297
    invoke-static { p0, v1, p1, v2 }, Lcom/innioasis/ipp/Loop;->list(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)Z
  .line 298
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p0
    sput-wide p0, Lcom/innioasis/ipp/Wheel;->stepAt:J
  .line 299
    return-void
  :L12
  .line 301
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Wheel;->stepAt:J
  .line 302
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Wheel;->stepRows(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L13
  .line 304
    goto :L15
  :L14
  .line 303
    move-exception p0
  :L15
  .line 305
    return-void
.end method

.method private static same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
  .registers 3
  .line 145
    if-eqz p0, :L0
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p1, :L0
    goto :L1
  :L0
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L1
    return-object p0
.end method

.method private static scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 10
  .line 482
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 483
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L0
  .line 484
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  .line 485
    return-void
  :L0
  .line 487
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 488
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->DBG:Z
    if-eqz v1, :L1
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "to "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " wrap "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    sget-boolean v2, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " jump "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    sget-boolean v2, Lcom/innioasis/ipp/Wheel;->jumping:Z
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " rel "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    sget-boolean v2, Lcom/innioasis/ipp/Wheel;->releasing:Z
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " left "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->edge(Landroidx/recyclerview/widget/RecyclerView;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
  :L1
  .line 490
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->releasing:Z
    if-nez v1, :L2
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-eqz v1, :L2
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Bar;->defer(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v1
    if-eqz v1, :L2
    return-void
  :L2
  .line 491
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->jumping:Z
    if-nez v1, :L3
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Wheel;->retarget(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;I)Z
    move-result v1
    if-eqz v1, :L3
    return-void
  :L3
  .line 492
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I
    move-result v1
  .line 493
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I
    move-result v2
  .line 494
    const/4 v3, 0
    if-ltz v1, :L7
    if-lt p1, v1, :L7
    if-gt p1, v2, :L7
  .line 496
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v4
    if-nez v4, :L4
    const/4 v4, 0
    goto :L5
  :L4
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v4
  :L5
  .line 497
    if-eqz v4, :L6
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result v4
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v5
    if-lt v4, v5, :L7
  :L6
    return-void
  :L7
  .line 499
    sget-boolean v4, Lcom/innioasis/ipp/Wheel;->releasing:Z
    if-nez v4, :L8
    sget-object v4, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { v4, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    if-eqz v4, :L8
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/PlGrid;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v4
    if-eqz v4, :L8
  .line 500
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->hold(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 501
    return-void
  :L8
  .line 503
    sget-boolean v4, Lcom/innioasis/ipp/Wheel;->jumping:Z
    if-nez v4, :L9
    invoke-static { p0, v0, p1, v1, v2 }, Lcom/innioasis/ipp/Wheel;->glide(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
    move-result v4
    if-eqz v4, :L9
    return-void
  :L9
  .line 504
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 505
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 507
    const/4 v4, 1
    if-ltz v1, :L11
    if-le p1, v2, :L10
    goto :L11
  :L10
    const/4 v1, 0
    goto :L12
  :L11
    const/4 v1, 1
  :L12
  .line 509
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v2
    if-nez v2, :L13
    goto :L14
  :L13
    const/4 v4, 0
  :L14
  .line 510
    if-eqz v4, :L15
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingLeft()I
    move-result v2
    goto :L16
  :L15
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v2
  :L16
  .line 511
    if-eqz v4, :L17
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingRight()I
    move-result v6
    sub-int/2addr v5, v6
    goto :L18
  :L17
  .line 512
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v6
    sub-int/2addr v5, v6
  :L18
  .line 513
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v6
  .line 514
    if-eqz v6, :L23
  .line 516
    if-eqz v1, :L19
    invoke-static { v6, v4 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    sub-int/2addr p1, v5
    goto :L20
  :L19
    invoke-static { v6, v4 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p1
    sub-int/2addr p1, v2
  :L20
  .line 517
    if-eqz p1, :L22
  .line 518
    if-eqz v4, :L21
    invoke-virtual { p0, p1, v3 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
    goto :L22
  :L21
    invoke-virtual { p0, v3, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  :L22
  .line 520
    return-void
  :L23
  .line 522
    invoke-virtual { v0, v3 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 523
    if-nez v6, :L24
    const/4 v7, 0
    goto :L25
  :L24
    invoke-static { v6, v4 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result v7
    invoke-static { v6, v4 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result v6
    sub-int/2addr v7, v6
  :L25
  .line 524
    if-lez v7, :L27
    if-le v5, v2, :L27
  .line 525
    if-eqz v1, :L26
    sub-int v2, v5, v2
    sub-int v3, v2, v7
  :L26
    invoke-virtual { v0, p1, v3 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V
    goto :L28
  :L27
  .line 527
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  :L28
  .line 530
    invoke-static { p0 }, Lcom/innioasis/ipp/Fixed;->layNow(Landroid/view/View;)V
  .line 532
    if-eqz v1, :L29
    if-nez v4, :L29
    invoke-static { p0, p1, v5 }, Lcom/innioasis/ipp/Wheel$Settle;->at(Landroidx/recyclerview/widget/RecyclerView;II)V
  :L29
  .line 533
    return-void
.end method

.method private static shortMenu(Lcom/innioasis/y1/base/BaseActivity;)Z
  .registers 2
  .line 39
    instance-of v0, p0, Lcom/innioasis/y1/activity/MainActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/MusicMainActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/SettingActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/IppActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/EbookActivity;
    if-nez v0, :L1
    instance-of p0, p0, Lcom/innioasis/fm/MenuActivity;
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method private static start(Landroid/view/View;Z)I
  .registers 4
  .line 942
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
    move-result-object v0
  .line 943
    const/4 v1, 0
    if-eqz p1, :L2
    invoke-virtual { p0 }, Landroid/view/View;->getLeft()I
    move-result p0
    if-nez v0, :L0
    goto :L1
  :L0
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  :L1
    sub-int/2addr p0, v1
    return p0
  :L2
  .line 944
    invoke-virtual { p0 }, Landroid/view/View;->getTop()I
    move-result p0
    if-nez v0, :L3
    goto :L4
  :L3
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  :L4
    sub-int/2addr p0, v1
    return p0
.end method

.method private static stepRows(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 361
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p0, :L0
    return-void
  :L0
  .line 362
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->flushRows()V
  .line 363
    sget-object v0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object p0
    sput-object p0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
  .line 364
    sput p1, Lcom/innioasis/ipp/Wheel;->stepFrom:I
  .line 365
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
  .line 366
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel;->STEP:Lcom/innioasis/ipp/Wheel$Step;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 367
    return-void
.end method

.method static tune(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 393
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 394
    sget-object v1, Lcom/innioasis/ipp/Wheel;->tuned:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L0
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, p0, :L0
    sget-object v1, Lcom/innioasis/ipp/Wheel;->tunedLm:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L0
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, v0, :L0
    return-void
  :L0
  .line 395
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->tuned:Ljava/lang/ref/WeakReference;
  .line 396
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->tunedLm:Ljava/lang/ref/WeakReference;
  .line 397
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V
  .line 401
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemViewCacheSize(I)V
  .line 404
    if-eqz v0, :L1
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->setItemPrefetchEnabled(Z)V
  :L1
  .line 408
    const/high16 v0, 0x00060000
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setDescendantFocusability(I)V
  .line 409
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->findFocus()Landroid/view/View;
    move-result-object v0
  .line 410
    if-eqz v0, :L2
    if-eq v0, p0, :L2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->requestFocus()Z
  :L2
  .line 411
    return-void
.end method

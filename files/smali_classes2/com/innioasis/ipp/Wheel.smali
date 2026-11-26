.class public final Lcom/innioasis/ipp/Wheel;
.super Ljava/lang/Object;
.source "Wheel.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Wheel$Rest;,
    Lcom/innioasis/ipp/Wheel$Now;,
    Lcom/innioasis/ipp/Wheel$Step;,
    Lcom/innioasis/ipp/Wheel$Glider;,
    Lcom/innioasis/ipp/Wheel$Settle;,
    Lcom/innioasis/ipp/Wheel$Release;
  }
.end annotation

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
  .line 60
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 70
    sput v0, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 72
    new-instance v0, Lcom/innioasis/ipp/Wheel$Rest;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Rest;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
  .line 73
    new-instance v0, Lcom/innioasis/ipp/Wheel$Now;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Now;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->NOW:Lcom/innioasis/ipp/Wheel$Now;
  .line 245
    new-instance v0, Lcom/innioasis/ipp/Wheel$Step;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Step;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->STEP:Lcom/innioasis/ipp/Wheel$Step;
  .line 486
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->UI:Landroid/os/Handler;
  .line 487
    new-instance v0, Lcom/innioasis/ipp/Wheel$Release;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Release;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->RELEASE:Lcom/innioasis/ipp/Wheel$Release;
  .line 528
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
  .line 808
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

.method static synthetic access$1002(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->releasing:Z
    return p0
.end method

.method static synthetic access$102(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->busy:Z
    return p0
.end method

.method static synthetic access$1100(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 2
  .line 22
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
    return-void
.end method

.method static synthetic access$1200(Landroid/view/View;Z)I
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

.method static synthetic access$300()Z
  .registers 1
  .line 22
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
    return v0
.end method

.method static synthetic access$302(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
    return p0
.end method

.method static synthetic access$400()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 22
    sget-object v0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$402(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 22
    sput-object p0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$500()I
  .registers 1
  .line 22
    sget v0, Lcom/innioasis/ipp/Wheel;->stepFrom:I
    return v0
.end method

.method static synthetic access$600(Landroid/view/View;Z)I
  .registers 2
  .line 22
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p0
    return p0
.end method

.method static synthetic access$700()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 22
    sget-object v0, Lcom/innioasis/ipp/Wheel;->heldRv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$702(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 22
    sput-object p0, Lcom/innioasis/ipp/Wheel;->heldRv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$800()Z
  .registers 1
  .line 22
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    return v0
.end method

.method static synthetic access$802(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    return p0
.end method

.method static synthetic access$900()Z
  .registers 1
  .line 22
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->heldWrap:Z
    return v0
.end method

.method static synthetic access$902(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->heldWrap:Z
    return p0
.end method

.method public static drop(Landroid/app/Activity;)Z
  .registers 1
  .line 56
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

.method private static end(Landroid/view/View;Z)I
  .registers 4
  .line 796
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
    move-result-object v0
  .line 797
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
  .line 798
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

.method public static fast(Lcom/innioasis/y1/base/BaseActivity;)Z
  .registers 2
  .line 31
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->longList(Lcom/innioasis/y1/base/BaseActivity;)Z
    move-result v0
    if-eqz v0, :L0
    const-string v0, "alpha_scroll"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method static flushRows()V
  .registers 4
  .line 258
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 259
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Wheel;->STEP:Lcom/innioasis/ipp/Wheel$Step;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 260
    const-wide/16 v2, 0
    invoke-virtual { v1, v2, v3 }, Lcom/innioasis/ipp/Wheel$Step;->doFrame(J)V
  .line 261
    return-void
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .registers 5
  .line 193
    if-nez p0, :L0
    return-void
  :L0
  .line 194
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 195
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p3 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
  .line 196
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 197
    invoke-static { p0, p2, p3 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 198
    return-void
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .catchall { :L0 .. :L19 } :L20
  .registers 9
  .line 302
    if-nez p0, :L0
    return-void
  :L0
  .line 303
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Wheel;->stepAt:J
  .line 304
    sget v0, Lcom/innioasis/ipp/Wheel;->lastPos:I
    if-eq p1, v0, :L1
    invoke-static { }, Lcom/innioasis/ipp/Loop;->moved()V
  :L1
  .line 305
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->tune(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 308
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 310
    const/4 v0, 0
    if-eqz p2, :L17
  .line 311
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v1
  .line 313
    sget-object v2, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    const/4 v3, -1
    if-eqz v2, :L2
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-ne v2, p0, :L2
    sget-object v2, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L2
  .line 314
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-ne v2, p2, :L2
    sget v2, Lcom/innioasis/ipp/Wheel;->lastPos:I
    goto :L3
  :L2
    const/4 v2, -1
  :L3
  .line 316
    if-lt v2, v1, :L4
    goto :L5
  :L4
    move v3, v2
  :L5
  .line 319
    if-ltz v3, :L6
    invoke-static { p0, p2, v3, v1 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v2
    if-eqz v2, :L6
    invoke-static { p0, p2, p1, v1 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v2
    if-nez v2, :L7
  :L6
  .line 320
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L7
  .line 325
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
  .line 327
    sget-boolean v5, Lcom/innioasis/ipp/Wheel;->stickyWrap:Z
    if-nez v5, :L15
    if-le v1, v4, :L14
    if-eqz v2, :L14
    if-ltz v3, :L15
    sub-int v1, p1, v3
  .line 328
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
  .line 329
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->stickyWrap:Z
  .line 330
    goto :L18
  :L17
  .line 331
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->wrapping:Z
  :L18
  .line 333
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 334
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object p2
    sput-object p2, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
  .line 335
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 337
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L19
  .line 339
    goto :L21
  :L20
  .line 338
    move-exception p0
  :L21
  .line 340
    return-void
.end method

.method private static glide(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
  .registers 10
  .line 547
    instance-of v0, p1, Landroidx/recyclerview/widget/GridLayoutManager;
    if-nez v0, :L0
    invoke-static { p0, p1, p2, p3, p4 }, Lcom/innioasis/ipp/Wheel;->glideList(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
    move-result p0
    return p0
  :L0
  .line 548
    sget-object v0, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    const/4 v1, 0
    if-eqz v0, :L14
    if-gez p3, :L1
    goto :L14
  :L1
  .line 549
    move-object v0, p1
    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanCount()I
    move-result v0
  .line 550
    const/4 v2, 1
    if-le p2, p4, :L2
    const/4 v3, 1
    goto :L3
  :L2
    const/4 v3, 0
  :L3
  .line 551
    if-eqz v3, :L4
    move v4, p4
    goto :L5
  :L4
    move v4, p3
  :L5
    invoke-virtual { p1, v4 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p1
  .line 552
    if-lez v0, :L13
    if-nez p1, :L6
    goto :L13
  :L6
  .line 553
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
  .line 555
    sget-boolean p3, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-nez p3, :L12
    if-lt p2, v2, :L12
    const/4 p3, 4
    if-le p2, p3, :L9
    goto :L12
  :L9
  .line 556
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p3
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p4
    sub-int/2addr p3, p4
  .line 557
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
  .line 558
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p1
    mul-int p2, p2, p3
    sub-int/2addr p1, p2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result p2
    sub-int/2addr p1, p2
  :L11
  .line 559
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Wheel$Glider;->to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 560
    return v2
  :L12
  .line 555
    return v1
  :L13
  .line 552
    return v1
  :L14
  .line 548
    return v1
.end method

.method private static glideList(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
  .registers 14
  .line 570
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
  .line 573
    if-le p2, p4, :L1
    const/4 v7, 1
    goto :L2
  :L1
    const/4 v7, 0
  :L2
  .line 574
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v0
  .line 575
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v4
    sub-int/2addr v3, v4
  .line 576
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v4
  .line 577
    if-eqz v7, :L3
    sub-int v5, p2, p4
    goto :L4
  :L3
    sub-int v5, p3, p2
  :L4
  .line 578
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
  .line 580
    if-eqz v4, :L10
  .line 581
    invoke-static { v4, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    invoke-static { v4, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p3
    sub-int/2addr p1, p3
  .line 582
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
  .line 584
    if-eqz v7, :L11
    move p3, p4
  :L11
    invoke-virtual { p1, p3 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p1
  .line 585
    if-nez p1, :L12
    return v1
  :L12
  .line 586
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p3
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p4
    sub-int/2addr p3, p4
  .line 587
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
  .line 589
    if-nez v4, :L16
    return v2
  :L16
  .line 590
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
  .line 591
    return v2
  :L19
  .line 578
    return v1
  :L20
  .line 571
    return v1
.end method

.method public static glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .registers 3
  .line 532
    if-nez p0, :L0
    return-void
  :L0
  .line 533
    if-eqz p1, :L1
  .line 534
    sget-object p1, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p1, p0, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L2
  :L1
  .line 536
    sget-object p1, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { p1, p0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 537
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result p0
    const/4 p1, 0
    cmpl-float p0, p0, p1
    if-eqz p0, :L2
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  :L2
  .line 539
    return-void
.end method

.method public static gotoLevel(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 7
  .line 823
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 824
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->set(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/ListAdapter;)V
  .line 825
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
  .line 826
    sget-object v1, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p1 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 827
    instance-of v2, v1, [I
    if-eqz v2, :L1
    check-cast v1, [I
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 828
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
  .line 829
    aget p1, v1, v2
    const/4 v0, 1
    aget v0, v1, v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
    goto :L4
  :L3
  .line 831
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/SongRows;->select(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L4
  .line 833
    return-void
  :L5
  .line 823
    return-void
.end method

.method static held(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 2
  .line 497
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
  .line 490
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
  .line 491
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->heldRv:Ljava/lang/ref/WeakReference;
  .line 492
    sget-object p0, Lcom/innioasis/ipp/Wheel;->UI:Landroid/os/Handler;
    sget-object v0, Lcom/innioasis/ipp/Wheel;->RELEASE:Lcom/innioasis/ipp/Wheel$Release;
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 493
    const-wide/16 v1, 500
    invoke-virtual { p0, v0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 494
    return-void
.end method

.method static jumpNow(Landroidx/recyclerview/widget/RecyclerView;I)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 464
    const/4 v0, 0
    if-eqz p0, :L5
  :L0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v1
    if-nez v1, :L1
    goto :L5
  :L1
  .line 465
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 466
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->releasing:Z
  .line 467
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->jumping:Z
  .line 468
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L2
    goto :L4
  :L3
  .line 469
    move-exception p0
  :L4
  .line 471
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->releasing:Z
  .line 472
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->jumping:Z
  .line 473
    nop
  .line 474
    return-void
  :L5
  .line 471
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->releasing:Z
  .line 472
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->jumping:Z
  .line 464
    return-void
.end method

.method private static listGlide(Landroidx/recyclerview/widget/RecyclerView;IIIZI)V
  .registers 7
  .line 600
    div-int/lit8 p5, p5, 2
  .line 601
    if-nez p2, :L2
    if-lez p5, :L2
    invoke-static { p1 }, Ljava/lang/Math;->abs(I)I
    move-result v0
    if-le v0, p5, :L2
  .line 602
    if-lez p1, :L0
    sub-int p5, p1, p5
    goto :L1
  :L0
    add-int/2addr p5, p1
  :L1
  .line 603
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 604
    const/4 v0, 0
    invoke-virtual { p0, v0, p5 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 605
    sub-int/2addr p1, p5
  :L2
  .line 607
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Wheel$Glider;->to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 608
    invoke-static { p3, p4 }, Lcom/innioasis/ipp/Wheel$Glider;->aim(IZ)V
  .line 609
    return-void
.end method

.method private static longList(Lcom/innioasis/y1/base/BaseActivity;)Z
  .registers 2
  .line 35
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
  .line 802
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p0
  .line 803
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
  .line 813
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 814
    if-eqz v0, :L3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-nez v1, :L1
    goto :L3
  :L1
  .line 815
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 816
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
  .line 818
    goto :L5
  :L3
  .line 814
    return-void
  :L4
  .line 817
    move-exception p0
  :L5
  .line 819
    return-void
.end method

.method private static paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 348
    const/4 v0, 0
    if-ltz p2, :L6
    if-lt p2, p3, :L0
    goto :L6
  :L0
  .line 349
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p3
  .line 350
    instance-of v1, p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L1
    return v0
  :L1
  .line 351
    check-cast p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { p3, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p3
  .line 353
    const/4 v1, 1
    if-nez p3, :L2
    return v1
  :L2
  .line 354
    invoke-virtual { p0, p3 }, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object p0
  .line 355
    if-nez p0, :L3
    return v0
  :L3
  .line 356
    invoke-virtual { p1, p0, p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->bindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  :L4
  .line 357
    return v1
  :L5
  .line 358
    move-exception p0
  .line 359
    return v0
  :L6
  .line 348
    return v0
.end method

.method static paintPanel()V
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  .line 137
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Wheel;->panelAt:J
  .line 138
    invoke-static { }, Lcom/innioasis/ipp/Eq;->paint()V
  .line 139
    sget-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 140
    instance-of v2, v0, Lcom/innioasis/y1/activity/SettingActivity;
    if-eqz v2, :L2
    move-object v3, v0
    check-cast v3, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-static { v3 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v3
    if-eqz v3, :L2
    return-void
  :L2
  .line 141
    sget-object v3, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 142
    sput-object v1, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 143
    sput-object v1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 144
    if-eqz v2, :L7
    if-eqz v3, :L7
  .line 145
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->painting:Z
  .line 147
    const/4 v1, 0
  :L3
    sput-object v3, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 148
    check-cast v0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { v0, v3 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  :L4
    goto :L6
  :L5
  .line 149
    move-exception v0
  :L6
  .line 151
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->painting:Z
  .line 152
    nop
  :L7
  .line 154
    return-void
.end method

.method static panelAtRest()Z
  .registers 1
  .line 127
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->busy:Z
    xor-int/lit8 v0, v0, 1
    return v0
.end method

.method public static panelShows(Ljava/lang/String;)Z
  .registers 2
  .line 132
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
  .line 109
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
  .line 110
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 111
    sput-object p1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 112
    return v1
  :L0
  .line 114
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->busy:Z
    if-eqz v0, :L2
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->painting:Z
    if-eqz v0, :L1
    goto :L2
  :L1
  .line 118
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 119
    sput-object p1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 120
    return v1
  :L2
  .line 115
    sput-object p1, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 116
    const/4 p0, 0
    return p0
.end method

.method private static postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 4
  .line 90
    sget-object v0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
  .line 91
    sput p1, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 92
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Wheel;->busy:Z
  .line 93
    sget-object p1, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 94
    const-wide/16 v0, 70
    invoke-virtual { p0, p1, v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 95
    sget-object p1, Lcom/innioasis/ipp/Wheel;->NOW:Lcom/innioasis/ipp/Wheel$Now;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 96
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  .line 97
    return-void
.end method

.method public static refollow(Landroidx/recyclerview/widget/RecyclerView$Adapter;I)Z
  .registers 4
  .line 179
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  :L1
  .line 180
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, p0, :L2
    goto :L3
  :L2
  .line 181
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->stickyWrap:Z
  .line 182
    invoke-static { v0, p1, p0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 183
    const/4 p0, 1
    return p0
  :L3
  .line 180
    const/4 p0, 0
    return p0
.end method

.method static releaseSoon(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 502
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->held(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p0
    if-nez p0, :L0
    return-void
  :L0
  .line 503
    sget-object p0, Lcom/innioasis/ipp/Wheel;->UI:Landroid/os/Handler;
    sget-object v0, Lcom/innioasis/ipp/Wheel;->RELEASE:Lcom/innioasis/ipp/Wheel$Release;
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 504
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 505
    return-void
.end method

.method private static retarget(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;I)Z
  .registers 14
  .line 616
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v0
  .line 617
    const/4 v1, 0
    const/4 v2, 0
    cmpl-float v1, v0, v1
    if-eqz v1, :L8
    instance-of v1, p1, Landroidx/recyclerview/widget/GridLayoutManager;
    if-eqz v1, :L0
    goto :L8
  :L0
  .line 618
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p1
  .line 619
    if-nez p1, :L1
    return v2
  :L1
  .line 620
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v1
  .line 621
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v4
    sub-int/2addr v3, v4
  .line 622
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 623
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result v4
    sub-int/2addr v4, v0
  .line 624
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    sub-int/2addr p1, v0
  .line 625
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
  .line 626
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
  .line 627
    return v3
  :L8
  .line 617
    return v2
.end method

.method public static rows(Landroidx/recyclerview/widget/RecyclerView;I)V
  .catchall { :L0 .. :L12 } :L13
  .registers 7
  :L0
  .line 207
    invoke-static { }, Lcom/innioasis/ipp/Loop;->afterWrap()Z
    move-result v0
    if-eqz v0, :L1
    return-void
  :L1
  .line 208
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 209
    if-nez v0, :L2
    return-void
  :L2
  .line 210
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->model()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v1
  .line 211
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Follow;->touched(Landroid/view/View;Ljava/lang/Object;)V
  .line 212
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Alpha;->step(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
    move-result v2
    if-eqz v2, :L3
    return-void
  :L3
  .line 213
    invoke-static { p0 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 215
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Bar;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v2
    if-eqz v2, :L4
    return-void
  :L4
  .line 216
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->cursor()I
    move-result v0
  .line 217
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v2
  .line 218
    const/4 v3, 1
    if-ne p1, v3, :L5
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v4
    sub-int/2addr v4, v3
    if-lt v2, v4, :L8
    goto :L6
  :L5
    if-gtz v2, :L8
  :L6
  .line 220
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->flushRows()V
  .line 221
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Loop;->fromShuffle(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
    move-result v4
    if-eqz v4, :L7
    return-void
  :L7
  .line 223
    if-gez v2, :L8
    return-void
  :L8
  .line 225
    if-ne p1, v3, :L9
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toNext()V
    goto :L10
  :L9
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toPrevious()V
  :L10
  .line 226
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    if-ne v3, v2, :L11
  .line 227
    invoke-static { p0, v1, p1, v2 }, Lcom/innioasis/ipp/Loop;->list(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)Z
  .line 228
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p0
    sput-wide p0, Lcom/innioasis/ipp/Wheel;->stepAt:J
  .line 229
    return-void
  :L11
  .line 231
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Wheel;->stepAt:J
  .line 233
    invoke-static { }, Lcom/innioasis/ipp/Loop;->moved()V
  .line 234
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Wheel;->stepRows(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L12
  .line 236
    goto :L14
  :L13
  .line 235
    move-exception p0
  :L14
  .line 237
    return-void
.end method

.method private static same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
  .registers 3
  .line 86
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
  .line 369
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 370
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L0
  .line 371
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  .line 372
    return-void
  :L0
  .line 374
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 376
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->releasing:Z
    if-nez v1, :L1
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-eqz v1, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Bar;->defer(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 377
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->jumping:Z
    if-nez v1, :L2
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Wheel;->retarget(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;I)Z
    move-result v1
    if-eqz v1, :L2
    return-void
  :L2
  .line 378
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I
    move-result v1
  .line 379
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I
    move-result v2
  .line 380
    const/4 v3, 0
    if-ltz v1, :L6
    if-lt p1, v1, :L6
    if-gt p1, v2, :L6
  .line 382
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v4
    if-nez v4, :L3
    const/4 v4, 0
    goto :L4
  :L3
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v4
  :L4
  .line 383
    if-eqz v4, :L5
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result v4
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v5
    if-lt v4, v5, :L6
  :L5
    return-void
  :L6
  .line 385
    sget-boolean v4, Lcom/innioasis/ipp/Wheel;->releasing:Z
    if-nez v4, :L7
    sget-object v4, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { v4, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    if-eqz v4, :L7
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/PlGrid;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v4
    if-eqz v4, :L7
  .line 386
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->hold(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 387
    return-void
  :L7
  .line 389
    sget-boolean v4, Lcom/innioasis/ipp/Wheel;->jumping:Z
    if-nez v4, :L8
    invoke-static { p0, v0, p1, v1, v2 }, Lcom/innioasis/ipp/Wheel;->glide(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
    move-result v4
    if-eqz v4, :L8
    return-void
  :L8
  .line 390
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 391
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 393
    const/4 v4, 1
    if-ltz v1, :L10
    if-le p1, v2, :L9
    goto :L10
  :L9
    const/4 v1, 0
    goto :L11
  :L10
    const/4 v1, 1
  :L11
  .line 395
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v2
    if-nez v2, :L12
    goto :L13
  :L12
    const/4 v4, 0
  :L13
  .line 396
    if-eqz v4, :L14
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingLeft()I
    move-result v2
    goto :L15
  :L14
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v2
  :L15
  .line 397
    if-eqz v4, :L16
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingRight()I
    move-result v6
    sub-int/2addr v5, v6
    goto :L17
  :L16
  .line 398
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v6
    sub-int/2addr v5, v6
  :L17
  .line 399
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v6
  .line 400
    if-eqz v6, :L22
  .line 402
    if-eqz v1, :L18
    invoke-static { v6, v4 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    sub-int/2addr p1, v5
    goto :L19
  :L18
    invoke-static { v6, v4 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p1
    sub-int/2addr p1, v2
  :L19
  .line 403
    if-eqz p1, :L21
  .line 404
    if-eqz v4, :L20
    invoke-virtual { p0, p1, v3 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
    goto :L21
  :L20
    invoke-virtual { p0, v3, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  :L21
  .line 406
    return-void
  :L22
  .line 408
    invoke-virtual { v0, v3 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 409
    if-nez v6, :L23
    const/4 v7, 0
    goto :L24
  :L23
    invoke-static { v6, v4 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result v7
    invoke-static { v6, v4 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result v6
    sub-int/2addr v7, v6
  :L24
  .line 410
    if-lez v7, :L26
    if-le v5, v2, :L26
  .line 411
    if-eqz v1, :L25
    sub-int v2, v5, v2
    sub-int v3, v2, v7
  :L25
    invoke-virtual { v0, p1, v3 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V
    goto :L27
  :L26
  .line 413
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  :L27
  .line 416
    invoke-static { p0 }, Lcom/innioasis/ipp/Fixed;->layNow(Landroid/view/View;)V
  .line 418
    if-eqz v1, :L28
    if-nez v4, :L28
    invoke-static { p0, p1, v5 }, Lcom/innioasis/ipp/Wheel$Settle;->at(Landroidx/recyclerview/widget/RecyclerView;II)V
  :L28
  .line 419
    return-void
.end method

.method private static start(Landroid/view/View;Z)I
  .registers 4
  .line 790
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
    move-result-object v0
  .line 791
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
  .line 792
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
  .line 248
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p0, :L0
    return-void
  :L0
  .line 249
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->flushRows()V
  .line 250
    sget-object v0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object p0
    sput-object p0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
  .line 251
    sput p1, Lcom/innioasis/ipp/Wheel;->stepFrom:I
  .line 252
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
  .line 253
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel;->STEP:Lcom/innioasis/ipp/Wheel$Step;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 254
    return-void
.end method

.method static tune(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 280
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 281
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
  .line 282
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->tuned:Ljava/lang/ref/WeakReference;
  .line 283
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->tunedLm:Ljava/lang/ref/WeakReference;
  .line 284
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V
  .line 288
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemViewCacheSize(I)V
  .line 291
    if-eqz v0, :L1
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->setItemPrefetchEnabled(Z)V
  :L1
  .line 295
    const/high16 v0, 0x00060000
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setDescendantFocusability(I)V
  .line 296
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->findFocus()Landroid/view/View;
    move-result-object v0
  .line 297
    if-eqz v0, :L2
    if-eq v0, p0, :L2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->requestFocus()Z
  :L2
  .line 298
    return-void
.end method

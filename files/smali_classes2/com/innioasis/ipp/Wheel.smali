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

.field private static stepFrom:I

.field private static stepOn:Z

.field private static stepRv:Ljava/lang/ref/WeakReference;

.field private static stickyWrap:Z

.field private static tuned:Ljava/lang/ref/WeakReference;

.field private static tunedLm:Ljava/lang/ref/WeakReference;

.field private static wrapping:Z

.method static constructor <clinit>()V
  .registers 2
  .line 45
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 55
    sput v0, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 57
    new-instance v0, Lcom/innioasis/ipp/Wheel$Rest;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Rest;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
  .line 58
    new-instance v0, Lcom/innioasis/ipp/Wheel$Now;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Now;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->NOW:Lcom/innioasis/ipp/Wheel$Now;
  .line 277
    new-instance v0, Lcom/innioasis/ipp/Wheel$Step;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Step;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->STEP:Lcom/innioasis/ipp/Wheel$Step;
  .line 515
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->UI:Landroid/os/Handler;
  .line 516
    new-instance v0, Lcom/innioasis/ipp/Wheel$Release;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Release;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->RELEASE:Lcom/innioasis/ipp/Wheel$Release;
  .line 557
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
  .line 828
    new-instance v0, Ljava/io/File;
    const-string v1, "/data/local/tmp/ippbar"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->DBG:Z
  .line 866
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
  .line 840
    new-instance v0, Ljava/lang/Throwable;
    invoke-direct { v0 }, Ljava/lang/Throwable;-><init>()V
    invoke-virtual { v0 }, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;
    move-result-object v0
  .line 841
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 842
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
  .line 843
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method static dbg(Ljava/lang/String;)V
  .registers 3
  .line 831
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
  .line 832
    return-void
.end method

.method static edge(Landroidx/recyclerview/widget/RecyclerView;)Ljava/lang/String;
  .registers 4
  .line 835
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
  .line 836
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
  .line 854
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
    move-result-object v0
  .line 855
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
  .line 856
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
  .line 29
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

.method static flushRows()V
  .registers 4
  .line 290
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 291
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/Wheel;->STEP:Lcom/innioasis/ipp/Wheel$Step;
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 292
    const-wide/16 v2, 0
    invoke-virtual { v1, v2, v3 }, Lcom/innioasis/ipp/Wheel$Step;->doFrame(J)V
  .line 293
    return-void
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .registers 5
  .line 175
    if-nez p0, :L0
    return-void
  :L0
  .line 176
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 177
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p3 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
  .line 178
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 179
    invoke-static { p0, p2, p3 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 180
    return-void
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .catchall { :L0 .. :L16 } :L17
  .registers 9
  .line 334
    if-nez p0, :L0
    return-void
  :L0
  .line 335
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->tune(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 338
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 340
    const/4 v0, 0
    if-eqz p2, :L14
  .line 341
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v1
  .line 343
    sget-object v2, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L1
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-ne v2, p0, :L1
    sget-object v2, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L1
  .line 344
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-ne v2, p2, :L1
    sget v2, Lcom/innioasis/ipp/Wheel;->lastPos:I
    goto :L2
  :L1
    const/4 v2, -1
  :L2
  .line 347
    if-ltz v2, :L3
    invoke-static { p0, p2, v2, v1 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v3
    if-eqz v3, :L3
    invoke-static { p0, p2, p1, v1 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v3
    if-nez v3, :L4
  :L3
  .line 348
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L4
  .line 353
    add-int/lit8 v3, v1, -1
    const/4 v4, 1
    if-eq v2, v3, :L5
    if-gez v2, :L6
  :L5
    if-eqz p1, :L9
  :L6
    if-eqz v2, :L7
    if-gez v2, :L8
  :L7
    if-ne p1, v3, :L8
    goto :L9
  :L8
    const/4 v3, 0
    goto :L10
  :L9
    const/4 v3, 1
  :L10
  .line 355
    sget-boolean v5, Lcom/innioasis/ipp/Wheel;->stickyWrap:Z
    if-nez v5, :L12
    if-le v1, v4, :L11
    if-eqz v3, :L11
    if-ltz v2, :L12
    sub-int v1, p1, v2
  .line 356
    invoke-static { v1 }, Ljava/lang/Math;->abs(I)I
    move-result v1
    if-gt v1, v4, :L12
    invoke-static { }, Lcom/innioasis/ipp/Loop;->justWrapped()Z
    move-result v1
    if-eqz v1, :L11
    goto :L12
  :L11
    const/4 v4, 0
    goto :L13
  :L12
    nop
  :L13
    sput-boolean v4, Lcom/innioasis/ipp/Wheel;->wrapping:Z
  .line 357
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->stickyWrap:Z
  .line 358
    goto :L15
  :L14
  .line 359
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->wrapping:Z
  :L15
  .line 361
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 362
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object p2
    sput-object p2, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
  .line 363
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 365
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L16
  .line 367
    goto :L18
  :L17
  .line 366
    move-exception p0
  :L18
  .line 368
    return-void
.end method

.method private static glide(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
  .registers 10
  .line 572
    instance-of v0, p1, Landroidx/recyclerview/widget/GridLayoutManager;
    if-nez v0, :L0
    invoke-static { p0, p1, p2, p3, p4 }, Lcom/innioasis/ipp/Wheel;->glideList(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
    move-result p0
    return p0
  :L0
  .line 573
    sget-object v0, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    const/4 v1, 0
    if-eqz v0, :L15
    if-gez p3, :L1
    goto/16 :L15
  :L1
  .line 574
    move-object v0, p1
    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanCount()I
    move-result v0
  .line 575
    const/4 v2, 1
    if-le p2, p4, :L2
    const/4 v3, 1
    goto :L3
  :L2
    const/4 v3, 0
  :L3
  .line 576
    if-eqz v3, :L4
    move v4, p4
    goto :L5
  :L4
    move v4, p3
  :L5
    invoke-virtual { p1, v4 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p1
  .line 577
    if-lez v0, :L14
    if-nez p1, :L6
    goto :L14
  :L6
  .line 578
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
  .line 579
    if-lt p2, v2, :L13
    const/4 p3, 4
    if-le p2, p3, :L9
    sget-boolean p3, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-nez p3, :L9
    goto :L13
  :L9
  .line 580
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p3
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p4
    sub-int/2addr p3, p4
  .line 581
    if-eqz v3, :L10
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    mul-int p3, p3, p2
    add-int/2addr p1, p3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result p3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result p4
    sub-int/2addr p3, p4
    sub-int/2addr p1, p3
    goto :L11
  :L10
  .line 582
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p1
    mul-int p3, p3, p2
    sub-int/2addr p1, p3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result p3
    sub-int/2addr p1, p3
  :L11
  .line 583
    sget-boolean p3, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-eqz p3, :L12
    mul-int/lit8 p2, p2, 45
    add-int/lit16 p2, p2, 180
    const/16 p3, 450
    invoke-static { p3, p2 }, Ljava/lang/Math;->min(II)I
    move-result v1
  :L12
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Wheel$Glider;->to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 584
    return v2
  :L13
  .line 579
    return v1
  :L14
  .line 577
    return v1
  :L15
  .line 573
    return v1
.end method

.method private static glideList(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
  .registers 14
  .line 593
    const/4 v0, 0
    if-ltz p3, :L20
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v1
    const/4 v2, 1
    if-ne v1, v2, :L20
    sget-object v1, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    if-nez v1, :L0
    goto/16 :L20
  :L0
  .line 596
    if-le p2, p4, :L1
    const/4 v7, 1
    goto :L2
  :L1
    const/4 v7, 0
  :L2
  .line 597
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v1
  .line 598
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v4
    sub-int/2addr v3, v4
  .line 599
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v4
  .line 600
    if-eqz v7, :L3
    sub-int v5, p2, p4
    goto :L4
  :L3
    sub-int v5, p3, p2
  :L4
  .line 601
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
  .line 603
    if-eqz v4, :L10
  .line 604
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p3
    sub-int/2addr p1, p3
  .line 605
    if-eqz v7, :L8
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p3
    sub-int/2addr p3, v3
    goto :L9
  :L8
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p3
    sub-int/2addr p3, v1
  :L9
    move v8, p1
    move v4, p3
    goto :L15
  :L10
  .line 607
    if-eqz v7, :L11
    move p3, p4
  :L11
    invoke-virtual { p1, p3 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p1
  .line 608
    if-nez p1, :L12
    return v0
  :L12
  .line 609
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p3
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p4
    sub-int/2addr p3, p4
  .line 610
    if-eqz v7, :L13
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    mul-int p4, v5, p3
    add-int/2addr p1, p4
    sub-int/2addr p1, v3
    goto :L14
  :L13
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p1
    mul-int p4, v5, p3
    sub-int/2addr p1, p4
    sub-int/2addr p1, v1
  :L14
    move v4, p1
    move v8, p3
  :L15
  .line 612
    if-nez v4, :L16
    return v2
  :L16
  .line 613
    sget-boolean p1, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-eqz p1, :L17
    mul-int/lit8 v5, v5, 45
    add-int/lit16 v5, v5, 180
    const/16 p1, 450
    invoke-static { p1, v5 }, Ljava/lang/Math;->min(II)I
    move-result v0
    move v5, v0
    goto :L18
  :L17
    const/4 v5, 0
  :L18
    move-object v3, p0
    move v6, p2
    invoke-static/range { v3 .. v8 }, Lcom/innioasis/ipp/Wheel;->listGlide(Landroidx/recyclerview/widget/RecyclerView;IIIZI)V
  .line 614
    return v2
  :L19
  .line 601
    return v0
  :L20
  .line 594
    return v0
.end method

.method public static glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .registers 3
  .line 561
    if-nez p0, :L0
    return-void
  :L0
  .line 562
    if-eqz p1, :L1
    sget-object p1, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p1, p0, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L2
  :L1
  .line 563
    sget-object p1, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { p1, p0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 564
    return-void
.end method

.method public static gotoLevel(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 7
  .line 881
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 882
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->set(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/ListAdapter;)V
  .line 883
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
  .line 884
    sget-object v1, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p1 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 885
    instance-of v2, v1, [I
    if-eqz v2, :L1
    check-cast v1, [I
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 886
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
  .line 887
    aget p1, v1, v2
    const/4 v0, 1
    aget v0, v1, v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
    goto :L4
  :L3
  .line 889
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/SongRows;->select(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L4
  .line 891
    return-void
  :L5
  .line 881
    return-void
.end method

.method static held(Landroidx/recyclerview/widget/RecyclerView;)Z
  .registers 2
  .line 526
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
  .line 519
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
  .line 520
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->heldRv:Ljava/lang/ref/WeakReference;
  .line 521
    sget-object p0, Lcom/innioasis/ipp/Wheel;->UI:Landroid/os/Handler;
    sget-object v0, Lcom/innioasis/ipp/Wheel;->RELEASE:Lcom/innioasis/ipp/Wheel$Release;
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 522
    const-wide/16 v1, 500
    invoke-virtual { p0, v0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 523
    return-void
.end method

.method static jumpNow(Landroidx/recyclerview/widget/RecyclerView;I)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 493
    const/4 v0, 0
    if-eqz p0, :L5
  :L0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v1
    if-nez v1, :L1
    goto :L5
  :L1
  .line 494
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 495
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->releasing:Z
  .line 496
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->jumping:Z
  .line 497
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L2
    goto :L4
  :L3
  .line 498
    move-exception p0
  :L4
  .line 500
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->releasing:Z
  .line 501
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->jumping:Z
  .line 502
    nop
  .line 503
    return-void
  :L5
  .line 500
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->releasing:Z
  .line 501
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->jumping:Z
  .line 493
    return-void
.end method

.method private static listGlide(Landroidx/recyclerview/widget/RecyclerView;IIIZI)V
  .registers 7
  .line 623
    div-int/lit8 p5, p5, 2
  .line 624
    if-nez p2, :L2
    if-lez p5, :L2
    invoke-static { p1 }, Ljava/lang/Math;->abs(I)I
    move-result v0
    if-le v0, p5, :L2
  .line 625
    if-lez p1, :L0
    sub-int p5, p1, p5
    goto :L1
  :L0
    add-int/2addr p5, p1
  :L1
  .line 626
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 627
    const/4 v0, 0
    invoke-virtual { p0, v0, p5 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  .line 628
    sub-int/2addr p1, p5
  :L2
  .line 630
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Wheel$Glider;->to(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 631
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->list()V
  .line 632
    invoke-static { p3, p4 }, Lcom/innioasis/ipp/Wheel$Glider;->aim(IZ)V
  .line 633
    return-void
.end method

.method private static margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
  .registers 2
  .line 860
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p0
  .line 861
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
  .line 871
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 872
    if-eqz v0, :L3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-nez v1, :L1
    goto :L3
  :L1
  .line 873
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 874
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
  .line 876
    goto :L5
  :L3
  .line 872
    return-void
  :L4
  .line 875
    move-exception p0
  :L5
  .line 877
    return-void
.end method

.method private static paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 376
    const/4 v0, 0
    if-ltz p2, :L6
    if-lt p2, p3, :L0
    goto :L6
  :L0
  .line 377
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p3
  .line 378
    instance-of v1, p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L1
    return v0
  :L1
  .line 379
    check-cast p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { p3, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p3
  .line 381
    const/4 v1, 1
    if-nez p3, :L2
    return v1
  :L2
  .line 382
    invoke-virtual { p0, p3 }, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object p0
  .line 383
    if-nez p0, :L3
    return v0
  :L3
  .line 384
    invoke-virtual { p1, p0, p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->bindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  :L4
  .line 385
    return v1
  :L5
  .line 386
    move-exception p0
  .line 387
    return v0
  :L6
  .line 376
    return v0
.end method

.method static paintPanel()V
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  .line 122
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Wheel;->panelAt:J
  .line 123
    invoke-static { }, Lcom/innioasis/ipp/Eq;->paint()V
  .line 124
    sget-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 125
    instance-of v2, v0, Lcom/innioasis/y1/activity/SettingActivity;
    if-eqz v2, :L2
    move-object v3, v0
    check-cast v3, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-static { v3 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v3
    if-eqz v3, :L2
    return-void
  :L2
  .line 126
    sget-object v3, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 127
    sput-object v1, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 128
    sput-object v1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 129
    if-eqz v2, :L7
    if-eqz v3, :L7
  .line 130
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->painting:Z
  .line 132
    const/4 v1, 0
  :L3
    sput-object v3, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 133
    check-cast v0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { v0, v3 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  :L4
    goto :L6
  :L5
  .line 134
    move-exception v0
  :L6
  .line 136
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->painting:Z
  .line 137
    nop
  :L7
  .line 139
    return-void
.end method

.method static panelAtRest()Z
  .registers 1
  .line 112
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->busy:Z
    xor-int/lit8 v0, v0, 1
    return v0
.end method

.method public static panelShows(Ljava/lang/String;)Z
  .registers 2
  .line 117
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
  .line 94
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
  .line 95
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 96
    sput-object p1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 97
    return v1
  :L0
  .line 99
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->busy:Z
    if-eqz v0, :L2
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->painting:Z
    if-eqz v0, :L1
    goto :L2
  :L1
  .line 103
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 104
    sput-object p1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 105
    return v1
  :L2
  .line 100
    sput-object p1, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 101
    const/4 p0, 0
    return p0
.end method

.method private static postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 4
  .line 75
    sget-object v0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
  .line 76
    sput p1, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 77
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Wheel;->busy:Z
  .line 78
    sget-object p1, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 79
    const-wide/16 v0, 70
    invoke-virtual { p0, p1, v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 80
    sget-object p1, Lcom/innioasis/ipp/Wheel;->NOW:Lcom/innioasis/ipp/Wheel$Now;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 81
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  .line 82
    return-void
.end method

.method public static refollow(Landroidx/recyclerview/widget/RecyclerView$Adapter;I)Z
  .registers 4
  .line 164
    sget-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  :L1
  .line 165
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, p0, :L2
    goto :L3
  :L2
  .line 166
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->stickyWrap:Z
  .line 167
    invoke-static { v0, p1, p0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 168
    const/4 p0, 1
    return p0
  :L3
  .line 165
    const/4 p0, 0
    return p0
.end method

.method static releaseSoon(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 531
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->held(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p0
    if-nez p0, :L0
    return-void
  :L0
  .line 532
    sget-object p0, Lcom/innioasis/ipp/Wheel;->UI:Landroid/os/Handler;
    sget-object v0, Lcom/innioasis/ipp/Wheel;->RELEASE:Lcom/innioasis/ipp/Wheel$Release;
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 533
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 534
    return-void
.end method

.method private static retarget(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;I)Z
  .registers 14
  .line 640
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v0
  .line 641
    const/4 v1, 0
    const/4 v2, 0
    cmpl-float v1, v0, v1
    if-eqz v1, :L8
    instance-of v1, p1, Landroidx/recyclerview/widget/GridLayoutManager;
    if-eqz v1, :L0
    goto :L8
  :L0
  .line 642
    invoke-virtual { p1, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p1
  .line 643
    if-nez p1, :L1
    return v2
  :L1
  .line 644
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v1
  .line 645
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v4
    sub-int/2addr v3, v4
  .line 646
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 647
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result v4
    sub-int/2addr v4, v0
  .line 648
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    sub-int/2addr p1, v0
  .line 649
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
  .line 650
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
  .line 651
    return v3
  :L8
  .line 641
    return v2
.end method

.method public static rows(Landroidx/recyclerview/widget/RecyclerView;I)V
  .catchall { :L0 .. :L12 } :L13
  .registers 9
  :L0
  .line 188
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 189
    if-nez v0, :L1
    return-void
  :L1
  .line 190
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->model()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v1
  .line 191
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Follow;->touched(Landroid/view/View;Ljava/lang/Object;)V
  .line 192
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 193
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v4
  .line 194
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Alpha;->step(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
    move-result v5
    if-eqz v5, :L3
  .line 195
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
  .line 196
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p1
    if-eq p1, v4, :L2
  .line 197
    sget-boolean p1, Lcom/innioasis/ipp/Wheel;->DBG:Z
    if-eqz p1, :L2
  .line 198
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
  .line 199
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    new-instance v0, Lcom/innioasis/ipp/Wheel$AlphaDbg;
    invoke-direct { v0, v5, v6, p0 }, Lcom/innioasis/ipp/Wheel$AlphaDbg;-><init>(JLandroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { p1, v0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L2
  .line 202
    return-void
  :L3
  .line 204
    invoke-static { p0 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 206
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Bar;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v2
    if-eqz v2, :L4
    return-void
  :L4
  .line 207
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->cursor()I
    move-result v0
  .line 208
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v2
  .line 209
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
  .line 211
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->flushRows()V
  .line 212
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Loop;->fromShuffle(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
    move-result v4
    if-eqz v4, :L7
    return-void
  :L7
  .line 214
    if-gez v2, :L8
    return-void
  :L8
  .line 216
    if-ne p1, v3, :L9
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toNext()V
    goto :L10
  :L9
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toPrevious()V
  :L10
  .line 217
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    if-ne v3, v2, :L11
  .line 218
    invoke-static { p0, v1, p1, v2 }, Lcom/innioasis/ipp/Loop;->list(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)Z
  .line 219
    return-void
  :L11
  .line 221
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Wheel;->stepRows(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L12
  .line 223
    goto :L14
  :L13
  .line 222
    move-exception p0
  :L14
  .line 224
    return-void
.end method

.method private static same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
  .registers 3
  .line 71
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
  .line 397
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 398
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L0
  .line 399
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  .line 400
    return-void
  :L0
  .line 402
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 403
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
  .line 405
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->releasing:Z
    if-nez v1, :L2
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->wrapping:Z
    if-eqz v1, :L2
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Bar;->defer(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v1
    if-eqz v1, :L2
    return-void
  :L2
  .line 406
    sget-boolean v1, Lcom/innioasis/ipp/Wheel;->jumping:Z
    if-nez v1, :L3
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Wheel;->retarget(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;I)Z
    move-result v1
    if-eqz v1, :L3
    return-void
  :L3
  .line 407
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I
    move-result v1
  .line 408
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I
    move-result v2
  .line 409
    const/4 v3, 0
    if-ltz v1, :L7
    if-lt p1, v1, :L7
    if-gt p1, v2, :L7
  .line 411
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v4
    if-nez v4, :L4
    const/4 v4, 0
    goto :L5
  :L4
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v4
  :L5
  .line 412
    if-eqz v4, :L6
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result v4
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v5
    if-lt v4, v5, :L7
  :L6
    return-void
  :L7
  .line 414
    sget-boolean v4, Lcom/innioasis/ipp/Wheel;->releasing:Z
    if-nez v4, :L8
    sget-object v4, Lcom/innioasis/ipp/Wheel;->gliding:Ljava/util/WeakHashMap;
    invoke-virtual { v4, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    if-eqz v4, :L8
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/PlGrid;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v4
    if-eqz v4, :L8
  .line 415
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->hold(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 416
    return-void
  :L8
  .line 418
    sget-boolean v4, Lcom/innioasis/ipp/Wheel;->jumping:Z
    if-nez v4, :L9
    invoke-static { p0, v0, p1, v1, v2 }, Lcom/innioasis/ipp/Wheel;->glide(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;III)Z
    move-result v4
    if-eqz v4, :L9
    return-void
  :L9
  .line 419
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 420
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 422
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
  .line 424
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v2
    if-nez v2, :L13
    goto :L14
  :L13
    const/4 v4, 0
  :L14
  .line 425
    if-eqz v4, :L15
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingLeft()I
    move-result v2
    goto :L16
  :L15
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v2
  :L16
  .line 426
    if-eqz v4, :L17
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingRight()I
    move-result v6
    sub-int/2addr v5, v6
    goto :L18
  :L17
  .line 427
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v6
    sub-int/2addr v5, v6
  :L18
  .line 428
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v6
  .line 429
    if-eqz v6, :L23
  .line 431
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
  .line 432
    if-eqz p1, :L22
  .line 433
    if-eqz v4, :L21
    invoke-virtual { p0, p1, v3 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
    goto :L22
  :L21
    invoke-virtual { p0, v3, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  :L22
  .line 435
    return-void
  :L23
  .line 437
    invoke-virtual { v0, v3 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 438
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
  .line 439
    if-lez v7, :L27
    if-le v5, v2, :L27
  .line 440
    if-eqz v1, :L26
    sub-int v2, v5, v2
    sub-int v3, v2, v7
  :L26
    invoke-virtual { v0, p1, v3 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V
    goto :L28
  :L27
  .line 442
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  :L28
  .line 445
    invoke-static { p0 }, Lcom/innioasis/ipp/Fixed;->layNow(Landroid/view/View;)V
  .line 447
    if-eqz v1, :L29
    if-nez v4, :L29
    invoke-static { p0, p1, v5 }, Lcom/innioasis/ipp/Wheel$Settle;->at(Landroidx/recyclerview/widget/RecyclerView;II)V
  :L29
  .line 448
    return-void
.end method

.method private static start(Landroid/view/View;Z)I
  .registers 4
  .line 848
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
    move-result-object v0
  .line 849
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
  .line 850
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
  .line 280
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p0, :L0
    return-void
  :L0
  .line 281
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->flushRows()V
  .line 282
    sget-object v0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->same(Ljava/lang/ref/WeakReference;Ljava/lang/Object;)Ljava/lang/ref/WeakReference;
    move-result-object p0
    sput-object p0, Lcom/innioasis/ipp/Wheel;->stepRv:Ljava/lang/ref/WeakReference;
  .line 283
    sput p1, Lcom/innioasis/ipp/Wheel;->stepFrom:I
  .line 284
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->stepOn:Z
  .line 285
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    sget-object p1, Lcom/innioasis/ipp/Wheel;->STEP:Lcom/innioasis/ipp/Wheel$Step;
    invoke-virtual { p0, p1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 286
    return-void
.end method

.method static tune(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 312
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 313
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
  .line 314
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->tuned:Ljava/lang/ref/WeakReference;
  .line 315
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->tunedLm:Ljava/lang/ref/WeakReference;
  .line 316
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V
  .line 320
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemViewCacheSize(I)V
  .line 323
    if-eqz v0, :L1
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->setItemPrefetchEnabled(Z)V
  :L1
  .line 327
    const/high16 v0, 0x00060000
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setDescendantFocusability(I)V
  .line 328
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->findFocus()Landroid/view/View;
    move-result-object v0
  .line 329
    if-eqz v0, :L2
    if-eq v0, p0, :L2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->requestFocus()Z
  :L2
  .line 330
    return-void
.end method

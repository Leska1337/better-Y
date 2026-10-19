.class public final Lcom/innioasis/ipp/Follow;
.super Ljava/lang/Object;
.source "Follow.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Follow$Land;,
    Lcom/innioasis/ipp/Follow$Idle;,
    Lcom/innioasis/ipp/Follow$Jump;,
    Lcom/innioasis/ipp/Follow$PreJump;
  }
.end annotation

.field public final static IDLES:[I

.field public final static IDLE_DEFAULT:I = 5

.field public final static KEY_IDLE:Ljava/lang/String; = "follow_idle"

.field private final static MAX_PASSES:I = 12

.field private final static PENDING_MS:J = 5000L

.field private final static SETTLED:I = 3

.field private final static WATCH_MS:J = 2000L

.field private static adapterRef:Ljava/lang/ref/WeakReference;

.field private static fromPlayer:Z

.field private static holds:I

.field private static idle:Lcom/innioasis/ipp/Follow$Idle;

.field private final static lastMove:Ljava/util/WeakHashMap;

.field private static listRef:Ljava/lang/ref/WeakReference;

.field private static pendingFor:Ljava/lang/ref/WeakReference;

.field private static pendingForce:Z

.field private static pendingScreen:Ljava/lang/ref/WeakReference;

.field private static pendingUntil:J

.field private static watching:Lcom/innioasis/ipp/Follow$Land;

.method static constructor <clinit>()V
  .registers 1
  .line 40
    const/16 v0, 13
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Follow;->IDLES:[I
  .line 56
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    return-void
  :L0
  .array-data 4
      2
      3
      4
      5
      6
      7
      8
      9
      10
      12
      15
      20
      30
  .end array-data
.end method

.method private constructor <init>()V
  .registers 1
  .line 33
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;)J
  .registers 3
  .line 31
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->freeIn(Ljava/lang/Object;)J
    move-result-wide v0
    return-wide v0
.end method

.method static synthetic access$100(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .registers 2
  .line 31
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->catchUp(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
    return-void
.end method

.method static synthetic access$200()Lcom/innioasis/ipp/Follow$Land;
  .registers 1
  .line 31
    sget-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
    return-object v0
.end method

.method static synthetic access$202(Lcom/innioasis/ipp/Follow$Land;)Lcom/innioasis/ipp/Follow$Land;
  .registers 1
  .line 31
    sput-object p0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
    return-object p0
.end method

.method static synthetic access$300()Ljava/lang/String;
  .registers 1
  .line 31
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$400(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
  .registers 2
  .line 31
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method static synthetic access$502(J)J
  .registers 2
  .line 31
    sput-wide p0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    return-wide p0
.end method

.method private static activityOf(Landroid/content/Context;)Landroid/app/Activity;
  .registers 2
  .line 491
    nop
  :L0
    instance-of v0, p0, Landroid/content/ContextWrapper;
    if-eqz v0, :L2
  .line 492
    instance-of v0, p0, Landroid/app/Activity;
    if-eqz v0, :L1
    check-cast p0, Landroid/app/Activity;
    return-object p0
  :L1
  .line 493
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
    goto :L0
  :L2
  .line 495
    const/4 p0, 0
    return-object p0
.end method

.method static adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 3
  .line 606
    sget-object v0, Lcom/innioasis/ipp/Follow;->adapterRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 607
    instance-of v2, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  :L2
    return-object v1
.end method

.method private static arm(Landroid/view/View;Ljava/lang/Object;)V
  .registers 5
  .line 153
    if-nez p0, :L0
    return-void
  :L0
  .line 154
    sget-object v0, Lcom/innioasis/ipp/Follow;->idle:Lcom/innioasis/ipp/Follow$Idle;
    if-eqz v0, :L1
    iget-boolean v0, v0, Lcom/innioasis/ipp/Follow$Idle;->alive:Z
    if-eqz v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Follow;->idle:Lcom/innioasis/ipp/Follow$Idle;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Follow$Idle;->adapter()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p1, :L1
    return-void
  :L1
  .line 155
    new-instance v0, Lcom/innioasis/ipp/Follow$Idle;
    invoke-direct { v0, p1, p0 }, Lcom/innioasis/ipp/Follow$Idle;-><init>(Ljava/lang/Object;Landroid/view/View;)V
  .line 156
    sput-object v0, Lcom/innioasis/ipp/Follow;->idle:Lcom/innioasis/ipp/Follow$Idle;
  .line 157
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v1
    invoke-virtual { p0, v0, v1, v2 }, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 158
    return-void
.end method

.method public static armPending()V
  .registers 2
  .line 464
    const/4 v0, 1
    const/4 v1, 0
    invoke-static { v0, v1, v1 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;Landroid/app/Activity;)V
  .line 465
    return-void
.end method

.method private static armPending(ZLjava/lang/Object;Landroid/app/Activity;)V
  .registers 10
  .line 481
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 482
    if-nez p0, :L0
    sget-wide v2, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-eqz v6, :L0
    cmp-long v4, v0, v2
    if-lez v4, :L5
  :L0
  .line 483
    sput-boolean p0, Lcom/innioasis/ipp/Follow;->pendingForce:Z
  .line 484
    const/4 p0, 0
    if-nez p1, :L1
    move-object v2, p0
    goto :L2
  :L1
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L2
    sput-object v2, Lcom/innioasis/ipp/Follow;->pendingFor:Ljava/lang/ref/WeakReference;
  .line 485
    if-nez p2, :L3
    goto :L4
  :L3
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L4
    sput-object p0, Lcom/innioasis/ipp/Follow;->pendingScreen:Ljava/lang/ref/WeakReference;
  :L5
  .line 487
    const-wide/16 p0, 5000
    add-long/2addr v0, p0
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  .line 488
    return-void
.end method

.method private static busy(Ljava/lang/Object;)Z
  .registers 5
  .line 143
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->freeIn(Ljava/lang/Object;)J
    move-result-wide v0
    const-wide/16 v2, 0
    cmp-long p0, v0, v2
    if-lez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static catchUp(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  :L0
  .line 200
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 201
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L2
    return-void
  :L2
  .line 202
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v0
  .line 203
    if-nez v0, :L3
    return-void
  :L3
  .line 204
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v0
  .line 205
    if-ltz v0, :L6
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    if-ne v0, v1, :L4
    goto :L6
  :L4
  .line 206
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  :L5
  .line 208
    goto :L8
  :L6
  .line 205
    return-void
  :L7
  .line 207
    move-exception p0
  :L8
  .line 209
    return-void
.end method

.method private static enabled()Z
  .registers 2
  .line 592
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 593
    const-string v1, "follow_playing"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static free(Ljava/lang/Object;)V
  .registers 2
  .line 83
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 84
    return-void
.end method

.method private static freeIn(Ljava/lang/Object;)J
  .registers 10
  .line 130
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 131
    sget v2, Lcom/innioasis/ipp/Follow;->holds:I
    if-gtz v2, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->ticked(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L0
    goto :L4
  :L0
  .line 135
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v2
    const-wide/16 v3, 0
    if-nez v2, :L1
    return-wide v3
  :L1
  .line 136
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->stamp(Ljava/lang/Object;)J
    move-result-wide v5
  .line 137
    cmp-long p0, v5, v3
    if-nez p0, :L2
    return-wide v3
  :L2
  .line 138
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v7
    sub-long/2addr v0, v5
    sub-long/2addr v7, v0
  .line 139
    cmp-long p0, v7, v3
    if-lez p0, :L3
    move-wide v3, v7
  :L3
    return-wide v3
  :L4
  .line 132
    if-eqz p0, :L5
    sget-object v2, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { v0, v1 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v0
    invoke-virtual { v2, p0, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 133
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v0
    return-wide v0
.end method

.method public static hold(Z)V
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  .line 99
    if-eqz p0, :L1
  :L0
  .line 100
    sget p0, Lcom/innioasis/ipp/Follow;->holds:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Follow;->holds:I
  .line 101
    return-void
  :L1
  .line 103
    sget p0, Lcom/innioasis/ipp/Follow;->holds:I
    if-lez p0, :L2
    add-int/lit8 p0, p0, -1
    sput p0, Lcom/innioasis/ipp/Follow;->holds:I
  :L2
  .line 105
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  .line 106
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/view/View;
    move-result-object v0
  .line 107
    if-eqz p0, :L5
    if-eqz v0, :L5
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v1
    if-nez v1, :L3
    goto :L5
  :L3
  .line 108
    sget-object v1, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    invoke-static { v2, v3 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 109
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Follow;->arm(Landroid/view/View;Ljava/lang/Object;)V
  :L4
  .line 111
    goto :L7
  :L5
  .line 107
    return-void
  :L6
  .line 110
    move-exception p0
  :L7
  .line 112
    return-void
.end method

.method private static idleMs()J
  .registers 4
  .line 44
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "follow_idle"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 45
    if-ltz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Follow;->IDLES:[I
    array-length v1, v1
    if-lt v0, v1, :L1
  :L0
    const/4 v0, 5
  :L1
  .line 46
    sget-object v1, Lcom/innioasis/ipp/Follow;->IDLES:[I
    aget v0, v1, v0
    int-to-long v0, v0
    const-wide/16 v2, 1000
    mul-long v0, v0, v2
    return-wide v0
.end method

.method private static indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
  .registers 5
  .line 583
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-ge v0, v1, :L3
  .line 584
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  .line 585
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L1
    move-object v2, v1
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L1
    return v0
  :L1
  .line 586
    instance-of v2, v1, Ljava/io/File;
    if-eqz v2, :L2
    check-cast v1, Ljava/io/File;
    invoke-virtual { v1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return v0
  :L2
  .line 583
    add-int/lit8 v0, v0, 1
    goto :L0
  :L3
  .line 588
    const/4 p0, -1
    return p0
.end method

.method public static land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 238
    if-eqz p0, :L4
    if-eqz p1, :L4
    if-gez p2, :L0
    goto :L4
  :L0
  .line 240
    invoke-static { p1 }, Lcom/innioasis/ipp/Follow;->leaveShuffleRow(Landroid/view/View;)V
  .line 241
    invoke-virtual { p0, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 242
    invoke-static { }, Lcom/innioasis/ipp/Follow;->stopLanding()V
  .line 243
    new-instance v0, Lcom/innioasis/ipp/Follow$Land;
    invoke-direct { v0, p0, p1, p2 }, Lcom/innioasis/ipp/Follow$Land;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  .line 244
    sput-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 245
    invoke-virtual { p1 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 247
    goto :L3
  :L2
  .line 246
    move-exception p0
  :L3
  .line 248
    return-void
  :L4
  .line 238
    return-void
.end method

.method private static leaveShuffleRow(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 575
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->shuffle(Landroid/view/View;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object p0
  .line 576
    if-eqz p0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v0
    if-eqz v0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onClockwise()V
  :L1
  .line 578
    goto :L3
  :L2
  .line 577
    move-exception p0
  :L3
  .line 579
    return-void
.end method

.method public static leftPlayer(Landroid/app/Activity;)V
  .registers 1
  .line 423
    if-eqz p0, :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->isFinishing()Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    sput-boolean p0, Lcom/innioasis/ipp/Follow;->fromPlayer:Z
  .line 424
    return-void
.end method

.method static list()Landroid/view/View;
  .registers 3
  .line 611
    sget-object v0, Lcom/innioasis/ipp/Follow;->listRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 612
    instance-of v2, v0, Landroid/view/View;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Landroid/view/View;
  :L2
    return-object v1
.end method

.method private static moveTo(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  .registers 5
  .line 374
    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
  .line 376
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    add-int/lit8 v0, v0, 1
  .line 377
    invoke-static { p1 }, Lcom/innioasis/ipp/Follow;->leaveShuffleRow(Landroid/view/View;)V
  .line 378
    invoke-virtual { p0, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 379
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;
  .line 380
    add-int/lit8 p2, p2, 1
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-static { p1, v0, p2, p0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 381
    return-void
  :L0
  .line 383
    check-cast p1, Landroid/widget/ListView;
  .line 384
    invoke-virtual { p1 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
  .line 385
    invoke-virtual { p1 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result v1
  .line 386
    invoke-static { p1 }, Lcom/innioasis/ipp/Follow;->leaveShuffleRow(Landroid/view/View;)V
  .line 387
    invoke-virtual { p0, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 388
    if-lt p2, v1, :L3
  .line 389
    sub-int/2addr p2, v1
    invoke-static { p1 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result p0
    invoke-static { p1, v0, p0 }, Lcom/innioasis/ipp/Wheel;->firstShown(Landroid/widget/ListView;II)I
    move-result p0
    add-int/2addr p2, p0
    add-int/lit8 p2, p2, 1
  .line 390
    invoke-static { p1 }, Lcom/innioasis/ipp/Head;->headerShowing(Landroid/widget/ListView;)Z
    move-result p0
    if-eqz p0, :L1
    add-int/lit8 p2, p2, -1
  :L1
  .line 391
    if-gez p2, :L2
    const/4 p2, 0
  :L2
  .line 392
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
    goto :L4
  :L3
  .line 393
    if-lt p2, v0, :L5
    invoke-static { p1, p2, v0 }, Lcom/innioasis/ipp/Wheel;->cutAtTop(Landroid/widget/ListView;II)Z
    move-result p0
    if-eqz p0, :L4
    goto :L5
  :L4
    goto :L6
  :L5
  .line 394
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  :L6
  .line 396
    return-void
.end method

.method public static note(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/ViewGroup;)V
  .registers 7
  .line 60
    if-eqz p0, :L6
    invoke-static { p1 }, Lcom/innioasis/ipp/Lv;->is(Landroid/view/View;)Z
    move-result v0
    if-nez v0, :L0
    goto :L6
  :L0
  .line 61
    sget-object v0, Lcom/innioasis/ipp/Follow;->adapterRef:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L2
  :L1
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Follow;->adapterRef:Ljava/lang/ref/WeakReference;
  :L2
  .line 62
    sget-object v0, Lcom/innioasis/ipp/Follow;->listRef:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L3
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p1, :L4
  :L3
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Follow;->listRef:Ljava/lang/ref/WeakReference;
  :L4
  .line 63
    invoke-virtual { p1 }, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 64
    sget-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-eqz v4, :L5
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->tryPending(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  :L5
  .line 65
    invoke-static { p1 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 66
    return-void
  :L6
  .line 60
    return-void
.end method

.method public static onSongChanged()V
  .catchall { :L0 .. :L7 } :L10
  .registers 4
  :L0
  .line 214
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 215
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 216
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/view/View;
    move-result-object v1
  .line 217
    if-eqz v0, :L9
    if-nez v1, :L2
    goto :L9
  :L2
  .line 218
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->busy(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    return-void
  :L3
  .line 220
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L4
    return-void
  :L4
  .line 222
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v2
  .line 223
    if-nez v2, :L5
    return-void
  :L5
  .line 225
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v2
  .line 226
    if-ltz v2, :L8
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    if-ne v2, v3, :L6
    goto :L8
  :L6
  .line 227
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Follow;->moveTo(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  :L7
  .line 229
    goto :L11
  :L8
  .line 226
    return-void
  :L9
  .line 217
    return-void
  :L10
  .line 228
    move-exception v0
  :L11
  .line 230
    return-void
.end method

.method private static playingPath()Ljava/lang/String;
  .registers 2
  .line 597
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 598
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 600
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 601
    if-nez v0, :L1
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L2
    return-object v1
.end method

.method public static rebuilt(Ljava/lang/Object;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 473
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 474
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 475
    const/4 v0, 0
    const/4 v1, 0
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;Landroid/app/Activity;)V
  :L2
  .line 477
    goto :L4
  :L3
  .line 476
    move-exception p0
  :L4
  .line 478
    return-void
.end method

.method public static resumed(Ljava/lang/Object;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 4
  .line 432
    sget-boolean v0, Lcom/innioasis/ipp/Follow;->fromPlayer:Z
  .line 433
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Follow;->fromPlayer:Z
  .line 434
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v1
    if-nez v1, :L0
    return-void
  :L0
  .line 436
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    return-void
  :L1
  .line 437
    check-cast p0, Landroid/app/Activity;
  .line 438
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    if-nez v1, :L2
    return-void
  :L2
  .line 439
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Lv;->find(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
  .line 440
    if-nez v1, :L3
    return-void
  :L3
  .line 442
    const/4 v2, 0
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;Landroid/app/Activity;)V
  .line 443
    invoke-static { v1 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  .line 444
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L4
    return-void
  :L4
  .line 445
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 446
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L5
    return-void
  :L5
  .line 447
    new-instance v0, Lcom/innioasis/ipp/Follow$Jump;
    move-object v2, p0
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v0, p0, v1 }, Lcom/innioasis/ipp/Follow$Jump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
    invoke-virtual { v1, v0 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
  :L6
  .line 449
    goto :L8
  :L7
  .line 448
    move-exception p0
  :L8
  .line 450
    return-void
.end method

.method private static stamp(Ljava/lang/Object;)J
  .registers 3
  .line 87
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  :L1
  .line 88
    instance-of v0, p0, Ljava/lang/Long;
    if-eqz v0, :L2
    check-cast p0, Ljava/lang/Long;
    invoke-virtual { p0 }, Ljava/lang/Long;->longValue()J
    move-result-wide v0
    goto :L3
  :L2
    const-wide/16 v0, 0
  :L3
    return-wide v0
.end method

.method private static stopLanding()V
  .registers 2
  .line 254
    sget-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 255
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 256
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Follow$Land;->drop()V
  :L0
  .line 257
    return-void
.end method

.method private static ticked(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  .line 117
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return v0
  :L1
  .line 118
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  .line 119
    if-eqz p0, :L3
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result p0
  :L2
    if-nez p0, :L3
    const/4 v0, 1
  :L3
    return v0
  :L4
  .line 120
    move-exception p0
  .line 121
    return v0
.end method

.method public static toPlaying(Landroid/app/Activity;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 405
    if-eqz p0, :L7
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    if-nez v0, :L1
    goto :L7
  :L1
  .line 406
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->find(Landroid/view/View;)Landroid/view/View;
    move-result-object p0
  .line 407
    if-nez p0, :L2
    return-void
  :L2
  .line 408
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 409
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L3
    return-void
  :L3
  .line 410
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 411
    new-instance v1, Lcom/innioasis/ipp/Follow$Jump;
    move-object v2, v0
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v1, v0, p0 }, Lcom/innioasis/ipp/Follow$Jump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
    invoke-virtual { p0, v1 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
  :L4
  .line 413
    goto :L6
  :L5
  .line 412
    move-exception p0
  :L6
  .line 414
    return-void
  :L7
  .line 405
    return-void
.end method

.method public static touched(Landroid/view/View;Ljava/lang/Object;)V
  .registers 5
  .line 74
    if-nez p1, :L0
    return-void
  :L0
  .line 76
    invoke-static { }, Lcom/innioasis/ipp/Follow;->stopLanding()V
  .line 77
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-static { v1, v2 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v1
    invoke-virtual { v0, p1, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 78
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->arm(Landroid/view/View;Ljava/lang/Object;)V
  :L1
  .line 79
    return-void
.end method

.method private static tryPending(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .catchall { :L0 .. :L8 } :L10
  .registers 9
  .line 500
    const-wide/16 v0, 0
  :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sget-wide v4, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    cmp-long v6, v2, v4
    if-lez v6, :L1
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    return-void
  :L1
  .line 501
    sget-boolean v2, Lcom/innioasis/ipp/Follow;->pendingForce:Z
    if-nez v2, :L2
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v2
    if-nez v2, :L2
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    return-void
  :L2
  .line 502
    sget-object v2, Lcom/innioasis/ipp/Follow;->pendingFor:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L3
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-eq v2, p0, :L3
    return-void
  :L3
  .line 503
    sget-object v2, Lcom/innioasis/ipp/Follow;->pendingScreen:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L4
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { p1 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Follow;->activityOf(Landroid/content/Context;)Landroid/app/Activity;
    move-result-object v3
    if-eq v2, v3, :L4
  .line 504
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v2
    if-nez v2, :L4
    return-void
  :L4
  .line 505
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->busy(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L5
    return-void
  :L5
  .line 506
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L6
    return-void
  :L6
  .line 507
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v2
  .line 508
    if-eqz v2, :L9
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v2
    if-gez v2, :L7
    goto :L9
  :L7
  .line 509
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  .line 511
    invoke-virtual { p1 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v2
    new-instance v3, Lcom/innioasis/ipp/Follow$PreJump;
    invoke-direct { v3, p0, p1 }, Lcom/innioasis/ipp/Follow$PreJump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
    invoke-virtual { v2, v3 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L8
  .line 514
    goto :L11
  :L9
  .line 508
    return-void
  :L10
  .line 512
    move-exception p0
  .line 513
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  :L11
  .line 515
    return-void
.end method

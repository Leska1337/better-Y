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
  .line 39
    const/16 v0, 13
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Follow;->IDLES:[I
  .line 55
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
  .line 32
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;)J
  .registers 3
  .line 30
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->freeIn(Ljava/lang/Object;)J
    move-result-wide v0
    return-wide v0
.end method

.method static synthetic access$100(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .registers 2
  .line 30
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->catchUp(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
    return-void
.end method

.method static synthetic access$200()Lcom/innioasis/ipp/Follow$Land;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
    return-object v0
.end method

.method static synthetic access$202(Lcom/innioasis/ipp/Follow$Land;)Lcom/innioasis/ipp/Follow$Land;
  .registers 1
  .line 30
    sput-object p0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
    return-object p0
.end method

.method static synthetic access$300()Ljava/lang/String;
  .registers 1
  .line 30
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$400(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
  .registers 2
  .line 30
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method static synthetic access$502(J)J
  .registers 2
  .line 30
    sput-wide p0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    return-wide p0
.end method

.method private static activityOf(Landroid/content/Context;)Landroid/app/Activity;
  .registers 2
  .line 474
    nop
  :L0
    instance-of v0, p0, Landroid/content/ContextWrapper;
    if-eqz v0, :L2
  .line 475
    instance-of v0, p0, Landroid/app/Activity;
    if-eqz v0, :L1
    check-cast p0, Landroid/app/Activity;
    return-object p0
  :L1
  .line 476
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
    goto :L0
  :L2
  .line 478
    const/4 p0, 0
    return-object p0
.end method

.method static adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 3
  .line 589
    sget-object v0, Lcom/innioasis/ipp/Follow;->adapterRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 590
    instance-of v2, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  :L2
    return-object v1
.end method

.method private static arm(Landroid/view/View;Ljava/lang/Object;)V
  .registers 5
  .line 152
    if-nez p0, :L0
    return-void
  :L0
  .line 153
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
  .line 154
    new-instance v0, Lcom/innioasis/ipp/Follow$Idle;
    invoke-direct { v0, p1, p0 }, Lcom/innioasis/ipp/Follow$Idle;-><init>(Ljava/lang/Object;Landroid/view/View;)V
  .line 155
    sput-object v0, Lcom/innioasis/ipp/Follow;->idle:Lcom/innioasis/ipp/Follow$Idle;
  .line 156
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v1
    invoke-virtual { p0, v0, v1, v2 }, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 157
    return-void
.end method

.method public static armPending()V
  .registers 2
  .line 447
    const/4 v0, 1
    const/4 v1, 0
    invoke-static { v0, v1, v1 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;Landroid/app/Activity;)V
  .line 448
    return-void
.end method

.method private static armPending(ZLjava/lang/Object;Landroid/app/Activity;)V
  .registers 10
  .line 464
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 465
    if-nez p0, :L0
    sget-wide v2, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-eqz v6, :L0
    cmp-long v4, v0, v2
    if-lez v4, :L5
  :L0
  .line 466
    sput-boolean p0, Lcom/innioasis/ipp/Follow;->pendingForce:Z
  .line 467
    const/4 p0, 0
    if-nez p1, :L1
    move-object v2, p0
    goto :L2
  :L1
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L2
    sput-object v2, Lcom/innioasis/ipp/Follow;->pendingFor:Ljava/lang/ref/WeakReference;
  .line 468
    if-nez p2, :L3
    goto :L4
  :L3
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L4
    sput-object p0, Lcom/innioasis/ipp/Follow;->pendingScreen:Ljava/lang/ref/WeakReference;
  :L5
  .line 470
    const-wide/16 p0, 5000
    add-long/2addr v0, p0
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  .line 471
    return-void
.end method

.method private static busy(Ljava/lang/Object;)Z
  .registers 5
  .line 142
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
  .line 199
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 200
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L2
    return-void
  :L2
  .line 201
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v0
  .line 202
    if-nez v0, :L3
    return-void
  :L3
  .line 203
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v0
  .line 204
    if-ltz v0, :L6
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    if-ne v0, v1, :L4
    goto :L6
  :L4
  .line 205
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  :L5
  .line 207
    goto :L8
  :L6
  .line 204
    return-void
  :L7
  .line 206
    move-exception p0
  :L8
  .line 208
    return-void
.end method

.method private static enabled()Z
  .registers 2
  .line 575
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 576
    const-string v1, "follow_playing"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static free(Ljava/lang/Object;)V
  .registers 2
  .line 82
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 83
    return-void
.end method

.method private static freeIn(Ljava/lang/Object;)J
  .registers 10
  .line 129
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 130
    sget v2, Lcom/innioasis/ipp/Follow;->holds:I
    if-gtz v2, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->ticked(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L0
    goto :L4
  :L0
  .line 134
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v2
    const-wide/16 v3, 0
    if-nez v2, :L1
    return-wide v3
  :L1
  .line 135
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->stamp(Ljava/lang/Object;)J
    move-result-wide v5
  .line 136
    cmp-long p0, v5, v3
    if-nez p0, :L2
    return-wide v3
  :L2
  .line 137
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v7
    sub-long/2addr v0, v5
    sub-long/2addr v7, v0
  .line 138
    cmp-long p0, v7, v3
    if-lez p0, :L3
    move-wide v3, v7
  :L3
    return-wide v3
  :L4
  .line 131
    if-eqz p0, :L5
    sget-object v2, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { v0, v1 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v0
    invoke-virtual { v2, p0, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 132
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v0
    return-wide v0
.end method

.method public static hold(Z)V
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  .line 98
    if-eqz p0, :L1
  :L0
  .line 99
    sget p0, Lcom/innioasis/ipp/Follow;->holds:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Follow;->holds:I
  .line 100
    return-void
  :L1
  .line 102
    sget p0, Lcom/innioasis/ipp/Follow;->holds:I
    if-lez p0, :L2
    add-int/lit8 p0, p0, -1
    sput p0, Lcom/innioasis/ipp/Follow;->holds:I
  :L2
  .line 104
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  .line 105
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/view/View;
    move-result-object v0
  .line 106
    if-eqz p0, :L5
    if-eqz v0, :L5
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v1
    if-nez v1, :L3
    goto :L5
  :L3
  .line 107
    sget-object v1, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    invoke-static { v2, v3 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 108
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Follow;->arm(Landroid/view/View;Ljava/lang/Object;)V
  :L4
  .line 110
    goto :L7
  :L5
  .line 106
    return-void
  :L6
  .line 109
    move-exception p0
  :L7
  .line 111
    return-void
.end method

.method public static idleMs()J
  .registers 4
  .line 43
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "follow_idle"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 44
    if-ltz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Follow;->IDLES:[I
    array-length v1, v1
    if-lt v0, v1, :L1
  :L0
    const/4 v0, 5
  :L1
  .line 45
    sget-object v1, Lcom/innioasis/ipp/Follow;->IDLES:[I
    aget v0, v1, v0
    int-to-long v0, v0
    const-wide/16 v2, 1000
    mul-long v0, v0, v2
    return-wide v0
.end method

.method private static indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
  .registers 5
  .line 566
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-ge v0, v1, :L3
  .line 567
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  .line 568
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
  .line 569
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
  .line 566
    add-int/lit8 v0, v0, 1
    goto :L0
  :L3
  .line 571
    const/4 p0, -1
    return p0
.end method

.method public static land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 237
    if-eqz p0, :L4
    if-eqz p1, :L4
    if-gez p2, :L0
    goto :L4
  :L0
  .line 239
    invoke-static { p1 }, Lcom/innioasis/ipp/Follow;->leaveShuffleRow(Landroid/view/View;)V
  .line 240
    invoke-virtual { p0, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 241
    invoke-static { }, Lcom/innioasis/ipp/Follow;->stopLanding()V
  .line 242
    new-instance v0, Lcom/innioasis/ipp/Follow$Land;
    invoke-direct { v0, p0, p1, p2 }, Lcom/innioasis/ipp/Follow$Land;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  .line 243
    sput-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 244
    invoke-virtual { p1 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 246
    goto :L3
  :L2
  .line 245
    move-exception p0
  :L3
  .line 247
    return-void
  :L4
  .line 237
    return-void
.end method

.method private static leaveShuffleRow(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 558
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->shuffle(Landroid/view/View;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object p0
  .line 559
    if-eqz p0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v0
    if-eqz v0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onClockwise()V
  :L1
  .line 561
    goto :L3
  :L2
  .line 560
    move-exception p0
  :L3
  .line 562
    return-void
.end method

.method public static leftPlayer(Landroid/app/Activity;)V
  .registers 1
  .line 406
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
  .line 407
    return-void
.end method

.method static list()Landroid/view/View;
  .registers 3
  .line 594
    sget-object v0, Lcom/innioasis/ipp/Follow;->listRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 595
    instance-of v2, v0, Landroid/view/View;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Landroid/view/View;
  :L2
    return-object v1
.end method

.method private static moveTo(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  .registers 6
  .line 372
    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v0, :L0
    return-void
  :L0
  .line 374
    move-object v0, p1
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 375
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v2
    add-int/2addr v1, v2
  .line 376
    invoke-static { p1 }, Lcom/innioasis/ipp/Follow;->leaveShuffleRow(Landroid/view/View;)V
  .line 377
    invoke-virtual { p0, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 378
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    add-int/2addr p2, p0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-static { v0, v1, p2, p0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 379
    return-void
.end method

.method public static note(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/ViewGroup;)V
  .registers 7
  .line 59
    if-eqz p0, :L6
    invoke-static { p1 }, Lcom/innioasis/ipp/Lv;->is(Landroid/view/View;)Z
    move-result v0
    if-nez v0, :L0
    goto :L6
  :L0
  .line 60
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
  .line 61
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
  .line 62
    invoke-virtual { p1 }, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 63
    sget-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-eqz v4, :L5
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->tryPending(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  :L5
  .line 64
    invoke-static { p1 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 65
    return-void
  :L6
  .line 59
    return-void
.end method

.method public static onSongChanged()V
  .catchall { :L0 .. :L7 } :L10
  .registers 4
  :L0
  .line 213
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 214
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 215
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/view/View;
    move-result-object v1
  .line 216
    if-eqz v0, :L9
    if-nez v1, :L2
    goto :L9
  :L2
  .line 217
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->busy(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    return-void
  :L3
  .line 219
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L4
    return-void
  :L4
  .line 221
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v2
  .line 222
    if-nez v2, :L5
    return-void
  :L5
  .line 224
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v2
  .line 225
    if-ltz v2, :L8
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    if-ne v2, v3, :L6
    goto :L8
  :L6
  .line 226
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Follow;->moveTo(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  :L7
  .line 228
    goto :L11
  :L8
  .line 225
    return-void
  :L9
  .line 216
    return-void
  :L10
  .line 227
    move-exception v0
  :L11
  .line 229
    return-void
.end method

.method private static playingPath()Ljava/lang/String;
  .registers 2
  .line 580
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 581
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 583
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 584
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
  .line 456
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 457
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 458
    const/4 v0, 0
    const/4 v1, 0
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;Landroid/app/Activity;)V
  :L2
  .line 460
    goto :L4
  :L3
  .line 459
    move-exception p0
  :L4
  .line 461
    return-void
.end method

.method public static resumed(Ljava/lang/Object;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 4
  .line 415
    sget-boolean v0, Lcom/innioasis/ipp/Follow;->fromPlayer:Z
  .line 416
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Follow;->fromPlayer:Z
  .line 417
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v1
    if-nez v1, :L0
    return-void
  :L0
  .line 419
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    return-void
  :L1
  .line 420
    check-cast p0, Landroid/app/Activity;
  .line 421
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    if-nez v1, :L2
    return-void
  :L2
  .line 422
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Lv;->find(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
  .line 423
    if-nez v1, :L3
    return-void
  :L3
  .line 425
    const/4 v2, 0
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;Landroid/app/Activity;)V
  .line 426
    invoke-static { v1 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  .line 427
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L4
    return-void
  :L4
  .line 428
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 429
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L5
    return-void
  :L5
  .line 430
    new-instance v0, Lcom/innioasis/ipp/Follow$Jump;
    move-object v2, p0
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v0, p0, v1 }, Lcom/innioasis/ipp/Follow$Jump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
    invoke-virtual { v1, v0 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
  :L6
  .line 432
    goto :L8
  :L7
  .line 431
    move-exception p0
  :L8
  .line 433
    return-void
.end method

.method private static stamp(Ljava/lang/Object;)J
  .registers 3
  .line 86
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  :L1
  .line 87
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
  .line 253
    sget-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 254
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 255
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Follow$Land;->drop()V
  :L0
  .line 256
    return-void
.end method

.method private static ticked(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  .line 116
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return v0
  :L1
  .line 117
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  .line 118
    if-eqz p0, :L3
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result p0
  :L2
    if-nez p0, :L3
    const/4 v0, 1
  :L3
    return v0
  :L4
  .line 119
    move-exception p0
  .line 120
    return v0
.end method

.method public static toPlaying(Landroid/app/Activity;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 388
    if-eqz p0, :L7
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    if-nez v0, :L1
    goto :L7
  :L1
  .line 389
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->find(Landroid/view/View;)Landroid/view/View;
    move-result-object p0
  .line 390
    if-nez p0, :L2
    return-void
  :L2
  .line 391
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 392
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L3
    return-void
  :L3
  .line 393
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 394
    new-instance v1, Lcom/innioasis/ipp/Follow$Jump;
    move-object v2, v0
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v1, v0, p0 }, Lcom/innioasis/ipp/Follow$Jump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
    invoke-virtual { p0, v1 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
  :L4
  .line 396
    goto :L6
  :L5
  .line 395
    move-exception p0
  :L6
  .line 397
    return-void
  :L7
  .line 388
    return-void
.end method

.method public static touched(Landroid/view/View;Ljava/lang/Object;)V
  .registers 5
  .line 73
    if-nez p1, :L0
    return-void
  :L0
  .line 75
    invoke-static { }, Lcom/innioasis/ipp/Follow;->stopLanding()V
  .line 76
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-static { v1, v2 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v1
    invoke-virtual { v0, p1, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 77
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->arm(Landroid/view/View;Ljava/lang/Object;)V
  :L1
  .line 78
    return-void
.end method

.method private static tryPending(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .catchall { :L0 .. :L8 } :L10
  .registers 9
  .line 483
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
  .line 484
    sget-boolean v2, Lcom/innioasis/ipp/Follow;->pendingForce:Z
    if-nez v2, :L2
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v2
    if-nez v2, :L2
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    return-void
  :L2
  .line 485
    sget-object v2, Lcom/innioasis/ipp/Follow;->pendingFor:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L3
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-eq v2, p0, :L3
    return-void
  :L3
  .line 486
    sget-object v2, Lcom/innioasis/ipp/Follow;->pendingScreen:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L4
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { p1 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Follow;->activityOf(Landroid/content/Context;)Landroid/app/Activity;
    move-result-object v3
    if-eq v2, v3, :L4
  .line 487
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v2
    if-nez v2, :L4
    return-void
  :L4
  .line 488
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->busy(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L5
    return-void
  :L5
  .line 489
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L6
    return-void
  :L6
  .line 490
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v2
  .line 491
    if-eqz v2, :L9
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v2
    if-gez v2, :L7
    goto :L9
  :L7
  .line 492
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  .line 494
    invoke-virtual { p1 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v2
    new-instance v3, Lcom/innioasis/ipp/Follow$PreJump;
    invoke-direct { v3, p0, p1 }, Lcom/innioasis/ipp/Follow$PreJump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
    invoke-virtual { v2, v3 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L8
  .line 497
    goto :L11
  :L9
  .line 491
    return-void
  :L10
  .line 495
    move-exception p0
  .line 496
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  :L11
  .line 498
    return-void
.end method

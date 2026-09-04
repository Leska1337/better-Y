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

.field private static pendingUntil:J

.field private static watching:Lcom/innioasis/ipp/Follow$Land;

.method static constructor <clinit>()V
  .registers 1
  .line 81
    const/16 v0, 13
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Follow;->IDLES:[I
  .line 103
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
  .line 68
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;)J
  .registers 3
  .line 66
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->freeIn(Ljava/lang/Object;)J
    move-result-wide v0
    return-wide v0
.end method

.method static synthetic access$100(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  .registers 2
  .line 66
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->catchUp(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
    return-void
.end method

.method static synthetic access$200()Lcom/innioasis/ipp/Follow$Land;
  .registers 1
  .line 66
    sget-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
    return-object v0
.end method

.method static synthetic access$202(Lcom/innioasis/ipp/Follow$Land;)Lcom/innioasis/ipp/Follow$Land;
  .registers 1
  .line 66
    sput-object p0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
    return-object p0
.end method

.method static synthetic access$300()Ljava/lang/String;
  .registers 1
  .line 66
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$400(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
  .registers 2
  .line 66
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method static synthetic access$502(J)J
  .registers 2
  .line 66
    sput-wide p0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    return-wide p0
.end method

.method static adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 3
  .line 872
    sget-object v0, Lcom/innioasis/ipp/Follow;->adapterRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 873
    instance-of v2, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  :L2
    return-object v1
.end method

.method private static arm(Landroid/widget/ListView;Ljava/lang/Object;)V
  .registers 5
  .line 253
    if-nez p0, :L0
    return-void
  :L0
  .line 254
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
  .line 255
    new-instance v0, Lcom/innioasis/ipp/Follow$Idle;
    invoke-direct { v0, p1, p0 }, Lcom/innioasis/ipp/Follow$Idle;-><init>(Ljava/lang/Object;Landroid/widget/ListView;)V
  .line 256
    sput-object v0, Lcom/innioasis/ipp/Follow;->idle:Lcom/innioasis/ipp/Follow$Idle;
  .line 257
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v1
    invoke-virtual { p0, v0, v1, v2 }, Landroid/widget/ListView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 258
    return-void
.end method

.method public static armPending()V
  .registers 2
  .line 689
    const/4 v0, 1
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;)V
  .line 690
    return-void
.end method

.method private static armPending(ZLjava/lang/Object;)V
  .registers 9
  .line 715
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 716
    if-nez p0, :L0
    sget-wide v2, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-eqz v6, :L0
    cmp-long v4, v0, v2
    if-lez v4, :L3
  :L0
  .line 717
    sput-boolean p0, Lcom/innioasis/ipp/Follow;->pendingForce:Z
  .line 718
    if-nez p1, :L1
    const/4 p0, 0
    goto :L2
  :L1
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L2
    sput-object p0, Lcom/innioasis/ipp/Follow;->pendingFor:Ljava/lang/ref/WeakReference;
  :L3
  .line 720
    const-wide/16 p0, 5000
    add-long/2addr v0, p0
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  .line 721
    return-void
.end method

.method private static busy(Ljava/lang/Object;)Z
  .registers 5
  .line 238
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

.method private static catchUp(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  :L0
  .line 307
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 308
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L2
    return-void
  :L2
  .line 309
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v0
  .line 310
    if-nez v0, :L3
    return-void
  :L3
  .line 311
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v0
  .line 312
    if-ltz v0, :L6
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    if-ne v0, v1, :L4
    goto :L6
  :L4
  .line 313
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  :L5
  .line 316
    goto :L8
  :L6
  .line 312
    return-void
  :L7
  .line 314
    move-exception p0
  :L8
  .line 317
    return-void
.end method

.method private static enabled()Z
  .registers 2
  .line 857
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 858
    const-string v1, "follow_playing"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static findList(Landroid/view/View;)Landroid/widget/ListView;
  .registers 4
  .line 776
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    return-object p0
  :L0
  .line 777
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 778
    check-cast p0, Landroid/view/ViewGroup;
  .line 779
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L4
  .line 780
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Follow;->findList(Landroid/view/View;)Landroid/widget/ListView;
    move-result-object v2
  .line 781
    if-eqz v2, :L3
    return-object v2
  :L3
  .line 779
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 783
    return-object v1
.end method

.method private static free(Ljava/lang/Object;)V
  .registers 2
  .line 155
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 156
    return-void
.end method

.method private static freeIn(Ljava/lang/Object;)J
  .registers 10
  .line 224
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 225
    sget v2, Lcom/innioasis/ipp/Follow;->holds:I
    if-gtz v2, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->ticked(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L0
    goto :L4
  :L0
  .line 229
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v2
    const-wide/16 v3, 0
    if-nez v2, :L1
    return-wide v3
  :L1
  .line 230
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->stamp(Ljava/lang/Object;)J
    move-result-wide v5
  .line 231
    cmp-long p0, v5, v3
    if-nez p0, :L2
    return-wide v3
  :L2
  .line 232
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v7
    sub-long/2addr v0, v5
    sub-long/2addr v7, v0
  .line 233
    cmp-long p0, v7, v3
    if-lez p0, :L3
    move-wide v3, v7
  :L3
    return-wide v3
  :L4
  .line 226
    if-eqz p0, :L5
    sget-object v2, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { v0, v1 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v0
    invoke-virtual { v2, p0, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 227
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v0
    return-wide v0
.end method

.method public static hold(Z)V
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  .line 180
    if-eqz p0, :L1
  :L0
  .line 181
    sget p0, Lcom/innioasis/ipp/Follow;->holds:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Follow;->holds:I
  .line 182
    return-void
  :L1
  .line 184
    sget p0, Lcom/innioasis/ipp/Follow;->holds:I
    if-lez p0, :L2
    add-int/lit8 p0, p0, -1
    sput p0, Lcom/innioasis/ipp/Follow;->holds:I
  :L2
  .line 189
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  .line 190
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/widget/ListView;
    move-result-object v0
  .line 191
    if-eqz p0, :L5
    if-eqz v0, :L5
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v1
    if-nez v1, :L3
    goto :L5
  :L3
  .line 192
    sget-object v1, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    invoke-static { v2, v3 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 193
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Follow;->arm(Landroid/widget/ListView;Ljava/lang/Object;)V
  :L4
  .line 196
    goto :L7
  :L5
  .line 191
    return-void
  :L6
  .line 194
    move-exception p0
  :L7
  .line 197
    return-void
.end method

.method private static idleMs()J
  .registers 4
  .line 85
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "follow_idle"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 86
    if-ltz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Follow;->IDLES:[I
    array-length v1, v1
    if-lt v0, v1, :L1
  :L0
    const/4 v0, 5
  :L1
  .line 87
    sget-object v1, Lcom/innioasis/ipp/Follow;->IDLES:[I
    aget v0, v1, v0
    int-to-long v0, v0
    const-wide/16 v2, 1000
    mul-long v0, v0, v2
    return-wide v0
.end method

.method private static indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
  .registers 5
  .line 848
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-ge v0, v1, :L3
  .line 849
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  .line 850
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
  .line 851
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
  .line 848
    add-int/lit8 v0, v0, 1
    goto :L0
  :L3
  .line 853
    const/4 p0, -1
    return p0
.end method

.method public static land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 363
    if-eqz p0, :L4
    if-eqz p1, :L4
    if-gez p2, :L0
    goto :L4
  :L0
  .line 365
    invoke-static { p1 }, Lcom/innioasis/ipp/Follow;->leaveShuffleRow(Landroid/widget/ListView;)V
  .line 366
    invoke-virtual { p0, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 367
    invoke-static { }, Lcom/innioasis/ipp/Follow;->stopLanding()V
  .line 368
    new-instance v0, Lcom/innioasis/ipp/Follow$Land;
    invoke-direct { v0, p0, p1, p2 }, Lcom/innioasis/ipp/Follow$Land;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  .line 369
    sput-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 370
    invoke-virtual { p1 }, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 373
    goto :L3
  :L2
  .line 371
    move-exception p0
  :L3
  .line 374
    return-void
  :L4
  .line 363
    return-void
.end method

.method private static leaveShuffleRow(Landroid/widget/ListView;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 2
  :L0
  .line 829
    invoke-virtual { p0 }, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 830
    instance-of v0, p0, Landroid/view/View;
    if-nez v0, :L1
    return-void
  :L1
  .line 831
    check-cast p0, Landroid/view/View;
    const v0, 2131362396
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 832
    instance-of v0, p0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-nez v0, :L2
    return-void
  :L2
  .line 833
    check-cast p0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 834
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v0
    if-eqz v0, :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onClockwise()V
  :L3
  .line 837
    goto :L5
  :L4
  .line 835
    move-exception p0
  :L5
  .line 838
    return-void
.end method

.method public static leftPlayer(Landroid/app/Activity;)V
  .registers 1
  .line 622
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
  .line 623
    return-void
.end method

.method static list()Landroid/widget/ListView;
  .registers 3
  .line 877
    sget-object v0, Lcom/innioasis/ipp/Follow;->listRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 878
    instance-of v2, v0, Landroid/widget/ListView;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Landroid/widget/ListView;
  :L2
    return-object v1
.end method

.method private static moveTo(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  .registers 5
  .line 565
    invoke-virtual { p1 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
  .line 566
    invoke-virtual { p1 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result v1
  .line 567
    invoke-static { p1 }, Lcom/innioasis/ipp/Follow;->leaveShuffleRow(Landroid/widget/ListView;)V
  .line 568
    invoke-virtual { p0, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 569
    if-lt p2, v1, :L2
  .line 570
    sub-int/2addr p2, v1
    invoke-static { p1 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result p0
    invoke-static { p1, v0, p0 }, Lcom/innioasis/ipp/Wheel;->firstShown(Landroid/widget/ListView;II)I
    move-result p0
    add-int/2addr p2, p0
    add-int/lit8 p2, p2, 1
  .line 571
    invoke-static { p1 }, Lcom/innioasis/ipp/Head;->headerShowing(Landroid/widget/ListView;)Z
    move-result p0
    if-eqz p0, :L0
    add-int/lit8 p2, p2, -1
  :L0
  .line 572
    if-gez p2, :L1
    const/4 p2, 0
  :L1
  .line 573
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
    goto :L3
  :L2
  .line 574
    if-lt p2, v0, :L4
    invoke-static { p1, p2, v0 }, Lcom/innioasis/ipp/Wheel;->cutAtTop(Landroid/widget/ListView;II)Z
    move-result p0
    if-eqz p0, :L3
    goto :L4
  :L3
    goto :L5
  :L4
  .line 575
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  :L5
  .line 577
    return-void
.end method

.method public static note(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/ViewGroup;)V
  .registers 7
  .line 107
    if-eqz p0, :L6
    instance-of v0, p1, Landroid/widget/ListView;
    if-nez v0, :L0
    goto :L6
  :L0
  .line 108
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
  .line 109
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
  .line 113
    invoke-virtual { p1 }, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 114
    sget-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-eqz v4, :L5
    move-object v0, p1
    check-cast v0, Landroid/widget/ListView;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Follow;->tryPending(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  :L5
  .line 117
    invoke-static { p1 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 118
    return-void
  :L6
  .line 107
    return-void
.end method

.method public static onSongChanged()V
  .catchall { :L0 .. :L7 } :L10
  .registers 4
  :L0
  .line 329
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 330
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 331
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/widget/ListView;
    move-result-object v1
  .line 332
    if-eqz v0, :L9
    if-nez v1, :L2
    goto :L9
  :L2
  .line 333
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->busy(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    return-void
  :L3
  .line 337
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L4
    return-void
  :L4
  .line 339
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v2
  .line 340
    if-nez v2, :L5
    return-void
  :L5
  .line 342
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v2
  .line 343
    if-ltz v2, :L8
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    if-ne v2, v3, :L6
    goto :L8
  :L6
  .line 344
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Follow;->moveTo(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  :L7
  .line 347
    goto :L11
  :L8
  .line 343
    return-void
  :L9
  .line 332
    return-void
  :L10
  .line 345
    move-exception v0
  :L11
  .line 348
    return-void
.end method

.method private static playingPath()Ljava/lang/String;
  .registers 2
  .line 862
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 863
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 866
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 867
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
  .registers 2
  :L0
  .line 706
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 707
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 708
    const/4 v0, 0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;)V
  :L2
  .line 711
    goto :L4
  :L3
  .line 709
    move-exception p0
  :L4
  .line 712
    return-void
.end method

.method public static resumed(Ljava/lang/Object;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 3
  .line 640
    sget-boolean v0, Lcom/innioasis/ipp/Follow;->fromPlayer:Z
  .line 641
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Follow;->fromPlayer:Z
  .line 644
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v1
    if-nez v1, :L0
    return-void
  :L0
  .line 646
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    return-void
  :L1
  .line 647
    check-cast p0, Landroid/app/Activity;
  .line 648
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    if-nez v1, :L2
    return-void
  :L2
  .line 649
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->findList(Landroid/view/View;)Landroid/widget/ListView;
    move-result-object p0
  .line 650
    if-nez p0, :L3
    return-void
  :L3
  .line 657
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;)V
  .line 658
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 659
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L4
    return-void
  :L4
  .line 660
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 661
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L5
    return-void
  :L5
  .line 662
    new-instance v1, Lcom/innioasis/ipp/Follow$Jump;
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v1, v0, p0 }, Lcom/innioasis/ipp/Follow$Jump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  :L6
  .line 665
    goto :L8
  :L7
  .line 663
    move-exception p0
  :L8
  .line 666
    return-void
.end method

.method private static stamp(Ljava/lang/Object;)J
  .registers 3
  .line 159
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  :L1
  .line 160
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
  .line 384
    sget-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 385
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 386
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Follow$Land;->drop()V
  :L0
  .line 387
    return-void
.end method

.method private static ticked(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  .line 206
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return v0
  :L1
  .line 207
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  .line 208
    if-eqz p0, :L3
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result p0
  :L2
    if-nez p0, :L3
    const/4 v0, 1
  :L3
    return v0
  :L4
  .line 209
    move-exception p0
  .line 210
    return v0
.end method

.method public static toPlaying(Landroid/app/Activity;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 591
    if-eqz p0, :L7
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    if-nez v0, :L1
    goto :L7
  :L1
  .line 592
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->findList(Landroid/view/View;)Landroid/widget/ListView;
    move-result-object p0
  .line 593
    if-nez p0, :L2
    return-void
  :L2
  .line 594
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 595
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L3
    return-void
  :L3
  .line 596
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 597
    new-instance v1, Lcom/innioasis/ipp/Follow$Jump;
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v1, v0, p0 }, Lcom/innioasis/ipp/Follow$Jump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  :L4
  .line 600
    goto :L6
  :L5
  .line 598
    move-exception p0
  :L6
  .line 601
    return-void
  :L7
  .line 591
    return-void
.end method

.method public static touched(Landroid/widget/ListView;Ljava/lang/Object;)V
  .registers 5
  .line 138
    if-nez p1, :L0
    return-void
  :L0
  .line 145
    invoke-static { }, Lcom/innioasis/ipp/Follow;->stopLanding()V
  .line 146
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-static { v1, v2 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v1
    invoke-virtual { v0, p1, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 147
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->arm(Landroid/widget/ListView;Ljava/lang/Object;)V
  :L1
  .line 148
    return-void
.end method

.method private static tryPending(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  .catchall { :L0 .. :L7 } :L9
  .registers 9
  .line 725
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
  .line 726
    sget-boolean v2, Lcom/innioasis/ipp/Follow;->pendingForce:Z
    if-nez v2, :L2
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v2
    if-nez v2, :L2
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    return-void
  :L2
  .line 727
    sget-object v2, Lcom/innioasis/ipp/Follow;->pendingFor:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L3
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-eq v2, p0, :L3
    return-void
  :L3
  .line 728
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->busy(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L4
    return-void
  :L4
  .line 729
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L5
    return-void
  :L5
  .line 730
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v2
  .line 731
    if-eqz v2, :L8
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v2
    if-gez v2, :L6
    goto :L8
  :L6
  .line 732
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  .line 739
    invoke-virtual { p1 }, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v2
    new-instance v3, Lcom/innioasis/ipp/Follow$PreJump;
    invoke-direct { v3, p0, p1 }, Lcom/innioasis/ipp/Follow$PreJump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
    invoke-virtual { v2, v3 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L7
  .line 742
    goto :L10
  :L8
  .line 731
    return-void
  :L9
  .line 740
    move-exception p0
  .line 741
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  :L10
  .line 743
    return-void
.end method

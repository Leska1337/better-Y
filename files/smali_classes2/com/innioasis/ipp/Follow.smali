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
  .line 84
    const/16 v0, 13
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Follow;->IDLES:[I
  .line 106
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
  .line 71
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;)J
  .registers 3
  .line 69
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->freeIn(Ljava/lang/Object;)J
    move-result-wide v0
    return-wide v0
.end method

.method static synthetic access$100(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  .registers 2
  .line 69
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->catchUp(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
    return-void
.end method

.method static synthetic access$200()Lcom/innioasis/ipp/Follow$Land;
  .registers 1
  .line 69
    sget-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
    return-object v0
.end method

.method static synthetic access$202(Lcom/innioasis/ipp/Follow$Land;)Lcom/innioasis/ipp/Follow$Land;
  .registers 1
  .line 69
    sput-object p0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
    return-object p0
.end method

.method static synthetic access$300()Ljava/lang/String;
  .registers 1
  .line 69
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$400(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
  .registers 2
  .line 69
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method static synthetic access$502(J)J
  .registers 2
  .line 69
    sput-wide p0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    return-wide p0
.end method

.method static adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 3
  .line 875
    sget-object v0, Lcom/innioasis/ipp/Follow;->adapterRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 876
    instance-of v2, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  :L2
    return-object v1
.end method

.method private static arm(Landroid/widget/ListView;Ljava/lang/Object;)V
  .registers 5
  .line 256
    if-nez p0, :L0
    return-void
  :L0
  .line 257
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
  .line 258
    new-instance v0, Lcom/innioasis/ipp/Follow$Idle;
    invoke-direct { v0, p1, p0 }, Lcom/innioasis/ipp/Follow$Idle;-><init>(Ljava/lang/Object;Landroid/widget/ListView;)V
  .line 259
    sput-object v0, Lcom/innioasis/ipp/Follow;->idle:Lcom/innioasis/ipp/Follow$Idle;
  .line 260
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v1
    invoke-virtual { p0, v0, v1, v2 }, Landroid/widget/ListView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 261
    return-void
.end method

.method public static armPending()V
  .registers 2
  .line 692
    const/4 v0, 1
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;)V
  .line 693
    return-void
.end method

.method private static armPending(ZLjava/lang/Object;)V
  .registers 9
  .line 718
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 719
    if-nez p0, :L0
    sget-wide v2, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-eqz v6, :L0
    cmp-long v4, v0, v2
    if-lez v4, :L3
  :L0
  .line 720
    sput-boolean p0, Lcom/innioasis/ipp/Follow;->pendingForce:Z
  .line 721
    if-nez p1, :L1
    const/4 p0, 0
    goto :L2
  :L1
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L2
    sput-object p0, Lcom/innioasis/ipp/Follow;->pendingFor:Ljava/lang/ref/WeakReference;
  :L3
  .line 723
    const-wide/16 p0, 5000
    add-long/2addr v0, p0
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  .line 724
    return-void
.end method

.method private static busy(Ljava/lang/Object;)Z
  .registers 5
  .line 241
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
  .line 310
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 311
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L2
    return-void
  :L2
  .line 312
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v0
  .line 313
    if-nez v0, :L3
    return-void
  :L3
  .line 314
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v0
  .line 315
    if-ltz v0, :L6
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    if-ne v0, v1, :L4
    goto :L6
  :L4
  .line 316
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  :L5
  .line 319
    goto :L8
  :L6
  .line 315
    return-void
  :L7
  .line 317
    move-exception p0
  :L8
  .line 320
    return-void
.end method

.method private static enabled()Z
  .registers 2
  .line 860
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 861
    const-string v1, "follow_playing"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static findList(Landroid/view/View;)Landroid/widget/ListView;
  .registers 4
  .line 779
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    return-object p0
  :L0
  .line 780
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 781
    check-cast p0, Landroid/view/ViewGroup;
  .line 782
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L4
  .line 783
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Follow;->findList(Landroid/view/View;)Landroid/widget/ListView;
    move-result-object v2
  .line 784
    if-eqz v2, :L3
    return-object v2
  :L3
  .line 782
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 786
    return-object v1
.end method

.method private static free(Ljava/lang/Object;)V
  .registers 2
  .line 158
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 159
    return-void
.end method

.method private static freeIn(Ljava/lang/Object;)J
  .registers 10
  .line 227
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 228
    sget v2, Lcom/innioasis/ipp/Follow;->holds:I
    if-gtz v2, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->ticked(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L0
    goto :L4
  :L0
  .line 232
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v2
    const-wide/16 v3, 0
    if-nez v2, :L1
    return-wide v3
  :L1
  .line 233
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->stamp(Ljava/lang/Object;)J
    move-result-wide v5
  .line 234
    cmp-long p0, v5, v3
    if-nez p0, :L2
    return-wide v3
  :L2
  .line 235
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v7
    sub-long/2addr v0, v5
    sub-long/2addr v7, v0
  .line 236
    cmp-long p0, v7, v3
    if-lez p0, :L3
    move-wide v3, v7
  :L3
    return-wide v3
  :L4
  .line 229
    if-eqz p0, :L5
    sget-object v2, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { v0, v1 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v0
    invoke-virtual { v2, p0, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 230
    invoke-static { }, Lcom/innioasis/ipp/Follow;->idleMs()J
    move-result-wide v0
    return-wide v0
.end method

.method public static hold(Z)V
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  .line 183
    if-eqz p0, :L1
  :L0
  .line 184
    sget p0, Lcom/innioasis/ipp/Follow;->holds:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Follow;->holds:I
  .line 185
    return-void
  :L1
  .line 187
    sget p0, Lcom/innioasis/ipp/Follow;->holds:I
    if-lez p0, :L2
    add-int/lit8 p0, p0, -1
    sput p0, Lcom/innioasis/ipp/Follow;->holds:I
  :L2
  .line 192
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  .line 193
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/widget/ListView;
    move-result-object v0
  .line 194
    if-eqz p0, :L5
    if-eqz v0, :L5
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v1
    if-nez v1, :L3
    goto :L5
  :L3
  .line 195
    sget-object v1, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    invoke-static { v2, v3 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 196
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Follow;->arm(Landroid/widget/ListView;Ljava/lang/Object;)V
  :L4
  .line 199
    goto :L7
  :L5
  .line 194
    return-void
  :L6
  .line 197
    move-exception p0
  :L7
  .line 200
    return-void
.end method

.method private static idleMs()J
  .registers 4
  .line 88
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "follow_idle"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 89
    if-ltz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Follow;->IDLES:[I
    array-length v1, v1
    if-lt v0, v1, :L1
  :L0
    const/4 v0, 5
  :L1
  .line 90
    sget-object v1, Lcom/innioasis/ipp/Follow;->IDLES:[I
    aget v0, v1, v0
    int-to-long v0, v0
    const-wide/16 v2, 1000
    mul-long v0, v0, v2
    return-wide v0
.end method

.method private static indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
  .registers 5
  .line 851
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-ge v0, v1, :L3
  .line 852
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  .line 853
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
  .line 854
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
  .line 851
    add-int/lit8 v0, v0, 1
    goto :L0
  :L3
  .line 856
    const/4 p0, -1
    return p0
.end method

.method public static land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 366
    if-eqz p0, :L4
    if-eqz p1, :L4
    if-gez p2, :L0
    goto :L4
  :L0
  .line 368
    invoke-static { p1 }, Lcom/innioasis/ipp/Follow;->leaveShuffleRow(Landroid/widget/ListView;)V
  .line 369
    invoke-virtual { p0, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 370
    invoke-static { }, Lcom/innioasis/ipp/Follow;->stopLanding()V
  .line 371
    new-instance v0, Lcom/innioasis/ipp/Follow$Land;
    invoke-direct { v0, p0, p1, p2 }, Lcom/innioasis/ipp/Follow$Land;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  .line 372
    sput-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 373
    invoke-virtual { p1 }, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 376
    goto :L3
  :L2
  .line 374
    move-exception p0
  :L3
  .line 377
    return-void
  :L4
  .line 366
    return-void
.end method

.method private static leaveShuffleRow(Landroid/widget/ListView;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 2
  :L0
  .line 832
    invoke-virtual { p0 }, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 833
    instance-of v0, p0, Landroid/view/View;
    if-nez v0, :L1
    return-void
  :L1
  .line 834
    check-cast p0, Landroid/view/View;
    const v0, 2131362396
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 835
    instance-of v0, p0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-nez v0, :L2
    return-void
  :L2
  .line 836
    check-cast p0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 837
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v0
    if-eqz v0, :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onClockwise()V
  :L3
  .line 840
    goto :L5
  :L4
  .line 838
    move-exception p0
  :L5
  .line 841
    return-void
.end method

.method public static leftPlayer(Landroid/app/Activity;)V
  .registers 1
  .line 625
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
  .line 626
    return-void
.end method

.method static list()Landroid/widget/ListView;
  .registers 3
  .line 880
    sget-object v0, Lcom/innioasis/ipp/Follow;->listRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 881
    instance-of v2, v0, Landroid/widget/ListView;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Landroid/widget/ListView;
  :L2
    return-object v1
.end method

.method private static moveTo(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  .registers 5
  .line 568
    invoke-virtual { p1 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
  .line 569
    invoke-virtual { p1 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result v1
  .line 570
    invoke-static { p1 }, Lcom/innioasis/ipp/Follow;->leaveShuffleRow(Landroid/widget/ListView;)V
  .line 571
    invoke-virtual { p0, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 572
    if-lt p2, v1, :L2
  .line 573
    sub-int/2addr p2, v1
    invoke-static { p1 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result p0
    invoke-static { p1, v0, p0 }, Lcom/innioasis/ipp/Wheel;->firstShown(Landroid/widget/ListView;II)I
    move-result p0
    add-int/2addr p2, p0
    add-int/lit8 p2, p2, 1
  .line 574
    invoke-static { p1 }, Lcom/innioasis/ipp/Head;->headerShowing(Landroid/widget/ListView;)Z
    move-result p0
    if-eqz p0, :L0
    add-int/lit8 p2, p2, -1
  :L0
  .line 575
    if-gez p2, :L1
    const/4 p2, 0
  :L1
  .line 576
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
    goto :L3
  :L2
  .line 577
    if-lt p2, v0, :L4
    invoke-static { p1, p2, v0 }, Lcom/innioasis/ipp/Wheel;->cutAtTop(Landroid/widget/ListView;II)Z
    move-result p0
    if-eqz p0, :L3
    goto :L4
  :L3
    goto :L5
  :L4
  .line 578
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  :L5
  .line 580
    return-void
.end method

.method public static note(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/ViewGroup;)V
  .registers 7
  .line 110
    if-eqz p0, :L6
    instance-of v0, p1, Landroid/widget/ListView;
    if-nez v0, :L0
    goto :L6
  :L0
  .line 111
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
  .line 112
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
  .line 116
    invoke-virtual { p1 }, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 117
    sget-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-eqz v4, :L5
    move-object v0, p1
    check-cast v0, Landroid/widget/ListView;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Follow;->tryPending(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  :L5
  .line 120
    invoke-static { p1 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 121
    return-void
  :L6
  .line 110
    return-void
.end method

.method public static onSongChanged()V
  .catchall { :L0 .. :L7 } :L10
  .registers 4
  :L0
  .line 332
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 333
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 334
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/widget/ListView;
    move-result-object v1
  .line 335
    if-eqz v0, :L9
    if-nez v1, :L2
    goto :L9
  :L2
  .line 336
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->busy(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    return-void
  :L3
  .line 340
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L4
    return-void
  :L4
  .line 342
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v2
  .line 343
    if-nez v2, :L5
    return-void
  :L5
  .line 345
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v2
  .line 346
    if-ltz v2, :L8
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    if-ne v2, v3, :L6
    goto :L8
  :L6
  .line 347
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Follow;->moveTo(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  :L7
  .line 350
    goto :L11
  :L8
  .line 346
    return-void
  :L9
  .line 335
    return-void
  :L10
  .line 348
    move-exception v0
  :L11
  .line 351
    return-void
.end method

.method private static playingPath()Ljava/lang/String;
  .registers 2
  .line 865
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 866
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 869
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 870
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
  .line 709
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 710
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 711
    const/4 v0, 0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;)V
  :L2
  .line 714
    goto :L4
  :L3
  .line 712
    move-exception p0
  :L4
  .line 715
    return-void
.end method

.method public static resumed(Ljava/lang/Object;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 3
  .line 643
    sget-boolean v0, Lcom/innioasis/ipp/Follow;->fromPlayer:Z
  .line 644
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Follow;->fromPlayer:Z
  .line 647
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v1
    if-nez v1, :L0
    return-void
  :L0
  .line 649
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    return-void
  :L1
  .line 650
    check-cast p0, Landroid/app/Activity;
  .line 651
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    if-nez v1, :L2
    return-void
  :L2
  .line 652
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->findList(Landroid/view/View;)Landroid/widget/ListView;
    move-result-object p0
  .line 653
    if-nez p0, :L3
    return-void
  :L3
  .line 660
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Follow;->armPending(ZLjava/lang/Object;)V
  .line 661
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 662
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L4
    return-void
  :L4
  .line 663
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 664
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L5
    return-void
  :L5
  .line 665
    new-instance v1, Lcom/innioasis/ipp/Follow$Jump;
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v1, v0, p0 }, Lcom/innioasis/ipp/Follow$Jump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  :L6
  .line 668
    goto :L8
  :L7
  .line 666
    move-exception p0
  :L8
  .line 669
    return-void
.end method

.method private static stamp(Ljava/lang/Object;)J
  .registers 3
  .line 162
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  :L1
  .line 163
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
  .line 387
    sget-object v0, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 388
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Follow;->watching:Lcom/innioasis/ipp/Follow$Land;
  .line 389
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Follow$Land;->drop()V
  :L0
  .line 390
    return-void
.end method

.method private static ticked(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  .line 209
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return v0
  :L1
  .line 210
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  .line 211
    if-eqz p0, :L3
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result p0
  :L2
    if-nez p0, :L3
    const/4 v0, 1
  :L3
    return v0
  :L4
  .line 212
    move-exception p0
  .line 213
    return v0
.end method

.method public static toPlaying(Landroid/app/Activity;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 594
    if-eqz p0, :L7
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    if-nez v0, :L1
    goto :L7
  :L1
  .line 595
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->findList(Landroid/view/View;)Landroid/widget/ListView;
    move-result-object p0
  .line 596
    if-nez p0, :L2
    return-void
  :L2
  .line 597
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 598
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L3
    return-void
  :L3
  .line 599
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->free(Ljava/lang/Object;)V
  .line 600
    new-instance v1, Lcom/innioasis/ipp/Follow$Jump;
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-direct { v1, v0, p0 }, Lcom/innioasis/ipp/Follow$Jump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  :L4
  .line 603
    goto :L6
  :L5
  .line 601
    move-exception p0
  :L6
  .line 604
    return-void
  :L7
  .line 594
    return-void
.end method

.method public static touched(Landroid/widget/ListView;Ljava/lang/Object;)V
  .registers 5
  .line 141
    if-nez p1, :L0
    return-void
  :L0
  .line 148
    invoke-static { }, Lcom/innioasis/ipp/Follow;->stopLanding()V
  .line 149
    sget-object v0, Lcom/innioasis/ipp/Follow;->lastMove:Ljava/util/WeakHashMap;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-static { v1, v2 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v1
    invoke-virtual { v0, p1, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 150
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Follow;->arm(Landroid/widget/ListView;Ljava/lang/Object;)V
  :L1
  .line 151
    return-void
.end method

.method private static tryPending(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  .catchall { :L0 .. :L7 } :L9
  .registers 9
  .line 728
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
  .line 729
    sget-boolean v2, Lcom/innioasis/ipp/Follow;->pendingForce:Z
    if-nez v2, :L2
    invoke-static { }, Lcom/innioasis/ipp/Follow;->enabled()Z
    move-result v2
    if-nez v2, :L2
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
    return-void
  :L2
  .line 730
    sget-object v2, Lcom/innioasis/ipp/Follow;->pendingFor:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L3
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-eq v2, p0, :L3
    return-void
  :L3
  .line 731
    invoke-static { p0 }, Lcom/innioasis/ipp/Follow;->busy(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L4
    return-void
  :L4
  .line 732
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L5
    return-void
  :L5
  .line 733
    invoke-static { }, Lcom/innioasis/ipp/Follow;->playingPath()Ljava/lang/String;
    move-result-object v2
  .line 734
    if-eqz v2, :L8
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Follow;->indexOf(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v2
    if-gez v2, :L6
    goto :L8
  :L6
  .line 735
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  .line 742
    invoke-virtual { p1 }, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v2
    new-instance v3, Lcom/innioasis/ipp/Follow$PreJump;
    invoke-direct { v3, p0, p1 }, Lcom/innioasis/ipp/Follow$PreJump;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
    invoke-virtual { v2, v3 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L7
  .line 745
    goto :L10
  :L8
  .line 734
    return-void
  :L9
  .line 743
    move-exception p0
  .line 744
    sput-wide v0, Lcom/innioasis/ipp/Follow;->pendingUntil:J
  :L10
  .line 746
    return-void
.end method

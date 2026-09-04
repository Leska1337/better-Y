.class public final Lcom/innioasis/ipp/Status;
.super Ljava/lang/Object;
.source "Status.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Status$Hide;,
    Lcom/innioasis/ipp/Status$Settle;,
    Lcom/innioasis/ipp/Status$Bar;
  }
.end annotation

.field private final static BAR:Lcom/innioasis/ipp/Status$Bar;

.field private final static FLIGHT_MS:J = 1500L

.field private final static H:Landroid/os/Handler;

.field private final static HIDE:Lcom/innioasis/ipp/Status$Hide;

.field private final static NONE:I = 0

.field private final static PAUSE:I = 3

.field private final static SETTLE:Lcom/innioasis/ipp/Status$Settle;

.field private final static STEP_ASIDE_MS:J = 700L

.field private static firing:Z

.field private static flight:Z

.field private static hiding:Z

.field private static openedAt:J

.field private static pending:Z

.field private static pendingFrom:I

.field private static pendingState:I

.field private static posted:Z

.field private static stepped:Z

.method static constructor <clinit>()V
  .registers 2
  .line 45
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Status;->H:Landroid/os/Handler;
  .line 60
    new-instance v0, Lcom/innioasis/ipp/Status$Settle;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Status$Settle;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Status;->SETTLE:Lcom/innioasis/ipp/Status$Settle;
  .line 70
    const-wide/32 v0, -100000
    sput-wide v0, Lcom/innioasis/ipp/Status;->openedAt:J
  .line 149
    new-instance v0, Lcom/innioasis/ipp/Status$Bar;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Status$Bar;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Status;->BAR:Lcom/innioasis/ipp/Status$Bar;
  .line 180
    new-instance v0, Lcom/innioasis/ipp/Status$Hide;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Status$Hide;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Status;->HIDE:Lcom/innioasis/ipp/Status$Hide;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 43
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Z
  .registers 1
  .line 41
    sget-boolean v0, Lcom/innioasis/ipp/Status;->pending:Z
    return v0
.end method

.method static synthetic access$002(Z)Z
  .registers 1
  .line 41
    sput-boolean p0, Lcom/innioasis/ipp/Status;->pending:Z
    return p0
.end method

.method static synthetic access$1000()Z
  .registers 1
  .line 41
    sget-boolean v0, Lcom/innioasis/ipp/Status;->hiding:Z
    return v0
.end method

.method static synthetic access$1002(Z)Z
  .registers 1
  .line 41
    sput-boolean p0, Lcom/innioasis/ipp/Status;->hiding:Z
    return p0
.end method

.method static synthetic access$102(Z)Z
  .registers 1
  .line 41
    sput-boolean p0, Lcom/innioasis/ipp/Status;->flight:Z
    return p0
.end method

.method static synthetic access$1102(Z)Z
  .registers 1
  .line 41
    sput-boolean p0, Lcom/innioasis/ipp/Status;->stepped:Z
    return p0
.end method

.method static synthetic access$1200(Landroid/app/Activity;I)V
  .registers 2
  .line 41
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Status;->icon(Landroid/app/Activity;I)V
    return-void
.end method

.method static synthetic access$1300()I
  .registers 1
  .line 41
    invoke-static { }, Lcom/innioasis/ipp/Status;->stock()I
    move-result v0
    return v0
.end method

.method static synthetic access$202(Z)Z
  .registers 1
  .line 41
    sput-boolean p0, Lcom/innioasis/ipp/Status;->firing:Z
    return p0
.end method

.method static synthetic access$300()I
  .registers 1
  .line 41
    sget v0, Lcom/innioasis/ipp/Status;->pendingState:I
    return v0
.end method

.method static synthetic access$400()I
  .registers 1
  .line 41
    sget v0, Lcom/innioasis/ipp/Status;->pendingFrom:I
    return v0
.end method

.method static synthetic access$502(Z)Z
  .registers 1
  .line 41
    sput-boolean p0, Lcom/innioasis/ipp/Status;->posted:Z
    return p0
.end method

.method static synthetic access$600(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 2
  .line 41
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Status;->markerVisible(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$700()Z
  .registers 1
  .line 41
    invoke-static { }, Lcom/innioasis/ipp/Status;->justOpened()Z
    move-result v0
    return v0
.end method

.method static synthetic access$800()Lcom/innioasis/ipp/Status$Hide;
  .registers 1
  .line 41
    sget-object v0, Lcom/innioasis/ipp/Status;->HIDE:Lcom/innioasis/ipp/Status$Hide;
    return-object v0
.end method

.method static synthetic access$900()Landroid/os/Handler;
  .registers 1
  .line 41
    sget-object v0, Lcom/innioasis/ipp/Status;->H:Landroid/os/Handler;
    return-object v0
.end method

.method public static apply(Ljava/lang/Object;)V
  .registers 2
  .line 244
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Status;->step(Ljava/lang/Object;Z)V
  .line 245
    return-void
.end method

.method public static changed(Ljava/lang/Object;)V
  .registers 2
  .line 259
    sget-boolean v0, Lcom/innioasis/ipp/Status;->stepped:Z
    if-nez v0, :L1
    invoke-static { }, Lcom/innioasis/ipp/Status;->justOpened()Z
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
    const/4 v0, 0
    goto :L2
  :L1
    const/4 v0, 1
  :L2
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Status;->step(Ljava/lang/Object;Z)V
  .line 260
    return-void
.end method

.method public static check(Landroid/view/View;)V
  .registers 2
  .line 158
    sget-boolean v0, Lcom/innioasis/ipp/Status;->posted:Z
    if-nez v0, :L2
    if-nez p0, :L0
    goto :L2
  :L0
  .line 159
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Status;->posted:Z
  .line 160
    sget-object v0, Lcom/innioasis/ipp/Status;->BAR:Lcom/innioasis/ipp/Status$Bar;
    invoke-virtual { p0, v0 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    move-result p0
    if-nez p0, :L1
    const/4 p0, 0
    sput-boolean p0, Lcom/innioasis/ipp/Status;->posted:Z
  :L1
  .line 161
    return-void
  :L2
  .line 158
    return-void
.end method

.method public static defer(II)Z
  .registers 6
  .line 114
    sget-boolean v0, Lcom/innioasis/ipp/Status;->firing:Z
    const/4 v1, 0
    if-eqz v0, :L0
    return v1
  :L0
  .line 115
    const/4 v0, 3
    if-eq p0, v0, :L1
    if-eqz p0, :L1
  .line 116
    sget-object p0, Lcom/innioasis/ipp/Status;->H:Landroid/os/Handler;
    sget-object p1, Lcom/innioasis/ipp/Status;->SETTLE:Lcom/innioasis/ipp/Status$Settle;
    invoke-virtual { p0, p1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 117
    sput-boolean v1, Lcom/innioasis/ipp/Status;->pending:Z
  .line 118
    sput-boolean v1, Lcom/innioasis/ipp/Status;->flight:Z
  .line 119
    return v1
  :L1
  .line 121
    sget-boolean v0, Lcom/innioasis/ipp/Status;->flight:Z
    if-nez v0, :L2
    return v1
  :L2
  .line 122
    sget-object v0, Lcom/innioasis/ipp/Status;->H:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Status;->SETTLE:Lcom/innioasis/ipp/Status$Settle;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 123
    sput p0, Lcom/innioasis/ipp/Status;->pendingState:I
  .line 124
    sput p1, Lcom/innioasis/ipp/Status;->pendingFrom:I
  .line 125
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Status;->pending:Z
  .line 126
    const-wide/16 v2, 1500
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 127
    return p0
.end method

.method private static icon(Landroid/app/Activity;I)V
  .registers 3
  .line 294
    const v0, 2131362295
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 295
    if-eqz p0, :L0
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-eq v0, p1, :L0
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  :L0
  .line 296
    return-void
.end method

.method private static justOpened()Z
  .registers 5
  .line 94
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sget-wide v2, Lcom/innioasis/ipp/Status;->openedAt:J
    sub-long/2addr v0, v2
    const-wide/16 v2, 700
    cmp-long v4, v0, v2
    if-gez v4, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static markerVisible(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 9
  .line 308
    const/4 v0, 0
    if-eqz p1, :L16
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v1
    if-eq v1, p1, :L0
    goto/16 :L16
  :L0
  .line 309
    invoke-virtual { p0 }, Landroid/widget/ListView;->getVisibility()I
    move-result v1
    if-nez v1, :L15
    invoke-virtual { p0 }, Landroid/widget/ListView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v1
    if-nez v1, :L1
    goto :L15
  :L1
  .line 310
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 315
    const/4 v2, 0
    if-nez v1, :L2
    move-object v1, v2
    goto :L3
  :L2
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L3
  .line 316
    if-nez v1, :L4
    move-object v1, v2
    goto :L5
  :L4
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L5
  .line 317
    if-eqz v1, :L14
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Rows;->playMark(Ljava/lang/String;Ljava/lang/Object;)I
    move-result v3
    if-nez v3, :L6
    goto :L14
  :L6
  .line 318
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v3
  .line 319
    invoke-virtual { p0 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result p0
  .line 320
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v4
  .line 321
    const/4 v5, 1
    if-lt p0, v4, :L7
    add-int/lit8 p0, v4, -1
  :L7
  .line 322
    if-gez v3, :L8
    const/4 v3, 0
  :L8
    if-gt v3, p0, :L13
  .line 323
    invoke-virtual { p1, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v4
  .line 324
    instance-of v6, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v6, :L9
    check-cast v4, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    goto :L11
  :L9
  .line 325
    instance-of v6, v4, Ljava/io/File;
    if-eqz v6, :L10
    check-cast v4, Ljava/io/File;
    invoke-virtual { v4 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v4
    goto :L11
  :L10
    move-object v4, v2
  :L11
  .line 326
    invoke-virtual { v1, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L12
    return v5
  :L12
  .line 322
    add-int/lit8 v3, v3, 1
    goto :L8
  :L13
  .line 328
    return v0
  :L14
  .line 317
    return v0
  :L15
  .line 309
    return v0
  :L16
  .line 308
    return v0
.end method

.method public static playerOpening()V
  .registers 2
  .line 89
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Status;->flight:Z
  .line 90
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Status;->openedAt:J
  .line 91
    return-void
.end method

.method private static step(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  :L0
  .line 264
    instance-of v0, p0, Landroid/app/Activity;
    if-nez v0, :L1
    return-void
  :L1
  .line 265
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/widget/ListView;
    move-result-object v0
  .line 266
    if-eqz v0, :L6
    invoke-virtual { v0 }, Landroid/widget/ListView;->getContext()Landroid/content/Context;
    move-result-object v1
    if-eq v1, p0, :L2
    goto :L6
  :L2
  .line 267
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Status;->markerVisible(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result v0
    if-nez v0, :L3
    return-void
  :L3
  .line 268
    const/4 v0, 1
    if-eqz p1, :L4
  .line 269
    sget-object p1, Lcom/innioasis/ipp/Status;->H:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Status;->HIDE:Lcom/innioasis/ipp/Status$Hide;
    invoke-virtual { p1, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 270
    const/4 p1, 0
    sput-boolean p1, Lcom/innioasis/ipp/Status;->hiding:Z
  .line 271
    sput-boolean v0, Lcom/innioasis/ipp/Status;->stepped:Z
  .line 272
    check-cast p0, Landroid/app/Activity;
    const/16 p1, 8
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Status;->icon(Landroid/app/Activity;I)V
    goto :L5
  :L4
  .line 273
    sget-boolean p0, Lcom/innioasis/ipp/Status;->hiding:Z
    if-nez p0, :L5
  .line 274
    sput-boolean v0, Lcom/innioasis/ipp/Status;->hiding:Z
  .line 275
    sget-object p0, Lcom/innioasis/ipp/Status;->H:Landroid/os/Handler;
    sget-object p1, Lcom/innioasis/ipp/Status;->HIDE:Lcom/innioasis/ipp/Status$Hide;
    const-wide/16 v0, 700
    invoke-virtual { p0, p1, v0, v1 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L5
  .line 279
    goto :L8
  :L6
  .line 266
    return-void
  :L7
  .line 277
    move-exception p0
  :L8
  .line 280
    return-void
.end method

.method private static stock()I
  .catchall { :L0 .. :L1 } :L5
  .registers 3
  .line 285
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/utils/Static;->INSTANCE:Lcom/innioasis/y1/utils/Static;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/Static;->getPlayValue()Landroidx/lifecycle/LiveData;
    move-result-object v1
    invoke-virtual { v1 }, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;
    move-result-object v1
  .line 286
    instance-of v2, v1, Ljava/lang/Integer;
    if-eqz v2, :L2
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  :L1
    goto :L3
  :L2
    const/4 v1, 0
  :L3
  .line 287
    if-nez v1, :L4
    const/16 v0, 8
  :L4
    return v0
  :L5
  .line 288
    move-exception v1
  .line 289
    return v0
.end method

.method public static switching()V
  .registers 1
  .line 79
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Status;->flight:Z
  .line 80
    return-void
.end method

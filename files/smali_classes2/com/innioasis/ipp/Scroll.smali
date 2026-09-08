.class public final Lcom/innioasis/ipp/Scroll;
.super Ljava/lang/Object;
.source "Scroll.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Scroll$Tick;
  }
.end annotation

.field private final static GAP:Ljava/lang/String; = "     "

.field private final static IDLE:I = 1000

.field private final static LEAD:I = 38

.field private final static LIVE:Ljava/util/ArrayList;

.field private final static SETTLE:I = 1200

.field private final static STEP:I = 2

.field private final static TAG:I = 2131821013

.field private final static TICK:I = 40

.field private final static TICKER:Lcom/innioasis/ipp/Scroll$Tick;

.field private static clock:Landroid/os/Handler;

.field private static phase:I

.field private static settleUntil:J

.field private static ticking:Z

.field private doubled:Z

.field private fresh:Z

.field private hscroll:Z

.field private last:Ljava/lang/String;

.field private measured:Z

.field private period:I

.field private running:Z

.field private seen:Z

.field private shown:Ljava/lang/String;

.field private final tv:Landroid/widget/TextView;

.field private wasShown:Z

.field private x:I

.method static constructor <clinit>()V
  .registers 1
  .line 81
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
  .line 83
    new-instance v0, Lcom/innioasis/ipp/Scroll$Tick;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Scroll$Tick;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scroll;->TICKER:Lcom/innioasis/ipp/Scroll$Tick;
    return-void
.end method

.method public constructor <init>(Landroid/widget/TextView;)V
  .registers 2
  .line 227
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 228
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
  .line 229
    return-void
.end method

.method static synthetic access$000()Z
  .registers 1
  .line 46
    sget-boolean v0, Lcom/innioasis/ipp/Scroll;->ticking:Z
    return v0
.end method

.method static synthetic access$002(Z)Z
  .registers 1
  .line 46
    sput-boolean p0, Lcom/innioasis/ipp/Scroll;->ticking:Z
    return p0
.end method

.method static synthetic access$100()Ljava/util/ArrayList;
  .registers 1
  .line 46
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    return-object v0
.end method

.method static synthetic access$1000(Lcom/innioasis/ipp/Scroll;)V
  .registers 1
  .line 46
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->wrap()V
    return-void
.end method

.method static synthetic access$1100(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 46
    iget-boolean p0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    return p0
.end method

.method static synthetic access$1200(Lcom/innioasis/ipp/Scroll;)I
  .registers 1
  .line 46
    iget p0, p0, Lcom/innioasis/ipp/Scroll;->period:I
    return p0
.end method

.method static synthetic access$1300(Lcom/innioasis/ipp/Scroll;I)V
  .registers 2
  .line 46
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Scroll;->move(I)V
    return-void
.end method

.method static synthetic access$1400()Lcom/innioasis/ipp/Scroll$Tick;
  .registers 1
  .line 46
    sget-object v0, Lcom/innioasis/ipp/Scroll;->TICKER:Lcom/innioasis/ipp/Scroll$Tick;
    return-object v0
.end method

.method static synthetic access$1500()Landroid/os/Handler;
  .registers 1
  .line 46
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 46
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->dead()Z
    move-result p0
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/Scroll;)Landroid/widget/TextView;
  .registers 1
  .line 46
    iget-object p0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    return-object p0
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 46
    iget-boolean p0, p0, Lcom/innioasis/ipp/Scroll;->wasShown:Z
    return p0
.end method

.method static synthetic access$402(Lcom/innioasis/ipp/Scroll;Z)Z
  .registers 2
  .line 46
    iput-boolean p1, p0, Lcom/innioasis/ipp/Scroll;->wasShown:Z
    return p1
.end method

.method static synthetic access$500(Lcom/innioasis/ipp/Scroll;)V
  .registers 1
  .line 46
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->park()V
    return-void
.end method

.method static synthetic access$600(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 46
    iget-boolean p0, p0, Lcom/innioasis/ipp/Scroll;->fresh:Z
    return p0
.end method

.method static synthetic access$602(Lcom/innioasis/ipp/Scroll;Z)Z
  .registers 2
  .line 46
    iput-boolean p1, p0, Lcom/innioasis/ipp/Scroll;->fresh:Z
    return p1
.end method

.method static synthetic access$700()I
  .registers 1
  .line 46
    sget v0, Lcom/innioasis/ipp/Scroll;->phase:I
    return v0
.end method

.method static synthetic access$702(I)I
  .registers 1
  .line 46
    sput p0, Lcom/innioasis/ipp/Scroll;->phase:I
    return p0
.end method

.method static synthetic access$708()I
  .registers 2
  .line 46
    sget v0, Lcom/innioasis/ipp/Scroll;->phase:I
    add-int/lit8 v1, v0, 1
    sput v1, Lcom/innioasis/ipp/Scroll;->phase:I
    return v0
.end method

.method static synthetic access$800()J
  .registers 2
  .line 46
    sget-wide v0, Lcom/innioasis/ipp/Scroll;->settleUntil:J
    return-wide v0
.end method

.method static synthetic access$802(J)J
  .registers 2
  .line 46
    sput-wide p0, Lcom/innioasis/ipp/Scroll;->settleUntil:J
    return-wide p0
.end method

.method static synthetic access$900(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 46
    iget-boolean p0, p0, Lcom/innioasis/ipp/Scroll;->measured:Z
    return p0
.end method

.method private static at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
  .registers 2
  .line 193
    const v0, 2131821013
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;
    move-result-object p0
  .line 194
    instance-of v0, p0, Lcom/innioasis/ipp/Scroll;
    if-eqz v0, :L0
    check-cast p0, Lcom/innioasis/ipp/Scroll;
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return-object p0
.end method

.method private dead()Z
  .registers 5
  .line 388
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L0
  .line 389
    iput-boolean v2, p0, Lcom/innioasis/ipp/Scroll;->seen:Z
  .line 390
    return v1
  :L0
  .line 392
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->seen:Z
    if-nez v0, :L1
  .line 393
    return v1
  :L1
  .line 395
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const v1, 2131821013
    const/4 v3, 0
    invoke-virtual { v0, v1, v3 }, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V
  .line 396
    return v2
.end method

.method private holds(Ljava/lang/String;)Z
  .registers 3
  .line 233
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->running:Z
    if-eqz v0, :L2
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->shown:Ljava/lang/String;
    goto :L1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  :L1
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L2
    const/4 p1, 1
    goto :L3
  :L2
    const/4 p1, 0
  :L3
    return p1
.end method

.method private join()V
  .registers 7
  .line 346
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 347
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L0
  .line 348
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L0
  .line 350
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->isShown()Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L1
  .line 351
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Scroll;->phase:I
    goto :L2
  :L1
  .line 359
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->fresh:Z
  .line 360
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v0
    if-nez v0, :L2
  .line 361
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    const-wide/16 v4, 1200
    add-long/2addr v2, v4
    sput-wide v2, Lcom/innioasis/ipp/Scroll;->settleUntil:J
  :L2
  .line 364
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    if-nez v0, :L3
  .line 365
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct { v0, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
  :L3
  .line 367
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    sget-object v2, Lcom/innioasis/ipp/Scroll;->TICKER:Lcom/innioasis/ipp/Scroll$Tick;
    invoke-virtual { v0, v2 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 368
    sput-boolean v1, Lcom/innioasis/ipp/Scroll;->ticking:Z
  .line 369
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    const-wide/16 v3, 40
    invoke-virtual { v0, v2, v3, v4 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 370
    return-void
.end method

.method public static marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 119
    if-nez p0, :L0
  .line 120
    return-void
  :L0
  .line 123
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->of(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object v0
    if-nez p1, :L1
    const-string v1, ""
    goto :L2
  :L1
    move-object v1, p1
  :L2
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/Scroll;->apply(Ljava/lang/String;)V
  :L3
  .line 126
    goto :L5
  :L4
  .line 124
    move-exception v0
  .line 125
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L5
  .line 127
    return-void
.end method

.method private move(I)V
  .registers 5
  .line 448
    nop
  .line 449
    const/4 v0, 0
    const/16 v1, 38
    if-le p1, v1, :L0
    iget-boolean v2, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-eqz v2, :L0
  .line 450
    sub-int/2addr p1, v1
    mul-int/lit8 p1, p1, 2
  .line 451
    iget v1, p0, Lcom/innioasis/ipp/Scroll;->period:I
    if-ge p1, v1, :L0
  .line 452
    goto :L1
  :L0
  .line 455
    const/4 p1, 0
  :L1
    iget v1, p0, Lcom/innioasis/ipp/Scroll;->x:I
    if-eq p1, v1, :L2
  .line 456
    iput p1, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 457
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, p1, v0 }, Landroid/widget/TextView;->scrollTo(II)V
  :L2
  .line 459
    return-void
.end method

.method private static of(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
  .registers 3
  .line 198
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object v0
  .line 199
    if-nez v0, :L0
  .line 200
    new-instance v0, Lcom/innioasis/ipp/Scroll;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Scroll;-><init>(Landroid/widget/TextView;)V
  .line 201
    const v1, 2131821013
    invoke-virtual { p0, v1, v0 }, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V
  :L0
  .line 203
    return-object v0
.end method

.method private park()V
  .registers 3
  .line 463
    iget v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
    if-eqz v0, :L0
  .line 464
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 465
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0, v0 }, Landroid/widget/TextView;->scrollTo(II)V
  :L0
  .line 467
    return-void
.end method

.method private reset()V
  .registers 3
  .line 270
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->shown:Ljava/lang/String;
  .line 271
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
  .line 272
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->measured:Z
  .line 273
    iput v0, p0, Lcom/innioasis/ipp/Scroll;->period:I
  .line 274
    iget v1, p0, Lcom/innioasis/ipp/Scroll;->x:I
    if-eqz v1, :L0
  .line 275
    iput v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 276
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0, v0 }, Landroid/widget/TextView;->scrollTo(II)V
  :L0
  .line 278
    return-void
.end method

.method private rest()V
  .registers 3
  .line 313
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
  .line 314
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 315
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-eqz v0, :L1
  .line 316
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 317
    if-eqz v0, :L0
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->shown:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
  .line 318
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L0
  .line 320
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  :L1
  .line 322
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 323
    return-void
.end method

.method public static rowPlain(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 162
    if-nez p0, :L0
  .line 163
    return-void
  :L0
  .line 166
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object p0
  .line 167
    if-eqz p0, :L1
  .line 168
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->rest()V
  :L1
  .line 171
    goto :L3
  :L2
  .line 170
    move-exception p0
  :L3
  .line 172
    return-void
.end method

.method public static rowText(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 139
    if-nez p0, :L0
  .line 140
    return-void
  :L0
  .line 143
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 144
    if-nez v0, :L1
    const-string v0, ""
    goto :L2
  :L1
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 145
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object v1
  .line 146
    if-eqz v1, :L3
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Scroll;->holds(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L3
  .line 147
    return-void
  :L3
  .line 149
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->of(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object p0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Scroll;->take(Ljava/lang/String;)V
  :L4
  .line 151
    goto :L6
  :L5
  .line 150
    move-exception p0
  :L6
  .line 152
    return-void
.end method

.method private scrollable()V
  .registers 3
  .line 291
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getEllipsize()Landroid/text/TextUtils$TruncateAt;
    move-result-object v0
    if-eqz v0, :L0
  .line 292
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  :L0
  .line 294
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->hscroll:Z
    if-nez v0, :L1
  .line 295
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V
  .line 296
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->hscroll:Z
  :L1
  .line 298
    return-void
.end method

.method public static stopMarquee(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 180
    if-nez p0, :L0
  .line 181
    return-void
  :L0
  .line 184
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object p0
  .line 185
    if-eqz p0, :L1
  .line 186
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Scroll;->stop()V
  :L1
  .line 189
    goto :L3
  :L2
  .line 188
    move-exception p0
  :L3
  .line 190
    return-void
.end method

.method private take(Ljava/lang/String;)V
  .registers 2
  .line 249
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 250
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 251
    const/4 p1, 1
    iput-boolean p1, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 252
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->join()V
  .line 253
    return-void
.end method

.method private wrap()V
  .registers 6
  .line 420
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getWidth()I
    move-result v0
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getPaddingLeft()I
    move-result v1
    sub-int/2addr v0, v1
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getPaddingRight()I
    move-result v1
    sub-int/2addr v0, v1
  .line 421
    if-gtz v0, :L0
  .line 422
    return-void
  :L0
  .line 424
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->measured:Z
  .line 425
    iget-object v2, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    if-eqz v2, :L1
    goto :L2
  :L1
    const-string v2, ""
  :L2
  .line 426
    iget-object v3, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
  .line 427
    invoke-virtual { v3, v2 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v4
    int-to-float v0, v0
    cmpg-float v0, v4, v0
    if-gtz v0, :L3
  .line 428
    return-void
  :L3
  .line 430
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v4, "     "
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 431
    invoke-virtual { v3, v0 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v3
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 432
    if-ge v3, v1, :L4
  .line 433
    return-void
  :L4
  .line 435
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->scrollable()V
  .line 436
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->shown:Ljava/lang/String;
  .line 437
    iput v3, p0, Lcom/innioasis/ipp/Scroll;->period:I
  .line 438
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
  .line 439
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 440
    return-void
.end method

.method public apply(Ljava/lang/String;)V
  .registers 3
  .line 257
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
  .line 258
    return-void
  :L0
  .line 260
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 261
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 262
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->scrollable()V
  .line 263
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->setSingleLine()V
  .line 264
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 265
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 266
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->join()V
  .line 267
    return-void
.end method

.method public stop()V
  .registers 3
  .line 377
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
  .line 378
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 379
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    if-eqz v0, :L0
  .line 380
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L0
  .line 382
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 383
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 384
    return-void
.end method

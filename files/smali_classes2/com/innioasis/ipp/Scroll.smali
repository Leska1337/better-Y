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
  .line 47
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
  .line 49
    new-instance v0, Lcom/innioasis/ipp/Scroll$Tick;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Scroll$Tick;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scroll;->TICKER:Lcom/innioasis/ipp/Scroll$Tick;
    return-void
.end method

.method public constructor <init>(Landroid/widget/TextView;)V
  .registers 2
  .line 152
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 153
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
  .line 154
    return-void
.end method

.method static synthetic access$000()Z
  .registers 1
  .line 23
    sget-boolean v0, Lcom/innioasis/ipp/Scroll;->ticking:Z
    return v0
.end method

.method static synthetic access$002(Z)Z
  .registers 1
  .line 23
    sput-boolean p0, Lcom/innioasis/ipp/Scroll;->ticking:Z
    return p0
.end method

.method static synthetic access$100()Ljava/util/ArrayList;
  .registers 1
  .line 23
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    return-object v0
.end method

.method static synthetic access$1000(Lcom/innioasis/ipp/Scroll;)V
  .registers 1
  .line 23
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->wrap()V
    return-void
.end method

.method static synthetic access$1100(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 23
    iget-boolean p0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    return p0
.end method

.method static synthetic access$1200(Lcom/innioasis/ipp/Scroll;)I
  .registers 1
  .line 23
    iget p0, p0, Lcom/innioasis/ipp/Scroll;->period:I
    return p0
.end method

.method static synthetic access$1300(Lcom/innioasis/ipp/Scroll;I)V
  .registers 2
  .line 23
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Scroll;->move(I)V
    return-void
.end method

.method static synthetic access$1400()Lcom/innioasis/ipp/Scroll$Tick;
  .registers 1
  .line 23
    sget-object v0, Lcom/innioasis/ipp/Scroll;->TICKER:Lcom/innioasis/ipp/Scroll$Tick;
    return-object v0
.end method

.method static synthetic access$1500()Landroid/os/Handler;
  .registers 1
  .line 23
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 23
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->dead()Z
    move-result p0
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/Scroll;)Landroid/widget/TextView;
  .registers 1
  .line 23
    iget-object p0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    return-object p0
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 23
    iget-boolean p0, p0, Lcom/innioasis/ipp/Scroll;->wasShown:Z
    return p0
.end method

.method static synthetic access$402(Lcom/innioasis/ipp/Scroll;Z)Z
  .registers 2
  .line 23
    iput-boolean p1, p0, Lcom/innioasis/ipp/Scroll;->wasShown:Z
    return p1
.end method

.method static synthetic access$500(Lcom/innioasis/ipp/Scroll;)V
  .registers 1
  .line 23
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->park()V
    return-void
.end method

.method static synthetic access$600(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 23
    iget-boolean p0, p0, Lcom/innioasis/ipp/Scroll;->fresh:Z
    return p0
.end method

.method static synthetic access$602(Lcom/innioasis/ipp/Scroll;Z)Z
  .registers 2
  .line 23
    iput-boolean p1, p0, Lcom/innioasis/ipp/Scroll;->fresh:Z
    return p1
.end method

.method static synthetic access$700()I
  .registers 1
  .line 23
    sget v0, Lcom/innioasis/ipp/Scroll;->phase:I
    return v0
.end method

.method static synthetic access$702(I)I
  .registers 1
  .line 23
    sput p0, Lcom/innioasis/ipp/Scroll;->phase:I
    return p0
.end method

.method static synthetic access$708()I
  .registers 2
  .line 23
    sget v0, Lcom/innioasis/ipp/Scroll;->phase:I
    add-int/lit8 v1, v0, 1
    sput v1, Lcom/innioasis/ipp/Scroll;->phase:I
    return v0
.end method

.method static synthetic access$800()J
  .registers 2
  .line 23
    sget-wide v0, Lcom/innioasis/ipp/Scroll;->settleUntil:J
    return-wide v0
.end method

.method static synthetic access$802(J)J
  .registers 2
  .line 23
    sput-wide p0, Lcom/innioasis/ipp/Scroll;->settleUntil:J
    return-wide p0
.end method

.method static synthetic access$900(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 23
    iget-boolean p0, p0, Lcom/innioasis/ipp/Scroll;->measured:Z
    return p0
.end method

.method private static at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
  .registers 2
  .line 121
    const v0, 2131821013
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;
    move-result-object p0
  .line 122
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
  .line 275
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L0
  .line 276
    iput-boolean v2, p0, Lcom/innioasis/ipp/Scroll;->seen:Z
  .line 277
    return v1
  :L0
  .line 279
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->seen:Z
    if-nez v0, :L1
  .line 280
    return v1
  :L1
  .line 282
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const v1, 2131821013
    const/4 v3, 0
    invoke-virtual { v0, v1, v3 }, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V
  .line 283
    return v2
.end method

.method private holds(Ljava/lang/String;)Z
  .registers 3
  .line 157
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
  .line 241
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 242
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L0
  .line 243
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L0
  .line 245
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->isShown()Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L1
  .line 246
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Scroll;->phase:I
    goto :L2
  :L1
  .line 250
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->fresh:Z
  .line 251
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v0
    if-nez v0, :L2
  .line 252
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    const-wide/16 v4, 1200
    add-long/2addr v2, v4
    sput-wide v2, Lcom/innioasis/ipp/Scroll;->settleUntil:J
  :L2
  .line 255
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    if-nez v0, :L3
  .line 256
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct { v0, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
  :L3
  .line 258
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    sget-object v2, Lcom/innioasis/ipp/Scroll;->TICKER:Lcom/innioasis/ipp/Scroll$Tick;
    invoke-virtual { v0, v2 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 259
    sput-boolean v1, Lcom/innioasis/ipp/Scroll;->ticking:Z
  .line 260
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    const-wide/16 v3, 40
    invoke-virtual { v0, v2, v3, v4 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 261
    return-void
.end method

.method public static marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 65
    if-nez p0, :L0
  .line 66
    return-void
  :L0
  .line 69
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
  .line 72
    goto :L5
  :L4
  .line 70
    move-exception v0
  .line 71
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L5
  .line 73
    return-void
.end method

.method private move(I)V
  .registers 5
  .line 316
    nop
  .line 317
    const/4 v0, 0
    const/16 v1, 38
    if-le p1, v1, :L0
    iget-boolean v2, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-eqz v2, :L0
  .line 318
    sub-int/2addr p1, v1
    mul-int/lit8 p1, p1, 2
  .line 319
    iget v1, p0, Lcom/innioasis/ipp/Scroll;->period:I
    if-ge p1, v1, :L0
  .line 320
    goto :L1
  :L0
  .line 323
    const/4 p1, 0
  :L1
    iget v1, p0, Lcom/innioasis/ipp/Scroll;->x:I
    if-eq p1, v1, :L2
  .line 324
    iput p1, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 325
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, p1, v0 }, Landroid/widget/TextView;->scrollTo(II)V
  :L2
  .line 327
    return-void
.end method

.method private static of(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
  .registers 3
  .line 126
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object v0
  .line 127
    if-nez v0, :L0
  .line 128
    new-instance v0, Lcom/innioasis/ipp/Scroll;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Scroll;-><init>(Landroid/widget/TextView;)V
  .line 129
    const v1, 2131821013
    invoke-virtual { p0, v1, v0 }, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V
  :L0
  .line 131
    return-object v0
.end method

.method private park()V
  .registers 3
  .line 330
    iget v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
    if-eqz v0, :L0
  .line 331
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 332
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0, v0 }, Landroid/widget/TextView;->scrollTo(II)V
  :L0
  .line 334
    return-void
.end method

.method private reset()V
  .registers 3
  .line 194
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->shown:Ljava/lang/String;
  .line 195
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
  .line 196
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->measured:Z
  .line 197
    iput v0, p0, Lcom/innioasis/ipp/Scroll;->period:I
  .line 198
    iget v1, p0, Lcom/innioasis/ipp/Scroll;->x:I
    if-eqz v1, :L0
  .line 199
    iput v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 200
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0, v0 }, Landroid/widget/TextView;->scrollTo(II)V
  :L0
  .line 202
    return-void
.end method

.method private rest()V
  .registers 3
  .line 223
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
  .line 224
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 225
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-eqz v0, :L1
  .line 226
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 227
    if-eqz v0, :L0
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->shown:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
  .line 228
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L0
  .line 230
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  :L1
  .line 232
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 233
    return-void
.end method

.method public static rowPlain(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 94
    if-nez p0, :L0
  .line 95
    return-void
  :L0
  .line 98
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object p0
  .line 99
    if-eqz p0, :L1
  .line 100
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->rest()V
  :L1
  .line 103
    goto :L3
  :L2
  .line 102
    move-exception p0
  :L3
  .line 104
    return-void
.end method

.method public static rowText(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 77
    if-nez p0, :L0
  .line 78
    return-void
  :L0
  .line 81
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 82
    if-nez v0, :L1
    const-string v0, ""
    goto :L2
  :L1
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 83
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object v1
  .line 84
    if-eqz v1, :L3
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Scroll;->holds(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L3
  .line 85
    return-void
  :L3
  .line 87
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->of(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object p0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Scroll;->take(Ljava/lang/String;)V
  :L4
  .line 89
    goto :L6
  :L5
  .line 88
    move-exception p0
  :L6
  .line 90
    return-void
.end method

.method private scrollable()V
  .registers 3
  .line 209
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getEllipsize()Landroid/text/TextUtils$TruncateAt;
    move-result-object v0
    if-eqz v0, :L0
  .line 210
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  :L0
  .line 212
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->hscroll:Z
    if-nez v0, :L1
  .line 213
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V
  .line 214
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->hscroll:Z
  :L1
  .line 216
    return-void
.end method

.method private singleLine()V
  .registers 3
  .line 186
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getMaxLines()I
    move-result v0
    const/4 v1, 1
    if-ne v0, v1, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
  .line 187
    invoke-virtual { v0 }, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;
    move-result-object v0
    instance-of v0, v0, Landroid/text/method/SingleLineTransformationMethod;
    if-eqz v0, :L0
  .line 188
    return-void
  :L0
  .line 190
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->setSingleLine()V
  .line 191
    return-void
.end method

.method public static stopMarquee(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 108
    if-nez p0, :L0
  .line 109
    return-void
  :L0
  .line 112
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object p0
  .line 113
    if-eqz p0, :L1
  .line 114
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Scroll;->stop()V
  :L1
  .line 117
    goto :L3
  :L2
  .line 116
    move-exception p0
  :L3
  .line 118
    return-void
.end method

.method private take(Ljava/lang/String;)V
  .registers 2
  .line 165
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 166
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 167
    const/4 p1, 1
    iput-boolean p1, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 168
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->join()V
  .line 169
    return-void
.end method

.method private wrap()V
  .registers 6
  .line 292
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
  .line 293
    if-gtz v0, :L0
  .line 294
    return-void
  :L0
  .line 296
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->measured:Z
  .line 297
    iget-object v2, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    if-eqz v2, :L1
    goto :L2
  :L1
    const-string v2, ""
  :L2
  .line 298
    iget-object v3, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
  .line 299
    invoke-virtual { v3, v2 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v4
    int-to-float v0, v0
    cmpg-float v0, v4, v0
    if-gtz v0, :L3
  .line 300
    return-void
  :L3
  .line 302
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v4, "     "
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 303
    invoke-virtual { v3, v0 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v3
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 304
    if-ge v3, v1, :L4
  .line 305
    return-void
  :L4
  .line 307
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->scrollable()V
  .line 308
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->shown:Ljava/lang/String;
  .line 309
    iput v3, p0, Lcom/innioasis/ipp/Scroll;->period:I
  .line 310
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
  .line 311
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 312
    return-void
.end method

.method public apply(Ljava/lang/String;)V
  .registers 3
  .line 172
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
  .line 173
    return-void
  :L0
  .line 175
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 176
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 177
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->scrollable()V
  .line 178
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->singleLine()V
  .line 179
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 180
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 181
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->join()V
  .line 182
    return-void
.end method

.method public stop()V
  .registers 3
  .line 264
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
  .line 265
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 266
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    if-eqz v0, :L0
  .line 267
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L0
  .line 269
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 270
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 271
    return-void
.end method

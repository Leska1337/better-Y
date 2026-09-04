.class public final Lcom/innioasis/ipp/Scroll;
.super Ljava/lang/Object;
.source "Scroll.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Scroll$Tick;
  }
.end annotation

.field private final static IDLE:I = 1000

.field private final static LEAD:I = 38

.field private final static LIVE:Ljava/util/ArrayList;

.field private final static STEP:I = 2

.field private final static TAG:I = 2131821013

.field private final static TICK:I = 40

.field private final static TICKER:Lcom/innioasis/ipp/Scroll$Tick;

.field private static clock:Landroid/os/Handler;

.field private static phase:I

.field private static ticking:Z

.field private doubled:Z

.field private hscroll:Z

.field private last:Ljava/lang/String;

.field private measured:Z

.field private period:I

.field private running:Z

.field private seen:Z

.field private shown:Ljava/lang/String;

.field private final tv:Landroid/widget/TextView;

.field private x:I

.method static constructor <clinit>()V
  .registers 1
  .line 65
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
  .line 67
    new-instance v0, Lcom/innioasis/ipp/Scroll$Tick;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Scroll$Tick;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scroll;->TICKER:Lcom/innioasis/ipp/Scroll$Tick;
    return-void
.end method

.method public constructor <init>(Landroid/widget/TextView;)V
  .registers 2
  .line 184
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 185
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
  .line 186
    return-void
.end method

.method static synthetic access$000()Z
  .registers 1
  .line 40
    sget-boolean v0, Lcom/innioasis/ipp/Scroll;->ticking:Z
    return v0
.end method

.method static synthetic access$002(Z)Z
  .registers 1
  .line 40
    sput-boolean p0, Lcom/innioasis/ipp/Scroll;->ticking:Z
    return p0
.end method

.method static synthetic access$100()Ljava/util/ArrayList;
  .registers 1
  .line 40
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    return-object v0
.end method

.method static synthetic access$1000(Lcom/innioasis/ipp/Scroll;I)V
  .registers 2
  .line 40
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Scroll;->move(I)V
    return-void
.end method

.method static synthetic access$1100()Lcom/innioasis/ipp/Scroll$Tick;
  .registers 1
  .line 40
    sget-object v0, Lcom/innioasis/ipp/Scroll;->TICKER:Lcom/innioasis/ipp/Scroll$Tick;
    return-object v0
.end method

.method static synthetic access$1200()Landroid/os/Handler;
  .registers 1
  .line 40
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 40
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->dead()Z
    move-result p0
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/Scroll;)Landroid/widget/TextView;
  .registers 1
  .line 40
    iget-object p0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    return-object p0
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/Scroll;)V
  .registers 1
  .line 40
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->park()V
    return-void
.end method

.method static synthetic access$500()I
  .registers 1
  .line 40
    sget v0, Lcom/innioasis/ipp/Scroll;->phase:I
    return v0
.end method

.method static synthetic access$502(I)I
  .registers 1
  .line 40
    sput p0, Lcom/innioasis/ipp/Scroll;->phase:I
    return p0
.end method

.method static synthetic access$508()I
  .registers 2
  .line 40
    sget v0, Lcom/innioasis/ipp/Scroll;->phase:I
    add-int/lit8 v1, v0, 1
    sput v1, Lcom/innioasis/ipp/Scroll;->phase:I
    return v0
.end method

.method static synthetic access$600(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 40
    iget-boolean p0, p0, Lcom/innioasis/ipp/Scroll;->measured:Z
    return p0
.end method

.method static synthetic access$700(Lcom/innioasis/ipp/Scroll;)V
  .registers 1
  .line 40
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->wrap()V
    return-void
.end method

.method static synthetic access$800(Lcom/innioasis/ipp/Scroll;)Z
  .registers 1
  .line 40
    iget-boolean p0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    return p0
.end method

.method static synthetic access$900(Lcom/innioasis/ipp/Scroll;)I
  .registers 1
  .line 40
    iget p0, p0, Lcom/innioasis/ipp/Scroll;->period:I
    return p0
.end method

.method private static at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
  .registers 2
  .line 158
    const v0, 2131821013
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;
    move-result-object p0
  .line 159
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
  .line 322
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L0
  .line 323
    iput-boolean v2, p0, Lcom/innioasis/ipp/Scroll;->seen:Z
  .line 324
    return v1
  :L0
  .line 326
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->seen:Z
    if-nez v0, :L1
  .line 327
    return v1
  :L1
  .line 329
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const v1, 2131821013
    const/4 v3, 0
    invoke-virtual { v0, v1, v3 }, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V
  .line 330
    return v2
.end method

.method private holds(Ljava/lang/String;)Z
  .registers 3
  .line 190
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
  .registers 5
  .line 293
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 294
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L0
  .line 295
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L0
  .line 297
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Scroll;->phase:I
  .line 298
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    if-nez v0, :L1
  .line 299
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
  :L1
  .line 301
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Scroll;->TICKER:Lcom/innioasis/ipp/Scroll$Tick;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 302
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Scroll;->ticking:Z
  .line 303
    sget-object v0, Lcom/innioasis/ipp/Scroll;->clock:Landroid/os/Handler;
    const-wide/16 v2, 40
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 304
    return-void
.end method

.method public static marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 84
    if-nez p0, :L0
  .line 85
    return-void
  :L0
  .line 88
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
  .line 91
    goto :L5
  :L4
  .line 89
    move-exception v0
  .line 90
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L5
  .line 92
    return-void
.end method

.method private move(I)V
  .registers 5
  .line 367
    nop
  .line 368
    const/4 v0, 0
    const/16 v1, 38
    if-le p1, v1, :L0
    iget-boolean v2, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-eqz v2, :L0
  .line 369
    sub-int/2addr p1, v1
    mul-int/lit8 p1, p1, 2
  .line 370
    iget v1, p0, Lcom/innioasis/ipp/Scroll;->period:I
    if-le p1, v1, :L1
  .line 371
    move p1, v1
    goto :L1
  :L0
  .line 374
    const/4 p1, 0
  :L1
    iget v1, p0, Lcom/innioasis/ipp/Scroll;->x:I
    if-eq p1, v1, :L2
  .line 375
    iput p1, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 376
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, p1, v0 }, Landroid/widget/TextView;->scrollTo(II)V
  :L2
  .line 378
    return-void
.end method

.method private static of(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
  .registers 3
  .line 163
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object v0
  .line 164
    if-nez v0, :L0
  .line 165
    new-instance v0, Lcom/innioasis/ipp/Scroll;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Scroll;-><init>(Landroid/widget/TextView;)V
  .line 166
    const v1, 2131821013
    invoke-virtual { p0, v1, v0 }, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V
  :L0
  .line 168
    return-object v0
.end method

.method private park()V
  .registers 3
  .line 382
    iget v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
    if-eqz v0, :L0
  .line 383
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 384
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0, v0 }, Landroid/widget/TextView;->scrollTo(II)V
  :L0
  .line 386
    return-void
.end method

.method private reset()V
  .registers 3
  .line 227
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->shown:Ljava/lang/String;
  .line 228
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
  .line 229
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->measured:Z
  .line 230
    iput v0, p0, Lcom/innioasis/ipp/Scroll;->period:I
  .line 231
    iget v1, p0, Lcom/innioasis/ipp/Scroll;->x:I
    if-eqz v1, :L0
  .line 232
    iput v0, p0, Lcom/innioasis/ipp/Scroll;->x:I
  .line 233
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0, v0 }, Landroid/widget/TextView;->scrollTo(II)V
  :L0
  .line 235
    return-void
.end method

.method private rest()V
  .registers 3
  .line 270
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
  .line 271
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 272
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-eqz v0, :L1
  .line 273
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 274
    if-eqz v0, :L0
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->shown:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
  .line 275
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L0
  .line 277
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  :L1
  .line 279
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 280
    return-void
.end method

.method public static rowPlain(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 127
    if-nez p0, :L0
  .line 128
    return-void
  :L0
  .line 131
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object p0
  .line 132
    if-eqz p0, :L1
  .line 133
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->rest()V
  :L1
  .line 136
    goto :L3
  :L2
  .line 135
    move-exception p0
  :L3
  .line 137
    return-void
.end method

.method public static rowText(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 104
    if-nez p0, :L0
  .line 105
    return-void
  :L0
  .line 108
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 109
    if-nez v0, :L1
    const-string v0, ""
    goto :L2
  :L1
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 110
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object v1
  .line 111
    if-eqz v1, :L3
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Scroll;->holds(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L3
  .line 112
    return-void
  :L3
  .line 114
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->of(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object p0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Scroll;->take(Ljava/lang/String;)V
  :L4
  .line 116
    goto :L6
  :L5
  .line 115
    move-exception p0
  :L6
  .line 117
    return-void
.end method

.method private scrollable()V
  .registers 3
  .line 248
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getEllipsize()Landroid/text/TextUtils$TruncateAt;
    move-result-object v0
    if-eqz v0, :L0
  .line 249
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  :L0
  .line 251
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->hscroll:Z
    if-nez v0, :L1
  .line 252
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V
  .line 253
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->hscroll:Z
  :L1
  .line 255
    return-void
.end method

.method public static stopMarquee(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 145
    if-nez p0, :L0
  .line 146
    return-void
  :L0
  .line 149
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->at(Landroid/widget/TextView;)Lcom/innioasis/ipp/Scroll;
    move-result-object p0
  .line 150
    if-eqz p0, :L1
  .line 151
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Scroll;->stop()V
  :L1
  .line 154
    goto :L3
  :L2
  .line 153
    move-exception p0
  :L3
  .line 155
    return-void
.end method

.method private take(Ljava/lang/String;)V
  .registers 2
  .line 206
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 207
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 208
    const/4 p1, 1
    iput-boolean p1, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 209
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->join()V
  .line 210
    return-void
.end method

.method private wrap()V
  .registers 5
  .line 348
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
  .line 349
    if-gtz v0, :L0
  .line 350
    return-void
  :L0
  .line 352
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->measured:Z
  .line 353
    iget-object v2, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    if-eqz v2, :L1
    goto :L2
  :L1
    const-string v2, ""
  :L2
  .line 354
    iget-object v3, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    invoke-virtual { v3, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v3
    int-to-float v0, v0
    cmpg-float v0, v3, v0
    if-gtz v0, :L3
  .line 355
    return-void
  :L3
  .line 357
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->scrollable()V
  .line 358
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, "     "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 359
    iget-object v3, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v3 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v3
    float-to-int v3, v3
    add-int/2addr v3, v1
    iput v3, p0, Lcom/innioasis/ipp/Scroll;->period:I
  .line 360
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->shown:Ljava/lang/String;
  .line 361
    iput-boolean v1, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
  .line 362
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 363
    return-void
.end method

.method public apply(Ljava/lang/String;)V
  .registers 3
  .line 214
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
  .line 215
    return-void
  :L0
  .line 217
    iput-object p1, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 218
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 219
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->scrollable()V
  .line 220
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->setSingleLine()V
  .line 221
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 222
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 223
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->join()V
  .line 224
    return-void
.end method

.method public stop()V
  .registers 3
  .line 311
    sget-object v0, Lcom/innioasis/ipp/Scroll;->LIVE:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
  .line 312
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->running:Z
  .line 313
    iget-boolean v0, p0, Lcom/innioasis/ipp/Scroll;->doubled:Z
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
    if-eqz v0, :L0
  .line 314
    iget-object v1, p0, Lcom/innioasis/ipp/Scroll;->tv:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L0
  .line 316
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Scroll;->last:Ljava/lang/String;
  .line 317
    invoke-direct { p0 }, Lcom/innioasis/ipp/Scroll;->reset()V
  .line 318
    return-void
.end method

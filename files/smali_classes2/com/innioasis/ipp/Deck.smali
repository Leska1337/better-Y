.class public final Lcom/innioasis/ipp/Deck;
.super Ljava/lang/Object;
.source "Deck.java"

.field private final static AB_GAP:F = 5.0F

.field private final static HILITE:I = 1715273694

.field private final static ORDER_BOOK:[I

.field private final static ORDER_MUSIC:[I

.field private static abHaveA:Z

.field private static abLeft:F

.field private static abRight:F

.field static active:Z

.field static animAct:Lcom/innioasis/y1/base/BasePlayerActivity;

.field static animH:Landroid/os/Handler;

.field static animPhase:Z

.field static animR:Ljava/lang/Runnable;

.field static animRunning:Z

.field static focus:I

.field static lastAct:Ljava/lang/ref/WeakReference;

.method static constructor <clinit>()V
  .registers 3
  .line 44
    const/4 v0, 6
    new-array v1, v0, [I
    fill-array-data v1, :L0
    sput-object v1, Lcom/innioasis/ipp/Deck;->ORDER_MUSIC:[I
  .line 45
    new-array v0, v0, [I
    fill-array-data v0, :L1
    sput-object v0, Lcom/innioasis/ipp/Deck;->ORDER_BOOK:[I
  .line 51
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
  .line 52
    sput v0, Lcom/innioasis/ipp/Deck;->focus:I
  .line 53
    new-instance v1, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct { v1, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/Deck;->animH:Landroid/os/Handler;
  .line 54
    new-instance v1, Lcom/innioasis/ipp/DeckAnim;
    invoke-direct { v1 }, Lcom/innioasis/ipp/DeckAnim;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Deck;->animR:Ljava/lang/Runnable;
  .line 55
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->animPhase:Z
  .line 56
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->animRunning:Z
  .line 57
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Deck;->animAct:Lcom/innioasis/y1/base/BasePlayerActivity;
  .line 59
    sput-object v0, Lcom/innioasis/ipp/Deck;->lastAct:Ljava/lang/ref/WeakReference;
    return-void
  :L0
  .array-data 4
      0
      1
      2
      3
      4
      5
  .end array-data
  :L1
  .array-data 4
      8
      1
      2
      6
      7
      5
  .end array-data
.end method

.method public constructor <init>()V
  .registers 1
  .line 31
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static abAX(Landroid/view/View;Landroid/graphics/Paint;Ljava/lang/String;F)F
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 224
    invoke-virtual { p1, p2 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result p2
  .line 225
    invoke-virtual { p1 }, Landroid/graphics/Paint;->getTextSize()F
    move-result p1
    sub-float p1, p3, p1
    const/high16 v0, 0x40000000
    sub-float/2addr p1, v0
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Deck;->abFit(Landroid/view/View;FF)F
    move-result p0
  .line 226
    sput p0, Lcom/innioasis/ipp/Deck;->abLeft:F
  .line 227
    add-float/2addr p2, p0
    sput p2, Lcom/innioasis/ipp/Deck;->abRight:F
  .line 228
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Deck;->abHaveA:Z
  :L1
  .line 229
    return p0
  :L2
  .line 230
    move-exception p0
  .line 231
    const/4 p0, 0
    sput-boolean p0, Lcom/innioasis/ipp/Deck;->abHaveA:Z
  .line 232
    return p3
.end method

.method public static abBX(Landroid/view/View;Landroid/graphics/Paint;Ljava/lang/String;F)F
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  :L0
  .line 239
    invoke-virtual { p1, p2 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result p2
  .line 240
    invoke-virtual { p1 }, Landroid/graphics/Paint;->getTextSize()F
    move-result p1
    sub-float p1, p3, p1
    const/high16 v0, 0x40000000
    sub-float/2addr p1, v0
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Deck;->abFit(Landroid/view/View;FF)F
    move-result p1
  .line 243
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->abHaveA:Z
  .line 244
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Deck;->abHaveA:Z
  .line 245
    if-eqz v0, :L4
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Deck;->abHits(FF)Z
    move-result v0
    if-nez v0, :L1
    goto :L4
  :L1
  .line 246
    const/high16 p1, 0x40A00000
    add-float v0, p3, p1
    invoke-static { p0, v0, p2 }, Lcom/innioasis/ipp/Deck;->abFit(Landroid/view/View;FF)F
    move-result v0
  .line 247
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Deck;->abHits(FF)Z
    move-result v1
    if-nez v1, :L2
    return v0
  :L2
  .line 248
    sget v0, Lcom/innioasis/ipp/Deck;->abRight:F
    add-float/2addr v0, p1
    invoke-static { p0, v0, p2 }, Lcom/innioasis/ipp/Deck;->abFit(Landroid/view/View;FF)F
    move-result p0
  :L3
    return p0
  :L4
  .line 245
    return p1
  :L5
  .line 249
    move-exception p0
  .line 250
    return p3
.end method

.method private static abFit(Landroid/view/View;FF)F
  .registers 4
  .line 260
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result p0
  :L1
  .line 261
    if-lez p0, :L2
    add-float v0, p1, p2
    int-to-float p0, p0
    cmpl-float v0, v0, p0
    if-lez v0, :L2
    sub-float p1, p0, p2
  :L2
  .line 262
    const/4 p0, 0
    cmpg-float p2, p1, p0
    if-gez p2, :L3
    const/4 p1, 0
  :L3
    return p1
.end method

.method private static abHits(FF)Z
  .registers 4
  .line 256
    add-float/2addr p1, p0
    sget v0, Lcom/innioasis/ipp/Deck;->abLeft:F
    const/high16 v1, 0x40A00000
    sub-float/2addr v0, v1
    cmpl-float p1, p1, v0
    if-lez p1, :L0
    sget p1, Lcom/innioasis/ipp/Deck;->abRight:F
    add-float/2addr p1, v1
    cmpg-float p0, p0, p1
    if-gez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static abState(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 8
  .line 189
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p0
  .line 190
    const-wide/16 v0, -1
    if-eqz p0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getAPoint()J
    move-result-wide v2
    goto :L1
  :L0
    move-wide v2, v0
  :L1
  .line 191
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-gez v6, :L2
    const/4 p0, 0
    return p0
  :L2
  .line 192
    if-eqz p0, :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getBPoint()J
    move-result-wide v0
  :L3
  .line 193
    cmp-long p0, v0, v4
    if-gez p0, :L4
    const/4 p0, 1
    goto :L5
  :L4
    const/4 p0, 2
  :L5
    return p0
.end method

.method public static animTick()V
  .registers 4
  .line 300
    sget-object v0, Lcom/innioasis/ipp/Deck;->animAct:Lcom/innioasis/y1/base/BasePlayerActivity;
  .line 301
    const/4 v1, 0
    if-nez v0, :L0
  .line 302
    sput-boolean v1, Lcom/innioasis/ipp/Deck;->animRunning:Z
  .line 303
    return-void
  :L0
  .line 305
    invoke-static { v0 }, Lcom/innioasis/ipp/Deck;->abState(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v2
    if-nez v2, :L1
  .line 306
    sput-boolean v1, Lcom/innioasis/ipp/Deck;->animRunning:Z
  .line 307
    invoke-static { v0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
    goto :L2
  :L1
  .line 309
    sget-boolean v1, Lcom/innioasis/ipp/Deck;->animPhase:Z
    xor-int/lit8 v1, v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Deck;->animPhase:Z
  .line 310
    invoke-static { v0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 311
    sget-object v0, Lcom/innioasis/ipp/Deck;->animH:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Deck;->animR:Ljava/lang/Runnable;
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L2
  .line 313
    return-void
.end method

.method private static appCtx()Landroid/content/Context;
  .registers 1
  .line 62
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    return-object v0
.end method

.method private static apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .registers 6
  .line 390
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->iv(Lcom/innioasis/y1/base/BasePlayerActivity;I)Landroid/widget/ImageView;
    move-result-object p0
  .line 391
    if-nez p0, :L0
    return-void
  :L0
  .line 392
    const/4 p1, 0
    if-nez p3, :L1
  .line 393
    const/16 p2, 8
    invoke-virtual { p0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 394
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->hl(Landroid/widget/ImageView;Z)V
    goto :L3
  :L1
  .line 396
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 397
    if-eqz p4, :L2
  .line 400
    invoke-static { p0, p4, p5 }, Lcom/innioasis/ipp/Icons;->apply(Landroid/widget/ImageView;II)V
  :L2
  .line 402
    invoke-static { p2 }, Lcom/innioasis/ipp/Deck;->focused(I)Z
    move-result p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->hl(Landroid/widget/ImageView;Z)V
  :L3
  .line 404
    return-void
.end method

.method public static back(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
  .registers 4
  .line 545
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->abState(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v0
    const/4 v1, 1
    if-ne v0, v1, :L0
  .line 546
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippCancelAB()V
  .line 547
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 548
    return v1
  :L0
  .line 550
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippLyricOpen()Z
    move-result v0
    if-eqz v0, :L1
  .line 551
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippToggleLyric()V
  .line 552
    return v1
  :L1
  .line 554
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
    const/4 v2, 0
    if-nez v0, :L2
    return v2
  :L2
  .line 555
    sput-boolean v2, Lcom/innioasis/ipp/Deck;->active:Z
  .line 556
    sput v2, Lcom/innioasis/ipp/Deck;->focus:I
  .line 557
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 558
    return v1
.end method

.method private static book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
  .registers 1
  .line 101
    instance-of p0, p0, Lcom/innioasis/y1/activity/AudioPlayerActivity;
    return p0
.end method

.method private static curLiked()Z
  .registers 1
  .line 76
    invoke-static { }, Lcom/innioasis/ipp/Deck;->curPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Likes;->get(Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static curPath()Ljava/lang/String;
  .registers 2
  .line 66
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 67
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 68
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 69
    if-nez v0, :L1
    return-object v1
  :L1
  .line 70
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private static cycleRepeat(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 4
  .line 150
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 151
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->repeatMode(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v1
  .line 152
    const/4 v2, 2
    if-nez v1, :L0
    goto :L2
  :L0
    if-ne v1, v2, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 153
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result p0
    if-eqz p0, :L3
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setAudiobookRepeatMode(I)V
    goto :L4
  :L3
  .line 154
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setMusicRepeatMode(I)V
  :L4
  .line 155
    return-void
.end method

.method public static enter(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 4
  .line 466
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippLyricOpen()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 467
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
    const/4 v1, 1
    if-nez v0, :L1
  .line 468
    sput-boolean v1, Lcom/innioasis/ipp/Deck;->active:Z
  .line 469
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->firstVisible(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v0
    sput v0, Lcom/innioasis/ipp/Deck;->focus:I
  .line 470
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 471
    return-void
  :L1
  .line 473
    sget v0, Lcom/innioasis/ipp/Deck;->focus:I
  .line 474
    const/16 v2, 8
    if-ne v0, v2, :L2
  .line 475
    invoke-static { p0 }, Lcom/innioasis/ipp/Audio;->addBookmark(Landroid/app/Activity;)V
    goto :L10
  :L2
  .line 476
    const/4 v2, 6
    if-ne v0, v2, :L3
  .line 477
    invoke-static { }, Lcom/innioasis/ipp/Audio;->cycleRate()V
    goto :L10
  :L3
  .line 478
    const/4 v2, 7
    if-ne v0, v2, :L4
  .line 479
    invoke-static { }, Lcom/innioasis/ipp/Audio;->cycleTimer()V
    goto :L10
  :L4
  .line 480
    if-nez v0, :L5
  .line 481
    invoke-static { }, Lcom/innioasis/ipp/Deck;->toggleLike()V
    goto :L10
  :L5
  .line 482
    if-ne v0, v1, :L6
  .line 483
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->toggleShuffle(Lcom/innioasis/y1/base/BasePlayerActivity;)V
    goto :L10
  :L6
  .line 484
    const/4 v1, 2
    if-ne v0, v1, :L7
  .line 485
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->cycleRepeat(Lcom/innioasis/y1/base/BasePlayerActivity;)V
    goto :L10
  :L7
  .line 486
    const/4 v1, 3
    const/4 v2, 0
    if-ne v0, v1, :L8
  .line 487
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippToggleLyric()V
  .line 488
    sput-boolean v2, Lcom/innioasis/ipp/Deck;->active:Z
    goto :L10
  :L8
  .line 489
    const/4 v1, 4
    if-ne v0, v1, :L9
  .line 490
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippToggleAB()V
    goto :L10
  :L9
  .line 491
    const/4 v1, 5
    if-ne v0, v1, :L10
  .line 492
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->openQueue(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 493
    sput-boolean v2, Lcom/innioasis/ipp/Deck;->active:Z
  :L10
  .line 495
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 496
    return-void
.end method

.method private static firstVisible(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 5
  .line 373
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->order(Lcom/innioasis/y1/base/BasePlayerActivity;)[I
    move-result-object v0
  .line 374
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, v0
    if-ge v2, v3, :L2
  .line 375
    aget v3, v0, v2
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Deck;->visible(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
    move-result v3
    if-eqz v3, :L1
    aget p0, v0, v2
    return p0
  :L1
  .line 374
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 377
    return v1
.end method

.method private static focused(I)Z
  .registers 2
  .line 351
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
    if-eqz v0, :L0
    sget v0, Lcom/innioasis/ipp/Deck;->focus:I
    if-ne v0, p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static heartHidden()Z
  .registers 3
  .line 158
    invoke-static { }, Lcom/innioasis/ipp/Deck;->appCtx()Landroid/content/Context;
    move-result-object v0
  .line 159
    const/4 v1, 1
    if-nez v0, :L0
    return v1
  :L0
  .line 160
    const-string v2, "likes"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    xor-int/2addr v0, v1
    return v0
.end method

.method private static heartShow()Z
  .registers 1
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/Deck;->heartHidden()Z
    move-result v0
    xor-int/lit8 v0, v0, 1
    return v0
.end method

.method private static hl(Landroid/widget/ImageView;Z)V
  .registers 2
  .line 346
    if-nez p0, :L0
    return-void
  :L0
  .line 347
    if-eqz p1, :L1
    const p1, 1715273694
    goto :L2
  :L1
    const/4 p1, 0
  :L2
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setBackgroundColor(I)V
  .line 348
    return-void
.end method

.method private static iconAb(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 4
  .line 279
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->abState(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result p0
  .line 280
    const v0, 2131623992
    if-nez p0, :L0
    return v0
  :L0
  .line 281
    const/4 v1, 1
    const v2, 2131623991
    if-ne p0, v1, :L2
    sget-boolean p0, Lcom/innioasis/ipp/Deck;->animPhase:Z
    if-eqz p0, :L1
    const v2, 2131623993
  :L1
    return v2
  :L2
  .line 282
    sget-boolean p0, Lcom/innioasis/ipp/Deck;->animPhase:Z
    if-eqz p0, :L3
    goto :L4
  :L3
    const v0, 2131623991
  :L4
    return v0
.end method

.method private static iconHeart()I
  .registers 1
  .line 266
    invoke-static { }, Lcom/innioasis/ipp/Deck;->curLiked()Z
    move-result v0
    if-eqz v0, :L0
    const v0, 2131623988
    goto :L1
  :L0
    const v0, 2131623987
  :L1
    return v0
.end method

.method private static iconRepeat(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 2
  .line 274
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->repeatMode(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result p0
  .line 275
    if-nez p0, :L0
    const p0, 2131623974
    goto :L2
  :L0
    const/4 v0, 1
    if-ne p0, v0, :L1
    const p0, 2131623977
    goto :L2
  :L1
    const p0, 2131623976
  :L2
    return p0
.end method

.method private static iconRepeatOrAb(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 3
  .line 316
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result v0
    if-nez v0, :L1
    invoke-static { }, Lcom/innioasis/ipp/Deck;->topHold()I
    move-result v0
    const/4 v1, 2
    if-ne v0, v1, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->abState(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 317
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->iconAb(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result p0
    return p0
  :L1
  .line 316
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->iconRepeat(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result p0
    return p0
.end method

.method private static iconShuffle(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 1
  .line 270
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->shuffleOn(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result p0
    if-eqz p0, :L0
    const p0, 2131623978
    goto :L1
  :L0
    const p0, 2131623975
  :L1
    return p0
.end method

.method private static iv(Lcom/innioasis/y1/base/BasePlayerActivity;I)Landroid/widget/ImageView;
  .registers 2
  .line 323
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 324
    instance-of p1, p0, Landroid/widget/ImageView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/ImageView;
    return-object p0
  :L0
  .line 325
    const/4 p0, 0
    return-object p0
.end method

.method private static label(Lcom/innioasis/y1/base/BasePlayerActivity;IIZIILjava/lang/String;Ljava/lang/String;)V
  .registers 8
  .line 412
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->iv(Lcom/innioasis/y1/base/BasePlayerActivity;I)Landroid/widget/ImageView;
    move-result-object p0
  .line 413
    if-nez p0, :L0
    return-void
  :L0
  .line 414
    const/4 p1, 0
    if-nez p3, :L1
  .line 415
    const/16 p2, 8
    invoke-virtual { p0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 416
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->hl(Landroid/widget/ImageView;Z)V
  .line 417
    return-void
  :L1
  .line 419
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 422
    if-nez p4, :L2
    invoke-static { p0, p6, p7, p5 }, Lcom/innioasis/ipp/Icons;->value(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;I)V
    goto :L3
  :L2
  .line 423
    invoke-static { p0, p4, p5, p6 }, Lcom/innioasis/ipp/Icons;->label(Landroid/widget/ImageView;IILjava/lang/String;)V
  :L3
  .line 424
    invoke-static { p2 }, Lcom/innioasis/ipp/Deck;->focused(I)Z
    move-result p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->hl(Landroid/widget/ImageView;Z)V
  .line 425
    return-void
.end method

.method public static openQueue(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 3
  .line 505
    if-nez p0, :L0
    return-void
  :L0
  .line 506
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
  .line 507
    sput v0, Lcom/innioasis/ipp/Deck;->focus:I
  .line 508
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 509
    nop
  .line 510
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 511
    return-void
.end method

.method private static order(Lcom/innioasis/y1/base/BasePlayerActivity;)[I
  .registers 1
  .line 48
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result p0
    if-eqz p0, :L0
    sget-object p0, Lcom/innioasis/ipp/Deck;->ORDER_BOOK:[I
    goto :L1
  :L0
    sget-object p0, Lcom/innioasis/ipp/Deck;->ORDER_MUSIC:[I
  :L1
    return-object p0
.end method

.method private static posOf(Lcom/innioasis/y1/base/BasePlayerActivity;I)I
  .registers 4
  .line 382
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->order(Lcom/innioasis/y1/base/BasePlayerActivity;)[I
    move-result-object p0
  .line 383
    const/4 v0, 0
  :L0
    array-length v1, p0
    if-ge v0, v1, :L2
  .line 384
    aget v1, p0, v0
    if-ne v1, p1, :L1
    return v0
  :L1
  .line 383
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 386
    const/4 p0, -1
    return p0
.end method

.method private static refreshCounter(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 4
  .line 127
    if-nez p0, :L0
    return-void
  :L0
  .line 128
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 129
    if-nez v0, :L1
    return-void
  :L1
  .line 130
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result v1
    if-eqz v1, :L2
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookList()Ljava/util/List;
    move-result-object v1
    goto :L3
  :L2
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object v1
  :L3
  .line 131
    if-nez v1, :L4
    return-void
  :L4
  .line 134
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result v2
    if-eqz v2, :L5
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getBookMarkProgress()Lcom/innioasis/y1/database/Bookmark;
    move-result-object v2
    if-eqz v2, :L5
    return-void
  :L5
  .line 135
    const v2, 2131362490
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 136
    instance-of v2, p0, Landroid/widget/TextView;
    if-eqz v2, :L6
  .line 137
    check-cast p0, Landroid/widget/TextView;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->trackNo(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v0
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, "/"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L6
  .line 141
    goto :L8
  :L7
  .line 139
    move-exception p0
  :L8
  .line 142
    return-void
.end method

.method public static render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 13
  .line 428
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L1
    sput-object v1, Lcom/innioasis/ipp/Deck;->lastAct:Ljava/lang/ref/WeakReference;
  .line 429
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result v1
  .line 430
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->timelineColor(Landroid/app/Activity;)I
    move-result v10
  .line 433
    const v3, 2131362557
    const/16 v4, 8
    const/16 v2, 8
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Deck;->visible(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
    move-result v5
    const v6, 2131624019
    move-object v2, p0
    move v7, v10
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 436
    const v3, 2131362543
    const/4 v4, 0
    const/4 v8, 1
    const/4 v9, 0
    if-nez v1, :L2
    invoke-static { }, Lcom/innioasis/ipp/Deck;->heartShow()Z
    move-result v2
    if-eqz v2, :L2
    const/4 v5, 1
    goto :L3
  :L2
    const/4 v5, 0
  :L3
    if-eqz v1, :L4
    const/4 v6, 0
    goto :L5
  :L4
    invoke-static { }, Lcom/innioasis/ipp/Deck;->iconHeart()I
    move-result v2
    move v6, v2
  :L5
    move-object v2, p0
    move v7, v10
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 437
    const v3, 2131362104
    const/4 v4, 1
    const/4 v5, 1
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->iconShuffle(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v6
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 438
    const v3, 2131362315
    const/4 v4, 2
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->iconRepeatOrAb(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v6
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 439
    const v3, 2131362545
    const/4 v4, 3
    if-nez v1, :L6
    invoke-static { }, Lcom/innioasis/ipp/Deck;->showText()Z
    move-result v2
    if-eqz v2, :L6
    const/4 v5, 1
    goto :L7
  :L6
    const/4 v5, 0
  :L7
    const v6, 2131623990
    move-object v2, p0
    move v7, v10
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 440
    const v3, 2131362547
    const/4 v4, 4
    if-nez v1, :L8
    invoke-static { }, Lcom/innioasis/ipp/Deck;->showAb()Z
    move-result v2
    if-eqz v2, :L8
    const/4 v5, 1
    goto :L9
  :L8
    const/4 v5, 0
  :L9
    if-eqz v1, :L10
    const/4 v6, 0
    goto :L11
  :L10
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->iconAb(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v2
    move v6, v2
  :L11
    move-object v2, p0
    move v7, v10
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 441
    const v3, 2131362546
    const/4 v4, 5
    const/4 v2, 5
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Deck;->visible(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
    move-result v5
    const v6, 2131623989
    move-object v2, p0
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 446
    invoke-static { }, Lcom/innioasis/ipp/Audio;->rateOff()Z
    move-result v2
  .line 447
    xor-int/2addr v2, v8
    invoke-static { }, Lcom/innioasis/ipp/Audio;->timerOff()Z
    move-result v3
  .line 448
    xor-int/lit8 v11, v3, 1
    const v3, 2131362554
    const/4 v4, 6
    if-eqz v2, :L12
    const/4 v6, 0
    goto :L13
  :L12
    const v5, 2131624015
    const v6, 2131624015
  :L13
  .line 449
    if-eqz v2, :L14
    invoke-static { }, Lcom/innioasis/ipp/Audio;->rateLabel()Ljava/lang/String;
    move-result-object v2
    move-object v8, v2
    goto :L15
  :L14
    move-object v8, v0
  :L15
    const-string v9, "0.75"
  .line 448
    move-object v2, p0
    move v5, v1
    move v7, v10
    invoke-static/range { v2 .. v9 }, Lcom/innioasis/ipp/Deck;->label(Lcom/innioasis/y1/base/BasePlayerActivity;IIZIILjava/lang/String;Ljava/lang/String;)V
  .line 450
    const v3, 2131362555
    const/4 v4, 7
    if-eqz v11, :L16
    const v2, 2131624013
    const v6, 2131624013
    goto :L17
  :L16
    const v2, 2131624017
    const v6, 2131624017
  :L17
  .line 451
    if-eqz v11, :L18
    invoke-static { }, Lcom/innioasis/ipp/Audio;->timerLabel()Ljava/lang/String;
    move-result-object v0
  :L18
    move-object v8, v0
    const/4 v9, 0
  .line 450
    move-object v2, p0
    move v5, v1
    move v7, v10
    invoke-static/range { v2 .. v9 }, Lcom/innioasis/ipp/Deck;->label(Lcom/innioasis/y1/base/BasePlayerActivity;IIZIILjava/lang/String;Ljava/lang/String;)V
  .line 452
    if-nez v1, :L19
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->abState(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v0
    if-eqz v0, :L19
  .line 453
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->startAnim(Lcom/innioasis/y1/base/BasePlayerActivity;)V
    goto :L20
  :L19
  .line 455
    invoke-static { }, Lcom/innioasis/ipp/Deck;->stopAnim()V
  :L20
  .line 457
    return-void
.end method

.method public static repaintLast()V
  .registers 2
  .line 461
    sget-object v0, Lcom/innioasis/ipp/Deck;->lastAct:Ljava/lang/ref/WeakReference;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 462
    instance-of v1, v0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v1, :L2
    check-cast v0, Lcom/innioasis/y1/base/BasePlayerActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L2
  .line 463
    return-void
.end method

.method private static repeatMode(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 2
  .line 145
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 146
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result p0
    if-eqz p0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getAudiobookRepeatMode()I
    move-result p0
    goto :L1
  :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getMusicRepeatMode()I
    move-result p0
  :L1
    return p0
.end method

.method public static reset()V
  .registers 2
  .line 567
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
  .line 568
    sput v0, Lcom/innioasis/ipp/Deck;->focus:I
  .line 569
    invoke-static { }, Lcom/innioasis/ipp/Deck;->stopAnim()V
  .line 570
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Deck;->animAct:Lcom/innioasis/y1/base/BasePlayerActivity;
  .line 571
    sget-object v1, Lcom/innioasis/ipp/Deck;->lastAct:Ljava/lang/ref/WeakReference;
    if-nez v1, :L0
    goto :L1
  :L0
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 572
    instance-of v1, v0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v1, :L2
  .line 573
    check-cast v0, Lcom/innioasis/y1/base/BasePlayerActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L2
  .line 575
    return-void
.end method

.method private static showAb()Z
  .registers 2
  .line 178
    invoke-static { }, Lcom/innioasis/ipp/Deck;->topHold()I
    move-result v0
    const/4 v1, 2
    if-eq v0, v1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static showQueue()Z
  .registers 2
  .line 182
    invoke-static { }, Lcom/innioasis/ipp/Deck;->topHold()I
    move-result v0
    const/4 v1, 1
    if-eq v0, v1, :L0
    goto :L1
  :L0
    const/4 v1, 0
  :L1
    return v1
.end method

.method private static showText()Z
  .registers 1
  .line 174
    invoke-static { }, Lcom/innioasis/ipp/Deck;->topHold()I
    move-result v0
    if-eqz v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static shuffleOn(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
  .registers 2
  .line 105
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 106
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result p0
    if-eqz p0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getAudiobookIsShuffle()Z
    move-result p0
    goto :L1
  :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getMusicIsShuffle()Z
    move-result p0
  :L1
    return p0
.end method

.method public static side(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
  .registers 6
  .line 514
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
    if-nez v0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 515
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->order(Lcom/innioasis/y1/base/BasePlayerActivity;)[I
    move-result-object v0
  .line 516
    sget v1, Lcom/innioasis/ipp/Deck;->focus:I
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Deck;->posOf(Lcom/innioasis/y1/base/BasePlayerActivity;I)I
    move-result v1
  .line 517
    const/4 v2, 1
    if-gez v1, :L1
  .line 520
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->firstVisible(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result p1
    sput p1, Lcom/innioasis/ipp/Deck;->focus:I
  .line 521
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 522
    return v2
  :L1
  .line 525
    add-int/2addr v1, p1
  .line 526
    if-ltz v1, :L3
    array-length v3, v0
    if-lt v1, v3, :L2
    goto :L3
  :L2
  .line 527
    aget v3, v0, v1
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Deck;->visible(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
    move-result v3
    if-eqz v3, :L1
  .line 528
    aget p1, v0, v1
    sput p1, Lcom/innioasis/ipp/Deck;->focus:I
  .line 529
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 530
    return v2
  :L3
  .line 526
    return v2
.end method

.method private static startAnim(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 4
  .line 286
    sput-object p0, Lcom/innioasis/ipp/Deck;->animAct:Lcom/innioasis/y1/base/BasePlayerActivity;
  .line 287
    sget-boolean p0, Lcom/innioasis/ipp/Deck;->animRunning:Z
    if-eqz p0, :L0
    return-void
  :L0
  .line 288
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Deck;->animRunning:Z
  .line 289
    sget-object p0, Lcom/innioasis/ipp/Deck;->animH:Landroid/os/Handler;
    sget-object v0, Lcom/innioasis/ipp/Deck;->animR:Ljava/lang/Runnable;
    const-wide/16 v1, 400
    invoke-virtual { p0, v0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 290
    return-void
.end method

.method private static stopAnim()V
  .registers 2
  .line 293
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->animRunning:Z
  .line 294
    sget-object v0, Lcom/innioasis/ipp/Deck;->animH:Landroid/os/Handler;
    if-eqz v0, :L0
  .line 295
    sget-object v1, Lcom/innioasis/ipp/Deck;->animR:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  :L0
  .line 297
    return-void
.end method

.method private static toggleLike()V
  .registers 3
  .line 80
    invoke-static { }, Lcom/innioasis/ipp/Deck;->curPath()Ljava/lang/String;
    move-result-object v0
  .line 81
    if-nez v0, :L0
    return-void
  :L0
  .line 82
    invoke-static { }, Lcom/innioasis/ipp/Deck;->appCtx()Landroid/content/Context;
    move-result-object v1
  .line 83
    if-nez v1, :L1
    return-void
  :L1
  .line 84
    invoke-static { v0 }, Lcom/innioasis/ipp/Likes;->get(Ljava/lang/String;)Z
    move-result v2
  .line 85
    xor-int/lit8 v2, v2, 1
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Likes;->set(Ljava/lang/String;Z)V
  .line 86
    if-eqz v2, :L2
  .line 87
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Fav;->add(Landroid/content/Context;Ljava/lang/String;)V
    goto :L3
  :L2
  .line 89
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Fav;->remove(Landroid/content/Context;Ljava/lang/String;)V
  :L3
  .line 91
    return-void
.end method

.method private static toggleShuffle(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 3
  .line 116
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 119
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result v1
    if-eqz v1, :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getAudiobookIsShuffle()Z
    move-result v1
    xor-int/lit8 v1, v1, 1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setAudiobookIsShuffle(Z)V
    goto :L1
  :L0
  .line 120
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getMusicIsShuffle()Z
    move-result v1
    xor-int/lit8 v1, v1, 1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setMusicIsShuffle(Z)V
  :L1
  .line 121
    invoke-static { }, Lcom/innioasis/ipp/Queue;->onShuffleChanged()V
  .line 122
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->refreshCounter(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 123
    return-void
.end method

.method public static topHold()I
  .registers 2
  .line 168
    invoke-static { }, Lcom/innioasis/ipp/Deck;->appCtx()Landroid/content/Context;
    move-result-object v0
  .line 169
    if-nez v0, :L0
    const/4 v0, 0
    return v0
  :L0
  .line 170
    const-string v1, "top_hold"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    return v0
.end method

.method private static visible(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
  .registers 6
  .line 360
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result p0
    const/4 v0, 6
    const/4 v1, 5
    const/4 v2, 0
    const/4 v3, 1
    if-eqz p0, :L6
  .line 361
    const/16 p0, 8
    if-ne p1, p0, :L1
    invoke-static { }, Lcom/innioasis/ipp/Audio;->bookTopHold()I
    move-result p0
    if-ne p0, v3, :L0
    const/4 v2, 1
  :L0
    return v2
  :L1
  .line 362
    if-ne p1, v1, :L3
    invoke-static { }, Lcom/innioasis/ipp/Audio;->bookTopHold()I
    move-result p0
    if-eq p0, v3, :L2
    const/4 v2, 1
  :L2
    return v2
  :L3
  .line 363
    if-eq p1, v3, :L4
    const/4 p0, 2
    if-eq p1, p0, :L4
    if-eq p1, v0, :L4
    const/4 p0, 7
    if-ne p1, p0, :L5
  :L4
    const/4 v2, 1
  :L5
    return v2
  :L6
  .line 365
    if-nez p1, :L7
    invoke-static { }, Lcom/innioasis/ipp/Deck;->heartShow()Z
    move-result p0
    return p0
  :L7
  .line 366
    const/4 p0, 3
    if-ne p1, p0, :L8
    invoke-static { }, Lcom/innioasis/ipp/Deck;->showText()Z
    move-result p0
    return p0
  :L8
  .line 367
    const/4 p0, 4
    if-ne p1, p0, :L9
    invoke-static { }, Lcom/innioasis/ipp/Deck;->showAb()Z
    move-result p0
    return p0
  :L9
  .line 368
    if-ne p1, v1, :L10
    invoke-static { }, Lcom/innioasis/ipp/Deck;->showQueue()Z
    move-result p0
    return p0
  :L10
  .line 369
    if-ge p1, v0, :L11
    const/4 v2, 1
  :L11
    return v2
.end method

.method public static wheel(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
  .registers 5
  .line 534
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 535
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v0
    const/4 v2, 1
    if-ne p1, v0, :L1
  .line 536
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Deck;->side(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
  .line 537
    return v2
  :L1
  .line 539
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v0
    if-eq p1, v0, :L2
    return v1
  :L2
  .line 540
    const/4 p1, -1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->side(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
  .line 541
    return v2
.end method

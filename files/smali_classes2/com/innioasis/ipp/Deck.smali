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
  .line 28
    const/4 v0, 6
    new-array v1, v0, [I
    fill-array-data v1, :L0
    sput-object v1, Lcom/innioasis/ipp/Deck;->ORDER_MUSIC:[I
  .line 29
    new-array v0, v0, [I
    fill-array-data v0, :L1
    sput-object v0, Lcom/innioasis/ipp/Deck;->ORDER_BOOK:[I
  .line 35
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
  .line 36
    sput v0, Lcom/innioasis/ipp/Deck;->focus:I
  .line 37
    new-instance v1, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct { v1, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/Deck;->animH:Landroid/os/Handler;
  .line 38
    new-instance v1, Lcom/innioasis/ipp/DeckAnim;
    invoke-direct { v1 }, Lcom/innioasis/ipp/DeckAnim;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Deck;->animR:Ljava/lang/Runnable;
  .line 39
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->animPhase:Z
  .line 40
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->animRunning:Z
  .line 41
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Deck;->animAct:Lcom/innioasis/y1/base/BasePlayerActivity;
  .line 43
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
  .line 23
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static abAX(Landroid/view/View;Landroid/graphics/Paint;Ljava/lang/String;F)F
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 177
    invoke-virtual { p1, p2 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result p2
  .line 178
    invoke-virtual { p1 }, Landroid/graphics/Paint;->getTextSize()F
    move-result p1
    sub-float p1, p3, p1
    const/high16 v0, 0x40000000
    sub-float/2addr p1, v0
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Deck;->abFit(Landroid/view/View;FF)F
    move-result p0
  .line 179
    sput p0, Lcom/innioasis/ipp/Deck;->abLeft:F
  .line 180
    add-float/2addr p2, p0
    sput p2, Lcom/innioasis/ipp/Deck;->abRight:F
  .line 181
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Deck;->abHaveA:Z
  :L1
  .line 182
    return p0
  :L2
  .line 183
    move-exception p0
  .line 184
    const/4 p0, 0
    sput-boolean p0, Lcom/innioasis/ipp/Deck;->abHaveA:Z
  .line 185
    return p3
.end method

.method public static abBX(Landroid/view/View;Landroid/graphics/Paint;Ljava/lang/String;F)F
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  :L0
  .line 191
    invoke-virtual { p1, p2 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result p2
  .line 192
    invoke-virtual { p1 }, Landroid/graphics/Paint;->getTextSize()F
    move-result p1
    sub-float p1, p3, p1
    const/high16 v0, 0x40000000
    sub-float/2addr p1, v0
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Deck;->abFit(Landroid/view/View;FF)F
    move-result p1
  .line 194
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->abHaveA:Z
  .line 195
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Deck;->abHaveA:Z
  .line 196
    if-eqz v0, :L4
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Deck;->abHits(FF)Z
    move-result v0
    if-nez v0, :L1
    goto :L4
  :L1
  .line 197
    const/high16 p1, 0x40A00000
    add-float v0, p3, p1
    invoke-static { p0, v0, p2 }, Lcom/innioasis/ipp/Deck;->abFit(Landroid/view/View;FF)F
    move-result v0
  .line 198
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Deck;->abHits(FF)Z
    move-result v1
    if-nez v1, :L2
    return v0
  :L2
  .line 199
    sget v0, Lcom/innioasis/ipp/Deck;->abRight:F
    add-float/2addr v0, p1
    invoke-static { p0, v0, p2 }, Lcom/innioasis/ipp/Deck;->abFit(Landroid/view/View;FF)F
    move-result p0
  :L3
    return p0
  :L4
  .line 196
    return p1
  :L5
  .line 200
    move-exception p0
  .line 201
    return p3
.end method

.method private static abFit(Landroid/view/View;FF)F
  .registers 4
  .line 210
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result p0
  :L1
  .line 211
    if-lez p0, :L2
    add-float v0, p1, p2
    int-to-float p0, p0
    cmpl-float v0, v0, p0
    if-lez v0, :L2
    sub-float p1, p0, p2
  :L2
  .line 212
    const/4 p0, 0
    cmpg-float p2, p1, p0
    if-gez p2, :L3
    const/4 p1, 0
  :L3
    return p1
.end method

.method private static abHits(FF)Z
  .registers 4
  .line 206
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
  .line 157
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p0
  .line 158
    const-wide/16 v0, -1
    if-eqz p0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getAPoint()J
    move-result-wide v2
    goto :L1
  :L0
    move-wide v2, v0
  :L1
  .line 159
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-gez v6, :L2
    const/4 p0, 0
    return p0
  :L2
  .line 160
    if-eqz p0, :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getBPoint()J
    move-result-wide v0
  :L3
  .line 161
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
  .line 250
    sget-object v0, Lcom/innioasis/ipp/Deck;->animAct:Lcom/innioasis/y1/base/BasePlayerActivity;
  .line 251
    const/4 v1, 0
    if-nez v0, :L0
  .line 252
    sput-boolean v1, Lcom/innioasis/ipp/Deck;->animRunning:Z
  .line 253
    return-void
  :L0
  .line 255
    invoke-static { v0 }, Lcom/innioasis/ipp/Deck;->abState(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v2
    if-nez v2, :L1
  .line 256
    sput-boolean v1, Lcom/innioasis/ipp/Deck;->animRunning:Z
  .line 257
    invoke-static { v0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
    goto :L2
  :L1
  .line 259
    sget-boolean v1, Lcom/innioasis/ipp/Deck;->animPhase:Z
    xor-int/lit8 v1, v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Deck;->animPhase:Z
  .line 260
    invoke-static { v0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 261
    sget-object v0, Lcom/innioasis/ipp/Deck;->animH:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Deck;->animR:Ljava/lang/Runnable;
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L2
  .line 263
    return-void
.end method

.method private static appCtx()Landroid/content/Context;
  .registers 1
  .line 46
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    return-object v0
.end method

.method private static apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .registers 6
  .line 326
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->iv(Lcom/innioasis/y1/base/BasePlayerActivity;I)Landroid/widget/ImageView;
    move-result-object p0
  .line 327
    if-nez p0, :L0
    return-void
  :L0
  .line 328
    const/4 p1, 0
    if-nez p3, :L1
  .line 329
    const/16 p2, 8
    invoke-virtual { p0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 330
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->hl(Landroid/widget/ImageView;Z)V
    goto :L3
  :L1
  .line 332
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 333
    if-eqz p4, :L2
  .line 334
    invoke-static { p0, p4, p5 }, Lcom/innioasis/ipp/Icons;->apply(Landroid/widget/ImageView;II)V
  :L2
  .line 336
    invoke-static { p2 }, Lcom/innioasis/ipp/Deck;->focused(I)Z
    move-result p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->hl(Landroid/widget/ImageView;Z)V
  :L3
  .line 338
    return-void
.end method

.method public static back(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
  .registers 4
  .line 464
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->abState(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v0
    const/4 v1, 1
    if-ne v0, v1, :L0
  .line 465
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippCancelAB()V
  .line 466
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 467
    return v1
  :L0
  .line 469
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippLyricOpen()Z
    move-result v0
    if-eqz v0, :L1
  .line 470
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippToggleLyric()V
  .line 471
    return v1
  :L1
  .line 473
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
    const/4 v2, 0
    if-nez v0, :L2
    return v2
  :L2
  .line 474
    sput-boolean v2, Lcom/innioasis/ipp/Deck;->active:Z
  .line 475
    sput v2, Lcom/innioasis/ipp/Deck;->focus:I
  .line 476
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 477
    return v1
.end method

.method private static book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
  .registers 1
  .line 77
    instance-of p0, p0, Lcom/innioasis/y1/activity/AudioPlayerActivity;
    return p0
.end method

.method private static curLiked()Z
  .registers 1
  .line 58
    invoke-static { }, Lcom/innioasis/ipp/Deck;->curPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Likes;->get(Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static curPath()Ljava/lang/String;
  .registers 2
  .line 50
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 51
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 52
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 53
    if-nez v0, :L1
    return-object v1
  :L1
  .line 54
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private static cycleRepeat(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 4
  .line 120
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 121
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->repeatMode(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v1
  .line 122
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
  .line 123
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result p0
    if-eqz p0, :L3
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setAudiobookRepeatMode(I)V
    goto :L4
  :L3
  .line 124
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setMusicRepeatMode(I)V
  :L4
  .line 125
    return-void
.end method

.method public static enter(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 4
  .line 390
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippLyricOpen()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 391
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
    const/4 v1, 1
    if-nez v0, :L1
  .line 392
    sput-boolean v1, Lcom/innioasis/ipp/Deck;->active:Z
  .line 393
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->firstVisible(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v0
    sput v0, Lcom/innioasis/ipp/Deck;->focus:I
  .line 394
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 395
    return-void
  :L1
  .line 397
    sget v0, Lcom/innioasis/ipp/Deck;->focus:I
  .line 398
    const/16 v2, 8
    if-ne v0, v2, :L2
  .line 399
    invoke-static { p0 }, Lcom/innioasis/ipp/Audio;->addBookmark(Landroid/app/Activity;)V
    goto :L10
  :L2
  .line 400
    const/4 v2, 6
    if-ne v0, v2, :L3
  .line 401
    invoke-static { }, Lcom/innioasis/ipp/Audio;->cycleRate()V
    goto :L10
  :L3
  .line 402
    const/4 v2, 7
    if-ne v0, v2, :L4
  .line 403
    invoke-static { }, Lcom/innioasis/ipp/Audio;->cycleTimer()V
    goto :L10
  :L4
  .line 404
    if-nez v0, :L5
  .line 405
    invoke-static { }, Lcom/innioasis/ipp/Deck;->toggleLike()V
    goto :L10
  :L5
  .line 406
    if-ne v0, v1, :L6
  .line 407
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->toggleShuffle(Lcom/innioasis/y1/base/BasePlayerActivity;)V
    goto :L10
  :L6
  .line 408
    const/4 v1, 2
    if-ne v0, v1, :L7
  .line 409
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->cycleRepeat(Lcom/innioasis/y1/base/BasePlayerActivity;)V
    goto :L10
  :L7
  .line 410
    const/4 v1, 3
    const/4 v2, 0
    if-ne v0, v1, :L8
  .line 411
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippToggleLyric()V
  .line 412
    sput-boolean v2, Lcom/innioasis/ipp/Deck;->active:Z
    goto :L10
  :L8
  .line 413
    const/4 v1, 4
    if-ne v0, v1, :L9
  .line 414
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->ippToggleAB()V
    goto :L10
  :L9
  .line 415
    const/4 v1, 5
    if-ne v0, v1, :L10
  .line 416
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->openQueue(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 417
    sput-boolean v2, Lcom/innioasis/ipp/Deck;->active:Z
  :L10
  .line 419
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 420
    return-void
.end method

.method private static firstVisible(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 5
  .line 309
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->order(Lcom/innioasis/y1/base/BasePlayerActivity;)[I
    move-result-object v0
  .line 310
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, v0
    if-ge v2, v3, :L2
  .line 311
    aget v3, v0, v2
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Deck;->visible(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
    move-result v3
    if-eqz v3, :L1
    aget p0, v0, v2
    return p0
  :L1
  .line 310
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 313
    return v1
.end method

.method private static focused(I)Z
  .registers 2
  .line 291
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
  .line 128
    invoke-static { }, Lcom/innioasis/ipp/Deck;->appCtx()Landroid/content/Context;
    move-result-object v0
  .line 129
    const/4 v1, 1
    if-nez v0, :L0
    return v1
  :L0
  .line 130
    const-string v2, "likes"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    xor-int/2addr v0, v1
    return v0
.end method

.method private static heartShow()Z
  .registers 1
  .line 134
    invoke-static { }, Lcom/innioasis/ipp/Deck;->heartHidden()Z
    move-result v0
    xor-int/lit8 v0, v0, 1
    return v0
.end method

.method private static hl(Landroid/widget/ImageView;Z)V
  .registers 2
  .line 286
    if-nez p0, :L0
    return-void
  :L0
  .line 287
    if-eqz p1, :L1
    const p1, 1715273694
    goto :L2
  :L1
    const/4 p1, 0
  :L2
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setBackgroundColor(I)V
  .line 288
    return-void
.end method

.method private static iconAb(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 4
  .line 229
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->abState(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result p0
  .line 230
    const v0, 2131623992
    if-nez p0, :L0
    return v0
  :L0
  .line 231
    const/4 v1, 1
    const v2, 2131623991
    if-ne p0, v1, :L2
    sget-boolean p0, Lcom/innioasis/ipp/Deck;->animPhase:Z
    if-eqz p0, :L1
    const v2, 2131623993
  :L1
    return v2
  :L2
  .line 232
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
  .line 216
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
  .line 224
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->repeatMode(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result p0
  .line 225
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
  .line 266
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
  .line 267
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->iconAb(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result p0
    return p0
  :L1
  .line 266
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->iconRepeat(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result p0
    return p0
.end method

.method private static iconShuffle(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 1
  .line 220
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
  .line 272
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 273
    instance-of p1, p0, Landroid/widget/ImageView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/ImageView;
    return-object p0
  :L0
  .line 274
    const/4 p0, 0
    return-object p0
.end method

.method private static label(Lcom/innioasis/y1/base/BasePlayerActivity;IIZIILjava/lang/String;Ljava/lang/String;)V
  .registers 8
  .line 343
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->iv(Lcom/innioasis/y1/base/BasePlayerActivity;I)Landroid/widget/ImageView;
    move-result-object p0
  .line 344
    if-nez p0, :L0
    return-void
  :L0
  .line 345
    const/4 p1, 0
    if-nez p3, :L1
  .line 346
    const/16 p2, 8
    invoke-virtual { p0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 347
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->hl(Landroid/widget/ImageView;Z)V
  .line 348
    return-void
  :L1
  .line 350
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 352
    if-nez p4, :L2
    invoke-static { p0, p6, p7, p5 }, Lcom/innioasis/ipp/Icons;->value(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;I)V
    goto :L3
  :L2
  .line 353
    invoke-static { p0, p4, p5, p6 }, Lcom/innioasis/ipp/Icons;->label(Landroid/widget/ImageView;IILjava/lang/String;)V
  :L3
  .line 354
    invoke-static { p2 }, Lcom/innioasis/ipp/Deck;->focused(I)Z
    move-result p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->hl(Landroid/widget/ImageView;Z)V
  .line 355
    return-void
.end method

.method public static openQueue(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 3
  .line 424
    if-nez p0, :L0
    return-void
  :L0
  .line 425
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
  .line 426
    sput v0, Lcom/innioasis/ipp/Deck;->focus:I
  .line 427
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 428
    nop
  .line 429
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 430
    return-void
.end method

.method private static order(Lcom/innioasis/y1/base/BasePlayerActivity;)[I
  .registers 1
  .line 32
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
  .line 318
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->order(Lcom/innioasis/y1/base/BasePlayerActivity;)[I
    move-result-object p0
  .line 319
    const/4 v0, 0
  :L0
    array-length v1, p0
    if-ge v0, v1, :L2
  .line 320
    aget v1, p0, v0
    if-ne v1, p1, :L1
    return v0
  :L1
  .line 319
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 322
    const/4 p0, -1
    return p0
.end method

.method private static refreshCounter(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 4
  .line 99
    if-nez p0, :L0
    return-void
  :L0
  .line 100
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 101
    if-nez v0, :L1
    return-void
  :L1
  .line 102
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
  .line 103
    if-nez v1, :L4
    return-void
  :L4
  .line 105
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result v2
    if-eqz v2, :L5
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getBookMarkProgress()Lcom/innioasis/y1/database/Bookmark;
    move-result-object v2
    if-eqz v2, :L5
    return-void
  :L5
  .line 106
    const v2, 2131362490
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 107
    instance-of v2, p0, Landroid/widget/TextView;
    if-eqz v2, :L6
  .line 108
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
  .line 111
    goto :L8
  :L7
  .line 110
    move-exception p0
  :L8
  .line 112
    return-void
.end method

.method public static render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 13
  .line 358
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L1
    sput-object v1, Lcom/innioasis/ipp/Deck;->lastAct:Ljava/lang/ref/WeakReference;
  .line 359
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result v1
  .line 360
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->timelineColor(Landroid/app/Activity;)I
    move-result v10
  .line 361
    const v3, 2131362557
    const/16 v4, 8
    const/16 v2, 8
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Deck;->visible(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
    move-result v5
    const v6, 2131624019
    move-object v2, p0
    move v7, v10
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 363
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
  .line 364
    const v3, 2131362104
    const/4 v4, 1
    const/4 v5, 1
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->iconShuffle(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v6
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 365
    const v3, 2131362315
    const/4 v4, 2
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->iconRepeatOrAb(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v6
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 366
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
  .line 367
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
  .line 368
    const v3, 2131362546
    const/4 v4, 5
    const/4 v2, 5
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Deck;->visible(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
    move-result v5
    const v6, 2131623989
    move-object v2, p0
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Deck;->apply(Lcom/innioasis/y1/base/BasePlayerActivity;IIZII)V
  .line 370
    invoke-static { }, Lcom/innioasis/ipp/Audio;->rateOff()Z
    move-result v2
  .line 371
    xor-int/2addr v2, v8
    invoke-static { }, Lcom/innioasis/ipp/Audio;->timerOff()Z
    move-result v3
  .line 372
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
  .line 373
    if-eqz v2, :L14
    invoke-static { }, Lcom/innioasis/ipp/Audio;->rateLabel()Ljava/lang/String;
    move-result-object v2
    move-object v8, v2
    goto :L15
  :L14
    move-object v8, v0
  :L15
    const-string v9, "0.75"
  .line 372
    move-object v2, p0
    move v5, v1
    move v7, v10
    invoke-static/range { v2 .. v9 }, Lcom/innioasis/ipp/Deck;->label(Lcom/innioasis/y1/base/BasePlayerActivity;IIZIILjava/lang/String;Ljava/lang/String;)V
  .line 374
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
  .line 375
    if-eqz v11, :L18
    invoke-static { }, Lcom/innioasis/ipp/Audio;->timerLabel()Ljava/lang/String;
    move-result-object v0
  :L18
    move-object v8, v0
    const/4 v9, 0
  .line 374
    move-object v2, p0
    move v5, v1
    move v7, v10
    invoke-static/range { v2 .. v9 }, Lcom/innioasis/ipp/Deck;->label(Lcom/innioasis/y1/base/BasePlayerActivity;IIZIILjava/lang/String;Ljava/lang/String;)V
  .line 376
    if-nez v1, :L19
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->abState(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result v0
    if-eqz v0, :L19
  .line 377
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->startAnim(Lcom/innioasis/y1/base/BasePlayerActivity;)V
    goto :L20
  :L19
  .line 379
    invoke-static { }, Lcom/innioasis/ipp/Deck;->stopAnim()V
  :L20
  .line 381
    return-void
.end method

.method public static repaintLast()V
  .registers 2
  .line 385
    sget-object v0, Lcom/innioasis/ipp/Deck;->lastAct:Ljava/lang/ref/WeakReference;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 386
    instance-of v1, v0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v1, :L2
    check-cast v0, Lcom/innioasis/y1/base/BasePlayerActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L2
  .line 387
    return-void
.end method

.method private static repeatMode(Lcom/innioasis/y1/base/BasePlayerActivity;)I
  .registers 2
  .line 115
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 116
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
  .line 482
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
  .line 483
    sput v0, Lcom/innioasis/ipp/Deck;->focus:I
  .line 484
    invoke-static { }, Lcom/innioasis/ipp/Deck;->stopAnim()V
  .line 485
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Deck;->animAct:Lcom/innioasis/y1/base/BasePlayerActivity;
  .line 486
    sget-object v1, Lcom/innioasis/ipp/Deck;->lastAct:Ljava/lang/ref/WeakReference;
    if-nez v1, :L0
    goto :L1
  :L0
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 487
    instance-of v1, v0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v1, :L2
  .line 488
    check-cast v0, Lcom/innioasis/y1/base/BasePlayerActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L2
  .line 490
    return-void
.end method

.method private static showAb()Z
  .registers 2
  .line 148
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
  .line 152
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
  .line 144
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
  .line 81
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 82
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
  .line 433
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
    if-nez v0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 434
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->order(Lcom/innioasis/y1/base/BasePlayerActivity;)[I
    move-result-object v0
  .line 435
    sget v1, Lcom/innioasis/ipp/Deck;->focus:I
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Deck;->posOf(Lcom/innioasis/y1/base/BasePlayerActivity;I)I
    move-result v1
  .line 436
    const/4 v2, 1
    if-gez v1, :L1
  .line 438
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->firstVisible(Lcom/innioasis/y1/base/BasePlayerActivity;)I
    move-result p1
    sput p1, Lcom/innioasis/ipp/Deck;->focus:I
  .line 439
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 440
    return v2
  :L1
  .line 443
    add-int/2addr v1, p1
  .line 444
    if-ltz v1, :L3
    array-length v3, v0
    if-lt v1, v3, :L2
    goto :L3
  :L2
  .line 445
    aget v3, v0, v1
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Deck;->visible(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
    move-result v3
    if-eqz v3, :L1
  .line 446
    aget p1, v0, v1
    sput p1, Lcom/innioasis/ipp/Deck;->focus:I
  .line 447
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->render(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 448
    return v2
  :L3
  .line 444
    return v2
.end method

.method private static startAnim(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 4
  .line 236
    sput-object p0, Lcom/innioasis/ipp/Deck;->animAct:Lcom/innioasis/y1/base/BasePlayerActivity;
  .line 237
    sget-boolean p0, Lcom/innioasis/ipp/Deck;->animRunning:Z
    if-eqz p0, :L0
    return-void
  :L0
  .line 238
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Deck;->animRunning:Z
  .line 239
    sget-object p0, Lcom/innioasis/ipp/Deck;->animH:Landroid/os/Handler;
    sget-object v0, Lcom/innioasis/ipp/Deck;->animR:Ljava/lang/Runnable;
    const-wide/16 v1, 400
    invoke-virtual { p0, v0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 240
    return-void
.end method

.method private static stopAnim()V
  .registers 2
  .line 243
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Deck;->animRunning:Z
  .line 244
    sget-object v0, Lcom/innioasis/ipp/Deck;->animH:Landroid/os/Handler;
    if-eqz v0, :L0
  .line 245
    sget-object v1, Lcom/innioasis/ipp/Deck;->animR:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  :L0
  .line 247
    return-void
.end method

.method private static toggleLike()V
  .registers 3
  .line 62
    invoke-static { }, Lcom/innioasis/ipp/Deck;->curPath()Ljava/lang/String;
    move-result-object v0
  .line 63
    if-nez v0, :L0
    return-void
  :L0
  .line 64
    invoke-static { }, Lcom/innioasis/ipp/Deck;->appCtx()Landroid/content/Context;
    move-result-object v1
  .line 65
    if-nez v1, :L1
    return-void
  :L1
  .line 66
    invoke-static { v0 }, Lcom/innioasis/ipp/Likes;->get(Ljava/lang/String;)Z
    move-result v2
  .line 67
    xor-int/lit8 v2, v2, 1
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Likes;->set(Ljava/lang/String;Z)V
  .line 68
    if-eqz v2, :L2
  .line 69
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Fav;->add(Landroid/content/Context;Ljava/lang/String;)V
    goto :L3
  :L2
  .line 71
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Fav;->remove(Landroid/content/Context;Ljava/lang/String;)V
  :L3
  .line 73
    return-void
.end method

.method private static toggleShuffle(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .registers 3
  .line 90
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 91
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result v1
    if-eqz v1, :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getAudiobookIsShuffle()Z
    move-result v1
    xor-int/lit8 v1, v1, 1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setAudiobookIsShuffle(Z)V
    goto :L1
  :L0
  .line 92
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getMusicIsShuffle()Z
    move-result v1
    xor-int/lit8 v1, v1, 1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setMusicIsShuffle(Z)V
  :L1
  .line 93
    invoke-static { }, Lcom/innioasis/ipp/Queue;->onShuffleChanged()V
  .line 94
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->refreshCounter(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 95
    return-void
.end method

.method public static topHold()I
  .registers 2
  .line 138
    invoke-static { }, Lcom/innioasis/ipp/Deck;->appCtx()Landroid/content/Context;
    move-result-object v0
  .line 139
    if-nez v0, :L0
    const/4 v0, 0
    return v0
  :L0
  .line 140
    const-string v1, "top_hold"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    return v0
.end method

.method private static visible(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
  .registers 6
  .line 296
    invoke-static { p0 }, Lcom/innioasis/ipp/Deck;->book(Lcom/innioasis/y1/base/BasePlayerActivity;)Z
    move-result p0
    const/4 v0, 6
    const/4 v1, 5
    const/4 v2, 0
    const/4 v3, 1
    if-eqz p0, :L6
  .line 297
    const/16 p0, 8
    if-ne p1, p0, :L1
    invoke-static { }, Lcom/innioasis/ipp/Audio;->bookTopHold()I
    move-result p0
    if-ne p0, v3, :L0
    const/4 v2, 1
  :L0
    return v2
  :L1
  .line 298
    if-ne p1, v1, :L3
    invoke-static { }, Lcom/innioasis/ipp/Audio;->bookTopHold()I
    move-result p0
    if-eq p0, v3, :L2
    const/4 v2, 1
  :L2
    return v2
  :L3
  .line 299
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
  .line 301
    if-nez p1, :L7
    invoke-static { }, Lcom/innioasis/ipp/Deck;->heartShow()Z
    move-result p0
    return p0
  :L7
  .line 302
    const/4 p0, 3
    if-ne p1, p0, :L8
    invoke-static { }, Lcom/innioasis/ipp/Deck;->showText()Z
    move-result p0
    return p0
  :L8
  .line 303
    const/4 p0, 4
    if-ne p1, p0, :L9
    invoke-static { }, Lcom/innioasis/ipp/Deck;->showAb()Z
    move-result p0
    return p0
  :L9
  .line 304
    if-ne p1, v1, :L10
    invoke-static { }, Lcom/innioasis/ipp/Deck;->showQueue()Z
    move-result p0
    return p0
  :L10
  .line 305
    if-ge p1, v0, :L11
    const/4 v2, 1
  :L11
    return v2
.end method

.method public static wheel(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
  .registers 5
  .line 452
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Lrc;->wheel(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
    return v1
  :L0
  .line 453
    sget-boolean v0, Lcom/innioasis/ipp/Deck;->active:Z
    const/4 v2, 0
    if-nez v0, :L1
    return v2
  :L1
  .line 454
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v0
    if-ne p1, v0, :L2
  .line 455
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Deck;->side(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
  .line 456
    return v1
  :L2
  .line 458
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v0
    if-eq p1, v0, :L3
    return v2
  :L3
  .line 459
    const/4 p1, -1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Deck;->side(Lcom/innioasis/y1/base/BasePlayerActivity;I)Z
  .line 460
    return v1
.end method

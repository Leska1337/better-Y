.class public final Lcom/innioasis/ipp/Audio;
.super Ljava/lang/Object;
.source "Audio.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Audio$Sleep;
  }
.end annotation

.field private final static MINUTES:[I

.field private final static MS_PER_MIN:J = 60000L

.field private final static OFF:Ljava/lang/String; = "\u2014"

.field private final static RATES:[F

.field public final static RATE_WIDEST:Ljava/lang/String; = "0.75"

.field private static markDur:J

.field private static markPos:J

.field private static markSong:Lcom/innioasis/y1/database/Song;

.method static constructor <clinit>()V
  .registers 5
  .line 45
    const/4 v0, 5
    new-array v0, v0, [F
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Audio;->RATES:[F
  .line 48
    const/16 v0, 30
    const/16 v1, 60
    const/4 v2, 0
    const/16 v3, 10
    const/16 v4, 20
    filled-new-array { v2, v3, v4, v0, v1 }, [I
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Audio;->MINUTES:[I
  .line 239
    const-wide/16 v0, -1
    sput-wide v0, Lcom/innioasis/ipp/Audio;->markPos:J
    return-void
  :L0
  .array-data 4
      1061158912
      1065353216
      1067450368
      1069547520
      1073741824
  .end array-data
.end method

.method public constructor <init>()V
  .registers 1
  .line 42
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static addBookmark(Landroid/app/Activity;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 8
  :L0
  .line 278
    invoke-static { }, Lcom/innioasis/ipp/Audio;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 279
    if-nez v0, :L1
    return-void
  :L1
  .line 280
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingAudiobook()Lcom/innioasis/y1/database/Song;
    move-result-object v2
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getCurrentPosition()J
    move-result-wide v3
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getDuration()J
    move-result-wide v5
    move-object v1, p0
    invoke-static/range { v1 .. v6 }, Lcom/innioasis/ipp/Audio;->write(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;JJ)V
  :L2
  .line 283
    goto :L4
  :L3
  .line 281
    move-exception p0
  :L4
  .line 284
    return-void
.end method

.method public static armBookmark()V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 250
    invoke-static { }, Lcom/innioasis/ipp/Audio;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 251
    if-nez v0, :L1
    return-void
  :L1
  .line 252
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingAudiobook()Lcom/innioasis/y1/database/Song;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Audio;->markSong:Lcom/innioasis/y1/database/Song;
  .line 253
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getCurrentPosition()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Audio;->markPos:J
  .line 254
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getDuration()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Audio;->markDur:J
  :L2
  .line 258
    goto :L4
  :L3
  .line 255
    move-exception v0
  .line 256
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Audio;->markSong:Lcom/innioasis/y1/database/Song;
  .line 257
    const-wide/16 v0, -1
    sput-wide v0, Lcom/innioasis/ipp/Audio;->markPos:J
  :L4
  .line 259
    return-void
.end method

.method public static bookTopHold()I
  .registers 2
  .line 232
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 233
    if-nez v0, :L0
    const/4 v0, 0
    return v0
  :L0
  .line 234
    const-string v1, "book_top_hold"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    return v0
.end method

.method public static commitBookmark()V
  .registers 8
  .line 263
    sget-object v1, Lcom/innioasis/ipp/Audio;->markSong:Lcom/innioasis/y1/database/Song;
  .line 264
    sget-wide v2, Lcom/innioasis/ipp/Audio;->markPos:J
  .line 265
    sget-wide v4, Lcom/innioasis/ipp/Audio;->markDur:J
  .line 266
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Audio;->markSong:Lcom/innioasis/y1/database/Song;
  .line 267
    const-wide/16 v6, -1
    sput-wide v6, Lcom/innioasis/ipp/Audio;->markPos:J
  .line 268
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Audio;->write(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;JJ)V
  .line 269
    return-void
.end method

.method public static cycleRate()V
  .catchall { :L4 .. :L5 } :L6
  .registers 5
  .line 102
    invoke-static { }, Lcom/innioasis/ipp/Audio;->rate()F
    move-result v0
  .line 103
    nop
  .line 104
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Audio;->RATES:[F
    array-length v3, v2
    const/4 v4, 1
    if-ge v1, v3, :L2
  .line 105
    aget v3, v2, v1
    cmpl-float v3, v3, v0
    if-nez v3, :L1
  .line 106
    nop
  .line 107
    goto :L3
  :L1
  .line 104
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
    const/4 v1, 1
  :L3
  .line 110
    add-int/2addr v1, v4
    array-length v0, v2
    rem-int/2addr v1, v0
    aget v0, v2, v1
  .line 111
    sget-object v1, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setAudiobookPlayRate(F)V
  .line 112
    invoke-static { }, Lcom/innioasis/ipp/Audio;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 113
    if-eqz v1, :L7
    invoke-static { }, Lcom/innioasis/ipp/Audio;->playingBook()Z
    move-result v2
    if-eqz v2, :L7
  :L4
  .line 115
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/service/PlayerService;->setSpeed(F)V
  :L5
  .line 118
    goto :L7
  :L6
  .line 116
    move-exception v0
  :L7
  .line 120
    return-void
.end method

.method public static cycleTimer()V
  .registers 8
  .line 143
    invoke-static { }, Lcom/innioasis/ipp/Audio;->timerMs()J
    move-result-wide v0
  .line 144
    const-wide/16 v2, 0
    const-wide/32 v4, 60000
    const/4 v6, 0
    cmp-long v7, v0, v2
    if-gtz v7, :L0
    const/4 v1, 0
    goto :L1
  :L0
    div-long/2addr v0, v4
    long-to-int v1, v0
  :L1
  .line 145
    nop
  .line 146
    const/4 v0, 0
  :L2
    sget-object v2, Lcom/innioasis/ipp/Audio;->MINUTES:[I
    array-length v3, v2
    if-ge v0, v3, :L4
  .line 147
    aget v3, v2, v0
    if-ne v3, v1, :L3
  .line 148
    nop
  .line 149
    move v6, v0
    goto :L4
  :L3
  .line 146
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 152
    add-int/lit8 v6, v6, 1
    array-length v0, v2
    rem-int/2addr v6, v0
    aget v0, v2, v6
  .line 153
    invoke-static { }, Lcom/innioasis/ipp/Audio;->stopTimer()V
  .line 154
    if-nez v0, :L5
  .line 155
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    const-wide/16 v1, -1
    invoke-virtual { v0, v1, v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setAudiobookPlayTime(J)V
  .line 156
    return-void
  :L5
  .line 158
    int-to-long v0, v0
    mul-long v0, v0, v4
  .line 159
    sget-object v2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v2, v0, v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setAudiobookPlayTime(J)V
  .line 160
    new-instance v2, Lcom/innioasis/ipp/Audio$Sleep;
    invoke-direct { v2, v0, v1 }, Lcom/innioasis/ipp/Audio$Sleep;-><init>(J)V
  .line 161
    sput-object v2, Lcom/innioasis/y1/Y1Application;->timer2:Landroid/os/CountDownTimer;
  .line 162
    invoke-virtual { v2 }, Lcom/innioasis/ipp/Audio$Sleep;->start()Landroid/os/CountDownTimer;
  .line 163
    return-void
.end method

.method public static openOther(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L6 } :L8
  .registers 6
  .line 320
    const/4 v0, 0
    if-eqz p0, :L10
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-eqz v1, :L1
    goto :L10
  :L1
  .line 321
    invoke-static { }, Lcom/innioasis/ipp/Audio;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 322
    if-nez v1, :L2
    return v0
  :L2
  .line 323
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlaying()Lcom/innioasis/y1/service/PlayerService$Playing;
    move-result-object v2
  .line 324
    sget-object v3, Lcom/innioasis/y1/service/PlayerService$Playing;->Audiobook:Lcom/innioasis/y1/service/PlayerService$Playing;
    const/4 v4, 1
    if-ne v2, v3, :L5
  .line 325
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookList()Ljava/util/List;
    move-result-object v1
  .line 326
    if-eqz v1, :L4
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L3
    goto :L4
  :L3
  .line 327
    new-instance v1, Landroid/content/Intent;
    const-class v2, Lcom/innioasis/y1/activity/AudioPlayerActivity;
    invoke-direct { v1, p0, v2 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 328
    const-string v2, "from_now_playing"
    invoke-virtual { v1, v2, v4 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 329
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 330
    return v4
  :L4
  .line 326
    return v0
  :L5
  .line 332
    sget-object v1, Lcom/innioasis/y1/service/PlayerService$Playing;->FM:Lcom/innioasis/y1/service/PlayerService$Playing;
    if-ne v2, v1, :L7
  .line 333
    new-instance v1, Landroid/content/Intent;
    const-class v2, Lcom/innioasis/fm/FMMainActivity;
    invoke-direct { v1, p0, v2 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L6
  .line 334
    return v4
  :L7
  .line 338
    goto :L9
  :L8
  .line 336
    move-exception p0
  :L9
  .line 339
    return v0
  :L10
  .line 320
    return v0
.end method

.method public static playingBook()Z
  .registers 2
  .line 61
    invoke-static { }, Lcom/innioasis/ipp/Audio;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 62
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlaying()Lcom/innioasis/y1/service/PlayerService$Playing;
    move-result-object v0
    sget-object v1, Lcom/innioasis/y1/service/PlayerService$Playing;->Audiobook:Lcom/innioasis/y1/service/PlayerService$Playing;
    if-ne v0, v1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method public static rate()F
  .registers 1
  .line 68
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getAudiobookPlayRate()F
    move-result v0
    return v0
.end method

.method public static rateLabel()Ljava/lang/String;
  .registers 3
  .line 77
    invoke-static { }, Lcom/innioasis/ipp/Audio;->rate()F
    move-result v0
  .line 78
    sget-object v1, Lcom/innioasis/ipp/Audio;->RATES:[F
    const/4 v2, 0
    aget v2, v1, v2
    cmpl-float v2, v0, v2
    if-nez v2, :L0
    const-string v0, "0.75"
    return-object v0
  :L0
  .line 79
    const/4 v2, 2
    aget v2, v1, v2
    cmpl-float v2, v0, v2
    if-nez v2, :L1
    const-string v0, "1.25"
    return-object v0
  :L1
  .line 80
    const/4 v2, 3
    aget v2, v1, v2
    cmpl-float v2, v0, v2
    if-nez v2, :L2
    const-string v0, "1.5"
    return-object v0
  :L2
  .line 81
    const/4 v2, 4
    aget v1, v1, v2
    cmpl-float v0, v0, v1
    if-nez v0, :L3
    const-string v0, "2.0"
    return-object v0
  :L3
  .line 82
    const-string v0, "1.0"
    return-object v0
.end method

.method public static rateOff()Z
  .registers 3
  .line 94
    invoke-static { }, Lcom/innioasis/ipp/Audio;->rate()F
    move-result v0
    sget-object v1, Lcom/innioasis/ipp/Audio;->RATES:[F
    const/4 v2, 1
    aget v1, v1, v2
    cmpl-float v0, v0, v1
    if-nez v0, :L0
    goto :L1
  :L0
    const/4 v2, 0
  :L1
    return v2
.end method

.method private static stopTimer()V
  .registers 1
  .line 166
    sget-object v0, Lcom/innioasis/y1/Y1Application;->timer2:Landroid/os/CountDownTimer;
  .line 167
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/os/CountDownTimer;->cancel()V
  :L0
  .line 168
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/y1/Y1Application;->timer2:Landroid/os/CountDownTimer;
  .line 169
    return-void
.end method

.method private static svc()Lcom/innioasis/y1/service/PlayerService;
  .registers 1
  .line 56
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
    return-object v0
.end method

.method public static timerLabel()Ljava/lang/String;
  .registers 5
  .line 131
    invoke-static { }, Lcom/innioasis/ipp/Audio;->timerMs()J
    move-result-wide v0
  .line 132
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-gtz v4, :L0
    const-string v0, "\u2014"
    return-object v0
  :L0
  .line 133
    const-wide/32 v2, 60000
    div-long/2addr v0, v2
    invoke-static { v0, v1 }, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public static timerMs()J
  .registers 2
  .line 126
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getAudiobookPlayTime()J
    move-result-wide v0
    return-wide v0
.end method

.method public static timerOff()Z
  .registers 5
  .line 138
    invoke-static { }, Lcom/innioasis/ipp/Audio;->timerMs()J
    move-result-wide v0
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-gtz v4, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method public static title(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L3
  .registers 4
  :L0
  .line 213
    const-string v0, "book_meta_title"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L2
    if-eqz p1, :L2
  .line 214
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    if-lez p0, :L2
  .line 215
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 219
    goto :L4
  :L3
  .line 217
    move-exception p0
  :L4
  .line 220
    if-nez p2, :L5
    const-string p2, ""
  :L5
  .line 221
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    sget-object p1, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p1, p2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static write(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;JJ)V
  .catchall { :L0 .. :L8 } :L9
  .registers 16
  .line 292
    if-eqz p1, :L11
    const-wide/16 v0, 0
    cmp-long v2, p2, v0
    if-gez v2, :L0
    goto :L11
  :L0
  .line 293
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 294
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
  .line 295
    if-eqz v1, :L2
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object v2
    if-nez v2, :L1
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object p1
    goto :L3
  :L2
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object p1
  :L3
    move-object v2, p1
  .line 296
    if-nez v2, :L4
    return-void
  :L4
  .line 299
    new-instance p1, Lcom/innioasis/y1/database/Bookmark;
    new-instance v1, Ljava/util/Date;
    invoke-direct { v1 }, Ljava/util/Date;-><init>()V
    invoke-virtual { v1 }, Ljava/util/Date;->getTime()J
    move-result-wide v7
    invoke-static { }, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
    move-result-object v9
    move-object v1, p1
    move-wide v3, p2
    move-wide v5, p4
    invoke-direct/range { v1 .. v9 }, Lcom/innioasis/y1/database/Bookmark;-><init>(Ljava/lang/String;JJJLjava/util/UUID;)V
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->insertBookmark(Lcom/innioasis/y1/database/Bookmark;)V
  .line 300
    if-eqz p0, :L6
  :L5
    goto :L7
  :L6
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
    goto :L5
  :L7
  .line 301
    if-eqz p0, :L8
  .line 302
    const p1, 2131820662
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    const/4 p2, 0
    invoke-static { p0, p1, p2 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L8
  .line 306
    goto :L10
  :L9
  .line 304
    move-exception p0
  :L10
  .line 307
    return-void
  :L11
  .line 292
    return-void
.end method

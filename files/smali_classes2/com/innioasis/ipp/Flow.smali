.class public final Lcom/innioasis/ipp/Flow;
.super Ljava/lang/Object;
.source "Flow.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Flow$Item;,
    Lcom/innioasis/ipp/Flow$Order;,
    Lcom/innioasis/ipp/Flow$Back;,
    Lcom/innioasis/ipp/Flow$FadeStart;,
    Lcom/innioasis/ipp/Flow$ByName;,
    Lcom/innioasis/ipp/Flow$Faded;,
    Lcom/innioasis/ipp/Flow$Loader;
  }
.end annotation

.field public final static A_Z:I = 0

.field public final static BACK_EASE:F = 0.5769231F

.field private final static BY_NAME:Ljava/util/Comparator;

.field public final static CARD_EASE:F = 0.68289477F

.field public final static CARD_MS:I = 75

.field public final static COUNTS:[I

.field private final static EXTRA_BACK:Ljava/lang/String; = "ipp_flip_back"

.field public final static EXTRA_FLIP:Ljava/lang/String; = "ipp_flip"

.field public final static F:I = 2

.field private final static FADED:Ljava/lang/Runnable;

.field public final static FADE_MS:I = 250

.field private final static GEO_N:I = 11

.field public final static KEY_COUNT:Ljava/lang/String; = "flow_count"

.field private final static KEY_GEO:Ljava/lang/String; = "flow_geo_"

.field public final static KEY_GROUP:Ljava/lang/String; = "flow_group"

.field public final static KEY_SORT:Ljava/lang/String; = "flow_sort"

.field public final static KEY_START:Ljava/lang/String; = "flow_start"

.field public final static KEY_YEAR:Ljava/lang/String; = "flow_year"

.field public final static LEAVE_EASE:F = 1.0F

.field public final static LEAVE_MS:I = 130

.field public final static LIST_MS:I = 190

.field public final static MIR:Landroid/graphics/Rect;

.field private final static MIR_FROM:Landroid/graphics/Rect;

.field public final static MIR_GAP:I = 2

.field public final static MIR_H:I = 75

.field public final static MIR_W:I = 150

.field public final static NEWEST:I = 3

.field public final static OLDEST:I = 2

.field final static OPAQUE:Z = false

.field public final static PAD:I = 2

.field public final static REFL:I = 90

.field public final static REFL_ALPHA:I = 112

.field public final static S:I = 180

.field public final static SH:I = 184

.field public final static START_LAST:I = 0

.field public final static START_PLAYING:I = 1

.field public final static SW:I = 184

.field public final static TURN_EASE:F = 1.73F

.field public final static YEAR_ALBUM:I = 2

.field public final static YEAR_ARTIST:I = 1

.field public final static YEAR_OFF:I = 0

.field public final static Z_A:I = 1

.field private static fade:Landroid/graphics/Bitmap;

.field private static geoFlat:[F

.field private static geoTilt:[F

.field private static returning:Z

.field private static row:Ljava/util/List;

.field private static rowFor:Ljava/util/List;

.field private static rowGen:I

.method static constructor <clinit>()V
  .registers 5
  .line 81
    new-instance v0, Landroid/graphics/Rect;
    const/16 v1, 150
    const/16 v2, 261
    const/4 v3, 0
    const/16 v4, 186
    invoke-direct { v0, v3, v4, v1, v2 }, Landroid/graphics/Rect;-><init>(IIII)V
    sput-object v0, Lcom/innioasis/ipp/Flow;->MIR:Landroid/graphics/Rect;
  .line 105
    const/4 v0, 5
    const/4 v1, 7
    const/4 v2, 3
    filled-new-array { v2, v0, v1 }, [I
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Flow;->COUNTS:[I
  .line 353
    new-instance v0, Lcom/innioasis/ipp/Flow$ByName;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Flow$ByName;-><init>(Lcom/innioasis/ipp/Flow$1;)V
    sput-object v0, Lcom/innioasis/ipp/Flow;->BY_NAME:Ljava/util/Comparator;
  .line 454
    new-instance v0, Landroid/graphics/Rect;
    const/16 v1, 92
    const/16 v2, 182
    const/4 v3, 2
    invoke-direct { v0, v3, v1, v2, v2 }, Landroid/graphics/Rect;-><init>(IIII)V
    sput-object v0, Lcom/innioasis/ipp/Flow;->MIR_FROM:Landroid/graphics/Rect;
  .line 1134
    new-instance v0, Lcom/innioasis/ipp/Flow$Faded;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Flow$Faded;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Flow;->FADED:Ljava/lang/Runnable;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 140
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/util/Comparator;
  .registers 1
  .line 45
    sget-object v0, Lcom/innioasis/ipp/Flow;->BY_NAME:Ljava/util/Comparator;
    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/Runnable;
  .registers 1
  .line 45
    sget-object v0, Lcom/innioasis/ipp/Flow;->FADED:Ljava/lang/Runnable;
    return-object v0
.end method

.method public static albumLine(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
  .registers 4
  .line 136
    const/4 v0, 2
    if-ne p2, v0, :L1
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result p2
    if-nez p2, :L0
    goto :L1
  :L0
  .line 137
    new-instance p2, Ljava/lang/StringBuilder;
    invoke-direct { p2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p2, " ("
    invoke-virtual { p0, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, ")"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 136
    return-object p0
.end method

.method public static albums()Ljava/util/List;
  .catchall { :L0 .. :L4 } :L12
  .catchall { :L8 .. :L11 } :L10
  .catchall { :L13 .. :L14 } :L12
  .registers 6
  .line 225
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 226
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v2
  .line 227
    const-string v3, "flow songs"
    invoke-static { v3, v0, v1 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 228
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->gen()I
    move-result v0
  .line 229
    nop
  .line 230
    const-class v1, Lcom/innioasis/ipp/Flow;
    monitor-enter v1
  .line 231
    const/4 v3, -1
    if-eqz v2, :L2
  :L0
    sget-object v4, Lcom/innioasis/ipp/Flow;->rowFor:Ljava/util/List;
    if-ne v2, v4, :L2
    sget-object v4, Lcom/innioasis/ipp/Flow;->row:Ljava/util/List;
    if-eqz v4, :L2
  .line 232
    nop
  .line 233
    sget v5, Lcom/innioasis/ipp/Flow;->rowGen:I
    if-ne v0, v5, :L1
    const/4 v0, -1
    goto :L3
  :L1
  .line 234
    sput v0, Lcom/innioasis/ipp/Flow;->rowGen:I
    goto :L3
  :L2
  .line 236
    const/4 v4, 0
  :L3
    monitor-exit v1
  :L4
  .line 237
    if-eqz v4, :L7
  .line 239
    if-eq v0, v3, :L6
  .line 240
    const/4 v0, 0
  :L5
    invoke-interface { v4 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L6
  .line 241
    invoke-interface { v4, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Flow$Item;
  .line 242
    iget-object v2, v1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v3, v1, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Flow;->artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v2
    iput-object v2, v1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
  .line 243
    iget-object v2, v1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v3, v1, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Flow;->yearOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v2
    iput-object v2, v1, Lcom/innioasis/ipp/Flow$Item;->year:Ljava/lang/String;
  .line 240
    add-int/lit8 v0, v0, 1
    goto :L5
  :L6
  .line 246
    return-object v4
  :L7
  .line 248
    invoke-static { v2 }, Lcom/innioasis/ipp/Flow;->build(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
  .line 249
    const-class v3, Lcom/innioasis/ipp/Flow;
    monitor-enter v3
  .line 250
    if-eqz v2, :L9
  :L8
  .line 251
    sput-object v2, Lcom/innioasis/ipp/Flow;->rowFor:Ljava/util/List;
  .line 252
    sput v0, Lcom/innioasis/ipp/Flow;->rowGen:I
  .line 253
    sput-object v1, Lcom/innioasis/ipp/Flow;->row:Ljava/util/List;
  :L9
  .line 255
    monitor-exit v3
  .line 256
    return-object v1
  :L10
  .line 255
    move-exception v0
    monitor-exit v3
  :L11
    throw v0
  :L12
  .line 236
    move-exception v0
  :L13
    monitor-exit v1
  :L14
    goto :L16
  :L15
    throw v0
  :L16
    goto :L15
.end method

.method public static artistLine(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
  .registers 4
  .line 130
    const/4 v0, 1
    if-ne p2, v0, :L3
    if-eqz p1, :L3
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result p2
    if-nez p2, :L0
    goto :L3
  :L0
  .line 131
    if-eqz p0, :L2
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p2
    if-nez p2, :L1
    goto :L2
  :L1
    new-instance p2, Ljava/lang/StringBuilder;
    invoke-direct { p2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p2, " \u2022 "
    invoke-virtual { p0, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
  :L2
    return-object p1
  :L3
  .line 130
    return-object p0
.end method

.method static artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 3
  .line 214
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtist;->line(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static back(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/ipp/Flow$Back;
  .registers 14
  .line 380
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 381
    iget-object p0, p0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->songsOf(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 382
    nop
  .line 383
    const/4 v2, 0
    const/4 v3, 0
    const/4 v4, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    const/4 v6, 1
    if-ge v3, v5, :L3
  .line 384
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
  .line 385
    if-eqz v5, :L2
    invoke-static { v5 }, Lcom/innioasis/ipp/DiscCache;->known(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :L1
    goto :L2
  :L1
  .line 386
    invoke-static { v5, v6, v2 }, Lcom/innioasis/ipp/DiscCache;->read(Ljava/lang/String;ZZ)Lcom/innioasis/ipp/DiscCache$Tags;
    move-result-object v6
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/DiscCache;->commit(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .line 387
    add-int/lit8 v4, v4, 1
  :L2
  .line 383
    add-int/lit8 v3, v3, 1
    goto :L0
  :L3
  .line 389
    if-lez v4, :L4
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  :L4
  .line 390
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "flow back, "
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " of "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " read from the card"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, v0, v1 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 391
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
  .line 392
    if-eqz v0, :L5
    move-object p0, v0
  :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->byDisc(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
  .line 394
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 395
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->albumDiscs(Ljava/util/List;)[I
    move-result-object v1
  .line 396
    nop
  .line 397
    invoke-static { }, Lcom/innioasis/ipp/Disc;->trackTags()Z
    move-result v3
    const/4 v4, 0
    if-eqz v3, :L11
  .line 398
    new-array v3, v0, [I
  .line 399
    nop
  .line 400
    const/4 v5, 0
    const/4 v7, 0
  :L6
    if-ge v5, v0, :L10
  .line 401
    invoke-interface { p0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-static { v8 }, Lcom/innioasis/ipp/TrackCache;->get(Ljava/lang/String;)I
    move-result v8
  .line 402
    if-lez v8, :L7
    const v9, 2147483647
    if-eq v8, v9, :L7
    goto :L8
  :L7
    const/4 v8, 0
  :L8
    aput v8, v3, v5
  .line 403
    if-lez v8, :L9
    const/4 v7, 1
  :L9
  .line 400
    add-int/lit8 v5, v5, 1
    goto :L6
  :L10
  .line 405
    if-nez v7, :L12
    move-object v3, v4
    goto :L12
  :L11
  .line 397
    move-object v3, v4
  :L12
  .line 407
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 408
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct { v7 }, Ljava/util/ArrayList;-><init>()V
  .line 409
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8 }, Ljava/util/ArrayList;-><init>()V
  .line 410
    nop
  .line 411
    const/4 v9, 0
    const/4 v10, 0
  :L13
    if-ge v9, v0, :L20
  .line 412
    if-eqz v1, :L15
    if-eqz v9, :L14
    aget v11, v1, v9
    add-int/lit8 v12, v9, -1
    aget v12, v1, v12
    if-eq v11, v12, :L15
  :L14
  .line 413
    nop
  .line 414
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 415
    aget v10, v1, v9
    invoke-static { v10 }, Lcom/innioasis/ipp/Disc;->label(I)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v7, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 416
    const/4 v10, -1
    invoke-static { v10 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v10
    invoke-virtual { v8, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    move v10, v9
  :L15
  .line 418
    if-eqz v3, :L16
    aget v11, v3, v9
    goto :L17
  :L16
    sub-int v11, v9, v10
    add-int/2addr v11, v6
  :L17
  .line 419
    if-lez v11, :L18
    new-instance v12, Ljava/lang/StringBuilder;
    invoke-direct { v12 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v12, v11 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v11
    const-string v12, "."
    invoke-virtual { v11, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v11
    invoke-virtual { v11 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v11
    goto :L19
  :L18
    const-string v11, "#"
  :L19
    invoke-virtual { v5, v11 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 420
    invoke-interface { p0, v9 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v11
    check-cast v11, Lcom/innioasis/y1/database/Song;
    invoke-static { v11 }, Lcom/innioasis/ipp/Flow;->title(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v7, v11 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 421
    invoke-static { v9 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v11
    invoke-virtual { v8, v11 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 411
    add-int/lit8 v9, v9, 1
    goto :L13
  :L20
  .line 423
    new-instance v0, Lcom/innioasis/ipp/Flow$Back;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Flow$Back;-><init>()V
  .line 424
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
  .line 425
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [Ljava/lang/String;
    invoke-virtual { v5, p0 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->nums:[Ljava/lang/String;
  .line 426
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [Ljava/lang/String;
    invoke-virtual { v7, p0 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->texts:[Ljava/lang/String;
  .line 427
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [I
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->song:[I
  .line 428
    nop
  :L21
    iget-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->song:[I
    array-length p0, p0
    if-ge v2, p0, :L22
    iget-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->song:[I
    invoke-virtual { v8, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    aput v1, p0, v2
    add-int/lit8 v2, v2, 1
    goto :L21
  :L22
  .line 429
    return-object v0
.end method

.method static blank()Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L3
  .registers 10
  .line 472
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 473
    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 474
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131231142
    invoke-static { v2, v3, v1 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 476
    if-eqz v1, :L2
  .line 477
    invoke-static { }, Lcom/innioasis/ipp/Flow;->newSlide()Landroid/graphics/Bitmap;
    move-result-object v2
  .line 478
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 479
    new-instance v4, Landroid/graphics/Rect;
    const/16 v5, 182
    const/4 v6, 2
    invoke-direct { v4, v6, v6, v5, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v5, Landroid/graphics/Paint;
    invoke-direct { v5, v6 }, Landroid/graphics/Paint;-><init>(I)V
    const/4 v6, 0
    invoke-virtual { v3, v1, v6, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 480
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->recycle()V
  .line 481
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mirrorPaint()Landroid/graphics/Paint;
    move-result-object v1
    invoke-static { v3, v2, v1 }, Lcom/innioasis/ipp/Flow;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
  :L1
  .line 482
    return-object v2
  :L2
  .line 485
    goto :L4
  :L3
  .line 484
    move-exception v1
  :L4
  .line 487
    const/16 v1, 32400
    new-array v3, v1, [I
  .line 488
    const/4 v1, 0
  :L5
    const/16 v2, 180
    if-ge v1, v2, :L10
  .line 489
    const/4 v4, 0
  :L6
    if-ge v4, v2, :L9
  .line 490
    add-int v5, v4, v1
    mul-int/lit8 v5, v5, 48
    div-int/lit16 v5, v5, 360
    add-int/lit8 v5, v5, 48
  .line 491
    const/4 v6, 3
    if-lt v4, v6, :L7
    if-lt v1, v6, :L7
    const/16 v6, 177
    if-ge v4, v6, :L7
    if-lt v1, v6, :L8
  :L7
    const/16 v5, 96
  :L8
  .line 492
    mul-int/lit16 v6, v1, 180
    add-int/2addr v6, v4
    shl-int/lit8 v7, v5, 16
    const/high16 v8, 0xFF000000
    or-int/2addr v7, v8
    shl-int/lit8 v8, v5, 8
    or-int/2addr v7, v8
    or-int/2addr v5, v7
    aput v5, v3, v6
  .line 489
    add-int/lit8 v4, v4, 1
    goto :L6
  :L9
  .line 488
    add-int/lit8 v1, v1, 1
    goto :L5
  :L10
  .line 495
    invoke-static { }, Lcom/innioasis/ipp/Flow;->newSlide()Landroid/graphics/Bitmap;
    move-result-object v0
  .line 496
    const/4 v4, 0
    const/16 v5, 180
    const/4 v6, 2
    const/4 v7, 2
    const/16 v8, 180
    const/16 v9, 180
    move-object v2, v0
    invoke-virtual/range { v2 .. v9 }, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V
  .line 497
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1 }, Landroid/graphics/Canvas;-><init>()V
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mirrorPaint()Landroid/graphics/Paint;
    move-result-object v2
    invoke-static { v1, v0, v2 }, Lcom/innioasis/ipp/Flow;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
  .line 498
    return-object v0
.end method

.method private static build(Ljava/util/List;)Ljava/util/List;
  .registers 12
  .line 260
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 261
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 262
    if-nez p0, :L0
    return-object v0
  :L0
  .line 263
    new-instance v3, Ljava/util/HashMap;
    invoke-direct { v3 }, Ljava/util/HashMap;-><init>()V
  .line 265
    new-instance v4, Ljava/util/HashMap;
    invoke-direct { v4 }, Ljava/util/HashMap;-><init>()V
  .line 266
    const/4 v5, 0
    const/4 v6, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v7
    if-ge v6, v7, :L6
  .line 267
    invoke-interface { p0, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
  .line 268
    if-eqz v7, :L5
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    if-nez v8, :L2
    goto :L5
  :L2
  .line 269
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct { v8 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    const/16 v9, 10
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    invoke-static { v9 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v8
  .line 270
    invoke-virtual { v4, v8 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Ljava/lang/String;
  .line 271
    if-nez v9, :L3
  .line 272
    invoke-static { v7 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v9
  .line 273
    invoke-virtual { v4, v8, v9 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 275
    invoke-virtual { v3, v9 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
  .line 276
    if-eqz v8, :L4
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v10, v8 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v8
    if-gez v8, :L5
  :L4
    invoke-virtual { v3, v9, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 266
    add-int/lit8 v6, v6, 1
    goto :L1
  :L6
  .line 278
    invoke-virtual { v3 }, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    move-result-object p0
    invoke-interface { p0 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object p0
  .line 279
    nop
  :L7
    array-length v4, p0
    if-ge v5, v4, :L8
  .line 280
    aget-object v4, p0, v5
    check-cast v4, Ljava/lang/String;
  .line 281
    new-instance v6, Lcom/innioasis/ipp/Flow$Item;
    sget-object v7, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v7, v8 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v3, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
    invoke-direct { v6, v4, v7, v8 }, Lcom/innioasis/ipp/Flow$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/database/Song;)V
    invoke-virtual { v0, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 279
    add-int/lit8 v5, v5, 1
    goto :L7
  :L8
  .line 283
    sget-object p0, Lcom/innioasis/ipp/Flow;->BY_NAME:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 284
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "flow albums "
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 285
    return-object v0
.end method

.method public static cacheSlide(Ljava/lang/String;)Z
  .catchall { :L0 .. :L4 } :L6
  .registers 3
  :L0
  .line 552
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 553
    if-eqz v0, :L5
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L1
    goto :L5
  :L1
  .line 554
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 555
    if-nez v0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->trackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L2
  .line 556
    if-nez v0, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p0
    return p0
  :L3
  .line 557
    const/16 v1, 180
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/FlowCache;->write(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    move-result p0
  :L4
    return p0
  :L5
  .line 553
    const/4 p0, 1
    return p0
  :L6
  .line 558
    move-exception p0
  .line 559
    const/4 p0, 0
    return p0
.end method

.method public static count(Landroid/content/Context;)I
  .registers 3
  .line 108
    const-string v0, "flow_count"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
  .line 109
    sget-object v0, Lcom/innioasis/ipp/Flow;->COUNTS:[I
    if-ltz p0, :L0
    array-length v1, v0
    if-ge p0, v1, :L0
    goto :L1
  :L0
    array-length p0, v0
    add-int/lit8 p0, p0, -1
  :L1
    aget p0, v0, p0
    return p0
.end method

.method public static coverOf(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/y1/database/Song;
  .registers 3
  .line 200
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Art;->pickedPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 201
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 202
    new-instance p0, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0 }, Lcom/innioasis/y1/database/Song;-><init>()V
  .line 203
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setPath(Ljava/lang/String;)V
  .line 204
    return-object p0
  :L1
  .line 201
    iget-object p0, p0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    return-object p0
.end method

.method static fade()Landroid/graphics/Bitmap;
  .registers 5
  .line 514
    sget-object v0, Lcom/innioasis/ipp/Flow;->fade:Landroid/graphics/Bitmap;
    if-nez v0, :L2
  .line 515
    const/16 v0, 90
    new-array v1, v0, [I
  .line 516
    const/4 v2, 0
  :L0
    const/4 v3, 1
    if-ge v2, v0, :L1
    mul-int/lit8 v4, v2, 2
    add-int/2addr v4, v3
    mul-int/lit8 v4, v4, 112
    div-int/lit16 v4, v4, 180
    shl-int/lit8 v3, v4, 24
    aput v3, v1, v2
    add-int/lit8 v2, v2, 1
    goto :L0
  :L1
  .line 517
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v1, v3, v0, v2 }, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Flow;->fade:Landroid/graphics/Bitmap;
  :L2
  .line 519
    sget-object v0, Lcom/innioasis/ipp/Flow;->fade:Landroid/graphics/Bitmap;
    return-object v0
.end method

.method private static fadeIn(Landroid/app/Activity;)V
  .catchall { :L0 .. :L9 } :L11
  .registers 10
  .line 1064
    const v0, 2131361957
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 1065
    const v1, 2131361979
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 1066
    const v2, 2131361980
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 1067
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    instance-of v2, v2, Landroid/view/ViewGroup;
    if-nez v2, :L1
    goto :L10
  :L1
  .line 1068
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup;
  .line 1069
    new-instance v3, Lcom/innioasis/ipp/Flow$FadeStart;
    invoke-direct { v3 }, Lcom/innioasis/ipp/Flow$FadeStart;-><init>()V
  .line 1070
    const/4 v4, 0
    const/4 v5, 0
  :L2
    invoke-virtual { v2 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v6
    if-ge v5, v6, :L8
  .line 1071
    invoke-virtual { v2, v5 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 1072
    invoke-virtual { v6 }, Landroid/view/View;->getId()I
    move-result v7
  .line 1073
    const v8, 2131362297
    if-eq v7, v8, :L7
    const v8, 2131362191
    if-ne v7, v8, :L3
    goto :L7
  :L3
  .line 1074
    if-eq v6, v0, :L4
  .line 1075
    invoke-virtual { v3, v6 }, Lcom/innioasis/ipp/Flow$FadeStart;->add(Landroid/view/View;)V
  .line 1076
    goto :L7
  :L4
  .line 1078
    move-object v6, v0
    check-cast v6, Landroid/view/ViewGroup;
  .line 1079
    const/4 v7, 0
  :L5
    invoke-virtual { v6 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v8
    if-ge v7, v8, :L7
  .line 1080
    invoke-virtual { v6, v7 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v8
  .line 1081
    if-eq v8, v1, :L6
    if-eq v8, p0, :L6
    invoke-virtual { v3, v8 }, Lcom/innioasis/ipp/Flow$FadeStart;->add(Landroid/view/View;)V
  :L6
  .line 1079
    add-int/lit8 v7, v7, 1
    goto :L5
  :L7
  .line 1070
    add-int/lit8 v5, v5, 1
    goto :L2
  :L8
  .line 1084
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p0
    invoke-virtual { p0, v3 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L9
  .line 1086
    goto :L12
  :L10
  .line 1067
    return-void
  :L11
  .line 1085
    move-exception p0
  :L12
  .line 1087
    return-void
.end method

.method public static flipBack(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 5
  .line 1147
    const-string v0, "ipp_flip_back"
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v2
  .line 1148
    if-eqz v2, :L3
    invoke-virtual { v2, v0, v1 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v3
    if-nez v3, :L1
    goto :L3
  :L1
  .line 1149
    invoke-virtual { v2, v0 }, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
  .line 1150
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->measure(Landroid/app/Activity;)V
  .line 1151
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 1152
    invoke-virtual { p0 }, Landroid/app/Activity;->finish()V
  .line 1153
    invoke-virtual { p0, v1, v1 }, Landroid/app/Activity;->overridePendingTransition(II)V
  :L2
  .line 1154
    return v0
  :L3
  .line 1148
    return v1
  :L4
  .line 1155
    move-exception p0
  .line 1156
    return v1
.end method

.method public static flipIn(Landroid/app/Activity;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  .line 1041
    const-string v0, "ipp_flip"
    const-string v1, "base"
    invoke-static { v1 }, Lcom/innioasis/ipp/Open;->step(Ljava/lang/String;)V
  :L0
  .line 1043
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
  .line 1044
    if-eqz v1, :L6
    const/4 v2, 0
    invoke-virtual { v1, v0, v2 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v2
    if-nez v2, :L1
    goto :L6
  :L1
  .line 1046
    invoke-virtual { v1, v0 }, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
  .line 1047
    const-string v0, "ipp_flip_back"
    const/4 v2, 1
    invoke-virtual { v1, v0, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 1050
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 1051
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L3
  .line 1052
    if-eqz v0, :L4
    instance-of v1, p0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v1, :L4
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/base/BasePlayerActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Cover;->instantCover(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  :L4
  .line 1053
    const-string v0, "cover"
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->step(Ljava/lang/String;)V
  .line 1054
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->fadeIn(Landroid/app/Activity;)V
  :L5
  .line 1056
    goto :L8
  :L6
  .line 1044
    return-void
  :L7
  .line 1055
    move-exception p0
  :L8
  .line 1057
    return-void
.end method

.method public static geo(Landroid/content/Context;)[F
  .catchall { :L3 .. :L9 } :L11
  .registers 6
  .line 951
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 952
    if-eqz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L1
  :L0
    sget-object v1, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L1
  .line 953
    if-eqz v1, :L2
    return-object v1
  :L2
  .line 955
    const/16 v1, 11
  :L3
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "flow_geo_"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    if-eqz v0, :L4
    const-string v3, "flat"
    goto :L5
  :L4
    const-string v3, "tilt"
  :L5
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    const/4 v3, 0
    invoke-static { p0, v2, v3 }, Lcom/innioasis/ipp/Prefs;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 956
    if-eqz p0, :L10
  .line 957
    const-string v2, ","
    invoke-virtual { p0, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 958
    array-length v2, p0
    if-ne v2, v1, :L10
  .line 959
    new-array v2, v1, [F
  .line 960
    const/4 v3, 0
  :L6
    if-ge v3, v1, :L7
    aget-object v4, p0, v3
    invoke-static { v4 }, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    move-result v4
    aput v4, v2, v3
    add-int/lit8 v3, v3, 1
    goto :L6
  :L7
  .line 961
    if-eqz v0, :L8
    sput-object v2, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L9
  :L8
  .line 962
    sput-object v2, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L9
  .line 963
    return-object v2
  :L10
  .line 967
    goto :L12
  :L11
  .line 966
    move-exception p0
  :L12
  .line 968
    if-eqz v0, :L13
    new-array p0, v1, [F
    fill-array-data p0, :L15
    goto :L14
  :L13
  .line 969
    new-array p0, v1, [F
    fill-array-data p0, :L16
  :L14
  .line 968
    return-object p0
  :L15
  .array-data 4
      1092616192
      1112014848
      1130758144
      1135378432
      1122369536
      1126989824
      0
      0
      0
      1097859072
      0
  .end array-data
  :L16
  .array-data 4
      1092616192
      1112014848
      1132756992
      1137115136
      0
      1124379307
      1101004800
      0
      0
      0
      0
  .end array-data
.end method

.method private static measure(Landroid/app/Activity;)V
  .registers 9
  .line 973
    const v0, 2131361979
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 974
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-eqz v1, :L1
  :L0
    const v0, 2131361980
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 975
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v1
    if-gtz v1, :L2
    goto/16 :L10
  :L2
  .line 977
    const/4 v1, 2
    new-array v2, v1, [I
  .line 978
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3, v2 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 979
    const/16 v3, 11
    new-array v4, v3, [F
    const/4 v5, 0
    aget v6, v2, v5
    invoke-virtual { v0 }, Landroid/view/View;->getLeft()I
    move-result v7
    add-int/2addr v6, v7
    int-to-float v6, v6
    aput v6, v4, v5
    const/4 v6, 1
    aget v2, v2, v6
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v7
    add-int/2addr v2, v7
    int-to-float v2, v2
    aput v2, v4, v6
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v2
    int-to-float v2, v2
    aput v2, v4, v1
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
    int-to-float v1, v1
    const/4 v2, 3
    aput v1, v4, v2
  .line 980
    invoke-virtual { v0 }, Landroid/view/View;->getPivotX()F
    move-result v1
    const/4 v2, 4
    aput v1, v4, v2
    const/4 v1, 5
    invoke-virtual { v0 }, Landroid/view/View;->getPivotY()F
    move-result v2
    aput v2, v4, v1
    const/4 v1, 6
    invoke-virtual { v0 }, Landroid/view/View;->getRotationY()F
    move-result v2
    aput v2, v4, v1
  .line 981
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingLeft()I
    move-result v1
    int-to-float v1, v1
    const/4 v2, 7
    aput v1, v4, v2
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingTop()I
    move-result v1
    int-to-float v1, v1
    const/16 v2, 8
    aput v1, v4, v2
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingRight()I
    move-result v1
    int-to-float v1, v1
    const/16 v2, 9
    aput v1, v4, v2
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingBottom()I
    move-result v0
    int-to-float v0, v0
    const/16 v1, 10
    aput v0, v4, v1
  .line 982
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 983
    if-eqz v0, :L3
    sput-object v4, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L4
  :L3
  .line 984
    sput-object v4, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L4
  .line 985
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 986
    nop
  :L5
    if-ge v5, v3, :L7
  .line 987
    if-lez v5, :L6
    const/16 v2, 44
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L6
  .line 988
    aget v2, v4, v5
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
  .line 986
    add-int/lit8 v5, v5, 1
    goto :L5
  :L7
  .line 990
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "flow_geo_"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    if-eqz v0, :L8
    const-string v0, "flat"
    goto :L9
  :L8
    const-string v0, "tilt"
  :L9
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
  .line 991
    return-void
  :L10
  .line 975
    return-void
.end method

.method static mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
  .registers 5
  .line 458
    invoke-virtual { p0, p1 }, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
  .line 459
    sget-object v0, Lcom/innioasis/ipp/Flow;->MIR_FROM:Landroid/graphics/Rect;
    sget-object v1, Lcom/innioasis/ipp/Flow;->MIR:Landroid/graphics/Rect;
    invoke-virtual { p0, p1, v0, v1, p2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 460
    return-void
.end method

.method static mirrorPaint()Landroid/graphics/Paint;
  .registers 3
  .line 464
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
  .line 465
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v2 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 466
    return-object v0
.end method

.method public static musicMenu(Ljava/util/List;Landroid/content/Context;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 147
    const v0, 2131821167
  :L0
    invoke-virtual { p1, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
  .line 148
    invoke-interface { p0, p1 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const/4 v0, 0
    invoke-interface { p0, v0, p1 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L1
  .line 150
    goto :L3
  :L2
  .line 149
    move-exception p0
  :L3
  .line 151
    return-void
.end method

.method public static musicPick(Landroid/app/Activity;I)I
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 159
    if-gez p1, :L0
    return p1
  :L0
  .line 160
    sget-object v0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v0 }, Lcom/innioasis/music/objects/Constant;->getMainList()Ljava/util/List;
    move-result-object v0
  .line 161
    if-eqz v0, :L4
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L4
    const v1, 2131821167
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    const/4 v2, 0
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    goto :L4
  :L1
  .line 162
    if-lez p1, :L2
    add-int/lit8 p1, p1, -1
    return p1
  :L2
  .line 163
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L3
  .line 164
    const/4 p0, -1
    return p0
  :L4
  .line 161
    return p1
  :L5
  .line 165
    move-exception p0
  .line 166
    return p1
.end method

.method static newSlide()Landroid/graphics/Bitmap;
  .registers 3
  .line 451
    sget-object v0, Lcom/innioasis/ipp/Flow;->MIR:Landroid/graphics/Rect;
    iget v0, v0, Landroid/graphics/Rect;->bottom:I
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v2, 184
    invoke-static { v2, v0, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    return-object v0
.end method

.method public static ordered(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;
  .registers 11
  .line 293
    const-string v0, "flow_sort"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 294
    const-string v1, "flow_group"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
    const/4 v1, 1
    const/4 v2, 0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
  .line 295
    if-eqz p1, :L14
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-nez v3, :L14
    if-nez v0, :L2
    if-nez p0, :L2
    goto/16 :L14
  :L2
  .line 296
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 297
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5, p1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 298
    const/4 p1, 2
    if-eq v0, p1, :L3
    const/4 p1, 3
    if-ne v0, p1, :L6
  :L3
  .line 299
    new-instance p1, Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v6
    invoke-direct { p1, v6 }, Ljava/util/ArrayList;-><init>(I)V
  .line 300
    const/4 v6, 0
  :L4
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v7
    if-ge v6, v7, :L5
    invoke-virtual { v5, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/ipp/Flow$Item;
    iget-object v7, v7, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-virtual { p1, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v6, v6, 1
    goto :L4
  :L5
  .line 301
    invoke-static { p1 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  :L6
  .line 303
    nop
  .line 304
    if-eqz p0, :L12
  .line 305
    new-instance p0, Ljava/util/HashMap;
    invoke-direct { p0 }, Ljava/util/HashMap;-><init>()V
  .line 306
    nop
  .line 307
    const/4 p1, 0
  :L7
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v2, v6, :L11
  .line 308
    invoke-virtual { v5, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Flow$Item;
  .line 309
    iget-object v7, v6, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v7 }, Lcom/innioasis/ipp/AlbumArtist;->needsRead(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :L8
  .line 310
    iget-object p1, v6, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v7, v6, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { p1, v7 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .line 311
    iget-object p1, v6, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v7, v6, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { p1, v7 }, Lcom/innioasis/ipp/Flow;->artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
    iput-object p1, v6, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
  .line 312
    iget-object p1, v6, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v7, v6, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { p1, v7 }, Lcom/innioasis/ipp/Flow;->yearOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
    iput-object p1, v6, Lcom/innioasis/ipp/Flow$Item;->year:Ljava/lang/String;
  .line 313
    const/4 p1, 1
  :L8
  .line 316
    iget-object v7, v6, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v8, v6, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v8
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/AlbumArtist;->line(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
  .line 317
    if-nez v7, :L9
    const-string v7, ""
    goto :L10
  :L9
    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v7, v8 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v7
  :L10
    invoke-virtual { p0, v6, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 307
    add-int/lit8 v2, v2, 1
    goto :L7
  :L11
  .line 319
    if-eqz p1, :L13
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
    goto :L13
  :L12
  .line 304
    const/4 p0, 0
  :L13
  .line 321
    new-instance p1, Lcom/innioasis/ipp/Flow$Order;
    invoke-direct { p1, v0, p0 }, Lcom/innioasis/ipp/Flow$Order;-><init>(ILjava/util/HashMap;)V
    invoke-static { v5, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 322
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string p1, "flow order "
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, v3, v4 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 323
    return-object v5
  :L14
  .line 295
    return-object p1
.end method

.method public static slideFrom(Ljava/lang/String;[B)Z
  .catchall { :L0 .. :L6 } :L8
  .registers 7
  .line 528
    const/4 v0, 0
    if-eqz p1, :L9
  :L0
    array-length v1, p1
    if-nez v1, :L1
    goto :L9
  :L1
  .line 529
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 530
    if-nez v1, :L2
    return v0
  :L2
  .line 531
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v1
    const/4 v2, 1
    if-eqz v1, :L3
    return v2
  :L3
  .line 532
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 533
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 534
    array-length v2, p1
    invoke-static { p1, v0, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 535
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L7
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L4
    goto :L7
  :L4
  .line 536
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v4, 180
    invoke-static { v2, v3, v4, v4 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v2
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 537
    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 538
    array-length v2, p1
    invoke-static { p1, v0, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 539
    if-nez p1, :L5
    return v0
  :L5
  .line 540
    invoke-static { p1, v4 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/FlowCache;->write(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    move-result p0
  :L6
    return p0
  :L7
  .line 535
    return v0
  :L8
  .line 541
    move-exception p0
  .line 542
    return v0
  :L9
  .line 528
    return v0
.end method

.method public static takeReturning()Z
  .registers 2
  .line 944
    sget-boolean v0, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 945
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 946
    return v0
.end method

.method public static title(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 4
  .line 438
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v0
  .line 439
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v1
    if-eqz v1, :L1
    const-string v1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 442
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :L4
  :L1
  .line 440
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v1
    goto :L3
  :L2
    new-instance v1, Ljava/io/File;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v1
  :L3
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L4
  .line 444
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Feat;->title(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .registers 3
  .line 998
    const/4 v0, 0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
  .catchall { :L2 .. :L14 } :L17
  .catchall { :L14 .. :L16 } :L15
  .catchall { :L16 .. :L17 } :L17
  .registers 8
  .line 1012
    const/4 v0, 1
    const/4 v1, 0
    if-eqz p2, :L0
    const/4 v2, 1
    goto :L1
  :L0
    const/4 v2, 0
  :L1
  .line 1013
    const/4 v3, 0
    if-nez p0, :L2
    move-object p0, v3
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  :L3
  .line 1015
    if-eqz p0, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L4
    invoke-static { }, Lcom/innioasis/ipp/Cover;->blankCover()Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L4
  .line 1016
    if-nez p0, :L5
    move-object v4, v3
    goto :L7
  :L5
    if-eqz v2, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v4
    goto :L7
  :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v4
  :L7
  .line 1017
    if-nez v4, :L11
    if-eqz p1, :L11
  .line 1018
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 1019
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L8
    invoke-static { }, Lcom/innioasis/ipp/Cover;->blankCover()Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L8
  .line 1020
    if-eqz v2, :L9
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p1
    goto :L10
  :L9
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L10
    move-object v4, p1
  :L11
  .line 1022
    if-nez v4, :L12
    return-object v3
  :L12
  .line 1023
    if-eqz v2, :L13
  .line 1024
    aput-object v4, p2, v1
  .line 1025
    aput-object p0, p2, v0
  :L13
  .line 1029
    const-class p0, Lcom/innioasis/ipp/Cover;
    monitor-enter p0
  :L14
  .line 1030
    invoke-static { v4 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->reflect(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 1031
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->hold(Landroid/graphics/Bitmap;)V
  .line 1032
    monitor-exit p0
    return-object p1
  :L15
  .line 1033
    move-exception p1
    monitor-exit p0
  :L16
    throw p1
  :L17
  .line 1034
    move-exception p0
  .line 1035
    return-object v3
.end method

.method public static tripAhead(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
  .registers 3
  .line 1007
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method public static yearAt(Landroid/content/Context;)I
  .registers 2
  .line 125
    const-string v0, "flow_year"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method static yearOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 2
  .line 209
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->label(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

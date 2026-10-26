.class public final Lcom/innioasis/ipp/Flow;
.super Ljava/lang/Object;
.source "Flow.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Flow$Item;,
    Lcom/innioasis/ipp/Flow$Back;,
    Lcom/innioasis/ipp/Flow$ByName;,
    Lcom/innioasis/ipp/Flow$Loader;
  }
.end annotation

.field public final static BACK_EASE:F = 0.5769231F

.field private final static BY_NAME:Ljava/util/Comparator;

.field public final static CARD_EASE:F = 0.68289477F

.field public final static CARD_MS:I = 75

.field private final static EXTRA_BACK:Ljava/lang/String; = "ipp_flip_back"

.field public final static EXTRA_FLIP:Ljava/lang/String; = "ipp_flip"

.field public final static F:I = 2

.field public final static FADE_MS:I = 250

.field private final static GEO_N:I = 11

.field private final static KEY_GEO:Ljava/lang/String; = "flow_geo_"

.field public final static LEAVE_EASE:F = 1.0F

.field public final static LEAVE_MS:I = 130

.field public final static LIST_MS:I = 190

.field public final static MIR:Landroid/graphics/Rect;

.field private final static MIR_FROM:Landroid/graphics/Rect;

.field public final static MIR_GAP:I = 2

.field public final static MIR_H:I = 75

.field public final static MIR_W:I = 150

.field final static OPAQUE:Z = false

.field public final static PAD:I = 2

.field public final static REFL:I = 90

.field public final static REFL_ALPHA:I = 112

.field public final static S:I = 180

.field public final static SH:I = 184

.field public final static SW:I = 184

.field public final static TURN_EASE:F = 1.73F

.field private static fade:Landroid/graphics/Bitmap;

.field private static geoFlat:[F

.field private static geoTilt:[F

.field private static returning:Z

.field private static row:Ljava/util/List;

.field private static rowFor:Ljava/util/List;

.field private static rowGen:I

.method static constructor <clinit>()V
  .registers 5
  .line 80
    new-instance v0, Landroid/graphics/Rect;
    const/16 v1, 150
    const/16 v2, 261
    const/4 v3, 0
    const/16 v4, 186
    invoke-direct { v0, v3, v4, v1, v2 }, Landroid/graphics/Rect;-><init>(IIII)V
    sput-object v0, Lcom/innioasis/ipp/Flow;->MIR:Landroid/graphics/Rect;
  .line 228
    new-instance v0, Lcom/innioasis/ipp/Flow$ByName;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Flow$ByName;-><init>(Lcom/innioasis/ipp/Flow$1;)V
    sput-object v0, Lcom/innioasis/ipp/Flow;->BY_NAME:Ljava/util/Comparator;
  .line 329
    new-instance v0, Landroid/graphics/Rect;
    const/16 v1, 184
    const/16 v2, 182
    const/16 v4, 92
    invoke-direct { v0, v3, v4, v1, v2 }, Landroid/graphics/Rect;-><init>(IIII)V
    sput-object v0, Lcom/innioasis/ipp/Flow;->MIR_FROM:Landroid/graphics/Rect;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 102
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static albums()Ljava/util/List;
  .catchall { :L0 .. :L4 } :L12
  .catchall { :L8 .. :L11 } :L10
  .catchall { :L13 .. :L14 } :L12
  .registers 6
  .line 166
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 167
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v2
  .line 168
    const-string v3, "flow songs"
    invoke-static { v3, v0, v1 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 169
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->gen()I
    move-result v0
  .line 170
    nop
  .line 171
    const-class v1, Lcom/innioasis/ipp/Flow;
    monitor-enter v1
  .line 172
    const/4 v3, -1
    if-eqz v2, :L2
  :L0
    sget-object v4, Lcom/innioasis/ipp/Flow;->rowFor:Ljava/util/List;
    if-ne v2, v4, :L2
    sget-object v4, Lcom/innioasis/ipp/Flow;->row:Ljava/util/List;
    if-eqz v4, :L2
  .line 173
    nop
  .line 174
    sget v5, Lcom/innioasis/ipp/Flow;->rowGen:I
    if-ne v0, v5, :L1
    const/4 v0, -1
    goto :L3
  :L1
  .line 175
    sput v0, Lcom/innioasis/ipp/Flow;->rowGen:I
    goto :L3
  :L2
  .line 177
    const/4 v4, 0
  :L3
    monitor-exit v1
  :L4
  .line 178
    if-eqz v4, :L7
  .line 180
    if-eq v0, v3, :L6
  .line 181
    const/4 v0, 0
  :L5
    invoke-interface { v4 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L6
  .line 182
    invoke-interface { v4, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Flow$Item;
  .line 183
    iget-object v2, v1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v3, v1, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    iget-object v5, v1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v5 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v2, v3, v5 }, Lcom/innioasis/ipp/Flow;->artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    iput-object v2, v1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
  .line 181
    add-int/lit8 v0, v0, 1
    goto :L5
  :L6
  .line 186
    return-object v4
  :L7
  .line 188
    invoke-static { v2 }, Lcom/innioasis/ipp/Flow;->build(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
  .line 189
    const-class v3, Lcom/innioasis/ipp/Flow;
    monitor-enter v3
  .line 190
    if-eqz v2, :L9
  :L8
  .line 191
    sput-object v2, Lcom/innioasis/ipp/Flow;->rowFor:Ljava/util/List;
  .line 192
    sput v0, Lcom/innioasis/ipp/Flow;->rowGen:I
  .line 193
    sput-object v1, Lcom/innioasis/ipp/Flow;->row:Ljava/util/List;
  :L9
  .line 195
    monitor-exit v3
  .line 196
    return-object v1
  :L10
  .line 195
    move-exception v0
    monitor-exit v3
  :L11
    throw v0
  :L12
  .line 177
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

.method static artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 155
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p1
    invoke-static { p2, p1 }, Lcom/innioasis/ipp/AlbumArtists;->of(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static back(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/ipp/Flow$Back;
  .registers 14
  .line 255
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 256
    iget-object p0, p0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->songsOf(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 257
    nop
  .line 258
    const/4 v2, 0
    const/4 v3, 0
    const/4 v4, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    const/4 v6, 1
    if-ge v3, v5, :L3
  .line 259
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
  .line 260
    if-eqz v5, :L2
    invoke-static { v5 }, Lcom/innioasis/ipp/DiscCache;->known(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :L1
    goto :L2
  :L1
  .line 261
    invoke-static { v5, v6, v2 }, Lcom/innioasis/ipp/DiscCache;->read(Ljava/lang/String;ZZ)Lcom/innioasis/ipp/DiscCache$Tags;
    move-result-object v6
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/DiscCache;->commit(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .line 262
    add-int/lit8 v4, v4, 1
  :L2
  .line 258
    add-int/lit8 v3, v3, 1
    goto :L0
  :L3
  .line 264
    if-lez v4, :L4
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  :L4
  .line 265
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
  .line 266
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
  .line 267
    if-eqz v0, :L5
    move-object p0, v0
  :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->byDisc(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
  .line 269
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 270
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->albumDiscs(Ljava/util/List;)[I
    move-result-object v1
  .line 271
    nop
  .line 272
    invoke-static { }, Lcom/innioasis/ipp/Disc;->trackTags()Z
    move-result v3
    const/4 v4, 0
    if-eqz v3, :L11
  .line 273
    new-array v3, v0, [I
  .line 274
    nop
  .line 275
    const/4 v5, 0
    const/4 v7, 0
  :L6
    if-ge v5, v0, :L10
  .line 276
    invoke-interface { p0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-static { v8 }, Lcom/innioasis/ipp/TrackCache;->get(Ljava/lang/String;)I
    move-result v8
  .line 277
    if-lez v8, :L7
    const v9, 2147483647
    if-eq v8, v9, :L7
    goto :L8
  :L7
    const/4 v8, 0
  :L8
    aput v8, v3, v5
  .line 278
    if-lez v8, :L9
    const/4 v7, 1
  :L9
  .line 275
    add-int/lit8 v5, v5, 1
    goto :L6
  :L10
  .line 280
    if-nez v7, :L12
    move-object v3, v4
    goto :L12
  :L11
  .line 272
    move-object v3, v4
  :L12
  .line 282
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 283
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct { v7 }, Ljava/util/ArrayList;-><init>()V
  .line 284
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8 }, Ljava/util/ArrayList;-><init>()V
  .line 285
    nop
  .line 286
    const/4 v9, 0
    const/4 v10, 0
  :L13
    if-ge v9, v0, :L20
  .line 287
    if-eqz v1, :L15
    if-eqz v9, :L14
    aget v11, v1, v9
    add-int/lit8 v12, v9, -1
    aget v12, v1, v12
    if-eq v11, v12, :L15
  :L14
  .line 288
    nop
  .line 289
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 290
    aget v10, v1, v9
    invoke-static { v10 }, Lcom/innioasis/ipp/Disc;->label(I)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v7, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 291
    const/4 v10, -1
    invoke-static { v10 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v10
    invoke-virtual { v8, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    move v10, v9
  :L15
  .line 293
    if-eqz v3, :L16
    aget v11, v3, v9
    goto :L17
  :L16
    sub-int v11, v9, v10
    add-int/2addr v11, v6
  :L17
  .line 294
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
  .line 295
    invoke-interface { p0, v9 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v11
    check-cast v11, Lcom/innioasis/y1/database/Song;
    invoke-static { v11 }, Lcom/innioasis/ipp/Flow;->title(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v7, v11 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 296
    invoke-static { v9 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v11
    invoke-virtual { v8, v11 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 286
    add-int/lit8 v9, v9, 1
    goto :L13
  :L20
  .line 298
    new-instance v0, Lcom/innioasis/ipp/Flow$Back;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Flow$Back;-><init>()V
  .line 299
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
  .line 300
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [Ljava/lang/String;
    invoke-virtual { v5, p0 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->nums:[Ljava/lang/String;
  .line 301
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [Ljava/lang/String;
    invoke-virtual { v7, p0 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->texts:[Ljava/lang/String;
  .line 302
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [I
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->song:[I
  .line 303
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
  .line 304
    return-object v0
.end method

.method static blank()Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L3
  .registers 10
  .line 347
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 348
    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 349
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131231142
    invoke-static { v2, v3, v1 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 351
    if-eqz v1, :L2
  .line 352
    invoke-static { }, Lcom/innioasis/ipp/Flow;->newSlide()Landroid/graphics/Bitmap;
    move-result-object v2
  .line 353
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 354
    new-instance v4, Landroid/graphics/Rect;
    const/16 v5, 182
    const/4 v6, 2
    invoke-direct { v4, v6, v6, v5, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v5, Landroid/graphics/Paint;
    invoke-direct { v5, v6 }, Landroid/graphics/Paint;-><init>(I)V
    const/4 v6, 0
    invoke-virtual { v3, v1, v6, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 355
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->recycle()V
  .line 356
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mirrorPaint()Landroid/graphics/Paint;
    move-result-object v1
    invoke-static { v3, v2, v1 }, Lcom/innioasis/ipp/Flow;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
  :L1
  .line 357
    return-object v2
  :L2
  .line 360
    goto :L4
  :L3
  .line 359
    move-exception v1
  :L4
  .line 362
    const/16 v1, 32400
    new-array v3, v1, [I
  .line 363
    const/4 v1, 0
  :L5
    const/16 v2, 180
    if-ge v1, v2, :L10
  .line 364
    const/4 v4, 0
  :L6
    if-ge v4, v2, :L9
  .line 365
    add-int v5, v4, v1
    mul-int/lit8 v5, v5, 48
    div-int/lit16 v5, v5, 360
    add-int/lit8 v5, v5, 48
  .line 366
    const/4 v6, 3
    if-lt v4, v6, :L7
    if-lt v1, v6, :L7
    const/16 v6, 177
    if-ge v4, v6, :L7
    if-lt v1, v6, :L8
  :L7
    const/16 v5, 96
  :L8
  .line 367
    mul-int/lit16 v6, v1, 180
    add-int/2addr v6, v4
    shl-int/lit8 v7, v5, 16
    const/high16 v8, 0xFF000000
    or-int/2addr v7, v8
    shl-int/lit8 v8, v5, 8
    or-int/2addr v7, v8
    or-int/2addr v5, v7
    aput v5, v3, v6
  .line 364
    add-int/lit8 v4, v4, 1
    goto :L6
  :L9
  .line 363
    add-int/lit8 v1, v1, 1
    goto :L5
  :L10
  .line 370
    invoke-static { }, Lcom/innioasis/ipp/Flow;->newSlide()Landroid/graphics/Bitmap;
    move-result-object v0
  .line 371
    const/4 v4, 0
    const/16 v5, 180
    const/4 v6, 2
    const/4 v7, 2
    const/16 v8, 180
    const/16 v9, 180
    move-object v2, v0
    invoke-virtual/range { v2 .. v9 }, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V
  .line 372
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1 }, Landroid/graphics/Canvas;-><init>()V
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mirrorPaint()Landroid/graphics/Paint;
    move-result-object v2
    invoke-static { v1, v0, v2 }, Lcom/innioasis/ipp/Flow;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
  .line 373
    return-object v0
.end method

.method private static build(Ljava/util/List;)Ljava/util/List;
  .registers 12
  .line 200
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 201
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 202
    if-nez p0, :L0
    return-object v0
  :L0
  .line 203
    new-instance v3, Ljava/util/HashMap;
    invoke-direct { v3 }, Ljava/util/HashMap;-><init>()V
  .line 205
    new-instance v4, Ljava/util/HashMap;
    invoke-direct { v4 }, Ljava/util/HashMap;-><init>()V
  .line 206
    const/4 v5, 0
    const/4 v6, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v7
    if-ge v6, v7, :L6
  .line 207
    invoke-interface { p0, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
  .line 208
    if-eqz v7, :L5
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    if-nez v8, :L2
    goto :L5
  :L2
  .line 209
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
  .line 210
    invoke-virtual { v4, v8 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Ljava/lang/String;
  .line 211
    if-nez v9, :L3
  .line 212
    invoke-static { v7 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v9
  .line 213
    invoke-virtual { v4, v8, v9 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 215
    invoke-virtual { v3, v9 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
  .line 216
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
  .line 206
    add-int/lit8 v6, v6, 1
    goto :L1
  :L6
  .line 218
    invoke-virtual { v3 }, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    move-result-object p0
    invoke-interface { p0 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object p0
  .line 219
    nop
  :L7
    array-length v4, p0
    if-ge v5, v4, :L8
  .line 220
    aget-object v4, p0, v5
    check-cast v4, Ljava/lang/String;
  .line 221
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
  .line 219
    add-int/lit8 v5, v5, 1
    goto :L7
  :L8
  .line 223
    sget-object p0, Lcom/innioasis/ipp/Flow;->BY_NAME:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 224
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
  .line 225
    return-object v0
.end method

.method public static cacheSlide(Ljava/lang/String;)Z
  .catchall { :L0 .. :L4 } :L6
  .registers 3
  :L0
  .line 427
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 428
    if-eqz v0, :L5
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L1
    goto :L5
  :L1
  .line 429
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 430
    if-nez v0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L2
  .line 431
    if-nez v0, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p0
    return p0
  :L3
  .line 432
    const/16 v1, 180
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/FlowCache;->write(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    move-result p0
  :L4
    return p0
  :L5
  .line 428
    const/4 p0, 1
    return p0
  :L6
  .line 433
    move-exception p0
  .line 434
    const/4 p0, 0
    return p0
.end method

.method static fade()Landroid/graphics/Bitmap;
  .registers 5
  .line 389
    sget-object v0, Lcom/innioasis/ipp/Flow;->fade:Landroid/graphics/Bitmap;
    if-nez v0, :L2
  .line 390
    const/16 v0, 90
    new-array v1, v0, [I
  .line 391
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
  .line 392
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v1, v3, v0, v2 }, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Flow;->fade:Landroid/graphics/Bitmap;
  :L2
  .line 394
    sget-object v0, Lcom/innioasis/ipp/Flow;->fade:Landroid/graphics/Bitmap;
    return-object v0
.end method

.method private static fade(Landroid/view/View;)V
  .registers 3
  .line 955
    invoke-virtual { p0 }, Landroid/view/View;->getAlpha()F
    move-result v0
  .line 956
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/view/View;->setAlpha(F)V
  .line 957
    invoke-virtual { p0 }, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p0
    const-wide/16 v0, 250
    invoke-virtual { p0, v0, v1 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;
  .line 958
    return-void
.end method

.method private static fadeIn(Landroid/app/Activity;)V
  .catchall { :L0 .. :L6 } :L10
  .registers 9
  .line 931
    const v0, 2131361957
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 932
    const v1, 2131361979
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 933
    const v2, 2131361980
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 934
    if-eqz v0, :L9
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    instance-of v2, v2, Landroid/view/ViewGroup;
    if-nez v2, :L1
    goto :L9
  :L1
  .line 935
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup;
  .line 936
    const/4 v3, 0
    const/4 v4, 0
  :L2
    invoke-virtual { v2 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v5
    if-ge v4, v5, :L8
  .line 937
    invoke-virtual { v2, v4 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v5
  .line 938
    invoke-virtual { v5 }, Landroid/view/View;->getId()I
    move-result v6
  .line 939
    const v7, 2131362297
    if-eq v6, v7, :L7
    const v7, 2131362191
    if-ne v6, v7, :L3
    goto :L7
  :L3
  .line 940
    if-eq v5, v0, :L4
  .line 941
    invoke-static { v5 }, Lcom/innioasis/ipp/Flow;->fade(Landroid/view/View;)V
  .line 942
    goto :L7
  :L4
  .line 944
    move-object v5, v0
    check-cast v5, Landroid/view/ViewGroup;
  .line 945
    const/4 v6, 0
  :L5
    invoke-virtual { v5 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v7
    if-ge v6, v7, :L7
  .line 946
    invoke-virtual { v5, v6 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v7
  .line 947
    if-eq v7, v1, :L6
    if-eq v7, p0, :L6
    invoke-static { v7 }, Lcom/innioasis/ipp/Flow;->fade(Landroid/view/View;)V
  :L6
  .line 945
    add-int/lit8 v6, v6, 1
    goto :L5
  :L7
  .line 936
    add-int/lit8 v4, v4, 1
    goto :L2
  :L8
  .line 951
    goto :L11
  :L9
  .line 934
    return-void
  :L10
  .line 950
    move-exception p0
  :L11
  .line 952
    return-void
.end method

.method public static flipBack(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 5
  .line 967
    const-string v0, "ipp_flip_back"
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v2
  .line 968
    if-eqz v2, :L3
    invoke-virtual { v2, v0, v1 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v3
    if-nez v3, :L1
    goto :L3
  :L1
  .line 969
    invoke-virtual { v2, v0 }, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
  .line 970
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->measure(Landroid/app/Activity;)V
  .line 971
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 972
    invoke-virtual { p0 }, Landroid/app/Activity;->finish()V
  .line 973
    invoke-virtual { p0, v1, v1 }, Landroid/app/Activity;->overridePendingTransition(II)V
  :L2
  .line 974
    return v0
  :L3
  .line 968
    return v1
  :L4
  .line 975
    move-exception p0
  .line 976
    return v1
.end method

.method public static flipIn(Landroid/app/Activity;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  .line 908
    const-string v0, "ipp_flip"
    const-string v1, "base"
    invoke-static { v1 }, Lcom/innioasis/ipp/Open;->step(Ljava/lang/String;)V
  :L0
  .line 910
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
  .line 911
    if-eqz v1, :L6
    const/4 v2, 0
    invoke-virtual { v1, v0, v2 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v2
    if-nez v2, :L1
    goto :L6
  :L1
  .line 913
    invoke-virtual { v1, v0 }, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
  .line 914
    const-string v0, "ipp_flip_back"
    const/4 v2, 1
    invoke-virtual { v1, v0, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 917
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 918
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L3
  .line 919
    if-eqz v0, :L4
    instance-of v1, p0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v1, :L4
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/base/BasePlayerActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Cover;->instantCover(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  :L4
  .line 920
    const-string v0, "cover"
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->step(Ljava/lang/String;)V
  .line 921
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->fadeIn(Landroid/app/Activity;)V
  :L5
  .line 923
    goto :L8
  :L6
  .line 911
    return-void
  :L7
  .line 922
    move-exception p0
  :L8
  .line 924
    return-void
.end method

.method public static geo(Landroid/content/Context;)[F
  .catchall { :L3 .. :L9 } :L11
  .registers 6
  .line 818
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 819
    if-eqz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L1
  :L0
    sget-object v1, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L1
  .line 820
    if-eqz v1, :L2
    return-object v1
  :L2
  .line 822
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
  .line 823
    if-eqz p0, :L10
  .line 824
    const-string v2, ","
    invoke-virtual { p0, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 825
    array-length v2, p0
    if-ne v2, v1, :L10
  .line 826
    new-array v2, v1, [F
  .line 827
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
  .line 828
    if-eqz v0, :L8
    sput-object v2, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L9
  :L8
  .line 829
    sput-object v2, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L9
  .line 830
    return-object v2
  :L10
  .line 834
    goto :L12
  :L11
  .line 833
    move-exception p0
  :L12
  .line 835
    if-eqz v0, :L13
    new-array p0, v1, [F
    fill-array-data p0, :L15
    goto :L14
  :L13
  .line 836
    new-array p0, v1, [F
    fill-array-data p0, :L16
  :L14
  .line 835
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
  .line 840
    const v0, 2131361979
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 841
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-eqz v1, :L1
  :L0
    const v0, 2131361980
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 842
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v1
    if-gtz v1, :L2
    goto/16 :L10
  :L2
  .line 844
    const/4 v1, 2
    new-array v2, v1, [I
  .line 845
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3, v2 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 846
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
  .line 847
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
  .line 848
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
  .line 849
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 850
    if-eqz v0, :L3
    sput-object v4, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L4
  :L3
  .line 851
    sput-object v4, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L4
  .line 852
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 853
    nop
  :L5
    if-ge v5, v3, :L7
  .line 854
    if-lez v5, :L6
    const/16 v2, 44
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L6
  .line 855
    aget v2, v4, v5
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
  .line 853
    add-int/lit8 v5, v5, 1
    goto :L5
  :L7
  .line 857
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
  .line 858
    return-void
  :L10
  .line 842
    return-void
.end method

.method static mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
  .registers 5
  .line 333
    invoke-virtual { p0, p1 }, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
  .line 334
    sget-object v0, Lcom/innioasis/ipp/Flow;->MIR_FROM:Landroid/graphics/Rect;
    sget-object v1, Lcom/innioasis/ipp/Flow;->MIR:Landroid/graphics/Rect;
    invoke-virtual { p0, p1, v0, v1, p2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 335
    return-void
.end method

.method static mirrorPaint()Landroid/graphics/Paint;
  .registers 3
  .line 339
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
  .line 340
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v2 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 341
    return-object v0
.end method

.method public static musicMenu(Ljava/util/List;Landroid/content/Context;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 109
    const v0, 2131821167
  :L0
    invoke-virtual { p1, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
  .line 110
    invoke-interface { p0, p1 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const/4 v0, 0
    invoke-interface { p0, v0, p1 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L1
  .line 112
    goto :L3
  :L2
  .line 111
    move-exception p0
  :L3
  .line 113
    return-void
.end method

.method public static musicPick(Landroid/app/Activity;I)I
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 121
    if-gez p1, :L0
    return p1
  :L0
  .line 122
    sget-object v0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v0 }, Lcom/innioasis/music/objects/Constant;->getMainList()Ljava/util/List;
    move-result-object v0
  .line 123
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
  .line 124
    if-lez p1, :L2
    add-int/lit8 p1, p1, -1
    return p1
  :L2
  .line 125
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L3
  .line 126
    const/4 p0, -1
    return p0
  :L4
  .line 123
    return p1
  :L5
  .line 127
    move-exception p0
  .line 128
    return p1
.end method

.method static newSlide()Landroid/graphics/Bitmap;
  .registers 3
  .line 326
    sget-object v0, Lcom/innioasis/ipp/Flow;->MIR:Landroid/graphics/Rect;
    iget v0, v0, Landroid/graphics/Rect;->bottom:I
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v2, 184
    invoke-static { v2, v0, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    return-object v0
.end method

.method public static slideFrom(Ljava/lang/String;[B)Z
  .catchall { :L0 .. :L6 } :L8
  .registers 7
  .line 403
    const/4 v0, 0
    if-eqz p1, :L9
  :L0
    array-length v1, p1
    if-nez v1, :L1
    goto :L9
  :L1
  .line 404
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 405
    if-nez v1, :L2
    return v0
  :L2
  .line 406
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v1
    const/4 v2, 1
    if-eqz v1, :L3
    return v2
  :L3
  .line 407
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 408
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 409
    array-length v2, p1
    invoke-static { p1, v0, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 410
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L7
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L4
    goto :L7
  :L4
  .line 411
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v4, 180
    invoke-static { v2, v3, v4, v4 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v2
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 412
    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 413
    array-length v2, p1
    invoke-static { p1, v0, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 414
    if-nez p1, :L5
    return v0
  :L5
  .line 415
    invoke-static { p1, v4 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/FlowCache;->write(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    move-result p0
  :L6
    return p0
  :L7
  .line 410
    return v0
  :L8
  .line 416
    move-exception p0
  .line 417
    return v0
  :L9
  .line 403
    return v0
.end method

.method public static takeReturning()Z
  .registers 2
  .line 811
    sget-boolean v0, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 812
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 813
    return v0
.end method

.method public static title(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 4
  .line 313
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v0
  .line 314
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
  .line 317
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :L4
  :L1
  .line 315
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
  .line 319
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Feat;->title(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .registers 3
  .line 865
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
  .line 879
    const/4 v0, 1
    const/4 v1, 0
    if-eqz p2, :L0
    const/4 v2, 1
    goto :L1
  :L0
    const/4 v2, 0
  :L1
  .line 880
    const/4 v3, 0
    if-nez p0, :L2
    move-object p0, v3
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  :L3
  .line 882
    if-eqz p0, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L4
    invoke-static { }, Lcom/innioasis/ipp/Cover;->blankCover()Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L4
  .line 883
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
  .line 884
    if-nez v4, :L11
    if-eqz p1, :L11
  .line 885
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 886
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L8
    invoke-static { }, Lcom/innioasis/ipp/Cover;->blankCover()Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L8
  .line 887
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
  .line 889
    if-nez v4, :L12
    return-object v3
  :L12
  .line 890
    if-eqz v2, :L13
  .line 891
    aput-object v4, p2, v1
  .line 892
    aput-object p0, p2, v0
  :L13
  .line 896
    const-class p0, Lcom/innioasis/ipp/Cover;
    monitor-enter p0
  :L14
  .line 897
    invoke-static { v4 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->reflect(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 898
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->hold(Landroid/graphics/Bitmap;)V
  .line 899
    monitor-exit p0
    return-object p1
  :L15
  .line 900
    move-exception p1
    monitor-exit p0
  :L16
    throw p1
  :L17
  .line 901
    move-exception p0
  .line 902
    return-object v3
.end method

.method public static tripAhead(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
  .registers 3
  .line 874
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

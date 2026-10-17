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
  .line 190
    new-instance v0, Lcom/innioasis/ipp/Flow$ByName;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Flow$ByName;-><init>(Lcom/innioasis/ipp/Flow$1;)V
    sput-object v0, Lcom/innioasis/ipp/Flow;->BY_NAME:Ljava/util/Comparator;
  .line 291
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
  .registers 12
  .line 160
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 161
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 162
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v3
  .line 163
    const-string v4, "flow songs"
    invoke-static { v4, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 164
    if-nez v3, :L0
    return-object v0
  :L0
  .line 165
    new-instance v4, Ljava/util/HashMap;
    invoke-direct { v4 }, Ljava/util/HashMap;-><init>()V
  .line 167
    new-instance v5, Ljava/util/HashMap;
    invoke-direct { v5 }, Ljava/util/HashMap;-><init>()V
  .line 168
    const/4 v6, 0
    const/4 v7, 0
  :L1
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v8
    if-ge v7, v8, :L6
  .line 169
    invoke-interface { v3, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
  .line 170
    if-eqz v8, :L5
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    if-nez v9, :L2
    goto :L5
  :L2
  .line 171
    new-instance v9, Ljava/lang/StringBuilder;
    invoke-direct { v9 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v9, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    const/16 v10, 10
    invoke-virtual { v9, v10 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v9
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v10
    invoke-static { v10 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v9, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    invoke-virtual { v9 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v9
  .line 172
    invoke-virtual { v5, v9 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Ljava/lang/String;
  .line 173
    if-nez v10, :L3
  .line 174
    invoke-static { v8 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v10
  .line 175
    invoke-virtual { v5, v9, v10 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 177
    invoke-virtual { v4, v10 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Lcom/innioasis/y1/database/Song;
  .line 178
    if-eqz v9, :L4
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v9 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v11, v9 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v9
    if-gez v9, :L5
  :L4
    invoke-virtual { v4, v10, v8 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 168
    add-int/lit8 v7, v7, 1
    goto :L1
  :L6
  .line 180
    invoke-virtual { v4 }, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v3
  .line 181
    nop
  :L7
    array-length v5, v3
    if-ge v6, v5, :L8
  .line 182
    aget-object v5, v3, v6
    check-cast v5, Ljava/lang/String;
  .line 183
    new-instance v7, Lcom/innioasis/ipp/Flow$Item;
    sget-object v8, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v8, v9 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v4, v5 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Lcom/innioasis/y1/database/Song;
    invoke-direct { v7, v5, v8, v9 }, Lcom/innioasis/ipp/Flow$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/database/Song;)V
    invoke-virtual { v0, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 181
    add-int/lit8 v6, v6, 1
    goto :L7
  :L8
  .line 185
    sget-object v3, Lcom/innioasis/ipp/Flow;->BY_NAME:Ljava/util/Comparator;
    invoke-static { v0, v3 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 186
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "flow albums "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 187
    return-object v0
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
  .line 217
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 218
    iget-object p0, p0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->songsOf(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 219
    nop
  .line 220
    const/4 v2, 0
    const/4 v3, 0
    const/4 v4, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    const/4 v6, 1
    if-ge v3, v5, :L3
  .line 221
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
  .line 222
    if-eqz v5, :L2
    invoke-static { v5 }, Lcom/innioasis/ipp/DiscCache;->known(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :L1
    goto :L2
  :L1
  .line 223
    invoke-static { v5, v6, v2 }, Lcom/innioasis/ipp/DiscCache;->read(Ljava/lang/String;ZZ)Lcom/innioasis/ipp/DiscCache$Tags;
    move-result-object v6
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/DiscCache;->commit(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .line 224
    add-int/lit8 v4, v4, 1
  :L2
  .line 220
    add-int/lit8 v3, v3, 1
    goto :L0
  :L3
  .line 226
    if-lez v4, :L4
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  :L4
  .line 227
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
  .line 228
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
  .line 229
    if-eqz v0, :L5
    move-object p0, v0
  :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->byDisc(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
  .line 231
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 232
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->albumDiscs(Ljava/util/List;)[I
    move-result-object v1
  .line 233
    nop
  .line 234
    invoke-static { }, Lcom/innioasis/ipp/Disc;->trackTags()Z
    move-result v3
    const/4 v4, 0
    if-eqz v3, :L11
  .line 235
    new-array v3, v0, [I
  .line 236
    nop
  .line 237
    const/4 v5, 0
    const/4 v7, 0
  :L6
    if-ge v5, v0, :L10
  .line 238
    invoke-interface { p0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-static { v8 }, Lcom/innioasis/ipp/TrackCache;->get(Ljava/lang/String;)I
    move-result v8
  .line 239
    if-lez v8, :L7
    const v9, 2147483647
    if-eq v8, v9, :L7
    goto :L8
  :L7
    const/4 v8, 0
  :L8
    aput v8, v3, v5
  .line 240
    if-lez v8, :L9
    const/4 v7, 1
  :L9
  .line 237
    add-int/lit8 v5, v5, 1
    goto :L6
  :L10
  .line 242
    if-nez v7, :L12
    move-object v3, v4
    goto :L12
  :L11
  .line 234
    move-object v3, v4
  :L12
  .line 244
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 245
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct { v7 }, Ljava/util/ArrayList;-><init>()V
  .line 246
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8 }, Ljava/util/ArrayList;-><init>()V
  .line 247
    nop
  .line 248
    const/4 v9, 0
    const/4 v10, 0
  :L13
    if-ge v9, v0, :L20
  .line 249
    if-eqz v1, :L15
    if-eqz v9, :L14
    aget v11, v1, v9
    add-int/lit8 v12, v9, -1
    aget v12, v1, v12
    if-eq v11, v12, :L15
  :L14
  .line 250
    nop
  .line 251
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 252
    aget v10, v1, v9
    invoke-static { v10 }, Lcom/innioasis/ipp/Disc;->label(I)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v7, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 253
    const/4 v10, -1
    invoke-static { v10 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v10
    invoke-virtual { v8, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    move v10, v9
  :L15
  .line 255
    if-eqz v3, :L16
    aget v11, v3, v9
    goto :L17
  :L16
    sub-int v11, v9, v10
    add-int/2addr v11, v6
  :L17
  .line 256
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
  .line 257
    invoke-interface { p0, v9 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v11
    check-cast v11, Lcom/innioasis/y1/database/Song;
    invoke-static { v11 }, Lcom/innioasis/ipp/Flow;->title(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v7, v11 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 258
    invoke-static { v9 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v11
    invoke-virtual { v8, v11 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 248
    add-int/lit8 v9, v9, 1
    goto :L13
  :L20
  .line 260
    new-instance v0, Lcom/innioasis/ipp/Flow$Back;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Flow$Back;-><init>()V
  .line 261
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
  .line 262
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [Ljava/lang/String;
    invoke-virtual { v5, p0 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->nums:[Ljava/lang/String;
  .line 263
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [Ljava/lang/String;
    invoke-virtual { v7, p0 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->texts:[Ljava/lang/String;
  .line 264
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [I
    iput-object p0, v0, Lcom/innioasis/ipp/Flow$Back;->song:[I
  .line 265
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
  .line 266
    return-object v0
.end method

.method static blank()Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L3
  .registers 10
  .line 309
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 310
    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 311
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131231142
    invoke-static { v2, v3, v1 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 313
    if-eqz v1, :L2
  .line 314
    invoke-static { }, Lcom/innioasis/ipp/Flow;->newSlide()Landroid/graphics/Bitmap;
    move-result-object v2
  .line 315
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 316
    new-instance v4, Landroid/graphics/Rect;
    const/16 v5, 182
    const/4 v6, 2
    invoke-direct { v4, v6, v6, v5, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v5, Landroid/graphics/Paint;
    invoke-direct { v5, v6 }, Landroid/graphics/Paint;-><init>(I)V
    const/4 v6, 0
    invoke-virtual { v3, v1, v6, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 317
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->recycle()V
  .line 318
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mirrorPaint()Landroid/graphics/Paint;
    move-result-object v1
    invoke-static { v3, v2, v1 }, Lcom/innioasis/ipp/Flow;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
  :L1
  .line 319
    return-object v2
  :L2
  .line 322
    goto :L4
  :L3
  .line 321
    move-exception v1
  :L4
  .line 324
    const/16 v1, 32400
    new-array v3, v1, [I
  .line 325
    const/4 v1, 0
  :L5
    const/16 v2, 180
    if-ge v1, v2, :L10
  .line 326
    const/4 v4, 0
  :L6
    if-ge v4, v2, :L9
  .line 327
    add-int v5, v4, v1
    mul-int/lit8 v5, v5, 48
    div-int/lit16 v5, v5, 360
    add-int/lit8 v5, v5, 48
  .line 328
    const/4 v6, 3
    if-lt v4, v6, :L7
    if-lt v1, v6, :L7
    const/16 v6, 177
    if-ge v4, v6, :L7
    if-lt v1, v6, :L8
  :L7
    const/16 v5, 96
  :L8
  .line 329
    mul-int/lit16 v6, v1, 180
    add-int/2addr v6, v4
    shl-int/lit8 v7, v5, 16
    const/high16 v8, 0xFF000000
    or-int/2addr v7, v8
    shl-int/lit8 v8, v5, 8
    or-int/2addr v7, v8
    or-int/2addr v5, v7
    aput v5, v3, v6
  .line 326
    add-int/lit8 v4, v4, 1
    goto :L6
  :L9
  .line 325
    add-int/lit8 v1, v1, 1
    goto :L5
  :L10
  .line 332
    invoke-static { }, Lcom/innioasis/ipp/Flow;->newSlide()Landroid/graphics/Bitmap;
    move-result-object v0
  .line 333
    const/4 v4, 0
    const/16 v5, 180
    const/4 v6, 2
    const/4 v7, 2
    const/16 v8, 180
    const/16 v9, 180
    move-object v2, v0
    invoke-virtual/range { v2 .. v9 }, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V
  .line 334
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1 }, Landroid/graphics/Canvas;-><init>()V
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mirrorPaint()Landroid/graphics/Paint;
    move-result-object v2
    invoke-static { v1, v0, v2 }, Lcom/innioasis/ipp/Flow;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
  .line 335
    return-object v0
.end method

.method public static cacheSlide(Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 3
  :L0
  .line 362
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 363
    if-eqz v0, :L5
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L1
    goto :L5
  :L1
  .line 364
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 365
    if-nez v0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L2
  .line 366
    if-nez v0, :L3
    return-void
  :L3
  .line 367
    const/16 v1, 180
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/FlowCache;->write(Ljava/lang/String;Landroid/graphics/Bitmap;)V
  :L4
  .line 369
    goto :L7
  :L5
  .line 363
    return-void
  :L6
  .line 368
    move-exception p0
  :L7
  .line 370
    return-void
.end method

.method static fade()Landroid/graphics/Bitmap;
  .registers 5
  .line 351
    sget-object v0, Lcom/innioasis/ipp/Flow;->fade:Landroid/graphics/Bitmap;
    if-nez v0, :L2
  .line 352
    const/16 v0, 90
    new-array v1, v0, [I
  .line 353
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
  .line 354
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v1, v3, v0, v2 }, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Flow;->fade:Landroid/graphics/Bitmap;
  :L2
  .line 356
    sget-object v0, Lcom/innioasis/ipp/Flow;->fade:Landroid/graphics/Bitmap;
    return-object v0
.end method

.method private static fade(Landroid/view/View;)V
  .registers 3
  .line 889
    invoke-virtual { p0 }, Landroid/view/View;->getAlpha()F
    move-result v0
  .line 890
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/view/View;->setAlpha(F)V
  .line 891
    invoke-virtual { p0 }, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p0
    const-wide/16 v0, 250
    invoke-virtual { p0, v0, v1 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;
  .line 892
    return-void
.end method

.method private static fadeIn(Landroid/app/Activity;)V
  .catchall { :L0 .. :L6 } :L10
  .registers 9
  .line 865
    const v0, 2131361957
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 866
    const v1, 2131361979
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 867
    const v2, 2131361980
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 868
    if-eqz v0, :L9
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    instance-of v2, v2, Landroid/view/ViewGroup;
    if-nez v2, :L1
    goto :L9
  :L1
  .line 869
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup;
  .line 870
    const/4 v3, 0
    const/4 v4, 0
  :L2
    invoke-virtual { v2 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v5
    if-ge v4, v5, :L8
  .line 871
    invoke-virtual { v2, v4 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v5
  .line 872
    invoke-virtual { v5 }, Landroid/view/View;->getId()I
    move-result v6
  .line 873
    const v7, 2131362297
    if-eq v6, v7, :L7
    const v7, 2131362191
    if-ne v6, v7, :L3
    goto :L7
  :L3
  .line 874
    if-eq v5, v0, :L4
  .line 875
    invoke-static { v5 }, Lcom/innioasis/ipp/Flow;->fade(Landroid/view/View;)V
  .line 876
    goto :L7
  :L4
  .line 878
    move-object v5, v0
    check-cast v5, Landroid/view/ViewGroup;
  .line 879
    const/4 v6, 0
  :L5
    invoke-virtual { v5 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v7
    if-ge v6, v7, :L7
  .line 880
    invoke-virtual { v5, v6 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v7
  .line 881
    if-eq v7, v1, :L6
    if-eq v7, p0, :L6
    invoke-static { v7 }, Lcom/innioasis/ipp/Flow;->fade(Landroid/view/View;)V
  :L6
  .line 879
    add-int/lit8 v6, v6, 1
    goto :L5
  :L7
  .line 870
    add-int/lit8 v4, v4, 1
    goto :L2
  :L8
  .line 885
    goto :L11
  :L9
  .line 868
    return-void
  :L10
  .line 884
    move-exception p0
  :L11
  .line 886
    return-void
.end method

.method public static flipBack(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 5
  .line 901
    const-string v0, "ipp_flip_back"
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v2
  .line 902
    if-eqz v2, :L3
    invoke-virtual { v2, v0, v1 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v3
    if-nez v3, :L1
    goto :L3
  :L1
  .line 903
    invoke-virtual { v2, v0 }, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
  .line 904
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->measure(Landroid/app/Activity;)V
  .line 905
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 906
    invoke-virtual { p0 }, Landroid/app/Activity;->finish()V
  .line 907
    invoke-virtual { p0, v1, v1 }, Landroid/app/Activity;->overridePendingTransition(II)V
  :L2
  .line 908
    return v0
  :L3
  .line 902
    return v1
  :L4
  .line 909
    move-exception p0
  .line 910
    return v1
.end method

.method public static flipIn(Landroid/app/Activity;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  .line 842
    const-string v0, "ipp_flip"
    const-string v1, "base"
    invoke-static { v1 }, Lcom/innioasis/ipp/Open;->step(Ljava/lang/String;)V
  :L0
  .line 844
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
  .line 845
    if-eqz v1, :L6
    const/4 v2, 0
    invoke-virtual { v1, v0, v2 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v2
    if-nez v2, :L1
    goto :L6
  :L1
  .line 847
    invoke-virtual { v1, v0 }, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
  .line 848
    const-string v0, "ipp_flip_back"
    const/4 v2, 1
    invoke-virtual { v1, v0, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 851
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 852
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L3
  .line 853
    if-eqz v0, :L4
    instance-of v1, p0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v1, :L4
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/base/BasePlayerActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Cover;->instantCover(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  :L4
  .line 854
    const-string v0, "cover"
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->step(Ljava/lang/String;)V
  .line 855
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->fadeIn(Landroid/app/Activity;)V
  :L5
  .line 857
    goto :L8
  :L6
  .line 845
    return-void
  :L7
  .line 856
    move-exception p0
  :L8
  .line 858
    return-void
.end method

.method public static geo(Landroid/content/Context;)[F
  .catchall { :L3 .. :L9 } :L11
  .registers 6
  .line 752
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 753
    if-eqz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L1
  :L0
    sget-object v1, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L1
  .line 754
    if-eqz v1, :L2
    return-object v1
  :L2
  .line 756
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
  .line 757
    if-eqz p0, :L10
  .line 758
    const-string v2, ","
    invoke-virtual { p0, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 759
    array-length v2, p0
    if-ne v2, v1, :L10
  .line 760
    new-array v2, v1, [F
  .line 761
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
  .line 762
    if-eqz v0, :L8
    sput-object v2, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L9
  :L8
  .line 763
    sput-object v2, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L9
  .line 764
    return-object v2
  :L10
  .line 768
    goto :L12
  :L11
  .line 767
    move-exception p0
  :L12
  .line 769
    if-eqz v0, :L13
    new-array p0, v1, [F
    fill-array-data p0, :L15
    goto :L14
  :L13
  .line 770
    new-array p0, v1, [F
    fill-array-data p0, :L16
  :L14
  .line 769
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
  .line 774
    const v0, 2131361979
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 775
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-eqz v1, :L1
  :L0
    const v0, 2131361980
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 776
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v1
    if-gtz v1, :L2
    goto/16 :L10
  :L2
  .line 778
    const/4 v1, 2
    new-array v2, v1, [I
  .line 779
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3, v2 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 780
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
  .line 781
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
  .line 782
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
  .line 783
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 784
    if-eqz v0, :L3
    sput-object v4, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L4
  :L3
  .line 785
    sput-object v4, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L4
  .line 786
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 787
    nop
  :L5
    if-ge v5, v3, :L7
  .line 788
    if-lez v5, :L6
    const/16 v2, 44
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L6
  .line 789
    aget v2, v4, v5
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
  .line 787
    add-int/lit8 v5, v5, 1
    goto :L5
  :L7
  .line 791
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
  .line 792
    return-void
  :L10
  .line 776
    return-void
.end method

.method static mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
  .registers 5
  .line 295
    invoke-virtual { p0, p1 }, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
  .line 296
    sget-object v0, Lcom/innioasis/ipp/Flow;->MIR_FROM:Landroid/graphics/Rect;
    sget-object v1, Lcom/innioasis/ipp/Flow;->MIR:Landroid/graphics/Rect;
    invoke-virtual { p0, p1, v0, v1, p2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 297
    return-void
.end method

.method static mirrorPaint()Landroid/graphics/Paint;
  .registers 3
  .line 301
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
  .line 302
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v2 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 303
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
  .line 288
    sget-object v0, Lcom/innioasis/ipp/Flow;->MIR:Landroid/graphics/Rect;
    iget v0, v0, Landroid/graphics/Rect;->bottom:I
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v2, 184
    invoke-static { v2, v0, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    return-object v0
.end method

.method public static takeReturning()Z
  .registers 2
  .line 745
    sget-boolean v0, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 746
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 747
    return v0
.end method

.method public static title(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 4
  .line 275
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v0
  .line 276
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
  .line 279
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :L4
  :L1
  .line 277
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
  .line 281
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Feat;->title(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .registers 3
  .line 799
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
  .line 813
    const/4 v0, 1
    const/4 v1, 0
    if-eqz p2, :L0
    const/4 v2, 1
    goto :L1
  :L0
    const/4 v2, 0
  :L1
  .line 814
    const/4 v3, 0
    if-nez p0, :L2
    move-object p0, v3
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  :L3
  .line 816
    if-eqz p0, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L4
    invoke-static { }, Lcom/innioasis/ipp/Cover;->blankCover()Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L4
  .line 817
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
  .line 818
    if-nez v4, :L11
    if-eqz p1, :L11
  .line 819
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 820
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L8
    invoke-static { }, Lcom/innioasis/ipp/Cover;->blankCover()Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L8
  .line 821
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
  .line 823
    if-nez v4, :L12
    return-object v3
  :L12
  .line 824
    if-eqz v2, :L13
  .line 825
    aput-object v4, p2, v1
  .line 826
    aput-object p0, p2, v0
  :L13
  .line 830
    const-class p0, Lcom/innioasis/ipp/Cover;
    monitor-enter p0
  :L14
  .line 831
    invoke-static { v4 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->reflect(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 832
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->hold(Landroid/graphics/Bitmap;)V
  .line 833
    monitor-exit p0
    return-object p1
  :L15
  .line 834
    move-exception p1
    monitor-exit p0
  :L16
    throw p1
  :L17
  .line 835
    move-exception p0
  .line 836
    return-object v3
.end method

.method public static tripAhead(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
  .registers 3
  .line 808
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Flow;->trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

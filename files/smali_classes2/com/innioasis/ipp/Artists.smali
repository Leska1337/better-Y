.class public final Lcom/innioasis/ipp/Artists;
.super Ljava/lang/Object;
.source "Artists.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Artists$NameCmp;,
    Lcom/innioasis/ipp/Artists$SongCmp;,
    Lcom/innioasis/ipp/Artists$Pick;
  }
.end annotation

.field final static COMMA:Ljava/lang/String; = ", "

.field private final static DEFAULTS:[Ljava/lang/String;

.field public final static KEY_SPLIT:Ljava/lang/String; = "artist_split"

.field private final static PARTS:Ljava/util/HashMap;

.field final static SEMI:Ljava/lang/String; = "; "

.field private static exceptions:Ljava/util/Set;

.method static constructor <clinit>()V
  .registers 3
  .line 43
    const/16 v0, 10
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0
    const-string v2, "Tyler, the Creator"
    aput-object v2, v0, v1
    const/4 v1, 1
    const-string v2, "Earth, Wind & Fire"
    aput-object v2, v0, v1
    const/4 v1, 2
    const-string v2, "Crosby, Stills & Nash"
    aput-object v2, v0, v1
    const/4 v1, 3
    const-string v2, "Crosby, Stills, Nash & Young"
    aput-object v2, v0, v1
    const/4 v1, 4
    const-string v2, "Blood, Sweat & Tears"
    aput-object v2, v0, v1
    const/4 v1, 5
    const-string v2, "Emerson, Lake & Palmer"
    aput-object v2, v0, v1
    const/4 v1, 6
    const-string v2, "Emerson, Lake & Powell"
    aput-object v2, v0, v1
    const/4 v1, 7
    const-string v2, "Peter, Paul and Mary"
    aput-object v2, v0, v1
    const/16 v1, 8
    const-string v2, "Bell, Book & Candle"
    aput-object v2, v0, v1
    const/16 v1, 9
    const-string v2, "The Good, the Bad & the Queen"
    aput-object v2, v0, v1
    sput-object v0, Lcom/innioasis/ipp/Artists;->DEFAULTS:[Ljava/lang/String;
  .line 185
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Artists;->PARTS:Ljava/util/HashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 40
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 40
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$100(JJ)I
  .registers 4
  .line 40
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Artists;->cmpLong(JJ)I
    move-result p0
    return p0
.end method

.method static synthetic access$200(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 40
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->cmpStr(Ljava/lang/String;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method private static byTag(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L0 .. :L9 } :L11
  .registers 8
  .line 386
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 387
    if-nez v1, :L1
    return-object v0
  :L1
  .line 388
    if-eqz p1, :L3
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v2
    if-nez v2, :L2
    goto :L3
  :L2
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p1
    goto :L4
  :L3
    move-object p1, v0
  :L4
  .line 389
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 390
    const/4 v3, 0
  :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L10
  .line 391
    invoke-interface { v1, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 392
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L6
    goto :L9
  :L6
  .line 393
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 394
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5, p0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :L7
    goto :L9
  :L7
  .line 395
    if-eqz p1, :L8
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v5
    if-lez v5, :L8
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5, p1 }, Lcom/innioasis/ipp/GenreSplit;->hasLoose(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :L8
    goto :L9
  :L8
  .line 396
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L9
  .line 390
    add-int/lit8 v3, v3, 1
    goto :L5
  :L10
  .line 398
    return-object v2
  :L11
  .line 399
    move-exception p0
  .line 400
    return-object v0
.end method

.method public static canOpen(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 1
  .line 494
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->focused(Lcom/innioasis/music/adapter/MyBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static canon(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 76
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 77
    const-string v0, ","
    invoke-virtual { p0, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 78
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 79
    const/4 v1, 0
  :L1
    array-length v2, p0
    if-ge v1, v2, :L3
  .line 80
    if-lez v1, :L2
    const-string v2, ", "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L2
  .line 81
    aget-object v2, p0, v1
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 79
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 83
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static cmpLong(JJ)I
  .registers 5
  .line 455
    cmp-long v0, p0, p2
    if-gez v0, :L0
    const/4 p0, -1
    goto :L2
  :L0
    cmp-long v0, p0, p2
    if-lez v0, :L1
    const/4 p0, 1
    goto :L2
  :L1
    const/4 p0, 0
  :L2
    return p0
.end method

.method private static cmpStr(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 451
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method private static commaSplit(Ljava/util/List;Ljava/lang/String;)V
  .registers 10
  .line 222
    const-string v0, ", "
    invoke-virtual { p1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p1
  .line 223
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 224
    const/4 v2, 0
    const/4 v3, 0
  :L0
    array-length v4, p1
    if-ge v3, v4, :L1
    aget-object v4, p1, v3
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v3, v3, 1
    goto :L0
  :L1
  .line 225
    invoke-static { }, Lcom/innioasis/ipp/Artists;->exc()Ljava/util/Set;
    move-result-object p1
  .line 226
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
  .line 227
    nop
  :L2
  .line 228
    if-ge v2, v3, :L14
  .line 229
    nop
  .line 230
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
  .line 231
    const/4 v5, -1
    move v6, v2
  :L3
    if-ge v6, v3, :L6
  .line 232
    if-le v6, v2, :L4
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L4
  .line 233
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/String;
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 234
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-interface { p1, v7 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L5
    move v5, v6
  :L5
  .line 231
    add-int/lit8 v6, v6, 1
    goto :L3
  :L6
  .line 236
    if-lt v5, v2, :L11
  .line 237
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
  .line 238
    move v6, v2
  :L7
    if-gt v6, v5, :L9
  .line 239
    if-le v6, v2, :L8
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L8
  .line 240
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/String;
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 238
    add-int/lit8 v6, v6, 1
    goto :L7
  :L9
  .line 242
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
  .line 243
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L10
    invoke-interface { p0, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L10
  .line 244
    add-int/lit8 v5, v5, 1
  .line 245
    move v2, v5
    goto :L13
  :L11
  .line 246
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 247
    invoke-virtual { v4 }, Ljava/lang/String;->length()I
    move-result v5
    if-lez v5, :L12
    invoke-interface { p0, v4 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L12
  .line 248
    add-int/lit8 v2, v2, 1
  :L13
  .line 250
    goto :L2
  :L14
  .line 251
    return-void
.end method

.method public static display(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 204
    if-eqz p0, :L1
    const-string v0, "; "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v1
    if-gez v1, :L0
    goto :L1
  :L0
  .line 205
    const-string v1, ", "
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 204
    return-object p0
.end method

.method public static ensureExceptions()V
  .catchall { :L0 .. :L2 } :L6
  .catchall { :L2 .. :L4 } :L3
  .catchall { :L4 .. :L5 } :L6
  .registers 2
  :L0
  .line 151
    invoke-static { }, Lcom/innioasis/ipp/Artists;->exceptionsFile()Ljava/io/File;
    move-result-object v0
  .line 152
    if-eqz v0, :L5
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    goto :L5
  :L1
  .line 153
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->seed(Ljava/io/File;)V
  .line 154
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
  .line 155
    sget-object v0, Lcom/innioasis/ipp/Artists;->PARTS:Ljava/util/HashMap;
    monitor-enter v0
  :L2
  .line 156
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 157
    monitor-exit v0
  .line 159
    goto :L7
  :L3
  .line 157
    move-exception v1
    monitor-exit v0
  :L4
    throw v1
  :L5
  .line 152
    return-void
  :L6
  .line 158
    move-exception v0
  :L7
  .line 160
    return-void
.end method

.method private static exc()Ljava/util/Set;
  .registers 1
  .line 163
    sget-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Artists;->loadExceptions()Ljava/util/Set;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
  :L0
  .line 164
    sget-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
    return-object v0
.end method

.method private static exceptionsFile()Ljava/io/File;
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 88
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/File;
    const-string v2, "/storage/sdcard0"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 89
    invoke-virtual { v1 }, Ljava/io/File;->isDirectory()Z
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 90
    new-instance v1, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v2
    const-string v3, "comma_artists.txt"
    invoke-direct { v1, v2, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
  :L3
  .line 91
    move-exception v1
  .line 92
    return-object v0
.end method

.method public static focused(Lcom/innioasis/music/adapter/MyBaseAdapter;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L5 } :L7
  .registers 4
  .line 481
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 482
    nop
  :L1
  .line 483
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 484
    if-eqz v1, :L2
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L2
    const/4 v2, 0
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
    goto :L3
  :L2
  .line 485
    move-object v1, v0
  :L3
    if-nez v1, :L4
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  :L4
  .line 486
    instance-of p0, v1, Lcom/innioasis/y1/database/Song;
    if-eqz p0, :L6
    check-cast v1, Lcom/innioasis/y1/database/Song;
  :L5
    move-object v0, v1
  :L6
    return-object v0
  :L7
  .line 487
    move-exception p0
  .line 488
    return-object v0
.end method

.method public static forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L1 .. :L7 } :L9
  .registers 4
  .line 362
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtists;->songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L0
  .line 364
    if-eqz p1, :L2
  :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->songsInGenre(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
    goto :L3
  :L2
  .line 365
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Artists;->songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v0
  :L3
  .line 366
    if-eqz v0, :L4
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L4
    return-object v0
  :L4
  .line 367
    if-nez p1, :L5
  .line 368
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Artists;->byTag(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
  .line 369
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L5
    return-object v0
  :L5
  .line 371
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 372
    if-eqz v0, :L6
  .line 373
    const/4 v1, 0
    invoke-virtual { v0, p0, v1, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByArtistSync(Ljava/lang/String;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
  .line 374
    if-eqz v0, :L6
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L6
    return-object v0
  :L6
  .line 376
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->byTag(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object p0
  :L7
  .line 377
    if-eqz p0, :L8
    return-object p0
  :L8
  .line 379
    goto :L10
  :L9
  .line 378
    move-exception p0
  :L10
  .line 380
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
.end method

.method public static has(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 6
  .line 334
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 335
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 336
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    const/4 v2, 1
    if-eqz v0, :L1
    return v2
  :L1
  .line 337
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    if-nez v0, :L2
    return v1
  :L2
  .line 338
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 339
    const/4 v0, 0
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L5
  .line 340
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L4
    return v2
  :L4
  .line 339
    add-int/lit8 v0, v0, 1
    goto :L3
  :L5
  .line 342
    return v1
.end method

.method public static list(Ljava/util/List;Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;)Ljava/util/List;
  .registers 10
  .line 255
    if-eqz p0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 256
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 257
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L5
  .line 258
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v3
  .line 259
    const/4 v4, 0
  :L2
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 260
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 261
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 262
    invoke-virtual { v0, v6 }, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :L3
    invoke-virtual { v0, v6, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 259
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 257
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 265
    new-instance p0, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-direct { p0, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 266
    new-instance v0, Lcom/innioasis/ipp/Artists$NameCmp;
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
    if-ne p1, v2, :L6
    const/4 v1, 1
  :L6
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Artists$NameCmp;-><init>(Z)V
    invoke-static { p0, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 267
    return-object p0
  :L7
  .line 255
    return-object p0
.end method

.method public static listGenre(Ljava/util/List;)Ljava/util/List;
  .registers 9
  .line 275
    if-eqz p0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 276
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 277
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L5
  .line 278
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v3
  .line 279
    const/4 v4, 0
  :L2
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 280
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 281
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 282
    invoke-virtual { v0, v6 }, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :L3
    invoke-virtual { v0, v6, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 279
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 277
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 285
    new-instance p0, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-direct { p0, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 286
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 287
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result v1
    if-eqz v1, :L6
    new-instance v1, Lcom/innioasis/ipp/Artists$NameCmp;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    xor-int/lit8 v0, v0, 1
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Artists$NameCmp;-><init>(Z)V
    invoke-static { p0, v1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L6
  .line 288
    return-object p0
  :L7
  .line 275
    return-object p0
.end method

.method private static loadExceptions()Ljava/util/Set;
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 128
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 129
    invoke-static { }, Lcom/innioasis/ipp/Artists;->exceptionsFile()Ljava/io/File;
    move-result-object v1
  .line 131
    if-eqz v1, :L4
  :L0
  .line 132
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L1
    invoke-static { v1 }, Lcom/innioasis/ipp/Artists;->seed(Ljava/io/File;)V
  :L1
  .line 133
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 134
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Artists;->readInto(Ljava/io/File;Ljava/util/Set;)V
  :L2
  .line 135
    return-object v0
  :L3
  .line 138
    move-exception v1
    goto :L5
  :L4
  .line 139
    nop
  :L5
  .line 140
    const/4 v1, 0
  :L6
    sget-object v2, Lcom/innioasis/ipp/Artists;->DEFAULTS:[Ljava/lang/String;
    array-length v3, v2
    if-ge v1, v3, :L7
    aget-object v2, v2, v1
    invoke-static { v2 }, Lcom/innioasis/ipp/Artists;->canon(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    add-int/lit8 v1, v1, 1
    goto :L6
  :L7
  .line 141
    return-object v0
.end method

.method private static norm(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 71
    if-nez p0, :L0
    const-string p0, ""
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method public static of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
  .registers 6
  .line 462
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 463
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p0
  .line 464
    if-eqz p0, :L9
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-eqz v1, :L9
    const-string v1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    goto :L9
  :L1
  .line 465
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 466
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v2
    if-eqz v2, :L5
  .line 467
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 468
    const/4 v2, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 469
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 470
    if-eqz v3, :L3
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L3
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 468
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 472
    goto :L6
  :L5
  .line 473
    invoke-virtual { v1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 475
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-eqz p0, :L7
    goto :L8
  :L7
    move-object v0, v1
  :L8
    return-object v0
  :L9
  .line 464
    return-object v0
.end method

.method public static open(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 4
  .line 537
    if-eqz p0, :L1
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 538
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 539
    const-string v1, "ipp_artist"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 540
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 541
    return-void
  :L1
  .line 537
    return-void
.end method

.method public static openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 6
  .line 505
    const/4 v0, 1
  :L0
    invoke-static { p2 }, Lcom/innioasis/ipp/Artists;->focused(Lcom/innioasis/music/adapter/MyBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
  .line 506
    invoke-static { v1 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object v2
    if-nez v2, :L1
    return v0
  :L1
  .line 507
    if-eqz p2, :L2
  .line 508
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p2
  .line 509
    if-eqz p2, :L2
    invoke-interface { p2 }, Ljava/util/List;->clear()V
  :L2
  .line 511
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Artists;->openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/y1/database/Song;)Z
    move-result p0
  :L3
    return p0
  :L4
  .line 512
    move-exception p0
  .line 513
    return v0
.end method

.method public static openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 7
  .line 520
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 521
    invoke-static { p2 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object p2
  .line 522
    if-nez p2, :L1
    return v0
  :L1
  .line 523
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 0
    if-ne v1, v0, :L2
  .line 524
    invoke-interface { p2, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/String;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->open(Landroid/app/Activity;Ljava/lang/String;)V
  .line 525
    return v0
  :L2
  .line 528
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v3, Lcom/innioasis/ipp/Artists$Pick;
    invoke-direct { v3, p0, p1 }, Lcom/innioasis/ipp/Artists$Pick;-><init>(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;)V
    const p1, 2131886360
    invoke-direct { v1, p0, p2, v3, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L3
  .line 529
    return v2
  :L4
  .line 530
    move-exception p0
  .line 531
    return v0
.end method

.method public static parts(Ljava/lang/String;)Ljava/util/List;
  .catchall { :L1 .. :L3 } :L7
  .catchall { :L4 .. :L6 } :L5
  .catchall { :L8 .. :L9 } :L7
  .registers 3
  .line 173
    if-nez p0, :L0
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L0
  .line 174
    sget-object v0, Lcom/innioasis/ipp/Artists;->PARTS:Ljava/util/HashMap;
    monitor-enter v0
  :L1
  .line 175
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/util/List;
  .line 176
    if-eqz v1, :L2
    monitor-exit v0
    return-object v1
  :L2
  .line 177
    monitor-exit v0
  :L3
  .line 178
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->split(Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object v1
    invoke-static { v1 }, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
  .line 179
    monitor-enter v0
  :L4
  .line 180
    invoke-virtual { v0, p0, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 181
    monitor-exit v0
  .line 182
    return-object v1
  :L5
  .line 181
    move-exception p0
    monitor-exit v0
  :L6
    throw p0
  :L7
  .line 177
    move-exception p0
  :L8
    monitor-exit v0
  :L9
    throw p0
.end method

.method private static readInto(Ljava/io/File;Ljava/util/Set;)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L0 .. :L2 } :L4
  .registers 5
  .line 113
    new-instance v0, Ljava/io/BufferedReader;
    new-instance v1, Ljava/io/FileReader;
    invoke-direct { v1, p0 }, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    invoke-direct { v0, v1 }, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
  :L0
  .line 116
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object p0
    if-eqz p0, :L3
  .line 117
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 118
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-eqz v1, :L0
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    const/16 v2, 35
    if-ne v1, v2, :L1
    goto :L0
  :L1
  .line 119
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->canon(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 120
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L2
    invoke-interface { p1, p0 }, Ljava/util/Set;->add(Ljava/lang/Object;)Z
  :L2
  .line 121
    goto :L0
  :L3
  .line 123
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->close()V
  .line 124
    nop
  .line 125
    return-void
  :L4
  .line 123
    move-exception p0
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->close()V
  .line 124
    goto :L6
  :L5
    throw p0
  :L6
    goto :L5
.end method

.method public static rowName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
  .registers 3
  .line 213
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    sget-object p1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->name(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1, p0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 214
    if-eqz p0, :L4
    const-string v0, "; "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v0
    if-ltz v0, :L4
    instance-of v0, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L1
    goto :L4
  :L1
  .line 215
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p1
  .line 216
    instance-of v0, p1, Lcom/innioasis/music/ArtistsActivity;
    if-nez v0, :L3
    instance-of p1, p1, Lcom/innioasis/music/GenresActivity;
    if-eqz p1, :L2
    goto :L3
  :L2
  .line 217
    return-object p0
  :L3
  .line 216
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L4
  .line 214
    return-object p0
.end method

.method private static seed(Ljava/io/File;)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L1 .. :L3 } :L5
  .registers 4
  .line 97
    invoke-virtual { p0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object v0
  .line 98
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L0
    invoke-virtual { v0 }, Ljava/io/File;->mkdirs()Z
  :L0
  .line 99
    new-instance v0, Ljava/io/BufferedWriter;
    new-instance v1, Ljava/io/FileWriter;
    invoke-direct { v1, p0 }, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    invoke-direct { v0, v1 }, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
  :L1
  .line 101
    const-string p0, "# better-Y - artist names NOT to split on a comma (one per line).\n"
    invoke-virtual { v0, p0 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  .line 102
    const-string p0, "# Reboot the player after editing.\n"
    invoke-virtual { v0, p0 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  .line 103
    const/4 p0, 0
  :L2
    sget-object v1, Lcom/innioasis/ipp/Artists;->DEFAULTS:[Ljava/lang/String;
    array-length v2, v1
    if-ge p0, v2, :L4
  .line 104
    aget-object v1, v1, p0
    invoke-virtual { v0, v1 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  .line 105
    const-string v1, "\n"
    invoke-virtual { v0, v1 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  :L3
  .line 103
    add-int/lit8 p0, p0, 1
    goto :L2
  :L4
  .line 108
    invoke-virtual { v0 }, Ljava/io/BufferedWriter;->close()V
  .line 109
    nop
  .line 110
    return-void
  :L5
  .line 108
    move-exception p0
    invoke-virtual { v0 }, Ljava/io/BufferedWriter;->close()V
  .line 109
    goto :L7
  :L6
    throw p0
  :L7
    goto :L6
.end method

.method public static songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 13
  .line 409
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtists;->songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L0
  .line 410
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 411
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 412
    if-nez v0, :L2
    return-object v1
  :L2
  .line 413
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 414
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 415
    nop
  .line 416
    const/4 v3, 0
    const/4 v4, 0
    const/4 v5, 0
  :L3
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v4, v6, :L9
  .line 417
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 418
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v7
  .line 419
    nop
  .line 420
    const/4 v8, 0
  :L4
    invoke-interface { v7 }, Ljava/util/List;->size()I
    move-result v9
    const/4 v10, 1
    if-ge v8, v9, :L6
  .line 421
    invoke-interface { v7, v8 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Ljava/lang/String;
    invoke-static { v9 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v9, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v9
    if-eqz v9, :L5
    const/4 v7, 1
    goto :L7
  :L5
  .line 420
    add-int/lit8 v8, v8, 1
    goto :L4
  :L6
    const/4 v7, 0
  :L7
  .line 423
    if-eqz v7, :L8
  .line 424
    invoke-virtual { v2, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 425
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L8
    const/4 v5, 1
  :L8
  .line 416
    add-int/lit8 v4, v4, 1
    goto :L3
  :L9
  .line 428
    if-nez v5, :L10
    return-object v1
  :L10
  .line 429
    new-instance p0, Lcom/innioasis/ipp/Artists$SongCmp;
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Artists$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { v2, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 430
    return-object v2
.end method

.method public static songsInGenre(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .registers 10
  .line 296
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 298
    invoke-static { p1 }, Lcom/innioasis/ipp/GenreSplit;->composite(Lcom/innioasis/music/data/Genre;)Z
    move-result v1
  .line 299
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v2
    if-nez v2, :L1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 300
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v2
  .line 301
    if-nez v2, :L2
    return-object v0
  :L2
  .line 302
    invoke-virtual { v2, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByGenreSync(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object p1
  .line 303
    if-nez p1, :L3
    return-object v0
  :L3
  .line 304
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 305
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 306
    nop
  .line 307
    const/4 v4, 0
    const/4 v5, 0
  :L4
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v4, v6, :L7
  .line 308
    invoke-interface { p1, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 309
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7, p0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v7
    if-nez v7, :L5
    goto :L6
  :L5
  .line 310
    invoke-virtual { v3, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 311
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L6
    const/4 v5, 1
  :L6
  .line 307
    add-int/lit8 v4, v4, 1
    goto :L4
  :L7
  .line 313
    if-nez v5, :L8
    if-nez v1, :L8
    return-object v0
  :L8
  .line 314
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 316
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result p1
    if-eqz p1, :L11
  .line 317
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result p0
    if-eqz p0, :L9
  .line 318
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L10
  :L9
  .line 319
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L10
    goto :L14
  :L11
  .line 321
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result p0
    if-eqz p0, :L12
  .line 322
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L13
  :L12
  .line 323
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L13
    nop
  :L14
  .line 325
    new-instance p1, Lcom/innioasis/ipp/Artists$SongCmp;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Artists$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { v3, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 326
    return-object v3
.end method

.method private static split(Ljava/lang/String;)Ljava/util/ArrayList;
  .registers 6
  .line 188
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 189
    const-string v1, "; "
    invoke-virtual { p0, v1 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v2
    if-ltz v2, :L3
  .line 190
    invoke-virtual { p0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 191
    const/4 v2, 0
  :L0
    array-length v3, v1
    if-ge v2, v3, :L2
  .line 192
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
  .line 193
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L1
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 191
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 195
    goto :L4
  :L3
  .line 196
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Artists;->commaSplit(Ljava/util/List;Ljava/lang/String;)V
  :L4
  .line 198
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L5
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 199
    return-object v0
.end method

.method public static splitEnabled()Z
  .registers 2
  .line 65
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 66
    if-nez v0, :L0
    const/4 v0, 0
    return v0
  :L0
  .line 67
    const-string v1, "artist_split"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

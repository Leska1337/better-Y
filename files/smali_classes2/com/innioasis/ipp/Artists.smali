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

.field final static SEMI:Ljava/lang/String; = "; "

.field private static exceptions:Ljava/util/Set;

.method static constructor <clinit>()V
  .registers 3
  .line 65
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
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 62
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 62
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$100(JJ)I
  .registers 4
  .line 62
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Artists;->cmpLong(JJ)I
    move-result p0
    return p0
.end method

.method static synthetic access$200(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 62
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->cmpStr(Ljava/lang/String;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method private static byTag(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L0 .. :L9 } :L11
  .registers 8
  .line 472
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 473
    if-nez v1, :L1
    return-object v0
  :L1
  .line 474
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
  .line 475
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 476
    const/4 v3, 0
  :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L10
  .line 477
    invoke-interface { v1, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 478
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L6
    goto :L9
  :L6
  .line 479
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 480
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5, p0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :L7
    goto :L9
  :L7
  .line 481
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
  .line 482
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L9
  .line 476
    add-int/lit8 v3, v3, 1
    goto :L5
  :L10
  .line 484
    return-object v2
  :L11
  .line 485
    move-exception p0
  .line 486
    return-object v0
.end method

.method public static canOpen(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 1
  .line 596
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
  .line 102
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 103
    const-string v0, ","
    invoke-virtual { p0, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 104
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 105
    const/4 v1, 0
  :L1
    array-length v2, p0
    if-ge v1, v2, :L3
  .line 106
    if-lez v1, :L2
    const-string v2, ", "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L2
  .line 107
    aget-object v2, p0, v1
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 105
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 109
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static cmpLong(JJ)I
  .registers 5
  .line 546
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
  .line 541
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
  .line 274
    const-string v0, ", "
    invoke-virtual { p1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p1
  .line 275
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 276
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
  .line 277
    invoke-static { }, Lcom/innioasis/ipp/Artists;->exc()Ljava/util/Set;
    move-result-object p1
  .line 278
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
  .line 279
    nop
  :L2
  .line 280
    if-ge v2, v3, :L14
  .line 281
    nop
  .line 282
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
  .line 283
    const/4 v5, -1
    move v6, v2
  :L3
    if-ge v6, v3, :L6
  .line 284
    if-le v6, v2, :L4
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L4
  .line 285
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/String;
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 286
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-interface { p1, v7 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L5
    move v5, v6
  :L5
  .line 283
    add-int/lit8 v6, v6, 1
    goto :L3
  :L6
  .line 288
    if-lt v5, v2, :L11
  .line 289
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
  .line 290
    move v6, v2
  :L7
    if-gt v6, v5, :L9
  .line 291
    if-le v6, v2, :L8
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L8
  .line 292
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/String;
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 290
    add-int/lit8 v6, v6, 1
    goto :L7
  :L9
  .line 294
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
  .line 295
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L10
    invoke-interface { p0, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L10
  .line 296
    add-int/lit8 v5, v5, 1
  .line 297
    move v2, v5
    goto :L13
  :L11
  .line 298
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 299
    invoke-virtual { v4 }, Ljava/lang/String;->length()I
    move-result v5
    if-lez v5, :L12
    invoke-interface { p0, v4 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L12
  .line 300
    add-int/lit8 v2, v2, 1
  :L13
  .line 302
    goto :L2
  :L14
  .line 303
    return-void
.end method

.method public static display(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 252
    if-eqz p0, :L1
    const-string v0, "; "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v1
    if-gez v1, :L0
    goto :L1
  :L0
  .line 253
    const-string v1, ", "
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 252
    return-object p0
.end method

.method public static ensureExceptions()V
  .catchall { :L0 .. :L2 } :L4
  .registers 2
  :L0
  .line 203
    invoke-static { }, Lcom/innioasis/ipp/Artists;->exceptionsFile()Ljava/io/File;
    move-result-object v0
  .line 204
    if-eqz v0, :L3
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    goto :L3
  :L1
  .line 205
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->seed(Ljava/io/File;)V
  .line 206
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
  :L2
  .line 209
    goto :L5
  :L3
  .line 204
    return-void
  :L4
  .line 207
    move-exception v0
  :L5
  .line 210
    return-void
.end method

.method private static exc()Ljava/util/Set;
  .registers 1
  .line 213
    sget-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Artists;->loadExceptions()Ljava/util/Set;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
  :L0
  .line 214
    sget-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
    return-object v0
.end method

.method private static exceptionsFile()Ljava/io/File;
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 125
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/File;
    const-string v2, "/storage/sdcard0"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 126
    invoke-virtual { v1 }, Ljava/io/File;->isDirectory()Z
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 129
    new-instance v1, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v2
    const-string v3, "comma_artists.txt"
    invoke-direct { v1, v2, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
  :L3
  .line 130
    move-exception v1
  .line 131
    return-object v0
.end method

.method public static focused(Lcom/innioasis/music/adapter/MyBaseAdapter;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L5 } :L7
  .registers 4
  .line 583
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 584
    nop
  :L1
  .line 585
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 586
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
  .line 587
    move-object v1, v0
  :L3
    if-nez v1, :L4
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  :L4
  .line 588
    instance-of p0, v1, Lcom/innioasis/y1/database/Song;
    if-eqz p0, :L6
    check-cast v1, Lcom/innioasis/y1/database/Song;
  :L5
    move-object v0, v1
  :L6
    return-object v0
  :L7
  .line 589
    move-exception p0
  .line 590
    return-object v0
.end method

.method public static forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  .line 449
    if-eqz p1, :L1
  :L0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->songsInGenre(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
    goto :L2
  :L1
  .line 450
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Artists;->songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v0
  :L2
  .line 451
    if-eqz v0, :L3
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L3
    return-object v0
  :L3
  .line 452
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 453
    if-eqz v0, :L4
  .line 454
    const/4 v1, 0
    invoke-virtual { v0, p0, v1, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByArtistSync(Ljava/lang/String;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
  .line 455
    if-eqz v0, :L4
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L4
    return-object v0
  :L4
  .line 457
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->byTag(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object p0
  :L5
  .line 458
    if-eqz p0, :L6
    return-object p0
  :L6
  .line 461
    goto :L8
  :L7
  .line 459
    move-exception p0
  :L8
  .line 462
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
.end method

.method public static has(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 6
  .line 405
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 406
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 407
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    const/4 v2, 1
    if-eqz v0, :L1
    return v2
  :L1
  .line 408
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    if-nez v0, :L2
    return v1
  :L2
  .line 409
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 410
    const/4 v0, 0
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L5
  .line 411
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
  .line 410
    add-int/lit8 v0, v0, 1
    goto :L3
  :L5
  .line 413
    return v1
.end method

.method public static list(Ljava/util/List;Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;)Ljava/util/List;
  .registers 10
  .line 311
    if-eqz p0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 312
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 313
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L5
  .line 314
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v3
  .line 315
    const/4 v4, 0
  :L2
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 316
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 317
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 318
    invoke-virtual { v0, v6 }, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :L3
    invoke-virtual { v0, v6, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 315
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 313
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 321
    new-instance p0, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-direct { p0, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 322
    new-instance v0, Lcom/innioasis/ipp/Artists$NameCmp;
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
    if-ne p1, v2, :L6
    const/4 v1, 1
  :L6
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Artists$NameCmp;-><init>(Z)V
    invoke-static { p0, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 323
    return-object p0
  :L7
  .line 311
    return-object p0
.end method

.method public static listGenre(Ljava/util/List;)Ljava/util/List;
  .registers 9
  .line 337
    if-eqz p0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 338
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 339
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L5
  .line 340
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v3
  .line 341
    const/4 v4, 0
  :L2
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 342
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 343
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 344
    invoke-virtual { v0, v6 }, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :L3
    invoke-virtual { v0, v6, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 341
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 339
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 347
    new-instance p0, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-direct { p0, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 348
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 349
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
  .line 350
    return-object p0
  :L7
  .line 337
    return-object p0
.end method

.method private static loadExceptions()Ljava/util/Set;
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 167
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 168
    invoke-static { }, Lcom/innioasis/ipp/Artists;->exceptionsFile()Ljava/io/File;
    move-result-object v1
  .line 170
    if-eqz v1, :L4
  :L0
  .line 171
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L1
    invoke-static { v1 }, Lcom/innioasis/ipp/Artists;->seed(Ljava/io/File;)V
  :L1
  .line 172
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 173
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Artists;->readInto(Ljava/io/File;Ljava/util/Set;)V
  :L2
  .line 174
    return-object v0
  :L3
  .line 177
    move-exception v1
    goto :L5
  :L4
  .line 179
    nop
  :L5
  .line 180
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
  .line 181
    return-object v0
.end method

.method private static norm(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 96
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
  .line 564
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 565
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p0
  .line 566
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
  .line 567
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 568
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v2
    if-eqz v2, :L5
  .line 569
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 570
    const/4 v2, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 571
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 572
    if-eqz v3, :L3
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L3
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 570
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 574
    goto :L6
  :L5
  .line 575
    invoke-virtual { v1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 577
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-eqz p0, :L7
    goto :L8
  :L7
    move-object v0, v1
  :L8
    return-object v0
  :L9
  .line 566
    return-object v0
.end method

.method public static open(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 4
  .line 643
    if-eqz p0, :L1
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 644
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 645
    const-string v1, "ipp_artist"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 646
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 647
    return-void
  :L1
  .line 643
    return-void
.end method

.method public static openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 6
  .line 607
    const/4 v0, 1
  :L0
    invoke-static { p2 }, Lcom/innioasis/ipp/Artists;->focused(Lcom/innioasis/music/adapter/MyBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
  .line 608
    invoke-static { v1 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object v2
    if-nez v2, :L1
    return v0
  :L1
  .line 611
    if-eqz p2, :L2
  .line 612
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p2
  .line 613
    if-eqz p2, :L2
    invoke-interface { p2 }, Ljava/util/List;->clear()V
  :L2
  .line 615
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Artists;->openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/y1/database/Song;)Z
    move-result p0
  :L3
    return p0
  :L4
  .line 616
    move-exception p0
  .line 617
    return v0
.end method

.method public static openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 7
  .line 624
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 625
    invoke-static { p2 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object p2
  .line 626
    if-nez p2, :L1
    return v0
  :L1
  .line 627
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 0
    if-ne v1, v0, :L2
  .line 628
    invoke-interface { p2, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/String;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->open(Landroid/app/Activity;Ljava/lang/String;)V
  .line 629
    return v0
  :L2
  .line 634
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v3, Lcom/innioasis/ipp/Artists$Pick;
    invoke-direct { v3, p0, p1 }, Lcom/innioasis/ipp/Artists$Pick;-><init>(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;)V
    const p1, 2131886360
    invoke-direct { v1, p0, p2, v3, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L3
  .line 635
    return v2
  :L4
  .line 636
    move-exception p0
  .line 637
    return v0
.end method

.method public static parts(Ljava/lang/String;)Ljava/util/List;
  .registers 6
  .line 229
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 230
    if-nez p0, :L0
    return-object v0
  :L0
  .line 231
    const-string v1, "; "
    invoke-virtual { p0, v1 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v2
    if-ltz v2, :L4
  .line 232
    invoke-virtual { p0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 233
    const/4 v2, 0
  :L1
    array-length v3, v1
    if-ge v2, v3, :L3
  .line 234
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
  .line 235
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L2
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 233
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 237
    goto :L5
  :L4
  .line 238
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Artists;->commaSplit(Ljava/util/List;Ljava/lang/String;)V
  :L5
  .line 240
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L6
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 241
    return-object v0
.end method

.method private static readInto(Ljava/io/File;Ljava/util/Set;)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L0 .. :L2 } :L4
  .registers 5
  .line 152
    new-instance v0, Ljava/io/BufferedReader;
    new-instance v1, Ljava/io/FileReader;
    invoke-direct { v1, p0 }, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    invoke-direct { v0, v1 }, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
  :L0
  .line 155
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object p0
    if-eqz p0, :L3
  .line 156
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 157
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
  .line 158
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->canon(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 159
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L2
    invoke-interface { p1, p0 }, Ljava/util/Set;->add(Ljava/lang/Object;)Z
  :L2
  .line 160
    goto :L0
  :L3
  .line 162
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->close()V
  .line 163
    nop
  .line 164
    return-void
  :L4
  .line 162
    move-exception p0
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->close()V
  .line 163
    goto :L6
  :L5
    throw p0
  :L6
    goto :L5
.end method

.method public static rowName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
  .registers 3
  .line 266
    if-eqz p0, :L3
    const-string v0, "; "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v0
    if-ltz v0, :L3
    instance-of v0, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    goto :L3
  :L0
  .line 267
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p1
  .line 268
    instance-of v0, p1, Lcom/innioasis/music/ArtistsActivity;
    if-nez v0, :L2
    instance-of p1, p1, Lcom/innioasis/music/GenresActivity;
    if-eqz p1, :L1
    goto :L2
  :L1
  .line 269
    return-object p0
  :L2
  .line 268
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L3
  .line 266
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
  .line 136
    invoke-virtual { p0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object v0
  .line 137
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L0
    invoke-virtual { v0 }, Ljava/io/File;->mkdirs()Z
  :L0
  .line 138
    new-instance v0, Ljava/io/BufferedWriter;
    new-instance v1, Ljava/io/FileWriter;
    invoke-direct { v1, p0 }, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    invoke-direct { v0, v1 }, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
  :L1
  .line 140
    const-string p0, "# better-Y - artist names NOT to split on a comma (one per line).\n"
    invoke-virtual { v0, p0 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  .line 141
    const-string p0, "# Reboot the player after editing.\n"
    invoke-virtual { v0, p0 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  .line 142
    const/4 p0, 0
  :L2
    sget-object v1, Lcom/innioasis/ipp/Artists;->DEFAULTS:[Ljava/lang/String;
    array-length v2, v1
    if-ge p0, v2, :L4
  .line 143
    aget-object v1, v1, p0
    invoke-virtual { v0, v1 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  .line 144
    const-string v1, "\n"
    invoke-virtual { v0, v1 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  :L3
  .line 142
    add-int/lit8 p0, p0, 1
    goto :L2
  :L4
  .line 147
    invoke-virtual { v0 }, Ljava/io/BufferedWriter;->close()V
  .line 148
    nop
  .line 149
    return-void
  :L5
  .line 147
    move-exception p0
    invoke-virtual { v0 }, Ljava/io/BufferedWriter;->close()V
  .line 148
    goto :L7
  :L6
    throw p0
  :L7
    goto :L6
.end method

.method public static songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 13
  .line 497
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 498
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 499
    if-nez v0, :L1
    return-object v1
  :L1
  .line 500
    const/4 v2, 0
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
  .line 501
    if-nez v0, :L2
    return-object v1
  :L2
  .line 502
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 503
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 504
    nop
  .line 505
    const/4 v4, 0
    const/4 v5, 0
  :L3
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v4, v6, :L9
  .line 506
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 507
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v7
  .line 508
    nop
  .line 509
    const/4 v8, 0
  :L4
    invoke-interface { v7 }, Ljava/util/List;->size()I
    move-result v9
    const/4 v10, 1
    if-ge v8, v9, :L6
  .line 510
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
  .line 509
    add-int/lit8 v8, v8, 1
    goto :L4
  :L6
    const/4 v7, 0
  :L7
  .line 512
    if-eqz v7, :L8
  .line 513
    invoke-virtual { v3, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 514
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L8
    const/4 v5, 1
  :L8
  .line 505
    add-int/lit8 v4, v4, 1
    goto :L3
  :L9
  .line 517
    if-nez v5, :L10
    return-object v1
  :L10
  .line 518
    new-instance p0, Lcom/innioasis/ipp/Artists$SongCmp;
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Artists$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { v3, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 519
    return-object v3
.end method

.method public static songsInGenre(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .registers 10
  .line 363
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 367
    invoke-static { p1 }, Lcom/innioasis/ipp/GenreSplit;->composite(Lcom/innioasis/music/data/Genre;)Z
    move-result v1
  .line 368
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v2
    if-nez v2, :L1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 369
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v2
  .line 370
    if-nez v2, :L2
    return-object v0
  :L2
  .line 371
    invoke-virtual { v2, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByGenreSync(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object p1
  .line 372
    if-nez p1, :L3
    return-object v0
  :L3
  .line 373
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 374
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 375
    nop
  .line 376
    const/4 v4, 0
    const/4 v5, 0
  :L4
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v4, v6, :L7
  .line 377
    invoke-interface { p1, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 378
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7, p0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v7
    if-nez v7, :L5
    goto :L6
  :L5
  .line 379
    invoke-virtual { v3, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 380
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L6
    const/4 v5, 1
  :L6
  .line 376
    add-int/lit8 v4, v4, 1
    goto :L4
  :L7
  .line 382
    if-nez v5, :L8
    if-nez v1, :L8
    return-object v0
  :L8
  .line 383
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 385
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result p1
    if-eqz p1, :L11
  .line 386
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result p0
    if-eqz p0, :L9
  .line 387
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L10
  :L9
  .line 388
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L10
    goto :L14
  :L11
  .line 390
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result p0
    if-eqz p0, :L12
  .line 391
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L13
  :L12
  .line 392
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L13
    nop
  :L14
  .line 394
    new-instance p1, Lcom/innioasis/ipp/Artists$SongCmp;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Artists$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { v3, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 395
    return-object v3
.end method

.method public static splitEnabled()Z
  .registers 2
  .line 90
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 91
    if-nez v0, :L0
    const/4 v0, 0
    return v0
  :L0
  .line 92
    const-string v1, "artist_split"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

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

.field private final static NORM:Ljava/util/HashMap;

.field private final static NPARTS:Ljava/util/HashMap;

.field private final static PARTS:Ljava/util/HashMap;

.field final static SEMI:Ljava/lang/String; = "; "

.field private static exceptions:Ljava/util/Set;

.field private static ixFor:Ljava/util/List;

.field private static ixGen:I

.field private static ixParts:[[Ljava/lang/String;

.field private static ixWhole:[Ljava/lang/String;

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
  .line 70
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Artists;->NORM:Ljava/util/HashMap;
  .line 203
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Artists;->PARTS:Ljava/util/HashMap;
  .line 359
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Artists;->NPARTS:Ljava/util/HashMap;
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
  .line 503
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 504
    if-nez v1, :L1
    return-object v0
  :L1
  .line 505
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
  .line 506
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 507
    const/4 v3, 0
  :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L10
  .line 508
    invoke-interface { v1, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 509
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L6
    goto :L9
  :L6
  .line 510
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 511
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5, p0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :L7
    goto :L9
  :L7
  .line 512
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
  .line 513
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L9
  .line 507
    add-int/lit8 v3, v3, 1
    goto :L5
  :L10
  .line 515
    return-object v2
  :L11
  .line 516
    move-exception p0
  .line 517
    return-object v0
.end method

.method public static canOpen(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 1
  .line 607
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
  .line 89
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 90
    const-string v0, ","
    invoke-virtual { p0, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 91
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 92
    const/4 v1, 0
  :L1
    array-length v2, p0
    if-ge v1, v2, :L3
  .line 93
    if-lez v1, :L2
    const-string v2, ", "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L2
  .line 94
    aget-object v2, p0, v1
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 92
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 96
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static cmpLong(JJ)I
  .registers 5
  .line 568
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
  .line 564
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
  .line 240
    const-string v0, ", "
    invoke-virtual { p1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p1
  .line 241
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 242
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
  .line 243
    invoke-static { }, Lcom/innioasis/ipp/Artists;->exc()Ljava/util/Set;
    move-result-object p1
  .line 244
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
  .line 245
    nop
  :L2
  .line 246
    if-ge v2, v3, :L14
  .line 247
    nop
  .line 248
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
  .line 249
    const/4 v5, -1
    move v6, v2
  :L3
    if-ge v6, v3, :L6
  .line 250
    if-le v6, v2, :L4
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L4
  .line 251
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/String;
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 252
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-interface { p1, v7 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L5
    move v5, v6
  :L5
  .line 249
    add-int/lit8 v6, v6, 1
    goto :L3
  :L6
  .line 254
    if-lt v5, v2, :L11
  .line 255
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
  .line 256
    move v6, v2
  :L7
    if-gt v6, v5, :L9
  .line 257
    if-le v6, v2, :L8
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L8
  .line 258
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/String;
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 256
    add-int/lit8 v6, v6, 1
    goto :L7
  :L9
  .line 260
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
  .line 261
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L10
    invoke-interface { p0, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L10
  .line 262
    add-int/lit8 v5, v5, 1
  .line 263
    move v2, v5
    goto :L13
  :L11
  .line 264
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 265
    invoke-virtual { v4 }, Ljava/lang/String;->length()I
    move-result v5
    if-lez v5, :L12
    invoke-interface { p0, v4 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L12
  .line 266
    add-int/lit8 v2, v2, 1
  :L13
  .line 268
    goto :L2
  :L14
  .line 269
    return-void
.end method

.method public static display(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 222
    if-eqz p0, :L1
    const-string v0, "; "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v1
    if-gez v1, :L0
    goto :L1
  :L0
  .line 223
    const-string v1, ", "
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 222
    return-object p0
.end method

.method public static ensureExceptions()V
  .catchall { :L0 .. :L2 } :L11
  .catchall { :L2 .. :L3 } :L7
  .catchall { :L3 .. :L4 } :L11
  .catchall { :L4 .. :L6 } :L5
  .catchall { :L6 .. :L7 } :L11
  .catchall { :L8 .. :L9 } :L7
  .catchall { :L9 .. :L10 } :L11
  .registers 2
  :L0
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/Artists;->exceptionsFile()Ljava/io/File;
    move-result-object v0
  .line 165
    if-eqz v0, :L10
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    goto :L10
  :L1
  .line 166
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->seed(Ljava/io/File;)V
  .line 167
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
  .line 168
    sget-object v1, Lcom/innioasis/ipp/Artists;->PARTS:Ljava/util/HashMap;
    monitor-enter v1
  :L2
  .line 169
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 170
    monitor-exit v1
  :L3
  .line 171
    sget-object v1, Lcom/innioasis/ipp/Artists;->NPARTS:Ljava/util/HashMap;
    monitor-enter v1
  :L4
  .line 172
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 173
    sput-object v0, Lcom/innioasis/ipp/Artists;->ixFor:Ljava/util/List;
  .line 174
    sget v0, Lcom/innioasis/ipp/Artists;->ixGen:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Artists;->ixGen:I
  .line 175
    monitor-exit v1
  .line 177
    goto :L12
  :L5
  .line 175
    move-exception v0
    monitor-exit v1
  :L6
    throw v0
  :L7
  .line 170
    move-exception v0
  :L8
    monitor-exit v1
  :L9
    throw v0
  :L10
  .line 165
    return-void
  :L11
  .line 176
    move-exception v0
  :L12
  .line 178
    return-void
.end method

.method private static exc()Ljava/util/Set;
  .registers 1
  .line 181
    sget-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Artists;->loadExceptions()Ljava/util/Set;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
  :L0
  .line 182
    sget-object v0, Lcom/innioasis/ipp/Artists;->exceptions:Ljava/util/Set;
    return-object v0
.end method

.method private static exceptionsFile()Ljava/io/File;
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 101
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/File;
    const-string v2, "/storage/sdcard0"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 102
    invoke-virtual { v1 }, Ljava/io/File;->isDirectory()Z
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 103
    new-instance v1, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v2
    const-string v3, "comma_artists.txt"
    invoke-direct { v1, v2, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
  :L3
  .line 104
    move-exception v1
  .line 105
    return-object v0
.end method

.method public static focused(Lcom/innioasis/music/adapter/MyBaseAdapter;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L5 } :L7
  .registers 4
  .line 594
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 595
    nop
  :L1
  .line 596
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 597
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
  .line 598
    move-object v1, v0
  :L3
    if-nez v1, :L4
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  :L4
  .line 599
    instance-of p0, v1, Lcom/innioasis/y1/database/Song;
    if-eqz p0, :L6
    check-cast v1, Lcom/innioasis/y1/database/Song;
  :L5
    move-object v0, v1
  :L6
    return-object v0
  :L7
  .line 600
    move-exception p0
  .line 601
    return-object v0
.end method

.method public static forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L1 .. :L11 } :L2
  .registers 5
  .line 475
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtists;->songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L0
  .line 477
    const/4 v0, 0
    if-nez p1, :L3
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->ofArtist(Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
    goto :L4
  :L2
  .line 495
    move-exception p0
    goto :L13
  :L3
  .line 477
    move-object v1, v0
  :L4
  .line 478
    if-eqz v1, :L5
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L5
    return-object v1
  :L5
  .line 479
    if-nez v1, :L9
  .line 480
    if-eqz p1, :L6
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->songsInGenre(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v1
    goto :L7
  :L6
  .line 481
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Artists;->songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v1
  :L7
  .line 482
    if-eqz v1, :L8
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L8
    return-object v1
  :L8
  .line 483
    if-nez p1, :L9
  .line 484
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Artists;->byTag(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
  .line 485
    if-eqz v0, :L9
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L9
    return-object v0
  :L9
  .line 488
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 489
    if-eqz v0, :L10
  .line 490
    const/4 v1, 0
    invoke-virtual { v0, p0, v1, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByArtistSync(Ljava/lang/String;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
  .line 491
    if-eqz v0, :L10
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L10
    return-object v0
  :L10
  .line 493
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->byTag(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object p0
  :L11
  .line 494
    if-eqz p0, :L12
    return-object p0
  :L12
  .line 496
    nop
  :L13
  .line 497
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
.end method

.method public static has(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 4
  .line 352
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 353
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 354
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    const/4 p0, 1
    return p0
  :L1
  .line 355
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    if-nez v0, :L2
    return v1
  :L2
  .line 356
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->inParts(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method private static inParts(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 5
  .line 363
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 364
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->normParts(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 365
    const/4 v1, 0
  :L1
    array-length v2, p0
    if-ge v1, v2, :L3
  .line 366
    aget-object v2, p0, v1
    invoke-virtual { v2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
    const/4 p0, 1
    return p0
  :L2
  .line 365
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 368
    return v0
.end method

.method static index(Ljava/util/List;)V
  .catchall { :L1 .. :L3 } :L13
  .catchall { :L9 .. :L12 } :L11
  .catchall { :L14 .. :L15 } :L13
  .registers 8
  .line 390
    if-nez p0, :L0
    return-void
  :L0
  .line 392
    sget-object v0, Lcom/innioasis/ipp/Artists;->NPARTS:Ljava/util/HashMap;
    monitor-enter v0
  :L1
  .line 393
    sget-object v1, Lcom/innioasis/ipp/Artists;->ixFor:Ljava/util/List;
    if-ne v1, p0, :L2
    monitor-exit v0
    return-void
  :L2
  .line 394
    sget v1, Lcom/innioasis/ipp/Artists;->ixGen:I
  .line 395
    monitor-exit v0
  :L3
  .line 396
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 397
    new-array v2, v0, [Ljava/lang/String;
  .line 398
    new-array v3, v0, [[Ljava/lang/String;
  .line 399
    const/4 v4, 0
  :L4
    if-ge v4, v0, :L8
  .line 400
    invoke-interface { p0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 401
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-nez v6, :L5
    goto :L7
  :L5
  .line 402
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v5
  .line 403
    if-nez v5, :L6
    goto :L7
  :L6
  .line 404
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    aput-object v6, v2, v4
  .line 405
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->normParts(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v5
    aput-object v5, v3, v4
  :L7
  .line 399
    add-int/lit8 v4, v4, 1
    goto :L4
  :L8
  .line 407
    sget-object v4, Lcom/innioasis/ipp/Artists;->NPARTS:Ljava/util/HashMap;
    monitor-enter v4
  :L9
  .line 408
    sget v0, Lcom/innioasis/ipp/Artists;->ixGen:I
    if-eq v1, v0, :L10
    monitor-exit v4
    return-void
  :L10
  .line 409
    sput-object p0, Lcom/innioasis/ipp/Artists;->ixFor:Ljava/util/List;
  .line 410
    sput-object v2, Lcom/innioasis/ipp/Artists;->ixWhole:[Ljava/lang/String;
  .line 411
    sput-object v3, Lcom/innioasis/ipp/Artists;->ixParts:[[Ljava/lang/String;
  .line 412
    monitor-exit v4
  .line 413
    return-void
  :L11
  .line 412
    move-exception p0
    monitor-exit v4
  :L12
    throw p0
  :L13
  .line 395
    move-exception p0
  :L14
    monitor-exit v0
  :L15
    goto :L17
  :L16
    throw p0
  :L17
    goto :L16
.end method

.method public static list(Ljava/util/List;Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;)Ljava/util/List;
  .registers 10
  .line 273
    if-eqz p0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 274
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 275
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L5
  .line 276
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v3
  .line 277
    const/4 v4, 0
  :L2
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 278
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 279
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 280
    invoke-virtual { v0, v6 }, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :L3
    invoke-virtual { v0, v6, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 277
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 275
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 283
    new-instance p0, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-direct { p0, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 284
    new-instance v0, Lcom/innioasis/ipp/Artists$NameCmp;
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
    if-ne p1, v2, :L6
    const/4 v1, 1
  :L6
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Artists$NameCmp;-><init>(Z)V
    invoke-static { p0, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 285
    return-object p0
  :L7
  .line 273
    return-object p0
.end method

.method public static listGenre(Ljava/util/List;)Ljava/util/List;
  .registers 9
  .line 293
    if-eqz p0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 294
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 295
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L5
  .line 296
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v3
  .line 297
    const/4 v4, 0
  :L2
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 298
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 299
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 300
    invoke-virtual { v0, v6 }, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :L3
    invoke-virtual { v0, v6, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 297
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 295
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 303
    new-instance p0, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-direct { p0, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 304
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 305
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
  .line 306
    return-object p0
  :L7
  .line 293
    return-object p0
.end method

.method private static loadExceptions()Ljava/util/Set;
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 141
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 142
    invoke-static { }, Lcom/innioasis/ipp/Artists;->exceptionsFile()Ljava/io/File;
    move-result-object v1
  .line 144
    if-eqz v1, :L4
  :L0
  .line 145
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L1
    invoke-static { v1 }, Lcom/innioasis/ipp/Artists;->seed(Ljava/io/File;)V
  :L1
  .line 146
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 147
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Artists;->readInto(Ljava/io/File;Ljava/util/Set;)V
  :L2
  .line 148
    return-object v0
  :L3
  .line 151
    move-exception v1
    goto :L5
  :L4
  .line 152
    nop
  :L5
  .line 153
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
  .line 154
    return-object v0
.end method

.method private static norm(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L1 .. :L3 } :L8
  .catchall { :L4 .. :L7 } :L6
  .catchall { :L9 .. :L10 } :L8
  .registers 5
  .line 74
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 75
    sget-object v0, Lcom/innioasis/ipp/Artists;->NORM:Ljava/util/HashMap;
    monitor-enter v0
  :L1
  .line 76
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 77
    if-eqz v1, :L2
    check-cast v1, Ljava/lang/String;
    monitor-exit v0
    return-object v1
  :L2
  .line 78
    monitor-exit v0
  :L3
  .line 79
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1
  .line 80
    monitor-enter v0
  :L4
  .line 81
    invoke-virtual { v0 }, Ljava/util/HashMap;->size()I
    move-result v2
    const/16 v3, 8192
    if-lt v2, v3, :L5
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  :L5
  .line 82
    invoke-virtual { v0, p0, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 83
    monitor-exit v0
  .line 84
    return-object v1
  :L6
  .line 83
    move-exception p0
    monitor-exit v0
  :L7
    throw p0
  :L8
  .line 78
    move-exception p0
  :L9
    monitor-exit v0
  :L10
    throw p0
.end method

.method private static normParts(Ljava/lang/String;)[Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L8
  .catchall { :L4 .. :L6 } :L5
  .catchall { :L9 .. :L10 } :L8
  .registers 6
  .line 373
    sget-object v0, Lcom/innioasis/ipp/Artists;->NPARTS:Ljava/util/HashMap;
    monitor-enter v0
  :L0
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Ljava/lang/String;
    monitor-exit v0
  :L1
  .line 374
    if-nez v1, :L7
  .line 375
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v0
  .line 376
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    new-array v2, v1, [Ljava/lang/String;
  .line 377
    const/4 v3, 0
  :L2
    if-ge v3, v1, :L3
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-static { v4 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    aput-object v4, v2, v3
    add-int/lit8 v3, v3, 1
    goto :L2
  :L3
  .line 378
    sget-object v0, Lcom/innioasis/ipp/Artists;->NPARTS:Ljava/util/HashMap;
    monitor-enter v0
  :L4
    invoke-virtual { v0, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    monitor-exit v0
    move-object v1, v2
    goto :L7
  :L5
    move-exception p0
    monitor-exit v0
  :L6
    throw p0
  :L7
  .line 380
    return-object v1
  :L8
  .line 373
    move-exception p0
  :L9
    monitor-exit v0
  :L10
    goto :L12
  :L11
    throw p0
  :L12
    goto :L11
.end method

.method public static of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
  .registers 6
  .line 575
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 576
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p0
  .line 577
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
  .line 578
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 579
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v2
    if-eqz v2, :L5
  .line 580
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 581
    const/4 v2, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 582
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 583
    if-eqz v3, :L3
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L3
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 581
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 585
    goto :L6
  :L5
  .line 586
    invoke-virtual { v1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 588
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-eqz p0, :L7
    goto :L8
  :L7
    move-object v0, v1
  :L8
    return-object v0
  :L9
  .line 577
    return-object v0
.end method

.method private static ofArtist(Ljava/lang/String;)Ljava/util/List;
  .catchall { :L1 .. :L3 } :L15
  .catchall { :L16 .. :L17 } :L15
  .registers 15
  .line 420
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 421
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 422
    const/4 v1, 0
    if-eqz v0, :L18
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L0
    goto/16 :L18
  :L0
  .line 423
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->index(Ljava/util/List;)V
  .line 426
    sget-object v2, Lcom/innioasis/ipp/Artists;->NPARTS:Ljava/util/HashMap;
    monitor-enter v2
  :L1
  .line 427
    sget-object v3, Lcom/innioasis/ipp/Artists;->ixFor:Ljava/util/List;
    if-eq v3, v0, :L2
    monitor-exit v2
    return-object v1
  :L2
  .line 428
    sget-object v1, Lcom/innioasis/ipp/Artists;->ixWhole:[Ljava/lang/String;
  .line 429
    sget-object v3, Lcom/innioasis/ipp/Artists;->ixParts:[[Ljava/lang/String;
  .line 430
    monitor-exit v2
  :L3
  .line 431
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v2
  .line 432
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct { v4 }, Ljava/util/ArrayList;-><init>()V
  .line 433
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 434
    nop
  .line 435
    const/4 v6, 0
    const/4 v7, 0
    const/4 v8, 0
  :L4
    array-length v9, v1
    if-ge v7, v9, :L13
  .line 436
    aget-object v9, v1, v7
    if-nez v9, :L5
    goto :L12
  :L5
  .line 437
    invoke-virtual { v9, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v9
  .line 438
    nop
  .line 439
    const/4 v10, 1
    if-eqz v2, :L8
  .line 440
    aget-object v11, v3, v7
  .line 441
    const/4 v12, 0
  :L6
    array-length v13, v11
    if-ge v12, v13, :L8
  .line 442
    aget-object v13, v11, v12
    invoke-virtual { v13, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v13
    if-eqz v13, :L7
    const/4 v11, 1
    goto :L9
  :L7
  .line 441
    add-int/lit8 v12, v12, 1
    goto :L6
  :L8
  .line 445
    const/4 v11, 0
  :L9
    if-eqz v11, :L10
  .line 446
    invoke-interface { v0, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v12
    invoke-virtual { v4, v12 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 447
    if-nez v9, :L10
    const/4 v8, 1
  :L10
  .line 449
    if-nez v9, :L11
    if-eqz v11, :L12
  :L11
    invoke-interface { v0, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
    invoke-virtual { v5, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L12
  .line 435
    add-int/lit8 v7, v7, 1
    goto :L4
  :L13
  .line 451
    if-eqz v8, :L14
  .line 452
    new-instance p0, Lcom/innioasis/ipp/Artists$SongCmp;
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Artists$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { v4, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 453
    return-object v4
  :L14
  .line 455
    return-object v5
  :L15
  .line 430
    move-exception p0
  :L16
    monitor-exit v2
  :L17
    throw p0
  :L18
  .line 422
    return-object v1
.end method

.method public static open(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 4
  .line 650
    if-eqz p0, :L1
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 651
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 652
    const-string v1, "ipp_artist"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 653
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 654
    return-void
  :L1
  .line 650
    return-void
.end method

.method public static openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 6
  .line 618
    const/4 v0, 1
  :L0
    invoke-static { p2 }, Lcom/innioasis/ipp/Artists;->focused(Lcom/innioasis/music/adapter/MyBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
  .line 619
    invoke-static { v1 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object v2
    if-nez v2, :L1
    return v0
  :L1
  .line 620
    if-eqz p2, :L2
  .line 621
    invoke-virtual { p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p2
  .line 622
    if-eqz p2, :L2
    invoke-interface { p2 }, Ljava/util/List;->clear()V
  :L2
  .line 624
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Artists;->openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/y1/database/Song;)Z
    move-result p0
  :L3
    return p0
  :L4
  .line 625
    move-exception p0
  .line 626
    return v0
.end method

.method public static openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 7
  .line 633
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 634
    invoke-static { p2 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object p2
  .line 635
    if-nez p2, :L1
    return v0
  :L1
  .line 636
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 0
    if-ne v1, v0, :L2
  .line 637
    invoke-interface { p2, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/String;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Artists;->open(Landroid/app/Activity;Ljava/lang/String;)V
  .line 638
    return v0
  :L2
  .line 641
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v3, Lcom/innioasis/ipp/Artists$Pick;
    invoke-direct { v3, p0, p1 }, Lcom/innioasis/ipp/Artists$Pick;-><init>(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;)V
    const p1, 2131886360
    invoke-direct { v1, p0, p2, v3, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L3
  .line 642
    return v2
  :L4
  .line 643
    move-exception p0
  .line 644
    return v0
.end method

.method public static parts(Ljava/lang/String;)Ljava/util/List;
  .catchall { :L1 .. :L3 } :L7
  .catchall { :L4 .. :L6 } :L5
  .catchall { :L8 .. :L9 } :L7
  .registers 3
  .line 191
    if-nez p0, :L0
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L0
  .line 192
    sget-object v0, Lcom/innioasis/ipp/Artists;->PARTS:Ljava/util/HashMap;
    monitor-enter v0
  :L1
  .line 193
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/util/List;
  .line 194
    if-eqz v1, :L2
    monitor-exit v0
    return-object v1
  :L2
  .line 195
    monitor-exit v0
  :L3
  .line 196
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->split(Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object v1
    invoke-static { v1 }, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
  .line 197
    monitor-enter v0
  :L4
  .line 198
    invoke-virtual { v0, p0, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 199
    monitor-exit v0
  .line 200
    return-object v1
  :L5
  .line 199
    move-exception p0
    monitor-exit v0
  :L6
    throw p0
  :L7
  .line 195
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
  .line 126
    new-instance v0, Ljava/io/BufferedReader;
    new-instance v1, Ljava/io/FileReader;
    invoke-direct { v1, p0 }, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    invoke-direct { v0, v1 }, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
  :L0
  .line 129
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object p0
    if-eqz p0, :L3
  .line 130
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 131
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
  .line 132
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->canon(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 133
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L2
    invoke-interface { p1, p0 }, Ljava/util/Set;->add(Ljava/lang/Object;)Z
  :L2
  .line 134
    goto :L0
  :L3
  .line 136
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->close()V
  .line 137
    nop
  .line 138
    return-void
  :L4
  .line 136
    move-exception p0
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->close()V
  .line 137
    goto :L6
  :L5
    throw p0
  :L6
    goto :L5
.end method

.method public static rowName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
  .registers 3
  .line 231
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
  .line 232
    if-eqz p0, :L4
    const-string v0, "; "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v0
    if-ltz v0, :L4
    instance-of v0, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L1
    goto :L4
  :L1
  .line 233
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p1
  .line 234
    instance-of v0, p1, Lcom/innioasis/music/ArtistsActivity;
    if-nez v0, :L3
    instance-of p1, p1, Lcom/innioasis/music/GenresActivity;
    if-eqz p1, :L2
    goto :L3
  :L2
  .line 235
    return-object p0
  :L3
  .line 234
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L4
  .line 232
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
  .line 110
    invoke-virtual { p0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object v0
  .line 111
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L0
    invoke-virtual { v0 }, Ljava/io/File;->mkdirs()Z
  :L0
  .line 112
    new-instance v0, Ljava/io/BufferedWriter;
    new-instance v1, Ljava/io/FileWriter;
    invoke-direct { v1, p0 }, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    invoke-direct { v0, v1 }, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
  :L1
  .line 114
    const-string p0, "# better-Y - artist names NOT to split on a comma (one per line).\n"
    invoke-virtual { v0, p0 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  .line 115
    const-string p0, "# Reboot the player after editing.\n"
    invoke-virtual { v0, p0 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  .line 116
    const/4 p0, 0
  :L2
    sget-object v1, Lcom/innioasis/ipp/Artists;->DEFAULTS:[Ljava/lang/String;
    array-length v2, v1
    if-ge p0, v2, :L4
  .line 117
    aget-object v1, v1, p0
    invoke-virtual { v0, v1 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  .line 118
    const-string v1, "\n"
    invoke-virtual { v0, v1 }, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
  :L3
  .line 116
    add-int/lit8 p0, p0, 1
    goto :L2
  :L4
  .line 121
    invoke-virtual { v0 }, Ljava/io/BufferedWriter;->close()V
  .line 122
    nop
  .line 123
    return-void
  :L5
  .line 121
    move-exception p0
    invoke-virtual { v0 }, Ljava/io/BufferedWriter;->close()V
  .line 122
    goto :L7
  :L6
    throw p0
  :L7
    goto :L6
.end method

.method public static songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 9
  .line 526
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtists;->songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L0
  .line 527
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 528
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 529
    if-nez v0, :L2
    return-object v1
  :L2
  .line 530
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 531
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 532
    nop
  .line 533
    const/4 v3, 0
    const/4 v4, 0
  :L3
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v3, v5, :L5
  .line 534
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 535
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6, p0 }, Lcom/innioasis/ipp/Artists;->inParts(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v6
  .line 536
    if-eqz v6, :L4
  .line 537
    invoke-virtual { v2, v5 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 538
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v5, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L4
    const/4 v4, 1
  :L4
  .line 533
    add-int/lit8 v3, v3, 1
    goto :L3
  :L5
  .line 541
    if-nez v4, :L6
    return-object v1
  :L6
  .line 542
    new-instance p0, Lcom/innioasis/ipp/Artists$SongCmp;
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Artists$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { v2, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 543
    return-object v2
.end method

.method public static songsInGenre(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .registers 10
  .line 314
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 316
    invoke-static { p1 }, Lcom/innioasis/ipp/GenreSplit;->composite(Lcom/innioasis/music/data/Genre;)Z
    move-result v1
  .line 317
    invoke-static { }, Lcom/innioasis/ipp/Artists;->splitEnabled()Z
    move-result v2
    if-nez v2, :L1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 318
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v2
  .line 319
    if-nez v2, :L2
    return-object v0
  :L2
  .line 320
    invoke-virtual { v2, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByGenreSync(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object p1
  .line 321
    if-nez p1, :L3
    return-object v0
  :L3
  .line 322
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 323
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 324
    nop
  .line 325
    const/4 v4, 0
    const/4 v5, 0
  :L4
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v4, v6, :L7
  .line 326
    invoke-interface { p1, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 327
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7, p0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v7
    if-nez v7, :L5
    goto :L6
  :L5
  .line 328
    invoke-virtual { v3, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 329
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Artists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L6
    const/4 v5, 1
  :L6
  .line 325
    add-int/lit8 v4, v4, 1
    goto :L4
  :L7
  .line 331
    if-nez v5, :L8
    if-nez v1, :L8
    return-object v0
  :L8
  .line 332
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 334
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result p1
    if-eqz p1, :L11
  .line 335
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result p0
    if-eqz p0, :L9
  .line 336
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L10
  :L9
  .line 337
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L10
    goto :L14
  :L11
  .line 339
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result p0
    if-eqz p0, :L12
  .line 340
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L13
  :L12
  .line 341
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L13
    nop
  :L14
  .line 343
    new-instance p1, Lcom/innioasis/ipp/Artists$SongCmp;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Artists$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { v3, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 344
    return-object v3
.end method

.method private static split(Ljava/lang/String;)Ljava/util/ArrayList;
  .registers 6
  .line 206
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 207
    const-string v1, "; "
    invoke-virtual { p0, v1 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v2
    if-ltz v2, :L3
  .line 208
    invoke-virtual { p0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 209
    const/4 v2, 0
  :L0
    array-length v3, v1
    if-ge v2, v3, :L2
  .line 210
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
  .line 211
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L1
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 209
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 213
    goto :L4
  :L3
  .line 214
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Artists;->commaSplit(Ljava/util/List;Ljava/lang/String;)V
  :L4
  .line 216
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L5
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 217
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

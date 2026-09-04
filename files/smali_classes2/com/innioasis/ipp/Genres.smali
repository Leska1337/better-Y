.class public final Lcom/innioasis/ipp/Genres;
.super Ljava/lang/Object;
.source "Genres.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Genres$NameCmp;,
    Lcom/innioasis/ipp/Genres$YearCmp;,
    Lcom/innioasis/ipp/Genres$Warm;,
    Lcom/innioasis/ipp/Genres$NamePick;,
    Lcom/innioasis/ipp/Genres$SongPick;,
    Lcom/innioasis/ipp/Genres$Resort;,
    Lcom/innioasis/ipp/Genres$SongCmp;,
    Lcom/innioasis/ipp/Genres$KeyCmp;,
    Lcom/innioasis/ipp/Genres$Late;,
    Lcom/innioasis/ipp/Genres$Apply;
  }
.end annotation

.field public final static A_LETTER:I = 1

.field public final static A_NONE:I = 0

.field public final static A_YEAR:I = 2

.field private final static A_Z:I = 0

.field private final static DONE:I = -2

.field private final static EXTRA:Ljava/lang/String; = "ipp_open_genre_songs"

.field private final static KEY_CMP:Ljava/util/Comparator;

.field private final static K_ALBUM:Ljava/lang/String; = "genre_album_sort"

.field private final static K_ARTIST:Ljava/lang/String; = "genre_artist_sort"

.field private final static K_FLAT:Ljava/lang/String; = "genre_flat_sort"

.field private final static K_GENRE:Ljava/lang/String; = "genre_sort"

.field private final static K_SONG:Ljava/lang/String; = "genre_song_sort"

.field private final static L_ALBUMS:I = 2

.field private final static L_ARTISTS:I = 1

.field private final static L_GENRES:I = 0

.field private final static L_NONE:I = -1

.field private final static L_SONGS:I = 3

.field private final static NONE:I = -1

.field private final static OPEN:I = -1

.field private final static S_ALBUM:I = 7

.field private final static S_FILE_AZ:I = 2

.field private final static S_FILE_ZA:I = 3

.field private final static S_NAME_AZ:I = 0

.field private final static S_NAME_ZA:I = 1

.field private final static S_TIME_ASC:I = 4

.field private final static S_TIME_DESC:I = 5

.field private final static S_TRACK:I = 6

.field private final static YEAR_ASC:I = 2

.field private final static YEAR_DESC:I = 3

.field private final static Z_A:I = 1

.field private static closeOnBack:Z

.field private static listAlbum:Lcom/innioasis/music/data/Album;

.field private static listFlat:Z

.field private static listGenre:Lcom/innioasis/music/data/Genre;

.field private static openAlbum:Lcom/innioasis/music/data/Album;

.field private static openFocus:Ljava/lang/String;

.field private static openGenre:Lcom/innioasis/music/data/Genre;

.field private static parent:Lcom/innioasis/music/util/SubMenuDialog;

.method static constructor <clinit>()V
  .registers 2
  .line 591
    new-instance v0, Lcom/innioasis/ipp/Genres$KeyCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Genres$KeyCmp;-><init>(Lcom/innioasis/ipp/Genres$1;)V
    sput-object v0, Lcom/innioasis/ipp/Genres;->KEY_CMP:Ljava/util/Comparator;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 60
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100(Lcom/innioasis/music/GenresActivity;II)V
  .registers 3
  .line 58
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Genres;->applyName(Lcom/innioasis/music/GenresActivity;II)V
    return-void
.end method

.method static synthetic access$1000(Ljava/lang/Object;)Ljava/lang/String;
  .registers 1
  .line 58
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->nameOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$1100(JJ)I
  .registers 4
  .line 58
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Genres;->cmpLong(JJ)I
    move-result p0
    return p0
.end method

.method static synthetic access$1200(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 58
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->cmpStr(Ljava/lang/String;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method static synthetic access$200()Lcom/innioasis/music/util/SubMenuDialog;
  .registers 1
  .line 58
    sget-object v0, Lcom/innioasis/ipp/Genres;->parent:Lcom/innioasis/music/util/SubMenuDialog;
    return-object v0
.end method

.method static synthetic access$300(Lcom/innioasis/music/GenresActivity;I)V
  .registers 2
  .line 58
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->applySong(Lcom/innioasis/music/GenresActivity;I)V
    return-void
.end method

.method static synthetic access$400()I
  .registers 1
  .line 58
    invoke-static { }, Lcom/innioasis/ipp/Genres;->songSort()I
    move-result v0
    return v0
.end method

.method static synthetic access$500(Ljava/util/List;I)Ljava/util/List;
  .registers 2
  .line 58
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->sortSongs(Ljava/util/List;I)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$600(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 1
  .line 58
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$700(Ljava/lang/Object;)I
  .registers 1
  .line 58
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result p0
    return p0
.end method

.method static synthetic access$800(Lcom/innioasis/music/GenresActivity;)Landroid/widget/ListView;
  .registers 1
  .line 58
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->lv(Lcom/innioasis/music/GenresActivity;)Landroid/widget/ListView;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$900(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 2
  .line 58
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->land(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
    return-void
.end method

.method public static albumCount(Lcom/innioasis/music/data/Genre;)I
  .catchall { :L0 .. :L9 } :L10
  .registers 7
  .line 573
    const/4 v0, 0
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p0
  :L1
  .line 574
    if-nez p0, :L2
    return v0
  :L2
  .line 575
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 576
    if-nez v1, :L3
    return v0
  :L3
  .line 577
    new-instance v2, Ljava/util/LinkedHashSet;
    invoke-direct { v2 }, Ljava/util/LinkedHashSet;-><init>()V
  .line 578
    const/4 v3, 0
  :L4
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L8
  .line 579
    invoke-interface { v1, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 580
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L5
    goto :L7
  :L5
  .line 581
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 582
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5, p0 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :L6
    goto :L7
  :L6
  .line 583
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v5, v4 }, Lcom/innioasis/ipp/Albums;->albumKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  :L7
  .line 578
    add-int/lit8 v3, v3, 1
    goto :L4
  :L8
  .line 585
    invoke-virtual { v2 }, Ljava/util/LinkedHashSet;->size()I
    move-result p0
  :L9
    return p0
  :L10
  .line 586
    move-exception p0
  .line 587
    return v0
.end method

.method public static albumList(Ljava/util/List;Lcom/innioasis/music/data/Genre;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 2
  .line 520
    if-nez p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
  :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->split(Ljava/util/List;Ljava/lang/String;)V
  :L2
  .line 523
    goto :L4
  :L3
  .line 521
    move-exception p1
  :L4
  .line 524
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;)V
  .line 525
    return-void
.end method

.method public static albums(Ljava/util/List;)V
  .registers 2
  .line 599
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;Lcom/innioasis/music/GenresActivity;)V
  .line 600
    return-void
.end method

.method public static albums(Ljava/util/List;Lcom/innioasis/music/GenresActivity;)V
  .catchall { :L0 .. :L10 } :L12
  .registers 8
  .line 611
    if-eqz p0, :L14
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L14
  :L1
  .line 612
    const-string v0, "genre_album_sort"
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result v0
  .line 613
    const/4 v2, -1
    if-ne v0, v2, :L2
    return-void
  :L2
  .line 614
    const/4 v2, 0
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Genres;->isMarker(Ljava/lang/Object;)Z
    move-result v3
    const/4 v4, 1
    if-eqz v3, :L3
    const/4 v3, 1
    goto :L4
  :L3
    const/4 v3, 0
  :L4
  .line 615
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    sub-int/2addr v5, v3
    if-ge v5, v1, :L5
    return-void
  :L5
  .line 616
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    invoke-interface { p0, v3, v5 }, Ljava/util/List;->subList(II)Ljava/util/List;
    move-result-object p0
  .line 617
    const/4 v3, 3
    if-eq v0, v1, :L8
    if-ne v0, v3, :L6
    goto :L8
  :L6
  .line 622
    new-instance p1, Lcom/innioasis/ipp/Genres$NameCmp;
    if-ne v0, v4, :L7
    const/4 v2, 1
  :L7
    invoke-direct { p1, v2 }, Lcom/innioasis/ipp/Genres$NameCmp;-><init>(Z)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    goto :L11
  :L8
  .line 618
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->warmYears(Ljava/util/List;)Z
    move-result v1
  .line 619
    new-instance v5, Lcom/innioasis/ipp/Genres$YearCmp;
    if-ne v0, v3, :L9
    const/4 v2, 1
  :L9
    invoke-direct { v5, v2 }, Lcom/innioasis/ipp/Genres$YearCmp;-><init>(Z)V
    invoke-static { p0, v5 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 620
    if-eqz v1, :L10
    if-eqz p1, :L10
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Genres$Warm;
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->names(Ljava/util/List;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-direct { v1, p1, p0 }, Lcom/innioasis/ipp/Genres$Warm;-><init>(Lcom/innioasis/music/GenresActivity;Ljava/util/ArrayList;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  :L10
  .line 621
    nop
  :L11
  .line 626
    goto :L13
  :L12
  .line 624
    move-exception p0
  :L13
  .line 627
    return-void
  :L14
  .line 611
    return-void
.end method

.method private static albumsAdapter(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  :L0
  .line 379
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter3_1()Lcom/innioasis/music/adapter/AlbumListAdapter;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 380
    move-exception p0
  .line 381
    const/4 p0, 0
    return-object p0
.end method

.method public static alphaKind(Ljava/lang/Object;)I
  .registers 6
  .line 434
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result p0
  .line 441
    const/4 v0, -1
    const/4 v1, 0
    const/4 v2, 1
    if-eqz p0, :L9
    if-ne p0, v2, :L0
    goto :L9
  :L0
  .line 445
    const/4 v3, 3
    const/4 v4, 2
    if-ne p0, v4, :L5
  .line 446
    const-string p0, "genre_album_sort"
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result p0
  .line 447
    if-eq p0, v0, :L4
    if-eqz p0, :L4
    if-ne p0, v2, :L1
    goto :L4
  :L1
  .line 448
    if-eq p0, v4, :L3
    if-ne p0, v3, :L2
    goto :L3
  :L2
  .line 449
    return v1
  :L3
  .line 448
    return v4
  :L4
  .line 447
    return v2
  :L5
  .line 451
    if-ne p0, v3, :L8
  .line 452
    invoke-static { }, Lcom/innioasis/ipp/Genres;->songSort()I
    move-result p0
  .line 457
    if-eqz p0, :L6
    if-ne p0, v2, :L7
  :L6
    const/4 v1, 1
  :L7
    return v1
  :L8
  .line 459
    return v1
  :L9
  .line 442
    if-nez p0, :L10
    const-string p0, "genre_sort"
    goto :L11
  :L10
    const-string p0, "genre_artist_sort"
  :L11
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result p0
  .line 443
    if-eq p0, v0, :L12
    if-eqz p0, :L12
    if-ne p0, v2, :L13
  :L12
    const/4 v1, 1
  :L13
    return v1
.end method

.method private static applyName(Lcom/innioasis/music/GenresActivity;II)V
  .catchall { :L0 .. :L9 } :L11
  .registers 7
  :L0
  .line 798
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 799
    if-eqz v0, :L10
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result v1
    if-eq v1, p1, :L1
    goto :L10
  :L1
  .line 800
    const/4 v1, 1
    if-nez p1, :L2
    const-string v2, "genre_sort"
    goto :L4
  :L2
    if-ne p1, v1, :L3
    const-string v2, "genre_artist_sort"
    goto :L4
  :L3
    const-string v2, "genre_album_sort"
  :L4
    invoke-static { v2, p2 }, Lcom/innioasis/ipp/Genres;->setSort(Ljava/lang/String;I)V
  .line 802
    const/4 v2, 2
    if-ne p1, v2, :L6
    if-eq p2, v2, :L5
    const/4 v3, 3
    if-ne p2, v3, :L6
  :L5
  .line 806
    new-instance p1, Ljava/lang/Thread;
    new-instance p2, Lcom/innioasis/ipp/Genres$Resort;
    invoke-direct { p2, p0, v0, v1 }, Lcom/innioasis/ipp/Genres$Resort;-><init>(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Z)V
    invoke-direct { p1, p2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  .line 807
    return-void
  :L6
  .line 809
    if-ne p1, v2, :L7
    goto :L8
  :L7
    const/4 v1, 0
  :L8
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Genres;->resortNow(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Z)V
  :L9
  .line 812
    goto :L12
  :L10
  .line 799
    return-void
  :L11
  .line 810
    move-exception p0
  :L12
  .line 813
    return-void
.end method

.method private static applySong(Lcom/innioasis/music/GenresActivity;I)V
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  :L0
  .line 817
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 818
    if-eqz v0, :L5
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result v1
    const/4 v2, 3
    if-eq v1, v2, :L1
    goto :L5
  :L1
  .line 819
    invoke-static { }, Lcom/innioasis/ipp/Genres;->flat()Z
    move-result v1
    if-eqz v1, :L2
    const-string v1, "genre_flat_sort"
    goto :L3
  :L2
    const-string v1, "genre_song_sort"
  :L3
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Genres;->setSort(Ljava/lang/String;I)V
  .line 820
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->rowFlags(Lcom/innioasis/music/GenresActivity;I)V
  .line 823
    new-instance p1, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Genres$Resort;
    const/4 v2, 0
    invoke-direct { v1, p0, v0, v2 }, Lcom/innioasis/ipp/Genres$Resort;-><init>(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Z)V
    invoke-direct { p1, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  :L4
  .line 826
    goto :L7
  :L5
  .line 818
    return-void
  :L6
  .line 824
    move-exception p0
  :L7
  .line 827
    return-void
.end method

.method public static artists(Ljava/util/List;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 484
    if-eqz p0, :L8
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 3
    if-ge v0, v1, :L1
    goto :L8
  :L1
  .line 485
    const-string v0, "genre_artist_sort"
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result v0
  .line 486
    const/4 v1, -1
    if-ne v0, v1, :L2
    return-void
  :L2
  .line 487
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 1
    invoke-interface { p0, v2, v1 }, Ljava/util/List;->subList(II)Ljava/util/List;
    move-result-object p0
    new-instance v1, Lcom/innioasis/ipp/Genres$NameCmp;
    if-ne v0, v2, :L3
    goto :L4
  :L3
    const/4 v2, 0
  :L4
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Genres$NameCmp;-><init>(Z)V
    invoke-static { p0, v1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L5
  .line 490
    goto :L7
  :L6
  .line 488
    move-exception p0
  :L7
  .line 491
    return-void
  :L8
  .line 484
    return-void
.end method

.method public static backClose()Z
  .registers 2
  .line 186
    sget-boolean v0, Lcom/innioasis/ipp/Genres;->closeOnBack:Z
  .line 187
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Genres;->closeOnBack:Z
  .line 188
    return v0
.end method

.method private static cmpLong(JJ)I
  .registers 5
  .line 1071
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
  .registers 4
  .line 1066
    const-string v0, ""
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  :L1
  .line 1067
    if-nez p1, :L2
    goto :L3
  :L2
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  :L3
  .line 1068
    invoke-virtual { p0, v0 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method private static deleteLabel(I)I
  .registers 2
  .line 296
    if-nez p0, :L0
    const p0, 2131821094
    return p0
  :L0
  .line 297
    const/4 v0, 1
    if-ne p0, v0, :L1
    const p0, 2131820589
    return p0
  :L1
  .line 298
    const/4 v0, 2
    if-ne p0, v0, :L2
    const p0, 2131820582
    return p0
  :L2
  .line 299
    const p0, 2131820841
    return p0
.end method

.method private static flags(Ljava/lang/Object;I)V
  .registers 6
  .line 718
    instance-of v0, p0, Lcom/innioasis/music/adapter/SongListAdapter;
    if-nez v0, :L0
    return-void
  :L0
  .line 719
    check-cast p0, Lcom/innioasis/music/adapter/SongListAdapter;
  .line 720
    const/4 v0, 7
    const/4 v1, 0
    const/4 v2, 1
    if-ne p1, v0, :L1
    invoke-static { }, Lcom/innioasis/ipp/Genres;->flat()Z
    move-result v3
    if-eqz v3, :L1
    const/4 v3, 1
    goto :L2
  :L1
    const/4 v3, 0
  :L2
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/SongListAdapter;->setCanShowAlbum(Z)V
  .line 721
    const/4 v3, 4
    if-eq p1, v3, :L4
    const/4 v3, 5
    if-ne p1, v3, :L3
    goto :L4
  :L3
    const/4 v3, 0
    goto :L5
  :L4
    const/4 v3, 1
  :L5
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/SongListAdapter;->setCanShowTime(Z)V
  .line 722
    const/4 v3, -1
    if-eq p1, v3, :L6
    if-eqz p1, :L6
    if-eq p1, v2, :L6
    if-eq p1, v0, :L6
    const/4 v0, 6
    if-ne p1, v0, :L7
  :L6
    const/4 v1, 1
  :L7
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/SongListAdapter;->setCanShowSongName(Z)V
  .line 724
    return-void
.end method

.method public static flat()Z
  .registers 1
  .line 105
    sget-boolean v0, Lcom/innioasis/ipp/Genres;->listFlat:Z
    return v0
.end method

.method public static genres(Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 467
    if-eqz p0, :L7
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L7
  :L1
  .line 468
    const-string v0, "genre_sort"
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result v0
  .line 469
    const/4 v1, -1
    if-ne v0, v1, :L2
    return-object p0
  :L2
  .line 470
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 471
    new-instance v2, Lcom/innioasis/ipp/Genres$NameCmp;
    const/4 v3, 1
    if-ne v0, v3, :L3
    goto :L4
  :L3
    const/4 v3, 0
  :L4
    invoke-direct { v2, v3 }, Lcom/innioasis/ipp/Genres$NameCmp;-><init>(Z)V
    invoke-static { v1, v2 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L5
  .line 472
    return-object v1
  :L6
  .line 473
    move-exception v0
  .line 474
    return-object p0
  :L7
  .line 467
    return-object p0
.end method

.method private static indexOf(Ljava/util/List;Ljava/lang/String;)I
  .registers 6
  .line 172
    const/4 v0, -1
    if-nez p1, :L0
    return v0
  :L0
  .line 173
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 174
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 175
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v3, :L2
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
    return v1
  :L2
  .line 173
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 177
    return v0
.end method

.method private static isMarker(Ljava/lang/Object;)Z
  .registers 2
  .line 921
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->nameOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
  .line 922
    if-eqz p0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L1
  :L0
    const/4 p0, 1
    goto :L2
  :L1
    const/4 p0, 0
  :L2
    return p0
.end method

.method private static land(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 3
  .line 901
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v0
  .line 902
    if-eqz v0, :L0
    invoke-interface { v0 }, Ljava/util/List;->clear()V
  :L0
  .line 903
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 904
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->lv(Lcom/innioasis/music/GenresActivity;)Landroid/widget/ListView;
    move-result-object p0
  .line 905
    if-eqz p0, :L1
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->setSelection(I)V
  :L1
  .line 906
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Mark;->afterFill(Ljava/lang/Object;Landroid/widget/ListView;)V
  .line 907
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 908
    return-void
.end method

.method public static levelFor(Ljava/lang/String;)Z
  .registers 2
  .line 114
    sget-object v0, Lcom/innioasis/ipp/Genres;->listAlbum:Lcom/innioasis/music/data/Album;
  .line 115
    if-eqz v0, :L0
    if-eqz p0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Mark;->title(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static levelOf(Ljava/lang/Object;)I
  .registers 2
  .line 218
    instance-of v0, p0, Lcom/innioasis/music/adapter/GenreListAdapter;
    if-eqz v0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 219
    instance-of v0, p0, Lcom/innioasis/music/adapter/MainAdapter;
    if-eqz v0, :L1
    const/4 p0, 1
    return p0
  :L1
  .line 220
    instance-of v0, p0, Lcom/innioasis/music/adapter/AlbumListAdapter;
    if-eqz v0, :L2
    const/4 p0, 2
    return p0
  :L2
  .line 221
    instance-of p0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz p0, :L3
    const/4 p0, 3
    return p0
  :L3
  .line 222
    const/4 p0, -1
    return p0
.end method

.method private static live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 3
  .line 234
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->lv(Lcom/innioasis/music/GenresActivity;)Landroid/widget/ListView;
    move-result-object p0
  .line 235
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object p0
  :L1
  .line 236
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v1, :L2
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  :L2
    return-object v0
.end method

.method private static lv(Lcom/innioasis/music/GenresActivity;)Landroid/widget/ListView;
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  :L0
  .line 227
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityGenresBinding;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityGenresBinding;->lv:Landroid/widget/ListView;
  :L1
    return-object p0
  :L2
  .line 228
    move-exception p0
  .line 229
    const/4 p0, 0
    return-object p0
.end method

.method public static menu(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/util/SubMenuDialog;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 9
  .line 250
    sput-object p1, Lcom/innioasis/ipp/Genres;->parent:Lcom/innioasis/music/util/SubMenuDialog;
  .line 252
    if-eqz p0, :L12
    if-nez p1, :L0
    goto/16 :L12
  :L0
  .line 253
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 254
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result v1
  .line 255
    const/4 v2, -1
    if-ne v1, v2, :L1
    return-void
  :L1
  .line 257
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 258
    const/4 v3, 3
    const v4, 2131821047
    const v5, 2131820584
    const v6, 2131820844
    if-ne v1, v3, :L7
  .line 259
    invoke-static { }, Lcom/innioasis/ipp/Genres;->flat()Z
    move-result v1
  .line 260
    const v3, 2131820964
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 261
    const v3, 2131820963
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 264
    if-eqz v1, :L2
    const v3, 2131820962
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L3
  :L2
  .line 265
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->trackSortEnabled()Z
    move-result v3
    if-eqz v3, :L3
    const v3, 2131821024
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 266
    invoke-virtual { p0, v6 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 267
    invoke-virtual { p0, v5 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 268
    const v3, 2131820841
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 269
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 273
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->canOpen(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result v0
    if-eqz v0, :L4
    const v0, 2131821105
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 276
    if-eqz v1, :L5
    const v0, 2131821071
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L5
  .line 277
    const v0, 2131821060
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 278
    goto :L8
  :L7
  .line 279
    const v3, 2131820961
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 280
    invoke-virtual { p0, v6 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 281
    invoke-virtual { p0, v5 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 282
    invoke-static { v1 }, Lcom/innioasis/ipp/Genres;->deleteLabel(I)I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 283
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 284
    const/4 v3, 2
    if-ne v1, v3, :L8
    invoke-static { v0 }, Lcom/innioasis/ipp/Art;->albumKey(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Art;->hasPick(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L8
  .line 285
    const v0, 2131821062
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L8
  .line 288
    invoke-virtual { p1, v2 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 289
    invoke-virtual { p1 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  :L9
  .line 292
    goto :L11
  :L10
  .line 290
    move-exception p0
  :L11
  .line 293
    return-void
  :L12
  .line 252
    return-void
.end method

.method private static nameOf(Ljava/lang/Object;)Ljava/lang/String;
  .registers 2
  .line 914
    instance-of v0, p0, Ljava/lang/String;
    if-eqz v0, :L0
    check-cast p0, Ljava/lang/String;
    return-object p0
  :L0
  .line 915
    instance-of v0, p0, Lcom/innioasis/music/data/Album;
    if-eqz v0, :L1
    check-cast p0, Lcom/innioasis/music/data/Album;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 916
    instance-of v0, p0, Lcom/innioasis/music/data/Genre;
    if-eqz v0, :L2
    check-cast p0, Lcom/innioasis/music/data/Genre;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 917
    const/4 p0, 0
    return-object p0
.end method

.method private static nameSortDialog(Lcom/innioasis/music/GenresActivity;I)V
  .registers 5
  .line 729
    const/4 v0, -1
    if-eq p1, v0, :L2
    const/4 v0, 3
    if-ne p1, v0, :L0
    goto :L2
  :L0
  .line 730
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 731
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 732
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 735
    const/4 v1, 2
    if-ne p1, v1, :L1
  .line 736
    const v1, 2131821028
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 737
    const v1, 2131821029
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 740
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Genres$NamePick;
    invoke-direct { v2, p0, p1 }, Lcom/innioasis/ipp/Genres$NamePick;-><init>(Lcom/innioasis/music/GenresActivity;I)V
    const p1, 2131886360
    invoke-direct { v1, p0, v0, v2, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 741
    return-void
  :L2
  .line 729
    return-void
.end method

.method private static names(Ljava/util/List;)Ljava/util/ArrayList;
  .registers 4
  .line 981
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 982
    const/4 v1, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 983
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Genres;->nameOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
  .line 984
    if-eqz v2, :L1
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 982
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 986
    return-object v0
.end method

.method public static noteFlat(Z)V
  .registers 1
  .line 101
    sput-boolean p0, Lcom/innioasis/ipp/Genres;->listFlat:Z
  .line 102
    return-void
.end method

.method public static noteList(Lcom/innioasis/music/data/Album;Lcom/innioasis/music/data/Genre;)V
  .registers 2
  .line 80
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 81
    sput-object p0, Lcom/innioasis/ipp/Genres;->listAlbum:Lcom/innioasis/music/data/Album;
  .line 82
    sput-object p1, Lcom/innioasis/ipp/Genres;->listGenre:Lcom/innioasis/music/data/Genre;
  .line 83
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p1
    if-nez p1, :L2
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L1
    goto :L2
  :L1
    const/4 p0, 0
    goto :L3
  :L2
    const/4 p0, 1
  :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->noteFlat(Z)V
  .line 84
    return-void
  :L4
  .line 80
    return-void
.end method

.method private static numbers(Lcom/innioasis/music/GenresActivity;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 2
  .line 662
    if-eqz p0, :L2
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Genres;->flat()Z
    move-result v0
    if-eqz v0, :L1
    goto :L2
  :L1
  .line 666
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->warmIfWanted()V
  .line 667
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter3_2()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v0
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Disc;->setGenreAdapters(Ljava/lang/Object;Ljava/lang/Object;)V
  .line 670
    goto :L5
  :L2
  .line 663
    const/4 p0, 0
    invoke-static { p0, p0 }, Lcom/innioasis/ipp/Disc;->setGenreAdapters(Ljava/lang/Object;Ljava/lang/Object;)V
  :L3
  .line 664
    return-void
  :L4
  .line 668
    move-exception p0
  :L5
  .line 671
    return-void
.end method

.method private static onMain()Z
  .registers 2
  .line 419
    invoke-static { }, Landroid/os/Looper;->myLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    if-ne v0, v1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method public static openRequest(Landroid/app/Activity;)V
  .catchall { :L0 .. :L5 } :L8
  .registers 8
  :L0
  .line 134
    instance-of v0, p0, Lcom/innioasis/music/GenresActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 135
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v0
  .line 136
    if-eqz v0, :L7
    const-string v1, "ipp_open_genre_songs"
    const/4 v2, 0
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0
    if-nez v0, :L2
    goto/16 :L7
  :L2
  .line 137
    sget-object v0, Lcom/innioasis/ipp/Genres;->openAlbum:Lcom/innioasis/music/data/Album;
  .line 138
    sget-object v1, Lcom/innioasis/ipp/Genres;->openGenre:Lcom/innioasis/music/data/Genre;
  .line 139
    sget-object v3, Lcom/innioasis/ipp/Genres;->openFocus:Ljava/lang/String;
  .line 140
    const/4 v4, 0
    sput-object v4, Lcom/innioasis/ipp/Genres;->openAlbum:Lcom/innioasis/music/data/Album;
  .line 141
    sput-object v4, Lcom/innioasis/ipp/Genres;->openGenre:Lcom/innioasis/music/data/Genre;
  .line 142
    sput-object v4, Lcom/innioasis/ipp/Genres;->openFocus:Ljava/lang/String;
  .line 143
    if-nez v0, :L3
    return-void
  :L3
  .line 145
    check-cast p0, Lcom/innioasis/music/GenresActivity;
  .line 146
    invoke-static { v1 }, Lcom/innioasis/ipp/Mark;->noteGenre(Lcom/innioasis/music/data/Genre;)V
  .line 147
    sget-object v4, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v4 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v4
  .line 148
    invoke-virtual { v4, v0, v2, v1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByAlbumSync(Lcom/innioasis/music/data/Album;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v1
  .line 149
    if-eqz v1, :L6
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-eqz v4, :L4
    goto :L6
  :L4
  .line 150
    invoke-static { v1 }, Lcom/innioasis/ipp/Genres;->songs(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
  .line 152
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/databinding/ActivityGenresBinding;
  .line 153
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->setSongList(Ljava/util/List;)V
  .line 154
    invoke-virtual { v0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Mark;->title(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/GenresActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 155
    iget-object v0, v4, Lcom/innioasis/y1/databinding/ActivityGenresBinding;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v5
    invoke-virtual { v0, v5 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->bind(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 156
    iget-object v0, v4, Lcom/innioasis/y1/databinding/ActivityGenresBinding;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    invoke-virtual { v0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->show()V
  .line 157
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v0
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/adapter/SongListAdapter2;->setItems(Ljava/util/List;)V
  .line 160
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v0
    iget-object v5, v4, Lcom/innioasis/y1/databinding/ActivityGenresBinding;->lv:Landroid/widget/ListView;
    invoke-static { v0, v1, v5 }, Lcom/innioasis/ipp/Disc;->preset(Ljava/lang/Object;Ljava/util/List;Landroid/widget/ListView;)V
  .line 161
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    iget-object v5, v4, Lcom/innioasis/y1/databinding/ActivityGenresBinding;->lv:Landroid/widget/ListView;
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v6
    invoke-virtual { v0, v5, v6, v2 }, Lcom/innioasis/music/util/Other;->gotoAdapter(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 162
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Genres;->closeOnBack:Z
  .line 164
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Genres;->indexOf(Ljava/util/List;Ljava/lang/String;)I
    move-result v0
  .line 165
    if-ltz v0, :L5
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object p0
    iget-object v1, v4, Lcom/innioasis/y1/databinding/ActivityGenresBinding;->lv:Landroid/widget/ListView;
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  :L5
  .line 168
    goto :L9
  :L6
  .line 149
    return-void
  :L7
  .line 136
    return-void
  :L8
  .line 166
    move-exception p0
  :L9
  .line 169
    return-void
.end method

.method public static pick(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)I
  .catchall { :L0 .. :L17 } :L20
  .registers 11
  .line 311
    const/4 v0, -2
    if-eqz p0, :L21
    if-nez p1, :L0
    goto/16 :L21
  :L0
  .line 312
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object v1
  .line 313
    if-nez v1, :L1
    return v0
  :L1
  .line 314
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v2
  .line 315
    invoke-static { v2 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result v3
  .line 317
    const v4, 2131821047
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L2
  .line 318
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->lv(Lcom/innioasis/music/GenresActivity;)Landroid/widget/ListView;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->addFromListView(Landroid/widget/ListView;)V
  .line 319
    return v0
  :L2
  .line 321
    const v4, 2131820961
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    const/4 v5, -1
    if-eqz v4, :L3
  .line 322
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Genres;->nameSortDialog(Lcom/innioasis/music/GenresActivity;I)V
  .line 323
    return v5
  :L3
  .line 325
    const v3, 2131820964
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    const/4 v4, 1
    const/4 v6, 0
    if-eqz v3, :L4
  .line 326
    invoke-static { p0, v6, v4, v6 }, Lcom/innioasis/ipp/Genres;->songDirDialog(Lcom/innioasis/music/GenresActivity;IIZ)V
  .line 327
    return v5
  :L4
  .line 329
    const v3, 2131820963
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    const/4 v7, 3
    const/4 v8, 2
    if-eqz v3, :L5
  .line 330
    invoke-static { p0, v8, v7, v4 }, Lcom/innioasis/ipp/Genres;->songDirDialog(Lcom/innioasis/music/GenresActivity;IIZ)V
  .line 331
    return v5
  :L5
  .line 333
    const v3, 2131821024
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L6
  .line 334
    const/4 p1, 6
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->applySong(Lcom/innioasis/music/GenresActivity;I)V
  .line 335
    return v0
  :L6
  .line 337
    const v3, 2131820962
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L7
  .line 338
    const/4 p1, 7
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->applySong(Lcom/innioasis/music/GenresActivity;I)V
  .line 339
    return v0
  :L7
  .line 341
    const v3, 2131821060
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L8
  .line 342
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->albumsAdapter(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/Art;->setThumb(Lcom/innioasis/music/adapter/MyBaseAdapter;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .line 343
    return v0
  :L8
  .line 345
    const v3, 2131821062
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L9
  .line 346
    invoke-static { v2 }, Lcom/innioasis/ipp/Art;->resetThumb(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .line 347
    return v0
  :L9
  .line 349
    const v3, 2131821071
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L10
  .line 350
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Albums;->openAlbumFrom(Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 351
    return v0
  :L10
  .line 353
    const v3, 2131821105
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L13
  .line 356
    sget-object p1, Lcom/innioasis/ipp/Genres;->parent:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-static { p0, p1, v2 }, Lcom/innioasis/ipp/Artists;->openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p0
    if-eqz p0, :L11
    goto :L12
  :L11
    const/4 v0, -1
  :L12
    return v0
  :L13
  .line 358
    const v2, 2131820844
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L14
    return v6
  :L14
  .line 359
    const v2, 2131820584
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L15
    return v4
  :L15
  .line 360
    const v2, 2131820841
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L19
  .line 361
    const v2, 2131820582
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L19
  .line 362
    const v2, 2131820589
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L19
  .line 363
    const v2, 2131821094
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L16
    goto :L19
  :L16
  .line 366
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
  :L17
    if-eqz p0, :L18
    const/4 v0, 3
  :L18
    return v0
  :L19
  .line 363
    return v8
  :L20
  .line 367
    move-exception p0
  .line 368
    return v0
  :L21
  .line 311
    return v0
.end method

.method private static resortNow(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Z)V
  .registers 8
  .line 831
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v0
  .line 832
    if-eqz p2, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;)V
    goto :L7
  :L0
  .line 834
    invoke-static { p1 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result p2
    if-nez p2, :L1
    const-string p2, "genre_sort"
    goto :L2
  :L1
    const-string p2, "genre_artist_sort"
  :L2
    invoke-static { p2 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result p2
  .line 835
    const/4 v1, -1
    if-ne p2, v1, :L3
    return-void
  :L3
  .line 836
    invoke-static { p1 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result v1
    const/4 v2, 0
    const/4 v3, 1
    if-ne v1, v3, :L4
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-le v1, v3, :L4
    const/4 v1, 1
    goto :L5
  :L4
    const/4 v1, 0
  :L5
  .line 837
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    invoke-interface { v0, v1, v4 }, Ljava/util/List;->subList(II)Ljava/util/List;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/Genres$NameCmp;
    if-ne p2, v3, :L6
    const/4 v2, 1
  :L6
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Genres$NameCmp;-><init>(Z)V
    invoke-static { v0, v1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L7
  .line 839
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->land(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 840
    return-void
.end method

.method public static restore(Landroid/content/Intent;Ljava/lang/String;)V
  .registers 4
  .line 120
    if-eqz p0, :L1
    sget-object v0, Lcom/innioasis/ipp/Genres;->listAlbum:Lcom/innioasis/music/data/Album;
    if-nez v0, :L0
    goto :L1
  :L0
  .line 121
    const-string v0, "ipp_open_genre_songs"
    const/4 v1, 1
    invoke-virtual { p0, v0, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 122
    sget-object p0, Lcom/innioasis/ipp/Genres;->listAlbum:Lcom/innioasis/music/data/Album;
    sput-object p0, Lcom/innioasis/ipp/Genres;->openAlbum:Lcom/innioasis/music/data/Album;
  .line 123
    sget-object p0, Lcom/innioasis/ipp/Genres;->listGenre:Lcom/innioasis/music/data/Genre;
    sput-object p0, Lcom/innioasis/ipp/Genres;->openGenre:Lcom/innioasis/music/data/Genre;
  .line 124
    sput-object p1, Lcom/innioasis/ipp/Genres;->openFocus:Ljava/lang/String;
  .line 125
    return-void
  :L1
  .line 120
    return-void
.end method

.method private static rowFlags(Lcom/innioasis/music/GenresActivity;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 709
    if-nez p0, :L0
    return-void
  :L0
  .line 710
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter3_2()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v0
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Genres;->flags(Ljava/lang/Object;I)V
  .line 711
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->flags(Ljava/lang/Object;I)V
  :L1
  .line 714
    goto :L3
  :L2
  .line 712
    move-exception p0
  :L3
  .line 715
    return-void
.end method

.method private static setSort(Ljava/lang/String;I)V
  .registers 3
  .line 414
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 415
    if-eqz v0, :L0
    invoke-static { v0, p0, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L0
  .line 416
    return-void
.end method

.method private static songDirDialog(Lcom/innioasis/music/GenresActivity;IIZ)V
  .registers 6
  .line 744
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 745
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 746
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 748
    if-eqz p3, :L0
  .line 749
    const p3, 2131820969
    invoke-virtual { p0, p3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { v0, p3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 750
    const p3, 2131820970
    invoke-virtual { p0, p3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { v0, p3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L0
  .line 752
    new-instance p3, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v1, Lcom/innioasis/ipp/Genres$SongPick;
    invoke-direct { v1, p0, p1, p2 }, Lcom/innioasis/ipp/Genres$SongPick;-><init>(Lcom/innioasis/music/GenresActivity;II)V
    const p1, 2131886360
    invoke-direct { p3, p0, v0, v1, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { p3 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 753
    return-void
.end method

.method private static songSort()I
  .registers 1
  .line 693
    invoke-static { }, Lcom/innioasis/ipp/Genres;->flat()Z
    move-result v0
    if-eqz v0, :L0
    const-string v0, "genre_flat_sort"
    goto :L1
  :L0
    const-string v0, "genre_song_sort"
  :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result v0
    return v0
.end method

.method public static songs(Lcom/innioasis/music/GenresActivity;Ljava/util/List;)Ljava/util/List;
  .registers 3
  .line 636
    invoke-static { }, Lcom/innioasis/ipp/Genres;->songSort()I
    move-result v0
  .line 637
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Genres;->rowFlags(Lcom/innioasis/music/GenresActivity;I)V
  .line 638
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->numbers(Lcom/innioasis/music/GenresActivity;)V
  .line 639
    invoke-static { p1 }, Lcom/innioasis/ipp/Genres;->songs(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method public static songs(Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L6
  .registers 3
  .line 675
    if-eqz p0, :L7
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L7
  :L1
  .line 676
    invoke-static { }, Lcom/innioasis/ipp/Genres;->songSort()I
    move-result v0
  .line 677
    const/4 v1, -1
    if-ne v0, v1, :L2
    move-object v0, p0
    goto :L3
  :L2
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Genres;->sortSongs(Ljava/util/List;I)Ljava/util/List;
    move-result-object v0
  :L3
  .line 685
    invoke-static { }, Lcom/innioasis/ipp/Genres;->flat()Z
    move-result v1
    if-eqz v1, :L4
    goto :L5
  :L4
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->byDisc(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
  :L5
    return-object v0
  :L6
  .line 686
    move-exception v0
  .line 687
    return-object p0
  :L7
  .line 675
    return-object p0
.end method

.method private static sortOf(Ljava/lang/String;)I
  .registers 3
  .line 409
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 410
    const/4 v1, -1
    if-nez v0, :L0
    goto :L1
  :L0
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
  :L1
    return v1
.end method

.method private static sortSongs(Ljava/util/List;I)Ljava/util/List;
  .registers 3
  .line 1030
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1031
    const/4 p0, 6
    if-ne p1, p0, :L3
  .line 1032
    new-instance p0, Lcom/innioasis/ipp/Genres$SongCmp;
    const/4 p1, 2
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Genres$SongCmp;-><init>(I)V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1033
    invoke-static { }, Lcom/innioasis/ipp/Genres;->onMain()Z
    move-result p0
    if-eqz p0, :L0
  .line 1038
    new-instance p0, Lcom/innioasis/ipp/TrackComparator;
    invoke-direct { p0 }, Lcom/innioasis/ipp/TrackComparator;-><init>()V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1039
    return-object v0
  :L0
  .line 1041
    invoke-static { v0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
  .line 1042
    if-nez p0, :L1
    goto :L2
  :L1
    move-object v0, p0
  :L2
    return-object v0
  :L3
  .line 1044
    new-instance p0, Lcom/innioasis/ipp/Genres$SongCmp;
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Genres$SongCmp;-><init>(I)V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1045
    return-object v0
.end method

.method private static split(Ljava/util/List;Ljava/lang/String;)V
  .registers 10
  .line 528
    if-eqz p0, :L25
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L25
    if-nez p1, :L0
    goto/16 :L25
  :L0
  .line 529
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 530
    if-eqz v0, :L24
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto/16 :L24
  :L1
  .line 533
    new-instance v1, Ljava/util/LinkedHashMap;
    invoke-direct { v1 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 534
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    const/4 v5, 0
    if-ge v3, v4, :L11
  .line 535
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 536
    instance-of v6, v4, Lcom/innioasis/y1/database/Song;
    if-nez v6, :L3
    goto :L10
  :L3
  .line 537
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 541
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6, p1 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :L4
    goto :L10
  :L4
  .line 542
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v6
    if-nez v6, :L5
    const-string v6, ""
    goto :L6
  :L5
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v6
  :L6
  .line 543
    invoke-virtual { v1, v6 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
  .line 544
    if-nez v7, :L7
    goto :L8
  :L7
    move-object v5, v7
    check-cast v5, Ljava/util/LinkedHashSet;
  :L8
  .line 545
    if-nez v5, :L9
    new-instance v5, Ljava/util/LinkedHashSet;
    invoke-direct { v5 }, Ljava/util/LinkedHashSet;-><init>()V
    invoke-virtual { v1, v6, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 546
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v6, v4 }, Lcom/innioasis/ipp/Albums;->albumKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v5, v4 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  :L10
  .line 534
    add-int/lit8 v3, v3, 1
    goto :L2
  :L11
  .line 548
    invoke-virtual { v1 }, Ljava/util/LinkedHashMap;->isEmpty()Z
    move-result p1
    if-eqz p1, :L12
    return-void
  :L12
  .line 550
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1 }, Ljava/util/ArrayList;-><init>()V
  .line 551
    nop
  :L13
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-ge v2, v0, :L23
  .line 552
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
  .line 553
    instance-of v3, v0, Ljava/lang/String;
    if-eqz v3, :L14
    move-object v3, v0
    check-cast v3, Ljava/lang/String;
    goto :L15
  :L14
    move-object v3, v5
  :L15
  .line 554
    if-nez v3, :L16
    move-object v3, v5
    goto :L17
  :L16
    invoke-virtual { v1, v3 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  :L17
  .line 555
    if-nez v3, :L18
    move-object v3, v5
    goto :L19
  :L18
    check-cast v3, Ljava/util/LinkedHashSet;
  :L19
  .line 556
    if-eqz v3, :L21
    invoke-virtual { v3 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v4
    if-eqz v4, :L20
    goto :L21
  :L20
  .line 557
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 558
    sget-object v3, Lcom/innioasis/ipp/Genres;->KEY_CMP:Ljava/util/Comparator;
    invoke-static { v0, v3 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 559
    invoke-virtual { p1, v0 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    goto :L22
  :L21
  .line 556
    invoke-virtual { p1, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L22
  .line 551
    add-int/lit8 v2, v2, 1
    goto :L13
  :L23
  .line 561
    invoke-interface { p0 }, Ljava/util/List;->clear()V
  .line 562
    invoke-interface { p0, p1 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 563
    return-void
  :L24
  .line 530
    return-void
  :L25
  .line 528
    return-void
.end method

.method private static warmYears(Ljava/util/List;)Z
  .registers 4
  .line 970
    invoke-static { }, Lcom/innioasis/ipp/Genres;->onMain()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
  .line 971
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->names(Ljava/util/List;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  .line 972
    return v1
  :L0
  .line 974
    const/4 v0, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v0, v2, :L3
  .line 975
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Genres;->nameOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    if-nez v2, :L2
    const/4 p0, 1
    return p0
  :L2
  .line 974
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 977
    return v1
.end method

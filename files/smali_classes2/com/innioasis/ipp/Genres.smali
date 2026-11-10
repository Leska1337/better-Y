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
  .line 432
    new-instance v0, Lcom/innioasis/ipp/Genres$KeyCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Genres$KeyCmp;-><init>(Lcom/innioasis/ipp/Genres$1;)V
    sput-object v0, Lcom/innioasis/ipp/Genres;->KEY_CMP:Ljava/util/Comparator;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 41
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100(Lcom/innioasis/music/GenresActivity;II)V
  .registers 3
  .line 39
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Genres;->applyName(Lcom/innioasis/music/GenresActivity;II)V
    return-void
.end method

.method static synthetic access$1000(Ljava/lang/Object;)Ljava/lang/String;
  .registers 1
  .line 39
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->nameOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$1100(JJ)I
  .registers 4
  .line 39
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Genres;->cmpLong(JJ)I
    move-result p0
    return p0
.end method

.method static synthetic access$1200(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 39
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->cmpStr(Ljava/lang/String;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method static synthetic access$200()Lcom/innioasis/music/util/SubMenuDialog;
  .registers 1
  .line 39
    sget-object v0, Lcom/innioasis/ipp/Genres;->parent:Lcom/innioasis/music/util/SubMenuDialog;
    return-object v0
.end method

.method static synthetic access$300(Lcom/innioasis/music/GenresActivity;I)V
  .registers 2
  .line 39
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->applySong(Lcom/innioasis/music/GenresActivity;I)V
    return-void
.end method

.method static synthetic access$400()I
  .registers 1
  .line 39
    invoke-static { }, Lcom/innioasis/ipp/Genres;->songSort()I
    move-result v0
    return v0
.end method

.method static synthetic access$500(Ljava/util/List;I)Ljava/util/List;
  .registers 2
  .line 39
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->sortSongs(Ljava/util/List;I)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$600(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 1
  .line 39
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$700(Ljava/lang/Object;)I
  .registers 1
  .line 39
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result p0
    return p0
.end method

.method static synthetic access$800(Lcom/innioasis/music/GenresActivity;)Landroid/view/View;
  .registers 1
  .line 39
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->lv(Lcom/innioasis/music/GenresActivity;)Landroid/view/View;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$900(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 2
  .line 39
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->land(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
    return-void
.end method

.method public static albumList(Ljava/util/List;Lcom/innioasis/music/data/Genre;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 2
  .line 390
    if-nez p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
  :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->split(Ljava/util/List;Ljava/lang/String;)V
  :L2
  .line 392
    goto :L4
  :L3
  .line 391
    move-exception p1
  :L4
  .line 393
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;)V
  .line 394
    return-void
.end method

.method public static albums(Ljava/util/List;)V
  .registers 2
  .line 440
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;Lcom/innioasis/music/GenresActivity;)V
  .line 441
    return-void
.end method

.method public static albums(Ljava/util/List;Lcom/innioasis/music/GenresActivity;)V
  .catchall { :L0 .. :L10 } :L12
  .registers 8
  .line 451
    if-eqz p0, :L14
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L14
  :L1
  .line 452
    const-string v0, "genre_album_sort"
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result v0
  .line 453
    const/4 v2, -1
    if-ne v0, v2, :L2
    return-void
  :L2
  .line 454
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
  .line 455
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    sub-int/2addr v5, v3
    if-ge v5, v1, :L5
    return-void
  :L5
  .line 456
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    invoke-interface { p0, v3, v5 }, Ljava/util/List;->subList(II)Ljava/util/List;
    move-result-object p0
  .line 457
    const/4 v3, 3
    if-eq v0, v1, :L8
    if-ne v0, v3, :L6
    goto :L8
  :L6
  .line 462
    new-instance p1, Lcom/innioasis/ipp/Genres$NameCmp;
    if-ne v0, v4, :L7
    const/4 v2, 1
  :L7
    invoke-direct { p1, v2 }, Lcom/innioasis/ipp/Genres$NameCmp;-><init>(Z)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    goto :L11
  :L8
  .line 458
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->warmYears(Ljava/util/List;)Z
    move-result v1
  .line 459
    new-instance v5, Lcom/innioasis/ipp/Genres$YearCmp;
    if-ne v0, v3, :L9
    const/4 v2, 1
  :L9
    invoke-direct { v5, v2 }, Lcom/innioasis/ipp/Genres$YearCmp;-><init>(Z)V
    invoke-static { p0, v5 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 460
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
  .line 461
    nop
  :L11
  .line 465
    goto :L13
  :L12
  .line 464
    move-exception p0
  :L13
  .line 466
    return-void
  :L14
  .line 451
    return-void
.end method

.method private static albumsAdapter(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  :L0
  .line 300
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter3_1()Lcom/innioasis/music/adapter/AlbumListAdapter;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 301
    move-exception p0
  .line 302
    const/4 p0, 0
    return-object p0
.end method

.method public static alphaKind(Ljava/lang/Object;)I
  .registers 6
  .line 338
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result p0
  .line 340
    const/4 v0, -1
    const/4 v1, 0
    const/4 v2, 1
    if-eqz p0, :L9
    if-ne p0, v2, :L0
    goto :L9
  :L0
  .line 344
    const/4 v3, 3
    const/4 v4, 2
    if-ne p0, v4, :L5
  .line 345
    const-string p0, "genre_album_sort"
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result p0
  .line 346
    if-eq p0, v0, :L4
    if-eqz p0, :L4
    if-ne p0, v2, :L1
    goto :L4
  :L1
  .line 347
    if-eq p0, v4, :L3
    if-ne p0, v3, :L2
    goto :L3
  :L2
  .line 348
    return v1
  :L3
  .line 347
    return v4
  :L4
  .line 346
    return v2
  :L5
  .line 350
    if-ne p0, v3, :L8
  .line 351
    invoke-static { }, Lcom/innioasis/ipp/Genres;->songSort()I
    move-result p0
  .line 353
    if-eqz p0, :L6
    if-ne p0, v2, :L7
  :L6
    const/4 v1, 1
  :L7
    return v1
  :L8
  .line 355
    return v1
  :L9
  .line 341
    if-nez p0, :L10
    const-string p0, "genre_sort"
    goto :L11
  :L10
    const-string p0, "genre_artist_sort"
  :L11
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result p0
  .line 342
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
  .line 594
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 595
    if-eqz v0, :L10
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result v1
    if-eq v1, p1, :L1
    goto :L10
  :L1
  .line 596
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
  .line 598
    const/4 v2, 2
    if-ne p1, v2, :L6
    if-eq p2, v2, :L5
    const/4 v3, 3
    if-ne p2, v3, :L6
  :L5
  .line 600
    new-instance p1, Ljava/lang/Thread;
    new-instance p2, Lcom/innioasis/ipp/Genres$Resort;
    invoke-direct { p2, p0, v0, v1 }, Lcom/innioasis/ipp/Genres$Resort;-><init>(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Z)V
    invoke-direct { p1, p2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  .line 601
    return-void
  :L6
  .line 603
    if-ne p1, v2, :L7
    goto :L8
  :L7
    const/4 v1, 0
  :L8
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Genres;->resortNow(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Z)V
  :L9
  .line 605
    goto :L12
  :L10
  .line 595
    return-void
  :L11
  .line 604
    move-exception p0
  :L12
  .line 606
    return-void
.end method

.method private static applySong(Lcom/innioasis/music/GenresActivity;I)V
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  :L0
  .line 610
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 611
    if-eqz v0, :L5
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result v1
    const/4 v2, 3
    if-eq v1, v2, :L1
    goto :L5
  :L1
  .line 612
    invoke-static { }, Lcom/innioasis/ipp/Genres;->flat()Z
    move-result v1
    if-eqz v1, :L2
    const-string v1, "genre_flat_sort"
    goto :L3
  :L2
    const-string v1, "genre_song_sort"
  :L3
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Genres;->setSort(Ljava/lang/String;I)V
  .line 613
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->rowFlags(Lcom/innioasis/music/GenresActivity;I)V
  .line 615
    new-instance p1, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Genres$Resort;
    const/4 v2, 0
    invoke-direct { v1, p0, v0, v2 }, Lcom/innioasis/ipp/Genres$Resort;-><init>(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Z)V
    invoke-direct { p1, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  :L4
  .line 617
    goto :L7
  :L5
  .line 611
    return-void
  :L6
  .line 616
    move-exception p0
  :L7
  .line 618
    return-void
.end method

.method public static artists(Ljava/util/List;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 375
    if-eqz p0, :L8
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 3
    if-ge v0, v1, :L1
    goto :L8
  :L1
  .line 376
    const-string v0, "genre_artist_sort"
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result v0
  .line 377
    const/4 v1, -1
    if-ne v0, v1, :L2
    return-void
  :L2
  .line 378
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
  .line 380
    goto :L7
  :L6
  .line 379
    move-exception p0
  :L7
  .line 381
    return-void
  :L8
  .line 375
    return-void
.end method

.method public static backClose()Z
  .registers 2
  .line 146
    sget-boolean v0, Lcom/innioasis/ipp/Genres;->closeOnBack:Z
  .line 147
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Genres;->closeOnBack:Z
  .line 148
    return v0
.end method

.method private static cmpLong(JJ)I
  .registers 5
  .line 838
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
  .line 833
    const-string v0, ""
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  :L1
  .line 834
    if-nez p1, :L2
    goto :L3
  :L2
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  :L3
  .line 835
    invoke-virtual { p0, v0 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method private static deleteLabel(I)I
  .registers 2
  .line 227
    if-nez p0, :L0
    const p0, 2131821094
    return p0
  :L0
  .line 228
    const/4 v0, 1
    if-ne p0, v0, :L1
    const p0, 2131820589
    return p0
  :L1
  .line 229
    const/4 v0, 2
    if-ne p0, v0, :L2
    const p0, 2131820582
    return p0
  :L2
  .line 230
    const p0, 2131820841
    return p0
.end method

.method private static flags(Ljava/lang/Object;I)V
  .registers 6
  .line 522
    instance-of v0, p0, Lcom/innioasis/music/adapter/SongListAdapter;
    if-nez v0, :L0
    return-void
  :L0
  .line 523
    check-cast p0, Lcom/innioasis/music/adapter/SongListAdapter;
  .line 524
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
  .line 525
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
  .line 526
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
  .line 528
    return-void
.end method

.method public static flat()Z
  .registers 1
  .line 75
    sget-boolean v0, Lcom/innioasis/ipp/Genres;->listFlat:Z
    return v0
.end method

.method public static genres(Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 361
    if-eqz p0, :L7
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L7
  :L1
  .line 362
    const-string v0, "genre_sort"
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->sortOf(Ljava/lang/String;)I
    move-result v0
  .line 363
    const/4 v1, -1
    if-ne v0, v1, :L2
    return-object p0
  :L2
  .line 364
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 365
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
  .line 366
    return-object v1
  :L6
  .line 367
    move-exception v0
  .line 368
    return-object p0
  :L7
  .line 361
    return-object p0
.end method

.method private static indexOf(Ljava/util/List;Ljava/lang/String;)I
  .registers 6
  .line 136
    const/4 v0, -1
    if-nez p1, :L0
    return v0
  :L0
  .line 137
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 138
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 139
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
  .line 137
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 141
    return v0
.end method

.method private static isMarker(Ljava/lang/Object;)Z
  .registers 2
  .line 700
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->nameOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
  .line 701
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
  .line 682
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v0
  .line 683
    if-eqz v0, :L0
    invoke-interface { v0 }, Ljava/util/List;->clear()V
  :L0
  .line 684
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 685
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->lv(Lcom/innioasis/music/GenresActivity;)Landroid/view/View;
    move-result-object p0
  .line 686
    if-eqz p0, :L1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Lv;->select(Landroid/view/View;I)V
  :L1
  .line 687
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Mark;->afterFill(Ljava/lang/Object;Landroid/view/View;)V
  .line 688
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 689
    return-void
.end method

.method public static levelFor(Ljava/lang/String;)Z
  .registers 2
  .line 80
    sget-object v0, Lcom/innioasis/ipp/Genres;->listAlbum:Lcom/innioasis/music/data/Album;
  .line 81
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
  .line 164
    instance-of v0, p0, Lcom/innioasis/music/adapter/GenreListAdapter;
    if-eqz v0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 165
    instance-of v0, p0, Lcom/innioasis/music/adapter/MainAdapter;
    if-eqz v0, :L1
    const/4 p0, 1
    return p0
  :L1
  .line 166
    instance-of v0, p0, Lcom/innioasis/music/adapter/AlbumListAdapter;
    if-eqz v0, :L2
    const/4 p0, 2
    return p0
  :L2
  .line 167
    instance-of p0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz p0, :L3
    const/4 p0, 3
    return p0
  :L3
  .line 168
    const/4 p0, -1
    return p0
.end method

.method private static live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 1
  .line 180
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->lv(Lcom/innioasis/music/GenresActivity;)Landroid/view/View;
    move-result-object p0
  .line 181
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  :L1
    return-object p0
.end method

.method private static lv(Lcom/innioasis/music/GenresActivity;)Landroid/view/View;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 173
    const v0, 2131362180
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 174
    move-exception p0
  .line 175
    const/4 p0, 0
    return-object p0
.end method

.method public static menu(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/util/SubMenuDialog;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 9
  .line 189
    sput-object p1, Lcom/innioasis/ipp/Genres;->parent:Lcom/innioasis/music/util/SubMenuDialog;
  .line 191
    if-eqz p0, :L12
    if-nez p1, :L0
    goto/16 :L12
  :L0
  .line 192
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 193
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result v1
  .line 194
    const/4 v2, -1
    if-ne v1, v2, :L1
    return-void
  :L1
  .line 196
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 197
    const/4 v3, 3
    const v4, 2131821047
    const v5, 2131820584
    const v6, 2131820844
    if-ne v1, v3, :L7
  .line 198
    invoke-static { }, Lcom/innioasis/ipp/Genres;->flat()Z
    move-result v1
  .line 199
    const v3, 2131820964
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 200
    const v3, 2131820963
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 201
    if-eqz v1, :L2
    const v3, 2131820962
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L3
  :L2
  .line 202
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->trackSortEnabled()Z
    move-result v3
    if-eqz v3, :L3
    const v3, 2131821024
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 203
    invoke-virtual { p0, v6 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 204
    invoke-virtual { p0, v5 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 205
    const v3, 2131820841
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 206
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 207
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->canOpen(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result v0
    if-eqz v0, :L4
    const v0, 2131821105
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 208
    if-eqz v1, :L5
    const v0, 2131821071
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L5
  .line 209
    const v0, 2131821060
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 210
    goto :L8
  :L7
  .line 211
    const v3, 2131820961
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 212
    invoke-virtual { p0, v6 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 213
    invoke-virtual { p0, v5 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 214
    invoke-static { v1 }, Lcom/innioasis/ipp/Genres;->deleteLabel(I)I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 215
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 216
    const/4 v3, 2
    if-ne v1, v3, :L8
    invoke-static { v0 }, Lcom/innioasis/ipp/Art;->albumKey(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Art;->hasPick(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L8
  .line 217
    const v0, 2131821062
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L8
  .line 220
    invoke-virtual { p1, v2 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 221
    invoke-virtual { p1 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  :L9
  .line 223
    goto :L11
  :L10
  .line 222
    move-exception p0
  :L11
  .line 224
    return-void
  :L12
  .line 191
    return-void
.end method

.method private static nameOf(Ljava/lang/Object;)Ljava/lang/String;
  .registers 2
  .line 693
    instance-of v0, p0, Ljava/lang/String;
    if-eqz v0, :L0
    check-cast p0, Ljava/lang/String;
    return-object p0
  :L0
  .line 694
    instance-of v0, p0, Lcom/innioasis/music/data/Album;
    if-eqz v0, :L1
    check-cast p0, Lcom/innioasis/music/data/Album;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 695
    instance-of v0, p0, Lcom/innioasis/music/data/Genre;
    if-eqz v0, :L2
    check-cast p0, Lcom/innioasis/music/data/Genre;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 696
    const/4 p0, 0
    return-object p0
.end method

.method private static nameSortDialog(Lcom/innioasis/music/GenresActivity;I)V
  .registers 5
  .line 531
    const/4 v0, -1
    if-eq p1, v0, :L2
    const/4 v0, 3
    if-ne p1, v0, :L0
    goto :L2
  :L0
  .line 532
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 533
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 534
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 535
    const/4 v1, 2
    if-ne p1, v1, :L1
  .line 536
    const v1, 2131821028
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 537
    const v1, 2131821029
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 540
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Genres$NamePick;
    invoke-direct { v2, p0, p1 }, Lcom/innioasis/ipp/Genres$NamePick;-><init>(Lcom/innioasis/music/GenresActivity;I)V
    const p1, 2131886360
    invoke-direct { v1, p0, v0, v2, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 541
    return-void
  :L2
  .line 531
    return-void
.end method

.method private static names(Ljava/util/List;)Ljava/util/ArrayList;
  .registers 4
  .line 757
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 758
    const/4 v1, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 759
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Genres;->nameOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
  .line 760
    if-eqz v2, :L1
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 758
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 762
    return-object v0
.end method

.method public static noteFlat(Z)V
  .registers 1
  .line 71
    sput-boolean p0, Lcom/innioasis/ipp/Genres;->listFlat:Z
  .line 72
    return-void
.end method

.method public static noteList(Lcom/innioasis/music/data/Album;Lcom/innioasis/music/data/Genre;)V
  .registers 2
  .line 57
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 58
    sput-object p0, Lcom/innioasis/ipp/Genres;->listAlbum:Lcom/innioasis/music/data/Album;
  .line 59
    sput-object p1, Lcom/innioasis/ipp/Genres;->listGenre:Lcom/innioasis/music/data/Genre;
  .line 60
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
  .line 61
    return-void
  :L4
  .line 57
    return-void
.end method

.method private static numbers(Lcom/innioasis/music/GenresActivity;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 2
  .line 482
    if-eqz p0, :L2
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Genres;->flat()Z
    move-result v0
    if-eqz v0, :L1
    goto :L2
  :L1
  .line 486
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter3_2()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v0
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Disc;->setGenreAdapters(Ljava/lang/Object;Ljava/lang/Object;)V
  .line 488
    goto :L5
  :L2
  .line 483
    const/4 p0, 0
    invoke-static { p0, p0 }, Lcom/innioasis/ipp/Disc;->setGenreAdapters(Ljava/lang/Object;Ljava/lang/Object;)V
  :L3
  .line 484
    return-void
  :L4
  .line 487
    move-exception p0
  :L5
  .line 489
    return-void
.end method

.method private static onMain()Z
  .registers 2
  .line 330
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
  .registers 7
  :L0
  .line 99
    instance-of v0, p0, Lcom/innioasis/music/GenresActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 100
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v0
  .line 101
    if-eqz v0, :L7
    const-string v1, "ipp_open_genre_songs"
    const/4 v2, 0
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0
    if-nez v0, :L2
    goto/16 :L7
  :L2
  .line 102
    sget-object v0, Lcom/innioasis/ipp/Genres;->openAlbum:Lcom/innioasis/music/data/Album;
  .line 103
    sget-object v1, Lcom/innioasis/ipp/Genres;->openGenre:Lcom/innioasis/music/data/Genre;
  .line 104
    sget-object v3, Lcom/innioasis/ipp/Genres;->openFocus:Ljava/lang/String;
  .line 105
    const/4 v4, 0
    sput-object v4, Lcom/innioasis/ipp/Genres;->openAlbum:Lcom/innioasis/music/data/Album;
  .line 106
    sput-object v4, Lcom/innioasis/ipp/Genres;->openGenre:Lcom/innioasis/music/data/Genre;
  .line 107
    sput-object v4, Lcom/innioasis/ipp/Genres;->openFocus:Ljava/lang/String;
  .line 108
    if-nez v0, :L3
    return-void
  :L3
  .line 110
    check-cast p0, Lcom/innioasis/music/GenresActivity;
  .line 111
    invoke-static { v1 }, Lcom/innioasis/ipp/Mark;->noteGenre(Lcom/innioasis/music/data/Genre;)V
  .line 112
    sget-object v4, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v4 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v4
  .line 113
    invoke-virtual { v4, v0, v2, v1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByAlbumSync(Lcom/innioasis/music/data/Album;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v1
  .line 114
    if-eqz v1, :L6
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-eqz v4, :L4
    goto :L6
  :L4
  .line 115
    invoke-static { v1 }, Lcom/innioasis/ipp/Genres;->songs(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
  .line 117
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/databinding/ActivityGenresBinding;
  .line 118
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->setSongList(Ljava/util/List;)V
  .line 119
    invoke-virtual { v0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Mark;->title(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/GenresActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 120
    iget-object v0, v4, Lcom/innioasis/y1/databinding/ActivityGenresBinding;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v5
    invoke-virtual { v0, v5 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->bind(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 121
    iget-object v0, v4, Lcom/innioasis/y1/databinding/ActivityGenresBinding;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    invoke-virtual { v0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->show()V
  .line 122
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v0
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/adapter/SongListAdapter2;->setItems(Ljava/util/List;)V
  .line 124
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->lv(Lcom/innioasis/music/GenresActivity;)Landroid/view/View;
    move-result-object v0
  .line 125
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v4
    invoke-static { v4, v1, v0 }, Lcom/innioasis/ipp/Disc;->preset(Ljava/lang/Object;Ljava/util/List;Landroid/view/View;)V
  .line 126
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v4
    invoke-static { v0, v4, v2 }, Lcom/innioasis/ipp/Lv;->go(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 127
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/Genres;->closeOnBack:Z
  .line 129
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Genres;->indexOf(Ljava/util/List;Ljava/lang/String;)I
    move-result v1
  .line 130
    if-ltz v1, :L5
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object p0
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  :L5
  .line 132
    goto :L9
  :L6
  .line 114
    return-void
  :L7
  .line 101
    return-void
  :L8
  .line 131
    move-exception p0
  :L9
  .line 133
    return-void
.end method

.method public static pick(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)I
  .catchall { :L0 .. :L17 } :L20
  .registers 11
  .line 239
    const/4 v0, -2
    if-eqz p0, :L21
    if-nez p1, :L0
    goto/16 :L21
  :L0
  .line 240
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object v1
  .line 241
    if-nez v1, :L1
    return v0
  :L1
  .line 242
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v2
  .line 243
    invoke-static { v2 }, Lcom/innioasis/ipp/Genres;->levelOf(Ljava/lang/Object;)I
    move-result v3
  .line 245
    const v4, 2131821047
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L2
  .line 246
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->live(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->addFromAdapter(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 247
    return v0
  :L2
  .line 249
    const v4, 2131820961
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    const/4 v5, -1
    if-eqz v4, :L3
  .line 250
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Genres;->nameSortDialog(Lcom/innioasis/music/GenresActivity;I)V
  .line 251
    return v5
  :L3
  .line 253
    const v3, 2131820964
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    const/4 v4, 1
    const/4 v6, 0
    if-eqz v3, :L4
  .line 254
    invoke-static { p0, v6, v4, v6 }, Lcom/innioasis/ipp/Genres;->songDirDialog(Lcom/innioasis/music/GenresActivity;IIZ)V
  .line 255
    return v5
  :L4
  .line 257
    const v3, 2131820963
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    const/4 v7, 3
    const/4 v8, 2
    if-eqz v3, :L5
  .line 258
    invoke-static { p0, v8, v7, v4 }, Lcom/innioasis/ipp/Genres;->songDirDialog(Lcom/innioasis/music/GenresActivity;IIZ)V
  .line 259
    return v5
  :L5
  .line 261
    const v3, 2131821024
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L6
  .line 262
    const/4 p1, 6
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->applySong(Lcom/innioasis/music/GenresActivity;I)V
  .line 263
    return v0
  :L6
  .line 265
    const v3, 2131820962
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L7
  .line 266
    const/4 p1, 7
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->applySong(Lcom/innioasis/music/GenresActivity;I)V
  .line 267
    return v0
  :L7
  .line 269
    const v3, 2131821060
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L8
  .line 270
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->albumsAdapter(Lcom/innioasis/music/GenresActivity;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/Art;->setThumb(Lcom/innioasis/music/adapter/MyBaseAdapter;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .line 271
    return v0
  :L8
  .line 273
    const v3, 2131821062
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L9
  .line 274
    invoke-static { v2 }, Lcom/innioasis/ipp/Art;->resetThumb(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .line 275
    return v0
  :L9
  .line 277
    const v3, 2131821071
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L10
  .line 278
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Albums;->openAlbumFrom(Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 279
    return v0
  :L10
  .line 281
    const v3, 2131821105
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L13
  .line 282
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
  .line 284
    const v2, 2131820844
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L14
    return v6
  :L14
  .line 285
    const v2, 2131820584
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L15
    return v4
  :L15
  .line 286
    const v2, 2131820841
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L19
  .line 287
    const v2, 2131820582
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L19
  .line 288
    const v2, 2131820589
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L19
  .line 289
    const v2, 2131821094
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L16
    goto :L19
  :L16
  .line 291
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
  :L17
    if-eqz p0, :L18
    const/4 v0, 3
  :L18
    return v0
  :L19
  .line 289
    return v8
  :L20
  .line 292
    move-exception p0
  .line 293
    return v0
  :L21
  .line 239
    return v0
.end method

.method private static resortNow(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;Z)V
  .registers 8
  .line 622
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v0
  .line 623
    if-eqz p2, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;)V
    goto :L7
  :L0
  .line 625
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
  .line 626
    const/4 v1, -1
    if-ne p2, v1, :L3
    return-void
  :L3
  .line 627
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
  .line 628
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
  .line 630
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->land(Lcom/innioasis/music/GenresActivity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 631
    return-void
.end method

.method public static restore(Landroid/content/Intent;Ljava/lang/String;)V
  .registers 4
  .line 86
    if-eqz p0, :L1
    sget-object v0, Lcom/innioasis/ipp/Genres;->listAlbum:Lcom/innioasis/music/data/Album;
    if-nez v0, :L0
    goto :L1
  :L0
  .line 87
    const-string v0, "ipp_open_genre_songs"
    const/4 v1, 1
    invoke-virtual { p0, v0, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 88
    sget-object p0, Lcom/innioasis/ipp/Genres;->listAlbum:Lcom/innioasis/music/data/Album;
    sput-object p0, Lcom/innioasis/ipp/Genres;->openAlbum:Lcom/innioasis/music/data/Album;
  .line 89
    sget-object p0, Lcom/innioasis/ipp/Genres;->listGenre:Lcom/innioasis/music/data/Genre;
    sput-object p0, Lcom/innioasis/ipp/Genres;->openGenre:Lcom/innioasis/music/data/Genre;
  .line 90
    sput-object p1, Lcom/innioasis/ipp/Genres;->openFocus:Ljava/lang/String;
  .line 91
    return-void
  :L1
  .line 86
    return-void
.end method

.method private static rowFlags(Lcom/innioasis/music/GenresActivity;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 514
    if-nez p0, :L0
    return-void
  :L0
  .line 515
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter3_2()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object v0
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Genres;->flags(Ljava/lang/Object;I)V
  .line 516
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter4()Lcom/innioasis/music/adapter/SongListAdapter2;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Genres;->flags(Ljava/lang/Object;I)V
  :L1
  .line 518
    goto :L3
  :L2
  .line 517
    move-exception p0
  :L3
  .line 519
    return-void
.end method

.method private static setSort(Ljava/lang/String;I)V
  .registers 3
  .line 325
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 326
    if-eqz v0, :L0
    invoke-static { v0, p0, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L0
  .line 327
    return-void
.end method

.method private static songDirDialog(Lcom/innioasis/music/GenresActivity;IIZ)V
  .registers 6
  .line 544
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 545
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 546
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 547
    if-eqz p3, :L0
  .line 548
    const p3, 2131820969
    invoke-virtual { p0, p3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { v0, p3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 549
    const p3, 2131820970
    invoke-virtual { p0, p3 }, Lcom/innioasis/music/GenresActivity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { v0, p3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L0
  .line 551
    new-instance p3, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v1, Lcom/innioasis/ipp/Genres$SongPick;
    invoke-direct { v1, p0, p1, p2 }, Lcom/innioasis/ipp/Genres$SongPick;-><init>(Lcom/innioasis/music/GenresActivity;II)V
    const p1, 2131886360
    invoke-direct { p3, p0, v0, v1, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { p3 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 552
    return-void
.end method

.method private static songSort()I
  .registers 1
  .line 505
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
  .line 470
    invoke-static { }, Lcom/innioasis/ipp/Genres;->songSort()I
    move-result v0
  .line 471
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Genres;->rowFlags(Lcom/innioasis/music/GenresActivity;I)V
  .line 472
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->numbers(Lcom/innioasis/music/GenresActivity;)V
  .line 473
    invoke-static { p1 }, Lcom/innioasis/ipp/Genres;->songs(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method public static songs(Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L6
  .registers 3
  .line 493
    if-eqz p0, :L7
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L7
  :L1
  .line 494
    invoke-static { }, Lcom/innioasis/ipp/Genres;->songSort()I
    move-result v0
  .line 495
    const/4 v1, -1
    if-ne v0, v1, :L2
    move-object v0, p0
    goto :L3
  :L2
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Genres;->sortSongs(Ljava/util/List;I)Ljava/util/List;
    move-result-object v0
  :L3
  .line 497
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
  .line 498
    move-exception v0
  .line 499
    return-object p0
  :L7
  .line 493
    return-object p0
.end method

.method private static sortOf(Ljava/lang/String;)I
  .registers 3
  .line 320
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 321
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
  .line 800
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 801
    const/4 p0, 6
    if-ne p1, p0, :L3
  .line 802
    new-instance p0, Lcom/innioasis/ipp/Genres$SongCmp;
    const/4 p1, 2
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Genres$SongCmp;-><init>(I)V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 803
    invoke-static { }, Lcom/innioasis/ipp/Genres;->onMain()Z
    move-result p0
    if-eqz p0, :L0
  .line 805
    new-instance p0, Lcom/innioasis/ipp/TrackComparator;
    invoke-direct { p0 }, Lcom/innioasis/ipp/TrackComparator;-><init>()V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 806
    return-object v0
  :L0
  .line 808
    invoke-static { v0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
  .line 809
    if-nez p0, :L1
    goto :L2
  :L1
    move-object v0, p0
  :L2
    return-object v0
  :L3
  .line 811
    new-instance p0, Lcom/innioasis/ipp/Genres$SongCmp;
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Genres$SongCmp;-><init>(I)V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 812
    return-object v0
.end method

.method private static split(Ljava/util/List;Ljava/lang/String;)V
  .registers 10
  .line 397
    if-eqz p0, :L25
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L25
    if-nez p1, :L0
    goto/16 :L25
  :L0
  .line 398
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 399
    if-eqz v0, :L24
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto/16 :L24
  :L1
  .line 402
    new-instance v1, Ljava/util/LinkedHashMap;
    invoke-direct { v1 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 403
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    const/4 v5, 0
    if-ge v3, v4, :L11
  .line 404
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 405
    instance-of v6, v4, Lcom/innioasis/y1/database/Song;
    if-nez v6, :L3
    goto :L10
  :L3
  .line 406
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 408
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6, p1 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :L4
    goto :L10
  :L4
  .line 409
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v6
    if-nez v6, :L5
    const-string v6, ""
    goto :L6
  :L5
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v6
  :L6
  .line 410
    invoke-virtual { v1, v6 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
  .line 411
    if-nez v7, :L7
    goto :L8
  :L7
    move-object v5, v7
    check-cast v5, Ljava/util/LinkedHashSet;
  :L8
  .line 412
    if-nez v5, :L9
    new-instance v5, Ljava/util/LinkedHashSet;
    invoke-direct { v5 }, Ljava/util/LinkedHashSet;-><init>()V
    invoke-virtual { v1, v6, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 413
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v6, v4 }, Lcom/innioasis/ipp/Albums;->albumKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v5, v4 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  :L10
  .line 403
    add-int/lit8 v3, v3, 1
    goto :L2
  :L11
  .line 415
    invoke-virtual { v1 }, Ljava/util/LinkedHashMap;->isEmpty()Z
    move-result p1
    if-eqz p1, :L12
    return-void
  :L12
  .line 417
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1 }, Ljava/util/ArrayList;-><init>()V
  .line 418
    nop
  :L13
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-ge v2, v0, :L23
  .line 419
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
  .line 420
    instance-of v3, v0, Ljava/lang/String;
    if-eqz v3, :L14
    move-object v3, v0
    check-cast v3, Ljava/lang/String;
    goto :L15
  :L14
    move-object v3, v5
  :L15
  .line 421
    if-nez v3, :L16
    move-object v3, v5
    goto :L17
  :L16
    invoke-virtual { v1, v3 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  :L17
  .line 422
    if-nez v3, :L18
    move-object v3, v5
    goto :L19
  :L18
    check-cast v3, Ljava/util/LinkedHashSet;
  :L19
  .line 423
    if-eqz v3, :L21
    invoke-virtual { v3 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v4
    if-eqz v4, :L20
    goto :L21
  :L20
  .line 424
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 425
    sget-object v3, Lcom/innioasis/ipp/Genres;->KEY_CMP:Ljava/util/Comparator;
    invoke-static { v0, v3 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 426
    invoke-virtual { p1, v0 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    goto :L22
  :L21
  .line 423
    invoke-virtual { p1, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L22
  .line 418
    add-int/lit8 v2, v2, 1
    goto :L13
  :L23
  .line 428
    invoke-interface { p0 }, Ljava/util/List;->clear()V
  .line 429
    invoke-interface { p0, p1 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 430
    return-void
  :L24
  .line 399
    return-void
  :L25
  .line 397
    return-void
.end method

.method private static warmYears(Ljava/util/List;)Z
  .registers 4
  .line 746
    invoke-static { }, Lcom/innioasis/ipp/Genres;->onMain()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
  .line 747
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->names(Ljava/util/List;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  .line 748
    return v1
  :L0
  .line 750
    const/4 v0, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v0, v2, :L3
  .line 751
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
  .line 750
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 753
    return v1
.end method

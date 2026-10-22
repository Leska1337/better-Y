.class public final Lcom/innioasis/ipp/Albums;
.super Ljava/lang/Object;
.source "Albums.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Albums$Dirs;,
    Lcom/innioasis/ipp/Albums$SongCmp;,
    Lcom/innioasis/ipp/Albums$Warm;,
    Lcom/innioasis/ipp/Albums$StrCmp;,
    Lcom/innioasis/ipp/Albums$DiscCmp;,
    Lcom/innioasis/ipp/Albums$PathCmp;
  }
.end annotation

.field private final static ALL:C = '\u0002'

.field private final static ALL_SORT:Ljava/lang/String; = "all_sort"

.field private final static ARTIST_SORT:Ljava/lang/String; = "artist_album_sort"

.field private final static BOOT_WAIT_MS:J = 30000L

.field private final static CACHE_M:Ljava/lang/String; = "cache_m"

.field private final static CACHE_N:Ljava/lang/String; = "cache_n"

.field private final static CACHE_T:Ljava/lang/String; = "cache_t"

.field private final static CACHE_TTL_MS:J = 600000L

.field private final static CACHE_V:Ljava/lang/String; = "cache_v"

.field private final static CACHE_VERSION:I = 4

.field private final static CAP:I = 1048576

.field private final static CD_PAT:Ljava/util/regex/Pattern;

.field private final static DISC_CMP:Ljava/util/Comparator;

.field private final static EXTRA_OPEN:Ljava/lang/String; = "ipp_open_album"

.field private final static GEN:C = '\u0003'

.field public final static KEY_SCOPE:Ljava/lang/String; = "artist_scope"

.field private final static PATH_CMP:Ljava/util/Comparator;

.field private final static PORTION:I = 1000

.field private final static RESERVE:I = 25165824

.field private final static SEP:C = '\u0001'

.field private final static SONGS:Ljava/lang/Object;

.field private final static STR_CMP:Ljava/util/Comparator;

.field private final static WARM:Ljava/lang/Runnable;

.field private final static WARM_DELAY_MS:J = 2000L

.field private static albumSongsMemo:Ljava/util/HashMap;

.field private static allList:Z

.field private static artistList:Z

.field private static block:[B

.field private static bootAsked:J

.field private static cap:[B

.field private static checkAsked:Z

.field private static closeOnBack:Z

.field private static foldersFor:Ljava/util/List;

.field private static foldersMemo:Ljava/util/LinkedHashMap;

.field private static foreign:I

.field private static keyMemo:Ljava/util/HashMap;

.field private static listFirst:I

.field private static listKey:Ljava/lang/String;

.field private static listPos:I

.field private static listTop:I

.field private static markForeign:I

.field private static markList:Ljava/util/List;

.field private static volatile menuShown:Z

.field private static namesFor:Ljava/lang/ref/WeakReference;

.field private static namesMemo:Ljava/util/List;

.field private static namesRev:Z

.field private static pendingFocus:Ljava/lang/String;

.field private static pendingIcon:Landroid/widget/ImageView;

.field private static preparedFor:Ljava/util/List;

.field private static prevAt:J

.field private static prevSig:Ljava/lang/String;

.field private static reader:Ljava/lang/Thread;

.field private static returnAlbum:Ljava/lang/String;

.field private static returnFocus:Ljava/lang/String;

.field private static scanThread:Ljava/lang/Thread;

.field private static volatile scanToast:Z

.field private static scope:Ljava/lang/String;

.field private static songCache:Ljava/util/List;

.field private static songCacheAt:J

.field private static songDlg:Lcom/innioasis/music/util/SubMenuDialog;

.field private static songGen:I

.field private static songOrder:Ljava/lang/Object;

.field private static songPrev:Ljava/util/List;

.field private static songSig:Ljava/lang/String;

.field private static songSort:I

.field private static sorted:Ljava/util/List;

.field private static sortedPrev:Ljava/util/List;

.field private static sortedPrevType:Ljava/lang/Object;

.field private static sortedType:Ljava/lang/Object;

.field private static splitFor:Ljava/lang/ref/WeakReference;

.field private static splitNames:Ljava/util/List;

.field private static splitOut:Ljava/util/ArrayList;

.field private static started:Z

.field private static unicodeLower:I

.field private static warmer:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 2
  .line 147
    nop
  .line 148
    const-string v0, "(?<![\\p{L}\\p{N}])(cd|disc|disk|\u0434\u0438\u0441\u043a)[ ._-]?(\\d{1,2})(?!\\d)"
    invoke-static { v0 }, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Albums;->CD_PAT:Ljava/util/regex/Pattern;
  .line 183
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
  .line 187
    new-instance v0, Lcom/innioasis/ipp/Albums$Warm;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Albums$Warm;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Albums;->WARM:Ljava/lang/Runnable;
  .line 772
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Albums;->unicodeLower:I
  .line 1300
    sput v0, Lcom/innioasis/ipp/Albums;->songSort:I
  .line 1519
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1521
    sput v0, Lcom/innioasis/ipp/Albums;->listPos:I
  .line 1707
    new-instance v0, Lcom/innioasis/ipp/Albums$StrCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Albums$StrCmp;-><init>(Lcom/innioasis/ipp/Albums$1;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
  .line 1849
    new-instance v0, Lcom/innioasis/ipp/Albums$DiscCmp;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Albums$DiscCmp;-><init>(Lcom/innioasis/ipp/Albums$1;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->DISC_CMP:Ljava/util/Comparator;
  .line 1912
    new-instance v0, Lcom/innioasis/ipp/Albums$PathCmp;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Albums$PathCmp;-><init>(Lcom/innioasis/ipp/Albums$1;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 45
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(J)V
  .registers 2
  .line 45
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
    return-void
.end method

.method static synthetic access$100()Ljava/util/List;
  .registers 1
  .line 45
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    return-object v0
.end method

.method static synthetic access$1300(JJ)I
  .registers 4
  .line 45
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Albums;->cmpLong(JJ)I
    move-result p0
    return p0
.end method

.method static synthetic access$1400(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 45
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->cmpStr(Ljava/lang/String;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method static synthetic access$200()V
  .registers 0
  .line 45
    invoke-static { }, Lcom/innioasis/ipp/Albums;->lists()V
    return-void
.end method

.method static synthetic access$300()J
  .registers 2
  .line 45
    sget-wide v0, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    return-wide v0
.end method

.method static synthetic access$302(J)J
  .registers 2
  .line 45
    sput-wide p0, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    return-wide p0
.end method

.method static synthetic access$400()Ljava/lang/Object;
  .registers 1
  .line 45
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    return-object v0
.end method

.method static synthetic access$500()I
  .registers 1
  .line 45
    sget v0, Lcom/innioasis/ipp/Albums;->songGen:I
    return v0
.end method

.method static synthetic access$600()Ljava/lang/String;
  .registers 1
  .line 45
    invoke-static { }, Lcom/innioasis/ipp/Albums;->tableSig()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$700()Ljava/lang/String;
  .registers 1
  .line 45
    sget-object v0, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$702(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 45
    sput-object p0, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$802(Z)Z
  .registers 1
  .line 45
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->checkAsked:Z
    return p0
.end method

.method public static albumFolder(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 138
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 139
    const/16 v0, 47
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 140
    if-gez v0, :L0
    return-object p0
  :L0
  .line 141
    add-int/lit8 v1, v0, 1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v1
  .line 142
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->isCdFolder(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    const/4 v1, 0
    invoke-virtual { p0, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method static albumFolder(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
  .registers 4
  .line 120
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 121
    invoke-virtual { p1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 122
    if-nez v1, :L0
  .line 123
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 124
    invoke-virtual { p1, v0, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 126
    return-object v1
.end method

.method public static albumKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 75
    if-nez p0, :L0
    const-string p0, ""
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static albumMenu(Lcom/innioasis/music/util/SubMenuDialog;Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 1554
    if-eqz p0, :L2
    if-nez p1, :L0
    goto :L2
  :L0
  .line 1555
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1556
    const v1, 2131820961
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1557
    const v1, 2131820844
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1558
    const v1, 2131820584
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1559
    const v1, 2131820582
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1560
    const v1, 2131821047
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1561
    invoke-static { p2 }, Lcom/innioasis/ipp/Art;->albumKey(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
    move-result-object p2
    invoke-static { p2 }, Lcom/innioasis/ipp/Art;->hasPick(Ljava/lang/String;)Z
    move-result p2
    if-eqz p2, :L1
    const p2, 2131821062
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 1562
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 1563
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 1564
    return-void
  :L2
  .line 1554
    return-void
.end method

.method public static albumNames(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;)Ljava/util/List;
  .catchall { :L2 .. :L5 } :L7
  .catchall { :L8 .. :L9 } :L7
  .registers 7
  .line 1608
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    if-ne p1, v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 1609
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loaded()Ljava/util/List;
    move-result-object v1
  .line 1610
    nop
  .line 1611
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  .line 1612
    if-eqz v1, :L3
  :L2
    sget-object v3, Lcom/innioasis/ipp/Albums;->namesFor:Ljava/lang/ref/WeakReference;
    if-eqz v3, :L3
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    if-ne v3, v1, :L3
    sget-boolean v3, Lcom/innioasis/ipp/Albums;->namesRev:Z
    if-ne v3, v0, :L3
    sget-object v3, Lcom/innioasis/ipp/Albums;->namesMemo:Ljava/util/List;
    if-eqz v3, :L3
  .line 1613
    new-instance v3, Ljava/util/ArrayList;
    sget-object v4, Lcom/innioasis/ipp/Albums;->namesMemo:Ljava/util/List;
    invoke-direct { v3, v4 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    goto :L4
  :L3
  .line 1615
    const/4 v3, 0
  :L4
    monitor-exit v2
  :L5
  .line 1616
    if-eqz v3, :L6
  .line 1617
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->noteAlbumSort(I)V
  .line 1618
    return-object v3
  :L6
  .line 1620
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getAlbumsBySort(Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;)Ljava/util/List;
    move-result-object p0
  .line 1621
    invoke-static { v1, v0, p0 }, Lcom/innioasis/ipp/Albums;->keepNames(Ljava/util/List;ZLjava/util/List;)V
  .line 1622
    return-object p0
  :L7
  .line 1615
    move-exception p0
  :L8
    monitor-exit v2
  :L9
    throw p0
.end method

.method static albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
  .catchall { :L0 .. :L4 } :L3
  .registers 3
  .line 1133
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .line 1134
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1135
    sget-object v1, Lcom/innioasis/ipp/Albums;->foldersFor:Ljava/util/List;
    if-ne v1, p0, :L1
    sget-object p0, Lcom/innioasis/ipp/Albums;->albumSongsMemo:Ljava/util/HashMap;
    goto :L2
  :L1
    const/4 p0, 0
  :L2
    monitor-exit v0
    return-object p0
  :L3
  .line 1136
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
.end method

.method public static albumSort(Landroid/app/Activity;)I
  .registers 1
  .line 1264
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->noteAlbumList(Landroid/app/Activity;)V
  .line 1265
    invoke-static { }, Lcom/innioasis/ipp/Albums;->albumSortValue()I
    move-result p0
    return p0
.end method

.method public static albumSortFor(Landroid/app/Activity;)I
  .registers 1
  .line 1270
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->artistView(Landroid/app/Activity;)Z
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->sortValue(Z)I
    move-result p0
    return p0
.end method

.method public static albumSortValue()I
  .registers 1
  .line 1275
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->artistList:Z
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->sortValue(Z)I
    move-result v0
    return v0
.end method

.method private static allMark(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 62
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v1, 2
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static allSongs()Ljava/util/List;
  .registers 6
  .line 967
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 968
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->readOnce()Ljava/util/List;
    move-result-object v0
    return-object v0
  :L0
  .line 969
    sget-boolean v1, Lcom/innioasis/ipp/Albums;->checkAsked:Z
    if-nez v1, :L1
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1
    sget-wide v3, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    sub-long/2addr v1, v3
    const-wide/32 v3, 600000
    cmp-long v5, v1, v3
    if-ltz v5, :L1
  .line 970
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Albums;->checkAsked:Z
  .line 971
    const-wide/16 v1, 0
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  :L1
  .line 973
    return-object v0
.end method

.method public static allSongsArtist(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 59
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return-object p0
.end method

.method public static allSongsRow(Lcom/innioasis/music/data/Album;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;)Z
  .registers 8
  .line 1209
    const/4 v0, 1
    const/4 v1, 0
    if-eqz p0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L1
  :L0
    const/4 p0, 1
    goto :L2
  :L1
    const/4 p0, 0
  :L2
  .line 1210
    if-eqz p3, :L5
  .line 1212
    if-eqz p0, :L3
    const/high16 v2, 0x41B00000
    goto :L4
  :L3
    const/high16 v2, 0x41A00000
  :L4
    const/4 v3, 2
    invoke-virtual { p3, v3, v2 }, Landroid/widget/TextView;->setTextSize(IF)V
  :L5
  .line 1214
    if-eqz p2, :L8
    if-eqz p0, :L6
    const/16 v2, 8
    goto :L7
  :L6
    const/4 v2, 0
  :L7
    invoke-virtual { p2, v2 }, Landroid/widget/TextView;->setVisibility(I)V
  :L8
  .line 1215
    if-nez p0, :L9
  .line 1216
    invoke-static { p1 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 1217
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 1218
    return v1
  :L9
  .line 1220
    nop
  .line 1221
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 1222
    if-eqz p0, :L10
    const p2, 2131821049
    invoke-virtual { p0, p2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    goto :L11
  :L10
    const-string p0, "Show all songs"
  :L11
  .line 1223
    if-eqz p3, :L12
    invoke-virtual { p3, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L12
  .line 1224
    if-eqz p1, :L13
    const p0, 2131623994
    invoke-virtual { p1, p0 }, Landroid/widget/ImageView;->setImageResource(I)V
  :L13
  .line 1225
    sput-object p1, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 1226
    return v0
.end method

.method public static artistMark(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 71
    if-nez p0, :L0
    const-string p0, ""
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->allMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static artistSongs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 4
  .line 1733
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1734
    if-nez v0, :L0
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L0
  .line 1735
    nop
  .line 1736
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p1, v1, :L1
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L1
  .line 1737
    invoke-virtual { v0, p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByArtist(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
  .line 1738
    if-nez p0, :L2
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
  :L2
    return-object p0
.end method

.method private static artistView(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 1250
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-eqz v1, :L3
  .line 1251
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_artist"
    invoke-virtual { p0, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  :L1
    if-eqz p0, :L3
    const/4 v0, 1
    goto :L4
  :L2
  .line 1252
    move-exception p0
  .line 1253
    return v0
  :L3
  .line 1251
    nop
  :L4
  .line 1250
    return v0
.end method

.method private static askLower()I
  .catchall { :L0 .. :L1 } :L16
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L6 .. :L11 } :L16
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L17 .. :L18 } :L19
  .registers 7
  .line 796
    nop
  .line 798
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v2
    const-string v3, "select lower('\u041f\u0420\u0418\u0412\u0415\u0422')"
    invoke-virtual { v2, v3, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v1
  .line 799
    invoke-interface { v1 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v2
  :L1
    if-nez v2, :L6
  .line 806
    if-eqz v1, :L5
  :L2
  .line 808
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L3
  .line 810
    goto :L5
  :L4
  .line 809
    move-exception v1
  :L5
  .line 799
    return v0
  :L6
  .line 800
    const-string v2, "\u043f\u0440\u0438\u0432\u0435\u0442"
    invoke-interface { v1, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    const/4 v3, 1
    if-eqz v2, :L7
    const/4 v2, 1
    goto :L8
  :L7
    const/4 v2, 0
  :L8
  .line 801
    const-string v4, "ipplab"
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "sqlite lower() folds cyrillic: "
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    if-ne v2, v3, :L9
    goto :L10
  :L9
    const/4 v3, 0
  :L10
    invoke-virtual { v5, v3 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static { v4, v3 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L11
  .line 802
    nop
  .line 806
    if-eqz v1, :L15
  :L12
  .line 808
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L13
  .line 810
    goto :L15
  :L14
  .line 809
    move-exception v0
  :L15
  .line 802
    return v2
  :L16
  .line 803
    move-exception v2
  .line 804
    nop
  .line 806
    if-eqz v1, :L20
  :L17
  .line 808
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L18
  .line 810
    goto :L20
  :L19
  .line 809
    move-exception v1
  :L20
  .line 804
    return v0
.end method

.method public static atStart(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  .line 822
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Albums;->menuShown:Z
  .line 823
    sget-boolean v1, Lcom/innioasis/ipp/Albums;->scanToast:Z
    if-eqz v1, :L3
    if-eqz p0, :L3
  .line 824
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Albums;->scanToast:Z
  :L0
  .line 826
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const v3, 2131820998
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-object v3, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    invoke-virtual { v3 }, Lcom/innioasis/music/objects/Global;->getScanTotalCount()I
    move-result v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v3, 10
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 827
    const v4, 2131820855
    invoke-virtual { p0, v4 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-object v4, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    invoke-virtual { v4 }, Lcom/innioasis/music/objects/Global;->getScanNewAddedCount()I
    move-result v4
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 828
    const v3, 2131820667
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-object v3, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    invoke-virtual { v3 }, Lcom/innioasis/music/objects/Global;->getScanDeletedCount()I
    move-result v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  .line 826
    invoke-static { p0, v2, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
  .line 829
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L1
  .line 831
    goto :L3
  :L2
  .line 830
    move-exception p0
  :L3
  .line 833
    sget-boolean p0, Lcom/innioasis/ipp/Albums;->started:Z
    if-eqz p0, :L4
    return-void
  :L4
  .line 834
    sput-boolean v0, Lcom/innioasis/ipp/Albums;->started:Z
  .line 835
    sget-object p0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez p0, :L5
    const-wide/16 v0, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  :L5
  .line 836
    return-void
.end method

.method public static backAlbum()Ljava/lang/String;
  .registers 3
  .line 1479
    sget-object v0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1480
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 1481
    sput-object v1, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1482
    sget-object v2, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
    sput-object v2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1483
    sput-object v1, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1484
    return-object v0
.end method

.method public static backClose()Z
  .registers 2
  .line 1472
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1473
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1474
    return v0
.end method

.method public static bootReady()Z
  .catchall { :L2 .. :L7 } :L6
  .registers 8
  .line 544
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 545
    sget-wide v2, Lcom/innioasis/ipp/Albums;->bootAsked:J
    const/4 v4, 1
    const-wide/16 v5, 0
    cmp-long v7, v2, v5
    if-nez v7, :L0
  .line 546
    sput-wide v0, Lcom/innioasis/ipp/Albums;->bootAsked:J
  .line 547
    sput-boolean v4, Lcom/innioasis/ipp/Albums;->started:Z
  .line 548
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez v0, :L0
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  :L0
  .line 550
    invoke-static { }, Lcom/innioasis/ipp/Albums;->bootWaitOver()Z
    move-result v0
    if-eqz v0, :L1
    return v4
  :L1
  .line 551
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L2
  .line 552
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L3
    sget-object v2, Lcom/innioasis/ipp/Albums;->preparedFor:Ljava/util/List;
    if-ne v1, v2, :L3
    monitor-exit v0
    return v4
  :L3
  .line 555
    sget-object v1, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    invoke-virtual { v1 }, Lcom/innioasis/music/objects/Global;->getRefreshDatabaseState()Z
    move-result v1
    if-eqz v1, :L4
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez v1, :L4
    sget-object v1, Lcom/innioasis/ipp/Albums;->reader:Ljava/lang/Thread;
    if-nez v1, :L4
    goto :L5
  :L4
    const/4 v4, 0
  :L5
    monitor-exit v0
    return v4
  :L6
  .line 556
    move-exception v1
    monitor-exit v0
  :L7
    throw v1
.end method

.method public static bootWaitOver()Z
  .registers 5
  .line 561
    sget-wide v0, Lcom/innioasis/ipp/Albums;->bootAsked:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-eqz v4, :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sget-wide v2, Lcom/innioasis/ipp/Albums;->bootAsked:J
    sub-long/2addr v0, v2
    const-wide/16 v2, 30000
    cmp-long v4, v0, v2
    if-lez v4, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static byDate(I)Z
  .registers 2
  .line 529
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Asc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v0
    if-eq p0, v0, :L1
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Desc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
  .line 530
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v0
    if-ne p0, v0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
  .line 529
    return p0
.end method

.method public static byDisc(Ljava/util/List;)Ljava/util/List;
  .registers 3
  .line 1843
    if-eqz p0, :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L0
    goto :L1
  :L0
  .line 1844
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1845
    sget-object p0, Lcom/innioasis/ipp/Albums;->DISC_CMP:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1846
    return-object v0
  :L1
  .line 1843
    return-object p0
.end method

.method private static byYear(Ljava/util/ArrayList;)Ljava/util/List;
  .catchall { :L0 .. :L6 } :L7
  .registers 6
  :L0
  .line 1192
    invoke-static { }, Lcom/innioasis/ipp/Albums;->albumSortValue()I
    move-result v0
  .line 1193
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Desc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v1
    const/4 v2, 1
    const/4 v3, 0
    if-ne v0, v1, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 1194
    if-nez v1, :L3
    sget-object v4, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Asc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v4
    if-eq v0, v4, :L3
    return-object p0
  :L3
  .line 1195
    invoke-virtual { p0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-nez v0, :L4
    invoke-virtual { p0, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L4
    goto :L5
  :L4
    const/4 v2, 0
  :L5
  .line 1196
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    invoke-virtual { p0, v2, v0 }, Ljava/util/ArrayList;->subList(II)Ljava/util/List;
    move-result-object v0
  .line 1197
    invoke-static { v0 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  .line 1198
    new-instance v2, Lcom/innioasis/ipp/YearComparator;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/YearComparator;-><init>(Z)V
    invoke-static { v0, v2 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L6
  .line 1200
    goto :L8
  :L7
  .line 1199
    move-exception v0
  :L8
  .line 1201
    return-object p0
.end method

.method public static cacheCleared()V
  .registers 3
  .line 921
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 922
    if-nez v0, :L0
    return-void
  :L0
  .line 923
    const-string v1, "cache_n"
    const/4 v2, -1
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 924
    const-string v1, "cache_t"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 925
    const-string v1, "cache_v"
    const/4 v2, 0
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 926
    const-string v1, "cache_m"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 927
    return-void
.end method

.method public static cacheCleared(I)V
  .registers 4
  .line 931
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 932
    if-nez v0, :L0
    return-void
  :L0
  .line 933
    const/4 v1, 0
    const-string v2, "cache_m"
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    xor-int/lit8 p0, p0, -1
    and-int/2addr p0, v1
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 934
    return-void
.end method

.method public static cached(Landroid/content/Context;III)Z
  .registers 4
  .line 906
    if-eqz p3, :L0
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Albums;->cachedMask(Landroid/content/Context;II)I
    move-result p0
    and-int/2addr p0, p3
    if-ne p0, p3, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static cachedMask(Landroid/content/Context;II)I
  .registers 6
  .line 897
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 898
    const-string v1, "cache_n"
    const/4 v2, -1
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    if-ne v1, p1, :L2
  .line 899
    const-string p1, "cache_t"
    invoke-static { p0, p1, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p1
    if-ne p1, p2, :L2
  .line 900
    const-string p1, "cache_v"
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p1
    const/4 p2, 4
    if-eq p1, p2, :L1
    goto :L2
  :L1
  .line 901
    const-string p1, "cache_m"
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p0
    return p0
  :L2
  .line 900
    return v0
.end method

.method private static cmpLong(JJ)I
  .registers 5
  .line 1944
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
  .line 1939
    const-string v0, ""
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  :L1
  .line 1940
    if-nez p1, :L2
    goto :L3
  :L2
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  :L3
  .line 1941
    invoke-virtual { p0, v0 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method public static coverKey(Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 982
    if-eqz p0, :L9
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-eqz v0, :L9
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L9
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    goto :L9
  :L0
  .line 983
    sget-object v0, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
  .line 984
    if-nez v0, :L6
  .line 985
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 986
    if-nez v0, :L1
    return-object p0
  :L1
  .line 987
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 988
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 989
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L2
  .line 990
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L5
  .line 991
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
  .line 992
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
  .line 993
    instance-of v4, v3, Ljava/util/LinkedHashSet;
    if-nez v4, :L3
    goto :L2
  :L3
  .line 994
    check-cast v3, Ljava/util/LinkedHashSet;
  .line 995
    invoke-virtual { v3 }, Ljava/util/LinkedHashSet;->size()I
    move-result v4
    const/4 v5, 1
    if-eq v4, v5, :L4
    goto :L2
  :L4
  .line 996
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
  .line 997
    invoke-virtual { v3 }, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v2, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 998
    goto :L2
  :L5
  .line 999
    sput-object v1, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
    move-object v0, v1
  :L6
  .line 1001
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  .line 1002
    if-nez v0, :L7
    goto :L8
  :L7
    move-object p0, v0
    check-cast p0, Ljava/lang/String;
  :L8
    return-object p0
  :L9
  .line 982
    return-object p0
.end method

.method public static discNumber(Ljava/lang/String;)I
  .catchall { :L2 .. :L3 } :L4
  .registers 4
  .line 165
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 166
    sget-object v1, Lcom/innioasis/ipp/Albums;->CD_PAT:Ljava/util/regex/Pattern;
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v2 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object p0
  .line 167
    invoke-virtual { p0 }, Ljava/util/regex/Matcher;->find()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 168
    const/4 v1, 2
  :L2
    invoke-virtual { p0, v1 }, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result p0
  :L3
    return p0
  :L4
    move-exception p0
    return v0
.end method

.method public static discOf(Ljava/lang/String;)I
  .registers 2
  .line 159
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->discNumber(Ljava/lang/String;)I
    move-result v0
  .line 160
    if-lez v0, :L0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/DiscCache;->get(Ljava/lang/String;)I
    move-result v0
  :L1
    return v0
.end method

.method private static enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 98
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 3
  .line 101
    const-string v0, ""
    if-nez p0, :L0
    move-object p0, v0
  :L0
    if-nez p1, :L1
    move-object p1, v0
  :L1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method static firstPath(Ljava/lang/String;Z)Ljava/lang/String;
  .registers 12
  .line 1808
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L15
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L15
  :L0
  .line 1809
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1810
    if-nez v0, :L1
    return-object v1
  :L1
  .line 1811
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1812
    if-eqz p1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->onlyScoped(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    move-result-object p0
  :L2
  .line 1813
    nop
  .line 1814
    nop
  .line 1815
    nop
  .line 1816
    nop
  .line 1817
    nop
  .line 1818
    const/4 p1, 0
    move-object v3, v1
    move-object v4, v3
    move-object v5, v4
    const/4 v0, 0
    const/4 v2, 0
  :L3
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge p1, v6, :L12
  .line 1819
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1821
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
  .line 1822
    if-eqz v4, :L4
    invoke-virtual { v4, v7 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-nez v8, :L5
  :L4
  .line 1823
    nop
  .line 1824
    invoke-static { v7 }, Lcom/innioasis/ipp/Albums;->discNumber(Ljava/lang/String;)I
    move-result v0
    move-object v4, v7
  :L5
  .line 1826
    if-lez v0, :L6
    move v7, v0
    goto :L7
  :L6
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/DiscCache;->get(Ljava/lang/String;)I
    move-result v7
  :L7
  .line 1827
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object v8
    if-nez v8, :L8
    const-string v8, ""
    goto :L9
  :L8
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object v8
    sget-object v9, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v8, v9 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v8
  :L9
  .line 1828
    if-eqz v3, :L10
    if-lt v7, v2, :L10
    if-ne v7, v2, :L11
    invoke-virtual { v8, v5 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v9
    if-gez v9, :L11
  :L10
  .line 1829
    nop
  .line 1830
    nop
  .line 1831
    move-object v3, v6
    move v2, v7
    move-object v5, v8
  :L11
  .line 1818
    add-int/lit8 p1, p1, 1
    goto :L3
  :L12
  .line 1834
    if-nez v3, :L13
    goto :L14
  :L13
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L14
    return-object v1
  :L15
  .line 1808
    return-object v1
.end method

.method public static focus(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  .registers 6
  .line 1501
    sget-object v0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1502
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1503
    if-eqz v0, :L6
    if-nez p0, :L0
    goto :L6
  :L0
  .line 1504
    const/4 v1, 0
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
    if-ge v1, v2, :L5
  .line 1505
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  .line 1506
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v3, :L4
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L4
  .line 1507
    if-nez p1, :L2
  .line 1508
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
    goto :L3
  :L2
  .line 1510
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  :L3
  .line 1512
    return-void
  :L4
  .line 1504
    add-int/lit8 v1, v1, 1
    goto :L1
  :L5
  .line 1515
    return-void
  :L6
  .line 1503
    return-void
.end method

.method private static folderOf(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 93
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 94
    const/4 v1, 1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->indexOf(I)I
    move-result v2
  .line 95
    if-gez v2, :L1
    goto :L2
  :L1
    add-int/2addr v2, v1
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v0
  :L2
    return-object v0
.end method

.method private static foldersByName(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .registers 7
  .line 1140
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 1141
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 1142
    const/4 v2, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L6
  .line 1143
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1144
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L1
    const-string v4, ""
    goto :L2
  :L1
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v4
  :L2
  .line 1145
    invoke-virtual { v0, v4 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
  .line 1146
    if-nez v5, :L3
    const/4 v5, 0
    goto :L4
  :L3
    check-cast v5, Ljava/util/LinkedHashSet;
  :L4
  .line 1147
    if-nez v5, :L5
    new-instance v5, Ljava/util/LinkedHashSet;
    invoke-direct { v5 }, Ljava/util/LinkedHashSet;-><init>()V
    invoke-virtual { v0, v4, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 1148
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v5, v3 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  .line 1142
    add-int/lit8 v2, v2, 1
    goto :L0
  :L6
  .line 1150
    return-object v0
.end method

.method private static foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .catchall { :L0 .. :L2 } :L23
  .catchall { :L18 .. :L19 } :L20
  .catchall { :L21 .. :L22 } :L20
  .catchall { :L24 .. :L25 } :L23
  .registers 18
  .line 1010
    move-object/from16 v0, p0
    sget-object v1, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v1
  :L0
  .line 1011
    sget-object v2, Lcom/innioasis/ipp/Albums;->foldersFor:Ljava/util/List;
    if-ne v2, v0, :L1
    sget-object v2, Lcom/innioasis/ipp/Albums;->foldersMemo:Ljava/util/LinkedHashMap;
    if-eqz v2, :L1
    monitor-exit v1
    return-object v2
  :L1
  .line 1012
    monitor-exit v1
  :L2
  .line 1013
    new-instance v1, Ljava/util/LinkedHashMap;
    invoke-direct { v1 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 1014
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
  .line 1015
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 1018
    new-instance v5, Lcom/innioasis/ipp/Albums$Dirs;
    const/4 v6, 0
    invoke-direct { v5, v6 }, Lcom/innioasis/ipp/Albums$Dirs;-><init>(Lcom/innioasis/ipp/Albums$1;)V
  .line 1019
    new-instance v7, Ljava/util/HashMap;
    invoke-direct { v7 }, Ljava/util/HashMap;-><init>()V
  .line 1020
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8 }, Ljava/util/ArrayList;-><init>()V
  .line 1021
    new-instance v9, Ljava/util/ArrayList;
    invoke-direct { v9 }, Ljava/util/ArrayList;-><init>()V
  .line 1022
    const/4 v11, 0
  :L3
    invoke-interface/range { p0 .. p0 }, Ljava/util/List;->size()I
    move-result v12
    if-ge v11, v12, :L17
  .line 1023
    invoke-interface { v0, v11 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Lcom/innioasis/y1/database/Song;
  .line 1024
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v13
    if-nez v13, :L4
    const-string v13, ""
    goto :L5
  :L4
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v13
  :L5
  .line 1025
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v14
  .line 1026
    invoke-virtual { v5, v14 }, Lcom/innioasis/ipp/Albums$Dirs;->find(Ljava/lang/String;)I
    move-result v15
  .line 1027
    if-gez v15, :L7
  .line 1028
    invoke-static { v14 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v15
  .line 1029
    invoke-virtual { v7, v15 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v16
  .line 1030
    if-nez v16, :L6
  .line 1031
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result v16
    invoke-static/range { v16 .. v16 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
  .line 1032
    invoke-virtual { v7, v15, v6 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 1033
    invoke-virtual { v8, v15 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1034
    new-instance v15, Ljava/util/ArrayList;
    const/4 v10, 2
    invoke-direct { v15, v10 }, Ljava/util/ArrayList;-><init>(I)V
    invoke-virtual { v9, v15 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    move-object/from16 v16, v6
  :L6
  .line 1036
    check-cast v16, Ljava/lang/Integer;
    invoke-virtual/range { v16 .. v16 }, Ljava/lang/Integer;->intValue()I
    move-result v15
  .line 1037
    invoke-virtual { v5, v14, v15 }, Lcom/innioasis/ipp/Albums$Dirs;->add(Ljava/lang/String;I)V
  :L7
  .line 1039
    invoke-virtual { v9, v15 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/util/ArrayList;
  .line 1040
    nop
  .line 1041
    const/4 v10, 0
  :L8
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v14
    if-ge v10, v14, :L11
  .line 1042
    invoke-virtual { v6, v10 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v14
  .line 1043
    if-eq v14, v13, :L10
    invoke-virtual { v14, v13 }, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v14
    if-eqz v14, :L9
    goto :L10
  :L9
  .line 1041
    add-int/lit8 v10, v10, 2
    goto :L8
  :L10
  .line 1043
    add-int/lit8 v10, v10, 1
    invoke-virtual { v6, v10 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Ljava/util/ArrayList;
    goto :L12
  :L11
  .line 1041
    const/4 v10, 0
  :L12
  .line 1045
    if-nez v10, :L16
  .line 1046
    new-instance v10, Ljava/util/ArrayList;
    invoke-direct { v10 }, Ljava/util/ArrayList;-><init>()V
  .line 1047
    invoke-virtual { v6, v13 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1048
    invoke-virtual { v6, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1049
    invoke-virtual { v8, v15 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
  .line 1050
    invoke-virtual { v1, v13 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v14
  .line 1051
    if-nez v14, :L13
    const/4 v14, 0
    goto :L14
  :L13
    check-cast v14, Ljava/util/LinkedHashSet;
  :L14
  .line 1052
    if-nez v14, :L15
    new-instance v14, Ljava/util/LinkedHashSet;
    invoke-direct { v14 }, Ljava/util/LinkedHashSet;-><init>()V
    invoke-virtual { v1, v13, v14 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L15
  .line 1053
    invoke-virtual { v14, v6 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  .line 1054
    invoke-static { v13, v6 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v2, v6, v10 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L16
  .line 1056
    invoke-virtual { v10, v12 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1022
    add-int/lit8 v11, v11, 1
    const/4 v6, 0
    goto/16 :L3
  :L17
  .line 1058
    sget-object v6, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v6
  :L18
  .line 1059
    sput-object v0, Lcom/innioasis/ipp/Albums;->foldersFor:Ljava/util/List;
  .line 1060
    sput-object v1, Lcom/innioasis/ipp/Albums;->foldersMemo:Ljava/util/LinkedHashMap;
  .line 1061
    sput-object v2, Lcom/innioasis/ipp/Albums;->albumSongsMemo:Ljava/util/HashMap;
  .line 1062
    monitor-exit v6
  :L19
  .line 1063
    const-string v6, "ipplab"
    new-instance v7, Ljava/lang/StringBuilder;
    invoke-direct { v7 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v9, "foldersOf "
    invoke-virtual { v7, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-interface/range { p0 .. p0 }, Ljava/util/List;->size()I
    move-result v0
    invoke-virtual { v7, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v7, " songs, "
    invoke-virtual { v0, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget v5, v5, Lcom/innioasis/ipp/Albums$Dirs;->size:I
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v5, " dirs, "
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 1064
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result v5
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v5, " folders, "
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v2 }, Ljava/util/HashMap;->size()I
    move-result v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " albums, "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 1065
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
    sub-long/2addr v7, v3
    invoke-virtual { v0, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " ms"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 1063
    invoke-static { v6, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 1066
    return-object v1
  :L20
  .line 1062
    move-exception v0
  :L21
    monitor-exit v6
  :L22
    throw v0
  :L23
  .line 1012
    move-exception v0
  :L24
    monitor-exit v1
  :L25
    goto :L27
  :L26
    throw v0
  :L27
    goto :L26
.end method

.method public static genreMark(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 68
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v1, 3
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v0
    if-nez p0, :L0
    const-string p0, ""
  :L0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static invalidate()V
  .catchall { :L0 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 4
  .line 191
    const-string v0, "invalidate"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->who(Ljava/lang/String;)V
  .line 192
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 193
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sget-object v2, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
    if-eq v1, v2, :L1
    sget v1, Lcom/innioasis/ipp/Albums;->foreign:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Albums;->foreign:I
  :L1
  .line 194
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L2
  .line 195
    sput-object v1, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
  .line 196
    sget-wide v1, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    sput-wide v1, Lcom/innioasis/ipp/Albums;->prevAt:J
  .line 197
    sget-object v1, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
    sput-object v1, Lcom/innioasis/ipp/Albums;->prevSig:Ljava/lang/String;
  .line 198
    sget-object v1, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
    sput-object v1, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
  .line 199
    sget-object v1, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
    sput-object v1, Lcom/innioasis/ipp/Albums;->sortedPrevType:Ljava/lang/Object;
  :L2
  .line 201
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 202
    const-wide/16 v2, 0
    sput-wide v2, Lcom/innioasis/ipp/Albums;->songCacheAt:J
  .line 203
    sput-object v1, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
  .line 204
    sget v2, Lcom/innioasis/ipp/Albums;->songGen:I
    add-int/lit8 v2, v2, 1
    sput v2, Lcom/innioasis/ipp/Albums;->songGen:I
  .line 205
    sput-object v1, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 206
    monitor-exit v0
  :L3
  .line 207
    sput-object v1, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
  .line 208
    invoke-static { }, Lcom/innioasis/ipp/Find;->clear()V
  .line 209
    const-wide/16 v0, 2000
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  .line 210
    return-void
  :L4
  .line 206
    move-exception v1
  :L5
    monitor-exit v0
  :L6
    throw v1
.end method

.method public static isAllSongs(Ljava/lang/String;)Z
  .registers 3
  .line 54
    const/4 v0, 0
    if-eqz p0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result p0
    const/4 v1, 2
    if-ne p0, v1, :L0
    const/4 v0, 1
  :L0
    return v0
.end method

.method public static isAllSongsList()Z
  .registers 1
  .line 1776
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->allList:Z
    return v0
.end method

.method private static isCdFolder(Ljava/lang/String;)Z
  .registers 1
  .line 151
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->discNumber(Ljava/lang/String;)I
    move-result p0
    if-lez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static isEnc(Ljava/lang/String;)Z
  .registers 2
  .line 82
    if-eqz p0, :L0
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result p0
    if-ltz p0, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method public static isGenreAll(Ljava/lang/String;)Z
  .registers 3
  .line 79
    const/4 v0, 0
    if-eqz p0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result p0
    const/4 v1, 3
    if-ne p0, v1, :L0
    const/4 v0, 1
  :L0
    return v0
.end method

.method private static keep(Z)V
  .catchall { :L0 .. :L3 } :L6
  .catchall { :L4 .. :L7 } :L6
  .registers 6
  .line 492
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 493
    sget-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 494
    const/4 v2, 0
    sput-object v2, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 495
    sput-object v2, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
  .line 496
    if-eqz p0, :L5
    if-eqz v1, :L5
    sget p0, Lcom/innioasis/ipp/Albums;->foreign:I
    sget v3, Lcom/innioasis/ipp/Albums;->markForeign:I
    if-eq p0, v3, :L1
    goto :L5
  :L1
  .line 497
    sget-object p0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez p0, :L4
    sget-object p0, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
    if-eq p0, v1, :L2
    goto :L4
  :L2
  .line 498
    sput-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 499
    sget-wide v3, Lcom/innioasis/ipp/Albums;->prevAt:J
    sput-wide v3, Lcom/innioasis/ipp/Albums;->songCacheAt:J
  .line 500
    sget-object p0, Lcom/innioasis/ipp/Albums;->prevSig:Ljava/lang/String;
    sput-object p0, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
  .line 501
    sget-object p0, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
    sput-object p0, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 502
    sget-object p0, Lcom/innioasis/ipp/Albums;->sortedPrevType:Ljava/lang/Object;
    sput-object p0, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
  .line 503
    sput-object v2, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
  .line 504
    sput-object v2, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
  .line 505
    monitor-exit v0
  :L3
  .line 506
    const-string p0, "library scan: nothing written, the list in memory is kept"
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 507
    return-void
  :L4
  .line 497
    monitor-exit v0
    return-void
  :L5
  .line 496
    monitor-exit v0
    return-void
  :L6
  .line 505
    move-exception p0
    monitor-exit v0
  :L7
    throw p0
.end method

.method private static keepNames(Ljava/util/List;ZLjava/util/List;)V
  .catchall { :L1 .. :L4 } :L3
  .registers 5
  .line 1626
    if-eqz p0, :L5
    if-nez p2, :L0
    goto :L5
  :L0
  .line 1627
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L1
  .line 1628
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loaded()Ljava/util/List;
    move-result-object v1
    if-eq v1, p0, :L2
    monitor-exit v0
    return-void
  :L2
  .line 1629
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Albums;->namesFor:Ljava/lang/ref/WeakReference;
  .line 1630
    sput-boolean p1, Lcom/innioasis/ipp/Albums;->namesRev:Z
  .line 1631
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, p2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    sput-object p0, Lcom/innioasis/ipp/Albums;->namesMemo:Ljava/util/List;
  .line 1632
    monitor-exit v0
  .line 1633
    return-void
  :L3
  .line 1632
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
  :L5
  .line 1626
    return-void
.end method

.method public static keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 2
  .line 106
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 107
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L1
    const-string v0, ""
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 108
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static keyOf(Lcom/innioasis/y1/database/Song;Ljava/util/HashMap;)Ljava/lang/String;
  .registers 3
  .line 113
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 114
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L1
    const-string v0, ""
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 115
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static later(Ljava/lang/Runnable;J)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 237
    invoke-static { }, Lcom/innioasis/ipp/Albums;->worker()Landroid/os/Handler;
    move-result-object v0
    invoke-virtual { v0, p0, p1, p2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 239
    goto :L3
  :L2
  .line 238
    move-exception p0
  :L3
  .line 240
    return-void
.end method

.method public static levelFor(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 1314
    sget-object v0, Lcom/innioasis/ipp/Albums;->listKey:Ljava/lang/String;
  .line 1315
    const/4 v1, 0
    if-eqz v0, :L3
    if-nez p0, :L0
    goto :L3
  :L0
  .line 1316
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L1
    goto :L2
  :L1
    move-object v0, v1
  :L2
    return-object v0
  :L3
  .line 1315
    return-object v1
.end method

.method public static listForView(Ljava/util/List;Landroid/app/Activity;)Ljava/util/List;
  .registers 9
  .line 1155
    nop
  .line 1156
    const/4 v0, 0
    if-eqz p1, :L0
  .line 1157
    invoke-virtual { p1 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p1
  .line 1158
    if-eqz p1, :L0
    const-string v1, "ipp_artist"
    invoke-virtual { p1, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    goto :L1
  :L0
  .line 1160
    move-object p1, v0
  :L1
    sput-object p1, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1161
    const/4 v1, 0
    if-eqz p1, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
    sput-boolean v2, Lcom/innioasis/ipp/Albums;->artistList:Z
  .line 1162
    if-nez p1, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->split(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L4
  .line 1164
    if-nez p0, :L5
    return-object p0
  :L5
  .line 1167
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Artists;->forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
  .line 1168
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "artist forMenu "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    if-nez v0, :L6
    const/4 v3, -1
    goto :L7
  :L6
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
  :L7
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1169
    if-eqz v0, :L17
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L8
    goto/16 :L17
  :L8
  .line 1170
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersByName(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v2
  .line 1171
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "artist folders "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v2 }, Ljava/util/LinkedHashMap;->size()I
    move-result v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " names of "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1172
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 1173
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L9
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->allMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v3, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L9
  .line 1174
    const/4 p1, 0
  :L10
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-ge p1, v0, :L16
  .line 1175
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
  .line 1176
    if-nez v0, :L11
    const-string v4, ""
    goto :L12
  :L11
    move-object v4, v0
  :L12
    invoke-virtual { v2, v4 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
  .line 1177
    if-nez v4, :L13
    goto :L15
  :L13
  .line 1178
    new-instance v5, Ljava/util/ArrayList;
    check-cast v4, Ljava/util/LinkedHashSet;
    invoke-direct { v5, v4 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1179
    sget-object v4, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v5, v4 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1180
    const/4 v4, 0
  :L14
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v4, v6, :L15
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
    invoke-static { v0, v6 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v3, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v4, v4, 1
    goto :L14
  :L15
  .line 1174
    add-int/lit8 p1, p1, 1
    goto :L10
  :L16
  .line 1182
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string p1, "artist rows "
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1183
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->byYear(Ljava/util/ArrayList;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L17
  .line 1169
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
.end method

.method private static lists()V
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L6 .. :L7 } :L5
  .registers 4
  .line 511
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 512
    if-nez v0, :L0
    return-void
  :L0
  .line 513
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .line 514
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->index(Ljava/util/List;)V
  .line 515
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 516
    if-nez v1, :L1
    return-void
  :L1
  .line 517
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Albums;->prepareAlbums(Lcom/innioasis/y1/database/Y1Repository;Ljava/util/List;)V
  .line 518
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    sget-object v3, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 519
    invoke-virtual { v3 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAllSong()I
    move-result v3
  .line 518
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object v2
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Albums;->songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .line 520
    const/4 v1, 0
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->sortValue(Z)I
    move-result v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->byDate(I)Z
    move-result v1
    if-eqz v1, :L2
  .line 521
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
    move-result-object v1
  .line 522
    if-eqz v1, :L2
    new-instance v2, Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    move-result-object v1
    invoke-direct { v2, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { v2 }, Lcom/innioasis/ipp/YearCache;->prepare(Ljava/util/List;)V
  :L2
  .line 524
    sget-object v1, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v1
  :L3
    sput-object v0, Lcom/innioasis/ipp/Albums;->preparedFor:Ljava/util/List;
    monitor-exit v1
  :L4
  .line 525
    invoke-static { }, Lcom/innioasis/ipp/Lab;->reads()V
  .line 526
    return-void
  :L5
  .line 524
    move-exception v0
  :L6
    monitor-exit v1
  :L7
    throw v0
.end method

.method public static loadNow()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 455
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->menuShown:Z
    if-nez v0, :L0
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Albums;->scanToast:Z
  :L0
  .line 457
    invoke-static { }, Lcom/innioasis/ipp/Scan;->clean()Z
    move-result v0
  .line 458
    invoke-static { }, Lcom/innioasis/ipp/Scan;->done()V
  .line 459
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->keep(Z)V
  .line 460
    invoke-static { }, Lcom/innioasis/ipp/Albums;->lists()V
  .line 461
    invoke-static { }, Lcom/innioasis/ipp/Schema;->backfill()V
  :L1
  .line 463
    goto :L3
  :L2
  .line 462
    move-exception v0
  :L3
  .line 464
    return-void
.end method

.method static loaded()Ljava/util/List;
  .registers 1
  .line 938
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    return-object v0
.end method

.method static lowerEq(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 10
  .line 776
    const/4 v0, 1
    const/4 v1, 0
    if-eqz p0, :L12
    if-nez p1, :L0
    goto :L12
  :L0
  .line 777
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v3
    if-eq v2, v3, :L1
    return v1
  :L1
  .line 778
    sget v2, Lcom/innioasis/ipp/Albums;->unicodeLower:I
    if-gez v2, :L2
    invoke-static { }, Lcom/innioasis/ipp/Albums;->askLower()I
    move-result v2
    sput v2, Lcom/innioasis/ipp/Albums;->unicodeLower:I
  :L2
  .line 779
    sget v2, Lcom/innioasis/ipp/Albums;->unicodeLower:I
    if-ne v2, v0, :L3
    const/4 v2, 1
    goto :L4
  :L3
    const/4 v2, 0
  :L4
  .line 780
    const/4 v3, 0
  :L5
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v4
    if-ge v3, v4, :L11
  .line 781
    invoke-virtual { p0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result v4
  .line 782
    invoke-virtual { p1, v3 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 783
    if-ne v4, v5, :L6
    goto :L10
  :L6
  .line 784
    if-eqz v2, :L7
  .line 785
    invoke-static { v4 }, Ljava/lang/Character;->toLowerCase(C)C
    move-result v4
    invoke-static { v5 }, Ljava/lang/Character;->toLowerCase(C)C
    move-result v5
    if-eq v4, v5, :L10
    return v1
  :L7
  .line 787
    const/16 v6, 90
    const/16 v7, 65
    if-lt v4, v7, :L8
    if-gt v4, v6, :L8
    add-int/lit8 v4, v4, 32
    int-to-char v4, v4
  :L8
  .line 788
    if-lt v5, v7, :L9
    if-gt v5, v6, :L9
    add-int/lit8 v5, v5, 32
    int-to-char v5, v5
  :L9
  .line 789
    if-eq v4, v5, :L10
    return v1
  :L10
  .line 780
    add-int/lit8 v3, v3, 1
    goto :L5
  :L11
  .line 792
    return v0
  :L12
  .line 776
    if-ne p0, p1, :L13
    goto :L14
  :L13
    const/4 v0, 0
  :L14
    return v0
.end method

.method private static matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
  .registers 7
  .line 1715
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
    move-result-object v0
  .line 1716
    if-eqz v0, :L4
  .line 1717
    const-string p0, ""
    if-nez p1, :L0
    move-object p1, p0
  :L0
    if-nez p2, :L1
    move-object p2, p0
  :L1
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 1718
    if-nez p0, :L2
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    goto :L3
  :L2
    new-instance p1, Ljava/util/ArrayList;
    check-cast p0, Ljava/util/ArrayList;
    invoke-direct { p1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    move-object p0, p1
  :L3
    return-object p0
  :L4
  .line 1720
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1721
    const/4 v1, 0
  :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L7
  .line 1722
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1723
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/Albums;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L6
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p2 }, Lcom/innioasis/ipp/Albums;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L6
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 1721
    add-int/lit8 v1, v1, 1
    goto :L5
  :L7
  .line 1725
    return-object v0
.end method

.method static mirror(Ljava/util/List;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 8
  .line 748
    if-eqz p0, :L7
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->pairOf(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object v0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 749
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 750
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, v0 }, Ljava/util/ArrayList;-><init>(I)V
  .line 751
    nop
  :L1
  .line 752
    if-lez v0, :L6
  .line 753
    add-int/lit8 v2, v0, -1
    move v3, v2
  :L2
  .line 754
    if-lez v3, :L3
    add-int/lit8 v4, v3, -1
    invoke-interface { p0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-static { v4, v5, p1 }, Lcom/innioasis/ipp/Albums;->sameKey(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Z
    move-result v4
    if-eqz v4, :L3
    add-int/lit8 v3, v3, -1
    goto :L2
  :L3
  .line 755
    move v2, v3
  :L4
    if-ge v2, v0, :L5
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v2, v2, 1
    goto :L4
  :L5
  .line 756
    nop
  .line 757
    move v0, v3
    goto :L1
  :L6
  .line 758
    return-object v1
  :L7
  .line 748
    const/4 p0, 0
    return-object p0
.end method

.method public static noteAlbumList(Landroid/app/Activity;)V
  .registers 1
  .line 1259
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->artistView(Landroid/app/Activity;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->artistList:Z
  .line 1260
    return-void
.end method

.method public static noteAlbumSort(I)V
  .registers 3
  .line 1287
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->artistList:Z
    if-eqz v0, :L1
  .line 1288
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 1289
    if-eqz v0, :L0
    const-string v1, "artist_album_sort"
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L0
  .line 1290
    return-void
  :L1
  .line 1292
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAlbum(I)V
  .line 1293
    return-void
.end method

.method public static noteCached(Landroid/content/Context;III)V
  .registers 6
  .line 911
    if-nez p0, :L0
    return-void
  :L0
  .line 912
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Albums;->cachedMask(Landroid/content/Context;II)I
    move-result v0
  .line 913
    const-string v1, "cache_n"
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 914
    const-string p1, "cache_t"
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 915
    const-string p1, "cache_v"
    const/4 p2, 4
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 916
    const-string p1, "cache_m"
    or-int p2, v0, p3
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 917
    return-void
.end method

.method public static noteListAlbum(Ljava/lang/String;)V
  .registers 1
  .line 1781
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->allList:Z
  .line 1782
    return-void
.end method

.method public static noteListScroll(Landroid/widget/ListView;Ljava/lang/Object;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 1525
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1527
    if-eqz p0, :L7
  :L0
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    goto :L7
  :L1
  .line 1528
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 1529
    if-nez v2, :L2
    goto :L3
  :L2
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v1
  :L3
    sput v1, Lcom/innioasis/ipp/Albums;->listTop:I
  .line 1530
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1531
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Albums;->listPos:I
  :L4
  .line 1534
    goto :L6
  :L5
  .line 1532
    move-exception p0
  .line 1533
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  :L6
  .line 1535
    return-void
  :L7
  .line 1527
    return-void
.end method

.method public static noteReturn(Ljava/lang/String;)V
  .registers 1
  .line 1466
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1467
    sget-object p0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1468
    return-void
.end method

.method public static noteSort(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
  .registers 3
  .line 1335
    if-nez p1, :L0
    return-void
  :L0
  .line 1336
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p1
  .line 1337
    sput p1, Lcom/innioasis/ipp/Albums;->songSort:I
  .line 1338
    sput-object p0, Lcom/innioasis/ipp/Albums;->listKey:Ljava/lang/String;
  .line 1339
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L2
  .line 1340
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 1341
    if-eqz p0, :L1
    const-string v0, "all_sort"
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 1342
    return-void
  :L2
  .line 1344
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAlbumSong(I)V
  .line 1345
    return-void
.end method

.method private static odd(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 437
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    xor-int/lit8 p0, p0, 1
    return p0
.end method

.method private static one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 441
    if-nez p1, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 442
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
  .line 443
    if-nez v0, :L1
  .line 444
    invoke-virtual { p0, p1, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 445
    return-object p1
  :L1
  .line 447
    return-object v0
.end method

.method private static onlyScoped(Ljava/util/ArrayList;)Ljava/util/ArrayList;
  .registers 6
  .line 1756
    sget-object v0, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1757
    if-eqz v0, :L7
    invoke-virtual { p0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L7
    invoke-static { }, Lcom/innioasis/ipp/Albums;->scopeEnabled()Z
    move-result v1
    if-nez v1, :L0
    goto :L7
  :L0
  .line 1759
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    return-object p0
  :L1
  .line 1760
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1761
    const/4 v2, 0
  :L2
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 1762
    invoke-virtual { p0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1763
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L3
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1761
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 1766
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L5
    goto :L6
  :L5
    move-object p0, v1
  :L6
    return-object p0
  :L7
  .line 1757
    return-object p0
.end method

.method public static openAlbumFrom(Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 4
  .line 1455
    if-nez p0, :L0
    return-void
  :L0
  .line 1456
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->openTarget(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
    move-result-object p1
  .line 1457
    if-nez p1, :L1
    return-void
  :L1
  .line 1458
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1459
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 1460
    const-string v1, "ipp_open_album"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1461
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 1462
    return-void
.end method

.method public static openAlbumName(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 3
  .line 1431
    if-eqz p0, :L1
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1432
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    const/4 v0, 0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Albums;->openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .line 1433
    return-void
  :L1
  .line 1431
    return-void
.end method

.method public static openAlbumOfSong(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;)V
  .registers 3
  .line 1437
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 1438
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Albums;->openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .line 1439
    return-void
  :L1
  .line 1437
    return-void
.end method

.method public static openArtistFrom(Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 3
  .line 1392
    sget-object v0, Lcom/innioasis/ipp/Albums;->songDlg:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Artists;->openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p0
    return p0
.end method

.method private static openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 1442
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1443
    sput-object p2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1444
    const/4 p2, 1
    sput-boolean p2, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1445
    const/4 p2, 0
    sput-object p2, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1446
    sput-object p2, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1447
    sput-object p2, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1448
    new-instance p2, Landroid/content/Intent;
    const-class v0, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { p2, p0, v0 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 1449
    const-string v0, "ipp_open_album"
    invoke-virtual { p2, v0, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1450
    invoke-virtual { p0, p2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 1451
    return-void
  :L1
  .line 1442
    return-void
.end method

.method public static openRequest(Landroid/app/Activity;)Ljava/lang/String;
  .catchall { :L0 .. :L5 } :L2
  .registers 3
  .line 1490
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-nez v1, :L1
    goto :L3
  :L1
  .line 1491
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_open_album"
    invoke-virtual { p0, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    goto :L4
  :L2
  .line 1494
    move-exception p0
    goto :L6
  :L3
  .line 1491
    move-object p0, v0
  :L4
  .line 1492
    if-nez p0, :L7
    sput-object v0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  :L5
    goto :L7
  :L6
  .line 1495
    return-object v0
  :L7
  .line 1493
    return-object p0
.end method

.method public static openTarget(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
  .registers 5
  .line 1407
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 1408
    nop
  .line 1409
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 1410
    const/4 v2, 0
    if-eqz v1, :L1
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-nez v3, :L1
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v3
    goto :L2
  :L1
  .line 1411
    move-object v3, v0
  :L2
    if-nez v3, :L3
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v3
  :L3
  .line 1412
    instance-of p0, v3, Lcom/innioasis/y1/database/Song;
    if-nez p0, :L4
    return-object v0
  :L4
  .line 1413
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1414
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
  .line 1415
    if-nez p0, :L5
    return-object v0
  :L5
  .line 1416
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    sput-object v3, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1417
    sput-boolean v2, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1418
    sput-object v0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1419
    sput-object v0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1421
    sput-object v0, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1422
    if-eqz v1, :L6
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L6
  .line 1423
    return-object p0
.end method

.method private static orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
  .registers 2
  .line 643
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L0
    const-string p0, "lower(pinyinName)"
    return-object p0
  :L0
  .line 644
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L1
    const-string p0, "lower(pinyinName) desc"
    return-object p0
  :L1
  .line 645
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L2
    const-string p0, "fileDate"
    return-object p0
  :L2
  .line 646
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L3
    const-string p0, "fileDate desc"
    return-object p0
  :L3
  .line 647
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L4
    const-string p0, "lower(pinyinSongName) asc"
    return-object p0
  :L4
  .line 648
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L5
    const-string p0, "lower(pinyinSongName) desc"
    return-object p0
  :L5
  .line 649
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L6
    const-string p0, "lower(pinyinAlbum) desc"
    return-object p0
  :L6
  .line 650
    const/4 p0, 0
    return-object p0
.end method

.method private static orderNow()Ljava/lang/Object;
  .registers 2
  .line 566
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 567
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result v1
    if-eqz v1, :L2
  .line 568
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L1
  :L0
  .line 569
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L1
  .line 568
    return-object v0
  :L2
  .line 571
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    if-eqz v0, :L3
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L4
  :L3
  .line 572
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L4
  .line 571
    return-object v0
.end method

.method static ordered(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .catchall { :L1 .. :L5 } :L28
  .catchall { :L5 .. :L6 } :L27
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L11 .. :L15 } :L27
  .catchall { :L16 .. :L17 } :L18
  .catchall { :L20 .. :L21 } :L27
  .catchall { :L23 .. :L24 } :L25
  .catchall { :L30 .. :L31 } :L32
  .registers 8
  .line 659
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
    move-result-object p0
  .line 660
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 661
    const/4 v1, 0
    if-eqz p0, :L34
    if-nez v0, :L0
    goto/16 :L34
  :L0
  .line 662
    nop
  :L1
  .line 664
    new-instance v2, Ljava/util/HashMap;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    mul-int/lit8 v3, v3, 2
    invoke-direct { v2, v3 }, Ljava/util/HashMap;-><init>(I)V
  .line 665
    const/4 v3, 0
    const/4 v4, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 666
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 667
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-eqz v6, :L3
    move-object v6, v5
    check-cast v6, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v2, v6, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 665
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 669
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v4
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "select path from song where isAudiobook = 0 order by "
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v4, p0, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object p0
  :L5
  .line 670
    invoke-interface { p0 }, Landroid/database/Cursor;->getCount()I
    move-result v4
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v5
  :L6
    if-eq v4, v5, :L11
  .line 681
    if-eqz p0, :L10
  :L7
  .line 683
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L8
  .line 685
    goto :L10
  :L9
  .line 684
    move-exception p0
  :L10
  .line 670
    return-object v1
  :L11
  .line 671
    new-instance v4, Ljava/util/ArrayList;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    invoke-direct { v4, v0 }, Ljava/util/ArrayList;-><init>(I)V
  :L12
  .line 672
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v0
    if-eqz v0, :L22
  .line 673
    invoke-interface { p0, v3 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v0
    if-eqz v0, :L13
    move-object v0, v1
    goto :L14
  :L13
    invoke-interface { p0, v3 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
  :L14
    invoke-virtual { v2, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  :L15
  .line 674
    if-nez v0, :L20
  .line 681
    if-eqz p0, :L19
  :L16
  .line 683
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L17
  .line 685
    goto :L19
  :L18
  .line 684
    move-exception p0
  :L19
  .line 674
    return-object v1
  :L20
  .line 675
    invoke-virtual { v4, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L21
  .line 676
    goto :L12
  :L22
  .line 677
    nop
  .line 681
    if-eqz p0, :L26
  :L23
  .line 683
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L24
  .line 685
    goto :L26
  :L25
  .line 684
    move-exception p0
  :L26
  .line 677
    return-object v4
  :L27
  .line 678
    move-exception v0
    goto :L29
  :L28
    move-exception p0
    move-object p0, v1
  :L29
  .line 679
    nop
  .line 681
    if-eqz p0, :L33
  :L30
  .line 683
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L31
  .line 685
    goto :L33
  :L32
  .line 684
    move-exception p0
  :L33
  .line 679
    return-object v1
  :L34
  .line 661
    return-object v1
.end method

.method static pairOf(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  .registers 2
  .line 733
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L0
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L0
  .line 734
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L1
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L1
  .line 735
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L2
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L2
  .line 736
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L3
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L3
  .line 737
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L4
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L4
  .line 738
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L5
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L5
  .line 739
    const/4 p0, 0
    return-object p0
.end method

.method private static prepareAlbums(Lcom/innioasis/y1/database/Y1Repository;Ljava/util/List;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 7
  :L0
  .line 1638
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 1639
    sget-object v2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAlbum()I
    move-result v2
    sget-object v3, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v3
    const/4 v4, 0
    if-ne v2, v3, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 1640
    if-eqz v2, :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object p0
    invoke-interface { p0, v4 }, Lcom/innioasis/y1/database/SongDao;->getAlbumsReverseSync(I)Ljava/util/List;
    move-result-object p0
    goto :L4
  :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object p0
    invoke-interface { p0, v4 }, Lcom/innioasis/y1/database/SongDao;->getAlbumsSync(I)Ljava/util/List;
    move-result-object p0
  :L4
  .line 1641
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 1642
    invoke-static { p1, v2, p0 }, Lcom/innioasis/ipp/Albums;->keepNames(Ljava/util/List;ZLjava/util/List;)V
  .line 1643
    if-eqz p0, :L5
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->splitRows(Ljava/util/List;Ljava/util/List;)Ljava/util/ArrayList;
  :L5
  .line 1644
    const-string p0, "ipplab"
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "prepare albums: names "
    invoke-virtual { p1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    sub-long v0, v3, v0
    invoke-virtual { p1, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, " ms, split "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
  .line 1645
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sub-long/2addr v0, v3
    invoke-virtual { p1, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, " ms"
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
  .line 1644
    invoke-static { p0, p1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L6
  .line 1647
    goto :L8
  :L7
  .line 1646
    move-exception p0
  :L8
  .line 1648
    return-void
.end method

.method private static readOnce()Ljava/util/List;
  .catchall { :L0 .. :L1 } :L19
  .catch Ljava/lang/InterruptedException; { :L2 .. :L3 } :L4
  .catchall { :L2 .. :L3 } :L19
  .catchall { :L5 .. :L7 } :L19
  .catchall { :L8 .. :L9 } :L13
  .catchall { :L10 .. :L12 } :L11
  .catchall { :L14 .. :L15 } :L16
  .catchall { :L17 .. :L18 } :L16
  .catchall { :L20 .. :L21 } :L19
  .registers 3
  .line 945
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 946
    sget-object v1, Lcom/innioasis/ipp/Albums;->reader:Ljava/lang/Thread;
    if-eqz v1, :L5
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v2
  :L1
    if-eq v1, v2, :L5
  :L2
  .line 948
    sget-object v1, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    invoke-virtual { v1 }, Ljava/lang/Object;->wait()V
  :L3
  .line 951
    goto :L0
  :L4
  .line 949
    move-exception v1
  .line 950
    nop
  :L5
  .line 953
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L6
    monitor-exit v0
    return-object v1
  :L6
  .line 954
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Albums;->reader:Ljava/lang/Thread;
  .line 955
    monitor-exit v0
  :L7
  .line 957
    const/4 v0, 0
  :L8
    invoke-static { }, Lcom/innioasis/ipp/Albums;->readSongs()Ljava/util/List;
    move-result-object v1
  :L9
  .line 959
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L10
  .line 960
    sput-object v0, Lcom/innioasis/ipp/Albums;->reader:Ljava/lang/Thread;
  .line 961
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 962
    monitor-exit v2
  .line 957
    return-object v1
  :L11
  .line 962
    move-exception v0
    monitor-exit v2
  :L12
    throw v0
  :L13
  .line 959
    move-exception v1
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L14
  .line 960
    sput-object v0, Lcom/innioasis/ipp/Albums;->reader:Ljava/lang/Thread;
  .line 961
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 962
    monitor-exit v2
  :L15
  .line 963
    throw v1
  :L16
  .line 962
    move-exception v0
  :L17
    monitor-exit v2
  :L18
    throw v0
  :L19
  .line 955
    move-exception v1
  :L20
    monitor-exit v0
  :L21
    goto :L23
  :L22
    throw v1
  :L23
    goto :L22
.end method

.method private static readSongs()Ljava/util/List;
  .catchall { :L1 .. :L2 } :L26
  .catchall { :L14 .. :L21 } :L23
  .catchall { :L24 .. :L25 } :L23
  .catchall { :L27 .. :L28 } :L26
  .registers 13
  .line 244
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 245
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 247
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L1
    sget v3, Lcom/innioasis/ipp/Albums;->songGen:I
    monitor-exit v2
  :L2
  .line 248
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 249
    invoke-static { }, Lcom/innioasis/ipp/Albums;->orderNow()Ljava/lang/Object;
    move-result-object v2
  .line 250
    invoke-static { }, Lcom/innioasis/ipp/Albums;->tableSig()Ljava/lang/String;
    move-result-object v6
  .line 251
    const-string v7, "full read"
    invoke-static { v7 }, Lcom/innioasis/ipp/Lab;->who(Ljava/lang/String;)V
  .line 252
    nop
  .line 255
    const/4 v7, 0
    move-object v9, v1
    const/4 v8, 0
  :L3
    const/4 v10, 3
    if-ge v8, v10, :L5
    if-nez v9, :L5
    if-eqz v2, :L5
  .line 256
    if-lez v8, :L4
    invoke-static { }, Lcom/innioasis/ipp/Albums;->tableSig()Ljava/lang/String;
    move-result-object v6
  :L4
  .line 257
    move-object v9, v2
    check-cast v9, Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { v9, v6 }, Lcom/innioasis/ipp/Albums;->readTable(Lcom/innioasis/y1/database/Y1Repository$SongSortType;Ljava/lang/String;)Ljava/util/List;
    move-result-object v9
  .line 255
    add-int/lit8 v8, v8, 1
    goto :L3
  :L5
  .line 259
    const-string v8, "ipplab"
    new-instance v10, Ljava/lang/StringBuilder;
    invoke-direct { v10 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v11, "portions "
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    if-eqz v9, :L6
    const/4 v11, 1
    goto :L7
  :L6
    const/4 v11, 0
  :L7
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v10
    const-string v11, " "
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v11
    sub-long/2addr v11, v4
    invoke-virtual { v10, v11, v12 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v10
    const-string v11, " ms"
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-virtual { v10 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v10
    invoke-static { v8, v10 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 260
    if-eqz v9, :L8
    invoke-static { v9 }, Lcom/innioasis/ipp/Lab;->compareRead(Ljava/util/List;)V
  :L8
  .line 261
    if-nez v9, :L9
    invoke-virtual { v0, v7 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v9
  :L9
  .line 262
    invoke-static { }, Lcom/innioasis/ipp/Albums;->orderNow()Ljava/lang/Object;
    move-result-object v0
    if-eq v2, v0, :L10
    move-object v2, v1
  :L10
  .line 263
    const-string v0, "library read"
    invoke-static { v0, v4, v5 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 264
    const-string v0, "ipplab"
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct { v8 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v10, "full read "
    invoke-virtual { v8, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    if-nez v9, :L11
    goto :L12
  :L11
    invoke-interface { v9 }, Ljava/util/List;->size()I
    move-result v7
  :L12
    invoke-virtual { v8, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v8, " rows "
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v10
    sub-long/2addr v10, v4
    invoke-virtual { v7, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " ms"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static { v0, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 265
    if-nez v9, :L13
    return-object v1
  :L13
  .line 266
    nop
  .line 267
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L14
  .line 268
    sget v4, Lcom/innioasis/ipp/Albums;->songGen:I
    if-eq v3, v4, :L15
    monitor-exit v0
    return-object v9
  :L15
  .line 269
    sget-object v3, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v3, :L16
    monitor-exit v0
    return-object v3
  :L16
  .line 270
    sget-object v3, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
    if-eqz v3, :L17
    invoke-interface { v3, v9 }, Ljava/util/List;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L17
    sget-object v3, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
    goto :L18
  :L17
  .line 271
    move-object v3, v9
  :L18
    sput-object v1, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
  .line 272
    sput-object v1, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
  .line 275
    sget-object v4, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
    if-eq v3, v4, :L20
    sget-object v4, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
    if-eqz v4, :L19
    move-object v1, v3
  :L19
    sput-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  :L20
  .line 276
    sput-object v2, Lcom/innioasis/ipp/Albums;->songOrder:Ljava/lang/Object;
  .line 277
    sput-object v3, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 278
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Albums;->songCacheAt:J
  .line 279
    sput-object v6, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
  .line 280
    monitor-exit v0
  :L21
  .line 281
    if-ne v3, v9, :L22
  .line 282
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->share(Ljava/util/List;)V
  .line 283
    invoke-static { }, Lcom/innioasis/ipp/Albums;->reserve()V
  :L22
  .line 285
    return-object v3
  :L23
  .line 280
    move-exception v1
  :L24
    monitor-exit v0
  :L25
    throw v1
  :L26
  .line 247
    move-exception v0
  :L27
    monitor-exit v2
  :L28
    goto :L30
  :L29
    throw v0
  :L30
    goto :L29
.end method

.method private static readTable(Lcom/innioasis/y1/database/Y1Repository$SongSortType;Ljava/lang/String;)Ljava/util/List;
  .catchall { :L1 .. :L3 } :L38
  .catchall { :L4 .. :L6 } :L37
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L12 .. :L14 } :L37
  .catchall { :L15 .. :L16 } :L38
  .catchall { :L16 .. :L17 } :L37
  .catchall { :L18 .. :L19 } :L20
  .catchall { :L22 .. :L25 } :L37
  .catchall { :L27 .. :L28 } :L29
  .catchall { :L31 .. :L32 } :L37
  .catchall { :L33 .. :L34 } :L38
  .catchall { :L39 .. :L40 } :L45
  .catchall { :L41 .. :L42 } :L43
  .catchall { :L46 .. :L47 } :L48
  .registers 52
  .line 297
    move-object/from16 v0, p1
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Albums;->orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
    move-result-object v1
  .line 298
    const/4 v2, 0
    if-eqz v1, :L50
    if-nez v0, :L0
    goto/16 :L50
  :L0
  .line 299
    nop
  :L1
  .line 301
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v3
  .line 302
    const/16 v4, 47
    invoke-virtual { v0, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
    const/4 v5, 0
    invoke-virtual { v0, v5, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v6
    long-to-int v4, v6
  .line 303
    new-array v6, v4, [J
  .line 304
    new-array v7, v4, [Lcom/innioasis/y1/database/Song;
  .line 305
    nop
  .line 306
    const-wide/16 v8, -1
    const/4 v10, 0
  :L2
  .line 308
    new-instance v11, Ljava/lang/StringBuilder;
    invoke-direct { v11 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v12, "select rowid as ipp_rowid, * from song where isAudiobook = 0 and rowid > "
    invoke-virtual { v11, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v11
    invoke-virtual { v11, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v11
    const-string v12, " order by rowid limit "
    invoke-virtual { v11, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v11
    const/16 v12, 1000
    invoke-virtual { v11, v12 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v11
    invoke-virtual { v11 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v3, v11, v2 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v11
  :L3
  .line 310
    nop
  :L4
  .line 311
    const-string v13, "songId"
    invoke-interface { v11, v13 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v13
    const-string v14, "name"
    invoke-interface { v11, v14 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v14
  .line 312
    const-string v15, "pinyinName"
    invoke-interface { v11, v15 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v15
    const-string v12, "songName"
    invoke-interface { v11, v12 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v12
  .line 313
    const-string v5, "pinyinSongName"
    invoke-interface { v11, v5 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v5
    const-string v2, "artist"
    invoke-interface { v11, v2 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v2
  .line 314
    move-wide/from16 v16, v8
    const-string v8, "pinyinArtist"
    invoke-interface { v11, v8 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v8
    const-string v9, "album"
    invoke-interface { v11, v9 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v9
  .line 315
    move/from16 v18, v10
    const-string v10, "pinyinAlbum"
    invoke-interface { v11, v10 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v10
    const-string v0, "genre"
    invoke-interface { v11, v0 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v0
  .line 316
    move-object/from16 v19, v3
    const-string v3, "pinyinGenre"
    invoke-interface { v11, v3 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v3
    move-object/from16 v20, v1
    const-string v1, "path"
    invoke-interface { v11, v1 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v1
  .line 317
    move-object/from16 v21, v7
    const-string v7, "isAudiobook"
    invoke-interface { v11, v7 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v7
    move-object/from16 v22, v6
    const-string v6, "date"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
  .line 318
    move/from16 v23, v6
    const-string v6, "fileDate"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
    move/from16 v24, v6
    const-string v6, "lowerName"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
  .line 319
    move/from16 v25, v6
    const-string v6, "lowAlbum"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
    const/16 v26, 0
    move/from16 v49, v18
    move/from16 v18, v6
    move/from16 v6, v49
  :L5
  .line 320
    invoke-interface { v11 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v27
  :L6
    if-eqz v27, :L13
  .line 321
    if-lt v6, v4, :L11
  .line 354
    if-eqz v11, :L10
  :L7
  .line 356
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L8
  .line 358
    goto :L10
  :L9
  .line 357
    move-exception v0
  :L10
  .line 321
    const/4 v1, 0
    return-object v1
  :L11
  .line 322
    move/from16 v27, v4
    const/4 v4, 0
  :L12
    invoke-interface { v11, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v16
  .line 323
    new-instance v4, Lcom/innioasis/y1/database/Song;
    invoke-static { v11, v13 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v29
    invoke-static { v11, v14 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v30
    invoke-static { v11, v15 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v31
    invoke-static { v11, v12 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v32
    invoke-static { v11, v5 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v33
  .line 324
    invoke-static { v11, v2 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v34
    invoke-static { v11, v8 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v35
    invoke-static { v11, v9 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v36
    invoke-static { v11, v10 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v37
    invoke-static { v11, v0 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v38
  .line 325
    invoke-static { v11, v3 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v39
    invoke-static { v11, v1 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v40
    invoke-interface { v11, v7 }, Landroid/database/Cursor;->getInt(I)I
    move-result v41
    move/from16 v48, v0
    move/from16 v0, v23
    invoke-interface { v11, v0 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v42
    move/from16 v23, v0
    move/from16 v0, v24
    invoke-interface { v11, v0 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v44
  .line 326
    move/from16 v24, v0
    move/from16 v0, v25
    invoke-static { v11, v0 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v46
    move/from16 v25, v0
    move/from16 v0, v18
    invoke-static { v11, v0 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v47
    move-object/from16 v28, v4
    invoke-direct/range { v28 .. v47 }, Lcom/innioasis/y1/database/Song;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJJLjava/lang/String;Ljava/lang/String;)V
  .line 327
    invoke-static { v11, v4 }, Lcom/innioasis/ipp/Schema;->read(Landroid/database/Cursor;Lcom/innioasis/y1/database/Song;)V
  .line 328
    aput-wide v16, v22, v6
  .line 329
    add-int/lit8 v18, v6, 1
    aput-object v4, v21, v6
  .line 330
    move/from16 v4, v26
    add-int/lit8 v26, v4, 1
  .line 331
    move/from16 v6, v18
    move/from16 v4, v27
    move/from16 v18, v0
    move/from16 v0, v48
    goto/16 :L5
  :L13
  .line 332
    move/from16 v27, v4
    move/from16 v4, v26
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L14
  .line 333
    nop
  .line 334
    const/16 v0, 1000
    if-ge v4, v0, :L36
  .line 336
    move/from16 v0, v27
    if-eq v6, v0, :L15
  .line 354
    nop
  .line 336
    const/4 v1, 0
    return-object v1
  :L15
  .line 337
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "select rowid from song where isAudiobook = 0 order by "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    move-object/from16 v2, v20
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    move-object/from16 v3, v19
    const/4 v2, 0
    invoke-virtual { v3, v1, v2 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v11
  :L16
  .line 338
    invoke-interface { v11 }, Landroid/database/Cursor;->getCount()I
    move-result v1
  :L17
    if-eq v1, v0, :L22
  .line 354
    if-eqz v11, :L21
  :L18
  .line 356
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L19
  .line 358
    goto :L21
  :L20
  .line 357
    move-exception v0
  :L21
  .line 338
    const/4 v1, 0
    return-object v1
  :L22
  .line 339
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, v0 }, Ljava/util/ArrayList;-><init>(I)V
  :L23
  .line 340
    invoke-interface { v11 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v0
    if-eqz v0, :L31
  .line 341
    const/4 v4, 0
    invoke-interface { v11, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v2
    move-object/from16 v5, v22
    invoke-static { v5, v2, v3 }, Ljava/util/Arrays;->binarySearch([JJ)I
    move-result v0
  .line 342
    if-ltz v0, :L26
    aget-object v2, v21, v0
    if-nez v2, :L24
    goto :L26
  :L24
  .line 343
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 344
    const/4 v2, 0
    aput-object v2, v21, v0
  :L25
  .line 345
    move-object/from16 v22, v5
    goto :L23
  :L26
  .line 354
    if-eqz v11, :L30
  :L27
  .line 356
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L28
  .line 358
    goto :L30
  :L29
  .line 357
    move-exception v0
  :L30
  .line 342
    const/4 v1, 0
    return-object v1
  :L31
  .line 346
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L32
  .line 347
    nop
  :L33
  .line 348
    invoke-static { }, Lcom/innioasis/ipp/Albums;->tableSig()Ljava/lang/String;
    move-result-object v0
    move-object/from16 v7, p1
    invoke-virtual { v7, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
  :L34
    if-nez v0, :L35
  .line 354
    nop
  .line 348
    const/4 v1, 0
    return-object v1
  :L35
  .line 349
    nop
  .line 354
    nop
  .line 349
    return-object v1
  :L36
  .line 335
    move-object/from16 v7, p1
    move-object/from16 v3, v19
    move-object/from16 v2, v20
    move-object/from16 v5, v22
    move/from16 v0, v27
    const/4 v4, 0
    move v4, v0
    move-object v1, v2
    move v10, v6
    move-object v0, v7
    move-wide/from16 v8, v16
    move-object/from16 v7, v21
    const/4 v2, 0
    move-object v6, v5
    const/4 v5, 0
    goto/16 :L2
  :L37
  .line 350
    move-exception v0
    goto :L39
  :L38
    move-exception v0
    const/4 v11, 0
  :L39
  .line 351
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "library read in portions failed: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L40
  .line 352
    nop
  .line 354
    if-eqz v11, :L44
  :L41
  .line 356
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L42
  .line 358
    goto :L44
  :L43
  .line 357
    move-exception v0
  :L44
  .line 352
    const/4 v1, 0
    return-object v1
  :L45
  .line 354
    move-exception v0
    move-object v1, v0
    if-eqz v11, :L49
  :L46
  .line 356
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L47
  .line 358
    goto :L49
  :L48
  .line 357
    move-exception v0
  :L49
  .line 360
    throw v1
  :L50
  .line 298
    const/4 v1, 0
    return-object v1
.end method

.method public static realName(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 85
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 87
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 1
    if-nez v0, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L1
    goto :L4
  :L1
  .line 88
    invoke-virtual { p0, v1 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
  .line 89
    if-gez v0, :L2
    goto :L3
  :L2
    const/4 v1, 0
    invoke-virtual { p0, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 87
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->name(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static reserve()V
  .catchall { :L0 .. :L1 } :L8
  .catchall { :L3 .. :L4 } :L8
  .catchall { :L5 .. :L7 } :L8
  .registers 7
  .line 383
    const/high16 v0, 0x01800000
    const/4 v1, 0
  :L0
    new-array v0, v0, [B
    sput-object v0, Lcom/innioasis/ipp/Albums;->block:[B
  .line 384
    invoke-static { v0 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v0
  .line 385
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  :L1
  .line 386
    const/4 v3, 0
  :L2
    const/4 v4, 4
    const-string v5, "ipplab"
    if-ge v3, v4, :L6
  .line 387
    const/high16 v4, 0x00100000
  :L3
    new-array v4, v4, [B
  .line 388
    invoke-static { v4 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v6
    sub-int/2addr v6, v0
    if-lez v6, :L5
  .line 389
    sput-object v4, Lcom/innioasis/ipp/Albums;->cap:[B
  .line 390
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "heap reserve: 24 MB under the cap, try "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    add-int/lit8 v3, v3, 1
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 391
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "heap reserve ok, try "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v5, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L4
  .line 400
    sput-object v1, Lcom/innioasis/ipp/Albums;->block:[B
  .line 392
    return-void
  :L5
  .line 394
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 386
    add-int/lit8 v3, v3, 1
    goto :L2
  :L6
  .line 396
    const-string v0, "heap reserve: no cap above the block"
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 397
    const-string v0, "heap reserve failed"
    invoke-static { v5, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L7
    goto :L9
  :L8
  .line 398
    move-exception v0
  :L9
  .line 400
    sput-object v1, Lcom/innioasis/ipp/Albums;->block:[B
  .line 401
    nop
  .line 402
    return-void
.end method

.method public static restore(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 1324
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 1325
    const-string v0, "ipp_open_album"
    invoke-virtual { p0, v0, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1326
    sput-object p2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1328
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1329
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1330
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1331
    return-void
  :L1
  .line 1324
    return-void
.end method

.method public static restoreList(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 1539
    if-eqz p0, :L3
    if-nez p1, :L0
    goto :L3
  :L0
  .line 1540
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
  .line 1541
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
  .line 1542
    sget v1, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1543
    const/4 v2, -1
    sput v2, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1544
    if-ltz v1, :L1
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result p1
    if-ge v1, p1, :L1
    sget p1, Lcom/innioasis/ipp/Albums;->listPos:I
    if-ne p1, v0, :L1
  .line 1546
    sget p1, Lcom/innioasis/ipp/Albums;->listTop:I
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Head;->restore(Landroid/widget/ListView;II)V
    goto :L2
  :L1
  .line 1548
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->setSelection(I)V
  :L2
  .line 1550
    return-void
  :L3
  .line 1539
    return-void
.end method

.method private static sameKey(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Z
  .registers 8
  .line 763
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    const/4 v1, 1
    const/4 v2, 0
    if-eq p2, v0, :L7
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p2, v0, :L0
    goto :L7
  :L0
  .line 766
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-eq p2, v0, :L2
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p2, v0, :L1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 767
    if-eqz v1, :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p0
    goto :L4
  :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p0
  :L4
  .line 768
    if-eqz v1, :L5
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p1
    goto :L6
  :L5
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p1
  :L6
  .line 767
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->lowerEq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
  :L7
  .line 764
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v3
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide p0
    cmp-long p2, v3, p0
    if-nez p2, :L8
    goto :L9
  :L8
    const/4 v1, 0
  :L9
    return v1
.end method

.method static scanStarts()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 480
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 481
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
  .line 482
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    sput-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 483
    sget v1, Lcom/innioasis/ipp/Albums;->foreign:I
    sput v1, Lcom/innioasis/ipp/Albums;->markForeign:I
  .line 484
    monitor-exit v0
  .line 485
    return-void
  :L1
  .line 484
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method private static scopeEnabled()Z
  .registers 2
  .line 1750
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 1751
    if-nez v0, :L0
    const/4 v0, 0
    return v0
  :L0
  .line 1752
    const-string v1, "artist_scope"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static share(Ljava/util/List;)V
  .catchall { :L2 .. :L10 } :L11
  .registers 9
  .line 410
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 411
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
  .line 412
    nop
  .line 413
    const/4 v3, 0
    const/4 v4, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v3, v5, :L13
  .line 414
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 415
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-nez v6, :L1
    goto/16 :L12
  :L1
  .line 416
    check-cast v5, Lcom/innioasis/y1/database/Song;
  :L2
  .line 419
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v6
    invoke-static { v2, v6 }, Lcom/innioasis/ipp/Albums;->one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L3
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v7
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/Albums;->odd(Ljava/lang/String;Ljava/lang/String;)I
    move-result v7
    add-int/2addr v4, v7
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/database/Song;->setAlbum(Ljava/lang/String;)V
  :L3
  .line 420
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getLowAlbum()Ljava/lang/String;
    move-result-object v6
    invoke-static { v2, v6 }, Lcom/innioasis/ipp/Albums;->one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L4
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getLowAlbum()Ljava/lang/String;
    move-result-object v7
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/Albums;->odd(Ljava/lang/String;Ljava/lang/String;)I
    move-result v7
    add-int/2addr v4, v7
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/database/Song;->setLowAlbum(Ljava/lang/String;)V
  :L4
  .line 421
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPinyinAlbum()Ljava/lang/String;
    move-result-object v6
    invoke-static { v2, v6 }, Lcom/innioasis/ipp/Albums;->one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L5
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPinyinAlbum()Ljava/lang/String;
    move-result-object v7
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/Albums;->odd(Ljava/lang/String;Ljava/lang/String;)I
    move-result v7
    add-int/2addr v4, v7
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/database/Song;->setPinyinAlbum(Ljava/lang/String;)V
  :L5
  .line 422
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v6
    invoke-static { v2, v6 }, Lcom/innioasis/ipp/Albums;->one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L6
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v7
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/Albums;->odd(Ljava/lang/String;Ljava/lang/String;)I
    move-result v7
    add-int/2addr v4, v7
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/database/Song;->setArtist(Ljava/lang/String;)V
  :L6
  .line 423
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPinyinArtist()Ljava/lang/String;
    move-result-object v6
    invoke-static { v2, v6 }, Lcom/innioasis/ipp/Albums;->one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L7
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPinyinArtist()Ljava/lang/String;
    move-result-object v7
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/Albums;->odd(Ljava/lang/String;Ljava/lang/String;)I
    move-result v7
    add-int/2addr v4, v7
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/database/Song;->setPinyinArtist(Ljava/lang/String;)V
  :L7
  .line 424
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v6
    invoke-static { v2, v6 }, Lcom/innioasis/ipp/Albums;->one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L8
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v7
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/Albums;->odd(Ljava/lang/String;Ljava/lang/String;)I
    move-result v7
    add-int/2addr v4, v7
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/database/Song;->setGenre(Ljava/lang/String;)V
  :L8
  .line 425
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPinyinGenre()Ljava/lang/String;
    move-result-object v6
    invoke-static { v2, v6 }, Lcom/innioasis/ipp/Albums;->one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L9
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPinyinGenre()Ljava/lang/String;
    move-result-object v7
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/Albums;->odd(Ljava/lang/String;Ljava/lang/String;)I
    move-result v7
    add-int/2addr v4, v7
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/database/Song;->setPinyinGenre(Ljava/lang/String;)V
  :L9
  .line 426
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v6
    invoke-static { v2, v6 }, Lcom/innioasis/ipp/Albums;->one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L10
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v7
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/Albums;->odd(Ljava/lang/String;Ljava/lang/String;)I
    move-result v7
    add-int/2addr v4, v7
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/database/Song;->setAlbumArtist(Ljava/lang/String;)V
  :L10
  .line 428
    goto :L12
  :L11
  .line 427
    move-exception v5
  :L12
  .line 413
    add-int/lit8 v3, v3, 1
    goto/16 :L0
  :L13
  .line 430
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "library share: "
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
    invoke-virtual { v3, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v3, " songs, "
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { v2 }, Ljava/util/HashMap;->size()I
    move-result v2
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, " texts, "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, " odd, "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 431
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sub-long/2addr v2, v0
    invoke-virtual { p0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " ms"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  .line 432
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 433
    const-string v0, "ippshare"
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 434
    return-void
.end method

.method static shared(Ljava/util/List;)Ljava/util/List;
  .registers 7
  .line 600
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 601
    if-eqz p0, :L9
    if-nez v0, :L0
    goto :L9
  :L0
  .line 602
    new-instance v1, Ljava/util/HashMap;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    mul-int/lit8 v2, v2, 2
    invoke-direct { v1, v2 }, Ljava/util/HashMap;-><init>(I)V
  .line 603
    const/4 v2, 0
    const/4 v3, 0
  :L1
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L3
  .line 604
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 605
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L2
    move-object v5, v4
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v1, v5, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 603
    add-int/lit8 v3, v3, 1
    goto :L1
  :L3
  .line 607
    new-instance v0, Ljava/util/ArrayList;
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    invoke-direct { v0, v3 }, Ljava/util/ArrayList;-><init>(I)V
  .line 608
    nop
  :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 609
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 610
    instance-of v4, v3, Lcom/innioasis/y1/database/Song;
    if-eqz v4, :L5
    move-object v4, v3
    check-cast v4, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    goto :L6
  :L5
    const/4 v4, 0
  :L6
  .line 611
    if-eqz v4, :L7
    move-object v3, v4
  :L7
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 608
    add-int/lit8 v2, v2, 1
    goto :L4
  :L8
  .line 613
    return-object v0
  :L9
  .line 601
    return-object p0
.end method

.method public static songListSort()I
  .registers 1
  .line 1306
    sget v0, Lcom/innioasis/ipp/Albums;->songSort:I
    return v0
.end method

.method public static songMenu(Lcom/innioasis/music/util/SubMenuDialog;Landroid/app/Activity;Ljava/lang/String;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 6
  .line 1367
    if-eqz p0, :L6
    if-nez p1, :L0
    goto/16 :L6
  :L0
  .line 1368
    sput-object p0, Lcom/innioasis/ipp/Albums;->songDlg:Lcom/innioasis/music/util/SubMenuDialog;
  .line 1369
    invoke-static { p2 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p2
  .line 1370
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1371
    const v1, 2131820964
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1372
    const v1, 2131820963
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1373
    if-eqz p2, :L1
    const v1, 2131820962
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L2
  :L1
  .line 1374
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->trackSortEnabled()Z
    move-result v1
    if-eqz v1, :L2
    const v1, 2131821024
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 1375
    const v1, 2131820844
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1376
    const v1, 2131820584
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1377
    const v1, 2131820841
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1378
    const v1, 2131821047
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1380
    if-nez p2, :L3
    invoke-static { p3 }, Lcom/innioasis/ipp/Artists;->canOpen(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p3
    if-eqz p3, :L3
    const p3, 2131821105
    invoke-virtual { p1, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { v0, p3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1381
    if-eqz p2, :L4
    const p2, 2131821071
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L5
  :L4
  .line 1382
    const p2, 2131821060
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 1383
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 1384
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 1385
    return-void
  :L6
  .line 1367
    return-void
.end method

.method public static songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 4
  .line 1786
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->allSongsArtist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->artistSongs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L0
  .line 1787
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const/4 p0, 0
    return-object p0
  :L1
  .line 1788
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1789
    if-nez v0, :L2
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L2
  .line 1790
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->onlyScoped(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1792
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p1, v0, :L3
  .line 1793
    new-instance p1, Lcom/innioasis/ipp/Albums$SongCmp;
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-direct { p1, v0 }, Lcom/innioasis/ipp/Albums$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1794
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->trackSortEnabled()Z
    move-result p1
    if-eqz p1, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    goto :L4
  :L3
  .line 1796
    new-instance v0, Lcom/innioasis/ipp/Albums$SongCmp;
    invoke-direct { v0, p1 }, Lcom/innioasis/ipp/Albums$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { p0, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1797
    nop
  :L4
  .line 1799
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->byDisc(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method private static songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .catchall { :L0 .. :L6 } :L21
  .catchall { :L9 .. :L12 } :L11
  .catchall { :L17 .. :L20 } :L19
  .catchall { :L22 .. :L23 } :L21
  .registers 11
  .line 693
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
  .line 695
    nop
  .line 696
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 697
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L1
    sget-object v2, Lcom/innioasis/ipp/Albums;->songOrder:Ljava/lang/Object;
    if-ne p1, v2, :L1
    monitor-exit v0
    return-object v1
  :L1
  .line 698
    sget-object v1, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
    if-eqz v1, :L2
    sget-object v2, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
    if-ne p1, v2, :L2
    monitor-exit v0
    return-object v1
  :L2
  .line 699
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->pairOf(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object v1
  .line 700
    const/4 v2, 0
    if-eqz v1, :L3
    sget-object v3, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v3, :L3
    sget-object v4, Lcom/innioasis/ipp/Albums;->songOrder:Ljava/lang/Object;
    if-ne v1, v4, :L3
    goto :L5
  :L3
  .line 701
    if-eqz v1, :L4
    sget-object v3, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
    if-eqz v3, :L4
    sget-object v4, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
    if-ne v1, v4, :L4
    goto :L5
  :L4
  .line 702
    move-object v3, v2
  :L5
    sget v1, Lcom/innioasis/ipp/Albums;->songGen:I
  .line 703
    monitor-exit v0
  :L6
  .line 704
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 705
    if-nez v3, :L7
    goto :L8
  :L7
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/Albums;->mirror(Ljava/util/List;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v2
  :L8
  .line 706
    if-eqz v2, :L13
  .line 707
    const-string p0, "ipplab"
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "mirror "
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v6, " "
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
    sub-long/2addr v6, v4
    invoke-virtual { v3, v6, v7 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " ms"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static { p0, v3 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 708
    monitor-enter v0
  :L9
  .line 709
    sget p0, Lcom/innioasis/ipp/Albums;->songGen:I
    if-ne v1, p0, :L10
  .line 710
    sput-object v2, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 711
    sput-object p1, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
  :L10
  .line 713
    monitor-exit v0
  .line 714
    return-object v2
  :L11
  .line 713
    move-exception p0
    monitor-exit v0
  :L12
    throw p0
  :L13
  .line 716
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->ordered(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v2
  .line 717
    const-string v3, "ipplab"
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "path order "
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, " "
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    if-eqz v2, :L14
    const/4 v7, 1
    goto :L15
  :L14
    const/4 v7, 0
  :L15
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, " "
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
    sub-long/2addr v7, v4
    invoke-virtual { v6, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, " ms"
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-static { v3, v6 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 718
    if-nez v2, :L16
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsList(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->shared(Ljava/util/List;)Ljava/util/List;
    move-result-object v2
  :L16
  .line 719
    const-string p0, "ipplab"
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "sorted query "
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v6, " "
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
    sub-long/2addr v6, v4
    invoke-virtual { v3, v6, v7 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " ms"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static { p0, v3 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 720
    monitor-enter v0
  .line 721
    if-eqz v2, :L18
  :L17
    sget p0, Lcom/innioasis/ipp/Albums;->songGen:I
    if-ne v1, p0, :L18
  .line 722
    sput-object v2, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 723
    sput-object p1, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
  :L18
  .line 725
    monitor-exit v0
  .line 726
    return-object v2
  :L19
  .line 725
    move-exception p0
    monitor-exit v0
  :L20
    throw p0
  :L21
  .line 703
    move-exception p0
  :L22
    monitor-exit v0
  :L23
    throw p0
.end method

.method public static songsList(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 587
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
  :L0
  .line 589
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p1
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAllSong(I)V
  :L1
  .line 591
    goto :L3
  :L2
  .line 590
    move-exception p1
  :L3
  .line 592
    if-nez p0, :L4
    const/4 p0, 0
    goto :L5
  :L4
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    move-object p0, p1
  :L5
    return-object p0
.end method

.method public static songsOf(Ljava/lang/String;)Ljava/util/List;
  .registers 5
  .line 1690
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1691
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 1692
    if-eqz v1, :L6
    if-nez p0, :L0
    goto :L6
  :L0
  .line 1693
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1694
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
  .line 1695
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v1, v2, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    goto :L5
  :L1
  .line 1697
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object p0
    if-nez v2, :L2
    const-string v3, ""
    goto :L3
  :L2
    move-object v3, v2
  :L3
    invoke-virtual { p0, v3 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 1698
    if-eqz p0, :L5
  .line 1699
    check-cast p0, Ljava/util/LinkedHashSet;
    invoke-virtual { p0 }, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L4
  .line 1700
    invoke-interface { p0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L5
    invoke-interface { p0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    goto :L4
  :L5
  .line 1703
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1704
    return-object v0
  :L6
  .line 1692
    return-object v0
.end method

.method public static songsSync(Lcom/innioasis/music/data/Album;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
  .registers 7
  .line 1860
    const/4 p1, 0
    if-nez p0, :L0
    return-object p1
  :L0
  .line 1862
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Genres;->noteList(Lcom/innioasis/music/data/Album;Lcom/innioasis/music/data/Genre;)V
  .line 1864
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L5
  .line 1865
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object p1
  .line 1866
    if-nez p1, :L1
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L1
  .line 1867
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  .line 1868
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1869
    nop
  :L2
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    if-ge v1, v0, :L4
  .line 1870
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1871
    if-eqz v0, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L3
    invoke-virtual { p2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1869
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 1873
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p2, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1874
    return-object p2
  :L5
  .line 1877
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L14
  .line 1878
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1879
    if-nez v0, :L6
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L6
  .line 1880
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  .line 1881
    if-nez p2, :L7
    goto :L8
  :L7
    invoke-virtual { p2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
  :L8
  .line 1882
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1883
    nop
  :L9
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L13
  .line 1884
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1885
    if-eqz v2, :L12
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L10
    goto :L12
  :L10
  .line 1886
    if-eqz p1, :L11
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L11
    goto :L12
  :L11
  .line 1887
    invoke-virtual { p2, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L12
  .line 1883
    add-int/lit8 v1, v1, 1
    goto :L9
  :L13
  .line 1889
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p2, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1890
    return-object p2
  :L14
  .line 1892
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L15
    return-object p1
  :L15
  .line 1893
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1894
    if-nez v0, :L16
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L16
  .line 1895
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1896
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 1897
    if-nez p2, :L17
    goto :L18
  :L17
    invoke-virtual { p2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
  :L18
  .line 1898
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1899
    if-eqz p1, :L22
  .line 1900
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1901
    nop
  :L19
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    if-ge v1, v0, :L21
  .line 1902
    invoke-virtual { p0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1903
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p1 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L20
    invoke-virtual { p2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L20
  .line 1901
    add-int/lit8 v1, v1, 1
    goto :L19
  :L21
  .line 1905
    move-object p0, p2
  :L22
  .line 1908
    sget-object p1, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1909
    return-object p0
.end method

.method public static sortFor(Ljava/lang/String;)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  .registers 3
  .line 1349
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAlbumSong()I
    move-result v0
  .line 1350
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L2
  .line 1351
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 1352
    if-nez p0, :L0
    goto :L1
  :L0
    const-string v1, "all_sort"
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
  :L1
  .line 1353
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object p0
    return-object p0
  :L2
  .line 1356
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p0
    if-ne v0, p0, :L3
  .line 1357
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L3
  .line 1359
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object p0
    return-object p0
.end method

.method private static sortValue(Z)I
  .registers 3
  .line 1279
    if-nez p0, :L0
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAlbum()I
    move-result p0
    return p0
  :L0
  .line 1280
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 1281
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v0
  .line 1282
    if-nez p0, :L1
    goto :L2
  :L1
    const-string v1, "artist_album_sort"
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
  :L2
    return v0
.end method

.method public static split(Ljava/util/List;)Ljava/util/List;
  .registers 3
  .line 1651
    if-nez p0, :L0
    return-object p0
  :L0
  .line 1652
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1653
    const-string v1, "split allSongs"
    invoke-static { v1 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1654
    if-nez v0, :L1
    return-object p0
  :L1
  .line 1655
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Albums;->splitRows(Ljava/util/List;Ljava/util/List;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1656
    const-string v0, "split loop"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1657
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->byYear(Ljava/util/ArrayList;)Ljava/util/List;
    move-result-object p0
  .line 1658
    const-string v0, "split byYear"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1659
    return-object p0
.end method

.method public static splitAlbums(Ljava/util/List;)Ljava/util/List;
  .registers 14
  .line 1664
    if-nez p0, :L0
    return-object p0
  :L0
  .line 1665
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1666
    if-nez v0, :L1
    return-object p0
  :L1
  .line 1667
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 1668
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1669
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L12
  .line 1670
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/music/data/Album;
  .line 1671
    if-nez v4, :L3
    goto :L11
  :L3
  .line 1672
    invoke-virtual { v4 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v5
    const-string v6, ""
    if-nez v5, :L4
    move-object v5, v6
    goto :L5
  :L4
    invoke-virtual { v4 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v5
  :L5
  .line 1673
    invoke-virtual { v0, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
  .line 1674
    const/4 v8, 0
    if-nez v7, :L6
    move-object v7, v8
    goto :L7
  :L6
    check-cast v7, Ljava/util/LinkedHashSet;
  :L7
  .line 1675
    if-eqz v7, :L10
    invoke-virtual { v7 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v9
    if-eqz v9, :L8
    goto :L10
  :L8
  .line 1676
    new-instance v9, Ljava/util/ArrayList;
    invoke-direct { v9, v7 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1677
    sget-object v7, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v9, v7 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1678
    const/4 v7, 0
  :L9
    invoke-virtual { v9 }, Ljava/util/ArrayList;->size()I
    move-result v10
    if-ge v7, v10, :L11
  .line 1679
    new-instance v10, Lcom/innioasis/music/data/Album;
    invoke-virtual { v9, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v11
    check-cast v11, Ljava/lang/String;
    invoke-static { v5, v11 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v4 }, Lcom/innioasis/music/data/Album;->getArtist()Ljava/lang/String;
    move-result-object v12
    invoke-direct { v10, v11, v12, v6, v8 }, Lcom/innioasis/music/data/Album;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    invoke-virtual { v1, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1678
    add-int/lit8 v7, v7, 1
    goto :L9
  :L10
  .line 1675
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L11
  .line 1669
    add-int/lit8 v3, v3, 1
    goto :L2
  :L12
  .line 1682
    return-object v1
.end method

.method private static splitRows(Ljava/util/List;Ljava/util/List;)Ljava/util/ArrayList;
  .catchall { :L0 .. :L2 } :L16
  .catchall { :L13 .. :L15 } :L14
  .catchall { :L17 .. :L18 } :L16
  .registers 10
  .line 1578
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1579
    sget-object v1, Lcom/innioasis/ipp/Albums;->splitFor:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L1
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, p1, :L1
    sget-object v1, Lcom/innioasis/ipp/Albums;->splitNames:Ljava/util/List;
    invoke-interface { p0, v1 }, Ljava/util/List;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    new-instance p0, Ljava/util/ArrayList;
    sget-object p1, Lcom/innioasis/ipp/Albums;->splitOut:Ljava/util/ArrayList;
    invoke-direct { p0, p1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    monitor-exit v0
    return-object p0
  :L1
  .line 1580
    monitor-exit v0
  :L2
  .line 1581
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 1582
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1583
    const/4 v2, 0
    const/4 v3, 0
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L12
  .line 1584
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 1585
    if-nez v4, :L4
    const-string v5, ""
    goto :L5
  :L4
    move-object v5, v4
  :L5
    invoke-virtual { v0, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
  .line 1586
    if-nez v5, :L6
    const/4 v5, 0
    goto :L7
  :L6
    check-cast v5, Ljava/util/LinkedHashSet;
  :L7
  .line 1587
    if-eqz v5, :L10
    invoke-virtual { v5 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v6
    if-eqz v6, :L8
    goto :L10
  :L8
  .line 1588
    new-instance v6, Ljava/util/ArrayList;
    invoke-direct { v6, v5 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1589
    sget-object v5, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v6, v5 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1590
    const/4 v5, 0
  :L9
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v7
    if-ge v5, v7, :L11
    invoke-virtual { v6, v5 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/String;
    invoke-static { v4, v7 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v1, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v5, v5, 1
    goto :L9
  :L10
  .line 1587
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L11
  .line 1583
    add-int/lit8 v3, v3, 1
    goto :L3
  :L12
  .line 1592
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L13
  .line 1593
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->splitFor:Ljava/lang/ref/WeakReference;
  .line 1594
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    sput-object p1, Lcom/innioasis/ipp/Albums;->splitNames:Ljava/util/List;
  .line 1595
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    sput-object p0, Lcom/innioasis/ipp/Albums;->splitOut:Ljava/util/ArrayList;
  .line 1596
    monitor-exit v2
  .line 1597
    return-object v1
  :L14
  .line 1596
    move-exception p0
    monitor-exit v2
  :L15
    throw p0
  :L16
  .line 1580
    move-exception p0
  :L17
    monitor-exit v0
  :L18
    goto :L20
  :L19
    throw p0
  :L20
    goto :L19
.end method

.method private static str(Landroid/database/Cursor;I)Ljava/lang/String;
  .registers 3
  .line 364
    invoke-interface { p0, p1 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v0
    if-eqz v0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-interface { p0, p1 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method private static tableSig()Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L14
  .catchall { :L1 .. :L2 } :L13
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L7 .. :L8 } :L13
  .catchall { :L9 .. :L10 } :L11
  .catchall { :L16 .. :L17 } :L18
  .registers 6
  .line 623
    const-string v0, "/"
  .line 625
    const/4 v1, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v2
    const-string v3, "select count(*), total(length(path)), total(fileDate) from song where isAudiobook = 0"
    invoke-virtual { v2, v3, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v2
  :L1
  .line 627
    invoke-interface { v2 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v3
  :L2
    if-nez v3, :L7
  .line 632
    if-eqz v2, :L6
  :L3
  .line 634
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  :L4
  .line 636
    goto :L6
  :L5
  .line 635
    move-exception v0
  :L6
  .line 627
    return-object v1
  :L7
  .line 628
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v4, 0
    invoke-interface { v2, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v4
    invoke-virtual { v3, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/4 v4, 1
    invoke-interface { v2, v4 }, Landroid/database/Cursor;->getDouble(I)D
    move-result-wide v4
    double-to-long v4, v4
    invoke-virtual { v3, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const/4 v3, 2
    invoke-interface { v2, v3 }, Landroid/database/Cursor;->getDouble(I)D
    move-result-wide v3
    double-to-long v3, v3
    invoke-virtual { v0, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  :L8
  .line 632
    if-eqz v2, :L12
  :L9
  .line 634
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  :L10
  .line 636
    goto :L12
  :L11
  .line 635
    move-exception v1
  :L12
  .line 628
    return-object v0
  :L13
  .line 629
    move-exception v0
    goto :L15
  :L14
    move-exception v0
    move-object v2, v1
  :L15
  .line 630
    nop
  .line 632
    if-eqz v2, :L19
  :L16
  .line 634
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  :L17
  .line 636
    goto :L19
  :L18
  .line 635
    move-exception v0
  :L19
  .line 630
    return-object v1
.end method

.method public static tintAllSongsRow(Landroid/widget/TextView;)V
  .registers 3
  .line 1236
    sget-object v0, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 1237
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 1238
    if-eqz v0, :L1
    if-nez p0, :L0
    goto :L1
  :L0
  .line 1239
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 1240
    return-void
  :L1
  .line 1238
    return-void
.end method

.method public static trackFolder(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 131
    const-string v0, ""
    if-nez p0, :L0
    return-object v0
  :L0
  .line 132
    const/16 v1, 47
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 133
    if-gez v1, :L1
    goto :L2
  :L1
    const/4 v0, 0
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
  :L2
    return-object v0
.end method

.method private static warmSoon(J)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 227
    invoke-static { }, Lcom/innioasis/ipp/Albums;->worker()Landroid/os/Handler;
    move-result-object v0
  .line 228
    sget-object v1, Lcom/innioasis/ipp/Albums;->WARM:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 229
    invoke-virtual { v0, v1, p0, p1 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 231
    goto :L3
  :L2
  .line 230
    move-exception p0
  :L3
  .line 232
    return-void
.end method

.method private static worker()Landroid/os/Handler;
  .catchall { :L0 .. :L3 } :L2
  .registers 3
  .line 213
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 214
    sget-object v1, Lcom/innioasis/ipp/Albums;->warmer:Landroid/os/Handler;
    if-nez v1, :L1
  .line 216
    new-instance v1, Landroid/os/HandlerThread;
    const-string v2, "ipp-library"
    invoke-direct { v1, v2 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 217
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->start()V
  .line 218
    new-instance v2, Landroid/os/Handler;
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v2, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v2, Lcom/innioasis/ipp/Albums;->warmer:Landroid/os/Handler;
  :L1
  .line 220
    sget-object v1, Lcom/innioasis/ipp/Albums;->warmer:Landroid/os/Handler;
    monitor-exit v0
    return-object v1
  :L2
  .line 221
    move-exception v1
    monitor-exit v0
  :L3
    throw v1
.end method

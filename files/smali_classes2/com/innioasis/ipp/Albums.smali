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
  .line 785
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Albums;->unicodeLower:I
  .line 1313
    sput v0, Lcom/innioasis/ipp/Albums;->songSort:I
  .line 1532
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1534
    sput v0, Lcom/innioasis/ipp/Albums;->listPos:I
  .line 1720
    new-instance v0, Lcom/innioasis/ipp/Albums$StrCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Albums$StrCmp;-><init>(Lcom/innioasis/ipp/Albums$1;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
  .line 1862
    new-instance v0, Lcom/innioasis/ipp/Albums$DiscCmp;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Albums$DiscCmp;-><init>(Lcom/innioasis/ipp/Albums$1;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->DISC_CMP:Ljava/util/Comparator;
  .line 1925
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
  .line 1567
    if-eqz p0, :L2
    if-nez p1, :L0
    goto :L2
  :L0
  .line 1568
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1569
    const v1, 2131820961
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1570
    const v1, 2131820844
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1571
    const v1, 2131820584
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1572
    const v1, 2131820582
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1573
    const v1, 2131821047
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1574
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
  .line 1575
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 1576
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 1577
    return-void
  :L2
  .line 1567
    return-void
.end method

.method public static albumNames(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;)Ljava/util/List;
  .catchall { :L2 .. :L5 } :L7
  .catchall { :L8 .. :L9 } :L7
  .registers 7
  .line 1621
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    if-ne p1, v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 1622
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loaded()Ljava/util/List;
    move-result-object v1
  .line 1623
    nop
  .line 1624
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  .line 1625
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
  .line 1626
    new-instance v3, Ljava/util/ArrayList;
    sget-object v4, Lcom/innioasis/ipp/Albums;->namesMemo:Ljava/util/List;
    invoke-direct { v3, v4 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    goto :L4
  :L3
  .line 1628
    const/4 v3, 0
  :L4
    monitor-exit v2
  :L5
  .line 1629
    if-eqz v3, :L6
  .line 1630
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->noteAlbumSort(I)V
  .line 1631
    return-object v3
  :L6
  .line 1633
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getAlbumsBySort(Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;)Ljava/util/List;
    move-result-object p0
  .line 1634
    invoke-static { v1, v0, p0 }, Lcom/innioasis/ipp/Albums;->keepNames(Ljava/util/List;ZLjava/util/List;)V
  .line 1635
    return-object p0
  :L7
  .line 1628
    move-exception p0
  :L8
    monitor-exit v2
  :L9
    throw p0
.end method

.method static albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
  .catchall { :L0 .. :L4 } :L3
  .registers 3
  .line 1146
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .line 1147
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1148
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
  .line 1149
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
.end method

.method public static albumSort(Landroid/app/Activity;)I
  .registers 1
  .line 1277
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->noteAlbumList(Landroid/app/Activity;)V
  .line 1278
    invoke-static { }, Lcom/innioasis/ipp/Albums;->albumSortValue()I
    move-result p0
    return p0
.end method

.method public static albumSortFor(Landroid/app/Activity;)I
  .registers 1
  .line 1283
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->artistView(Landroid/app/Activity;)Z
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->sortValue(Z)I
    move-result p0
    return p0
.end method

.method public static albumSortValue()I
  .registers 1
  .line 1288
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
  .line 980
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 981
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->readOnce()Ljava/util/List;
    move-result-object v0
    return-object v0
  :L0
  .line 982
    sget-boolean v1, Lcom/innioasis/ipp/Albums;->checkAsked:Z
    if-nez v1, :L1
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1
    sget-wide v3, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    sub-long/2addr v1, v3
    const-wide/32 v3, 600000
    cmp-long v5, v1, v3
    if-ltz v5, :L1
  .line 983
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Albums;->checkAsked:Z
  .line 984
    const-wide/16 v1, 0
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  :L1
  .line 986
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
  .line 1222
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
  .line 1223
    if-eqz p3, :L5
  .line 1225
    if-eqz p0, :L3
    const/high16 v2, 0x41B00000
    goto :L4
  :L3
    const/high16 v2, 0x41A00000
  :L4
    const/4 v3, 2
    invoke-virtual { p3, v3, v2 }, Landroid/widget/TextView;->setTextSize(IF)V
  :L5
  .line 1227
    if-eqz p2, :L8
    if-eqz p0, :L6
    const/16 v2, 8
    goto :L7
  :L6
    const/4 v2, 0
  :L7
    invoke-virtual { p2, v2 }, Landroid/widget/TextView;->setVisibility(I)V
  :L8
  .line 1228
    if-nez p0, :L9
  .line 1229
    invoke-static { p1 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 1230
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 1231
    return v1
  :L9
  .line 1233
    nop
  .line 1234
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 1235
    if-eqz p0, :L10
    const p2, 2131821049
    invoke-virtual { p0, p2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    goto :L11
  :L10
    const-string p0, "Show all songs"
  :L11
  .line 1236
    if-eqz p3, :L12
    invoke-virtual { p3, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L12
  .line 1237
    if-eqz p1, :L13
    const p0, 2131623994
    invoke-virtual { p1, p0 }, Landroid/widget/ImageView;->setImageResource(I)V
  :L13
  .line 1238
    sput-object p1, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 1239
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
  .line 1746
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1747
    if-nez v0, :L0
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L0
  .line 1748
    nop
  .line 1749
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p1, v1, :L1
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L1
  .line 1750
    invoke-virtual { v0, p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByArtist(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
  .line 1751
    if-nez p0, :L2
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
  :L2
    return-object p0
.end method

.method private static artistView(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 1263
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-eqz v1, :L3
  .line 1264
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
  .line 1265
    move-exception p0
  .line 1266
    return v0
  :L3
  .line 1264
    nop
  :L4
  .line 1263
    return v0
.end method

.method private static askLower()I
  .catchall { :L0 .. :L1 } :L16
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L6 .. :L11 } :L16
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L17 .. :L18 } :L19
  .registers 7
  .line 809
    nop
  .line 811
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v2
    const-string v3, "select lower('\u041f\u0420\u0418\u0412\u0415\u0422')"
    invoke-virtual { v2, v3, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v1
  .line 812
    invoke-interface { v1 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v2
  :L1
    if-nez v2, :L6
  .line 819
    if-eqz v1, :L5
  :L2
  .line 821
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L3
  .line 823
    goto :L5
  :L4
  .line 822
    move-exception v1
  :L5
  .line 812
    return v0
  :L6
  .line 813
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
  .line 814
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
  .line 815
    nop
  .line 819
    if-eqz v1, :L15
  :L12
  .line 821
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L13
  .line 823
    goto :L15
  :L14
  .line 822
    move-exception v0
  :L15
  .line 815
    return v2
  :L16
  .line 816
    move-exception v2
  .line 817
    nop
  .line 819
    if-eqz v1, :L20
  :L17
  .line 821
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L18
  .line 823
    goto :L20
  :L19
  .line 822
    move-exception v1
  :L20
  .line 817
    return v0
.end method

.method public static atStart(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  .line 835
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Albums;->menuShown:Z
  .line 836
    sget-boolean v1, Lcom/innioasis/ipp/Albums;->scanToast:Z
    if-eqz v1, :L3
    if-eqz p0, :L3
  .line 837
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Albums;->scanToast:Z
  :L0
  .line 839
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
  .line 840
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
  .line 841
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
  .line 839
    invoke-static { p0, v2, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
  .line 842
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L1
  .line 844
    goto :L3
  :L2
  .line 843
    move-exception p0
  :L3
  .line 846
    sget-boolean p0, Lcom/innioasis/ipp/Albums;->started:Z
    if-eqz p0, :L4
    return-void
  :L4
  .line 847
    sput-boolean v0, Lcom/innioasis/ipp/Albums;->started:Z
  .line 848
    sget-object p0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez p0, :L5
    const-wide/16 v0, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  :L5
  .line 849
    return-void
.end method

.method public static backAlbum()Ljava/lang/String;
  .registers 3
  .line 1492
    sget-object v0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1493
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 1494
    sput-object v1, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1495
    sget-object v2, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
    sput-object v2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1496
    sput-object v1, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1497
    return-object v0
.end method

.method public static backClose()Z
  .registers 2
  .line 1485
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1486
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1487
    return v0
.end method

.method public static bootReady()Z
  .catchall { :L2 .. :L7 } :L6
  .registers 8
  .line 557
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 558
    sget-wide v2, Lcom/innioasis/ipp/Albums;->bootAsked:J
    const/4 v4, 1
    const-wide/16 v5, 0
    cmp-long v7, v2, v5
    if-nez v7, :L0
  .line 559
    sput-wide v0, Lcom/innioasis/ipp/Albums;->bootAsked:J
  .line 560
    sput-boolean v4, Lcom/innioasis/ipp/Albums;->started:Z
  .line 561
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez v0, :L0
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  :L0
  .line 563
    invoke-static { }, Lcom/innioasis/ipp/Albums;->bootWaitOver()Z
    move-result v0
    if-eqz v0, :L1
    return v4
  :L1
  .line 564
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L2
  .line 565
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L3
    sget-object v2, Lcom/innioasis/ipp/Albums;->preparedFor:Ljava/util/List;
    if-ne v1, v2, :L3
    monitor-exit v0
    return v4
  :L3
  .line 568
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
  .line 569
    move-exception v1
    monitor-exit v0
  :L7
    throw v1
.end method

.method public static bootWaitOver()Z
  .registers 5
  .line 574
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
  .line 542
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Asc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v0
    if-eq p0, v0, :L1
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Desc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
  .line 543
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
  .line 542
    return p0
.end method

.method public static byDisc(Ljava/util/List;)Ljava/util/List;
  .registers 3
  .line 1856
    if-eqz p0, :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L0
    goto :L1
  :L0
  .line 1857
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1858
    sget-object p0, Lcom/innioasis/ipp/Albums;->DISC_CMP:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1859
    return-object v0
  :L1
  .line 1856
    return-object p0
.end method

.method private static byYear(Ljava/util/ArrayList;)Ljava/util/List;
  .catchall { :L0 .. :L6 } :L7
  .registers 6
  :L0
  .line 1205
    invoke-static { }, Lcom/innioasis/ipp/Albums;->albumSortValue()I
    move-result v0
  .line 1206
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
  .line 1207
    if-nez v1, :L3
    sget-object v4, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Asc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v4
    if-eq v0, v4, :L3
    return-object p0
  :L3
  .line 1208
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
  .line 1209
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    invoke-virtual { p0, v2, v0 }, Ljava/util/ArrayList;->subList(II)Ljava/util/List;
    move-result-object v0
  .line 1210
    invoke-static { v0 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  .line 1211
    new-instance v2, Lcom/innioasis/ipp/YearComparator;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/YearComparator;-><init>(Z)V
    invoke-static { v0, v2 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L6
  .line 1213
    goto :L8
  :L7
  .line 1212
    move-exception v0
  :L8
  .line 1214
    return-object p0
.end method

.method public static cacheCleared()V
  .registers 3
  .line 934
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 935
    if-nez v0, :L0
    return-void
  :L0
  .line 936
    const-string v1, "cache_n"
    const/4 v2, -1
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 937
    const-string v1, "cache_t"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 938
    const-string v1, "cache_v"
    const/4 v2, 0
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 939
    const-string v1, "cache_m"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 940
    return-void
.end method

.method public static cacheCleared(I)V
  .registers 4
  .line 944
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 945
    if-nez v0, :L0
    return-void
  :L0
  .line 946
    const/4 v1, 0
    const-string v2, "cache_m"
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    xor-int/lit8 p0, p0, -1
    and-int/2addr p0, v1
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 947
    return-void
.end method

.method public static cached(Landroid/content/Context;III)Z
  .registers 4
  .line 919
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
  .line 910
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 911
    const-string v1, "cache_n"
    const/4 v2, -1
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    if-ne v1, p1, :L2
  .line 912
    const-string p1, "cache_t"
    invoke-static { p0, p1, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p1
    if-ne p1, p2, :L2
  .line 913
    const-string p1, "cache_v"
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p1
    const/4 p2, 4
    if-eq p1, p2, :L1
    goto :L2
  :L1
  .line 914
    const-string p1, "cache_m"
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p0
    return p0
  :L2
  .line 913
    return v0
.end method

.method private static cmpLong(JJ)I
  .registers 5
  .line 1957
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
  .line 1952
    const-string v0, ""
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  :L1
  .line 1953
    if-nez p1, :L2
    goto :L3
  :L2
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  :L3
  .line 1954
    invoke-virtual { p0, v0 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method public static coverKey(Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 995
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
  .line 996
    sget-object v0, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
  .line 997
    if-nez v0, :L6
  .line 998
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 999
    if-nez v0, :L1
    return-object p0
  :L1
  .line 1000
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 1001
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 1002
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L2
  .line 1003
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L5
  .line 1004
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
  .line 1005
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
  .line 1006
    instance-of v4, v3, Ljava/util/LinkedHashSet;
    if-nez v4, :L3
    goto :L2
  :L3
  .line 1007
    check-cast v3, Ljava/util/LinkedHashSet;
  .line 1008
    invoke-virtual { v3 }, Ljava/util/LinkedHashSet;->size()I
    move-result v4
    const/4 v5, 1
    if-eq v4, v5, :L4
    goto :L2
  :L4
  .line 1009
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
  .line 1010
    invoke-virtual { v3 }, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v2, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 1011
    goto :L2
  :L5
  .line 1012
    sput-object v1, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
    move-object v0, v1
  :L6
  .line 1014
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  .line 1015
    if-nez v0, :L7
    goto :L8
  :L7
    move-object p0, v0
    check-cast p0, Ljava/lang/String;
  :L8
    return-object p0
  :L9
  .line 995
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
  .line 1821
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L15
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L15
  :L0
  .line 1822
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1823
    if-nez v0, :L1
    return-object v1
  :L1
  .line 1824
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1825
    if-eqz p1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->onlyScoped(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    move-result-object p0
  :L2
  .line 1826
    nop
  .line 1827
    nop
  .line 1828
    nop
  .line 1829
    nop
  .line 1830
    nop
  .line 1831
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
  .line 1832
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1834
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
  .line 1835
    if-eqz v4, :L4
    invoke-virtual { v4, v7 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-nez v8, :L5
  :L4
  .line 1836
    nop
  .line 1837
    invoke-static { v7 }, Lcom/innioasis/ipp/Albums;->discNumber(Ljava/lang/String;)I
    move-result v0
    move-object v4, v7
  :L5
  .line 1839
    if-lez v0, :L6
    move v7, v0
    goto :L7
  :L6
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/DiscCache;->get(Ljava/lang/String;)I
    move-result v7
  :L7
  .line 1840
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
  .line 1841
    if-eqz v3, :L10
    if-lt v7, v2, :L10
    if-ne v7, v2, :L11
    invoke-virtual { v8, v5 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v9
    if-gez v9, :L11
  :L10
  .line 1842
    nop
  .line 1843
    nop
  .line 1844
    move-object v3, v6
    move v2, v7
    move-object v5, v8
  :L11
  .line 1831
    add-int/lit8 p1, p1, 1
    goto :L3
  :L12
  .line 1847
    if-nez v3, :L13
    goto :L14
  :L13
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L14
    return-object v1
  :L15
  .line 1821
    return-object v1
.end method

.method public static focus(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .registers 6
  .line 1514
    sget-object v0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1515
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1516
    if-eqz v0, :L6
    if-nez p0, :L0
    goto :L6
  :L0
  .line 1517
    const/4 v1, 0
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
    if-ge v1, v2, :L5
  .line 1518
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  .line 1519
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v3, :L4
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L4
  .line 1520
    if-nez p1, :L2
  .line 1521
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
    goto :L3
  :L2
  .line 1523
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  :L3
  .line 1525
    return-void
  :L4
  .line 1517
    add-int/lit8 v1, v1, 1
    goto :L1
  :L5
  .line 1528
    return-void
  :L6
  .line 1516
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
  .line 1153
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 1154
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 1155
    const/4 v2, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L6
  .line 1156
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1157
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L1
    const-string v4, ""
    goto :L2
  :L1
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v4
  :L2
  .line 1158
    invoke-virtual { v0, v4 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
  .line 1159
    if-nez v5, :L3
    const/4 v5, 0
    goto :L4
  :L3
    check-cast v5, Ljava/util/LinkedHashSet;
  :L4
  .line 1160
    if-nez v5, :L5
    new-instance v5, Ljava/util/LinkedHashSet;
    invoke-direct { v5 }, Ljava/util/LinkedHashSet;-><init>()V
    invoke-virtual { v0, v4, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 1161
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v5, v3 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  .line 1155
    add-int/lit8 v2, v2, 1
    goto :L0
  :L6
  .line 1163
    return-object v0
.end method

.method private static foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .catchall { :L0 .. :L2 } :L23
  .catchall { :L18 .. :L19 } :L20
  .catchall { :L21 .. :L22 } :L20
  .catchall { :L24 .. :L25 } :L23
  .registers 18
  .line 1023
    move-object/from16 v0, p0
    sget-object v1, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v1
  :L0
  .line 1024
    sget-object v2, Lcom/innioasis/ipp/Albums;->foldersFor:Ljava/util/List;
    if-ne v2, v0, :L1
    sget-object v2, Lcom/innioasis/ipp/Albums;->foldersMemo:Ljava/util/LinkedHashMap;
    if-eqz v2, :L1
    monitor-exit v1
    return-object v2
  :L1
  .line 1025
    monitor-exit v1
  :L2
  .line 1026
    new-instance v1, Ljava/util/LinkedHashMap;
    invoke-direct { v1 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 1027
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
  .line 1028
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 1031
    new-instance v5, Lcom/innioasis/ipp/Albums$Dirs;
    const/4 v6, 0
    invoke-direct { v5, v6 }, Lcom/innioasis/ipp/Albums$Dirs;-><init>(Lcom/innioasis/ipp/Albums$1;)V
  .line 1032
    new-instance v7, Ljava/util/HashMap;
    invoke-direct { v7 }, Ljava/util/HashMap;-><init>()V
  .line 1033
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8 }, Ljava/util/ArrayList;-><init>()V
  .line 1034
    new-instance v9, Ljava/util/ArrayList;
    invoke-direct { v9 }, Ljava/util/ArrayList;-><init>()V
  .line 1035
    const/4 v11, 0
  :L3
    invoke-interface/range { p0 .. p0 }, Ljava/util/List;->size()I
    move-result v12
    if-ge v11, v12, :L17
  .line 1036
    invoke-interface { v0, v11 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Lcom/innioasis/y1/database/Song;
  .line 1037
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v13
    if-nez v13, :L4
    const-string v13, ""
    goto :L5
  :L4
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v13
  :L5
  .line 1038
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v14
  .line 1039
    invoke-virtual { v5, v14 }, Lcom/innioasis/ipp/Albums$Dirs;->find(Ljava/lang/String;)I
    move-result v15
  .line 1040
    if-gez v15, :L7
  .line 1041
    invoke-static { v14 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v15
  .line 1042
    invoke-virtual { v7, v15 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v16
  .line 1043
    if-nez v16, :L6
  .line 1044
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result v16
    invoke-static/range { v16 .. v16 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
  .line 1045
    invoke-virtual { v7, v15, v6 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 1046
    invoke-virtual { v8, v15 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1047
    new-instance v15, Ljava/util/ArrayList;
    const/4 v10, 2
    invoke-direct { v15, v10 }, Ljava/util/ArrayList;-><init>(I)V
    invoke-virtual { v9, v15 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    move-object/from16 v16, v6
  :L6
  .line 1049
    check-cast v16, Ljava/lang/Integer;
    invoke-virtual/range { v16 .. v16 }, Ljava/lang/Integer;->intValue()I
    move-result v15
  .line 1050
    invoke-virtual { v5, v14, v15 }, Lcom/innioasis/ipp/Albums$Dirs;->add(Ljava/lang/String;I)V
  :L7
  .line 1052
    invoke-virtual { v9, v15 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/util/ArrayList;
  .line 1053
    nop
  .line 1054
    const/4 v10, 0
  :L8
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v14
    if-ge v10, v14, :L11
  .line 1055
    invoke-virtual { v6, v10 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v14
  .line 1056
    if-eq v14, v13, :L10
    invoke-virtual { v14, v13 }, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v14
    if-eqz v14, :L9
    goto :L10
  :L9
  .line 1054
    add-int/lit8 v10, v10, 2
    goto :L8
  :L10
  .line 1056
    add-int/lit8 v10, v10, 1
    invoke-virtual { v6, v10 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Ljava/util/ArrayList;
    goto :L12
  :L11
  .line 1054
    const/4 v10, 0
  :L12
  .line 1058
    if-nez v10, :L16
  .line 1059
    new-instance v10, Ljava/util/ArrayList;
    invoke-direct { v10 }, Ljava/util/ArrayList;-><init>()V
  .line 1060
    invoke-virtual { v6, v13 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1061
    invoke-virtual { v6, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1062
    invoke-virtual { v8, v15 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
  .line 1063
    invoke-virtual { v1, v13 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v14
  .line 1064
    if-nez v14, :L13
    const/4 v14, 0
    goto :L14
  :L13
    check-cast v14, Ljava/util/LinkedHashSet;
  :L14
  .line 1065
    if-nez v14, :L15
    new-instance v14, Ljava/util/LinkedHashSet;
    invoke-direct { v14 }, Ljava/util/LinkedHashSet;-><init>()V
    invoke-virtual { v1, v13, v14 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L15
  .line 1066
    invoke-virtual { v14, v6 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  .line 1067
    invoke-static { v13, v6 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v2, v6, v10 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L16
  .line 1069
    invoke-virtual { v10, v12 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1035
    add-int/lit8 v11, v11, 1
    const/4 v6, 0
    goto/16 :L3
  :L17
  .line 1071
    sget-object v6, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v6
  :L18
  .line 1072
    sput-object v0, Lcom/innioasis/ipp/Albums;->foldersFor:Ljava/util/List;
  .line 1073
    sput-object v1, Lcom/innioasis/ipp/Albums;->foldersMemo:Ljava/util/LinkedHashMap;
  .line 1074
    sput-object v2, Lcom/innioasis/ipp/Albums;->albumSongsMemo:Ljava/util/HashMap;
  .line 1075
    monitor-exit v6
  :L19
  .line 1076
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
  .line 1077
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
  .line 1078
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
  .line 1076
    invoke-static { v6, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 1079
    return-object v1
  :L20
  .line 1075
    move-exception v0
  :L21
    monitor-exit v6
  :L22
    throw v0
  :L23
  .line 1025
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
  .line 1789
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
  .line 501
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 502
    sget-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 503
    const/4 v2, 0
    sput-object v2, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 504
    sput-object v2, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
  .line 505
    if-eqz p0, :L5
    if-eqz v1, :L5
    sget p0, Lcom/innioasis/ipp/Albums;->foreign:I
    sget v3, Lcom/innioasis/ipp/Albums;->markForeign:I
    if-eq p0, v3, :L1
    goto :L5
  :L1
  .line 506
    sget-object p0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez p0, :L4
    sget-object p0, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
    if-eq p0, v1, :L2
    goto :L4
  :L2
  .line 507
    sput-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 508
    sget-wide v3, Lcom/innioasis/ipp/Albums;->prevAt:J
    sput-wide v3, Lcom/innioasis/ipp/Albums;->songCacheAt:J
  .line 509
    sget-object p0, Lcom/innioasis/ipp/Albums;->prevSig:Ljava/lang/String;
    sput-object p0, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
  .line 510
    sget-object p0, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
    sput-object p0, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 511
    sget-object p0, Lcom/innioasis/ipp/Albums;->sortedPrevType:Ljava/lang/Object;
    sput-object p0, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
  .line 512
    sput-object v2, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
  .line 513
    sput-object v2, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
  .line 514
    monitor-exit v0
  :L3
  .line 515
    const-string p0, "library scan: nothing written, the list in memory is kept"
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 516
    return-void
  :L4
  .line 506
    monitor-exit v0
    return-void
  :L5
  .line 505
    monitor-exit v0
    return-void
  :L6
  .line 514
    move-exception p0
    monitor-exit v0
  :L7
    throw p0
.end method

.method private static keepNames(Ljava/util/List;ZLjava/util/List;)V
  .catchall { :L1 .. :L4 } :L3
  .registers 5
  .line 1639
    if-eqz p0, :L5
    if-nez p2, :L0
    goto :L5
  :L0
  .line 1640
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L1
  .line 1641
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loaded()Ljava/util/List;
    move-result-object v1
    if-eq v1, p0, :L2
    monitor-exit v0
    return-void
  :L2
  .line 1642
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Albums;->namesFor:Ljava/lang/ref/WeakReference;
  .line 1643
    sput-boolean p1, Lcom/innioasis/ipp/Albums;->namesRev:Z
  .line 1644
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, p2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    sput-object p0, Lcom/innioasis/ipp/Albums;->namesMemo:Ljava/util/List;
  .line 1645
    monitor-exit v0
  .line 1646
    return-void
  :L3
  .line 1645
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
  :L5
  .line 1639
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
  .line 1327
    sget-object v0, Lcom/innioasis/ipp/Albums;->listKey:Ljava/lang/String;
  .line 1328
    const/4 v1, 0
    if-eqz v0, :L3
    if-nez p0, :L0
    goto :L3
  :L0
  .line 1329
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
  .line 1328
    return-object v1
.end method

.method public static listForView(Ljava/util/List;Landroid/app/Activity;)Ljava/util/List;
  .registers 9
  .line 1168
    nop
  .line 1169
    const/4 v0, 0
    if-eqz p1, :L0
  .line 1170
    invoke-virtual { p1 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p1
  .line 1171
    if-eqz p1, :L0
    const-string v1, "ipp_artist"
    invoke-virtual { p1, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    goto :L1
  :L0
  .line 1173
    move-object p1, v0
  :L1
    sput-object p1, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1174
    const/4 v1, 0
    if-eqz p1, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
    sput-boolean v2, Lcom/innioasis/ipp/Albums;->artistList:Z
  .line 1175
    if-nez p1, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->split(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L4
  .line 1177
    if-nez p0, :L5
    return-object p0
  :L5
  .line 1180
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Artists;->forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
  .line 1181
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
  .line 1182
    if-eqz v0, :L17
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L8
    goto/16 :L17
  :L8
  .line 1183
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersByName(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v2
  .line 1184
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
  .line 1185
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 1186
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L9
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->allMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v3, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L9
  .line 1187
    const/4 p1, 0
  :L10
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-ge p1, v0, :L16
  .line 1188
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
  .line 1189
    if-nez v0, :L11
    const-string v4, ""
    goto :L12
  :L11
    move-object v4, v0
  :L12
    invoke-virtual { v2, v4 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
  .line 1190
    if-nez v4, :L13
    goto :L15
  :L13
  .line 1191
    new-instance v5, Ljava/util/ArrayList;
    check-cast v4, Ljava/util/LinkedHashSet;
    invoke-direct { v5, v4 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1192
    sget-object v4, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v5, v4 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1193
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
  .line 1187
    add-int/lit8 p1, p1, 1
    goto :L10
  :L16
  .line 1195
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
  .line 1196
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->byYear(Ljava/util/ArrayList;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L17
  .line 1182
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
.end method

.method private static lists()V
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L6 .. :L7 } :L5
  .registers 4
  .line 520
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 521
    if-nez v0, :L0
    return-void
  :L0
  .line 522
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .line 523
    const/16 v1, 720
    invoke-static { v1 }, Lcom/innioasis/ipp/Scan;->loaded(I)V
  .line 524
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->index(Ljava/util/List;)V
  .line 525
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 526
    if-nez v1, :L1
    return-void
  :L1
  .line 527
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Albums;->prepareAlbums(Lcom/innioasis/y1/database/Y1Repository;Ljava/util/List;)V
  .line 528
    const/16 v2, 800
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->loaded(I)V
  .line 529
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    sget-object v3, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 530
    invoke-virtual { v3 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAllSong()I
    move-result v3
  .line 529
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object v2
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Albums;->songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .line 531
    const/16 v1, 960
    invoke-static { v1 }, Lcom/innioasis/ipp/Scan;->loaded(I)V
  .line 532
    const/4 v1, 0
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->sortValue(Z)I
    move-result v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->byDate(I)Z
    move-result v1
    if-eqz v1, :L2
  .line 533
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
    move-result-object v1
  .line 534
    if-eqz v1, :L2
    new-instance v2, Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    move-result-object v1
    invoke-direct { v2, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { v2 }, Lcom/innioasis/ipp/YearCache;->prepare(Ljava/util/List;)V
  :L2
  .line 536
    sget-object v1, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v1
  :L3
    sput-object v0, Lcom/innioasis/ipp/Albums;->preparedFor:Ljava/util/List;
    monitor-exit v1
  :L4
  .line 537
    invoke-static { }, Lcom/innioasis/ipp/Lab;->reads()V
  .line 538
    invoke-static { }, Lcom/innioasis/ipp/Lab;->ids()V
  .line 539
    return-void
  :L5
  .line 536
    move-exception v0
  :L6
    monitor-exit v1
  :L7
    throw v0
.end method

.method public static loadNow()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 462
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->menuShown:Z
    if-nez v0, :L0
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Albums;->scanToast:Z
  :L0
  .line 464
    invoke-static { }, Lcom/innioasis/ipp/Scan;->clean()Z
    move-result v0
  .line 465
    invoke-static { }, Lcom/innioasis/ipp/Scan;->done()V
  .line 466
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->keep(Z)V
  .line 467
    invoke-static { }, Lcom/innioasis/ipp/Albums;->lists()V
  .line 468
    invoke-static { }, Lcom/innioasis/ipp/Schema;->backfill()V
  :L1
    goto :L3
  :L2
  .line 469
    move-exception v0
  :L3
  .line 471
    invoke-static { }, Lcom/innioasis/ipp/Scan;->tailEnds()V
  .line 472
    nop
  .line 473
    return-void
.end method

.method static loaded()Ljava/util/List;
  .registers 1
  .line 951
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    return-object v0
.end method

.method static lowerEq(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 10
  .line 789
    const/4 v0, 1
    const/4 v1, 0
    if-eqz p0, :L12
    if-nez p1, :L0
    goto :L12
  :L0
  .line 790
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v3
    if-eq v2, v3, :L1
    return v1
  :L1
  .line 791
    sget v2, Lcom/innioasis/ipp/Albums;->unicodeLower:I
    if-gez v2, :L2
    invoke-static { }, Lcom/innioasis/ipp/Albums;->askLower()I
    move-result v2
    sput v2, Lcom/innioasis/ipp/Albums;->unicodeLower:I
  :L2
  .line 792
    sget v2, Lcom/innioasis/ipp/Albums;->unicodeLower:I
    if-ne v2, v0, :L3
    const/4 v2, 1
    goto :L4
  :L3
    const/4 v2, 0
  :L4
  .line 793
    const/4 v3, 0
  :L5
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v4
    if-ge v3, v4, :L11
  .line 794
    invoke-virtual { p0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result v4
  .line 795
    invoke-virtual { p1, v3 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 796
    if-ne v4, v5, :L6
    goto :L10
  :L6
  .line 797
    if-eqz v2, :L7
  .line 798
    invoke-static { v4 }, Ljava/lang/Character;->toLowerCase(C)C
    move-result v4
    invoke-static { v5 }, Ljava/lang/Character;->toLowerCase(C)C
    move-result v5
    if-eq v4, v5, :L10
    return v1
  :L7
  .line 800
    const/16 v6, 90
    const/16 v7, 65
    if-lt v4, v7, :L8
    if-gt v4, v6, :L8
    add-int/lit8 v4, v4, 32
    int-to-char v4, v4
  :L8
  .line 801
    if-lt v5, v7, :L9
    if-gt v5, v6, :L9
    add-int/lit8 v5, v5, 32
    int-to-char v5, v5
  :L9
  .line 802
    if-eq v4, v5, :L10
    return v1
  :L10
  .line 793
    add-int/lit8 v3, v3, 1
    goto :L5
  :L11
  .line 805
    return v0
  :L12
  .line 789
    if-ne p0, p1, :L13
    goto :L14
  :L13
    const/4 v0, 0
  :L14
    return v0
.end method

.method private static matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
  .registers 7
  .line 1728
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
    move-result-object v0
  .line 1729
    if-eqz v0, :L4
  .line 1730
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
  .line 1731
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
  .line 1733
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1734
    const/4 v1, 0
  :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L7
  .line 1735
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1736
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
  .line 1734
    add-int/lit8 v1, v1, 1
    goto :L5
  :L7
  .line 1738
    return-object v0
.end method

.method static mirror(Ljava/util/List;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 8
  .line 761
    if-eqz p0, :L7
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->pairOf(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object v0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 762
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 763
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, v0 }, Ljava/util/ArrayList;-><init>(I)V
  .line 764
    nop
  :L1
  .line 765
    if-lez v0, :L6
  .line 766
    add-int/lit8 v2, v0, -1
    move v3, v2
  :L2
  .line 767
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
  .line 768
    move v2, v3
  :L4
    if-ge v2, v0, :L5
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v2, v2, 1
    goto :L4
  :L5
  .line 769
    nop
  .line 770
    move v0, v3
    goto :L1
  :L6
  .line 771
    return-object v1
  :L7
  .line 761
    const/4 p0, 0
    return-object p0
.end method

.method public static noteAlbumList(Landroid/app/Activity;)V
  .registers 1
  .line 1272
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->artistView(Landroid/app/Activity;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->artistList:Z
  .line 1273
    return-void
.end method

.method public static noteAlbumSort(I)V
  .registers 3
  .line 1300
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->artistList:Z
    if-eqz v0, :L1
  .line 1301
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 1302
    if-eqz v0, :L0
    const-string v1, "artist_album_sort"
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L0
  .line 1303
    return-void
  :L1
  .line 1305
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAlbum(I)V
  .line 1306
    return-void
.end method

.method public static noteCached(Landroid/content/Context;III)V
  .registers 6
  .line 924
    if-nez p0, :L0
    return-void
  :L0
  .line 925
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Albums;->cachedMask(Landroid/content/Context;II)I
    move-result v0
  .line 926
    const-string v1, "cache_n"
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 927
    const-string p1, "cache_t"
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 928
    const-string p1, "cache_v"
    const/4 p2, 4
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 929
    const-string p1, "cache_m"
    or-int p2, v0, p3
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 930
    return-void
.end method

.method public static noteListAlbum(Ljava/lang/String;)V
  .registers 1
  .line 1794
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->allList:Z
  .line 1795
    return-void
.end method

.method public static noteListScroll(Landroid/view/View;Ljava/lang/Object;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 1538
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1540
    if-eqz p0, :L7
  :L0
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    goto :L7
  :L1
  .line 1541
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->first(Landroid/view/View;)I
    move-result v1
  .line 1542
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Lv;->row(Landroid/view/View;I)Landroid/view/View;
    move-result-object p0
  .line 1543
    if-nez p0, :L2
    const/4 p0, 0
    goto :L3
  :L2
    invoke-virtual { p0 }, Landroid/view/View;->getTop()I
    move-result p0
  :L3
    sput p0, Lcom/innioasis/ipp/Albums;->listTop:I
  .line 1544
    sput v1, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1545
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Albums;->listPos:I
  :L4
  .line 1548
    goto :L6
  :L5
  .line 1546
    move-exception p0
  .line 1547
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  :L6
  .line 1549
    return-void
  :L7
  .line 1540
    return-void
.end method

.method public static noteReturn(Ljava/lang/String;)V
  .registers 1
  .line 1479
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1480
    sget-object p0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1481
    return-void
.end method

.method public static noteSort(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
  .registers 3
  .line 1348
    if-nez p1, :L0
    return-void
  :L0
  .line 1349
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p1
  .line 1350
    sput p1, Lcom/innioasis/ipp/Albums;->songSort:I
  .line 1351
    sput-object p0, Lcom/innioasis/ipp/Albums;->listKey:Ljava/lang/String;
  .line 1352
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L2
  .line 1353
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 1354
    if-eqz p0, :L1
    const-string v0, "all_sort"
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 1355
    return-void
  :L2
  .line 1357
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAlbumSong(I)V
  .line 1358
    return-void
.end method

.method private static odd(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 444
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    xor-int/lit8 p0, p0, 1
    return p0
.end method

.method private static one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 448
    if-nez p1, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 449
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
  .line 450
    if-nez v0, :L1
  .line 451
    invoke-virtual { p0, p1, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 452
    return-object p1
  :L1
  .line 454
    return-object v0
.end method

.method private static onlyScoped(Ljava/util/ArrayList;)Ljava/util/ArrayList;
  .registers 6
  .line 1769
    sget-object v0, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1770
    if-eqz v0, :L7
    invoke-virtual { p0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L7
    invoke-static { }, Lcom/innioasis/ipp/Albums;->scopeEnabled()Z
    move-result v1
    if-nez v1, :L0
    goto :L7
  :L0
  .line 1772
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    return-object p0
  :L1
  .line 1773
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1774
    const/4 v2, 0
  :L2
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 1775
    invoke-virtual { p0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1776
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L3
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1774
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 1779
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L5
    goto :L6
  :L5
    move-object p0, v1
  :L6
    return-object p0
  :L7
  .line 1770
    return-object p0
.end method

.method public static openAlbumFrom(Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 4
  .line 1468
    if-nez p0, :L0
    return-void
  :L0
  .line 1469
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->openTarget(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
    move-result-object p1
  .line 1470
    if-nez p1, :L1
    return-void
  :L1
  .line 1471
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1472
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 1473
    const-string v1, "ipp_open_album"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1474
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 1475
    return-void
.end method

.method public static openAlbumName(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 3
  .line 1444
    if-eqz p0, :L1
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1445
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    const/4 v0, 0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Albums;->openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .line 1446
    return-void
  :L1
  .line 1444
    return-void
.end method

.method public static openAlbumOfSong(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;)V
  .registers 3
  .line 1450
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 1451
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Albums;->openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .line 1452
    return-void
  :L1
  .line 1450
    return-void
.end method

.method public static openArtistFrom(Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 3
  .line 1405
    sget-object v0, Lcom/innioasis/ipp/Albums;->songDlg:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Artists;->openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p0
    return p0
.end method

.method private static openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 1455
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1456
    sput-object p2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1457
    const/4 p2, 1
    sput-boolean p2, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1458
    const/4 p2, 0
    sput-object p2, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1459
    sput-object p2, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1460
    sput-object p2, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1461
    new-instance p2, Landroid/content/Intent;
    const-class v0, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { p2, p0, v0 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 1462
    const-string v0, "ipp_open_album"
    invoke-virtual { p2, v0, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1463
    invoke-virtual { p0, p2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 1464
    return-void
  :L1
  .line 1455
    return-void
.end method

.method public static openRequest(Landroid/app/Activity;)Ljava/lang/String;
  .catchall { :L0 .. :L5 } :L2
  .registers 3
  .line 1503
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-nez v1, :L1
    goto :L3
  :L1
  .line 1504
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_open_album"
    invoke-virtual { p0, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    goto :L4
  :L2
  .line 1507
    move-exception p0
    goto :L6
  :L3
  .line 1504
    move-object p0, v0
  :L4
  .line 1505
    if-nez p0, :L7
    sput-object v0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  :L5
    goto :L7
  :L6
  .line 1508
    return-object v0
  :L7
  .line 1506
    return-object p0
.end method

.method public static openTarget(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
  .registers 5
  .line 1420
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 1421
    nop
  .line 1422
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 1423
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
  .line 1424
    move-object v3, v0
  :L2
    if-nez v3, :L3
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v3
  :L3
  .line 1425
    instance-of p0, v3, Lcom/innioasis/y1/database/Song;
    if-nez p0, :L4
    return-object v0
  :L4
  .line 1426
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1427
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
  .line 1428
    if-nez p0, :L5
    return-object v0
  :L5
  .line 1429
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    sput-object v3, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1430
    sput-boolean v2, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1431
    sput-object v0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1432
    sput-object v0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1434
    sput-object v0, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1435
    if-eqz v1, :L6
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L6
  .line 1436
    return-object p0
.end method

.method private static orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
  .registers 2
  .line 656
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L0
    const-string p0, "lower(pinyinName)"
    return-object p0
  :L0
  .line 657
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L1
    const-string p0, "lower(pinyinName) desc"
    return-object p0
  :L1
  .line 658
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L2
    const-string p0, "fileDate"
    return-object p0
  :L2
  .line 659
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L3
    const-string p0, "fileDate desc"
    return-object p0
  :L3
  .line 660
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L4
    const-string p0, "lower(pinyinSongName) asc"
    return-object p0
  :L4
  .line 661
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L5
    const-string p0, "lower(pinyinSongName) desc"
    return-object p0
  :L5
  .line 662
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L6
    const-string p0, "lower(pinyinAlbum) desc"
    return-object p0
  :L6
  .line 663
    const/4 p0, 0
    return-object p0
.end method

.method private static orderNow()Ljava/lang/Object;
  .registers 2
  .line 579
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 580
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result v1
    if-eqz v1, :L2
  .line 581
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L1
  :L0
  .line 582
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L1
  .line 581
    return-object v0
  :L2
  .line 584
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    if-eqz v0, :L3
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L4
  :L3
  .line 585
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L4
  .line 584
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
  .line 672
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
    move-result-object p0
  .line 673
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 674
    const/4 v1, 0
    if-eqz p0, :L34
    if-nez v0, :L0
    goto/16 :L34
  :L0
  .line 675
    nop
  :L1
  .line 677
    new-instance v2, Ljava/util/HashMap;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    mul-int/lit8 v3, v3, 2
    invoke-direct { v2, v3 }, Ljava/util/HashMap;-><init>(I)V
  .line 678
    const/4 v3, 0
    const/4 v4, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 679
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 680
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-eqz v6, :L3
    move-object v6, v5
    check-cast v6, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v2, v6, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 678
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 682
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
  .line 683
    invoke-interface { p0 }, Landroid/database/Cursor;->getCount()I
    move-result v4
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v5
  :L6
    if-eq v4, v5, :L11
  .line 694
    if-eqz p0, :L10
  :L7
  .line 696
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L8
  .line 698
    goto :L10
  :L9
  .line 697
    move-exception p0
  :L10
  .line 683
    return-object v1
  :L11
  .line 684
    new-instance v4, Ljava/util/ArrayList;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    invoke-direct { v4, v0 }, Ljava/util/ArrayList;-><init>(I)V
  :L12
  .line 685
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v0
    if-eqz v0, :L22
  .line 686
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
  .line 687
    if-nez v0, :L20
  .line 694
    if-eqz p0, :L19
  :L16
  .line 696
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L17
  .line 698
    goto :L19
  :L18
  .line 697
    move-exception p0
  :L19
  .line 687
    return-object v1
  :L20
  .line 688
    invoke-virtual { v4, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L21
  .line 689
    goto :L12
  :L22
  .line 690
    nop
  .line 694
    if-eqz p0, :L26
  :L23
  .line 696
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L24
  .line 698
    goto :L26
  :L25
  .line 697
    move-exception p0
  :L26
  .line 690
    return-object v4
  :L27
  .line 691
    move-exception v0
    goto :L29
  :L28
    move-exception p0
    move-object p0, v1
  :L29
  .line 692
    nop
  .line 694
    if-eqz p0, :L33
  :L30
  .line 696
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L31
  .line 698
    goto :L33
  :L32
  .line 697
    move-exception p0
  :L33
  .line 692
    return-object v1
  :L34
  .line 674
    return-object v1
.end method

.method static pairOf(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  .registers 2
  .line 746
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L0
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L0
  .line 747
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L1
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L1
  .line 748
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L2
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L2
  .line 749
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L3
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L3
  .line 750
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L4
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L4
  .line 751
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L5
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L5
  .line 752
    const/4 p0, 0
    return-object p0
.end method

.method private static prepareAlbums(Lcom/innioasis/y1/database/Y1Repository;Ljava/util/List;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 7
  :L0
  .line 1651
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 1652
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
  .line 1653
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
  .line 1654
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 1655
    invoke-static { p1, v2, p0 }, Lcom/innioasis/ipp/Albums;->keepNames(Ljava/util/List;ZLjava/util/List;)V
  .line 1656
    if-eqz p0, :L5
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->splitRows(Ljava/util/List;Ljava/util/List;)Ljava/util/ArrayList;
  :L5
  .line 1657
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
  .line 1658
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
  .line 1657
    invoke-static { p0, p1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L6
  .line 1660
    goto :L8
  :L7
  .line 1659
    move-exception p0
  :L8
  .line 1661
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
  .line 958
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 959
    sget-object v1, Lcom/innioasis/ipp/Albums;->reader:Ljava/lang/Thread;
    if-eqz v1, :L5
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v2
  :L1
    if-eq v1, v2, :L5
  :L2
  .line 961
    sget-object v1, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    invoke-virtual { v1 }, Ljava/lang/Object;->wait()V
  :L3
  .line 964
    goto :L0
  :L4
  .line 962
    move-exception v1
  .line 963
    nop
  :L5
  .line 966
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L6
    monitor-exit v0
    return-object v1
  :L6
  .line 967
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Albums;->reader:Ljava/lang/Thread;
  .line 968
    monitor-exit v0
  :L7
  .line 970
    const/4 v0, 0
  :L8
    invoke-static { }, Lcom/innioasis/ipp/Albums;->readSongs()Ljava/util/List;
    move-result-object v1
  :L9
  .line 972
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L10
  .line 973
    sput-object v0, Lcom/innioasis/ipp/Albums;->reader:Ljava/lang/Thread;
  .line 974
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 975
    monitor-exit v2
  .line 970
    return-object v1
  :L11
  .line 975
    move-exception v0
    monitor-exit v2
  :L12
    throw v0
  :L13
  .line 972
    move-exception v1
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L14
  .line 973
    sput-object v0, Lcom/innioasis/ipp/Albums;->reader:Ljava/lang/Thread;
  .line 974
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 975
    monitor-exit v2
  :L15
  .line 976
    throw v1
  :L16
  .line 975
    move-exception v0
  :L17
    monitor-exit v2
  :L18
    throw v0
  :L19
  .line 968
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
    const/16 v0, 550
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->loaded(I)V
  .line 282
    if-ne v3, v9, :L22
  .line 283
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->share(Ljava/util/List;)V
  .line 284
    const/16 v0, 580
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->loaded(I)V
  .line 285
    invoke-static { }, Lcom/innioasis/ipp/Albums;->reserve()V
  :L22
  .line 287
    const/16 v0, 670
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->loaded(I)V
  .line 288
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
  .catchall { :L1 .. :L3 } :L39
  .catchall { :L4 .. :L6 } :L38
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L12 .. :L14 } :L38
  .catchall { :L15 .. :L17 } :L39
  .catchall { :L17 .. :L18 } :L38
  .catchall { :L19 .. :L20 } :L21
  .catchall { :L23 .. :L26 } :L38
  .catchall { :L28 .. :L29 } :L30
  .catchall { :L32 .. :L33 } :L38
  .catchall { :L34 .. :L35 } :L39
  .catchall { :L40 .. :L41 } :L46
  .catchall { :L42 .. :L43 } :L44
  .catchall { :L47 .. :L48 } :L49
  .registers 51
  .line 301
    move-object/from16 v0, p1
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Albums;->orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
    move-result-object v1
  .line 302
    const/4 v2, 0
    if-eqz v1, :L51
    if-nez v0, :L0
    goto/16 :L51
  :L0
  .line 303
    nop
  :L1
  .line 305
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v3
  .line 306
    const/16 v4, 47
    invoke-virtual { v0, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
    const/4 v5, 0
    invoke-virtual { v0, v5, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v6
    long-to-int v4, v6
  .line 307
    new-array v6, v4, [J
  .line 308
    new-array v7, v4, [Lcom/innioasis/y1/database/Song;
  .line 309
    nop
  .line 310
    const-wide/16 v8, -1
    const/4 v10, 0
  :L2
  .line 312
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
  .line 314
    nop
  :L4
  .line 315
    const-string v13, "name"
    invoke-interface { v11, v13 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v13
  .line 316
    const-string v14, "pinyinName"
    invoke-interface { v11, v14 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v14
    const-string v15, "songName"
    invoke-interface { v11, v15 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v15
  .line 317
    const-string v12, "pinyinSongName"
    invoke-interface { v11, v12 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v12
    const-string v5, "artist"
    invoke-interface { v11, v5 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v5
  .line 318
    const-string v2, "pinyinArtist"
    invoke-interface { v11, v2 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v2
    move-wide/from16 v16, v8
    const-string v8, "album"
    invoke-interface { v11, v8 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v8
  .line 319
    const-string v9, "pinyinAlbum"
    invoke-interface { v11, v9 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v9
    move/from16 v18, v10
    const-string v10, "genre"
    invoke-interface { v11, v10 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v10
  .line 320
    const-string v0, "pinyinGenre"
    invoke-interface { v11, v0 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v0
    move-object/from16 v19, v3
    const-string v3, "path"
    invoke-interface { v11, v3 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v3
  .line 321
    move-object/from16 v20, v1
    const-string v1, "isAudiobook"
    invoke-interface { v11, v1 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v1
    move-object/from16 v21, v7
    const-string v7, "date"
    invoke-interface { v11, v7 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v7
  .line 322
    move-object/from16 v22, v6
    const-string v6, "fileDate"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
    move/from16 v23, v6
    const-string v6, "lowerName"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
  .line 323
    move/from16 v24, v6
    const-string v6, "lowAlbum"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
    const/16 v25, 0
    move/from16 v48, v18
    move/from16 v18, v6
    move/from16 v6, v48
  :L5
  .line 324
    invoke-interface { v11 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v26
  :L6
    if-eqz v26, :L13
  .line 325
    if-lt v6, v4, :L11
  .line 360
    if-eqz v11, :L10
  :L7
  .line 362
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L8
  .line 364
    goto :L10
  :L9
  .line 363
    move-exception v0
  :L10
  .line 325
    const/4 v1, 0
    return-object v1
  :L11
  .line 326
    move/from16 v26, v4
    const/4 v4, 0
  :L12
    invoke-interface { v11, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v16
  .line 327
    invoke-static { v11, v3 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v39
  .line 328
    new-instance v4, Lcom/innioasis/y1/database/Song;
    invoke-static { v11, v13 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v29
    invoke-static { v11, v14 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v30
    invoke-static { v11, v15 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v31
    invoke-static { v11, v12 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v32
  .line 329
    invoke-static { v11, v5 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v33
    invoke-static { v11, v2 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v34
    invoke-static { v11, v8 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v35
    invoke-static { v11, v9 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v36
    invoke-static { v11, v10 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v37
  .line 330
    invoke-static { v11, v0 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v38
    invoke-interface { v11, v1 }, Landroid/database/Cursor;->getInt(I)I
    move-result v40
    invoke-interface { v11, v7 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v41
    move/from16 v47, v0
    move/from16 v0, v23
    invoke-interface { v11, v0 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v43
  .line 331
    move/from16 v23, v0
    move/from16 v0, v24
    invoke-static { v11, v0 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v45
    move/from16 v24, v0
    move/from16 v0, v18
    invoke-static { v11, v0 }, Lcom/innioasis/ipp/Albums;->str(Landroid/database/Cursor;I)Ljava/lang/String;
    move-result-object v46
    move-object/from16 v27, v4
    move-object/from16 v28, v39
    invoke-direct/range { v27 .. v46 }, Lcom/innioasis/y1/database/Song;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJJLjava/lang/String;Ljava/lang/String;)V
  .line 332
    invoke-static { v11, v4 }, Lcom/innioasis/ipp/Schema;->read(Landroid/database/Cursor;Lcom/innioasis/y1/database/Song;)V
  .line 333
    aput-wide v16, v22, v6
  .line 334
    add-int/lit8 v18, v6, 1
    aput-object v4, v21, v6
  .line 335
    move/from16 v4, v25
    add-int/lit8 v25, v4, 1
  .line 336
    move/from16 v6, v18
    move/from16 v4, v26
    move/from16 v18, v0
    move/from16 v0, v47
    goto/16 :L5
  :L13
  .line 337
    move/from16 v26, v4
    move/from16 v4, v25
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L14
  .line 338
    nop
  .line 339
    mul-int/lit16 v0, v6, 500
    const/4 v1, 1
    move/from16 v2, v26
  :L15
    invoke-static { v2, v1 }, Ljava/lang/Math;->max(II)I
    move-result v1
    div-int/2addr v0, v1
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->loaded(I)V
  .line 340
    const/16 v0, 1000
    if-ge v4, v0, :L37
  .line 342
    if-eq v6, v2, :L16
  .line 360
    nop
  .line 342
    const/4 v1, 0
    return-object v1
  :L16
  .line 343
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "select rowid from song where isAudiobook = 0 order by "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    move-object/from16 v1, v20
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    move-object/from16 v3, v19
    const/4 v1, 0
    invoke-virtual { v3, v0, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v11
  :L17
  .line 344
    invoke-interface { v11 }, Landroid/database/Cursor;->getCount()I
    move-result v0
  :L18
    if-eq v0, v2, :L23
  .line 360
    if-eqz v11, :L22
  :L19
  .line 362
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L20
  .line 364
    goto :L22
  :L21
  .line 363
    move-exception v0
  :L22
  .line 344
    const/4 v1, 0
    return-object v1
  :L23
  .line 345
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, v2 }, Ljava/util/ArrayList;-><init>(I)V
  :L24
  .line 346
    invoke-interface { v11 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v1
    if-eqz v1, :L32
  .line 347
    const/4 v4, 0
    invoke-interface { v11, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v1
    move-object/from16 v5, v22
    invoke-static { v5, v1, v2 }, Ljava/util/Arrays;->binarySearch([JJ)I
    move-result v1
  .line 348
    if-ltz v1, :L27
    aget-object v2, v21, v1
    if-nez v2, :L25
    goto :L27
  :L25
  .line 349
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 350
    const/4 v2, 0
    aput-object v2, v21, v1
  :L26
  .line 351
    move-object/from16 v22, v5
    goto :L24
  :L27
  .line 360
    if-eqz v11, :L31
  :L28
  .line 362
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L29
  .line 364
    goto :L31
  :L30
  .line 363
    move-exception v0
  :L31
  .line 348
    const/4 v1, 0
    return-object v1
  :L32
  .line 352
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L33
  .line 353
    nop
  :L34
  .line 354
    invoke-static { }, Lcom/innioasis/ipp/Albums;->tableSig()Ljava/lang/String;
    move-result-object v1
    move-object/from16 v7, p1
    invoke-virtual { v7, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
  :L35
    if-nez v1, :L36
  .line 360
    nop
  .line 354
    const/4 v1, 0
    return-object v1
  :L36
  .line 355
    nop
  .line 360
    nop
  .line 355
    return-object v0
  :L37
  .line 341
    move-object/from16 v7, p1
    move-object/from16 v3, v19
    move-object/from16 v1, v20
    move-object/from16 v5, v22
    const/4 v4, 0
    move v4, v2
    move v10, v6
    move-object v0, v7
    move-wide/from16 v8, v16
    move-object/from16 v7, v21
    const/4 v2, 0
    move-object v6, v5
    const/4 v5, 0
    goto/16 :L2
  :L38
  .line 356
    move-exception v0
    goto :L40
  :L39
    move-exception v0
    const/4 v11, 0
  :L40
  .line 357
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
  :L41
  .line 358
    nop
  .line 360
    if-eqz v11, :L45
  :L42
  .line 362
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L43
  .line 364
    goto :L45
  :L44
  .line 363
    move-exception v0
  :L45
  .line 358
    const/4 v1, 0
    return-object v1
  :L46
  .line 360
    move-exception v0
    move-object v1, v0
    if-eqz v11, :L50
  :L47
  .line 362
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L48
  .line 364
    goto :L50
  :L49
  .line 363
    move-exception v0
  :L50
  .line 366
    throw v1
  :L51
  .line 302
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
  .line 389
    const/high16 v0, 0x01800000
    const/4 v1, 0
  :L0
    new-array v0, v0, [B
    sput-object v0, Lcom/innioasis/ipp/Albums;->block:[B
  .line 390
    invoke-static { v0 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v0
  .line 392
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  :L1
  .line 393
    const/4 v3, 0
  :L2
    const/16 v4, 64
    const-string v5, "ipplab"
    if-ge v3, v4, :L6
  .line 394
    const/high16 v4, 0x00100000
  :L3
    new-array v4, v4, [B
  .line 395
    invoke-static { v4 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v6
    sub-int/2addr v6, v0
    if-lez v6, :L5
  .line 396
    sput-object v4, Lcom/innioasis/ipp/Albums;->cap:[B
  .line 397
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
  .line 398
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
  .line 407
    sput-object v1, Lcom/innioasis/ipp/Albums;->block:[B
  .line 399
    return-void
  :L5
  .line 401
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 393
    add-int/lit8 v3, v3, 1
    goto :L2
  :L6
  .line 403
    const-string v0, "heap reserve: no cap above the block"
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 404
    const-string v0, "heap reserve failed"
    invoke-static { v5, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L7
    goto :L9
  :L8
  .line 405
    move-exception v0
  :L9
  .line 407
    sput-object v1, Lcom/innioasis/ipp/Albums;->block:[B
  .line 408
    nop
  .line 409
    return-void
.end method

.method public static restore(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 1337
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 1338
    const-string v0, "ipp_open_album"
    invoke-virtual { p0, v0, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1339
    sput-object p2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1341
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1342
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1343
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1344
    return-void
  :L1
  .line 1337
    return-void
.end method

.method public static restoreList(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 1553
    if-eqz p0, :L3
    if-nez p1, :L0
    goto :L3
  :L0
  .line 1554
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->set(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/ListAdapter;)V
  .line 1555
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
  .line 1556
    sget v1, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1557
    const/4 v2, -1
    sput v2, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1558
    if-ltz v1, :L1
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result p1
    if-ge v1, p1, :L1
    sget p1, Lcom/innioasis/ipp/Albums;->listPos:I
    if-ne p1, v0, :L1
  .line 1559
    sget p1, Lcom/innioasis/ipp/Albums;->listTop:I
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
    goto :L2
  :L1
  .line 1561
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/SongRows;->select(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L2
  .line 1563
    return-void
  :L3
  .line 1553
    return-void
.end method

.method private static sameKey(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Z
  .registers 8
  .line 776
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    const/4 v1, 1
    const/4 v2, 0
    if-eq p2, v0, :L7
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p2, v0, :L0
    goto :L7
  :L0
  .line 779
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-eq p2, v0, :L2
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p2, v0, :L1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 780
    if-eqz v1, :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p0
    goto :L4
  :L3
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p0
  :L4
  .line 781
    if-eqz v1, :L5
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p1
    goto :L6
  :L5
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object p1
  :L6
  .line 780
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->lowerEq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
  :L7
  .line 777
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
  .line 489
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 490
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
  .line 491
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    sput-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 492
    sget v1, Lcom/innioasis/ipp/Albums;->foreign:I
    sput v1, Lcom/innioasis/ipp/Albums;->markForeign:I
  .line 493
    monitor-exit v0
  .line 494
    return-void
  :L1
  .line 493
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method private static scopeEnabled()Z
  .registers 2
  .line 1763
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 1764
    if-nez v0, :L0
    const/4 v0, 0
    return v0
  :L0
  .line 1765
    const-string v1, "artist_scope"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static share(Ljava/util/List;)V
  .catchall { :L2 .. :L10 } :L11
  .registers 9
  .line 417
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 418
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
  .line 419
    nop
  .line 420
    const/4 v3, 0
    const/4 v4, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v3, v5, :L13
  .line 421
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 422
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-nez v6, :L1
    goto/16 :L12
  :L1
  .line 423
    check-cast v5, Lcom/innioasis/y1/database/Song;
  :L2
  .line 426
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
  .line 427
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
  .line 428
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
  .line 429
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
  .line 430
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
  .line 431
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
  .line 432
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
  .line 433
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
  .line 435
    goto :L12
  :L11
  .line 434
    move-exception v5
  :L12
  .line 420
    add-int/lit8 v3, v3, 1
    goto/16 :L0
  :L13
  .line 437
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
  .line 438
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
  .line 439
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 440
    const-string v0, "ippshare"
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 441
    return-void
.end method

.method static shared(Ljava/util/List;)Ljava/util/List;
  .registers 7
  .line 613
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 614
    if-eqz p0, :L9
    if-nez v0, :L0
    goto :L9
  :L0
  .line 615
    new-instance v1, Ljava/util/HashMap;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    mul-int/lit8 v2, v2, 2
    invoke-direct { v1, v2 }, Ljava/util/HashMap;-><init>(I)V
  .line 616
    const/4 v2, 0
    const/4 v3, 0
  :L1
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L3
  .line 617
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 618
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L2
    move-object v5, v4
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v1, v5, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 616
    add-int/lit8 v3, v3, 1
    goto :L1
  :L3
  .line 620
    new-instance v0, Ljava/util/ArrayList;
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    invoke-direct { v0, v3 }, Ljava/util/ArrayList;-><init>(I)V
  .line 621
    nop
  :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 622
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 623
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
  .line 624
    if-eqz v4, :L7
    move-object v3, v4
  :L7
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 621
    add-int/lit8 v2, v2, 1
    goto :L4
  :L8
  .line 626
    return-object v0
  :L9
  .line 614
    return-object p0
.end method

.method public static songListSort()I
  .registers 1
  .line 1319
    sget v0, Lcom/innioasis/ipp/Albums;->songSort:I
    return v0
.end method

.method public static songMenu(Lcom/innioasis/music/util/SubMenuDialog;Landroid/app/Activity;Ljava/lang/String;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 6
  .line 1380
    if-eqz p0, :L6
    if-nez p1, :L0
    goto/16 :L6
  :L0
  .line 1381
    sput-object p0, Lcom/innioasis/ipp/Albums;->songDlg:Lcom/innioasis/music/util/SubMenuDialog;
  .line 1382
    invoke-static { p2 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p2
  .line 1383
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1384
    const v1, 2131820964
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1385
    const v1, 2131820963
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1386
    if-eqz p2, :L1
    const v1, 2131820962
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L2
  :L1
  .line 1387
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->trackSortEnabled()Z
    move-result v1
    if-eqz v1, :L2
    const v1, 2131821024
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 1388
    const v1, 2131820844
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1389
    const v1, 2131820584
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1390
    const v1, 2131820841
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1391
    const v1, 2131821047
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1393
    if-nez p2, :L3
    invoke-static { p3 }, Lcom/innioasis/ipp/Artists;->canOpen(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p3
    if-eqz p3, :L3
    const p3, 2131821105
    invoke-virtual { p1, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { v0, p3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1394
    if-eqz p2, :L4
    const p2, 2131821071
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L5
  :L4
  .line 1395
    const p2, 2131821060
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 1396
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 1397
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 1398
    return-void
  :L6
  .line 1380
    return-void
.end method

.method public static songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 4
  .line 1799
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->allSongsArtist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->artistSongs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L0
  .line 1800
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const/4 p0, 0
    return-object p0
  :L1
  .line 1801
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1802
    if-nez v0, :L2
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L2
  .line 1803
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->onlyScoped(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1805
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p1, v0, :L3
  .line 1806
    new-instance p1, Lcom/innioasis/ipp/Albums$SongCmp;
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-direct { p1, v0 }, Lcom/innioasis/ipp/Albums$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1807
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->trackSortEnabled()Z
    move-result p1
    if-eqz p1, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    goto :L4
  :L3
  .line 1809
    new-instance v0, Lcom/innioasis/ipp/Albums$SongCmp;
    invoke-direct { v0, p1 }, Lcom/innioasis/ipp/Albums$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { p0, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1810
    nop
  :L4
  .line 1812
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
  .line 706
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
  .line 708
    nop
  .line 709
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 710
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L1
    sget-object v2, Lcom/innioasis/ipp/Albums;->songOrder:Ljava/lang/Object;
    if-ne p1, v2, :L1
    monitor-exit v0
    return-object v1
  :L1
  .line 711
    sget-object v1, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
    if-eqz v1, :L2
    sget-object v2, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
    if-ne p1, v2, :L2
    monitor-exit v0
    return-object v1
  :L2
  .line 712
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->pairOf(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object v1
  .line 713
    const/4 v2, 0
    if-eqz v1, :L3
    sget-object v3, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v3, :L3
    sget-object v4, Lcom/innioasis/ipp/Albums;->songOrder:Ljava/lang/Object;
    if-ne v1, v4, :L3
    goto :L5
  :L3
  .line 714
    if-eqz v1, :L4
    sget-object v3, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
    if-eqz v3, :L4
    sget-object v4, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
    if-ne v1, v4, :L4
    goto :L5
  :L4
  .line 715
    move-object v3, v2
  :L5
    sget v1, Lcom/innioasis/ipp/Albums;->songGen:I
  .line 716
    monitor-exit v0
  :L6
  .line 717
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 718
    if-nez v3, :L7
    goto :L8
  :L7
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/Albums;->mirror(Ljava/util/List;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v2
  :L8
  .line 719
    if-eqz v2, :L13
  .line 720
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
  .line 721
    monitor-enter v0
  :L9
  .line 722
    sget p0, Lcom/innioasis/ipp/Albums;->songGen:I
    if-ne v1, p0, :L10
  .line 723
    sput-object v2, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 724
    sput-object p1, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
  :L10
  .line 726
    monitor-exit v0
  .line 727
    return-object v2
  :L11
  .line 726
    move-exception p0
    monitor-exit v0
  :L12
    throw p0
  :L13
  .line 729
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->ordered(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v2
  .line 730
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
  .line 731
    if-nez v2, :L16
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsList(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->shared(Ljava/util/List;)Ljava/util/List;
    move-result-object v2
  :L16
  .line 732
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
  .line 733
    monitor-enter v0
  .line 734
    if-eqz v2, :L18
  :L17
    sget p0, Lcom/innioasis/ipp/Albums;->songGen:I
    if-ne v1, p0, :L18
  .line 735
    sput-object v2, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 736
    sput-object p1, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
  :L18
  .line 738
    monitor-exit v0
  .line 739
    return-object v2
  :L19
  .line 738
    move-exception p0
    monitor-exit v0
  :L20
    throw p0
  :L21
  .line 716
    move-exception p0
  :L22
    monitor-exit v0
  :L23
    throw p0
.end method

.method public static songsList(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 600
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
  :L0
  .line 602
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p1
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAllSong(I)V
  :L1
  .line 604
    goto :L3
  :L2
  .line 603
    move-exception p1
  :L3
  .line 605
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
  .line 1703
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1704
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 1705
    if-eqz v1, :L6
    if-nez p0, :L0
    goto :L6
  :L0
  .line 1706
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1707
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
  .line 1708
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v1, v2, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    goto :L5
  :L1
  .line 1710
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
  .line 1711
    if-eqz p0, :L5
  .line 1712
    check-cast p0, Ljava/util/LinkedHashSet;
    invoke-virtual { p0 }, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L4
  .line 1713
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
  .line 1716
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1717
    return-object v0
  :L6
  .line 1705
    return-object v0
.end method

.method public static songsSync(Lcom/innioasis/music/data/Album;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
  .registers 7
  .line 1873
    const/4 p1, 0
    if-nez p0, :L0
    return-object p1
  :L0
  .line 1875
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Genres;->noteList(Lcom/innioasis/music/data/Album;Lcom/innioasis/music/data/Genre;)V
  .line 1877
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L5
  .line 1878
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object p1
  .line 1879
    if-nez p1, :L1
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L1
  .line 1880
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  .line 1881
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1882
    nop
  :L2
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    if-ge v1, v0, :L4
  .line 1883
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1884
    if-eqz v0, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L3
    invoke-virtual { p2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1882
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 1886
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p2, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1887
    return-object p2
  :L5
  .line 1890
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L14
  .line 1891
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1892
    if-nez v0, :L6
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L6
  .line 1893
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  .line 1894
    if-nez p2, :L7
    goto :L8
  :L7
    invoke-virtual { p2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
  :L8
  .line 1895
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1896
    nop
  :L9
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L13
  .line 1897
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1898
    if-eqz v2, :L12
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L10
    goto :L12
  :L10
  .line 1899
    if-eqz p1, :L11
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L11
    goto :L12
  :L11
  .line 1900
    invoke-virtual { p2, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L12
  .line 1896
    add-int/lit8 v1, v1, 1
    goto :L9
  :L13
  .line 1902
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p2, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1903
    return-object p2
  :L14
  .line 1905
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L15
    return-object p1
  :L15
  .line 1906
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1907
    if-nez v0, :L16
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L16
  .line 1908
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1909
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 1910
    if-nez p2, :L17
    goto :L18
  :L17
    invoke-virtual { p2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
  :L18
  .line 1911
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1912
    if-eqz p1, :L22
  .line 1913
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1914
    nop
  :L19
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    if-ge v1, v0, :L21
  .line 1915
    invoke-virtual { p0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1916
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p1 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L20
    invoke-virtual { p2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L20
  .line 1914
    add-int/lit8 v1, v1, 1
    goto :L19
  :L21
  .line 1918
    move-object p0, p2
  :L22
  .line 1921
    sget-object p1, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1922
    return-object p0
.end method

.method public static sortFor(Ljava/lang/String;)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  .registers 3
  .line 1362
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAlbumSong()I
    move-result v0
  .line 1363
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L2
  .line 1364
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 1365
    if-nez p0, :L0
    goto :L1
  :L0
    const-string v1, "all_sort"
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
  :L1
  .line 1366
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object p0
    return-object p0
  :L2
  .line 1369
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p0
    if-ne v0, p0, :L3
  .line 1370
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L3
  .line 1372
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object p0
    return-object p0
.end method

.method private static sortValue(Z)I
  .registers 3
  .line 1292
    if-nez p0, :L0
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAlbum()I
    move-result p0
    return p0
  :L0
  .line 1293
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 1294
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v0
  .line 1295
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
  .line 1664
    if-nez p0, :L0
    return-object p0
  :L0
  .line 1665
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1666
    const-string v1, "split allSongs"
    invoke-static { v1 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1667
    if-nez v0, :L1
    return-object p0
  :L1
  .line 1668
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Albums;->splitRows(Ljava/util/List;Ljava/util/List;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1669
    const-string v0, "split loop"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1670
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->byYear(Ljava/util/ArrayList;)Ljava/util/List;
    move-result-object p0
  .line 1671
    const-string v0, "split byYear"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1672
    return-object p0
.end method

.method public static splitAlbums(Ljava/util/List;)Ljava/util/List;
  .registers 14
  .line 1677
    if-nez p0, :L0
    return-object p0
  :L0
  .line 1678
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1679
    if-nez v0, :L1
    return-object p0
  :L1
  .line 1680
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 1681
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1682
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L12
  .line 1683
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/music/data/Album;
  .line 1684
    if-nez v4, :L3
    goto :L11
  :L3
  .line 1685
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
  .line 1686
    invoke-virtual { v0, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
  .line 1687
    const/4 v8, 0
    if-nez v7, :L6
    move-object v7, v8
    goto :L7
  :L6
    check-cast v7, Ljava/util/LinkedHashSet;
  :L7
  .line 1688
    if-eqz v7, :L10
    invoke-virtual { v7 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v9
    if-eqz v9, :L8
    goto :L10
  :L8
  .line 1689
    new-instance v9, Ljava/util/ArrayList;
    invoke-direct { v9, v7 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1690
    sget-object v7, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v9, v7 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1691
    const/4 v7, 0
  :L9
    invoke-virtual { v9 }, Ljava/util/ArrayList;->size()I
    move-result v10
    if-ge v7, v10, :L11
  .line 1692
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
  .line 1691
    add-int/lit8 v7, v7, 1
    goto :L9
  :L10
  .line 1688
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L11
  .line 1682
    add-int/lit8 v3, v3, 1
    goto :L2
  :L12
  .line 1695
    return-object v1
.end method

.method private static splitRows(Ljava/util/List;Ljava/util/List;)Ljava/util/ArrayList;
  .catchall { :L0 .. :L2 } :L16
  .catchall { :L13 .. :L15 } :L14
  .catchall { :L17 .. :L18 } :L16
  .registers 10
  .line 1591
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1592
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
  .line 1593
    monitor-exit v0
  :L2
  .line 1594
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 1595
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1596
    const/4 v2, 0
    const/4 v3, 0
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L12
  .line 1597
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 1598
    if-nez v4, :L4
    const-string v5, ""
    goto :L5
  :L4
    move-object v5, v4
  :L5
    invoke-virtual { v0, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
  .line 1599
    if-nez v5, :L6
    const/4 v5, 0
    goto :L7
  :L6
    check-cast v5, Ljava/util/LinkedHashSet;
  :L7
  .line 1600
    if-eqz v5, :L10
    invoke-virtual { v5 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v6
    if-eqz v6, :L8
    goto :L10
  :L8
  .line 1601
    new-instance v6, Ljava/util/ArrayList;
    invoke-direct { v6, v5 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1602
    sget-object v5, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v6, v5 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1603
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
  .line 1600
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L11
  .line 1596
    add-int/lit8 v3, v3, 1
    goto :L3
  :L12
  .line 1605
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L13
  .line 1606
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->splitFor:Ljava/lang/ref/WeakReference;
  .line 1607
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    sput-object p1, Lcom/innioasis/ipp/Albums;->splitNames:Ljava/util/List;
  .line 1608
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    sput-object p0, Lcom/innioasis/ipp/Albums;->splitOut:Ljava/util/ArrayList;
  .line 1609
    monitor-exit v2
  .line 1610
    return-object v1
  :L14
  .line 1609
    move-exception p0
    monitor-exit v2
  :L15
    throw p0
  :L16
  .line 1593
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
  .line 370
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
  .line 636
    const-string v0, "/"
  .line 638
    const/4 v1, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v2
    const-string v3, "select count(*), total(length(path)), total(fileDate) from song where isAudiobook = 0"
    invoke-virtual { v2, v3, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v2
  :L1
  .line 640
    invoke-interface { v2 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v3
  :L2
    if-nez v3, :L7
  .line 645
    if-eqz v2, :L6
  :L3
  .line 647
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  :L4
  .line 649
    goto :L6
  :L5
  .line 648
    move-exception v0
  :L6
  .line 640
    return-object v1
  :L7
  .line 641
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
  .line 645
    if-eqz v2, :L12
  :L9
  .line 647
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  :L10
  .line 649
    goto :L12
  :L11
  .line 648
    move-exception v1
  :L12
  .line 641
    return-object v0
  :L13
  .line 642
    move-exception v0
    goto :L15
  :L14
    move-exception v0
    move-object v2, v1
  :L15
  .line 643
    nop
  .line 645
    if-eqz v2, :L19
  :L16
  .line 647
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  :L17
  .line 649
    goto :L19
  :L18
  .line 648
    move-exception v0
  :L19
  .line 643
    return-object v1
.end method

.method public static tintAllSongsRow(Landroid/widget/TextView;)V
  .registers 3
  .line 1249
    sget-object v0, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 1250
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 1251
    if-eqz v0, :L1
    if-nez p0, :L0
    goto :L1
  :L0
  .line 1252
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 1253
    return-void
  :L1
  .line 1251
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

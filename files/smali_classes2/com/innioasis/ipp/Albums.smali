.class public final Lcom/innioasis/ipp/Albums;
.super Ljava/lang/Object;
.source "Albums.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
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

.field private static pendingFocus:Ljava/lang/String;

.field private static pendingIcon:Landroid/widget/ImageView;

.field private static prevAt:J

.field private static prevSig:Ljava/lang/String;

.field private static returnAlbum:Ljava/lang/String;

.field private static returnFocus:Ljava/lang/String;

.field private static scanThread:Ljava/lang/Thread;

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

.field private static started:Z

.field private static warmer:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 2
  .line 128
    nop
  .line 129
    const-string v0, "(?<![\\p{L}\\p{N}])(cd|disc|disk|\u0434\u0438\u0441\u043a)[ ._-]?(\\d{1,2})(?!\\d)"
    invoke-static { v0 }, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Albums;->CD_PAT:Ljava/util/regex/Pattern;
  .line 164
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
  .line 168
    new-instance v0, Lcom/innioasis/ipp/Albums$Warm;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Albums$Warm;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Albums;->WARM:Ljava/lang/Runnable;
  .line 991
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Albums;->songSort:I
  .line 1210
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1212
    sput v0, Lcom/innioasis/ipp/Albums;->listPos:I
  .line 1329
    new-instance v0, Lcom/innioasis/ipp/Albums$StrCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Albums$StrCmp;-><init>(Lcom/innioasis/ipp/Albums$1;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
  .line 1436
    new-instance v0, Lcom/innioasis/ipp/Albums$DiscCmp;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Albums$DiscCmp;-><init>(Lcom/innioasis/ipp/Albums$1;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->DISC_CMP:Ljava/util/Comparator;
  .line 1499
    new-instance v0, Lcom/innioasis/ipp/Albums$PathCmp;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Albums$PathCmp;-><init>(Lcom/innioasis/ipp/Albums$1;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 44
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(J)V
  .registers 2
  .line 44
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
    return-void
.end method

.method static synthetic access$100()Ljava/util/List;
  .registers 1
  .line 44
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    return-object v0
.end method

.method static synthetic access$1200(JJ)I
  .registers 4
  .line 44
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Albums;->cmpLong(JJ)I
    move-result p0
    return p0
.end method

.method static synthetic access$1300(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 44
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->cmpStr(Ljava/lang/String;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method static synthetic access$200()V
  .registers 0
  .line 44
    invoke-static { }, Lcom/innioasis/ipp/Albums;->lists()V
    return-void
.end method

.method static synthetic access$300()J
  .registers 2
  .line 44
    sget-wide v0, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    return-wide v0
.end method

.method static synthetic access$302(J)J
  .registers 2
  .line 44
    sput-wide p0, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    return-wide p0
.end method

.method static synthetic access$400()Ljava/lang/Object;
  .registers 1
  .line 44
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    return-object v0
.end method

.method static synthetic access$500()I
  .registers 1
  .line 44
    sget v0, Lcom/innioasis/ipp/Albums;->songGen:I
    return v0
.end method

.method static synthetic access$600()Ljava/lang/String;
  .registers 1
  .line 44
    invoke-static { }, Lcom/innioasis/ipp/Albums;->tableSig()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$700()Ljava/lang/String;
  .registers 1
  .line 44
    sget-object v0, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$702(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 44
    sput-object p0, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$802(Z)Z
  .registers 1
  .line 44
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->checkAsked:Z
    return p0
.end method

.method public static albumFolder(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 119
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 120
    const/16 v0, 47
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 121
    if-gez v0, :L0
    return-object p0
  :L0
  .line 122
    add-int/lit8 v1, v0, 1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v1
  .line 123
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->isCdFolder(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    const/4 v1, 0
    invoke-virtual { p0, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method public static albumKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 74
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
  .line 1245
    if-eqz p0, :L2
    if-nez p1, :L0
    goto :L2
  :L0
  .line 1246
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1247
    const v1, 2131820961
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1248
    const v1, 2131820844
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1249
    const v1, 2131820584
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1250
    const v1, 2131820582
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1251
    const v1, 2131821047
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1252
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
  .line 1253
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 1254
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 1255
    return-void
  :L2
  .line 1245
    return-void
.end method

.method private static albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
  .catchall { :L0 .. :L4 } :L3
  .registers 3
  .line 828
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .line 829
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 830
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
  .line 831
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
.end method

.method public static albumSort(Landroid/app/Activity;)I
  .registers 1
  .line 955
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->noteAlbumList(Landroid/app/Activity;)V
  .line 956
    invoke-static { }, Lcom/innioasis/ipp/Albums;->albumSortValue()I
    move-result p0
    return p0
.end method

.method public static albumSortFor(Landroid/app/Activity;)I
  .registers 1
  .line 961
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->artistView(Landroid/app/Activity;)Z
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->sortValue(Z)I
    move-result p0
    return p0
.end method

.method public static albumSortValue()I
  .registers 1
  .line 966
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->artistList:Z
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->sortValue(Z)I
    move-result v0
    return v0
.end method

.method private static allMark(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 61
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
  .line 754
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 755
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->readSongs()Ljava/util/List;
    move-result-object v0
    return-object v0
  :L0
  .line 756
    sget-boolean v1, Lcom/innioasis/ipp/Albums;->checkAsked:Z
    if-nez v1, :L1
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1
    sget-wide v3, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    sub-long/2addr v1, v3
    const-wide/32 v3, 600000
    cmp-long v5, v1, v3
    if-ltz v5, :L1
  .line 757
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Albums;->checkAsked:Z
  .line 758
    const-wide/16 v1, 0
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  :L1
  .line 760
    return-object v0
.end method

.method public static allSongsArtist(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 58
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
  .line 900
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
  .line 901
    if-eqz p3, :L5
  .line 903
    if-eqz p0, :L3
    const/high16 v2, 0x41B00000
    goto :L4
  :L3
    const/high16 v2, 0x41A00000
  :L4
    const/4 v3, 2
    invoke-virtual { p3, v3, v2 }, Landroid/widget/TextView;->setTextSize(IF)V
  :L5
  .line 905
    if-eqz p2, :L8
    if-eqz p0, :L6
    const/16 v2, 8
    goto :L7
  :L6
    const/4 v2, 0
  :L7
    invoke-virtual { p2, v2 }, Landroid/widget/TextView;->setVisibility(I)V
  :L8
  .line 906
    if-nez p0, :L9
  .line 907
    invoke-static { p1 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 908
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 909
    return v1
  :L9
  .line 911
    nop
  .line 912
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 913
    if-eqz p0, :L10
    const p2, 2131821049
    invoke-virtual { p0, p2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    goto :L11
  :L10
    const-string p0, "Show all songs"
  :L11
  .line 914
    if-eqz p3, :L12
    invoke-virtual { p3, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L12
  .line 915
    if-eqz p1, :L13
    const p0, 2131623994
    invoke-virtual { p1, p0 }, Landroid/widget/ImageView;->setImageResource(I)V
  :L13
  .line 916
    sput-object p1, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 917
    return v0
.end method

.method public static artistMark(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 70
    if-nez p0, :L0
    const-string p0, ""
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->allMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static artistSongs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 4
  .line 1355
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1356
    if-nez v0, :L0
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L0
  .line 1357
    nop
  .line 1358
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p1, v1, :L1
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L1
  .line 1359
    invoke-virtual { v0, p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByArtist(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
  .line 1360
    if-nez p0, :L2
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
  :L2
    return-object p0
.end method

.method private static artistView(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 941
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-eqz v1, :L3
  .line 942
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
  .line 943
    move-exception p0
  .line 944
    return v0
  :L3
  .line 942
    nop
  :L4
  .line 941
    return v0
.end method

.method public static atStart(Landroid/app/Activity;)V
  .registers 3
  .line 650
    sget-boolean p0, Lcom/innioasis/ipp/Albums;->started:Z
    if-eqz p0, :L0
    return-void
  :L0
  .line 651
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->started:Z
  .line 652
    sget-object p0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez p0, :L1
    const-wide/16 v0, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  :L1
  .line 653
    return-void
.end method

.method public static backAlbum()Ljava/lang/String;
  .registers 3
  .line 1170
    sget-object v0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1171
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 1172
    sput-object v1, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1173
    sget-object v2, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
    sput-object v2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1174
    sput-object v1, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1175
    return-object v0
.end method

.method public static backClose()Z
  .registers 2
  .line 1163
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1164
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1165
    return v0
.end method

.method public static byDisc(Ljava/util/List;)Ljava/util/List;
  .registers 3
  .line 1430
    if-eqz p0, :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L0
    goto :L1
  :L0
  .line 1431
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1432
    sget-object p0, Lcom/innioasis/ipp/Albums;->DISC_CMP:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1433
    return-object v0
  :L1
  .line 1430
    return-object p0
.end method

.method private static byYear(Ljava/util/ArrayList;)Ljava/util/List;
  .catchall { :L0 .. :L6 } :L7
  .registers 6
  :L0
  .line 883
    invoke-static { }, Lcom/innioasis/ipp/Albums;->albumSortValue()I
    move-result v0
  .line 884
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
  .line 885
    if-nez v1, :L3
    sget-object v4, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Asc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v4
    if-eq v0, v4, :L3
    return-object p0
  :L3
  .line 886
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
  .line 887
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    invoke-virtual { p0, v2, v0 }, Ljava/util/ArrayList;->subList(II)Ljava/util/List;
    move-result-object v0
  .line 888
    invoke-static { v0 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  .line 889
    new-instance v2, Lcom/innioasis/ipp/YearComparator;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/YearComparator;-><init>(Z)V
    invoke-static { v0, v2 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L6
  .line 891
    goto :L8
  :L7
  .line 890
    move-exception v0
  :L8
  .line 892
    return-object p0
.end method

.method public static cacheCleared()V
  .registers 3
  .line 733
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 734
    if-nez v0, :L0
    return-void
  :L0
  .line 735
    const-string v1, "cache_n"
    const/4 v2, -1
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 736
    const-string v1, "cache_t"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 737
    const-string v1, "cache_v"
    const/4 v2, 0
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 738
    const-string v1, "cache_m"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 739
    return-void
.end method

.method public static cacheCleared(I)V
  .registers 4
  .line 743
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 744
    if-nez v0, :L0
    return-void
  :L0
  .line 745
    const/4 v1, 0
    const-string v2, "cache_m"
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    xor-int/lit8 p0, p0, -1
    and-int/2addr p0, v1
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 746
    return-void
.end method

.method public static cached(Landroid/content/Context;III)Z
  .registers 4
  .line 718
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
  .line 709
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 710
    const-string v1, "cache_n"
    const/4 v2, -1
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    if-ne v1, p1, :L2
  .line 711
    const-string p1, "cache_t"
    invoke-static { p0, p1, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p1
    if-ne p1, p2, :L2
  .line 712
    const-string p1, "cache_v"
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p1
    const/4 p2, 4
    if-eq p1, p2, :L1
    goto :L2
  :L1
  .line 713
    const-string p1, "cache_m"
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p0
    return p0
  :L2
  .line 712
    return v0
.end method

.method private static cmpLong(JJ)I
  .registers 5
  .line 1531
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
  .line 1526
    const-string v0, ""
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  :L1
  .line 1527
    if-nez p1, :L2
    goto :L3
  :L2
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  :L3
  .line 1528
    invoke-virtual { p0, v0 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method public static coverKey(Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 769
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
  .line 770
    sget-object v0, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
  .line 771
    if-nez v0, :L6
  .line 772
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 773
    if-nez v0, :L1
    return-object p0
  :L1
  .line 774
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 775
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 776
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L2
  .line 777
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L5
  .line 778
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
  .line 779
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
  .line 780
    instance-of v4, v3, Ljava/util/LinkedHashSet;
    if-nez v4, :L3
    goto :L2
  :L3
  .line 781
    check-cast v3, Ljava/util/LinkedHashSet;
  .line 782
    invoke-virtual { v3 }, Ljava/util/LinkedHashSet;->size()I
    move-result v4
    const/4 v5, 1
    if-eq v4, v5, :L4
    goto :L2
  :L4
  .line 783
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
  .line 784
    invoke-virtual { v3 }, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v2, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 785
    goto :L2
  :L5
  .line 786
    sput-object v1, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
    move-object v0, v1
  :L6
  .line 788
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  .line 789
    if-nez v0, :L7
    goto :L8
  :L7
    move-object p0, v0
    check-cast p0, Ljava/lang/String;
  :L8
    return-object p0
  :L9
  .line 769
    return-object p0
.end method

.method public static discNumber(Ljava/lang/String;)I
  .catchall { :L2 .. :L3 } :L4
  .registers 4
  .line 146
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 147
    sget-object v1, Lcom/innioasis/ipp/Albums;->CD_PAT:Ljava/util/regex/Pattern;
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v2 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object p0
  .line 148
    invoke-virtual { p0 }, Ljava/util/regex/Matcher;->find()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 149
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
  .line 140
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->discNumber(Ljava/lang/String;)I
    move-result v0
  .line 141
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
  .line 97
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
  .line 100
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

.method public static focus(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  .registers 6
  .line 1192
    sget-object v0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1193
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1194
    if-eqz v0, :L6
    if-nez p0, :L0
    goto :L6
  :L0
  .line 1195
    const/4 v1, 0
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
    if-ge v1, v2, :L5
  .line 1196
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  .line 1197
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v3, :L4
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L4
  .line 1198
    if-nez p1, :L2
  .line 1199
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
    goto :L3
  :L2
  .line 1201
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  :L3
  .line 1203
    return-void
  :L4
  .line 1195
    add-int/lit8 v1, v1, 1
    goto :L1
  :L5
  .line 1206
    return-void
  :L6
  .line 1194
    return-void
.end method

.method private static folderOf(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 92
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 93
    const/4 v1, 1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->indexOf(I)I
    move-result v2
  .line 94
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
  .registers 6
  .line 835
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 836
    const/4 v1, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L6
  .line 837
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 838
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v3
    if-nez v3, :L1
    const-string v3, ""
    goto :L2
  :L1
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v3
  :L2
  .line 839
    invoke-virtual { v0, v3 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
  .line 840
    if-nez v4, :L3
    const/4 v4, 0
    goto :L4
  :L3
    check-cast v4, Ljava/util/LinkedHashSet;
  :L4
  .line 841
    if-nez v4, :L5
    new-instance v4, Ljava/util/LinkedHashSet;
    invoke-direct { v4 }, Ljava/util/LinkedHashSet;-><init>()V
    invoke-virtual { v0, v3, v4 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 842
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v4, v2 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  .line 836
    add-int/lit8 v1, v1, 1
    goto :L0
  :L6
  .line 844
    return-object v0
.end method

.method private static foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .catchall { :L0 .. :L2 } :L14
  .catchall { :L11 .. :L13 } :L12
  .catchall { :L15 .. :L16 } :L14
  .registers 8
  .line 797
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 798
    sget-object v1, Lcom/innioasis/ipp/Albums;->foldersFor:Ljava/util/List;
    if-ne v1, p0, :L1
    sget-object v1, Lcom/innioasis/ipp/Albums;->foldersMemo:Ljava/util/LinkedHashMap;
    if-eqz v1, :L1
    monitor-exit v0
    return-object v1
  :L1
  .line 799
    monitor-exit v0
  :L2
  .line 800
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 801
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 802
    const/4 v2, 0
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L10
  .line 803
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 804
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L4
    const-string v4, ""
    goto :L5
  :L4
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v4
  :L5
  .line 805
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
  .line 806
    invoke-virtual { v0, v4 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
  .line 807
    if-nez v6, :L6
    const/4 v6, 0
    goto :L7
  :L6
    check-cast v6, Ljava/util/LinkedHashSet;
  :L7
  .line 808
    if-nez v6, :L8
    new-instance v6, Ljava/util/LinkedHashSet;
    invoke-direct { v6 }, Ljava/util/LinkedHashSet;-><init>()V
    invoke-virtual { v0, v4, v6 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L8
  .line 809
    invoke-virtual { v6, v5 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  .line 810
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 811
    invoke-virtual { v1, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/ArrayList;
  .line 812
    if-nez v5, :L9
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
    invoke-virtual { v1, v4, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 813
    invoke-virtual { v5, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 802
    add-int/lit8 v2, v2, 1
    goto :L3
  :L10
  .line 815
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L11
  .line 816
    sput-object p0, Lcom/innioasis/ipp/Albums;->foldersFor:Ljava/util/List;
  .line 817
    sput-object v0, Lcom/innioasis/ipp/Albums;->foldersMemo:Ljava/util/LinkedHashMap;
  .line 818
    sput-object v1, Lcom/innioasis/ipp/Albums;->albumSongsMemo:Ljava/util/HashMap;
  .line 819
    monitor-exit v2
  .line 820
    return-object v0
  :L12
  .line 819
    move-exception p0
    monitor-exit v2
  :L13
    throw p0
  :L14
  .line 799
    move-exception p0
  :L15
    monitor-exit v0
  :L16
    goto :L18
  :L17
    throw p0
  :L18
    goto :L17
.end method

.method public static genreMark(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 67
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
  .line 172
    const-string v0, "invalidate"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->who(Ljava/lang/String;)V
  .line 173
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 174
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sget-object v2, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
    if-eq v1, v2, :L1
    sget v1, Lcom/innioasis/ipp/Albums;->foreign:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Albums;->foreign:I
  :L1
  .line 175
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L2
  .line 176
    sput-object v1, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
  .line 177
    sget-wide v1, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    sput-wide v1, Lcom/innioasis/ipp/Albums;->prevAt:J
  .line 178
    sget-object v1, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
    sput-object v1, Lcom/innioasis/ipp/Albums;->prevSig:Ljava/lang/String;
  .line 179
    sget-object v1, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
    sput-object v1, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
  .line 180
    sget-object v1, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
    sput-object v1, Lcom/innioasis/ipp/Albums;->sortedPrevType:Ljava/lang/Object;
  :L2
  .line 182
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 183
    const-wide/16 v2, 0
    sput-wide v2, Lcom/innioasis/ipp/Albums;->songCacheAt:J
  .line 184
    sput-object v1, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
  .line 185
    sget v2, Lcom/innioasis/ipp/Albums;->songGen:I
    add-int/lit8 v2, v2, 1
    sput v2, Lcom/innioasis/ipp/Albums;->songGen:I
  .line 186
    sput-object v1, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 187
    monitor-exit v0
  :L3
  .line 188
    sput-object v1, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
  .line 189
    invoke-static { }, Lcom/innioasis/ipp/Find;->clear()V
  .line 190
    const-wide/16 v0, 2000
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  .line 191
    return-void
  :L4
  .line 187
    move-exception v1
  :L5
    monitor-exit v0
  :L6
    throw v1
.end method

.method public static isAllSongs(Ljava/lang/String;)Z
  .registers 3
  .line 53
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
  .line 1398
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->allList:Z
    return v0
.end method

.method private static isCdFolder(Ljava/lang/String;)Z
  .registers 1
  .line 132
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
  .line 81
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
  .line 78
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
  .line 466
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 467
    sget-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 468
    const/4 v2, 0
    sput-object v2, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 469
    sput-object v2, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
  .line 470
    if-eqz p0, :L5
    if-eqz v1, :L5
    sget p0, Lcom/innioasis/ipp/Albums;->foreign:I
    sget v3, Lcom/innioasis/ipp/Albums;->markForeign:I
    if-eq p0, v3, :L1
    goto :L5
  :L1
  .line 471
    sget-object p0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez p0, :L4
    sget-object p0, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
    if-eq p0, v1, :L2
    goto :L4
  :L2
  .line 472
    sput-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 473
    sget-wide v3, Lcom/innioasis/ipp/Albums;->prevAt:J
    sput-wide v3, Lcom/innioasis/ipp/Albums;->songCacheAt:J
  .line 474
    sget-object p0, Lcom/innioasis/ipp/Albums;->prevSig:Ljava/lang/String;
    sput-object p0, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
  .line 475
    sget-object p0, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
    sput-object p0, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 476
    sget-object p0, Lcom/innioasis/ipp/Albums;->sortedPrevType:Ljava/lang/Object;
    sput-object p0, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
  .line 477
    sput-object v2, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
  .line 478
    sput-object v2, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
  .line 479
    monitor-exit v0
  :L3
  .line 480
    const-string p0, "library scan: nothing written, the list in memory is kept"
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 481
    return-void
  :L4
  .line 471
    monitor-exit v0
    return-void
  :L5
  .line 470
    monitor-exit v0
    return-void
  :L6
  .line 479
    move-exception p0
    monitor-exit v0
  :L7
    throw p0
.end method

.method public static keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 2
  .line 105
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 106
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L1
    const-string v0, ""
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 107
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static later(Ljava/lang/Runnable;J)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 218
    invoke-static { }, Lcom/innioasis/ipp/Albums;->worker()Landroid/os/Handler;
    move-result-object v0
    invoke-virtual { v0, p0, p1, p2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 220
    goto :L3
  :L2
  .line 219
    move-exception p0
  :L3
  .line 221
    return-void
.end method

.method public static levelFor(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 1005
    sget-object v0, Lcom/innioasis/ipp/Albums;->listKey:Ljava/lang/String;
  .line 1006
    const/4 v1, 0
    if-eqz v0, :L3
    if-nez p0, :L0
    goto :L3
  :L0
  .line 1007
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
  .line 1006
    return-object v1
.end method

.method public static listForView(Ljava/util/List;Landroid/app/Activity;)Ljava/util/List;
  .registers 9
  .line 849
    nop
  .line 850
    const/4 v0, 0
    if-eqz p1, :L0
  .line 851
    invoke-virtual { p1 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p1
  .line 852
    if-eqz p1, :L0
    const-string v1, "ipp_artist"
    invoke-virtual { p1, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    goto :L1
  :L0
  .line 854
    move-object p1, v0
  :L1
    sput-object p1, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 855
    const/4 v1, 0
    if-eqz p1, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
    sput-boolean v2, Lcom/innioasis/ipp/Albums;->artistList:Z
  .line 856
    if-nez p1, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->split(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L4
  .line 858
    if-nez p0, :L5
    return-object p0
  :L5
  .line 861
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Artists;->forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
  .line 862
    if-eqz v0, :L15
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L6
    goto :L15
  :L6
  .line 863
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersByName(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v2
  .line 864
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 865
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L7
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->allMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v3, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 866
    const/4 p1, 0
  :L8
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-ge p1, v0, :L14
  .line 867
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
  .line 868
    if-nez v0, :L9
    const-string v4, ""
    goto :L10
  :L9
    move-object v4, v0
  :L10
    invoke-virtual { v2, v4 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
  .line 869
    if-nez v4, :L11
    goto :L13
  :L11
  .line 870
    new-instance v5, Ljava/util/ArrayList;
    check-cast v4, Ljava/util/LinkedHashSet;
    invoke-direct { v5, v4 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 871
    sget-object v4, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v5, v4 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 872
    const/4 v4, 0
  :L12
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v4, v6, :L13
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
    invoke-static { v0, v6 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v3, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v4, v4, 1
    goto :L12
  :L13
  .line 866
    add-int/lit8 p1, p1, 1
    goto :L8
  :L14
  .line 874
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->byYear(Ljava/util/ArrayList;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L15
  .line 862
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
.end method

.method private static lists()V
  .registers 3
  .line 485
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 486
    if-nez v0, :L0
    return-void
  :L0
  .line 487
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .line 488
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->index(Ljava/util/List;)V
  .line 489
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 490
    if-nez v0, :L1
    return-void
  :L1
  .line 491
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    sget-object v2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 492
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAllSong()I
    move-result v2
  .line 491
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object v1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Albums;->songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .line 493
    invoke-static { }, Lcom/innioasis/ipp/Lab;->reads()V
  .line 494
    return-void
.end method

.method public static loadNow()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  :L0
  .line 431
    invoke-static { }, Lcom/innioasis/ipp/Scan;->clean()Z
    move-result v0
  .line 432
    invoke-static { }, Lcom/innioasis/ipp/Scan;->done()V
  .line 433
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->keep(Z)V
  .line 434
    invoke-static { }, Lcom/innioasis/ipp/Albums;->lists()V
  .line 435
    invoke-static { }, Lcom/innioasis/ipp/Schema;->backfill()V
  :L1
  .line 437
    goto :L3
  :L2
  .line 436
    move-exception v0
  :L3
  .line 438
    return-void
.end method

.method static loaded()Ljava/util/List;
  .registers 1
  .line 750
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    return-object v0
.end method

.method private static matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
  .registers 7
  .line 1337
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
    move-result-object v0
  .line 1338
    if-eqz v0, :L4
  .line 1339
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
  .line 1340
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
  .line 1342
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1343
    const/4 v1, 0
  :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L7
  .line 1344
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1345
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
  .line 1343
    add-int/lit8 v1, v1, 1
    goto :L5
  :L7
  .line 1347
    return-object v0
.end method

.method public static noteAlbumList(Landroid/app/Activity;)V
  .registers 1
  .line 950
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->artistView(Landroid/app/Activity;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->artistList:Z
  .line 951
    return-void
.end method

.method public static noteAlbumSort(I)V
  .registers 3
  .line 978
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->artistList:Z
    if-eqz v0, :L1
  .line 979
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 980
    if-eqz v0, :L0
    const-string v1, "artist_album_sort"
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L0
  .line 981
    return-void
  :L1
  .line 983
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAlbum(I)V
  .line 984
    return-void
.end method

.method public static noteCached(Landroid/content/Context;III)V
  .registers 6
  .line 723
    if-nez p0, :L0
    return-void
  :L0
  .line 724
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Albums;->cachedMask(Landroid/content/Context;II)I
    move-result v0
  .line 725
    const-string v1, "cache_n"
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 726
    const-string p1, "cache_t"
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 727
    const-string p1, "cache_v"
    const/4 p2, 4
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 728
    const-string p1, "cache_m"
    or-int p2, v0, p3
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 729
    return-void
.end method

.method public static noteListAlbum(Ljava/lang/String;)V
  .registers 1
  .line 1403
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->allList:Z
  .line 1404
    return-void
.end method

.method public static noteListScroll(Landroid/widget/ListView;Ljava/lang/Object;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 1216
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1218
    if-eqz p0, :L7
  :L0
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    goto :L7
  :L1
  .line 1219
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 1220
    if-nez v2, :L2
    goto :L3
  :L2
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v1
  :L3
    sput v1, Lcom/innioasis/ipp/Albums;->listTop:I
  .line 1221
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1222
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Albums;->listPos:I
  :L4
  .line 1225
    goto :L6
  :L5
  .line 1223
    move-exception p0
  .line 1224
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  :L6
  .line 1226
    return-void
  :L7
  .line 1218
    return-void
.end method

.method public static noteReturn(Ljava/lang/String;)V
  .registers 1
  .line 1157
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1158
    sget-object p0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1159
    return-void
.end method

.method public static noteSort(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
  .registers 3
  .line 1026
    if-nez p1, :L0
    return-void
  :L0
  .line 1027
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p1
  .line 1028
    sput p1, Lcom/innioasis/ipp/Albums;->songSort:I
  .line 1029
    sput-object p0, Lcom/innioasis/ipp/Albums;->listKey:Ljava/lang/String;
  .line 1030
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L2
  .line 1031
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 1032
    if-eqz p0, :L1
    const-string v0, "all_sort"
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 1033
    return-void
  :L2
  .line 1035
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAlbumSong(I)V
  .line 1036
    return-void
.end method

.method private static odd(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 412
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    xor-int/lit8 p0, p0, 1
    return p0
.end method

.method private static one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 416
    if-nez p1, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 417
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
  .line 418
    if-nez v0, :L1
  .line 419
    invoke-virtual { p0, p1, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 420
    return-object p1
  :L1
  .line 422
    return-object v0
.end method

.method private static onlyScoped(Ljava/util/ArrayList;)Ljava/util/ArrayList;
  .registers 6
  .line 1378
    sget-object v0, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1379
    if-eqz v0, :L7
    invoke-virtual { p0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L7
    invoke-static { }, Lcom/innioasis/ipp/Albums;->scopeEnabled()Z
    move-result v1
    if-nez v1, :L0
    goto :L7
  :L0
  .line 1381
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    return-object p0
  :L1
  .line 1382
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1383
    const/4 v2, 0
  :L2
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 1384
    invoke-virtual { p0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1385
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L3
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1383
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 1388
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L5
    goto :L6
  :L5
    move-object p0, v1
  :L6
    return-object p0
  :L7
  .line 1379
    return-object p0
.end method

.method public static openAlbumFrom(Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 4
  .line 1146
    if-nez p0, :L0
    return-void
  :L0
  .line 1147
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->openTarget(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
    move-result-object p1
  .line 1148
    if-nez p1, :L1
    return-void
  :L1
  .line 1149
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1150
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 1151
    const-string v1, "ipp_open_album"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1152
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 1153
    return-void
.end method

.method public static openAlbumName(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 3
  .line 1122
    if-eqz p0, :L1
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1123
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    const/4 v0, 0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Albums;->openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .line 1124
    return-void
  :L1
  .line 1122
    return-void
.end method

.method public static openAlbumOfSong(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;)V
  .registers 3
  .line 1128
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 1129
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Albums;->openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .line 1130
    return-void
  :L1
  .line 1128
    return-void
.end method

.method public static openArtistFrom(Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 3
  .line 1083
    sget-object v0, Lcom/innioasis/ipp/Albums;->songDlg:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Artists;->openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p0
    return p0
.end method

.method private static openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 1133
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1134
    sput-object p2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1135
    const/4 p2, 1
    sput-boolean p2, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1136
    const/4 p2, 0
    sput-object p2, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1137
    sput-object p2, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1138
    sput-object p2, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1139
    new-instance p2, Landroid/content/Intent;
    const-class v0, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { p2, p0, v0 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 1140
    const-string v0, "ipp_open_album"
    invoke-virtual { p2, v0, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1141
    invoke-virtual { p0, p2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 1142
    return-void
  :L1
  .line 1133
    return-void
.end method

.method public static openRequest(Landroid/app/Activity;)Ljava/lang/String;
  .catchall { :L0 .. :L5 } :L2
  .registers 3
  .line 1181
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-nez v1, :L1
    goto :L3
  :L1
  .line 1182
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_open_album"
    invoke-virtual { p0, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    goto :L4
  :L2
  .line 1185
    move-exception p0
    goto :L6
  :L3
  .line 1182
    move-object p0, v0
  :L4
  .line 1183
    if-nez p0, :L7
    sput-object v0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  :L5
    goto :L7
  :L6
  .line 1186
    return-object v0
  :L7
  .line 1184
    return-object p0
.end method

.method public static openTarget(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
  .registers 5
  .line 1098
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 1099
    nop
  .line 1100
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 1101
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
  .line 1102
    move-object v3, v0
  :L2
    if-nez v3, :L3
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v3
  :L3
  .line 1103
    instance-of p0, v3, Lcom/innioasis/y1/database/Song;
    if-nez p0, :L4
    return-object v0
  :L4
  .line 1104
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1105
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
  .line 1106
    if-nez p0, :L5
    return-object v0
  :L5
  .line 1107
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    sput-object v3, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1108
    sput-boolean v2, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1109
    sput-object v0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1110
    sput-object v0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1112
    sput-object v0, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1113
    if-eqz v1, :L6
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L6
  .line 1114
    return-object p0
.end method

.method private static orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
  .registers 2
  .line 575
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L0
    const-string p0, "lower(pinyinName)"
    return-object p0
  :L0
  .line 576
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L1
    const-string p0, "lower(pinyinName) desc"
    return-object p0
  :L1
  .line 577
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L2
    const-string p0, "fileDate"
    return-object p0
  :L2
  .line 578
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L3
    const-string p0, "fileDate desc"
    return-object p0
  :L3
  .line 579
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L4
    const-string p0, "lower(pinyinSongName) asc"
    return-object p0
  :L4
  .line 580
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L5
    const-string p0, "lower(pinyinSongName) desc"
    return-object p0
  :L5
  .line 581
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L6
    const-string p0, "lower(pinyinAlbum) desc"
    return-object p0
  :L6
  .line 582
    const/4 p0, 0
    return-object p0
.end method

.method private static orderNow()Ljava/lang/Object;
  .registers 2
  .line 498
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 499
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result v1
    if-eqz v1, :L2
  .line 500
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L1
  :L0
  .line 501
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L1
  .line 500
    return-object v0
  :L2
  .line 503
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    if-eqz v0, :L3
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L4
  :L3
  .line 504
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L4
  .line 503
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
  .line 591
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
    move-result-object p0
  .line 592
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 593
    const/4 v1, 0
    if-eqz p0, :L34
    if-nez v0, :L0
    goto/16 :L34
  :L0
  .line 594
    nop
  :L1
  .line 596
    new-instance v2, Ljava/util/HashMap;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    mul-int/lit8 v3, v3, 2
    invoke-direct { v2, v3 }, Ljava/util/HashMap;-><init>(I)V
  .line 597
    const/4 v3, 0
    const/4 v4, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 598
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 599
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-eqz v6, :L3
    move-object v6, v5
    check-cast v6, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v2, v6, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 597
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 601
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
  .line 602
    invoke-interface { p0 }, Landroid/database/Cursor;->getCount()I
    move-result v4
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v5
  :L6
    if-eq v4, v5, :L11
  .line 613
    if-eqz p0, :L10
  :L7
  .line 615
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L8
  .line 617
    goto :L10
  :L9
  .line 616
    move-exception p0
  :L10
  .line 602
    return-object v1
  :L11
  .line 603
    new-instance v4, Ljava/util/ArrayList;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    invoke-direct { v4, v0 }, Ljava/util/ArrayList;-><init>(I)V
  :L12
  .line 604
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v0
    if-eqz v0, :L22
  .line 605
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
  .line 606
    if-nez v0, :L20
  .line 613
    if-eqz p0, :L19
  :L16
  .line 615
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L17
  .line 617
    goto :L19
  :L18
  .line 616
    move-exception p0
  :L19
  .line 606
    return-object v1
  :L20
  .line 607
    invoke-virtual { v4, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L21
  .line 608
    goto :L12
  :L22
  .line 609
    nop
  .line 613
    if-eqz p0, :L26
  :L23
  .line 615
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L24
  .line 617
    goto :L26
  :L25
  .line 616
    move-exception p0
  :L26
  .line 609
    return-object v4
  :L27
  .line 610
    move-exception v0
    goto :L29
  :L28
    move-exception p0
    move-object p0, v1
  :L29
  .line 611
    nop
  .line 613
    if-eqz p0, :L33
  :L30
  .line 615
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L31
  .line 617
    goto :L33
  :L32
  .line 616
    move-exception p0
  :L33
  .line 611
    return-object v1
  :L34
  .line 593
    return-object v1
.end method

.method private static readSongs()Ljava/util/List;
  .catchall { :L1 .. :L2 } :L25
  .catchall { :L13 .. :L20 } :L22
  .catchall { :L23 .. :L24 } :L22
  .catchall { :L26 .. :L27 } :L25
  .registers 14
  .line 225
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 226
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 228
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L1
    sget v3, Lcom/innioasis/ipp/Albums;->songGen:I
    monitor-exit v2
  :L2
  .line 229
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 230
    invoke-static { }, Lcom/innioasis/ipp/Albums;->orderNow()Ljava/lang/Object;
    move-result-object v6
  .line 231
    invoke-static { }, Lcom/innioasis/ipp/Albums;->tableSig()Ljava/lang/String;
    move-result-object v7
  .line 232
    const-string v8, "full read"
    invoke-static { v8 }, Lcom/innioasis/ipp/Lab;->who(Ljava/lang/String;)V
  .line 233
    if-nez v6, :L3
    move-object v8, v1
    goto :L4
  :L3
    move-object v8, v6
    check-cast v8, Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { v8, v7 }, Lcom/innioasis/ipp/Albums;->readTable(Lcom/innioasis/y1/database/Y1Repository$SongSortType;Ljava/lang/String;)Ljava/util/List;
    move-result-object v8
  :L4
  .line 234
    const-string v9, "ipplab"
    new-instance v10, Ljava/lang/StringBuilder;
    invoke-direct { v10 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v11, "portions "
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    const/4 v11, 0
    if-eqz v8, :L5
    const/4 v12, 1
    goto :L6
  :L5
    const/4 v12, 0
  :L6
    invoke-virtual { v10, v12 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v10
    const-string v12, " "
    invoke-virtual { v10, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v12
    sub-long/2addr v12, v4
    invoke-virtual { v10, v12, v13 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v10
    const-string v12, " ms"
    invoke-virtual { v10, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-virtual { v10 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v10
    invoke-static { v9, v10 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 235
    if-eqz v8, :L7
    invoke-static { v8 }, Lcom/innioasis/ipp/Lab;->compareRead(Ljava/util/List;)V
  :L7
  .line 236
    if-nez v8, :L8
    invoke-virtual { v0, v11 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v8
  :L8
  .line 237
    invoke-static { }, Lcom/innioasis/ipp/Albums;->orderNow()Ljava/lang/Object;
    move-result-object v0
    if-eq v6, v0, :L9
    move-object v6, v1
  :L9
  .line 238
    const-string v0, "library read"
    invoke-static { v0, v4, v5 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 239
    const-string v0, "ipplab"
    new-instance v9, Ljava/lang/StringBuilder;
    invoke-direct { v9 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v10, "full read "
    invoke-virtual { v9, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    if-nez v8, :L10
    goto :L11
  :L10
    invoke-interface { v8 }, Ljava/util/List;->size()I
    move-result v11
  :L11
    invoke-virtual { v9, v11 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v9
    const-string v10, " rows "
    invoke-virtual { v9, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v10
    sub-long/2addr v10, v4
    invoke-virtual { v9, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " ms"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static { v0, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 240
    if-nez v8, :L12
    return-object v1
  :L12
  .line 241
    nop
  .line 242
    monitor-enter v2
  :L13
  .line 243
    sget v0, Lcom/innioasis/ipp/Albums;->songGen:I
    if-eq v3, v0, :L14
    monitor-exit v2
    return-object v8
  :L14
  .line 244
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v0, :L15
    monitor-exit v2
    return-object v0
  :L15
  .line 245
    sget-object v0, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
    if-eqz v0, :L16
    invoke-interface { v0, v8 }, Ljava/util/List;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L16
    sget-object v0, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
    goto :L17
  :L16
  .line 246
    move-object v0, v8
  :L17
    sput-object v1, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
  .line 247
    sput-object v1, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
  .line 250
    sget-object v3, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
    if-eq v0, v3, :L19
    sget-object v3, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
    if-eqz v3, :L18
    move-object v1, v0
  :L18
    sput-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  :L19
  .line 251
    sput-object v6, Lcom/innioasis/ipp/Albums;->songOrder:Ljava/lang/Object;
  .line 252
    sput-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 253
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v3
    sput-wide v3, Lcom/innioasis/ipp/Albums;->songCacheAt:J
  .line 254
    sput-object v7, Lcom/innioasis/ipp/Albums;->songSig:Ljava/lang/String;
  .line 255
    monitor-exit v2
  :L20
  .line 256
    if-ne v0, v8, :L21
  .line 257
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->share(Ljava/util/List;)V
  .line 258
    invoke-static { }, Lcom/innioasis/ipp/Albums;->reserve()V
  :L21
  .line 260
    return-object v0
  :L22
  .line 255
    move-exception v0
  :L23
    monitor-exit v2
  :L24
    throw v0
  :L25
  .line 228
    move-exception v0
  :L26
    monitor-exit v2
  :L27
    throw v0
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
  .line 272
    move-object/from16 v0, p1
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Albums;->orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
    move-result-object v1
  .line 273
    const/4 v2, 0
    if-eqz v1, :L50
    if-nez v0, :L0
    goto/16 :L50
  :L0
  .line 274
    nop
  :L1
  .line 276
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v3
  .line 277
    const/16 v4, 47
    invoke-virtual { v0, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
    const/4 v5, 0
    invoke-virtual { v0, v5, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v6
    long-to-int v4, v6
  .line 278
    new-array v6, v4, [J
  .line 279
    new-array v7, v4, [Lcom/innioasis/y1/database/Song;
  .line 280
    nop
  .line 281
    const-wide/16 v8, -1
    const/4 v10, 0
  :L2
  .line 283
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
  .line 285
    nop
  :L4
  .line 286
    const-string v13, "songId"
    invoke-interface { v11, v13 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v13
    const-string v14, "name"
    invoke-interface { v11, v14 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v14
  .line 287
    const-string v15, "pinyinName"
    invoke-interface { v11, v15 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v15
    const-string v12, "songName"
    invoke-interface { v11, v12 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v12
  .line 288
    const-string v5, "pinyinSongName"
    invoke-interface { v11, v5 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v5
    const-string v2, "artist"
    invoke-interface { v11, v2 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v2
  .line 289
    move-wide/from16 v16, v8
    const-string v8, "pinyinArtist"
    invoke-interface { v11, v8 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v8
    const-string v9, "album"
    invoke-interface { v11, v9 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v9
  .line 290
    move/from16 v18, v10
    const-string v10, "pinyinAlbum"
    invoke-interface { v11, v10 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v10
    const-string v0, "genre"
    invoke-interface { v11, v0 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v0
  .line 291
    move-object/from16 v19, v3
    const-string v3, "pinyinGenre"
    invoke-interface { v11, v3 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v3
    move-object/from16 v20, v1
    const-string v1, "path"
    invoke-interface { v11, v1 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v1
  .line 292
    move-object/from16 v21, v7
    const-string v7, "isAudiobook"
    invoke-interface { v11, v7 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v7
    move-object/from16 v22, v6
    const-string v6, "date"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
  .line 293
    move/from16 v23, v6
    const-string v6, "fileDate"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
    move/from16 v24, v6
    const-string v6, "lowerName"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
  .line 294
    move/from16 v25, v6
    const-string v6, "lowAlbum"
    invoke-interface { v11, v6 }, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    move-result v6
    const/16 v26, 0
    move/from16 v49, v18
    move/from16 v18, v6
    move/from16 v6, v49
  :L5
  .line 295
    invoke-interface { v11 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v27
  :L6
    if-eqz v27, :L13
  .line 296
    if-lt v6, v4, :L11
  .line 329
    if-eqz v11, :L10
  :L7
  .line 331
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L8
  .line 333
    goto :L10
  :L9
  .line 332
    move-exception v0
  :L10
  .line 296
    const/4 v1, 0
    return-object v1
  :L11
  .line 297
    move/from16 v27, v4
    const/4 v4, 0
  :L12
    invoke-interface { v11, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v16
  .line 298
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
  .line 299
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
  .line 300
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
  .line 301
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
  .line 302
    invoke-static { v11, v4 }, Lcom/innioasis/ipp/Schema;->read(Landroid/database/Cursor;Lcom/innioasis/y1/database/Song;)V
  .line 303
    aput-wide v16, v22, v6
  .line 304
    add-int/lit8 v18, v6, 1
    aput-object v4, v21, v6
  .line 305
    move/from16 v4, v26
    add-int/lit8 v26, v4, 1
  .line 306
    move/from16 v6, v18
    move/from16 v4, v27
    move/from16 v18, v0
    move/from16 v0, v48
    goto/16 :L5
  :L13
  .line 307
    move/from16 v27, v4
    move/from16 v4, v26
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L14
  .line 308
    nop
  .line 309
    const/16 v0, 1000
    if-ge v4, v0, :L36
  .line 311
    move/from16 v0, v27
    if-eq v6, v0, :L15
  .line 329
    nop
  .line 311
    const/4 v1, 0
    return-object v1
  :L15
  .line 312
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
  .line 313
    invoke-interface { v11 }, Landroid/database/Cursor;->getCount()I
    move-result v1
  :L17
    if-eq v1, v0, :L22
  .line 329
    if-eqz v11, :L21
  :L18
  .line 331
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L19
  .line 333
    goto :L21
  :L20
  .line 332
    move-exception v0
  :L21
  .line 313
    const/4 v1, 0
    return-object v1
  :L22
  .line 314
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, v0 }, Ljava/util/ArrayList;-><init>(I)V
  :L23
  .line 315
    invoke-interface { v11 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v0
    if-eqz v0, :L31
  .line 316
    const/4 v4, 0
    invoke-interface { v11, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v2
    move-object/from16 v5, v22
    invoke-static { v5, v2, v3 }, Ljava/util/Arrays;->binarySearch([JJ)I
    move-result v0
  .line 317
    if-ltz v0, :L26
    aget-object v2, v21, v0
    if-nez v2, :L24
    goto :L26
  :L24
  .line 318
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 319
    const/4 v2, 0
    aput-object v2, v21, v0
  :L25
  .line 320
    move-object/from16 v22, v5
    goto :L23
  :L26
  .line 329
    if-eqz v11, :L30
  :L27
  .line 331
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L28
  .line 333
    goto :L30
  :L29
  .line 332
    move-exception v0
  :L30
  .line 317
    const/4 v1, 0
    return-object v1
  :L31
  .line 321
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L32
  .line 322
    nop
  :L33
  .line 323
    invoke-static { }, Lcom/innioasis/ipp/Albums;->tableSig()Ljava/lang/String;
    move-result-object v0
    move-object/from16 v7, p1
    invoke-virtual { v7, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
  :L34
    if-nez v0, :L35
  .line 329
    nop
  .line 323
    const/4 v1, 0
    return-object v1
  :L35
  .line 324
    nop
  .line 329
    nop
  .line 324
    return-object v1
  :L36
  .line 310
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
  .line 325
    move-exception v0
    goto :L39
  :L38
    move-exception v0
    const/4 v11, 0
  :L39
  .line 326
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
  .line 327
    nop
  .line 329
    if-eqz v11, :L44
  :L41
  .line 331
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L42
  .line 333
    goto :L44
  :L43
  .line 332
    move-exception v0
  :L44
  .line 327
    const/4 v1, 0
    return-object v1
  :L45
  .line 329
    move-exception v0
    move-object v1, v0
    if-eqz v11, :L49
  :L46
  .line 331
    invoke-interface { v11 }, Landroid/database/Cursor;->close()V
  :L47
  .line 333
    goto :L49
  :L48
  .line 332
    move-exception v0
  :L49
  .line 335
    throw v1
  :L50
  .line 273
    const/4 v1, 0
    return-object v1
.end method

.method public static realName(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 84
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 86
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 1
    if-nez v0, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L1
    goto :L4
  :L1
  .line 87
    invoke-virtual { p0, v1 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
  .line 88
    if-gez v0, :L2
    goto :L3
  :L2
    const/4 v1, 0
    invoke-virtual { p0, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 86
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
  .line 358
    const/high16 v0, 0x01800000
    const/4 v1, 0
  :L0
    new-array v0, v0, [B
    sput-object v0, Lcom/innioasis/ipp/Albums;->block:[B
  .line 359
    invoke-static { v0 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v0
  .line 360
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  :L1
  .line 361
    const/4 v3, 0
  :L2
    const/4 v4, 4
    const-string v5, "ipplab"
    if-ge v3, v4, :L6
  .line 362
    const/high16 v4, 0x00100000
  :L3
    new-array v4, v4, [B
  .line 363
    invoke-static { v4 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v6
    sub-int/2addr v6, v0
    if-lez v6, :L5
  .line 364
    sput-object v4, Lcom/innioasis/ipp/Albums;->cap:[B
  .line 365
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
  .line 366
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
  .line 375
    sput-object v1, Lcom/innioasis/ipp/Albums;->block:[B
  .line 367
    return-void
  :L5
  .line 369
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 361
    add-int/lit8 v3, v3, 1
    goto :L2
  :L6
  .line 371
    const-string v0, "heap reserve: no cap above the block"
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 372
    const-string v0, "heap reserve failed"
    invoke-static { v5, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L7
    goto :L9
  :L8
  .line 373
    move-exception v0
  :L9
  .line 375
    sput-object v1, Lcom/innioasis/ipp/Albums;->block:[B
  .line 376
    nop
  .line 377
    return-void
.end method

.method public static restore(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 1015
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 1016
    const-string v0, "ipp_open_album"
    invoke-virtual { p0, v0, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1017
    sput-object p2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1019
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1020
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1021
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1022
    return-void
  :L1
  .line 1015
    return-void
.end method

.method public static restoreList(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 1230
    if-eqz p0, :L3
    if-nez p1, :L0
    goto :L3
  :L0
  .line 1231
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
  .line 1232
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
  .line 1233
    sget v1, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1234
    const/4 v2, -1
    sput v2, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1235
    if-ltz v1, :L1
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result p1
    if-ge v1, p1, :L1
    sget p1, Lcom/innioasis/ipp/Albums;->listPos:I
    if-ne p1, v0, :L1
  .line 1237
    sget p1, Lcom/innioasis/ipp/Albums;->listTop:I
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Head;->restore(Landroid/widget/ListView;II)V
    goto :L2
  :L1
  .line 1239
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->setSelection(I)V
  :L2
  .line 1241
    return-void
  :L3
  .line 1230
    return-void
.end method

.method static scanStarts()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 454
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 455
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
  .line 456
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    sput-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 457
    sget v1, Lcom/innioasis/ipp/Albums;->foreign:I
    sput v1, Lcom/innioasis/ipp/Albums;->markForeign:I
  .line 458
    monitor-exit v0
  .line 459
    return-void
  :L1
  .line 458
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method private static scopeEnabled()Z
  .registers 2
  .line 1372
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 1373
    if-nez v0, :L0
    const/4 v0, 0
    return v0
  :L0
  .line 1374
    const-string v1, "artist_scope"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static share(Ljava/util/List;)V
  .catchall { :L2 .. :L10 } :L11
  .registers 9
  .line 385
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 386
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
  .line 387
    nop
  .line 388
    const/4 v3, 0
    const/4 v4, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v3, v5, :L13
  .line 389
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 390
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-nez v6, :L1
    goto/16 :L12
  :L1
  .line 391
    check-cast v5, Lcom/innioasis/y1/database/Song;
  :L2
  .line 394
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
  .line 395
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
  .line 396
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
  .line 397
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
  .line 398
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
  .line 399
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
  .line 400
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
  .line 401
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
  .line 403
    goto :L12
  :L11
  .line 402
    move-exception v5
  :L12
  .line 388
    add-int/lit8 v3, v3, 1
    goto/16 :L0
  :L13
  .line 405
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
  .line 406
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
  .line 407
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 408
    const-string v0, "ippshare"
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 409
    return-void
.end method

.method static shared(Ljava/util/List;)Ljava/util/List;
  .registers 7
  .line 532
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 533
    if-eqz p0, :L9
    if-nez v0, :L0
    goto :L9
  :L0
  .line 534
    new-instance v1, Ljava/util/HashMap;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    mul-int/lit8 v2, v2, 2
    invoke-direct { v1, v2 }, Ljava/util/HashMap;-><init>(I)V
  .line 535
    const/4 v2, 0
    const/4 v3, 0
  :L1
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L3
  .line 536
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 537
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L2
    move-object v5, v4
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v1, v5, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 535
    add-int/lit8 v3, v3, 1
    goto :L1
  :L3
  .line 539
    new-instance v0, Ljava/util/ArrayList;
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    invoke-direct { v0, v3 }, Ljava/util/ArrayList;-><init>(I)V
  .line 540
    nop
  :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 541
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 542
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
  .line 543
    if-eqz v4, :L7
    move-object v3, v4
  :L7
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 540
    add-int/lit8 v2, v2, 1
    goto :L4
  :L8
  .line 545
    return-object v0
  :L9
  .line 533
    return-object p0
.end method

.method public static songListSort()I
  .registers 1
  .line 997
    sget v0, Lcom/innioasis/ipp/Albums;->songSort:I
    return v0
.end method

.method public static songMenu(Lcom/innioasis/music/util/SubMenuDialog;Landroid/app/Activity;Ljava/lang/String;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 6
  .line 1058
    if-eqz p0, :L6
    if-nez p1, :L0
    goto/16 :L6
  :L0
  .line 1059
    sput-object p0, Lcom/innioasis/ipp/Albums;->songDlg:Lcom/innioasis/music/util/SubMenuDialog;
  .line 1060
    invoke-static { p2 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p2
  .line 1061
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1062
    const v1, 2131820964
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1063
    const v1, 2131820963
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1064
    if-eqz p2, :L1
    const v1, 2131820962
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L2
  :L1
  .line 1065
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->trackSortEnabled()Z
    move-result v1
    if-eqz v1, :L2
    const v1, 2131821024
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 1066
    const v1, 2131820844
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1067
    const v1, 2131820584
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1068
    const v1, 2131820841
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1069
    const v1, 2131821047
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1071
    if-nez p2, :L3
    invoke-static { p3 }, Lcom/innioasis/ipp/Artists;->canOpen(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p3
    if-eqz p3, :L3
    const p3, 2131821105
    invoke-virtual { p1, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { v0, p3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1072
    if-eqz p2, :L4
    const p2, 2131821071
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L5
  :L4
  .line 1073
    const p2, 2131821060
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 1074
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 1075
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 1076
    return-void
  :L6
  .line 1058
    return-void
.end method

.method public static songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 4
  .line 1408
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->allSongsArtist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->artistSongs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L0
  .line 1409
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const/4 p0, 0
    return-object p0
  :L1
  .line 1410
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1411
    if-nez v0, :L2
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L2
  .line 1412
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->onlyScoped(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1414
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p1, v0, :L3
  .line 1415
    new-instance p1, Lcom/innioasis/ipp/Albums$SongCmp;
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-direct { p1, v0 }, Lcom/innioasis/ipp/Albums$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1416
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->trackSortEnabled()Z
    move-result p1
    if-eqz p1, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    goto :L4
  :L3
  .line 1418
    new-instance v0, Lcom/innioasis/ipp/Albums$SongCmp;
    invoke-direct { v0, p1 }, Lcom/innioasis/ipp/Albums$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { p0, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1419
    nop
  :L4
  .line 1421
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->byDisc(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method private static songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .catchall { :L0 .. :L3 } :L11
  .catchall { :L7 .. :L10 } :L9
  .catchall { :L12 .. :L13 } :L11
  .registers 11
  .line 624
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 625
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L1
    sget-object v2, Lcom/innioasis/ipp/Albums;->songOrder:Ljava/lang/Object;
    if-ne p1, v2, :L1
    monitor-exit v0
    return-object v1
  :L1
  .line 626
    sget-object v1, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
    if-eqz v1, :L2
    sget-object v2, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
    if-ne p1, v2, :L2
    monitor-exit v0
    return-object v1
  :L2
  .line 627
    sget v1, Lcom/innioasis/ipp/Albums;->songGen:I
  .line 628
    monitor-exit v0
  :L3
  .line 629
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 630
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->ordered(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v4
  .line 631
    const-string v5, "ipplab"
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
    if-eqz v4, :L4
    const/4 v7, 1
    goto :L5
  :L4
    const/4 v7, 0
  :L5
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, " "
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
    sub-long/2addr v7, v2
    invoke-virtual { v6, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, " ms"
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-static { v5, v6 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 632
    if-nez v4, :L6
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsList(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->shared(Ljava/util/List;)Ljava/util/List;
    move-result-object v4
  :L6
  .line 633
    const-string p0, "ipplab"
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "sorted query "
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v6, " "
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
    sub-long/2addr v6, v2
    invoke-virtual { v5, v6, v7 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " ms"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static { p0, v2 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 634
    monitor-enter v0
  .line 635
    if-eqz v4, :L8
  :L7
    sget p0, Lcom/innioasis/ipp/Albums;->songGen:I
    if-ne v1, p0, :L8
  .line 636
    sput-object v4, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 637
    sput-object p1, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
  :L8
  .line 639
    monitor-exit v0
  .line 640
    return-object v4
  :L9
  .line 639
    move-exception p0
    monitor-exit v0
  :L10
    throw p0
  :L11
  .line 628
    move-exception p0
  :L12
    monitor-exit v0
  :L13
    throw p0
.end method

.method public static songsList(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 519
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
  :L0
  .line 521
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p1
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAllSong(I)V
  :L1
  .line 523
    goto :L3
  :L2
  .line 522
    move-exception p1
  :L3
  .line 524
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
  .line 1312
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1313
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 1314
    if-eqz v1, :L6
    if-nez p0, :L0
    goto :L6
  :L0
  .line 1315
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1316
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
  .line 1317
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v1, v2, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    goto :L5
  :L1
  .line 1319
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
  .line 1320
    if-eqz p0, :L5
  .line 1321
    check-cast p0, Ljava/util/LinkedHashSet;
    invoke-virtual { p0 }, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L4
  .line 1322
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
  .line 1325
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1326
    return-object v0
  :L6
  .line 1314
    return-object v0
.end method

.method public static songsSync(Lcom/innioasis/music/data/Album;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
  .registers 7
  .line 1447
    const/4 p1, 0
    if-nez p0, :L0
    return-object p1
  :L0
  .line 1449
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Genres;->noteList(Lcom/innioasis/music/data/Album;Lcom/innioasis/music/data/Genre;)V
  .line 1451
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L5
  .line 1452
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object p1
  .line 1453
    if-nez p1, :L1
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L1
  .line 1454
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  .line 1455
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1456
    nop
  :L2
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    if-ge v1, v0, :L4
  .line 1457
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1458
    if-eqz v0, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L3
    invoke-virtual { p2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1456
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 1460
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p2, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1461
    return-object p2
  :L5
  .line 1464
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L14
  .line 1465
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1466
    if-nez v0, :L6
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L6
  .line 1467
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  .line 1468
    if-nez p2, :L7
    goto :L8
  :L7
    invoke-virtual { p2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
  :L8
  .line 1469
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1470
    nop
  :L9
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L13
  .line 1471
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1472
    if-eqz v2, :L12
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L10
    goto :L12
  :L10
  .line 1473
    if-eqz p1, :L11
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L11
    goto :L12
  :L11
  .line 1474
    invoke-virtual { p2, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L12
  .line 1470
    add-int/lit8 v1, v1, 1
    goto :L9
  :L13
  .line 1476
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p2, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1477
    return-object p2
  :L14
  .line 1479
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L15
    return-object p1
  :L15
  .line 1480
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1481
    if-nez v0, :L16
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L16
  .line 1482
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1483
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 1484
    if-nez p2, :L17
    goto :L18
  :L17
    invoke-virtual { p2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
  :L18
  .line 1485
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1486
    if-eqz p1, :L22
  .line 1487
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1488
    nop
  :L19
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    if-ge v1, v0, :L21
  .line 1489
    invoke-virtual { p0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1490
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p1 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L20
    invoke-virtual { p2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L20
  .line 1488
    add-int/lit8 v1, v1, 1
    goto :L19
  :L21
  .line 1492
    move-object p0, p2
  :L22
  .line 1495
    sget-object p1, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1496
    return-object p0
.end method

.method public static sortFor(Ljava/lang/String;)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  .registers 3
  .line 1040
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAlbumSong()I
    move-result v0
  .line 1041
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L2
  .line 1042
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 1043
    if-nez p0, :L0
    goto :L1
  :L0
    const-string v1, "all_sort"
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
  :L1
  .line 1044
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object p0
    return-object p0
  :L2
  .line 1047
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p0
    if-ne v0, p0, :L3
  .line 1048
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L3
  .line 1050
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object p0
    return-object p0
.end method

.method private static sortValue(Z)I
  .registers 3
  .line 970
    if-nez p0, :L0
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAlbum()I
    move-result p0
    return p0
  :L0
  .line 971
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 972
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v0
  .line 973
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
  .registers 9
  .line 1262
    if-nez p0, :L0
    return-object p0
  :L0
  .line 1263
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1264
    const-string v1, "split allSongs"
    invoke-static { v1 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1265
    if-nez v0, :L1
    return-object p0
  :L1
  .line 1266
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 1267
    const-string v1, "split foldersOf"
    invoke-static { v1 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1268
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1269
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L11
  .line 1270
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 1271
    if-nez v4, :L3
    const-string v5, ""
    goto :L4
  :L3
    move-object v5, v4
  :L4
    invoke-virtual { v0, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
  .line 1272
    if-nez v5, :L5
    const/4 v5, 0
    goto :L6
  :L5
    check-cast v5, Ljava/util/LinkedHashSet;
  :L6
  .line 1273
    if-eqz v5, :L9
    invoke-virtual { v5 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v6
    if-eqz v6, :L7
    goto :L9
  :L7
  .line 1274
    new-instance v6, Ljava/util/ArrayList;
    invoke-direct { v6, v5 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1275
    sget-object v5, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v6, v5 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1276
    const/4 v5, 0
  :L8
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v7
    if-ge v5, v7, :L10
    invoke-virtual { v6, v5 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/String;
    invoke-static { v4, v7 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v1, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v5, v5, 1
    goto :L8
  :L9
  .line 1273
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L10
  .line 1269
    add-int/lit8 v3, v3, 1
    goto :L2
  :L11
  .line 1278
    const-string p0, "split loop"
    invoke-static { p0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1279
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->byYear(Ljava/util/ArrayList;)Ljava/util/List;
    move-result-object p0
  .line 1280
    const-string v0, "split byYear"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1281
    return-object p0
.end method

.method public static splitAlbums(Ljava/util/List;)Ljava/util/List;
  .registers 14
  .line 1286
    if-nez p0, :L0
    return-object p0
  :L0
  .line 1287
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1288
    if-nez v0, :L1
    return-object p0
  :L1
  .line 1289
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 1290
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1291
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L12
  .line 1292
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/music/data/Album;
  .line 1293
    if-nez v4, :L3
    goto :L11
  :L3
  .line 1294
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
  .line 1295
    invoke-virtual { v0, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
  .line 1296
    const/4 v8, 0
    if-nez v7, :L6
    move-object v7, v8
    goto :L7
  :L6
    check-cast v7, Ljava/util/LinkedHashSet;
  :L7
  .line 1297
    if-eqz v7, :L10
    invoke-virtual { v7 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v9
    if-eqz v9, :L8
    goto :L10
  :L8
  .line 1298
    new-instance v9, Ljava/util/ArrayList;
    invoke-direct { v9, v7 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1299
    sget-object v7, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v9, v7 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1300
    const/4 v7, 0
  :L9
    invoke-virtual { v9 }, Ljava/util/ArrayList;->size()I
    move-result v10
    if-ge v7, v10, :L11
  .line 1301
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
  .line 1300
    add-int/lit8 v7, v7, 1
    goto :L9
  :L10
  .line 1297
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L11
  .line 1291
    add-int/lit8 v3, v3, 1
    goto :L2
  :L12
  .line 1304
    return-object v1
.end method

.method private static str(Landroid/database/Cursor;I)Ljava/lang/String;
  .registers 3
  .line 339
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
  .line 554
    const-string v0, "/"
  .line 556
    const/4 v1, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v2
    const-string v3, "select count(*), max(rowid), total(rowid), total(length(path)) from song where isAudiobook = 0"
    invoke-virtual { v2, v3, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v2
  :L1
  .line 558
    invoke-interface { v2 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v3
  :L2
    if-nez v3, :L7
  .line 564
    if-eqz v2, :L6
  :L3
  .line 566
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  :L4
  .line 568
    goto :L6
  :L5
  .line 567
    move-exception v0
  :L6
  .line 558
    return-object v1
  :L7
  .line 559
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
    invoke-interface { v2, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v4
    invoke-virtual { v3, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/4 v4, 2
    invoke-interface { v2, v4 }, Landroid/database/Cursor;->getDouble(I)D
    move-result-wide v4
    double-to-long v4, v4
    invoke-virtual { v3, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 560
    const/4 v3, 3
    invoke-interface { v2, v3 }, Landroid/database/Cursor;->getDouble(I)D
    move-result-wide v3
    double-to-long v3, v3
    invoke-virtual { v0, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  :L8
  .line 564
    if-eqz v2, :L12
  :L9
  .line 566
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  :L10
  .line 568
    goto :L12
  :L11
  .line 567
    move-exception v1
  :L12
  .line 559
    return-object v0
  :L13
  .line 561
    move-exception v0
    goto :L15
  :L14
    move-exception v0
    move-object v2, v1
  :L15
  .line 562
    nop
  .line 564
    if-eqz v2, :L19
  :L16
  .line 566
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  :L17
  .line 568
    goto :L19
  :L18
  .line 567
    move-exception v0
  :L19
  .line 562
    return-object v1
.end method

.method public static tintAllSongsRow(Landroid/widget/TextView;)V
  .registers 3
  .line 927
    sget-object v0, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 928
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 929
    if-eqz v0, :L1
    if-nez p0, :L0
    goto :L1
  :L0
  .line 930
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 931
    return-void
  :L1
  .line 929
    return-void
.end method

.method public static trackFolder(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 112
    const-string v0, ""
    if-nez p0, :L0
    return-object v0
  :L0
  .line 113
    const/16 v1, 47
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 114
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
  .line 208
    invoke-static { }, Lcom/innioasis/ipp/Albums;->worker()Landroid/os/Handler;
    move-result-object v0
  .line 209
    sget-object v1, Lcom/innioasis/ipp/Albums;->WARM:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 210
    invoke-virtual { v0, v1, p0, p1 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 212
    goto :L3
  :L2
  .line 211
    move-exception p0
  :L3
  .line 213
    return-void
.end method

.method private static worker()Landroid/os/Handler;
  .catchall { :L0 .. :L3 } :L2
  .registers 3
  .line 194
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 195
    sget-object v1, Lcom/innioasis/ipp/Albums;->warmer:Landroid/os/Handler;
    if-nez v1, :L1
  .line 197
    new-instance v1, Landroid/os/HandlerThread;
    const-string v2, "ipp-library"
    invoke-direct { v1, v2 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 198
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->start()V
  .line 199
    new-instance v2, Landroid/os/Handler;
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v2, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v2, Lcom/innioasis/ipp/Albums;->warmer:Landroid/os/Handler;
  :L1
  .line 201
    sget-object v1, Lcom/innioasis/ipp/Albums;->warmer:Landroid/os/Handler;
    monitor-exit v0
    return-object v1
  :L2
  .line 202
    move-exception v1
    monitor-exit v0
  :L3
    throw v1
.end method

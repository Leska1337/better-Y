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

.field private final static CD_PAT:Ljava/util/regex/Pattern;

.field private final static DISC_CMP:Ljava/util/Comparator;

.field private final static EXTRA_OPEN:Ljava/lang/String; = "ipp_open_album"

.field private final static GEN:C = '\u0003'

.field public final static KEY_SCOPE:Ljava/lang/String; = "artist_scope"

.field private final static PATH_CMP:Ljava/util/Comparator;

.field private final static SEP:C = '\u0001'

.field private final static SONGS:Ljava/lang/Object;

.field private final static STR_CMP:Ljava/util/Comparator;

.field private final static WARM:Ljava/lang/Runnable;

.field private final static WARM_DELAY_MS:J = 2000L

.field private static albumSongsMemo:Ljava/util/HashMap;

.field private static allList:Z

.field private static artistList:Z

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
  .line 162
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
  .line 166
    new-instance v0, Lcom/innioasis/ipp/Albums$Warm;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Albums$Warm;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Albums;->WARM:Ljava/lang/Runnable;
  .line 833
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Albums;->songSort:I
  .line 1052
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1054
    sput v0, Lcom/innioasis/ipp/Albums;->listPos:I
  .line 1171
    new-instance v0, Lcom/innioasis/ipp/Albums$StrCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Albums$StrCmp;-><init>(Lcom/innioasis/ipp/Albums$1;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
  .line 1278
    new-instance v0, Lcom/innioasis/ipp/Albums$DiscCmp;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Albums$DiscCmp;-><init>(Lcom/innioasis/ipp/Albums$1;)V
    sput-object v0, Lcom/innioasis/ipp/Albums;->DISC_CMP:Ljava/util/Comparator;
  .line 1341
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

.method static synthetic access$1000(JJ)I
  .registers 4
  .line 44
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Albums;->cmpLong(JJ)I
    move-result p0
    return p0
.end method

.method static synthetic access$1100(Ljava/lang/String;Ljava/lang/String;)I
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

.method static synthetic access$602(Z)Z
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
  .line 1087
    if-eqz p0, :L2
    if-nez p1, :L0
    goto :L2
  :L0
  .line 1088
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1089
    const v1, 2131820961
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1090
    const v1, 2131820844
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1091
    const v1, 2131820584
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1092
    const v1, 2131820582
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1093
    const v1, 2131821047
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1094
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
  .line 1095
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 1096
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 1097
    return-void
  :L2
  .line 1087
    return-void
.end method

.method private static albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
  .catchall { :L0 .. :L4 } :L3
  .registers 3
  .line 670
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .line 671
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 672
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
  .line 673
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
.end method

.method public static albumSort(Landroid/app/Activity;)I
  .registers 1
  .line 797
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->noteAlbumList(Landroid/app/Activity;)V
  .line 798
    invoke-static { }, Lcom/innioasis/ipp/Albums;->albumSortValue()I
    move-result p0
    return p0
.end method

.method public static albumSortFor(Landroid/app/Activity;)I
  .registers 1
  .line 803
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->artistView(Landroid/app/Activity;)Z
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->sortValue(Z)I
    move-result p0
    return p0
.end method

.method public static albumSortValue()I
  .registers 1
  .line 808
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
  .line 596
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 597
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->readSongs()Ljava/util/List;
    move-result-object v0
    return-object v0
  :L0
  .line 598
    sget-boolean v1, Lcom/innioasis/ipp/Albums;->checkAsked:Z
    if-nez v1, :L1
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1
    sget-wide v3, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    sub-long/2addr v1, v3
    const-wide/32 v3, 600000
    cmp-long v5, v1, v3
    if-ltz v5, :L1
  .line 599
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Albums;->checkAsked:Z
  .line 600
    const-wide/16 v1, 0
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  :L1
  .line 602
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
  .line 742
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
  .line 743
    if-eqz p3, :L5
  .line 745
    if-eqz p0, :L3
    const/high16 v2, 0x41B00000
    goto :L4
  :L3
    const/high16 v2, 0x41A00000
  :L4
    const/4 v3, 2
    invoke-virtual { p3, v3, v2 }, Landroid/widget/TextView;->setTextSize(IF)V
  :L5
  .line 747
    if-eqz p2, :L8
    if-eqz p0, :L6
    const/16 v2, 8
    goto :L7
  :L6
    const/4 v2, 0
  :L7
    invoke-virtual { p2, v2 }, Landroid/widget/TextView;->setVisibility(I)V
  :L8
  .line 748
    if-nez p0, :L9
  .line 749
    invoke-static { p1 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 750
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 751
    return v1
  :L9
  .line 753
    nop
  .line 754
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 755
    if-eqz p0, :L10
    const p2, 2131821049
    invoke-virtual { p0, p2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    goto :L11
  :L10
    const-string p0, "Show all songs"
  :L11
  .line 756
    if-eqz p3, :L12
    invoke-virtual { p3, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L12
  .line 757
    if-eqz p1, :L13
    const p0, 2131623994
    invoke-virtual { p1, p0 }, Landroid/widget/ImageView;->setImageResource(I)V
  :L13
  .line 758
    sput-object p1, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 759
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
  .line 1197
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1198
    if-nez v0, :L0
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L0
  .line 1199
    nop
  .line 1200
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p1, v1, :L1
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L1
  .line 1201
    invoke-virtual { v0, p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByArtist(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
  .line 1202
    if-nez p0, :L2
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
  :L2
    return-object p0
.end method

.method private static artistView(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 783
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-eqz v1, :L3
  .line 784
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
  .line 785
    move-exception p0
  .line 786
    return v0
  :L3
  .line 784
    nop
  :L4
  .line 783
    return v0
.end method

.method public static atStart(Landroid/app/Activity;)V
  .registers 3
  .line 495
    sget-boolean p0, Lcom/innioasis/ipp/Albums;->started:Z
    if-eqz p0, :L0
    return-void
  :L0
  .line 496
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->started:Z
  .line 497
    sget-object p0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez p0, :L1
    const-wide/16 v0, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  :L1
  .line 498
    return-void
.end method

.method public static backAlbum()Ljava/lang/String;
  .registers 3
  .line 1012
    sget-object v0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1013
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 1014
    sput-object v1, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1015
    sget-object v2, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
    sput-object v2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1016
    sput-object v1, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1017
    return-object v0
.end method

.method public static backClose()Z
  .registers 2
  .line 1005
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1006
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 1007
    return v0
.end method

.method public static byDisc(Ljava/util/List;)Ljava/util/List;
  .registers 3
  .line 1272
    if-eqz p0, :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L0
    goto :L1
  :L0
  .line 1273
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1274
    sget-object p0, Lcom/innioasis/ipp/Albums;->DISC_CMP:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1275
    return-object v0
  :L1
  .line 1272
    return-object p0
.end method

.method private static byYear(Ljava/util/ArrayList;)Ljava/util/List;
  .catchall { :L0 .. :L6 } :L7
  .registers 6
  :L0
  .line 725
    invoke-static { }, Lcom/innioasis/ipp/Albums;->albumSortValue()I
    move-result v0
  .line 726
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
  .line 727
    if-nez v1, :L3
    sget-object v4, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Asc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v4
    if-eq v0, v4, :L3
    return-object p0
  :L3
  .line 728
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
  .line 729
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    invoke-virtual { p0, v2, v0 }, Ljava/util/ArrayList;->subList(II)Ljava/util/List;
    move-result-object v0
  .line 730
    invoke-static { v0 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  .line 731
    new-instance v2, Lcom/innioasis/ipp/YearComparator;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/YearComparator;-><init>(Z)V
    invoke-static { v0, v2 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L6
  .line 733
    goto :L8
  :L7
  .line 732
    move-exception v0
  :L8
  .line 734
    return-object p0
.end method

.method public static cacheCleared()V
  .registers 3
  .line 575
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 576
    if-nez v0, :L0
    return-void
  :L0
  .line 577
    const-string v1, "cache_n"
    const/4 v2, -1
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 578
    const-string v1, "cache_t"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 579
    const-string v1, "cache_v"
    const/4 v2, 0
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 580
    const-string v1, "cache_m"
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 581
    return-void
.end method

.method public static cacheCleared(I)V
  .registers 4
  .line 585
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 586
    if-nez v0, :L0
    return-void
  :L0
  .line 587
    const/4 v1, 0
    const-string v2, "cache_m"
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    xor-int/lit8 p0, p0, -1
    and-int/2addr p0, v1
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 588
    return-void
.end method

.method public static cached(Landroid/content/Context;III)Z
  .registers 4
  .line 560
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
  .line 551
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 552
    const-string v1, "cache_n"
    const/4 v2, -1
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    if-ne v1, p1, :L2
  .line 553
    const-string p1, "cache_t"
    invoke-static { p0, p1, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p1
    if-ne p1, p2, :L2
  .line 554
    const-string p1, "cache_v"
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p1
    const/4 p2, 4
    if-eq p1, p2, :L1
    goto :L2
  :L1
  .line 555
    const-string p1, "cache_m"
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p0
    return p0
  :L2
  .line 554
    return v0
.end method

.method private static cmpLong(JJ)I
  .registers 5
  .line 1373
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
  .line 1368
    const-string v0, ""
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  :L1
  .line 1369
    if-nez p1, :L2
    goto :L3
  :L2
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  :L3
  .line 1370
    invoke-virtual { p0, v0 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method public static coverKey(Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 611
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
  .line 612
    sget-object v0, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
  .line 613
    if-nez v0, :L6
  .line 614
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 615
    if-nez v0, :L1
    return-object p0
  :L1
  .line 616
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 617
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 618
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L2
  .line 619
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L5
  .line 620
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
  .line 621
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
  .line 622
    instance-of v4, v3, Ljava/util/LinkedHashSet;
    if-nez v4, :L3
    goto :L2
  :L3
  .line 623
    check-cast v3, Ljava/util/LinkedHashSet;
  .line 624
    invoke-virtual { v3 }, Ljava/util/LinkedHashSet;->size()I
    move-result v4
    const/4 v5, 1
    if-eq v4, v5, :L4
    goto :L2
  :L4
  .line 625
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
  .line 626
    invoke-virtual { v3 }, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v2, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 627
    goto :L2
  :L5
  .line 628
    sput-object v1, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
    move-object v0, v1
  :L6
  .line 630
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  .line 631
    if-nez v0, :L7
    goto :L8
  :L7
    move-object p0, v0
    check-cast p0, Ljava/lang/String;
  :L8
    return-object p0
  :L9
  .line 611
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
  .line 1034
    sget-object v0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1035
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 1036
    if-eqz v0, :L6
    if-nez p0, :L0
    goto :L6
  :L0
  .line 1037
    const/4 v1, 0
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
    if-ge v1, v2, :L5
  .line 1038
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  .line 1039
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v3, :L4
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L4
  .line 1040
    if-nez p1, :L2
  .line 1041
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
    goto :L3
  :L2
  .line 1043
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  :L3
  .line 1045
    return-void
  :L4
  .line 1037
    add-int/lit8 v1, v1, 1
    goto :L1
  :L5
  .line 1048
    return-void
  :L6
  .line 1036
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
  .line 677
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 678
    const/4 v1, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L6
  .line 679
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 680
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v3
    if-nez v3, :L1
    const-string v3, ""
    goto :L2
  :L1
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v3
  :L2
  .line 681
    invoke-virtual { v0, v3 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
  .line 682
    if-nez v4, :L3
    const/4 v4, 0
    goto :L4
  :L3
    check-cast v4, Ljava/util/LinkedHashSet;
  :L4
  .line 683
    if-nez v4, :L5
    new-instance v4, Ljava/util/LinkedHashSet;
    invoke-direct { v4 }, Ljava/util/LinkedHashSet;-><init>()V
    invoke-virtual { v0, v3, v4 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 684
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v4, v2 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  .line 678
    add-int/lit8 v1, v1, 1
    goto :L0
  :L6
  .line 686
    return-object v0
.end method

.method private static foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .catchall { :L0 .. :L2 } :L14
  .catchall { :L11 .. :L13 } :L12
  .catchall { :L15 .. :L16 } :L14
  .registers 8
  .line 639
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 640
    sget-object v1, Lcom/innioasis/ipp/Albums;->foldersFor:Ljava/util/List;
    if-ne v1, p0, :L1
    sget-object v1, Lcom/innioasis/ipp/Albums;->foldersMemo:Ljava/util/LinkedHashMap;
    if-eqz v1, :L1
    monitor-exit v0
    return-object v1
  :L1
  .line 641
    monitor-exit v0
  :L2
  .line 642
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 643
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 644
    const/4 v2, 0
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L10
  .line 645
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 646
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L4
    const-string v4, ""
    goto :L5
  :L4
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v4
  :L5
  .line 647
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->albumFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
  .line 648
    invoke-virtual { v0, v4 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
  .line 649
    if-nez v6, :L6
    const/4 v6, 0
    goto :L7
  :L6
    check-cast v6, Ljava/util/LinkedHashSet;
  :L7
  .line 650
    if-nez v6, :L8
    new-instance v6, Ljava/util/LinkedHashSet;
    invoke-direct { v6 }, Ljava/util/LinkedHashSet;-><init>()V
    invoke-virtual { v0, v4, v6 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L8
  .line 651
    invoke-virtual { v6, v5 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  .line 652
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/Albums;->enc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 653
    invoke-virtual { v1, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/ArrayList;
  .line 654
    if-nez v5, :L9
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
    invoke-virtual { v1, v4, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 655
    invoke-virtual { v5, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 644
    add-int/lit8 v2, v2, 1
    goto :L3
  :L10
  .line 657
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L11
  .line 658
    sput-object p0, Lcom/innioasis/ipp/Albums;->foldersFor:Ljava/util/List;
  .line 659
    sput-object v0, Lcom/innioasis/ipp/Albums;->foldersMemo:Ljava/util/LinkedHashMap;
  .line 660
    sput-object v1, Lcom/innioasis/ipp/Albums;->albumSongsMemo:Ljava/util/HashMap;
  .line 661
    monitor-exit v2
  .line 662
    return-object v0
  :L12
  .line 661
    move-exception p0
    monitor-exit v2
  :L13
    throw p0
  :L14
  .line 641
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
  .line 170
    const-string v0, "invalidate"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->who(Ljava/lang/String;)V
  .line 171
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 172
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sget-object v2, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
    if-eq v1, v2, :L1
    sget v1, Lcom/innioasis/ipp/Albums;->foreign:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Albums;->foreign:I
  :L1
  .line 173
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L2
  .line 174
    sput-object v1, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
  .line 175
    sget-wide v1, Lcom/innioasis/ipp/Albums;->songCacheAt:J
    sput-wide v1, Lcom/innioasis/ipp/Albums;->prevAt:J
  .line 176
    sget-object v1, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
    sput-object v1, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
  .line 177
    sget-object v1, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
    sput-object v1, Lcom/innioasis/ipp/Albums;->sortedPrevType:Ljava/lang/Object;
  :L2
  .line 179
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 180
    const-wide/16 v2, 0
    sput-wide v2, Lcom/innioasis/ipp/Albums;->songCacheAt:J
  .line 181
    sget v2, Lcom/innioasis/ipp/Albums;->songGen:I
    add-int/lit8 v2, v2, 1
    sput v2, Lcom/innioasis/ipp/Albums;->songGen:I
  .line 182
    sput-object v1, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 183
    monitor-exit v0
  :L3
  .line 184
    sput-object v1, Lcom/innioasis/ipp/Albums;->keyMemo:Ljava/util/HashMap;
  .line 185
    invoke-static { }, Lcom/innioasis/ipp/Find;->clear()V
  .line 186
    const-wide/16 v0, 2000
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Albums;->warmSoon(J)V
  .line 187
    return-void
  :L4
  .line 183
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
  .line 1240
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
  .line 337
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 338
    sget-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 339
    const/4 v2, 0
    sput-object v2, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 340
    sput-object v2, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
  .line 341
    if-eqz p0, :L5
    if-eqz v1, :L5
    sget p0, Lcom/innioasis/ipp/Albums;->foreign:I
    sget v3, Lcom/innioasis/ipp/Albums;->markForeign:I
    if-eq p0, v3, :L1
    goto :L5
  :L1
  .line 342
    sget-object p0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-nez p0, :L4
    sget-object p0, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
    if-eq p0, v1, :L2
    goto :L4
  :L2
  .line 343
    sput-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 344
    sget-wide v3, Lcom/innioasis/ipp/Albums;->prevAt:J
    sput-wide v3, Lcom/innioasis/ipp/Albums;->songCacheAt:J
  .line 345
    sget-object p0, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
    sput-object p0, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 346
    sget-object p0, Lcom/innioasis/ipp/Albums;->sortedPrevType:Ljava/lang/Object;
    sput-object p0, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
  .line 347
    sput-object v2, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
  .line 348
    sput-object v2, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
  .line 349
    monitor-exit v0
  :L3
  .line 350
    const-string p0, "library scan: nothing written, the list in memory is kept"
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 351
    return-void
  :L4
  .line 342
    monitor-exit v0
    return-void
  :L5
  .line 341
    monitor-exit v0
    return-void
  :L6
  .line 349
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
  .line 214
    invoke-static { }, Lcom/innioasis/ipp/Albums;->worker()Landroid/os/Handler;
    move-result-object v0
    invoke-virtual { v0, p0, p1, p2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 216
    goto :L3
  :L2
  .line 215
    move-exception p0
  :L3
  .line 217
    return-void
.end method

.method public static levelFor(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 847
    sget-object v0, Lcom/innioasis/ipp/Albums;->listKey:Ljava/lang/String;
  .line 848
    const/4 v1, 0
    if-eqz v0, :L3
    if-nez p0, :L0
    goto :L3
  :L0
  .line 849
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
  .line 848
    return-object v1
.end method

.method public static listForView(Ljava/util/List;Landroid/app/Activity;)Ljava/util/List;
  .registers 9
  .line 691
    nop
  .line 692
    const/4 v0, 0
    if-eqz p1, :L0
  .line 693
    invoke-virtual { p1 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p1
  .line 694
    if-eqz p1, :L0
    const-string v1, "ipp_artist"
    invoke-virtual { p1, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    goto :L1
  :L0
  .line 696
    move-object p1, v0
  :L1
    sput-object p1, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 697
    const/4 v1, 0
    if-eqz p1, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
    sput-boolean v2, Lcom/innioasis/ipp/Albums;->artistList:Z
  .line 698
    if-nez p1, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->split(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L4
  .line 700
    if-nez p0, :L5
    return-object p0
  :L5
  .line 703
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Artists;->forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v0
  .line 704
    if-eqz v0, :L15
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L6
    goto :L15
  :L6
  .line 705
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersByName(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v2
  .line 706
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 707
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L7
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->allMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v3, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 708
    const/4 p1, 0
  :L8
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-ge p1, v0, :L14
  .line 709
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
  .line 710
    if-nez v0, :L9
    const-string v4, ""
    goto :L10
  :L9
    move-object v4, v0
  :L10
    invoke-virtual { v2, v4 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
  .line 711
    if-nez v4, :L11
    goto :L13
  :L11
  .line 712
    new-instance v5, Ljava/util/ArrayList;
    check-cast v4, Ljava/util/LinkedHashSet;
    invoke-direct { v5, v4 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 713
    sget-object v4, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v5, v4 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 714
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
  .line 708
    add-int/lit8 p1, p1, 1
    goto :L8
  :L14
  .line 716
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->byYear(Ljava/util/ArrayList;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L15
  .line 704
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
.end method

.method private static lists()V
  .registers 3
  .line 355
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 356
    if-nez v0, :L0
    return-void
  :L0
  .line 357
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
  .line 358
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->index(Ljava/util/List;)V
  .line 359
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 360
    if-nez v0, :L1
    return-void
  :L1
  .line 361
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    sget-object v2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 362
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAllSong()I
    move-result v2
  .line 361
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object v1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Albums;->songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .line 363
    invoke-static { }, Lcom/innioasis/ipp/Lab;->reads()V
  .line 364
    return-void
.end method

.method public static loadNow()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  :L0
  .line 303
    invoke-static { }, Lcom/innioasis/ipp/Scan;->clean()Z
    move-result v0
  .line 304
    invoke-static { }, Lcom/innioasis/ipp/Scan;->done()V
  .line 305
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->keep(Z)V
  .line 306
    invoke-static { }, Lcom/innioasis/ipp/Albums;->lists()V
  .line 307
    invoke-static { }, Lcom/innioasis/ipp/Schema;->backfill()V
  :L1
  .line 309
    goto :L3
  :L2
  .line 308
    move-exception v0
  :L3
  .line 310
    return-void
.end method

.method static loaded()Ljava/util/List;
  .registers 1
  .line 592
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    return-object v0
.end method

.method private static matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
  .registers 7
  .line 1179
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
    move-result-object v0
  .line 1180
    if-eqz v0, :L4
  .line 1181
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
  .line 1182
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
  .line 1184
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1185
    const/4 v1, 0
  :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L7
  .line 1186
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1187
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
  .line 1185
    add-int/lit8 v1, v1, 1
    goto :L5
  :L7
  .line 1189
    return-object v0
.end method

.method public static noteAlbumList(Landroid/app/Activity;)V
  .registers 1
  .line 792
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->artistView(Landroid/app/Activity;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->artistList:Z
  .line 793
    return-void
.end method

.method public static noteAlbumSort(I)V
  .registers 3
  .line 820
    sget-boolean v0, Lcom/innioasis/ipp/Albums;->artistList:Z
    if-eqz v0, :L1
  .line 821
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 822
    if-eqz v0, :L0
    const-string v1, "artist_album_sort"
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L0
  .line 823
    return-void
  :L1
  .line 825
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAlbum(I)V
  .line 826
    return-void
.end method

.method public static noteCached(Landroid/content/Context;III)V
  .registers 6
  .line 565
    if-nez p0, :L0
    return-void
  :L0
  .line 566
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Albums;->cachedMask(Landroid/content/Context;II)I
    move-result v0
  .line 567
    const-string v1, "cache_n"
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 568
    const-string p1, "cache_t"
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 569
    const-string p1, "cache_v"
    const/4 p2, 4
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 570
    const-string p1, "cache_m"
    or-int p2, v0, p3
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 571
    return-void
.end method

.method public static noteListAlbum(Ljava/lang/String;)V
  .registers 1
  .line 1245
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->allList:Z
  .line 1246
    return-void
.end method

.method public static noteListScroll(Landroid/widget/ListView;Ljava/lang/Object;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 1058
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1060
    if-eqz p0, :L7
  :L0
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    goto :L7
  :L1
  .line 1061
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 1062
    if-nez v2, :L2
    goto :L3
  :L2
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v1
  :L3
    sput v1, Lcom/innioasis/ipp/Albums;->listTop:I
  .line 1063
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1064
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Albums;->listPos:I
  :L4
  .line 1067
    goto :L6
  :L5
  .line 1065
    move-exception p0
  .line 1066
    sput v0, Lcom/innioasis/ipp/Albums;->listFirst:I
  :L6
  .line 1068
    return-void
  :L7
  .line 1060
    return-void
.end method

.method public static noteReturn(Ljava/lang/String;)V
  .registers 1
  .line 999
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 1000
    sget-object p0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 1001
    return-void
.end method

.method public static noteSort(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
  .registers 3
  .line 868
    if-nez p1, :L0
    return-void
  :L0
  .line 869
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p1
  .line 870
    sput p1, Lcom/innioasis/ipp/Albums;->songSort:I
  .line 871
    sput-object p0, Lcom/innioasis/ipp/Albums;->listKey:Ljava/lang/String;
  .line 872
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L2
  .line 873
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 874
    if-eqz p0, :L1
    const-string v0, "all_sort"
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 875
    return-void
  :L2
  .line 877
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAlbumSong(I)V
  .line 878
    return-void
.end method

.method private static odd(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 284
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    xor-int/lit8 p0, p0, 1
    return p0
.end method

.method private static one(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 288
    if-nez p1, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 289
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
  .line 290
    if-nez v0, :L1
  .line 291
    invoke-virtual { p0, p1, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 292
    return-object p1
  :L1
  .line 294
    return-object v0
.end method

.method private static onlyScoped(Ljava/util/ArrayList;)Ljava/util/ArrayList;
  .registers 6
  .line 1220
    sget-object v0, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 1221
    if-eqz v0, :L7
    invoke-virtual { p0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L7
    invoke-static { }, Lcom/innioasis/ipp/Albums;->scopeEnabled()Z
    move-result v1
    if-nez v1, :L0
    goto :L7
  :L0
  .line 1223
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    return-object p0
  :L1
  .line 1224
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1225
    const/4 v2, 0
  :L2
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 1226
    invoke-virtual { p0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1227
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L3
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1225
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 1230
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L5
    goto :L6
  :L5
    move-object p0, v1
  :L6
    return-object p0
  :L7
  .line 1221
    return-object p0
.end method

.method public static openAlbumFrom(Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 4
  .line 988
    if-nez p0, :L0
    return-void
  :L0
  .line 989
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->openTarget(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
    move-result-object p1
  .line 990
    if-nez p1, :L1
    return-void
  :L1
  .line 991
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 992
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 993
    const-string v1, "ipp_open_album"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 994
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 995
    return-void
.end method

.method public static openAlbumName(Landroid/app/Activity;Ljava/lang/String;)V
  .registers 3
  .line 964
    if-eqz p0, :L1
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 965
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    const/4 v0, 0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Albums;->openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .line 966
    return-void
  :L1
  .line 964
    return-void
.end method

.method public static openAlbumOfSong(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;)V
  .registers 3
  .line 970
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 971
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Albums;->openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .line 972
    return-void
  :L1
  .line 970
    return-void
.end method

.method public static openArtistFrom(Landroid/app/Activity;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 3
  .line 925
    sget-object v0, Lcom/innioasis/ipp/Albums;->songDlg:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Artists;->openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p0
    return p0
.end method

.method private static openKey(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 975
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 976
    sput-object p2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 977
    const/4 p2, 1
    sput-boolean p2, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 978
    const/4 p2, 0
    sput-object p2, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 979
    sput-object p2, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 980
    sput-object p2, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 981
    new-instance p2, Landroid/content/Intent;
    const-class v0, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { p2, p0, v0 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 982
    const-string v0, "ipp_open_album"
    invoke-virtual { p2, v0, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 983
    invoke-virtual { p0, p2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 984
    return-void
  :L1
  .line 975
    return-void
.end method

.method public static openRequest(Landroid/app/Activity;)Ljava/lang/String;
  .catchall { :L0 .. :L5 } :L2
  .registers 3
  .line 1023
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-nez v1, :L1
    goto :L3
  :L1
  .line 1024
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_open_album"
    invoke-virtual { p0, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    goto :L4
  :L2
  .line 1027
    move-exception p0
    goto :L6
  :L3
  .line 1024
    move-object p0, v0
  :L4
  .line 1025
    if-nez p0, :L7
    sput-object v0, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  :L5
    goto :L7
  :L6
  .line 1028
    return-object v0
  :L7
  .line 1026
    return-object p0
.end method

.method public static openTarget(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
  .registers 5
  .line 940
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 941
    nop
  .line 942
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 943
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
  .line 944
    move-object v3, v0
  :L2
    if-nez v3, :L3
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v3
  :L3
  .line 945
    instance-of p0, v3, Lcom/innioasis/y1/database/Song;
    if-nez p0, :L4
    return-object v0
  :L4
  .line 946
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 947
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
  .line 948
    if-nez p0, :L5
    return-object v0
  :L5
  .line 949
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    sput-object v3, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 950
    sput-boolean v2, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 951
    sput-object v0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 952
    sput-object v0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 954
    sput-object v0, Lcom/innioasis/ipp/Albums;->scope:Ljava/lang/String;
  .line 955
    if-eqz v1, :L6
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L6
  .line 956
    return-object p0
.end method

.method private static orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
  .registers 2
  .line 420
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L0
    const-string p0, "lower(pinyinName)"
    return-object p0
  :L0
  .line 421
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L1
    const-string p0, "lower(pinyinName) desc"
    return-object p0
  :L1
  .line 422
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L2
    const-string p0, "fileDate"
    return-object p0
  :L2
  .line 423
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L3
    const-string p0, "fileDate desc"
    return-object p0
  :L3
  .line 424
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L4
    const-string p0, "lower(pinyinSongName) asc"
    return-object p0
  :L4
  .line 425
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L5
    const-string p0, "lower(pinyinSongName) desc"
    return-object p0
  :L5
  .line 426
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p0, v0, :L6
    const-string p0, "lower(pinyinAlbum) desc"
    return-object p0
  :L6
  .line 427
    const/4 p0, 0
    return-object p0
.end method

.method private static orderNow()Ljava/lang/Object;
  .registers 2
  .line 368
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 369
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result v1
    if-eqz v1, :L2
  .line 370
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L1
  :L0
  .line 371
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L1
  .line 370
    return-object v0
  :L2
  .line 373
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    if-eqz v0, :L3
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Asc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L4
  :L3
  .line 374
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  :L4
  .line 373
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
  .line 436
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->orderBy(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/lang/String;
    move-result-object p0
  .line 437
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 438
    const/4 v1, 0
    if-eqz p0, :L34
    if-nez v0, :L0
    goto/16 :L34
  :L0
  .line 439
    nop
  :L1
  .line 441
    new-instance v2, Ljava/util/HashMap;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    mul-int/lit8 v3, v3, 2
    invoke-direct { v2, v3 }, Ljava/util/HashMap;-><init>(I)V
  .line 442
    const/4 v3, 0
    const/4 v4, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 443
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 444
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-eqz v6, :L3
    move-object v6, v5
    check-cast v6, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v2, v6, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 442
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 446
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
  .line 447
    invoke-interface { p0 }, Landroid/database/Cursor;->getCount()I
    move-result v4
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v5
  :L6
    if-eq v4, v5, :L11
  .line 458
    if-eqz p0, :L10
  :L7
  .line 460
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L8
  .line 462
    goto :L10
  :L9
  .line 461
    move-exception p0
  :L10
  .line 447
    return-object v1
  :L11
  .line 448
    new-instance v4, Ljava/util/ArrayList;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    invoke-direct { v4, v0 }, Ljava/util/ArrayList;-><init>(I)V
  :L12
  .line 449
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v0
    if-eqz v0, :L22
  .line 450
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
  .line 451
    if-nez v0, :L20
  .line 458
    if-eqz p0, :L19
  :L16
  .line 460
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L17
  .line 462
    goto :L19
  :L18
  .line 461
    move-exception p0
  :L19
  .line 451
    return-object v1
  :L20
  .line 452
    invoke-virtual { v4, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L21
  .line 453
    goto :L12
  :L22
  .line 454
    nop
  .line 458
    if-eqz p0, :L26
  :L23
  .line 460
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L24
  .line 462
    goto :L26
  :L25
  .line 461
    move-exception p0
  :L26
  .line 454
    return-object v4
  :L27
  .line 455
    move-exception v0
    goto :L29
  :L28
    move-exception p0
    move-object p0, v1
  :L29
  .line 456
    nop
  .line 458
    if-eqz p0, :L33
  :L30
  .line 460
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  :L31
  .line 462
    goto :L33
  :L32
  .line 461
    move-exception p0
  :L33
  .line 456
    return-object v1
  :L34
  .line 438
    return-object v1
.end method

.method private static readSongs()Ljava/util/List;
  .catchall { :L1 .. :L2 } :L19
  .catchall { :L7 .. :L14 } :L16
  .catchall { :L17 .. :L18 } :L16
  .catchall { :L20 .. :L21 } :L19
  .registers 11
  .line 221
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 222
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 224
    sget-object v2, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v2
  :L1
    sget v3, Lcom/innioasis/ipp/Albums;->songGen:I
    monitor-exit v2
  :L2
  .line 225
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 226
    invoke-static { }, Lcom/innioasis/ipp/Albums;->orderNow()Ljava/lang/Object;
    move-result-object v6
  .line 227
    const-string v7, "full read"
    invoke-static { v7 }, Lcom/innioasis/ipp/Lab;->who(Ljava/lang/String;)V
  .line 228
    const/4 v7, 0
    invoke-virtual { v0, v7 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
  .line 229
    invoke-static { }, Lcom/innioasis/ipp/Albums;->orderNow()Ljava/lang/Object;
    move-result-object v8
    if-eq v6, v8, :L3
    move-object v6, v1
  :L3
  .line 230
    const-string v8, "library read"
    invoke-static { v8, v4, v5 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 231
    const-string v8, "ipplab"
    new-instance v9, Ljava/lang/StringBuilder;
    invoke-direct { v9 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v10, "full read "
    invoke-virtual { v9, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    if-nez v0, :L4
    goto :L5
  :L4
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v7
  :L5
    invoke-virtual { v9, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v9, " rows "
    invoke-virtual { v7, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v9
    sub-long/2addr v9, v4
    invoke-virtual { v7, v9, v10 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " ms"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static { v8, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 232
    if-nez v0, :L6
    return-object v1
  :L6
  .line 233
    nop
  .line 234
    monitor-enter v2
  :L7
  .line 235
    sget v4, Lcom/innioasis/ipp/Albums;->songGen:I
    if-eq v3, v4, :L8
    monitor-exit v2
    return-object v0
  :L8
  .line 236
    sget-object v3, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v3, :L9
    monitor-exit v2
    return-object v3
  :L9
  .line 237
    sget-object v3, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
    if-eqz v3, :L10
    invoke-interface { v3, v0 }, Ljava/util/List;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L10
    sget-object v3, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
    goto :L11
  :L10
  .line 238
    move-object v3, v0
  :L11
    sput-object v1, Lcom/innioasis/ipp/Albums;->songPrev:Ljava/util/List;
  .line 239
    sput-object v1, Lcom/innioasis/ipp/Albums;->sortedPrev:Ljava/util/List;
  .line 242
    sget-object v4, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
    if-eq v3, v4, :L13
    sget-object v4, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
    if-eqz v4, :L12
    move-object v1, v3
  :L12
    sput-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  :L13
  .line 243
    sput-object v6, Lcom/innioasis/ipp/Albums;->songOrder:Ljava/lang/Object;
  .line 244
    sput-object v3, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 245
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v4
    sput-wide v4, Lcom/innioasis/ipp/Albums;->songCacheAt:J
  .line 246
    monitor-exit v2
  :L14
  .line 247
    if-ne v3, v0, :L15
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->share(Ljava/util/List;)V
  :L15
  .line 248
    return-object v3
  :L16
  .line 246
    move-exception v0
  :L17
    monitor-exit v2
  :L18
    throw v0
  :L19
  .line 224
    move-exception v0
  :L20
    monitor-exit v2
  :L21
    throw v0
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

.method public static restore(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 857
    if-eqz p0, :L1
    if-nez p1, :L0
    goto :L1
  :L0
  .line 858
    const-string v0, "ipp_open_album"
    invoke-virtual { p0, v0, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 859
    sput-object p2, Lcom/innioasis/ipp/Albums;->pendingFocus:Ljava/lang/String;
  .line 861
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Albums;->closeOnBack:Z
  .line 862
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnAlbum:Ljava/lang/String;
  .line 863
    sput-object p0, Lcom/innioasis/ipp/Albums;->returnFocus:Ljava/lang/String;
  .line 864
    return-void
  :L1
  .line 857
    return-void
.end method

.method public static restoreList(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 1072
    if-eqz p0, :L3
    if-nez p1, :L0
    goto :L3
  :L0
  .line 1073
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
  .line 1074
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
  .line 1075
    sget v1, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1076
    const/4 v2, -1
    sput v2, Lcom/innioasis/ipp/Albums;->listFirst:I
  .line 1077
    if-ltz v1, :L1
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result p1
    if-ge v1, p1, :L1
    sget p1, Lcom/innioasis/ipp/Albums;->listPos:I
    if-ne p1, v0, :L1
  .line 1079
    sget p1, Lcom/innioasis/ipp/Albums;->listTop:I
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/Head;->restore(Landroid/widget/ListView;II)V
    goto :L2
  :L1
  .line 1081
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->setSelection(I)V
  :L2
  .line 1083
    return-void
  :L3
  .line 1072
    return-void
.end method

.method static scanStarts()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 325
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 326
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Albums;->scanThread:Ljava/lang/Thread;
  .line 327
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    sput-object v1, Lcom/innioasis/ipp/Albums;->markList:Ljava/util/List;
  .line 328
    sget v1, Lcom/innioasis/ipp/Albums;->foreign:I
    sput v1, Lcom/innioasis/ipp/Albums;->markForeign:I
  .line 329
    monitor-exit v0
  .line 330
    return-void
  :L1
  .line 329
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method private static scopeEnabled()Z
  .registers 2
  .line 1214
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 1215
    if-nez v0, :L0
    const/4 v0, 0
    return v0
  :L0
  .line 1216
    const-string v1, "artist_scope"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static share(Ljava/util/List;)V
  .catchall { :L2 .. :L10 } :L11
  .registers 9
  .line 257
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 258
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
  .line 259
    nop
  .line 260
    const/4 v3, 0
    const/4 v4, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v3, v5, :L13
  .line 261
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 262
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-nez v6, :L1
    goto/16 :L12
  :L1
  .line 263
    check-cast v5, Lcom/innioasis/y1/database/Song;
  :L2
  .line 266
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
  .line 267
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
  .line 268
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
  .line 269
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
  .line 270
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
  .line 271
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
  .line 272
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
  .line 273
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
  .line 275
    goto :L12
  :L11
  .line 274
    move-exception v5
  :L12
  .line 260
    add-int/lit8 v3, v3, 1
    goto/16 :L0
  :L13
  .line 277
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
  .line 278
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
  .line 279
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 280
    const-string v0, "ippshare"
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 281
    return-void
.end method

.method static shared(Ljava/util/List;)Ljava/util/List;
  .registers 7
  .line 402
    sget-object v0, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
  .line 403
    if-eqz p0, :L9
    if-nez v0, :L0
    goto :L9
  :L0
  .line 404
    new-instance v1, Ljava/util/HashMap;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    mul-int/lit8 v2, v2, 2
    invoke-direct { v1, v2 }, Ljava/util/HashMap;-><init>(I)V
  .line 405
    const/4 v2, 0
    const/4 v3, 0
  :L1
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L3
  .line 406
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 407
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L2
    move-object v5, v4
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v1, v5, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 405
    add-int/lit8 v3, v3, 1
    goto :L1
  :L3
  .line 409
    new-instance v0, Ljava/util/ArrayList;
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    invoke-direct { v0, v3 }, Ljava/util/ArrayList;-><init>(I)V
  .line 410
    nop
  :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 411
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 412
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
  .line 413
    if-eqz v4, :L7
    move-object v3, v4
  :L7
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 410
    add-int/lit8 v2, v2, 1
    goto :L4
  :L8
  .line 415
    return-object v0
  :L9
  .line 403
    return-object p0
.end method

.method public static songListSort()I
  .registers 1
  .line 839
    sget v0, Lcom/innioasis/ipp/Albums;->songSort:I
    return v0
.end method

.method public static songMenu(Lcom/innioasis/music/util/SubMenuDialog;Landroid/app/Activity;Ljava/lang/String;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 6
  .line 900
    if-eqz p0, :L6
    if-nez p1, :L0
    goto/16 :L6
  :L0
  .line 901
    sput-object p0, Lcom/innioasis/ipp/Albums;->songDlg:Lcom/innioasis/music/util/SubMenuDialog;
  .line 902
    invoke-static { p2 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p2
  .line 903
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 904
    const v1, 2131820964
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 905
    const v1, 2131820963
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 906
    if-eqz p2, :L1
    const v1, 2131820962
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L2
  :L1
  .line 907
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->trackSortEnabled()Z
    move-result v1
    if-eqz v1, :L2
    const v1, 2131821024
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 908
    const v1, 2131820844
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 909
    const v1, 2131820584
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 910
    const v1, 2131820841
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 911
    const v1, 2131821047
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 913
    if-nez p2, :L3
    invoke-static { p3 }, Lcom/innioasis/ipp/Artists;->canOpen(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p3
    if-eqz p3, :L3
    const p3, 2131821105
    invoke-virtual { p1, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { v0, p3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 914
    if-eqz p2, :L4
    const p2, 2131821071
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L5
  :L4
  .line 915
    const p2, 2131821060
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 916
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 917
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 918
    return-void
  :L6
  .line 900
    return-void
.end method

.method public static songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .registers 4
  .line 1250
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->allSongsArtist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->artistSongs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L0
  .line 1251
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const/4 p0, 0
    return-object p0
  :L1
  .line 1252
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1253
    if-nez v0, :L2
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L2
  .line 1254
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->onlyScoped(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1256
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p1, v0, :L3
  .line 1257
    new-instance p1, Lcom/innioasis/ipp/Albums$SongCmp;
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-direct { p1, v0 }, Lcom/innioasis/ipp/Albums$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1258
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->trackSortEnabled()Z
    move-result p1
    if-eqz p1, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    goto :L4
  :L3
  .line 1260
    new-instance v0, Lcom/innioasis/ipp/Albums$SongCmp;
    invoke-direct { v0, p1 }, Lcom/innioasis/ipp/Albums$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { p0, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1261
    nop
  :L4
  .line 1263
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->byDisc(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method private static songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .catchall { :L0 .. :L3 } :L11
  .catchall { :L7 .. :L10 } :L9
  .catchall { :L12 .. :L13 } :L11
  .registers 11
  .line 469
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 470
    sget-object v1, Lcom/innioasis/ipp/Albums;->songCache:Ljava/util/List;
    if-eqz v1, :L1
    sget-object v2, Lcom/innioasis/ipp/Albums;->songOrder:Ljava/lang/Object;
    if-ne p1, v2, :L1
    monitor-exit v0
    return-object v1
  :L1
  .line 471
    sget-object v1, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
    if-eqz v1, :L2
    sget-object v2, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
    if-ne p1, v2, :L2
    monitor-exit v0
    return-object v1
  :L2
  .line 472
    sget v1, Lcom/innioasis/ipp/Albums;->songGen:I
  .line 473
    monitor-exit v0
  :L3
  .line 474
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 475
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->ordered(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v4
  .line 476
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
  .line 477
    if-nez v4, :L6
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsList(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->shared(Ljava/util/List;)Ljava/util/List;
    move-result-object v4
  :L6
  .line 478
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
  .line 479
    monitor-enter v0
  .line 480
    if-eqz v4, :L8
  :L7
    sget p0, Lcom/innioasis/ipp/Albums;->songGen:I
    if-ne v1, p0, :L8
  .line 481
    sput-object v4, Lcom/innioasis/ipp/Albums;->sorted:Ljava/util/List;
  .line 482
    sput-object p1, Lcom/innioasis/ipp/Albums;->sortedType:Ljava/lang/Object;
  :L8
  .line 484
    monitor-exit v0
  .line 485
    return-object v4
  :L9
  .line 484
    move-exception p0
    monitor-exit v0
  :L10
    throw p0
  :L11
  .line 473
    move-exception p0
  :L12
    monitor-exit v0
  :L13
    throw p0
.end method

.method public static songsList(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 389
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Albums;->songsIn(Lcom/innioasis/y1/database/Y1Repository;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object p0
  :L0
  .line 391
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p1
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->setSortAllSong(I)V
  :L1
  .line 393
    goto :L3
  :L2
  .line 392
    move-exception p1
  :L3
  .line 394
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
  .line 1154
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1155
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 1156
    if-eqz v1, :L6
    if-nez p0, :L0
    goto :L6
  :L0
  .line 1157
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1158
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
  .line 1159
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v1, v2, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    goto :L5
  :L1
  .line 1161
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
  .line 1162
    if-eqz p0, :L5
  .line 1163
    check-cast p0, Ljava/util/LinkedHashSet;
    invoke-virtual { p0 }, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L4
  .line 1164
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
  .line 1167
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1168
    return-object v0
  :L6
  .line 1156
    return-object v0
.end method

.method public static songsSync(Lcom/innioasis/music/data/Album;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
  .registers 7
  .line 1289
    const/4 p1, 0
    if-nez p0, :L0
    return-object p1
  :L0
  .line 1291
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Genres;->noteList(Lcom/innioasis/music/data/Album;Lcom/innioasis/music/data/Genre;)V
  .line 1293
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L5
  .line 1294
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object p1
  .line 1295
    if-nez p1, :L1
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L1
  .line 1296
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  .line 1297
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1298
    nop
  :L2
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    if-ge v1, v0, :L4
  .line 1299
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1300
    if-eqz v0, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L3
    invoke-virtual { p2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1298
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 1302
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p2, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1303
    return-object p2
  :L5
  .line 1306
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L14
  .line 1307
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1308
    if-nez v0, :L6
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L6
  .line 1309
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  .line 1310
    if-nez p2, :L7
    goto :L8
  :L7
    invoke-virtual { p2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
  :L8
  .line 1311
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1312
    nop
  :L9
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L13
  .line 1313
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1314
    if-eqz v2, :L12
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p0 }, Lcom/innioasis/ipp/Artists;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L10
    goto :L12
  :L10
  .line 1315
    if-eqz p1, :L11
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L11
    goto :L12
  :L11
  .line 1316
    invoke-virtual { p2, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L12
  .line 1312
    add-int/lit8 v1, v1, 1
    goto :L9
  :L13
  .line 1318
    sget-object p0, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p2, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1319
    return-object p2
  :L14
  .line 1321
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L15
    return-object p1
  :L15
  .line 1322
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1323
    if-nez v0, :L16
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L16
  .line 1324
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1325
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->folderOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 1326
    if-nez p2, :L17
    goto :L18
  :L17
    invoke-virtual { p2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p1
  :L18
  .line 1327
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Albums;->matchAlbum(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object p0
  .line 1328
    if-eqz p1, :L22
  .line 1329
    new-instance p2, Ljava/util/ArrayList;
    invoke-direct { p2 }, Ljava/util/ArrayList;-><init>()V
  .line 1330
    nop
  :L19
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    if-ge v1, v0, :L21
  .line 1331
    invoke-virtual { p0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1332
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p1 }, Lcom/innioasis/ipp/GenreSplit;->has(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L20
    invoke-virtual { p2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L20
  .line 1330
    add-int/lit8 v1, v1, 1
    goto :L19
  :L21
  .line 1334
    move-object p0, p2
  :L22
  .line 1337
    sget-object p1, Lcom/innioasis/ipp/Albums;->PATH_CMP:Ljava/util/Comparator;
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1338
    return-object p0
.end method

.method public static sortFor(Ljava/lang/String;)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
  .registers 3
  .line 882
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAlbumSong()I
    move-result v0
  .line 883
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L2
  .line 884
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 885
    if-nez p0, :L0
    goto :L1
  :L0
    const-string v1, "all_sort"
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
  :L1
  .line 886
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object p0
    return-object p0
  :L2
  .line 889
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p0
    if-ne v0, p0, :L3
  .line 890
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    return-object p0
  :L3
  .line 892
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object p0
    return-object p0
.end method

.method private static sortValue(Z)I
  .registers 3
  .line 812
    if-nez p0, :L0
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAlbum()I
    move-result p0
    return p0
  :L0
  .line 813
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  .line 814
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v0
  .line 815
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
  .line 1104
    if-nez p0, :L0
    return-object p0
  :L0
  .line 1105
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1106
    const-string v1, "split allSongs"
    invoke-static { v1 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1107
    if-nez v0, :L1
    return-object p0
  :L1
  .line 1108
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 1109
    const-string v1, "split foldersOf"
    invoke-static { v1 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1110
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1111
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L11
  .line 1112
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 1113
    if-nez v4, :L3
    const-string v5, ""
    goto :L4
  :L3
    move-object v5, v4
  :L4
    invoke-virtual { v0, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
  .line 1114
    if-nez v5, :L5
    const/4 v5, 0
    goto :L6
  :L5
    check-cast v5, Ljava/util/LinkedHashSet;
  :L6
  .line 1115
    if-eqz v5, :L9
    invoke-virtual { v5 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v6
    if-eqz v6, :L7
    goto :L9
  :L7
  .line 1116
    new-instance v6, Ljava/util/ArrayList;
    invoke-direct { v6, v5 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1117
    sget-object v5, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v6, v5 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1118
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
  .line 1115
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L10
  .line 1111
    add-int/lit8 v3, v3, 1
    goto :L2
  :L11
  .line 1120
    const-string p0, "split loop"
    invoke-static { p0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1121
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->byYear(Ljava/util/ArrayList;)Ljava/util/List;
    move-result-object p0
  .line 1122
    const-string v0, "split byYear"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 1123
    return-object p0
.end method

.method public static splitAlbums(Ljava/util/List;)Ljava/util/List;
  .registers 14
  .line 1128
    if-nez p0, :L0
    return-object p0
  :L0
  .line 1129
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1130
    if-nez v0, :L1
    return-object p0
  :L1
  .line 1131
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->foldersOf(Ljava/util/List;)Ljava/util/LinkedHashMap;
    move-result-object v0
  .line 1132
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1133
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L12
  .line 1134
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/music/data/Album;
  .line 1135
    if-nez v4, :L3
    goto :L11
  :L3
  .line 1136
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
  .line 1137
    invoke-virtual { v0, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
  .line 1138
    const/4 v8, 0
    if-nez v7, :L6
    move-object v7, v8
    goto :L7
  :L6
    check-cast v7, Ljava/util/LinkedHashSet;
  :L7
  .line 1139
    if-eqz v7, :L10
    invoke-virtual { v7 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v9
    if-eqz v9, :L8
    goto :L10
  :L8
  .line 1140
    new-instance v9, Ljava/util/ArrayList;
    invoke-direct { v9, v7 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1141
    sget-object v7, Lcom/innioasis/ipp/Albums;->STR_CMP:Ljava/util/Comparator;
    invoke-static { v9, v7 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 1142
    const/4 v7, 0
  :L9
    invoke-virtual { v9 }, Ljava/util/ArrayList;->size()I
    move-result v10
    if-ge v7, v10, :L11
  .line 1143
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
  .line 1142
    add-int/lit8 v7, v7, 1
    goto :L9
  :L10
  .line 1139
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L11
  .line 1133
    add-int/lit8 v3, v3, 1
    goto :L2
  :L12
  .line 1146
    return-object v1
.end method

.method public static tintAllSongsRow(Landroid/widget/TextView;)V
  .registers 3
  .line 769
    sget-object v0, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 770
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Albums;->pendingIcon:Landroid/widget/ImageView;
  .line 771
    if-eqz v0, :L1
    if-nez p0, :L0
    goto :L1
  :L0
  .line 772
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 773
    return-void
  :L1
  .line 771
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
  .line 204
    invoke-static { }, Lcom/innioasis/ipp/Albums;->worker()Landroid/os/Handler;
    move-result-object v0
  .line 205
    sget-object v1, Lcom/innioasis/ipp/Albums;->WARM:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 206
    invoke-virtual { v0, v1, p0, p1 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 208
    goto :L3
  :L2
  .line 207
    move-exception p0
  :L3
  .line 209
    return-void
.end method

.method private static worker()Landroid/os/Handler;
  .catchall { :L0 .. :L3 } :L2
  .registers 3
  .line 190
    sget-object v0, Lcom/innioasis/ipp/Albums;->SONGS:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 191
    sget-object v1, Lcom/innioasis/ipp/Albums;->warmer:Landroid/os/Handler;
    if-nez v1, :L1
  .line 193
    new-instance v1, Landroid/os/HandlerThread;
    const-string v2, "ipp-library"
    invoke-direct { v1, v2 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 194
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->start()V
  .line 195
    new-instance v2, Landroid/os/Handler;
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v2, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v2, Lcom/innioasis/ipp/Albums;->warmer:Landroid/os/Handler;
  :L1
  .line 197
    sget-object v1, Lcom/innioasis/ipp/Albums;->warmer:Landroid/os/Handler;
    monitor-exit v0
    return-object v1
  :L2
  .line 198
    move-exception v1
    monitor-exit v0
  :L3
    throw v1
.end method

.class public final Lcom/innioasis/ipp/M3u;
.super Ljava/lang/Object;
.source "M3u.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/M3u$Job;,
    Lcom/innioasis/ipp/M3u$Export;,
    Lcom/innioasis/ipp/M3u$ByName;,
    Lcom/innioasis/ipp/M3u$Plan;,
    Lcom/innioasis/ipp/M3u$Resolver;,
    Lcom/innioasis/ipp/M3u$Tick;,
    Lcom/innioasis/ipp/M3u$Run;,
    Lcom/innioasis/ipp/M3u$AskGo;,
    Lcom/innioasis/ipp/M3u$Ask;,
    Lcom/innioasis/ipp/M3u$Nothing;,
    Lcom/innioasis/ipp/M3u$ExportGo;
  }
.end annotation

.field private final static HEAD:Ljava/lang/String; = "#EXTM3U"

.field final static MARK:Ljava/lang/String; = "#BETTERY:FAVORITES"

.field public final static MERGE:I = 2

.field public final static NEW:I = 0

.field private final static NL:Ljava/lang/String; = "\r\n"

.field public final static REPLACE:I = 1

.field private final static ROOTS:[Ljava/lang/String;

.field private final static SQL_LAST:Ljava/lang/String; = "select max(date) from songCatPlaylist where playlistId = ?"

.field private final static SQL_REDATE:Ljava/lang/String; = "update songCatPlaylist set date = ? where playlistId = ? and songId = ?"

.field private final static UTF8:Ljava/nio/charset/Charset;

.method static constructor <clinit>()V
  .registers 3
  .line 61
    const-string v0, "UTF-8"
    invoke-static { v0 }, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/M3u;->UTF8:Ljava/nio/charset/Charset;
  .line 817
    const/4 v0, 4
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0
    const-string v2, "/storage/sdcard0"
    aput-object v2, v0, v1
    const/4 v1, 1
    const-string v2, "/storage/emulated/0"
    aput-object v2, v0, v1
    const/4 v1, 2
    const-string v2, "/mnt/sdcard"
    aput-object v2, v0, v1
    const/4 v1, 3
    const-string v2, "/sdcard"
    aput-object v2, v0, v1
    sput-object v0, Lcom/innioasis/ipp/M3u;->ROOTS:[Ljava/lang/String;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 54
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Lcom/innioasis/y1/database/Playlist;)Lcom/innioasis/ipp/M3u$Job;
  .registers 2
  .line 52
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/M3u;->build(Landroid/content/Context;Lcom/innioasis/y1/database/Playlist;)Lcom/innioasis/ipp/M3u$Job;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$100(Ljava/lang/String;Ljava/util/HashSet;)Ljava/lang/String;
  .registers 2
  .line 52
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/M3u;->freeFile(Ljava/lang/String;Ljava/util/HashSet;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$200(Ljava/lang/String;)Z
  .registers 1
  .line 52
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->exists(Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$300(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 52
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->existing(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$400(Ljava/io/File;Ljava/lang/String;)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 2
  .line 52
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/M3u;->writeFile(Ljava/io/File;Ljava/lang/String;)V
    return-void
.end method

.method static synthetic access$500()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 52
    invoke-static { }, Lcom/innioasis/ipp/M3u;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$600(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 52
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->last(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$700(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 52
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->parent(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$800(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 52
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->clean(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static apply(Landroid/content/Context;Lcom/innioasis/ipp/M3u$Plan;Lcom/innioasis/ipp/M3u$Resolver;Lcom/innioasis/ipp/M3u$Tick;)V
  .catchall { :L33 .. :L34 } :L35
  .catchall { :L37 .. :L38 } :L39
  .registers 21
  .line 642
    move-object/from16 v1, p1
    move-object/from16 v0, p2
    move-object/from16 v2, p3
    invoke-static { }, Lcom/innioasis/ipp/M3u;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v3
  .line 643
    iget-object v4, v1, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v4
  .line 644
    new-array v5, v4, [Lcom/innioasis/y1/database/Song;
  .line 645
    new-instance v6, Ljava/util/HashMap;
    invoke-direct { v6 }, Ljava/util/HashMap;-><init>()V
  .line 646
    const/4 v7, 0
    const/4 v8, 0
  :L0
    if-ge v8, v4, :L2
  .line 647
    iget-object v9, v1, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v9, v8 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Ljava/lang/String;
    invoke-virtual { v0, v9 }, Lcom/innioasis/ipp/M3u$Resolver;->byPath(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v9
    aput-object v9, v5, v8
  .line 648
    invoke-static { v6, v9 }, Lcom/innioasis/ipp/M3u;->vote(Ljava/util/HashMap;Lcom/innioasis/y1/database/Song;)V
  .line 649
    if-eqz v2, :L1
    add-int/lit8 v9, v8, 1
    invoke-virtual { v2, v1, v9 }, Lcom/innioasis/ipp/M3u$Tick;->tick(Lcom/innioasis/ipp/M3u$Plan;I)V
  :L1
  .line 646
    add-int/lit8 v8, v8, 1
    goto :L0
  :L2
  .line 655
    const/4 v2, 0
  :L3
    const/4 v8, 2
    const/4 v9, 1
    if-ge v2, v8, :L10
  .line 656
    const/4 v8, 0
  :L4
    if-ge v8, v4, :L9
  .line 657
    aget-object v10, v5, v8
    if-eqz v10, :L5
    goto :L8
  :L5
  .line 658
    iget-object v10, v1, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v10, v8 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Ljava/lang/String;
    if-ne v2, v9, :L6
    const/4 v11, 1
    goto :L7
  :L6
    const/4 v11, 0
  :L7
    invoke-virtual { v0, v10, v6, v11 }, Lcom/innioasis/ipp/M3u$Resolver;->byName(Ljava/lang/String;Ljava/util/HashMap;Z)Lcom/innioasis/y1/database/Song;
    move-result-object v10
    aput-object v10, v5, v8
  .line 659
    invoke-static { v6, v10 }, Lcom/innioasis/ipp/M3u;->vote(Ljava/util/HashMap;Lcom/innioasis/y1/database/Song;)V
  :L8
  .line 656
    add-int/lit8 v8, v8, 1
    goto :L4
  :L9
  .line 655
    add-int/lit8 v2, v2, 1
    goto :L3
  :L10
  .line 662
    const/4 v2, 0
  :L11
    if-ge v2, v4, :L13
  .line 663
    aget-object v10, v5, v2
    if-nez v10, :L12
    iget-object v10, v1, Lcom/innioasis/ipp/M3u$Plan;->infos:Ljava/util/ArrayList;
    invoke-virtual { v10, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Ljava/lang/String;
    invoke-virtual { v0, v10, v6 }, Lcom/innioasis/ipp/M3u$Resolver;->byInfo(Ljava/lang/String;Ljava/util/HashMap;)Lcom/innioasis/y1/database/Song;
    move-result-object v10
    aput-object v10, v5, v2
  :L12
  .line 662
    add-int/lit8 v2, v2, 1
    goto :L11
  :L13
  .line 665
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 666
    new-instance v2, Ljava/util/HashSet;
    invoke-direct { v2 }, Ljava/util/HashSet;-><init>()V
  .line 667
    const/4 v6, 0
  :L14
    if-ge v6, v4, :L18
  .line 668
    iget-object v10, v1, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v10, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Ljava/lang/String;
  .line 669
    aget-object v11, v5, v6
    if-nez v11, :L15
  .line 670
    iget-object v11, v1, Lcom/innioasis/ipp/M3u$Plan;->missing:Ljava/util/ArrayList;
    invoke-static { v10 }, Lcom/innioasis/ipp/M3u;->shown(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v11, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L17
  :L15
  .line 671
    invoke-virtual { v11 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v2, v11 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    move-result v11
    if-nez v11, :L16
  .line 672
    iget-object v11, v1, Lcom/innioasis/ipp/M3u$Plan;->dups:Ljava/util/ArrayList;
    invoke-static { v10 }, Lcom/innioasis/ipp/M3u;->shown(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v11, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L17
  :L16
  .line 674
    aget-object v10, v5, v6
    invoke-virtual { v0, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L17
  .line 667
    add-int/lit8 v6, v6, 1
    goto :L14
  :L18
  .line 677
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/M3u$Plan;->found:I
  .line 680
    iget-boolean v2, v1, Lcom/innioasis/ipp/M3u$Plan;->fav:Z
    if-eqz v2, :L19
  .line 681
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Fav;->ensure(Landroid/content/Context;)V
  .line 682
    const-string v2, "1e5f0a00-0000-4000-8000-000000000001"
    invoke-static { v2 }, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;
    move-result-object v2
    invoke-virtual { v3, v2 }, Lcom/innioasis/y1/database/Y1Repository;->getPlaylistById(Ljava/util/UUID;)Lcom/innioasis/y1/database/Playlist;
    move-result-object v2
    goto :L22
  :L19
  .line 683
    iget v2, v1, Lcom/innioasis/ipp/M3u$Plan;->mode:I
    if-eqz v2, :L21
    iget-object v2, v1, Lcom/innioasis/ipp/M3u$Plan;->target:Lcom/innioasis/y1/database/Playlist;
    if-nez v2, :L20
    goto :L21
  :L20
  .line 688
    iget-object v2, v1, Lcom/innioasis/ipp/M3u$Plan;->target:Lcom/innioasis/y1/database/Playlist;
    goto :L22
  :L21
  .line 684
    new-instance v2, Lcom/innioasis/y1/database/Playlist;
    invoke-static { }, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
    move-result-object v11
    iget-object v12, v1, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    iget-object v4, v1, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    invoke-virtual { v4 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v13
  .line 685
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v14
    const/16 v16, 0
    move-object v10, v2
    invoke-direct/range { v10 .. v16 }, Lcom/innioasis/y1/database/Playlist;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;JZ)V
  .line 686
    invoke-virtual { v3, v2 }, Lcom/innioasis/y1/database/Y1Repository;->addPlaylist(Lcom/innioasis/y1/database/Playlist;)V
  :L22
  .line 690
    if-nez v2, :L23
    return-void
  :L23
  .line 691
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v4
  .line 693
    nop
  .line 694
    iget v5, v1, Lcom/innioasis/ipp/M3u$Plan;->mode:I
    if-ne v5, v9, :L25
  .line 695
    invoke-virtual { v3, v2 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByPlaylistSync(Lcom/innioasis/y1/database/Playlist;)Ljava/util/List;
    move-result-object v2
  .line 696
    nop
  :L24
    if-eqz v2, :L30
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v7, v5, :L30
  .line 697
    invoke-interface { v2, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v3, v5, v4 }, Lcom/innioasis/y1/database/Y1Repository;->removeFromPlayList(Ljava/lang/String;Ljava/util/UUID;)V
  .line 696
    add-int/lit8 v7, v7, 1
    goto :L24
  :L25
  .line 699
    iget v5, v1, Lcom/innioasis/ipp/M3u$Plan;->mode:I
    if-ne v5, v8, :L30
  .line 700
    new-instance v5, Ljava/util/HashSet;
    invoke-direct { v5 }, Ljava/util/HashSet;-><init>()V
  .line 701
    invoke-virtual { v3, v2 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByPlaylistSync(Lcom/innioasis/y1/database/Playlist;)Ljava/util/List;
    move-result-object v2
  .line 702
    const/4 v6, 0
  :L26
    if-eqz v2, :L27
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v9
    if-ge v6, v9, :L27
  .line 703
    invoke-interface { v2, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v9 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v5, v9 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 702
    add-int/lit8 v6, v6, 1
    goto :L26
  :L27
  .line 705
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 706
    nop
  :L28
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v7, v6, :L31
  .line 707
    invoke-virtual { v0, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 708
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v5, v9 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v9
    if-nez v9, :L29
    invoke-virtual { v2, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L29
  .line 706
    add-int/lit8 v7, v7, 1
    goto :L28
  :L30
  .line 699
    nop
  .line 711
    move-object v2, v0
  :L31
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L32
    return-void
  :L32
  .line 713
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v5
  :L33
  .line 715
    iget v0, v1, Lcom/innioasis/ipp/M3u$Plan;->mode:I
    if-ne v0, v8, :L34
    invoke-static { v4 }, Lcom/innioasis/ipp/M3u;->last(Ljava/util/UUID;)J
    move-result-wide v7
    const-wide/16 v9, 1
    add-long/2addr v7, v9
    invoke-static { v5, v6, v7, v8 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide v5
  :L34
  .line 718
    goto :L36
  :L35
  .line 716
    move-exception v0
  :L36
  .line 719
    invoke-virtual { v3, v2, v4 }, Lcom/innioasis/y1/database/Y1Repository;->addToPlayList(Ljava/util/List;Ljava/util/UUID;)V
  :L37
  .line 721
    invoke-static { v4, v2, v5, v6 }, Lcom/innioasis/ipp/M3u;->redate(Ljava/util/UUID;Ljava/util/List;J)V
  :L38
  .line 724
    goto :L40
  :L39
  .line 722
    move-exception v0
    move-object v2, v0
  .line 723
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "m3u redate "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-object v1, v1, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ": "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L40
  .line 725
    return-void
.end method

.method private static ascii(Ljava/lang/String;)Z
  .registers 5
  .line 303
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    if-ge v1, v2, :L2
  .line 304
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v2
    const/16 v3, 126
    if-le v2, v3, :L1
    return v0
  :L1
  .line 303
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 306
    const/4 p0, 1
    return p0
.end method

.method private static build(Landroid/content/Context;Lcom/innioasis/y1/database/Playlist;)Lcom/innioasis/ipp/M3u$Job;
  .catchall { :L0 .. :L9 } :L10
  .registers 9
  .line 246
    const-string p0, "\r\n"
  :L0
    invoke-static { }, Lcom/innioasis/ipp/M3u;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Companion:Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;
    sget-object v2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 248
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortPlayListSong()I
    move-result v2
  .line 247
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType$Companion;->fromType(I)Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    move-result-object v1
  .line 246
    invoke-virtual { v0, p1, v1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByPlaylistSortByType(Lcom/innioasis/y1/database/Playlist;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v0
  .line 249
    new-instance v1, Ljava/lang/StringBuilder;
    const-string v2, "#EXTM3U"
    invoke-direct { v1, v2 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 250
    invoke-static { p1 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L1
    const-string v2, "#BETTERY:FAVORITES"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L1
  .line 251
    nop
  .line 252
    const/4 v2, 0
    if-eqz v0, :L6
  .line 253
    const/4 v3, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v2, v4, :L5
  .line 254
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 255
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L3
    goto :L4
  :L3
  .line 256
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 257
    const-string v5, "#EXTINF:-1,"
    invoke-virtual { v1, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-static { v4 }, Lcom/innioasis/ipp/M3u;->extinf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 258
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/M3u;->relative(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 259
    add-int/lit8 v3, v3, 1
  :L4
  .line 253
    add-int/lit8 v2, v2, 1
    goto :L2
  :L5
    move v2, v3
  :L6
  .line 262
    new-instance p0, Lcom/innioasis/ipp/M3u$Job;
    invoke-direct { p0 }, Lcom/innioasis/ipp/M3u$Job;-><init>()V
  .line 263
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->fileName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
  .line 264
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/M3u$Job;->text:Ljava/lang/String;
  .line 265
    iput v2, p0, Lcom/innioasis/ipp/M3u$Job;->songs:I
  .line 266
    iget-object p1, p0, Lcom/innioasis/ipp/M3u$Job;->base:Ljava/lang/String;
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->ascii(Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L7
    iget-object p1, p0, Lcom/innioasis/ipp/M3u$Job;->text:Ljava/lang/String;
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->ascii(Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L7
    const-string p1, ".m3u"
    goto :L8
  :L7
    const-string p1, ".m3u8"
  :L8
    iput-object p1, p0, Lcom/innioasis/ipp/M3u$Job;->ext:Ljava/lang/String;
  :L9
  .line 267
    return-object p0
  :L10
  .line 268
    move-exception p0
  .line 269
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v0, "m3u export: "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 270
    const/4 p0, 0
    return-object p0
.end method

.method private static bytes(Ljava/io/File;)[B
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 444
    new-instance v0, Ljava/io/FileInputStream;
    invoke-direct { v0, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  :L0
  .line 446
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v1
    long-to-int p0, v1
    new-array v1, p0, [B
  .line 447
    const/4 v2, 0
  :L1
  .line 448
    if-ge v2, p0, :L3
  .line 449
    sub-int v3, p0, v2
    invoke-virtual { v0, v1, v2, v3 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v3
  .line 450
    if-gez v3, :L2
    goto :L3
  :L2
  .line 451
    add-int/2addr v2, v3
  .line 452
    goto :L1
  :L3
  .line 453
    if-ne v2, p0, :L4
    goto :L5
  :L4
    invoke-static { v1, v2 }, Ljava/util/Arrays;->copyOf([BI)[B
    move-result-object v1
  :L5
  .line 455
    invoke-virtual { v0 }, Ljava/io/FileInputStream;->close()V
  .line 453
    return-object v1
  :L6
  .line 455
    move-exception p0
    invoke-virtual { v0 }, Ljava/io/FileInputStream;->close()V
  .line 456
    goto :L8
  :L7
    throw p0
  :L8
    goto :L7
.end method

.method static candidates(Ljava/lang/String;)Ljava/util/List;
  .registers 8
  .line 828
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 829
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 830
    const/4 v2, 1
    const/4 v3, 0
    const-string v4, "file:"
    const/4 v5, 0
    const/4 v6, 5
    move-object v1, p0
    invoke-virtual/range { v1 .. v6 }, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z
    move-result v1
  .line 831
    if-eqz v1, :L1
  .line 832
    const/4 v2, 5
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  :L0
  .line 833
    const-string v2, "//"
    invoke-virtual { p0, v2 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L1
    const/4 v2, 1
    invoke-virtual { p0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    goto :L0
  :L1
  .line 835
    if-nez v1, :L2
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/M3u;->shapes(Ljava/lang/String;Ljava/util/List;)V
  :L2
  .line 836
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->pct(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 837
    if-nez v1, :L3
    invoke-virtual { v2, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L4
  :L3
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/M3u;->shapes(Ljava/lang/String;Ljava/util/List;)V
  :L4
  .line 838
    return-object v0
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 298
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 299
    const/16 v0, 13
    const/16 v1, 32
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p0
    const/16 v0, 10
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static dir()Ljava/io/File;
  .registers 3
  .line 69
    new-instance v0, Ljava/io/File;
    const-string v1, "/storage/sdcard0"
    const-string v2, "Playlists"
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    return-object v0
.end method

.method private static existing(Ljava/lang/String;)Ljava/lang/String;
  .registers 5
  .line 328
    invoke-static { }, Lcom/innioasis/ipp/M3u;->dir()Ljava/io/File;
    move-result-object v0
  .line 329
    new-instance v1, Ljava/io/File;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ".m3u8"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L0
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 330
    new-instance v1, Ljava/io/File;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ".m3u"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L1
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 331
    const/4 p0, 0
    return-object p0
.end method

.method private static exists(Ljava/lang/String;)Z
  .registers 1
  .line 323
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->existing(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static extinf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 3
  .line 276
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/M3u;->clean(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 277
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/M3u;->last(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/M3u;->stem(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L0
  .line 278
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->clean(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 279
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    goto :L2
  :L1
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " - "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  :L2
    return-object v0
.end method

.method private static fileName(Ljava/lang/String;)Ljava/lang/String;
  .registers 6
  .line 311
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 312
    if-nez p0, :L0
    const-string p0, ""
  :L0
  .line 313
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v3
    if-ge v2, v3, :L4
  .line 314
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v3
  .line 315
    const/16 v4, 32
    if-lt v3, v4, :L2
    const-string v4, "\\/:*?\"<>|"
    invoke-virtual { v4, v3 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
    if-ltz v4, :L3
  :L2
    const/16 v3, 95
  :L3
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 313
    add-int/lit8 v2, v2, 1
    goto :L1
  :L4
  .line 317
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  :L5
  .line 318
    const-string v0, "."
    invoke-virtual { p0, v0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L6
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    add-int/lit8 v0, v0, -1
    invoke-virtual { p0, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    goto :L5
  :L6
  .line 319
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L7
    const-string p0, "Playlist"
  :L7
    return-object p0
.end method

.method private static freeFile(Ljava/lang/String;Ljava/util/HashSet;)Ljava/lang/String;
  .registers 5
  .line 335
    const/4 v0, 2
  :L0
  .line 336
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " ("
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, ")"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 337
    invoke-static { v1 }, Lcom/innioasis/ipp/M3u;->exists(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L1
    invoke-virtual { v1 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L1
    return-object v1
  :L1
  .line 335
    add-int/lit8 v0, v0, 1
    goto :L0
.end method

.method private static hex(C)I
  .registers 3
  .line 810
    const/16 v0, 48
    if-lt p0, v0, :L0
    const/16 v1, 57
    if-gt p0, v1, :L0
    sub-int/2addr p0, v0
    return p0
  :L0
  .line 811
    const/16 v0, 97
    if-lt p0, v0, :L1
    const/16 v1, 102
    if-gt p0, v1, :L1
    sub-int/2addr p0, v0
    add-int/lit8 p0, p0, 10
    return p0
  :L1
  .line 812
    const/16 v0, 65
    if-lt p0, v0, :L2
    const/16 v1, 70
    if-gt p0, v1, :L2
    sub-int/2addr p0, v0
    add-int/lit8 p0, p0, 10
    return p0
  :L2
  .line 813
    const/4 p0, -1
    return p0
.end method

.method private static last(Ljava/util/UUID;)J
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L0 .. :L1 } :L4
  .registers 4
  .line 728
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v0
    const/4 v1, 1
    new-array v1, v1, [Ljava/lang/Object;
    invoke-static { p0 }, Landroidx/room/util/UUIDUtil;->convertUUIDToByte(Ljava/util/UUID;)[B
    move-result-object p0
    const/4 v2, 0
    aput-object p0, v1, v2
    const-string p0, "select max(date) from songCatPlaylist where playlistId = ?"
    invoke-virtual { v0, p0, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object p0
  :L0
  .line 730
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v0
    if-eqz v0, :L2
    invoke-interface { p0, v2 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v0
    if-nez v0, :L2
    invoke-interface { p0, v2 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v0
  :L1
    goto :L3
  :L2
    const-wide/16 v0, 0
  :L3
  .line 732
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 730
    return-wide v0
  :L4
  .line 732
    move-exception v0
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 733
    throw v0
.end method

.method private static last(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 771
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 772
    const/16 v0, 47
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 773
    if-ltz v0, :L1
    add-int/lit8 v0, v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method public static menu(Ljava/util/List;Landroid/content/Context;)V
  .registers 3
  .line 78
    const v0, 2131821141
    invoke-virtual { p1, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-interface { p0, p1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 79
    return-void
.end method

.method public static menuPick(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)Z
  .catchall { :L1 .. :L8 } :L9
  .registers 9
  .line 86
    const/4 v0, 0
    if-eqz p0, :L11
    if-eqz p2, :L11
    const v1, 2131821141
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p2, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :L0
    goto :L11
  :L0
  .line 88
    const/4 p2, 1
  :L1
    instance-of v1, p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez v1, :L2
    return p2
  :L2
  .line 89
    check-cast p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 90
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 91
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v2
  .line 92
    if-eqz v2, :L6
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-nez v3, :L6
  .line 93
    const/4 v3, 0
  :L3
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L5
  .line 94
    invoke-interface { v2, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    invoke-virtual { p1, v4 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v4
  .line 95
    instance-of v5, v4, Lcom/innioasis/y1/database/Playlist;
    if-eqz v5, :L4
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 93
    add-int/lit8 v3, v3, 1
    goto :L3
  :L5
  .line 97
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 98
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
    goto :L7
  :L6
  .line 100
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p1
  .line 101
    instance-of v2, p1, Lcom/innioasis/y1/database/Playlist;
    if-eqz v2, :L7
    invoke-virtual { v1, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 103
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p1
    if-nez p1, :L8
    new-instance p1, Lcom/innioasis/ipp/M3u$Export;
    invoke-direct { p1, p0, v1 }, Lcom/innioasis/ipp/M3u$Export;-><init>(Landroid/app/Activity;Ljava/util/List;)V
    invoke-virtual { p1 }, Lcom/innioasis/ipp/M3u$Export;->start()V
  :L8
  .line 106
    goto :L10
  :L9
  .line 104
    move-exception p1
  .line 105
    const p1, 2131821155
    invoke-static { p0, p1, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L10
  .line 107
    return p2
  :L11
  .line 86
    return v0
.end method

.method private static norm(Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 869
    const-string v0, "/"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 870
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 871
    const/4 v2, 0
    const/4 v3, 0
  :L0
    array-length v4, p0
    if-ge v3, v4, :L4
  .line 872
    aget-object v4, p0, v3
  .line 873
    invoke-virtual { v4 }, Ljava/lang/String;->length()I
    move-result v5
    if-eqz v5, :L3
    const-string v5, "."
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L1
    goto :L3
  :L1
  .line 874
    const-string v5, ".."
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L2
  .line 875
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v4
    add-int/lit8 v4, v4, -1
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    goto :L3
  :L2
  .line 878
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 871
    add-int/lit8 v3, v3, 1
    goto :L0
  :L4
  .line 880
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 881
    nop
  :L5
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L6
    const/16 v3, 47
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    add-int/lit8 v2, v2, 1
    goto :L5
  :L6
  .line 882
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->length()I
    move-result v1
    if-nez v1, :L7
    goto :L8
  :L7
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  :L8
    return-object v0
.end method

.method private static parent(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 760
    const/16 v0, 47
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 761
    if-lez v0, :L0
    const/4 v1, 0
    invoke-virtual { p0, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
    goto :L1
  :L0
    const-string p0, ""
  :L1
    return-object p0
.end method

.method static pct(Ljava/lang/String;)Ljava/lang/String;
  .registers 10
  .line 787
    if-eqz p0, :L6
    const/16 v0, 37
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
    if-gez v1, :L0
    goto/16 :L6
  :L0
  .line 788
    new-instance v1, Ljava/io/ByteArrayOutputStream;
    invoke-direct { v1 }, Ljava/io/ByteArrayOutputStream;-><init>()V
  .line 789
    nop
  .line 790
    const/4 v2, 0
    const/4 v3, 0
    const/4 v4, 0
  :L1
  .line 791
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v5
    if-ge v3, v5, :L3
  .line 792
    invoke-virtual { p0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 793
    if-ne v5, v0, :L2
    add-int/lit8 v6, v3, 2
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v7
    if-ge v6, v7, :L2
    add-int/lit8 v7, v3, 1
  .line 794
    invoke-virtual { p0, v7 }, Ljava/lang/String;->charAt(I)C
    move-result v8
    invoke-static { v8 }, Lcom/innioasis/ipp/M3u;->hex(C)I
    move-result v8
    if-ltz v8, :L2
    invoke-virtual { p0, v6 }, Ljava/lang/String;->charAt(I)C
    move-result v8
    invoke-static { v8 }, Lcom/innioasis/ipp/M3u;->hex(C)I
    move-result v8
    if-ltz v8, :L2
  .line 795
    invoke-virtual { p0, v7 }, Ljava/lang/String;->charAt(I)C
    move-result v4
    invoke-static { v4 }, Lcom/innioasis/ipp/M3u;->hex(C)I
    move-result v4
    mul-int/lit8 v4, v4, 16
    invoke-virtual { p0, v6 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    invoke-static { v5 }, Lcom/innioasis/ipp/M3u;->hex(C)I
    move-result v5
    add-int/2addr v4, v5
    invoke-virtual { v1, v4 }, Ljava/io/ByteArrayOutputStream;->write(I)V
  .line 796
    add-int/lit8 v3, v3, 3
  .line 797
    nop
  .line 798
    const/4 v4, 1
    goto :L1
  :L2
  .line 800
    invoke-static { v5 }, Ljava/lang/String;->valueOf(C)Ljava/lang/String;
    move-result-object v5
    sget-object v6, Lcom/innioasis/ipp/M3u;->UTF8:Ljava/nio/charset/Charset;
    invoke-virtual { v5, v6 }, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
    move-result-object v5
  .line 801
    array-length v6, v5
    invoke-virtual { v1, v5, v2, v6 }, Ljava/io/ByteArrayOutputStream;->write([BII)V
  .line 802
    add-int/lit8 v3, v3, 1
  .line 803
    goto :L1
  :L3
  .line 804
    if-nez v4, :L4
    return-object p0
  :L4
  .line 805
    invoke-virtual { v1 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object v0
  .line 806
    invoke-static { v0 }, Lcom/innioasis/ipp/M3u;->utf8([B)Z
    move-result v1
    if-eqz v1, :L5
    new-instance p0, Ljava/lang/String;
    sget-object v1, Lcom/innioasis/ipp/M3u;->UTF8:Ljava/nio/charset/Charset;
    invoke-direct { p0, v0, v1 }, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
  :L5
    return-object p0
  :L6
  .line 787
    return-object p0
.end method

.method private static read(Ljava/io/File;ZLcom/innioasis/ipp/M3u$Plan;)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L2 .. :L3 } :L4
  .registers 14
  .line 402
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->bytes(Ljava/io/File;)[B
    move-result-object v0
  .line 403
    nop
  .line 405
    array-length v1, v0
    const/4 v2, 0
    const/4 v3, 1
    const/4 v4, 0
    const/4 v5, 3
    if-lt v1, v5, :L0
    aget-byte v1, v0, v4
    and-int/lit16 v1, v1, 255
    const/16 v6, 239
    if-ne v1, v6, :L0
    aget-byte v1, v0, v3
    and-int/lit16 v1, v1, 255
    const/16 v6, 187
    if-ne v1, v6, :L0
    const/4 v1, 2
    aget-byte v1, v0, v1
    and-int/lit16 v1, v1, 255
    const/16 v6, 191
    if-ne v1, v6, :L0
  .line 406
    sget-object p0, Lcom/innioasis/ipp/M3u;->UTF8:Ljava/nio/charset/Charset;
  .line 407
    goto :L9
  :L0
  .line 408
    if-nez p1, :L8
    invoke-static { v0 }, Lcom/innioasis/ipp/M3u;->utf8([B)Z
    move-result p1
    if-eqz p1, :L1
    goto :L8
  :L1
  .line 413
    const-string p1, "windows-1251"
    invoke-static { p1 }, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    move-result-object p1
  .line 414
    nop
  :L2
  .line 416
    sget-object v1, Lcom/innioasis/y1_eBook/utils/FileEncodingDetector;->INSTANCE:Lcom/innioasis/y1_eBook/utils/FileEncodingDetector;
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0, p1 }, Lcom/innioasis/y1_eBook/utils/FileEncodingDetector;->detectCharset(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;
    move-result-object p0
  :L3
  .line 418
    goto :L5
  :L4
  .line 417
    move-exception p0
    move-object p0, v2
  :L5
  .line 419
    if-eqz p0, :L6
    goto :L7
  :L6
    move-object p0, p1
  :L7
    const/4 v5, 0
    goto :L9
  :L8
  .line 409
    sget-object p0, Lcom/innioasis/ipp/M3u;->UTF8:Ljava/nio/charset/Charset;
    const/4 v5, 0
  :L9
  .line 421
    new-instance p1, Ljava/lang/String;
    array-length v1, v0
    sub-int/2addr v1, v5
    invoke-direct { p1, v0, v5, v1, p0 }, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V
  .line 422
    const-string p0, "\r\n|\r|\n"
    invoke-virtual { p1, p0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 423
    nop
  .line 424
    move-object v0, v2
    const/4 p1, 0
  :L10
    array-length v1, p0
    if-ge p1, v1, :L18
  .line 425
    aget-object v1, p0, p1
    invoke-virtual { v1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
  .line 426
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v5
    if-lez v5, :L11
    invoke-virtual { v1, v4 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    const v6, 65279
    if-ne v5, v6, :L11
    invoke-virtual { v1, v3 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
  :L11
  .line 427
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v5
    if-nez v5, :L12
    goto :L17
  :L12
  .line 428
    invoke-virtual { v1, v4 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    const/16 v6, 35
    if-ne v5, v6, :L16
  .line 429
    const-string v5, "#BETTERY:FAVORITES"
    invoke-virtual { v1, v5 }, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L13
    iput-boolean v3, p2, Lcom/innioasis/ipp/M3u$Plan;->fav:Z
  :L13
  .line 431
    const/4 v6, 1
    const/4 v7, 0
    const-string v8, "#EXTINF:"
    const/4 v9, 0
    const/16 v10, 8
    move-object v5, v1
    invoke-virtual/range { v5 .. v10 }, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z
    move-result v5
    if-eqz v5, :L17
  .line 432
    const/16 v0, 44
    invoke-virtual { v1, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
  .line 433
    if-lez v0, :L14
    add-int/lit8 v0, v0, 1
    invoke-virtual { v1, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    goto :L15
  :L14
    move-object v0, v2
  :L15
  .line 434
    goto :L17
  :L16
  .line 437
    iget-object v5, p2, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v5, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 438
    iget-object v1, p2, Lcom/innioasis/ipp/M3u$Plan;->infos:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 439
    move-object v0, v2
  :L17
  .line 424
    add-int/lit8 p1, p1, 1
    goto :L10
  :L18
  .line 441
    return-void
.end method

.method private static redate(Ljava/util/UUID;Ljava/util/List;J)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L0 .. :L3 } :L4
  .registers 12
  .line 737
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v0
  .line 738
    invoke-static { p0 }, Landroidx/room/util/UUIDUtil;->convertUUIDToByte(Ljava/util/UUID;)[B
    move-result-object p0
  .line 739
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->beginTransaction()V
  :L0
  .line 741
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->getOpenHelper()Landroidx/sqlite/db/SupportSQLiteOpenHelper;
    move-result-object v1
    invoke-interface { v1 }, Landroidx/sqlite/db/SupportSQLiteOpenHelper;->getWritableDatabase()Landroidx/sqlite/db/SupportSQLiteDatabase;
    move-result-object v1
  .line 742
    const/4 v2, 0
    const/4 v3, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L2
  .line 743
    const-string v4, "update songCatPlaylist set date = ? where playlistId = ? and songId = ?"
    const/4 v5, 3
    new-array v5, v5, [Ljava/lang/Object;
    int-to-long v6, v3
    add-long/2addr v6, p2
    invoke-static { v6, v7 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v6
    aput-object v6, v5, v2
    const/4 v6, 1
    aput-object p0, v5, v6
  .line 744
    invoke-interface { p1, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object v6
    const/4 v7, 2
    aput-object v6, v5, v7
  .line 743
    invoke-interface { v1, v4, v5 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
  .line 742
    add-int/lit8 v3, v3, 1
    goto :L1
  :L2
  .line 746
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
  :L3
  .line 748
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->endTransaction()V
  .line 749
    nop
  .line 750
    return-void
  :L4
  .line 748
    move-exception p0
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->endTransaction()V
  .line 749
    goto :L6
  :L5
    throw p0
  :L6
    goto :L5
.end method

.method private static relative(Ljava/lang/String;)Ljava/lang/String;
  .registers 5
  .line 289
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 290
    nop
  .line 291
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "/storage/sdcard0"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, "/Music"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 292
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "/"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L1
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    add-int/lit8 v0, v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 293
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L2
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "../"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v1
    add-int/lit8 v1, v1, 1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 294
    return-object p0
.end method

.method private static repo()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 73
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    return-object v0
.end method

.method public static scan()Ljava/util/List;
  .catchall { :L2 .. :L6 } :L7
  .registers 10
  .line 371
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 372
    invoke-static { }, Lcom/innioasis/ipp/M3u;->dir()Ljava/io/File;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 373
    if-nez v1, :L0
    return-object v0
  :L0
  .line 374
    new-instance v2, Lcom/innioasis/ipp/M3u$ByName;
    invoke-direct { v2 }, Lcom/innioasis/ipp/M3u$ByName;-><init>()V
    invoke-static { v1, v2 }, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V
  .line 375
    const/4 v2, 0
    const/4 v3, 0
  :L1
    array-length v4, v1
    if-ge v3, v4, :L9
  .line 376
    aget-object v4, v1, v3
  .line 377
    invoke-virtual { v4 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v5
  .line 378
    invoke-virtual { v5 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v6
  .line 379
    const-string v7, ".m3u8"
    invoke-virtual { v6, v7 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v7
  .line 380
    invoke-virtual { v4 }, Ljava/io/File;->isFile()Z
    move-result v8
    if-eqz v8, :L8
    if-nez v7, :L2
    const-string v8, ".m3u"
    invoke-virtual { v6, v8 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :L2
    goto :L8
  :L2
  .line 382
    new-instance v6, Lcom/innioasis/ipp/M3u$Plan;
    invoke-direct { v6 }, Lcom/innioasis/ipp/M3u$Plan;-><init>()V
  .line 383
    iput-object v5, v6, Lcom/innioasis/ipp/M3u$Plan;->file:Ljava/lang/String;
  .line 384
    invoke-virtual { v5 }, Ljava/lang/String;->length()I
    move-result v8
    if-eqz v7, :L3
    const/4 v9, 5
    goto :L4
  :L3
    const/4 v9, 4
  :L4
    sub-int/2addr v8, v9
    invoke-virtual { v5, v2, v8 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v8 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v8
    iput-object v8, v6, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
  .line 385
    iget-object v8, v6, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    invoke-virtual { v8 }, Ljava/lang/String;->length()I
    move-result v8
    if-nez v8, :L5
    const-string v8, "Playlist"
    iput-object v8, v6, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
  :L5
  .line 386
    invoke-static { v4, v7, v6 }, Lcom/innioasis/ipp/M3u;->read(Ljava/io/File;ZLcom/innioasis/ipp/M3u$Plan;)V
  .line 387
    invoke-virtual { v0, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 390
    goto :L8
  :L7
  .line 388
    move-exception v4
  .line 389
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "m3u read "
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v6, ": "
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L8
  .line 375
    add-int/lit8 v3, v3, 1
    goto :L1
  :L9
  .line 392
    return-object v0
.end method

.method private static shapes(Ljava/lang/String;Ljava/util/List;)V
  .registers 9
  .line 842
    nop
  .line 843
    const/16 v0, 92
    const/16 v1, 47
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p0
  .line 844
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v2, 3
    const/16 v3, 58
    const/4 v4, 1
    const/4 v5, 0
    const/4 v6, 2
    if-lt v0, v2, :L0
    invoke-virtual { p0, v5 }, Ljava/lang/String;->charAt(I)C
    move-result v0
    if-ne v0, v1, :L0
    invoke-virtual { p0, v6 }, Ljava/lang/String;->charAt(I)C
    move-result v0
    if-ne v0, v3, :L0
    invoke-virtual { p0, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  :L0
  .line 845
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    const-string v1, "/"
    const-string v2, "/storage/sdcard0"
    if-lt v0, v6, :L2
    invoke-virtual { p0, v5 }, Ljava/lang/String;->charAt(I)C
    move-result v0
    invoke-static { v0 }, Ljava/lang/Character;->isLetter(C)Z
    move-result v0
    if-eqz v0, :L2
    invoke-virtual { p0, v4 }, Ljava/lang/String;->charAt(I)C
    move-result v0
    if-ne v0, v3, :L2
  .line 846
    invoke-virtual { p0, v6 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  .line 847
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L1
  .line 848
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-interface { p1, p0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 849
    return-void
  :L2
  .line 851
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L6
  .line 852
    nop
  :L3
    sget-object v0, Lcom/innioasis/ipp/M3u;->ROOTS:[Ljava/lang/String;
    array-length v3, v0
    if-ge v5, v3, :L5
  .line 853
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    aget-object v4, v0, v5
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p0, v3 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L4
  .line 854
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    aget-object v0, v0, v5
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-interface { p1, p0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 855
    return-void
  :L4
  .line 852
    add-int/lit8 v5, v5, 1
    goto :L3
  :L5
  .line 858
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-interface { p1, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 859
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-interface { p1, p0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 860
    return-void
  :L6
  .line 862
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { }, Lcom/innioasis/ipp/M3u;->dir()Ljava/io/File;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/M3u;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-interface { p1, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 863
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, "/Music/"
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/M3u;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-interface { p1, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 864
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-interface { p1, p0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 865
    return-void
.end method

.method static shown(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 766
    invoke-static { p0 }, Lcom/innioasis/ipp/M3u;->pct(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    const/16 v1, 92
    const/16 v2, 47
    invoke-virtual { v0, v1, v2 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/M3u;->last(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 767
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L0
    move-object p0, v0
  :L0
    return-object p0
.end method

.method private static stem(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 777
    const/16 v0, 46
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 778
    if-lez v0, :L0
    const/4 v1, 0
    invoke-virtual { p0, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  :L0
    return-object p0
.end method

.method private static utf8([B)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 461
    sget-object v0, Lcom/innioasis/ipp/M3u;->UTF8:Ljava/nio/charset/Charset;
    invoke-virtual { v0 }, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;
    move-result-object v0
    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;
  .line 462
    invoke-virtual { v0, v1 }, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;
    move-result-object v0
    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;
  .line 463
    invoke-virtual { v0, v1 }, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;
    move-result-object v0
  .line 464
    invoke-static { p0 }, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;
  :L1
  .line 465
    const/4 p0, 1
    return p0
  :L2
  .line 466
    move-exception p0
  .line 467
    const/4 p0, 0
    return p0
.end method

.method private static vote(Ljava/util/HashMap;Lcom/innioasis/y1/database/Song;)V
  .registers 4
  .line 753
    if-eqz p1, :L3
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    goto :L3
  :L0
  .line 754
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/M3u;->parent(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 755
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Integer;
  .line 756
    const/4 v1, 1
    if-nez v0, :L1
    goto :L2
  :L1
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
    add-int/2addr v1, v0
  :L2
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    invoke-virtual { p0, p1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 757
    return-void
  :L3
  .line 753
    return-void
.end method

.method private static writeFile(Ljava/io/File;Ljava/lang/String;)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 342
    new-instance v0, Ljava/io/FileOutputStream;
    invoke-direct { v0, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L0
  .line 344
    const-string p0, "UTF-8"
    invoke-virtual { p1, p0 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 345
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/io/FileDescriptor;->sync()V
  :L1
  .line 347
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  .line 348
    nop
  .line 349
    return-void
  :L2
  .line 347
    move-exception p0
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  .line 348
    throw p0
.end method

.class public final Lcom/innioasis/ipp/Queue;
.super Ljava/lang/Object;
.source "Queue.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Queue$Pass;
  }
.end annotation

.field public final static LOOKAHEAD:I = 20

.field public final static MANUAL_MAX:I = 20

.field private final static MAX_PAST:I = 4

.field private final static PREV_RESTART_MS:J = 4000L

.field private final static P_GENRE:Ljava/lang/String; = "src_genre"

.field private final static P_KEY:Ljava/lang/String; = "src_key"

.field private final static P_LEVEL:Ljava/lang/String; = "src_level"

.field private final static P_NAME:Ljava/lang/String; = "src_name"

.field private final static P_ORDERED:Ljava/lang/String; = "src_ordered"

.field private final static P_SIG:Ljava/lang/String; = "src_sig"

.field private final static P_URI:Ljava/lang/String; = "src_uri"

.field private final static P_UUID:Ljava/lang/String; = "src_uuid"

.field private static dropPlayer:Ljava/lang/ref/WeakReference;

.field private static fromKind:I

.field private final static future:Ljava/util/ArrayList;

.field private final static guestIdx:Ljava/util/ArrayList;

.field private final static hist:Ljava/util/ArrayList;

.field private static kind:I

.field private static lastList:Ljava/lang/ref/WeakReference;

.field private static lastShuffle:I

.field private final static manual:Ljava/util/ArrayList;

.field private static manualTotal:I

.field private static memoAdapter:Ljava/lang/Object;

.field private static memoAns:Z

.field private static memoKey:Ljava/lang/String;

.field private static memoTitle:Ljava/lang/String;

.field private static passLen:I

.field private final static past:Ljava/util/ArrayList;

.field private final static plan:Ljava/util/ArrayList;

.field private static planFor:I

.field private static resume:I

.field private final static rnd:Ljava/util/Random;

.field private static rowIdx:[I

.field private static rowManual:I

.field private final static skip:Ljava/util/ArrayList;

.field private static skipRestart:Z

.field private static source:Ljava/lang/String;

.field private final static spent:Ljava/util/ArrayList;

.field private static srcAct:Ljava/lang/ref/WeakReference;

.field private static srcGenre:Z

.field private static srcIntent:Landroid/content/Intent;

.field private static srcKey:Ljava/lang/String;

.field private static srcLevel:Ljava/lang/String;

.field private static srcLoaded:Z

.field private static srcOrdered:Z

.method static constructor <clinit>()V
  .registers 4
  .line 51
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
  .line 56
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
  .line 61
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
  .line 62
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
  .line 63
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
  .line 64
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
  .line 66
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
  .line 68
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
  .line 69
    new-instance v0, Ljava/util/Random;
    invoke-direct { v0 }, Ljava/util/Random;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->rnd:Ljava/util/Random;
  .line 74
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->kind:I
  .line 77
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->resume:I
  .line 79
    sput v1, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 85
    sput v1, Lcom/innioasis/ipp/Queue;->lastShuffle:I
  .line 91
    const/4 v2, 1
    sput v2, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 94
    new-array v3, v0, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 95
    sput v0, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 96
    sput v0, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 582
    sput v1, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 1019
    const-string v0, ""
    sput-object v0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1090
    sput-boolean v2, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 42
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static add(Lcom/innioasis/y1/database/Song;)V
  .registers 2
  .line 211
    if-nez p0, :L0
    return-void
  :L0
  .line 212
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 213
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 214
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->insertGuest(Lcom/innioasis/y1/database/Song;)I
    move-result p0
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 215
    return-void
.end method

.method public static addAll(Ljava/util/List;)V
  .registers 4
  .line 485
    if-nez p0, :L0
    return-void
  :L0
  .line 486
    sget v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 487
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 488
    if-gez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->kindOfSongs(Ljava/util/List;)I
    move-result v0
  :L1
  .line 489
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->allowedFrom(I)Z
    move-result v0
    if-nez v0, :L2
    return-void
  :L2
  .line 490
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
  .line 491
    const/4 v1, 0
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 492
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->add(Lcom/innioasis/y1/database/Song;)V
  .line 491
    add-int/lit8 v1, v1, 1
    goto :L3
  :L4
  .line 494
    sget-object p0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result p0
    if-ne p0, v0, :L5
    return-void
  :L5
  .line 495
    const p0, 2131821048
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toast(I)V
  .line 496
    return-void
.end method

.method public static addAllFromMusic(Ljava/util/List;)V
  .registers 2
  .line 586
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 587
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->addAll(Ljava/util/List;)V
  .line 588
    return-void
.end method

.method public static addFromAdapter(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 503
    if-nez p0, :L0
    return-void
  :L0
  .line 504
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->screenKind(Landroid/content/Context;)I
    move-result v0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 505
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 506
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 507
    if-eqz v1, :L4
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L4
  .line 508
    const/4 v2, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 509
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v3
  .line 510
    if-eqz v3, :L2
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 508
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 513
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 514
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
    goto :L5
  :L4
  .line 516
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 517
    if-eqz p0, :L5
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 519
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->addPicked(Ljava/util/List;)V
  .line 520
    return-void
.end method

.method public static addFromListView(Landroid/widget/ListView;)V
  .registers 2
  .line 524
    if-nez p0, :L0
    return-void
  :L0
  .line 525
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object p0
  .line 526
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v0, :L1
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->addFromAdapter(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  :L1
  .line 527
    return-void
.end method

.method public static addFromRvAdapter(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .registers 5
  .line 531
    if-nez p0, :L0
    return-void
  :L0
  .line 532
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 533
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 534
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v2
  .line 535
    if-eqz v2, :L4
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-nez v3, :L4
  .line 536
    nop
  :L1
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L3
  .line 537
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v3
  .line 538
    if-eqz v3, :L2
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 536
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 540
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 541
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
    goto :L5
  :L4
  .line 543
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p0
  .line 544
    if-eqz p0, :L5
    invoke-virtual { v1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 546
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->addPicked(Ljava/util/List;)V
  .line 547
    return-void
.end method

.method public static addFromSearch(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .registers 5
  .line 551
    if-nez p0, :L0
    return-void
  :L0
  .line 552
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 553
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 554
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v2
  .line 555
    if-eqz v2, :L3
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-nez v3, :L3
  .line 556
    nop
  :L1
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L2
  .line 557
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->unwrap(Ljava/util/ArrayList;Ljava/lang/Object;)V
  .line 556
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 559
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 560
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
    goto :L4
  :L3
  .line 562
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p0
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Queue;->unwrap(Ljava/util/ArrayList;Ljava/lang/Object;)V
  :L4
  .line 564
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->addPicked(Ljava/util/List;)V
  .line 565
    return-void
.end method

.method private static addPicked(Ljava/util/List;)V
  .catch Ljava/lang/Exception; { :L0 .. :L11 } :L12
  .registers 8
  :L0
  .line 665
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 666
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 667
    const/4 v2, 0
    const/4 v3, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L10
  .line 668
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 669
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L2
  .line 670
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L9
  :L2
  .line 671
    instance-of v5, v4, Lcom/innioasis/music/data/Album;
    if-eqz v5, :L5
  .line 672
    move-object v5, v4
    check-cast v5, Lcom/innioasis/music/data/Album;
    invoke-virtual { v5 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v5
  .line 673
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L3
  .line 675
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->allSongsArtist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->artistSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/lang/String;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L4
  :L3
  .line 678
    check-cast v4, Lcom/innioasis/music/data/Album;
    const/4 v5, 0
    invoke-virtual { v0, v4, v2, v5 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByAlbumSync(Lcom/innioasis/music/data/Album;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
  :L4
  .line 680
    goto :L9
  :L5
    instance-of v5, v4, Lcom/innioasis/y1/database/Playlist;
    if-eqz v5, :L6
  .line 681
    check-cast v4, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v0, v4 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByPlaylistSync(Lcom/innioasis/y1/database/Playlist;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L9
  :L6
  .line 682
    instance-of v5, v4, Lcom/innioasis/music/data/Genre;
    if-eqz v5, :L7
  .line 683
    check-cast v4, Lcom/innioasis/music/data/Genre;
    invoke-virtual { v0, v4 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByGenreSync(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L9
  :L7
  .line 684
    instance-of v5, v4, Ljava/io/File;
    if-eqz v5, :L8
  .line 685
    check-cast v4, Ljava/io/File;
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->fileSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L9
  :L8
  .line 686
    instance-of v5, v4, Ljava/lang/String;
    if-eqz v5, :L9
  .line 687
    check-cast v4, Ljava/lang/String;
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->artistSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/lang/String;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
  :L9
  .line 667
    add-int/lit8 v3, v3, 1
    goto :L1
  :L10
  .line 690
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->addAll(Ljava/util/List;)V
  :L11
  .line 692
    goto :L13
  :L12
  .line 691
    move-exception p0
  :L13
  .line 693
    return-void
.end method

.method private static allowedFrom(I)Z
  .catchall { :L0 .. :L8 } :L11
  .registers 6
  .line 645
    const/4 v0, 1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 646
    if-nez v1, :L1
    return v0
  :L1
  .line 647
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlaying()Lcom/innioasis/y1/service/PlayerService$Playing;
    move-result-object v2
  .line 649
    sget-object v3, Lcom/innioasis/y1/service/PlayerService$Playing;->Audiobook:Lcom/innioasis/y1/service/PlayerService$Playing;
    const/4 v4, 0
    if-ne v2, v3, :L2
    const/4 v2, 1
    goto :L3
  :L2
  .line 650
    sget-object v3, Lcom/innioasis/y1/service/PlayerService$Playing;->Music:Lcom/innioasis/y1/service/PlayerService$Playing;
    if-ne v2, v3, :L10
    const/4 v2, 0
  :L3
  .line 652
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Queue;->listOf(Lcom/innioasis/y1/service/PlayerService;I)Ljava/util/List;
    move-result-object v1
  .line 653
    if-eqz v1, :L9
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L4
    goto :L9
  :L4
  .line 654
    if-ne p0, v2, :L5
    return v0
  :L5
  .line 655
    if-ne v2, v0, :L6
    const p0, 2131821097
    goto :L7
  :L6
    const p0, 2131821098
  :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toast(I)V
  :L8
  .line 656
    return v4
  :L9
  .line 653
    return v0
  :L10
  .line 651
    return v0
  :L11
  .line 657
    move-exception p0
  .line 658
    return v0
.end method

.method private static artistSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/lang/String;)Ljava/util/List;
  .registers 2
  .line 714
    const/4 p0, 0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Artists;->forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method public static atSource()Z
  .catchall { :L0 .. :L1 } :L4
  .registers 3
  .line 1298
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1299
    sget-object v0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1300
    const/4 v1, 1
    if-nez v0, :L0
    return v1
  :L0
  .line 1302
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v2
  .line 1303
    if-eqz v2, :L3
    invoke-virtual { v0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
  :L1
    if-eqz v0, :L2
    goto :L3
  :L2
    const/4 v1, 0
  :L3
    return v1
  :L4
  .line 1304
    move-exception v0
  .line 1305
    return v1
.end method

.method public static atSource(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L10 } :L11
  .registers 7
  .line 1362
    const/4 v0, 1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1363
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1364
    if-nez v1, :L1
    return v0
  :L1
  .line 1365
    instance-of v2, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v2, :L2
    return v0
  :L2
  .line 1366
    move-object v2, p0
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v2
  .line 1367
    instance-of v3, v2, Lcom/innioasis/y1/base/BaseActivity;
    const/4 v4, 0
    if-eqz v3, :L3
    move-object v3, v2
    check-cast v3, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { v3 }, Lcom/innioasis/y1/base/BaseActivity;->getStateBarLeftText()Ljava/lang/String;
    move-result-object v3
    goto :L4
  :L3
    move-object v3, v4
  :L4
  .line 1368
    sget-object v5, Lcom/innioasis/ipp/Queue;->memoAdapter:Ljava/lang/Object;
    if-ne p0, v5, :L5
    sget-object v5, Lcom/innioasis/ipp/Queue;->memoTitle:Ljava/lang/String;
    if-ne v3, v5, :L5
    sget-object v5, Lcom/innioasis/ipp/Queue;->memoKey:Ljava/lang/String;
    if-ne v1, v5, :L5
    sget-boolean p0, Lcom/innioasis/ipp/Queue;->memoAns:Z
    return p0
  :L5
  .line 1369
    instance-of v5, v2, Landroid/app/Activity;
    if-eqz v5, :L6
    move-object v4, v2
    check-cast v4, Landroid/app/Activity;
  :L6
    invoke-static { v4 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v2
  .line 1370
    sput-object p0, Lcom/innioasis/ipp/Queue;->memoAdapter:Ljava/lang/Object;
  .line 1371
    sput-object v3, Lcom/innioasis/ipp/Queue;->memoTitle:Ljava/lang/String;
  .line 1372
    sput-object v1, Lcom/innioasis/ipp/Queue;->memoKey:Ljava/lang/String;
  .line 1373
    if-eqz v2, :L8
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L7
    goto :L8
  :L7
    const/4 p0, 0
    goto :L9
  :L8
    const/4 p0, 1
  :L9
    sput-boolean p0, Lcom/innioasis/ipp/Queue;->memoAns:Z
  :L10
  .line 1374
    return p0
  :L11
  .line 1375
    move-exception p0
  .line 1376
    return v0
.end method

.method private static book()Z
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 118
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 119
    if-eqz v1, :L2
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlaying()Lcom/innioasis/y1/service/PlayerService$Playing;
    move-result-object v1
    sget-object v2, Lcom/innioasis/y1/service/PlayerService$Playing;->Audiobook:Lcom/innioasis/y1/service/PlayerService$Playing;
  :L1
    if-ne v1, v2, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 120
    move-exception v1
  .line 121
    return v0
.end method

.method private static bump(Ljava/util/ArrayList;II)V
  .registers 5
  .line 477
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 478
    invoke-virtual { p0, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  .line 479
    if-lt v1, p1, :L1
    add-int/2addr v1, p2
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { p0, v0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 477
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 481
    return-void
.end method

.method public static canRemoveRow(I)Z
  .registers 3
  .line 1692
    const/4 v0, 1
    if-lt p0, v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v1
    if-nez v1, :L0
    sget-object v1, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    array-length v1, v1
    if-ge p0, v1, :L1
  :L0
    goto :L2
  :L1
    const/4 v0, 0
  :L2
    return v0
.end method

.method private static clearSession()V
  .registers 2
  .line 168
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 169
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 170
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 171
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 172
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 173
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 174
    sget-object v0, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 175
    sget-object v0, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 176
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Queue;->resume:I
  .line 177
    sput v0, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 178
    const/4 v1, 1
    sput v1, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 179
    sput v0, Lcom/innioasis/ipp/Queue;->lastShuffle:I
  .line 180
    return-void
.end method

.method private static collect(Ljava/util/ArrayList;Ljava/util/List;)V
  .registers 4
  .line 696
    if-nez p1, :L0
    return-void
  :L0
  .line 697
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L3
  .line 698
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L2
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 697
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 700
    return-void
.end method

.method public static consumeSkipRestart()Z
  .registers 2
  .line 1346
    sget-boolean v0, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  .line 1347
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  .line 1348
    return v0
.end method

.method private static dropFromPlan(I)V
  .registers 4
  .line 1697
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v0, v2, :L2
  .line 1698
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-ne v2, p0, :L1
  .line 1699
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 1700
    return-void
  :L1
  .line 1697
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 1703
    return-void
.end method

.method private static dropGuest(I)V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  :L0
  .line 248
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 249
    if-nez v0, :L1
    return-void
  :L1
  .line 250
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 251
    if-eqz v1, :L5
    if-ltz p0, :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
    if-lt p0, v2, :L2
    goto :L5
  :L2
  .line 252
    invoke-interface { v1, p0 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 253
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
  .line 254
    if-le v1, p0, :L3
    add-int/lit8 v1, v1, -1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Queue;->setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  :L3
  .line 255
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->shiftDown(I)V
  :L4
  .line 257
    goto :L7
  :L5
  .line 251
    return-void
  :L6
  .line 256
    move-exception p0
  :L7
  .line 258
    return-void
.end method

.method private static dropGuests()V
  .registers 1
  .line 265
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 266
    sget-object v0, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->notePass(Ljava/util/ArrayList;)V
  .line 267
    invoke-static { }, Lcom/innioasis/ipp/Queue;->stripGuests()V
  .line 268
    return-void
.end method

.method private static dropGuestsFrom(I)V
  .catchall { :L0 .. :L13 } :L15
  .registers 9
  :L0
  .line 185
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 186
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->listOf(Lcom/innioasis/y1/service/PlayerService;I)Ljava/util/List;
    move-result-object v1
  .line 187
    if-nez v1, :L1
    return-void
  :L1
  .line 188
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 189
    const/4 v3, 0
    const/4 v4, 0
  :L2
    sget-object v5, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v4, v6, :L3
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v2, v5 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v4, v4, 1
    goto :L2
  :L3
  .line 190
    const/4 v4, 0
  :L4
    sget-object v5, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v4, v6, :L5
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v2, v5 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v4, v4, 1
    goto :L4
  :L5
  .line 191
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v4
    if-nez v4, :L14
  .line 192
    nop
  .line 193
    const/4 v4, -1
    const/4 v5, -1
    const/4 v6, 0
  :L6
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v7
    if-ge v6, v7, :L8
  .line 194
    invoke-virtual { v2, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Integer;
    invoke-virtual { v7 }, Ljava/lang/Integer;->intValue()I
    move-result v7
  .line 195
    if-le v7, v5, :L7
    move v4, v6
    move v5, v7
  :L7
  .line 193
    add-int/lit8 v6, v6, 1
    goto :L6
  :L8
  .line 197
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 198
    if-ltz v5, :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v4
    if-lt v5, v4, :L9
    goto :L5
  :L9
  .line 199
    invoke-interface { v1, v5 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 200
    const/4 v4, 1
    if-ne p0, v4, :L10
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookIndex()I
    move-result v6
    goto :L11
  :L10
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicIndex()I
    move-result v6
  :L11
  .line 201
    if-le v6, v5, :L13
  .line 202
    if-ne p0, v4, :L12
    add-int/lit8 v6, v6, -1
    invoke-virtual { v0, v6 }, Lcom/innioasis/y1/service/PlayerService;->setAudiobookIndex(I)V
    goto :L13
  :L12
  .line 203
    add-int/lit8 v6, v6, -1
    invoke-virtual { v0, v6 }, Lcom/innioasis/y1/service/PlayerService;->setMusicIndex(I)V
  :L13
  .line 205
    goto :L5
  :L14
  .line 207
    goto :L16
  :L15
  .line 206
    move-exception p0
  :L16
  .line 208
    return-void
.end method

.method private static dropPlanThrough(I)V
  .registers 5
  .line 1740
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v1, v3, :L4
  .line 1741
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-ne v2, p0, :L3
  .line 1742
    const/4 p0, 0
  :L1
    if-gt p0, v1, :L2
  .line 1743
    sget-object v2, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 1742
    add-int/lit8 p0, p0, 1
    goto :L1
  :L2
  .line 1745
    return-void
  :L3
  .line 1740
    add-int/lit8 v1, v1, 1
    goto :L0
  :L4
  .line 1748
    return-void
.end method

.method private static dropStalePlayer()V
  .catchall { :L0 .. :L6 } :L7
  .registers 2
  :L0
  .line 1110
    sget-object v0, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L2
  .line 1111
    sput-object v1, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
  .line 1112
    instance-of v1, v0, Landroid/app/Activity;
    if-nez v1, :L3
    return-void
  :L3
  .line 1113
    check-cast v0, Landroid/app/Activity;
  .line 1114
    invoke-virtual { v0 }, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-eqz v1, :L4
    return-void
  :L4
  .line 1115
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object v1
    if-ne v0, v1, :L5
    return-void
  :L5
  .line 1116
    invoke-virtual { v0 }, Landroid/app/Activity;->finish()V
  :L6
  .line 1118
    goto :L8
  :L7
  .line 1117
    move-exception v0
  :L8
  .line 1119
    return-void
.end method

.method public static endOfList(Lcom/innioasis/y1/service/PlayerService;)Z
  .catch Ljava/lang/Exception; { :L0 .. :L7 } :L10
  .registers 4
  .line 884
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 885
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 886
    sget-object v1, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 887
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 888
    if-eqz v1, :L9
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L2
    goto :L9
  :L2
  .line 889
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  .line 890
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 891
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result v2
    if-eqz v2, :L3
    return v0
  :L3
  .line 892
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v2
    if-eqz v2, :L4
  .line 893
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Queue;->ensureCycle(II)V
  .line 894
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    return p0
  :L4
  .line 896
    sget v2, Lcom/innioasis/ipp/Queue;->resume:I
    if-ltz v2, :L5
    goto :L6
  :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
  :L6
  .line 897
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result p0
  :L7
    if-gez p0, :L8
    const/4 v0, 1
  :L8
    return v0
  :L9
  .line 888
    return v0
  :L10
  .line 898
    move-exception p0
  .line 899
    return v0
.end method

.method private static ensureCycle(II)V
  .registers 3
  .line 867
    if-gtz p0, :L0
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->clear()V
    return-void
  :L0
  .line 868
    sget v0, Lcom/innioasis/ipp/Queue;->planFor:I
    if-eq v0, p0, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->newCycle(II)V
  :L1
  .line 869
    return-void
.end method

.method private static ensureSource()V
  .catchall { :L1 .. :L13 } :L15
  .registers 11
  .line 1202
    const-string v0, ""
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcLoaded:Z
    if-nez v1, :L17
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-eqz v1, :L0
    goto/16 :L17
  :L0
  .line 1204
    const/4 v1, 1
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v2
  .line 1205
    if-nez v2, :L2
    return-void
  :L2
  .line 1206
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->listSig(Lcom/innioasis/y1/service/PlayerService;)Ljava/lang/String;
    move-result-object v2
  .line 1207
    if-nez v2, :L3
    return-void
  :L3
  .line 1208
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->srcLoaded:Z
  .line 1209
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v3
  .line 1210
    if-nez v3, :L4
    return-void
  :L4
  .line 1211
    const-string v4, "src_sig"
    invoke-interface { v3, v4, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L5
    return-void
  :L5
  .line 1212
    const-string v2, "src_key"
    invoke-interface { v3, v2, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1213
    const-string v4, "src_uri"
    invoke-interface { v3, v4, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 1214
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v5
    if-eqz v5, :L14
    invoke-virtual { v4 }, Ljava/lang/String;->length()I
    move-result v5
    if-nez v5, :L6
    goto :L14
  :L6
  .line 1215
    const/4 v5, 0
    invoke-static { v4, v5 }, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;
    move-result-object v4
  .line 1216
    const-string v6, "src_uuid"
    invoke-interface { v3, v6, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 1217
    invoke-virtual { v6 }, Ljava/lang/String;->length()I
    move-result v7
    if-lez v7, :L10
  .line 1218
    const-string v7, "\n"
    invoke-virtual { v6, v7 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v6
  .line 1219
    const/4 v7, 0
  :L7
    array-length v8, v6
    if-ge v7, v8, :L10
  .line 1220
    aget-object v8, v6, v7
    const/16 v9, 61
    invoke-virtual { v8, v9 }, Ljava/lang/String;->indexOf(I)I
    move-result v8
  .line 1221
    if-gtz v8, :L8
    goto :L9
  :L8
  .line 1222
    aget-object v9, v6, v7
    invoke-virtual { v9, v5, v8 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v9
    aget-object v10, v6, v7
    add-int/lit8 v8, v8, 1
  .line 1223
    invoke-virtual { v10, v8 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v8
    invoke-static { v8 }, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;
    move-result-object v8
  .line 1222
    invoke-virtual { v4, v9, v8 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;
  :L9
  .line 1219
    add-int/lit8 v7, v7, 1
    goto :L7
  :L10
  .line 1226
    sput-object v2, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1227
    const-string v2, "src_name"
    invoke-interface { v3, v2, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    sput-object v2, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1228
    sput-object v4, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
  .line 1229
    const/4 v2, 0
    sput-object v2, Lcom/innioasis/ipp/Queue;->srcAct:Ljava/lang/ref/WeakReference;
  .line 1230
    const-string v4, "src_level"
    invoke-interface { v3, v4, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 1231
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v4
    if-nez v4, :L11
    goto :L12
  :L11
    move-object v2, v0
  :L12
    sput-object v2, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
  .line 1232
    const-string v0, "src_genre"
    invoke-interface { v3, v0, v5 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->srcGenre:Z
  .line 1233
    const-string v0, "src_ordered"
    invoke-interface { v3, v0, v1 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
  :L13
  .line 1236
    goto :L16
  :L14
  .line 1214
    return-void
  :L15
  .line 1234
    move-exception v0
  .line 1235
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->srcLoaded:Z
  :L16
  .line 1237
    return-void
  :L17
  .line 1202
    return-void
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 2
  .line 1005
    if-nez p0, :L1
    if-nez p1, :L0
    const/4 p0, 1
    goto :L2
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
  :L2
    return p0
.end method

.method private static fileSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Ljava/util/List;
  .registers 4
  .line 704
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 705
    invoke-virtual { p1 }, Ljava/io/File;->isDirectory()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByParentPath(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L1
  .line 706
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 707
    if-nez p0, :L2
    return-object v0
  :L2
  .line 708
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1 }, Ljava/util/ArrayList;-><init>()V
  .line 709
    invoke-virtual { p1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 710
    return-object p1
.end method

.method private static fromSource(Ljava/lang/Object;)Z
  .registers 4
  .line 1010
    sget-object v0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1011
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 1012
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 1013
    instance-of v2, p0, Landroid/app/Activity;
    if-nez v2, :L1
    return v1
  :L1
  .line 1014
    check-cast p0, Landroid/app/Activity;
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object p0
  .line 1015
    if-eqz p0, :L2
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L2
    const/4 v1, 1
  :L2
    return v1
.end method

.method private static guestAt(Ljava/util/List;ILcom/innioasis/y1/database/Song;)I
  .registers 5
  .line 450
    const/4 v0, -1
    if-ltz p1, :L3
    if-eqz p0, :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p1, v1, :L0
    goto :L3
  :L0
  .line 451
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
    if-ne p0, p2, :L1
    goto :L2
  :L1
    const/4 p1, -1
  :L2
    return p1
  :L3
  .line 450
    return v0
.end method

.method private static has(Ljava/util/ArrayList;I)Z
  .registers 5
  .line 442
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 443
    invoke-virtual { p0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-ne v2, p1, :L1
    const/4 p0, 1
    return p0
  :L1
  .line 442
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 445
    return v0
.end method

.method public static hasSource()Z
  .registers 1
  .line 1123
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1124
    sget-object v0, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    if-eqz v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static index(Lcom/innioasis/y1/service/PlayerService;)I
  .registers 2
  .line 137
    if-nez p0, :L0
    const/4 p0, -1
    return p0
  :L0
  .line 138
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
    if-eqz v0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookIndex()I
    move-result p0
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicIndex()I
    move-result p0
  :L2
    return p0
.end method

.method private static indexOf(Ljava/util/List;Lcom/innioasis/y1/database/Song;)I
  .registers 5
  .line 1392
    const/4 v0, -1
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 1393
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 1394
    if-nez p1, :L1
    return v0
  :L1
  .line 1395
    const/4 v1, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 1396
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1397
    if-eqz v2, :L3
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    return v1
  :L3
  .line 1395
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 1399
    return v0
  :L5
  .line 1392
    return v0
.end method

.method private static insertGuest(Lcom/innioasis/y1/database/Song;)I
  .catchall { :L0 .. :L8 } :L11
  .registers 7
  .line 225
    const/4 v0, -1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 226
    if-nez v1, :L1
    return v0
  :L1
  .line 227
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v2
  .line 228
    if-eqz v2, :L10
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L2
    goto :L10
  :L2
  .line 229
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
  .line 230
    if-ltz v1, :L9
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v1, v3, :L3
    goto :L9
  :L3
  .line 231
    add-int/lit8 v1, v1, 1
  .line 232
    const/4 v3, 0
  :L4
    sget-object v4, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v5
    if-ge v3, v5, :L6
  .line 233
    invoke-virtual { v4, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
  .line 234
    if-lt v4, v1, :L5
    add-int/lit8 v4, v4, 1
    move v1, v4
  :L5
  .line 232
    add-int/lit8 v3, v3, 1
    goto :L4
  :L6
  .line 236
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-le v1, v3, :L7
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v1
  :L7
  .line 237
    invoke-interface { v2, v1, p0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  .line 238
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->shiftUp(I)V
  :L8
  .line 239
    return v1
  :L9
  .line 230
    return v0
  :L10
  .line 228
    return v0
  :L11
  .line 240
    move-exception p0
  .line 241
    return v0
.end method

.method public static isManualRow(I)Z
  .registers 3
  .line 1672
    const/4 v0, 1
    if-lt p0, v0, :L0
    sget v1, Lcom/innioasis/ipp/Queue;->rowManual:I
    if-gt p0, v1, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static keyOf(Landroid/app/Activity;)Ljava/lang/String;
  .registers 4
  .line 1287
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 1288
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v0
    const-string v2, ".MainActivity"
    invoke-virtual { v0, v2 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L1
    return-object v1
  :L1
  .line 1289
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->getStateBarLeftText()Ljava/lang/String;
    move-result-object v0
  .line 1290
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/4 v1, 1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p0
    if-nez v0, :L2
    const-string v0, ""
  :L2
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static kindOfSongs(Ljava/util/List;)I
  .catchall { :L0 .. :L4 } :L9
  .registers 5
  .line 593
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L8
  .line 594
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 595
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-nez v3, :L1
    goto :L2
  :L1
  .line 596
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
  .line 597
    if-nez v2, :L3
  :L2
  .line 593
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 598
    const-string p0, "/storage/sdcard0/Audiobooks"
    invoke-virtual { v2, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L6
    const-string p0, "/storage/sdcard0/audiobooks"
  .line 599
    invoke-virtual { v2, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
  :L4
    if-eqz p0, :L5
    goto :L6
  :L5
  .line 600
    goto :L7
  :L6
    const/4 v0, 1
  :L7
  .line 598
    return v0
  :L8
  .line 603
    goto :L10
  :L9
  .line 602
    move-exception p0
  :L10
  .line 604
    return v0
.end method

.method private static list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
  .registers 2
  .line 126
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 127
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
    if-eqz v0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookList()Ljava/util/List;
    move-result-object p0
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object p0
  :L2
    return-object p0
.end method

.method private static listOf(Lcom/innioasis/y1/service/PlayerService;I)Ljava/util/List;
  .registers 3
  .line 132
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 133
    const/4 v0, 1
    if-ne p1, v0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookList()Ljava/util/List;
    move-result-object p0
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object p0
  :L2
    return-object p0
.end method

.method private static listSig(Lcom/innioasis/y1/service/PlayerService;)Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L6
  .registers 7
  .line 1168
    const-string v0, "|"
    const/4 v1, 0
    if-nez p0, :L0
    return-object v1
  :L0
  .line 1169
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object p0
  .line 1170
    if-eqz p0, :L5
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L1
    goto :L5
  :L1
  .line 1171
    const/4 v2, 0
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 1172
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    add-int/lit8 v3, v3, -1
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 1173
    instance-of v4, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v4, :L4
    instance-of v4, v3, Lcom/innioasis/y1/database/Song;
    if-nez v4, :L2
    goto :L4
  :L2
  .line 1174
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    sget v5, Lcom/innioasis/ipp/Queue;->kind:I
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
    invoke-virtual { v4, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 1173
    return-object v1
  :L5
  .line 1170
    return-object v1
  :L6
  .line 1175
    move-exception p0
  .line 1176
    return-object v1
.end method

.method public static manualCount()I
  .registers 1
  .line 105
    sget v0, Lcom/innioasis/ipp/Queue;->manualTotal:I
    return v0
.end method

.method public static manualShown()I
  .registers 1
  .line 100
    sget v0, Lcom/innioasis/ipp/Queue;->rowManual:I
    return v0
.end method

.method private static moveGuest(Ljava/util/List;II)I
  .catchall { :L0 .. :L6 } :L7
  .registers 5
  .line 420
    if-eqz p0, :L8
    if-ltz p1, :L8
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L8
  :L1
  .line 421
    if-le p2, p1, :L2
    add-int/lit8 p2, p2, -1
  :L2
    add-int/lit8 p2, p2, 1
  .line 422
    if-ne p2, p1, :L3
    return p1
  :L3
  .line 423
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
  .line 424
    invoke-interface { p0, p1 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 425
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->shiftDown(I)V
  .line 426
    if-gez p2, :L4
    const/4 p2, 0
  :L4
  .line 427
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-le p2, v1, :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p2
  :L5
  .line 428
    invoke-interface { p0, p2, v0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  .line 429
    invoke-static { p2 }, Lcom/innioasis/ipp/Queue;->shiftUp(I)V
  :L6
  .line 430
    return p2
  :L7
  .line 431
    move-exception p0
  .line 432
    return p1
  :L8
  .line 420
    return p1
.end method

.method private static newCycle(II)V
  .registers 5
  .line 727
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 728
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 729
    const/4 v0, 0
  :L0
    if-ge v0, p0, :L2
  .line 730
    if-eq v0, p1, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v1
    if-nez v1, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->pendingGuest(I)Z
    move-result v1
    if-nez v1, :L1
    sget-object v1, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 729
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 732
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    sget-object p1, Lcom/innioasis/ipp/Queue;->rnd:Ljava/util/Random;
    invoke-static { p0, p1 }, Ljava/util/Collections;->shuffle(Ljava/util/List;Ljava/util/Random;)V
  .line 733
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result p0
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 734
    return-void
.end method

.method private static newPlaylist(ILjava/util/List;)V
  .registers 3
  .line 929
    sget v0, Lcom/innioasis/ipp/Queue;->kind:I
    if-eq v0, p0, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->dropGuestsFrom(I)V
  :L0
  .line 930
    sput p0, Lcom/innioasis/ipp/Queue;->kind:I
  .line 931
    invoke-static { }, Lcom/innioasis/ipp/Queue;->clearSession()V
  .line 932
    invoke-static { }, Lcom/innioasis/ipp/Queue;->dropStalePlayer()V
  .line 933
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->noteSource(Ljava/util/List;)V
  .line 934
    invoke-static { }, Lcom/innioasis/ipp/Status;->playerOpening()V
  .line 935
    return-void
.end method

.method public static nextPath()Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L6
  .registers 8
  .line 1652
    sget-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1653
    sget v1, Lcom/innioasis/ipp/Queue;->rowManual:I
    sget v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1655
    const/4 v3, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingPath()Ljava/lang/String;
    move-result-object v4
  .line 1656
    invoke-static { }, Lcom/innioasis/ipp/Queue;->upNext()Ljava/util/List;
    move-result-object v5
  .line 1657
    if-eqz v4, :L5
    invoke-interface { v5 }, Ljava/util/List;->size()I
    move-result v6
    const/4 v7, 2
    if-ge v6, v7, :L1
    goto :L5
  :L1
  .line 1658
    const/4 v6, 0
    invoke-interface { v5, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    const/4 v7, 1
    invoke-interface { v5, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 1659
    instance-of v7, v6, Lcom/innioasis/y1/database/Song;
    if-eqz v7, :L4
    check-cast v6, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v4, v6 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L2
    goto :L4
  :L2
  .line 1660
    instance-of v4, v5, Lcom/innioasis/y1/database/Song;
    if-eqz v4, :L3
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  :L3
  .line 1664
    sput-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1665
    sput v1, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 1666
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1660
    return-object v3
  :L4
  .line 1664
    sput-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1665
    sput v1, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 1666
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1659
    return-object v3
  :L5
  .line 1664
    sput-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1665
    sput v1, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 1666
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1657
    return-object v3
  :L6
  .line 1661
    move-exception v4
  .line 1662
    nop
  .line 1664
    sput-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1665
    sput v1, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 1666
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1662
    return-object v3
.end method

.method private static nextSeq(II)I
  .registers 3
  :L0
  .line 743
    add-int/lit8 p1, p1, 1
    if-ge p1, p0, :L1
  .line 744
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v0
    if-nez v0, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->pendingGuest(I)Z
    move-result v0
    if-nez v0, :L0
    return p1
  :L1
  .line 746
    const/4 p0, -1
    return p0
.end method

.method private static nextShuffled(II)I
  .registers 4
  .line 1494
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->popCycle(II)I
    move-result p0
  .line 1495
    if-ltz p0, :L0
    return p0
  :L0
  .line 1496
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result p0
    const/4 p1, -1
    if-nez p0, :L1
    return p1
  :L1
  .line 1497
    invoke-static { }, Lcom/innioasis/ipp/Queue;->dropGuests()V
  .line 1498
    invoke-static { }, Lcom/innioasis/ipp/Queue;->sizeCur()[I
    move-result-object p0
  .line 1499
    const/4 v0, 0
    aget v0, p0, v0
  .line 1500
    const/4 v1, 1
    aget p0, p0, v1
  .line 1501
    if-gtz v0, :L2
    return p1
  :L2
  .line 1502
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->randomOther(II)I
    move-result p0
  .line 1503
    if-gez p0, :L3
    return p1
  :L3
  .line 1504
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->newCycle(II)V
  .line 1505
    return p0
.end method

.method private static noteBuilt(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  :L0
  .line 984
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v0
  .line 985
    if-eqz v0, :L3
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L3
    const/4 v1, 0
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    instance-of v0, v0, Lcom/innioasis/y1/database/Song;
    if-nez v0, :L1
    goto :L3
  :L1
  .line 986
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Queue;->lastList:Ljava/lang/ref/WeakReference;
  :L2
  .line 988
    goto :L5
  :L3
  .line 985
    return-void
  :L4
  .line 987
    move-exception p0
  :L5
  .line 989
    return-void
.end method

.method private static notePass(Ljava/util/ArrayList;)V
  .catchall { :L0 .. :L6 } :L9
  .registers 6
  :L0
  .line 317
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 318
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 319
    if-nez v1, :L2
    return-void
  :L2
  .line 320
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v2
  .line 321
    if-eqz v2, :L8
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L3
    goto :L8
  :L3
  .line 322
    new-instance v3, Lcom/innioasis/ipp/Queue$Pass;
    invoke-direct { v3 }, Lcom/innioasis/ipp/Queue$Pass;-><init>()V
  .line 323
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct { v4, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v4, v3, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
  .line 324
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
    iput v1, v3, Lcom/innioasis/ipp/Queue$Pass;->index:I
  .line 325
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v1, v3, Lcom/innioasis/ipp/Queue$Pass;->spent:Ljava/util/ArrayList;
  .line 326
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
  .line 327
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->plan:Ljava/util/ArrayList;
  .line 328
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->skip:Ljava/util/ArrayList;
  .line 329
    sget v0, Lcom/innioasis/ipp/Queue;->passLen:I
    iput v0, v3, Lcom/innioasis/ipp/Queue$Pass;->passLen:I
  .line 330
    sget v0, Lcom/innioasis/ipp/Queue;->planFor:I
    iput v0, v3, Lcom/innioasis/ipp/Queue$Pass;->planFor:I
  .line 332
    iget-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
  .line 333
    if-lez v0, :L4
    iget-object v1, v3, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
    add-int/lit8 v0, v0, -1
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    iget v2, v3, Lcom/innioasis/ipp/Queue$Pass;->index:I
    if-ne v1, v2, :L4
    iget-object v1, v3, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  :L4
  .line 334
    invoke-virtual { p0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 335
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    const/4 v1, 4
    if-le v0, v1, :L7
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  :L6
    goto :L5
  :L7
  .line 337
    goto :L10
  :L8
  .line 321
    return-void
  :L9
  .line 336
    move-exception p0
  :L10
  .line 338
    return-void
.end method

.method private static notePlayerToDrop(Ljava/util/List;)V
  .registers 4
  .line 1097
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
  .line 1098
    const/4 v0, 0
  :L0
    if-eqz p0, :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 1099
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 1100
    instance-of v2, v1, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v2, :L1
  .line 1101
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
  .line 1102
    return-void
  :L1
  .line 1098
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 1105
    return-void
.end method

.method public static noteReopen(Ljava/util/List;I)Z
  .registers 4
  .line 1330
    nop
  .line 1331
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  .line 1332
    invoke-static { }, Lcom/innioasis/ipp/Queue;->atSource()Z
    move-result v1
    if-eqz v1, :L0
    if-eqz p0, :L0
    if-ltz p1, :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge p1, v1, :L0
  .line 1333
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 1334
    instance-of p1, p0, Lcom/innioasis/y1/database/Song;
    if-eqz p1, :L0
  .line 1335
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingMusicPath()Ljava/lang/String;
    move-result-object p1
  .line 1336
    if-eqz p1, :L0
  .line 1337
    check-cast p0, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
  .line 1338
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  :L0
  .line 1342
    return v0
.end method

.method private static noteSource(Ljava/util/List;)V
  .catchall { :L0 .. :L14 } :L15
  .registers 7
  .line 1032
    const-string v0, ""
    const/4 v1, 1
    const/4 v2, 0
    const/4 v3, 0
  :L0
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object v4
  .line 1033
    instance-of v5, v4, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz v5, :L1
    move-object v5, v4
    check-cast v5, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { v5 }, Lcom/innioasis/y1/base/BaseActivity;->getStateBarLeftText()Ljava/lang/String;
    move-result-object v5
    goto :L2
  :L1
    move-object v5, v3
  :L2
  .line 1034
    if-nez v5, :L3
    move-object v5, v0
  :L3
    sput-object v5, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1035
    invoke-static { v4 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v5
    sput-object v5, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1036
    invoke-static { v4, p0 }, Lcom/innioasis/ipp/Queue;->ordered(Landroid/app/Activity;Ljava/util/List;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
  .line 1038
    if-eqz v4, :L5
    sget-object p0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-nez p0, :L4
    goto :L5
  :L4
    new-instance p0, Landroid/content/Intent;
    invoke-virtual { v4 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v5
    invoke-direct { p0, v5 }, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
    goto :L6
  :L5
    move-object p0, v3
  :L6
    sput-object p0, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
  .line 1040
    if-eqz v4, :L8
    sget-object p0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-nez p0, :L7
    goto :L8
  :L7
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, v4 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    goto :L9
  :L8
    move-object p0, v3
  :L9
    sput-object p0, Lcom/innioasis/ipp/Queue;->srcAct:Ljava/lang/ref/WeakReference;
  .line 1042
    instance-of p0, v4, Lcom/innioasis/music/AlbumsActivity;
    if-eqz p0, :L10
  .line 1043
    sget-object p0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->levelFor(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    goto :L11
  :L10
    move-object p0, v3
  :L11
    sput-object p0, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
  .line 1044
    instance-of p0, v4, Lcom/innioasis/music/GenresActivity;
    if-eqz p0, :L12
    sget-object p0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1045
    invoke-static { p0 }, Lcom/innioasis/ipp/Genres;->levelFor(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L12
    const/4 p0, 1
    goto :L13
  :L12
    const/4 p0, 0
  :L13
    sput-boolean p0, Lcom/innioasis/ipp/Queue;->srcGenre:Z
  :L14
  .line 1054
    goto :L16
  :L15
  .line 1046
    move-exception p0
  .line 1047
    sput-object v0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1048
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1049
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
  .line 1050
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcAct:Ljava/lang/ref/WeakReference;
  .line 1051
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
  .line 1052
    sput-boolean v2, Lcom/innioasis/ipp/Queue;->srcGenre:Z
  .line 1053
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
  :L16
  .line 1055
    return-void
.end method

.method public static onNewBookPlaylist(Ljava/util/List;)V
  .registers 2
  .line 923
    const/4 v0, 1
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->newPlaylist(ILjava/util/List;)V
  .line 924
    return-void
.end method

.method public static onNewPlaylist(Ljava/util/List;)V
  .registers 2
  .line 915
    const/4 v0, 0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->newPlaylist(ILjava/util/List;)V
  .line 916
    return-void
.end method

.method public static onShuffleChanged()V
  .catch Ljava/lang/Exception; { :L0 .. :L4 } :L5
  .registers 2
  :L0
  .line 781
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 782
    if-nez v0, :L1
    return-void
  :L1
  .line 783
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 784
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 785
    if-nez v1, :L2
    const/4 v1, 0
    goto :L3
  :L2
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  :L3
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  :L4
  .line 787
    goto :L6
  :L5
  .line 786
    move-exception v0
  :L6
  .line 788
    return-void
.end method

.method public static openSource(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L12 } :L14
  .registers 6
  .line 1248
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1249
    if-eqz p0, :L13
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    if-nez v1, :L1
    goto :L13
  :L1
  .line 1250
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcAct:Ljava/lang/ref/WeakReference;
    if-nez v1, :L2
    const/4 v1, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/app/Activity;
  :L3
  .line 1251
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getActivityList()Ljava/util/List;
    move-result-object v2
  .line 1252
    nop
  .line 1253
    const/4 v3, 0
  :L4
    if-eqz v2, :L6
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L6
  .line 1254
    invoke-interface { v2, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    if-ne v4, v1, :L5
    invoke-static { v1 }, Lcom/blankj/utilcode/util/ActivityUtils;->isActivityAlive(Landroid/app/Activity;)Z
    move-result v3
    goto :L7
  :L5
  .line 1253
    add-int/lit8 v3, v3, 1
    goto :L4
  :L6
  .line 1256
    const/4 v3, 0
  :L7
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->notePlayerToDrop(Ljava/util/List;)V
  .line 1258
    new-instance v2, Landroid/content/Intent;
    sget-object v4, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    invoke-direct { v2, v4 }, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
  .line 1259
    const/4 v4, 1
    if-eqz v3, :L8
  .line 1260
    const/high16 v3, 0x00020000
    invoke-virtual { v2, v3 }, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
  .line 1261
    invoke-static { }, Lcom/innioasis/ipp/Follow;->armPending()V
  .line 1262
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 1263
    invoke-static { v1 }, Lcom/innioasis/ipp/Follow;->toPlaying(Landroid/app/Activity;)V
  .line 1264
    return v4
  :L8
  .line 1266
    const/high16 v1, 0x24000000
    invoke-virtual { v2, v1 }, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
  .line 1267
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
    if-eqz v1, :L9
  .line 1268
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingPath()Ljava/lang/String;
    move-result-object v3
    invoke-static { v2, v1, v3 }, Lcom/innioasis/ipp/Albums;->restore(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V
    goto :L11
  :L9
  .line 1269
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcGenre:Z
    if-eqz v1, :L10
  .line 1270
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Genres;->restore(Landroid/content/Intent;Ljava/lang/String;)V
    goto :L11
  :L10
  .line 1272
    invoke-static { }, Lcom/innioasis/ipp/Follow;->armPending()V
  :L11
  .line 1274
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L12
  .line 1275
    return v4
  :L13
  .line 1249
    return v0
  :L14
  .line 1276
    move-exception p0
  .line 1277
    return v0
.end method

.method private static ordered(Landroid/app/Activity;Ljava/util/List;)Z
  .catchall { :L0 .. :L9 } :L14
  .registers 8
  .line 1060
    const/4 v0, 1
    if-eqz p0, :L15
    if-eqz p1, :L15
  :L0
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L15
  :L1
  .line 1061
    sget-object v1, Lcom/innioasis/ipp/Queue;->lastList:Ljava/lang/ref/WeakReference;
  .line 1062
    if-nez v1, :L2
    const/4 v1, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L3
  .line 1063
    instance-of v2, v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v2, :L4
    return v0
  :L4
  .line 1064
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 1065
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v2
    if-eq v2, p0, :L5
    return v0
  :L5
  .line 1066
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object p0
  .line 1067
    if-eqz p0, :L13
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v2
    if-eq v1, v2, :L6
    goto :L13
  :L6
  .line 1068
    const/4 v1, 0
    const/4 v2, 0
  :L7
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L12
  .line 1069
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 1070
    instance-of v5, v3, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L11
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L8
    goto :L11
  :L8
  .line 1071
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    check-cast v4, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Queue;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v3
  :L9
    if-nez v3, :L10
    return v1
  :L10
  .line 1068
    add-int/lit8 v2, v2, 1
    goto :L7
  :L11
  .line 1070
    return v0
  :L12
  .line 1073
    return v0
  :L13
  .line 1067
    return v0
  :L14
  .line 1074
    move-exception p0
  .line 1075
    return v0
  :L15
  .line 1060
    return v0
.end method

.method private static pastRestartPoint(Lcom/innioasis/y1/service/PlayerService;)Z
  .catchall { :L0 .. :L3 } :L5
  .registers 8
  .line 845
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayerIsPrepared()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 846
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getDuration()J
    move-result-wide v1
  .line 847
    const-wide/16 v3, 0
    cmp-long v5, v1, v3
    if-gtz v5, :L2
    return v0
  :L2
  .line 848
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getCurrentPosition()J
    move-result-wide v3
  :L3
  .line 849
    const-wide/16 v5, 4000
    cmp-long p0, v3, v5
    if-ltz p0, :L4
    cmp-long p0, v3, v1
    if-gtz p0, :L4
    const/4 v0, 1
  :L4
    return v0
  :L5
  .line 850
    move-exception p0
  .line 851
    return v0
.end method

.method private static pendingBefore(I)I
  .registers 5
  .line 399
    nop
  .line 400
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v0, v3, :L2
  .line 401
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 402
    if-ltz v2, :L1
    if-ge v2, p0, :L1
    add-int/lit8 v1, v1, 1
  :L1
  .line 400
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 404
    return v1
.end method

.method private static pendingGuest(I)Z
  .registers 2
  .line 394
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->has(Ljava/util/ArrayList;I)Z
    move-result p0
    return p0
.end method

.method public static playRow(I)V
  .catch Ljava/lang/Exception; { :L0 .. :L10 } :L14
  .registers 6
  :L0
  .line 1711
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 1712
    if-eqz v0, :L13
    if-gez p0, :L1
    goto :L13
  :L1
  .line 1713
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1714
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 1715
    if-eqz v1, :L12
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L2
    goto :L12
  :L2
  .line 1716
    if-nez p0, :L3
    return-void
  :L3
  .line 1718
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
  .line 1719
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v3
    if-eqz v3, :L5
  .line 1720
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->pushHist(I)V
  .line 1721
    add-int/lit8 p0, p0, -1
    invoke-static { v1, p0, v2 }, Lcom/innioasis/ipp/Queue;->takeManual(Ljava/util/List;II)I
    move-result p0
  .line 1722
    if-gez p0, :L4
    return-void
  :L4
  .line 1723
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 1724
    goto :L9
  :L5
  .line 1725
    sget-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    array-length v4, v3
    if-lt p0, v4, :L6
    return-void
  :L6
  .line 1726
    aget p0, v3, p0
  .line 1727
    if-ltz p0, :L11
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p0, v1, :L7
    goto :L11
  :L7
  .line 1728
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->pushHist(I)V
  .line 1729
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->resume:I
  .line 1730
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v1
    if-eqz v1, :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropPlanThrough(I)V
  :L8
  .line 1731
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L9
  .line 1733
    const/4 p0, 0
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/service/PlayerService;->restartPlay(Z)V
  :L10
  .line 1735
    goto :L15
  :L11
  .line 1727
    return-void
  :L12
  .line 1715
    return-void
  :L13
  .line 1712
    return-void
  :L14
  .line 1734
    move-exception p0
  :L15
  .line 1736
    return-void
.end method

.method private static playingMusicPath()Ljava/lang/String;
  .registers 2
  .line 1317
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 1318
    const/4 v1, 0
    if-nez v0, :L0
  .line 1319
    return-object v1
  :L0
  .line 1321
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 1322
    if-nez v0, :L1
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L2
    return-object v1
.end method

.method private static playingPath()Ljava/lang/String;
  .catchall { :L0 .. :L4 } :L5
  .registers 2
  .line 1383
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 1384
    if-nez v1, :L1
    move-object v1, v0
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L2
  .line 1385
    if-nez v1, :L3
    goto :L4
  :L3
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  :L4
    return-object v0
  :L5
  .line 1386
    move-exception v1
  .line 1387
    return-object v0
.end method

.method private static popCycle(II)I
  .registers 4
  .line 873
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->ensureCycle(II)V
  :L0
  .line 874
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 875
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Integer;
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  .line 876
    if-eq v0, p1, :L1
    if-ltz v0, :L1
    if-ge v0, p0, :L1
    return v0
  :L1
  .line 877
    goto :L0
  :L2
  .line 878
    const/4 p0, -1
    return p0
.end method

.method public static prevAction(Lcom/innioasis/y1/service/PlayerService;)I
  .catch Ljava/lang/Exception; { :L0 .. :L12 } :L14
  .registers 9
  .line 1526
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 1527
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1528
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 1529
    if-eqz v1, :L13
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L1
    goto/16 :L13
  :L1
  .line 1530
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
  .line 1531
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v3
  .line 1532
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 1534
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->pastRestartPoint(Lcom/innioasis/y1/service/PlayerService;)Z
    move-result v4
    if-eqz v4, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L2
  .line 1536
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v4
    const/4 v5, -1
    const/4 v6, 1
    if-eqz v4, :L8
  .line 1538
    sget v1, Lcom/innioasis/ipp/Queue;->passLen:I
    sget-object v4, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v7
    sub-int/2addr v1, v7
    if-gt v1, v6, :L3
    sget-object v1, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Queue;->restorePass(Lcom/innioasis/y1/service/PlayerService;Ljava/util/ArrayList;Z)Z
    move-result v1
    if-eqz v1, :L3
    return v6
  :L3
  .line 1540
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v7
    if-eqz v7, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L4
  .line 1541
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v7
    sub-int/2addr v7, v6
    invoke-virtual { v1, v7 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  .line 1542
    if-ltz v1, :L7
    if-lt v1, v2, :L5
    goto :L7
  :L5
  .line 1543
    invoke-static { v3, v1, v2 }, Lcom/innioasis/ipp/Queue;->putBackInPlan(III)V
  .line 1544
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v3
    sget v7, Lcom/innioasis/ipp/Queue;->passLen:I
    if-lt v3, v7, :L6
  .line 1546
    invoke-virtual { v4 }, Ljava/util/ArrayList;->clear()V
  .line 1547
    sput v2, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 1548
    sput v2, Lcom/innioasis/ipp/Queue;->passLen:I
  :L6
  .line 1550
    sput v5, Lcom/innioasis/ipp/Queue;->resume:I
  .line 1551
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 1552
    return v6
  :L7
  .line 1542
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L8
  .line 1555
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->prevSeq(I)I
    move-result v2
  .line 1556
    if-gez v2, :L11
  .line 1557
    sget-object v2, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
    invoke-static { p0, v2, v0 }, Lcom/innioasis/ipp/Queue;->restorePass(Lcom/innioasis/y1/service/PlayerService;Ljava/util/ArrayList;Z)Z
    move-result v2
    if-eqz v2, :L9
    return v6
  :L9
  .line 1558
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result v2
    if-nez v2, :L10
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L10
  .line 1561
    sget-object v2, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->notePass(Ljava/util/ArrayList;)V
  .line 1562
    invoke-static { }, Lcom/innioasis/ipp/Queue;->stripGuests()V
  .line 1563
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  .line 1564
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->prevSeq(I)I
    move-result v2
  .line 1565
    if-gez v2, :L11
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L11
  .line 1567
    sput v5, Lcom/innioasis/ipp/Queue;->resume:I
  .line 1568
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L12
  .line 1569
    return v6
  :L13
  .line 1529
    return v0
  :L14
  .line 1570
    move-exception p0
  .line 1571
    return v0
.end method

.method private static prevSeq(I)I
  .registers 2
  .line 751
    add-int/lit8 p0, p0, -1
  :L0
    if-ltz p0, :L2
  .line 752
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v0
    if-nez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->pendingGuest(I)Z
    move-result v0
    if-nez v0, :L1
    return p0
  :L1
  .line 751
    add-int/lit8 p0, p0, -1
    goto :L0
  :L2
  .line 754
    const/4 p0, -1
    return p0
.end method

.method private static pushHist(I)V
  .registers 2
  .line 905
    if-gez p0, :L0
    return-void
  :L0
  .line 906
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 907
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 908
    return-void
.end method

.method private static putBackInPlan(III)V
  .registers 4
  .line 1580
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 1581
    if-ltz p0, :L4
    if-ge p0, p2, :L4
    if-ne p0, p1, :L1
    goto :L4
  :L1
  .line 1582
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result p1
    if-eqz p1, :L2
    return-void
  :L2
  .line 1583
    sget p1, Lcom/innioasis/ipp/Queue;->planFor:I
    if-eq p1, p2, :L3
    return-void
  :L3
  .line 1584
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropFromPlan(I)V
  .line 1585
    sget-object p1, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    const/4 p2, 0
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { p1, p2, p0 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 1586
    return-void
  :L4
  .line 1581
    return-void
.end method

.method private static queued(I)Z
  .registers 2
  .line 438
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->has(Ljava/util/ArrayList;I)Z
    move-result v0
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->has(Ljava/util/ArrayList;I)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method private static randomOther(II)I
  .registers 5
  .line 1510
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1511
    const/4 v1, 0
  :L0
    if-ge v1, p0, :L2
  .line 1512
    if-eq v1, p1, :L1
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v2
    if-nez v2, :L1
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->pendingGuest(I)Z
    move-result v2
    if-nez v2, :L1
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 1511
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 1514
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-eqz p0, :L3
    const/4 p0, -1
    return p0
  :L3
  .line 1515
    sget-object p0, Lcom/innioasis/ipp/Queue;->rnd:Ljava/util/Random;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result p1
    invoke-virtual { p0, p1 }, Ljava/util/Random;->nextInt(I)I
    move-result p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
    return p0
.end method

.method private static refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .registers 2
  .line 373
    invoke-virtual { p0 }, Ljava/util/ArrayList;->clear()V
  .line 374
    if-eqz p1, :L0
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
  :L0
  .line 375
    return-void
.end method

.method public static relist(Ljava/lang/Object;)V
  .catchall { :L0 .. :L15 } :L20
  .registers 7
  :L0
  .line 946
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L1
    return-void
  :L1
  .line 947
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->noteBuilt(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 948
    sget-object v0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-eqz v0, :L19
    sget-boolean v0, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
    if-nez v0, :L2
    goto/16 :L19
  :L2
  .line 949
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 950
    if-nez v0, :L3
    return-void
  :L3
  .line 951
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 952
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 953
    if-eqz v1, :L18
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L4
    goto/16 :L18
  :L4
  .line 954
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
  .line 955
    if-ltz v2, :L17
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v2, v3, :L5
    goto :L17
  :L5
  .line 956
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 957
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-nez v3, :L6
    return-void
  :L6
  .line 959
    move-object v3, p0
    check-cast v3, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v3
  .line 960
    if-eqz v3, :L16
    invoke-interface { v3 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-nez v4, :L16
    const/4 v4, 0
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    instance-of v5, v5, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L7
    goto :L16
  :L7
  .line 961
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->sameOrder(Ljava/util/List;Ljava/util/List;)Z
    move-result v1
    if-eqz v1, :L8
    return-void
  :L8
  .line 962
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->fromSource(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L9
    return-void
  :L9
  .line 964
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 965
    nop
  .line 966
    nop
  :L10
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v4, v1, :L12
  .line 967
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 968
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L11
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Queue;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L11
    goto :L13
  :L11
  .line 966
    add-int/lit8 v4, v4, 1
    goto :L10
  :L12
    const/4 v4, -1
  :L13
  .line 970
    if-gez v4, :L14
    return-void
  :L14
  .line 973
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->setList(Lcom/innioasis/y1/service/PlayerService;Ljava/util/List;)V
  .line 974
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  .line 976
    invoke-static { }, Lcom/innioasis/ipp/Queue;->clearSession()V
  :L15
  .line 978
    goto :L21
  :L16
  .line 960
    return-void
  :L17
  .line 955
    return-void
  :L18
  .line 953
    return-void
  :L19
  .line 948
    return-void
  :L20
  .line 977
    move-exception p0
  :L21
  .line 979
    return-void
.end method

.method public static removeRow(I)V
  .registers 3
  .line 1677
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v0
    if-eqz v0, :L1
  .line 1678
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    add-int/lit8 p0, p0, -1
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 1679
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  .line 1680
    if-ltz p0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropGuest(I)V
  :L0
  .line 1681
    return-void
  :L1
  .line 1683
    if-lez p0, :L4
    sget-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    array-length v1, v0
    if-lt p0, v1, :L2
    goto :L4
  :L2
  .line 1684
    aget p0, v0, p0
  .line 1685
    if-gez p0, :L3
    return-void
  :L3
  .line 1686
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1687
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropFromPlan(I)V
  .line 1688
    return-void
  :L4
  .line 1683
    return-void
.end method

.method private static repeatAll()Z
  .registers 2
  .line 718
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 719
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v1
    if-eqz v1, :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getAudiobookRepeatMode()I
    move-result v0
    goto :L1
  :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getMusicRepeatMode()I
    move-result v0
  :L1
    const/4 v1, 2
    if-ne v0, v1, :L2
    const/4 v0, 1
    goto :L3
  :L2
    const/4 v0, 0
  :L3
    return v0
.end method

.method private static restorePass(Lcom/innioasis/y1/service/PlayerService;Ljava/util/ArrayList;Z)Z
  .catchall { :L0 .. :L7 } :L10
  .registers 8
  .line 346
    const/4 v0, 0
  :L0
    invoke-virtual { p1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L9
    if-nez p0, :L1
    goto :L9
  :L1
  .line 347
    invoke-virtual { p1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
    invoke-virtual { p1, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/ipp/Queue$Pass;
  .line 348
    if-eqz p1, :L8
    iget-object v1, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    if-eqz v1, :L8
    iget-object v1, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L2
    goto :L8
  :L2
  .line 349
    new-instance v1, Ljava/util/ArrayList;
    iget-object v3, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-direct { v1, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Queue;->setList(Lcom/innioasis/y1/service/PlayerService;Ljava/util/List;)V
  .line 350
    sget-object v1, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    iget-object v3, p1, Lcom/innioasis/ipp/Queue$Pass;->spent:Ljava/util/ArrayList;
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 351
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    iget-object v3, p1, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 352
    sget-object v3, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    iget-object v4, p1, Lcom/innioasis/ipp/Queue$Pass;->plan:Ljava/util/ArrayList;
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 353
    sget-object v3, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    iget-object v4, p1, Lcom/innioasis/ipp/Queue$Pass;->skip:Ljava/util/ArrayList;
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 354
    iget v3, p1, Lcom/innioasis/ipp/Queue$Pass;->passLen:I
    sput v3, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 355
    iget v3, p1, Lcom/innioasis/ipp/Queue$Pass;->planFor:I
    sput v3, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 356
    const/4 v3, -1
    sput v3, Lcom/innioasis/ipp/Queue;->resume:I
  .line 358
    if-eqz p2, :L3
  .line 359
    invoke-virtual { v1 }, Ljava/util/ArrayList;->clear()V
  .line 360
    iget-object p2, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-virtual { p2 }, Ljava/util/ArrayList;->size()I
    move-result p2
    invoke-static { p2, v3 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result p2
    goto :L4
  :L3
  .line 362
    iget p2, p1, Lcom/innioasis/ipp/Queue$Pass;->index:I
  :L4
  .line 364
    if-ltz p2, :L5
    iget-object p1, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-virtual { p1 }, Ljava/util/ArrayList;->size()I
    move-result p1
    if-lt p2, p1, :L6
  :L5
    const/4 p2, 0
  :L6
  .line 365
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L7
  .line 366
    return v2
  :L8
  .line 348
    return v0
  :L9
  .line 346
    return v0
  :L10
  .line 367
    move-exception p0
  .line 368
    return v0
.end method

.method private static sameOrder(Ljava/util/List;Ljava/util/List;)Z
  .registers 8
  .line 993
    nop
  .line 994
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v1, v3, :L7
  .line 995
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->queued(I)Z
    move-result v3
    if-eqz v3, :L1
    goto :L5
  :L1
  .line 996
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v2, v3, :L2
    return v0
  :L2
  .line 997
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    add-int/lit8 v4, v2, 1
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 998
    instance-of v5, v3, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L6
    instance-of v5, v2, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L3
    goto :L6
  :L3
  .line 999
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { v3, v2 }, Lcom/innioasis/ipp/Queue;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L4
    return v0
  :L4
    move v2, v4
  :L5
  .line 994
    add-int/lit8 v1, v1, 1
    goto :L0
  :L6
  .line 998
    return v0
  :L7
  .line 1001
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result p0
    if-ne v2, p0, :L8
    const/4 v0, 1
  :L8
    return v0
.end method

.method public static saveSource(Lcom/innioasis/y1/service/PlayerService;)V
  .catchall { :L0 .. :L3 } :L12
  .catchall { :L4 .. :L11 } :L12
  .registers 5
  :L0
  .line 1144
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v0
  .line 1145
    if-nez v0, :L1
    return-void
  :L1
  .line 1146
    invoke-interface { v0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
  .line 1147
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    if-nez v1, :L2
    const/4 p0, 0
    goto :L3
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->listSig(Lcom/innioasis/y1/service/PlayerService;)Ljava/lang/String;
    move-result-object p0
  :L3
  .line 1148
    const-string v1, "src_sig"
    const-string v2, ""
    if-nez p0, :L5
  :L4
  .line 1149
    invoke-interface { v0, v1, v2 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    goto :L10
  :L5
  .line 1151
    invoke-interface { v0, v1, p0 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1152
    const-string p0, "src_key"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-nez v1, :L6
    move-object v1, v2
  :L6
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1153
    const-string p0, "src_name"
    sget-object v1, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
    if-nez v1, :L7
    move-object v1, v2
  :L7
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1154
    const-string p0, "src_uri"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    const/4 v3, 0
    invoke-virtual { v1, v3 }, Landroid/content/Intent;->toUri(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1155
    const-string p0, "src_uuid"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->uuidExtras(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1156
    const-string p0, "src_level"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
    if-nez v1, :L8
    goto :L9
  :L8
    move-object v2, v1
  :L9
    invoke-interface { v0, p0, v2 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1157
    const-string p0, "src_genre"
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcGenre:Z
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  .line 1158
    const-string p0, "src_ordered"
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  :L10
  .line 1160
    invoke-interface { v0 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L11
  .line 1162
    goto :L13
  :L12
  .line 1161
    move-exception p0
  :L13
  .line 1163
    return-void
.end method

.method private static screenKind(Landroid/content/Context;)I
  .catchall { :L0 .. :L3 } :L6
  .registers 5
  .line 626
    const/4 v0, 0
  :L0
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    return v0
  :L1
  .line 627
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v1
  .line 628
    const-string v2, ".AllAudiobooksActivity"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    const/4 v3, 1
    if-eqz v2, :L2
    return v3
  :L2
  .line 630
    const-string v2, ".FilesActivity"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L5
  .line 631
    check-cast p0, Landroid/app/Activity;
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "now_path"
    invoke-virtual { p0, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 632
    if-eqz p0, :L5
    const-string v1, "/storage/sdcard0/Audiobooks"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L4
    const-string v1, "/storage/sdcard0/audiobooks"
  .line 633
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
  :L3
    if-eqz p0, :L5
  :L4
  .line 634
    return v3
  :L5
  .line 638
    goto :L7
  :L6
  .line 637
    move-exception p0
  :L7
  .line 639
    return v0
.end method

.method private static seqNo(I)I
  .registers 2
  .line 409
    add-int/lit8 v0, p0, 1
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->pendingBefore(I)I
    move-result p0
    sub-int/2addr v0, p0
  .line 410
    const/4 p0, 1
    if-ge v0, p0, :L0
    const/4 v0, 1
  :L0
    return v0
.end method

.method private static setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  .registers 3
  .line 142
    if-nez p0, :L0
    return-void
  :L0
  .line 143
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
    if-eqz v0, :L1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setAudiobookIndex(I)V
    goto :L2
  :L1
  .line 144
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setMusicIndex(I)V
  :L2
  .line 145
    return-void
.end method

.method private static setList(Lcom/innioasis/y1/service/PlayerService;Ljava/util/List;)V
  .registers 3
  .line 148
    if-eqz p0, :L3
    if-nez p1, :L0
    goto :L3
  :L0
  .line 149
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
    if-eqz v0, :L1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setAudiobookList(Ljava/util/List;)V
    goto :L2
  :L1
  .line 150
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setMusicList(Ljava/util/List;)V
  :L2
  .line 151
    return-void
  :L3
  .line 148
    return-void
.end method

.method private static shiftDown(I)V
  .registers 4
  .line 467
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    add-int/lit8 v1, p0, 1
    const/4 v2, -1
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 468
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 469
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 470
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 471
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 472
    sget v0, Lcom/innioasis/ipp/Queue;->resume:I
    if-le v0, p0, :L0
    add-int/lit8 v0, v0, -1
    sput v0, Lcom/innioasis/ipp/Queue;->resume:I
  :L0
  .line 473
    sget p0, Lcom/innioasis/ipp/Queue;->planFor:I
    if-lez p0, :L1
    add-int/lit8 p0, p0, -1
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  :L1
  .line 474
    return-void
.end method

.method private static shiftUp(I)V
  .registers 3
  .line 456
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    const/4 v1, 1
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 457
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 458
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 459
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 460
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 461
    sget v0, Lcom/innioasis/ipp/Queue;->resume:I
    if-lt v0, p0, :L0
    add-int/2addr v0, v1
    sput v0, Lcom/innioasis/ipp/Queue;->resume:I
  :L0
  .line 462
    sget p0, Lcom/innioasis/ipp/Queue;->planFor:I
    if-ltz p0, :L1
    add-int/2addr p0, v1
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  :L1
  .line 463
    return-void
.end method

.method private static shuffle()Z
  .registers 2
  .line 154
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 155
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v1
    if-eqz v1, :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getAudiobookIsShuffle()Z
    move-result v0
    goto :L1
  :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getMusicIsShuffle()Z
    move-result v0
  :L1
    return v0
.end method

.method private static sizeCur()[I
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 379
    const/4 v0, -1
    const/4 v1, 0
    filled-new-array { v1, v0 }, [I
    move-result-object v0
  :L0
  .line 381
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v2
  .line 382
    if-nez v2, :L1
    return-object v0
  :L1
  .line 383
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v3
  .line 384
    if-nez v3, :L2
    return-object v0
  :L2
  .line 385
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    aput v3, v0, v1
  .line 386
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
    const/4 v2, 1
    aput v1, v0, v2
  :L3
  .line 388
    goto :L5
  :L4
  .line 387
    move-exception v1
  :L5
  .line 389
    return-object v0
.end method

.method private static skipped(I)Z
  .registers 2
  .line 738
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method public static source()Ljava/lang/String;
  .registers 1
  .line 1022
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1023
    sget-object v0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
    if-nez v0, :L0
    const-string v0, ""
  :L0
    return-object v0
.end method

.method private static stopAtEnd(Lcom/innioasis/y1/service/PlayerService;)I
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 858
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
    if-eqz v0, :L1
    const/16 v0, 10
    goto :L2
  :L1
    const/16 v0, 9
  :L2
    const/4 v1, 1
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->pause(IZ)V
  .line 859
    const-wide/16 v0, 0
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setCurrentPosition(J)V
  :L3
  .line 861
    goto :L5
  :L4
  .line 860
    move-exception p0
  :L5
  .line 862
    const/4 p0, 2
    return p0
.end method

.method private static stripGuests()V
  .catchall { :L0 .. :L9 } :L11
  .registers 7
  :L0
  .line 276
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 277
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 278
    if-nez v1, :L2
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
    return-void
  :L2
  .line 279
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v2
  .line 280
    if-nez v2, :L3
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
    return-void
  :L3
  .line 281
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-nez v0, :L10
  .line 282
    nop
  .line 283
    const/4 v0, -1
    const/4 v3, 0
    const/4 v3, -1
    const/4 v4, 0
  :L4
    sget-object v5, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v4, v6, :L6
  .line 284
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/Integer;
    invoke-virtual { v5 }, Ljava/lang/Integer;->intValue()I
    move-result v5
  .line 285
    if-le v5, v3, :L5
    move v0, v4
    move v3, v5
  :L5
  .line 283
    add-int/lit8 v4, v4, 1
    goto :L4
  :L6
  .line 287
    invoke-virtual { v5, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 288
    if-ltz v3, :L3
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v0
    if-lt v3, v0, :L7
    goto :L3
  :L7
  .line 289
    invoke-interface { v2, v3 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 290
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v0
  .line 292
    if-le v0, v3, :L8
    add-int/lit8 v0, v0, -1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Queue;->setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  :L8
  .line 293
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->shiftDown(I)V
  :L9
  .line 294
    goto :L3
  :L10
  .line 296
    goto :L12
  :L11
  .line 295
    move-exception v0
  :L12
  .line 297
    return-void
.end method

.method private static svc()Lcom/innioasis/y1/service/PlayerService;
  .registers 1
  .line 109
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
    return-object v0
.end method

.method private static syncKind()V
  .registers 2
  .line 160
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
  .line 161
    sget v1, Lcom/innioasis/ipp/Queue;->kind:I
    if-ne v0, v1, :L0
    return-void
  :L0
  .line 162
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->dropGuestsFrom(I)V
  .line 163
    sput v0, Lcom/innioasis/ipp/Queue;->kind:I
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/Queue;->clearSession()V
  .line 165
    return-void
.end method

.method private static syncShuffle(II)V
  .registers 5
  .line 762
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v0
  .line 763
    sget v1, Lcom/innioasis/ipp/Queue;->lastShuffle:I
    if-ne v1, v0, :L0
    return-void
  :L0
  .line 764
    const/4 v2, 1
    if-gez v1, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 765
    sput v0, Lcom/innioasis/ipp/Queue;->lastShuffle:I
  .line 766
    if-eqz v1, :L3
    return-void
  :L3
  .line 767
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->clear()V
  .line 768
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->resume:I
  .line 769
    if-ne v0, v2, :L4
  .line 770
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->newCycle(II)V
    goto :L5
  :L4
  .line 772
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->clear()V
  .line 773
    sput v1, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 774
    sput v2, Lcom/innioasis/ipp/Queue;->passLen:I
  :L5
  .line 776
    return-void
.end method

.method private static takeManual(Ljava/util/List;II)I
  .registers 5
  .line 1408
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1409
    sget-object v1, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v1, p1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/Integer;
    invoke-virtual { p1 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  .line 1410
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Queue;->guestAt(Ljava/util/List;ILcom/innioasis/y1/database/Song;)I
    move-result p1
  .line 1411
    if-ltz p1, :L1
  .line 1412
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Queue;->moveGuest(Ljava/util/List;II)I
    move-result p0
  .line 1413
    sget-object p1, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1415
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result p1
    if-eqz p1, :L0
    sget p1, Lcom/innioasis/ipp/Queue;->planFor:I
    if-ltz p1, :L0
    sget p1, Lcom/innioasis/ipp/Queue;->passLen:I
    add-int/lit8 p1, p1, 1
    sput p1, Lcom/innioasis/ipp/Queue;->passLen:I
  :L0
  .line 1416
    return p0
  :L1
  .line 1419
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Queue;->indexOf(Ljava/util/List;Lcom/innioasis/y1/database/Song;)I
    move-result p1
  .line 1420
    if-gez p1, :L3
  .line 1421
    invoke-interface { p0, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 1422
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p1
    add-int/lit8 p1, p1, -1
  .line 1423
    sget p2, Lcom/innioasis/ipp/Queue;->planFor:I
    if-ltz p2, :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  :L2
  .line 1424
    sget-object p0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p2
    invoke-virtual { p0, p2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L5
  :L3
  .line 1426
    sget p0, Lcom/innioasis/ipp/Queue;->resume:I
    if-gez p0, :L4
    sput p2, Lcom/innioasis/ipp/Queue;->resume:I
  :L4
  .line 1428
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result p0
    if-eqz p0, :L5
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->dropFromPlan(I)V
  :L5
  .line 1430
    return p1
.end method

.method public static takeNext(Lcom/innioasis/y1/service/PlayerService;)I
  .catch Ljava/lang/Exception; { :L0 .. :L12 } :L14
  .registers 9
  .line 1441
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 1442
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1443
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 1444
    if-eqz v1, :L13
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L1
    goto/16 :L13
  :L1
  .line 1445
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
  .line 1446
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v3
  .line 1447
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 1448
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v4
  .line 1449
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->pushHist(I)V
  .line 1451
    sget-object v5, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v5
    const/4 v6, 1
    if-nez v5, :L3
  .line 1452
    invoke-static { v1, v0, v3 }, Lcom/innioasis/ipp/Queue;->takeManual(Ljava/util/List;II)I
    move-result v1
  .line 1453
    if-gez v1, :L2
    return v0
  :L2
  .line 1454
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 1455
    return v6
  :L3
  .line 1458
    nop
  .line 1459
    sget v5, Lcom/innioasis/ipp/Queue;->resume:I
    const/4 v7, -1
    if-ltz v5, :L6
  .line 1460
    nop
  .line 1461
    sput v7, Lcom/innioasis/ipp/Queue;->resume:I
  .line 1462
    if-ltz v5, :L5
    if-lt v5, v2, :L4
    goto :L5
  :L4
    move v3, v5
    goto :L6
  :L5
    const/4 v3, 0
  :L6
  .line 1465
    if-eqz v4, :L8
  .line 1466
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->nextShuffled(II)I
    move-result v1
  .line 1467
    if-gez v1, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->stopAtEnd(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L7
  .line 1468
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 1469
    return v6
  :L8
  .line 1472
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v2
  .line 1473
    if-gez v2, :L11
  .line 1474
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result v2
    if-nez v2, :L9
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->stopAtEnd(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L9
  .line 1476
    sget-object v2, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
    invoke-static { p0, v2, v6 }, Lcom/innioasis/ipp/Queue;->restorePass(Lcom/innioasis/y1/service/PlayerService;Ljava/util/ArrayList;Z)Z
    move-result v2
    if-eqz v2, :L10
    return v6
  :L10
  .line 1477
    invoke-static { }, Lcom/innioasis/ipp/Queue;->dropGuests()V
  .line 1478
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  .line 1479
    invoke-static { v1, v7 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v2
  .line 1480
    if-gez v2, :L11
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->stopAtEnd(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L11
  .line 1482
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L12
  .line 1483
    return v6
  :L13
  .line 1444
    return v0
  :L14
  .line 1484
    move-exception p0
  .line 1485
    return v0
.end method

.method private static toStart(Lcom/innioasis/y1/service/PlayerService;)I
  .catchall { :L0 .. :L1 } :L3
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L8 .. :L9 } :L10
  .registers 8
  .line 820
    const-wide/16 v0, 0
    const/4 v2, 0
    const/4 v3, 1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayerIsPrepared()Z
    move-result v4
    if-eqz v4, :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getDuration()J
    move-result-wide v4
  :L1
    cmp-long v6, v4, v0
    if-lez v6, :L2
    const/4 v2, 1
  :L2
  .line 823
    goto :L4
  :L3
  .line 821
    move-exception v4
  .line 822
    nop
  :L4
  .line 824
    const/4 v4, 2
    if-eqz v2, :L8
  :L5
  .line 826
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setCurrentPosition(J)V
  .line 827
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->isPlaying()Z
    move-result v0
    if-nez v0, :L6
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/service/PlayerService;->play(Z)V
  :L6
  .line 828
    return v4
  :L7
  .line 829
    move-exception v0
  :L8
  .line 833
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/service/PlayerService;->restartPlay(Z)V
  :L9
  .line 835
    goto :L11
  :L10
  .line 834
    move-exception p0
  :L11
  .line 836
    return v4
.end method

.method private static toast(I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 3
  :L0
  .line 610
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 611
    if-nez v0, :L1
    return-void
  :L1
  .line 612
    invoke-virtual { v0, p0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    const/4 v1, 0
    invoke-static { v0, p0, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
  .line 613
    invoke-virtual { p0 }, Landroid/widget/Toast;->getView()Landroid/view/View;
    move-result-object v0
  .line 614
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    const v1, 16908299
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L3
  .line 615
    instance-of v1, v0, Landroid/widget/TextView;
    if-eqz v1, :L4
  .line 616
    check-cast v0, Landroid/widget/TextView;
    const/16 v1, 17
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setGravity(I)V
  :L4
  .line 618
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L5
  .line 620
    goto :L7
  :L6
  .line 619
    move-exception p0
  :L7
  .line 621
    return-void
.end method

.method public static trackNo(Lcom/innioasis/y1/service/PlayerService;)I
  .catch Ljava/lang/Exception; { :L0 .. :L4 } :L9
  .registers 4
  .line 793
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 794
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 795
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 796
    if-nez v1, :L1
    const/4 v1, 0
    goto :L2
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  :L2
  .line 797
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
  .line 798
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 799
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v2
    if-nez v2, :L3
  .line 801
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->seqNo(I)I
    move-result p0
    return p0
  :L3
  .line 803
    sget p0, Lcom/innioasis/ipp/Queue;->passLen:I
    sget-object v2, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v2
  :L4
    sub-int/2addr p0, v2
  .line 804
    if-ge p0, v0, :L5
    goto :L6
  :L5
    move v0, p0
  :L6
  .line 805
    if-lez v1, :L7
    if-le v0, v1, :L7
    goto :L8
  :L7
  .line 806
    move v1, v0
  :L8
    return v1
  :L9
  .line 807
    move-exception p0
  .line 808
    return v0
.end method

.method private static unwrap(Ljava/util/ArrayList;Ljava/lang/Object;)V
  .registers 3
  .line 568
    if-nez p1, :L0
    return-void
  :L0
  .line 569
    instance-of v0, p1, Lcom/innioasis/music/SearchActivity$Item;
    if-eqz v0, :L3
  .line 570
    check-cast p1, Lcom/innioasis/music/SearchActivity$Item;
  .line 571
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
    if-eqz v0, :L1
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getSong()Lcom/innioasis/y1/database/Song;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L2
  :L1
  .line 572
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getAlbum()Lcom/innioasis/music/data/Album;
    move-result-object v0
    if-eqz v0, :L2
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getAlbum()Lcom/innioasis/music/data/Album;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 573
    return-void
  :L3
  .line 575
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 576
    return-void
.end method

.method public static upNext()Ljava/util/List;
  .catch Ljava/lang/Exception; { :L0 .. :L19 } :L20
  .registers 10
  .line 1593
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1594
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1596
    const/4 v2, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v3
  .line 1597
    if-nez v3, :L1
    new-array v3, v2, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    sput v2, Lcom/innioasis/ipp/Queue;->rowManual:I
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
    return-object v0
  :L1
  .line 1598
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1599
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v4
  .line 1600
    if-eqz v4, :L18
    invoke-interface { v4 }, Ljava/util/List;->isEmpty()Z
    move-result v5
    if-eqz v5, :L2
    goto/16 :L18
  :L2
  .line 1601
    invoke-interface { v4 }, Ljava/util/List;->size()I
    move-result v5
  .line 1602
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v3
  .line 1603
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 1605
    if-ltz v3, :L3
    if-ge v3, v5, :L3
  .line 1606
    invoke-interface { v4, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    invoke-virtual { v0, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1607
    invoke-static { v3 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1610
    sget-object v6, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v7
    const/16 v8, 20
    if-le v7, v8, :L4
    const/16 v6, 20
    goto :L5
  :L4
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v6
  :L5
  .line 1611
    const/4 v7, 0
  :L6
    if-ge v7, v6, :L7
  .line 1612
    sget-object v9, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v9, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v9
    invoke-virtual { v0, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1613
    const/4 v9, -1
    invoke-static { v9 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-virtual { v1, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1611
    add-int/lit8 v7, v7, 1
    goto :L6
  :L7
  .line 1615
    sput v6, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 1616
    sget-object v6, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v6
    sput v6, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1619
    sget v6, Lcom/innioasis/ipp/Queue;->resume:I
    if-ltz v6, :L8
    goto :L9
  :L8
    move v6, v3
  :L9
  .line 1620
    if-ltz v6, :L10
    if-lt v6, v5, :L11
  :L10
    const/4 v6, 0
  :L11
  .line 1621
    nop
  .line 1622
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v7
    if-eqz v7, :L15
  .line 1623
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Queue;->ensureCycle(II)V
  .line 1624
    const/4 v6, 0
  :L12
    sget-object v7, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result v9
    if-ge v6, v9, :L17
    if-lez v8, :L17
  .line 1625
    invoke-virtual { v7, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Integer;
    invoke-virtual { v7 }, Ljava/lang/Integer;->intValue()I
    move-result v7
  .line 1626
    if-eq v7, v3, :L14
    if-ltz v7, :L14
    if-ge v7, v5, :L14
    invoke-static { v7 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v9
    if-eqz v9, :L13
    goto :L14
  :L13
  .line 1627
    invoke-interface { v4, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
    invoke-virtual { v0, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1628
    invoke-static { v7 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v7
    invoke-virtual { v1, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1629
    add-int/lit8 v8, v8, -1
  :L14
  .line 1624
    add-int/lit8 v6, v6, 1
    goto :L12
  :L15
  .line 1632
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v3
  :L16
    if-ltz v3, :L17
    if-lez v8, :L17
  .line 1633
    invoke-interface { v4, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    invoke-virtual { v0, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1634
    invoke-static { v3 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1635
    add-int/lit8 v8, v8, -1
  .line 1632
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v3
    goto :L16
  :L17
  .line 1639
    goto :L21
  :L18
  .line 1600
    new-array v3, v2, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    sput v2, Lcom/innioasis/ipp/Queue;->rowManual:I
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  :L19
    return-object v0
  :L20
  .line 1638
    move-exception v3
  :L21
  .line 1640
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    new-array v3, v3, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1641
    nop
  :L22
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L23
  .line 1642
    sget-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    aput v4, v3, v2
  .line 1641
    add-int/lit8 v2, v2, 1
    goto :L22
  :L23
  .line 1644
    return-object v0
.end method

.method private static uuidExtras(Landroid/content/Intent;)Ljava/lang/String;
  .catchall { :L0 .. :L5 } :L7
  .registers 6
  .line 1182
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  :L0
  .line 1184
    invoke-virtual { p0 }, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object p0
  .line 1185
    if-nez p0, :L1
    const-string p0, ""
    return-object p0
  :L1
  .line 1186
    invoke-virtual { p0 }, Landroid/os/Bundle;->keySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L2
  .line 1187
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L6
  .line 1188
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
  .line 1189
    invoke-virtual { p0, v2 }, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v3
  .line 1190
    instance-of v4, v3, Ljava/util/UUID;
    if-nez v4, :L3
    goto :L2
  :L3
  .line 1191
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->length()I
    move-result v4
    if-lez v4, :L4
    const/16 v4, 10
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L4
  .line 1192
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v4, 61
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v3 }, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L5
  .line 1193
    goto :L2
  :L6
  .line 1196
    nop
  .line 1197
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L7
  .line 1194
    move-exception p0
  .line 1195
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

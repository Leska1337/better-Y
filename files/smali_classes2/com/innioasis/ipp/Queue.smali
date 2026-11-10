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

.field private static memoAdapter:Ljava/lang/ref/WeakReference;

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
  .line 59
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
  .line 64
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
  .line 65
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
  .line 66
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
  .line 67
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
  .line 69
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
  .line 71
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
  .line 72
    new-instance v0, Ljava/util/Random;
    invoke-direct { v0 }, Ljava/util/Random;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->rnd:Ljava/util/Random;
  .line 77
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->kind:I
  .line 80
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->resume:I
  .line 82
    sput v1, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 88
    sput v1, Lcom/innioasis/ipp/Queue;->lastShuffle:I
  .line 94
    const/4 v2, 1
    sput v2, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 97
    new-array v3, v0, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 98
    sput v0, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 99
    sput v0, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 584
    sput v1, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 1021
    const-string v0, ""
    sput-object v0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1092
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
  .line 214
    if-nez p0, :L0
    return-void
  :L0
  .line 215
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 216
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 217
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->insertGuest(Lcom/innioasis/y1/database/Song;)I
    move-result p0
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 218
    return-void
.end method

.method public static addAll(Ljava/util/List;)V
  .registers 4
  .line 488
    if-nez p0, :L0
    return-void
  :L0
  .line 489
    sget v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 490
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 491
    if-gez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->kindOfSongs(Ljava/util/List;)I
    move-result v0
  :L1
  .line 492
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->allowedFrom(I)Z
    move-result v0
    if-nez v0, :L2
    return-void
  :L2
  .line 493
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
  .line 494
    const/4 v1, 0
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 495
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->add(Lcom/innioasis/y1/database/Song;)V
  .line 494
    add-int/lit8 v1, v1, 1
    goto :L3
  :L4
  .line 497
    sget-object p0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result p0
    if-ne p0, v0, :L5
    return-void
  :L5
  .line 498
    const p0, 2131821048
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toast(I)V
  .line 499
    return-void
.end method

.method public static addAllFromMusic(Ljava/util/List;)V
  .registers 2
  .line 588
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 589
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->addAll(Ljava/util/List;)V
  .line 590
    return-void
.end method

.method public static addFromAdapter(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 506
    if-nez p0, :L0
    return-void
  :L0
  .line 507
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->screenKind(Landroid/content/Context;)I
    move-result v0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 508
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 509
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 510
    if-eqz v1, :L4
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L4
  .line 511
    const/4 v2, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 512
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v3
  .line 513
    if-eqz v3, :L2
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 511
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 516
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 517
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
    goto :L5
  :L4
  .line 519
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 520
    if-eqz p0, :L5
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 522
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->addPicked(Ljava/util/List;)V
  .line 523
    return-void
.end method

.method public static addFromList(Landroid/view/View;)V
  .registers 1
  .line 527
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  :L1
  .line 528
    if-eqz p0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->addFromAdapter(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  :L2
  .line 529
    return-void
.end method

.method public static addFromRvAdapter(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .registers 5
  .line 533
    if-nez p0, :L0
    return-void
  :L0
  .line 534
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 535
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 536
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v2
  .line 537
    if-eqz v2, :L4
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-nez v3, :L4
  .line 538
    nop
  :L1
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L3
  .line 539
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v3
  .line 540
    if-eqz v3, :L2
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 538
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 542
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 543
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
    goto :L5
  :L4
  .line 545
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p0
  .line 546
    if-eqz p0, :L5
    invoke-virtual { v1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 548
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->addPicked(Ljava/util/List;)V
  .line 549
    return-void
.end method

.method public static addFromSearch(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .registers 5
  .line 553
    if-nez p0, :L0
    return-void
  :L0
  .line 554
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 555
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 556
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v2
  .line 557
    if-eqz v2, :L3
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-nez v3, :L3
  .line 558
    nop
  :L1
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L2
  .line 559
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->unwrap(Ljava/util/ArrayList;Ljava/lang/Object;)V
  .line 558
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 561
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 562
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
    goto :L4
  :L3
  .line 564
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p0
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Queue;->unwrap(Ljava/util/ArrayList;Ljava/lang/Object;)V
  :L4
  .line 566
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->addPicked(Ljava/util/List;)V
  .line 567
    return-void
.end method

.method private static addPicked(Ljava/util/List;)V
  .catch Ljava/lang/Exception; { :L0 .. :L11 } :L12
  .registers 8
  :L0
  .line 667
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 668
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 669
    const/4 v2, 0
    const/4 v3, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L10
  .line 670
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 671
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L2
  .line 672
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L9
  :L2
  .line 673
    instance-of v5, v4, Lcom/innioasis/music/data/Album;
    if-eqz v5, :L5
  .line 674
    move-object v5, v4
    check-cast v5, Lcom/innioasis/music/data/Album;
    invoke-virtual { v5 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v5
  .line 675
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L3
  .line 677
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->allSongsArtist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->artistSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/lang/String;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L4
  :L3
  .line 680
    check-cast v4, Lcom/innioasis/music/data/Album;
    const/4 v5, 0
    invoke-virtual { v0, v4, v2, v5 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByAlbumSync(Lcom/innioasis/music/data/Album;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
  :L4
  .line 682
    goto :L9
  :L5
    instance-of v5, v4, Lcom/innioasis/y1/database/Playlist;
    if-eqz v5, :L6
  .line 683
    check-cast v4, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v0, v4 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByPlaylistSync(Lcom/innioasis/y1/database/Playlist;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L9
  :L6
  .line 684
    instance-of v5, v4, Lcom/innioasis/music/data/Genre;
    if-eqz v5, :L7
  .line 685
    check-cast v4, Lcom/innioasis/music/data/Genre;
    invoke-virtual { v0, v4 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByGenreSync(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L9
  :L7
  .line 686
    instance-of v5, v4, Ljava/io/File;
    if-eqz v5, :L8
  .line 687
    check-cast v4, Ljava/io/File;
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->fileSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L9
  :L8
  .line 688
    instance-of v5, v4, Ljava/lang/String;
    if-eqz v5, :L9
  .line 689
    check-cast v4, Ljava/lang/String;
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->artistSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/lang/String;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
  :L9
  .line 669
    add-int/lit8 v3, v3, 1
    goto :L1
  :L10
  .line 692
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->addAll(Ljava/util/List;)V
  :L11
  .line 694
    goto :L13
  :L12
  .line 693
    move-exception p0
  :L13
  .line 695
    return-void
.end method

.method private static allowedFrom(I)Z
  .catchall { :L0 .. :L8 } :L11
  .registers 6
  .line 647
    const/4 v0, 1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 648
    if-nez v1, :L1
    return v0
  :L1
  .line 649
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlaying()Lcom/innioasis/y1/service/PlayerService$Playing;
    move-result-object v2
  .line 651
    sget-object v3, Lcom/innioasis/y1/service/PlayerService$Playing;->Audiobook:Lcom/innioasis/y1/service/PlayerService$Playing;
    const/4 v4, 0
    if-ne v2, v3, :L2
    const/4 v2, 1
    goto :L3
  :L2
  .line 652
    sget-object v3, Lcom/innioasis/y1/service/PlayerService$Playing;->Music:Lcom/innioasis/y1/service/PlayerService$Playing;
    if-ne v2, v3, :L10
    const/4 v2, 0
  :L3
  .line 654
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Queue;->listOf(Lcom/innioasis/y1/service/PlayerService;I)Ljava/util/List;
    move-result-object v1
  .line 655
    if-eqz v1, :L9
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L4
    goto :L9
  :L4
  .line 656
    if-ne p0, v2, :L5
    return v0
  :L5
  .line 657
    if-ne v2, v0, :L6
    const p0, 2131821097
    goto :L7
  :L6
    const p0, 2131821098
  :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toast(I)V
  :L8
  .line 658
    return v4
  :L9
  .line 655
    return v0
  :L10
  .line 653
    return v0
  :L11
  .line 659
    move-exception p0
  .line 660
    return v0
.end method

.method private static artistSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/lang/String;)Ljava/util/List;
  .registers 2
  .line 716
    const/4 p0, 0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Artists;->forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method public static atSource()Z
  .catchall { :L0 .. :L1 } :L4
  .registers 3
  .line 1300
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1301
    sget-object v0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1302
    const/4 v1, 1
    if-nez v0, :L0
    return v1
  :L0
  .line 1304
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v2
  .line 1305
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
  .line 1306
    move-exception v0
  .line 1307
    return v1
.end method

.method public static atSource(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L10 } :L11
  .registers 7
  .line 1365
    const/4 v0, 1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1366
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1367
    if-nez v1, :L1
    return v0
  :L1
  .line 1368
    instance-of v2, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v2, :L2
    return v0
  :L2
  .line 1369
    move-object v2, p0
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v2
  .line 1370
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
  .line 1371
    sget-object v5, Lcom/innioasis/ipp/Queue;->memoAdapter:Ljava/lang/ref/WeakReference;
    if-eqz v5, :L5
    invoke-virtual { v5 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v5
    if-ne p0, v5, :L5
    sget-object v5, Lcom/innioasis/ipp/Queue;->memoTitle:Ljava/lang/String;
    if-ne v3, v5, :L5
    sget-object v5, Lcom/innioasis/ipp/Queue;->memoKey:Ljava/lang/String;
    if-ne v1, v5, :L5
  .line 1372
    sget-boolean p0, Lcom/innioasis/ipp/Queue;->memoAns:Z
    return p0
  :L5
  .line 1374
    instance-of v5, v2, Landroid/app/Activity;
    if-eqz v5, :L6
    move-object v4, v2
    check-cast v4, Landroid/app/Activity;
  :L6
    invoke-static { v4 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v2
  .line 1375
    new-instance v4, Ljava/lang/ref/WeakReference;
    invoke-direct { v4, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v4, Lcom/innioasis/ipp/Queue;->memoAdapter:Ljava/lang/ref/WeakReference;
  .line 1376
    sput-object v3, Lcom/innioasis/ipp/Queue;->memoTitle:Ljava/lang/String;
  .line 1377
    sput-object v1, Lcom/innioasis/ipp/Queue;->memoKey:Ljava/lang/String;
  .line 1378
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
  .line 1379
    return p0
  :L11
  .line 1380
    move-exception p0
  .line 1381
    return v0
.end method

.method private static book()Z
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 121
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 122
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
  .line 123
    move-exception v1
  .line 124
    return v0
.end method

.method private static bump(Ljava/util/ArrayList;II)V
  .registers 5
  .line 480
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 481
    invoke-virtual { p0, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  .line 482
    if-lt v1, p1, :L1
    add-int/2addr v1, p2
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { p0, v0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 480
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 484
    return-void
.end method

.method public static canRemoveRow(I)Z
  .registers 3
  .line 1697
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
  .line 171
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 172
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 173
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 174
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 175
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 176
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 177
    sget-object v0, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 178
    sget-object v0, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 179
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Queue;->resume:I
  .line 180
    sput v0, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 181
    const/4 v1, 1
    sput v1, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 182
    sput v0, Lcom/innioasis/ipp/Queue;->lastShuffle:I
  .line 183
    return-void
.end method

.method private static collect(Ljava/util/ArrayList;Ljava/util/List;)V
  .registers 4
  .line 698
    if-nez p1, :L0
    return-void
  :L0
  .line 699
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L3
  .line 700
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L2
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 699
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 702
    return-void
.end method

.method public static consumeSkipRestart()Z
  .registers 2
  .line 1348
    sget-boolean v0, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  .line 1349
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  .line 1350
    return v0
.end method

.method private static dropFromPlan(I)V
  .registers 4
  .line 1702
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v0, v2, :L2
  .line 1703
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-ne v2, p0, :L1
  .line 1704
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 1705
    return-void
  :L1
  .line 1702
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 1708
    return-void
.end method

.method private static dropGuest(I)V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  :L0
  .line 251
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 252
    if-nez v0, :L1
    return-void
  :L1
  .line 253
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 254
    if-eqz v1, :L5
    if-ltz p0, :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
    if-lt p0, v2, :L2
    goto :L5
  :L2
  .line 255
    invoke-interface { v1, p0 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 256
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
  .line 257
    if-le v1, p0, :L3
    add-int/lit8 v1, v1, -1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Queue;->setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  :L3
  .line 258
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->shiftDown(I)V
  :L4
  .line 260
    goto :L7
  :L5
  .line 254
    return-void
  :L6
  .line 259
    move-exception p0
  :L7
  .line 261
    return-void
.end method

.method private static dropGuests()V
  .registers 1
  .line 268
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 269
    sget-object v0, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->notePass(Ljava/util/ArrayList;)V
  .line 270
    invoke-static { }, Lcom/innioasis/ipp/Queue;->stripGuests()V
  .line 271
    return-void
.end method

.method private static dropGuestsFrom(I)V
  .catchall { :L0 .. :L13 } :L15
  .registers 9
  :L0
  .line 188
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 189
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->listOf(Lcom/innioasis/y1/service/PlayerService;I)Ljava/util/List;
    move-result-object v1
  .line 190
    if-nez v1, :L1
    return-void
  :L1
  .line 191
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 192
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
  .line 193
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
  .line 194
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v4
    if-nez v4, :L14
  .line 195
    nop
  .line 196
    const/4 v4, -1
    const/4 v5, -1
    const/4 v6, 0
  :L6
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v7
    if-ge v6, v7, :L8
  .line 197
    invoke-virtual { v2, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Integer;
    invoke-virtual { v7 }, Ljava/lang/Integer;->intValue()I
    move-result v7
  .line 198
    if-le v7, v5, :L7
    move v4, v6
    move v5, v7
  :L7
  .line 196
    add-int/lit8 v6, v6, 1
    goto :L6
  :L8
  .line 200
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 201
    if-ltz v5, :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v4
    if-lt v5, v4, :L9
    goto :L5
  :L9
  .line 202
    invoke-interface { v1, v5 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 203
    const/4 v4, 1
    if-ne p0, v4, :L10
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookIndex()I
    move-result v6
    goto :L11
  :L10
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicIndex()I
    move-result v6
  :L11
  .line 204
    if-le v6, v5, :L13
  .line 205
    if-ne p0, v4, :L12
    add-int/lit8 v6, v6, -1
    invoke-virtual { v0, v6 }, Lcom/innioasis/y1/service/PlayerService;->setAudiobookIndex(I)V
    goto :L13
  :L12
  .line 206
    add-int/lit8 v6, v6, -1
    invoke-virtual { v0, v6 }, Lcom/innioasis/y1/service/PlayerService;->setMusicIndex(I)V
  :L13
  .line 208
    goto :L5
  :L14
  .line 210
    goto :L16
  :L15
  .line 209
    move-exception p0
  :L16
  .line 211
    return-void
.end method

.method private static dropPlanThrough(I)V
  .registers 5
  .line 1745
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v1, v3, :L4
  .line 1746
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-ne v2, p0, :L3
  .line 1747
    const/4 p0, 0
  :L1
    if-gt p0, v1, :L2
  .line 1748
    sget-object v2, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 1747
    add-int/lit8 p0, p0, 1
    goto :L1
  :L2
  .line 1750
    return-void
  :L3
  .line 1745
    add-int/lit8 v1, v1, 1
    goto :L0
  :L4
  .line 1753
    return-void
.end method

.method private static dropStalePlayer()V
  .catchall { :L0 .. :L6 } :L7
  .registers 2
  :L0
  .line 1112
    sget-object v0, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L2
  .line 1113
    sput-object v1, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
  .line 1114
    instance-of v1, v0, Landroid/app/Activity;
    if-nez v1, :L3
    return-void
  :L3
  .line 1115
    check-cast v0, Landroid/app/Activity;
  .line 1116
    invoke-virtual { v0 }, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-eqz v1, :L4
    return-void
  :L4
  .line 1117
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object v1
    if-ne v0, v1, :L5
    return-void
  :L5
  .line 1118
    invoke-virtual { v0 }, Landroid/app/Activity;->finish()V
  :L6
  .line 1120
    goto :L8
  :L7
  .line 1119
    move-exception v0
  :L8
  .line 1121
    return-void
.end method

.method public static endOfList(Lcom/innioasis/y1/service/PlayerService;)Z
  .catch Ljava/lang/Exception; { :L0 .. :L7 } :L10
  .registers 4
  .line 886
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 887
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 888
    sget-object v1, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 889
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 890
    if-eqz v1, :L9
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L2
    goto :L9
  :L2
  .line 891
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  .line 892
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 893
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result v2
    if-eqz v2, :L3
    return v0
  :L3
  .line 894
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v2
    if-eqz v2, :L4
  .line 895
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Queue;->ensureCycle(II)V
  .line 896
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    return p0
  :L4
  .line 898
    sget v2, Lcom/innioasis/ipp/Queue;->resume:I
    if-ltz v2, :L5
    goto :L6
  :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
  :L6
  .line 899
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result p0
  :L7
    if-gez p0, :L8
    const/4 v0, 1
  :L8
    return v0
  :L9
  .line 890
    return v0
  :L10
  .line 900
    move-exception p0
  .line 901
    return v0
.end method

.method private static ensureCycle(II)V
  .registers 3
  .line 869
    if-gtz p0, :L0
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->clear()V
    return-void
  :L0
  .line 870
    sget v0, Lcom/innioasis/ipp/Queue;->planFor:I
    if-eq v0, p0, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->newCycle(II)V
  :L1
  .line 871
    return-void
.end method

.method private static ensureSource()V
  .catchall { :L1 .. :L13 } :L15
  .registers 11
  .line 1204
    const-string v0, ""
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcLoaded:Z
    if-nez v1, :L17
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-eqz v1, :L0
    goto/16 :L17
  :L0
  .line 1206
    const/4 v1, 1
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v2
  .line 1207
    if-nez v2, :L2
    return-void
  :L2
  .line 1208
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->listSig(Lcom/innioasis/y1/service/PlayerService;)Ljava/lang/String;
    move-result-object v2
  .line 1209
    if-nez v2, :L3
    return-void
  :L3
  .line 1210
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->srcLoaded:Z
  .line 1211
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v3
  .line 1212
    if-nez v3, :L4
    return-void
  :L4
  .line 1213
    const-string v4, "src_sig"
    invoke-interface { v3, v4, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L5
    return-void
  :L5
  .line 1214
    const-string v2, "src_key"
    invoke-interface { v3, v2, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1215
    const-string v4, "src_uri"
    invoke-interface { v3, v4, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 1216
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v5
    if-eqz v5, :L14
    invoke-virtual { v4 }, Ljava/lang/String;->length()I
    move-result v5
    if-nez v5, :L6
    goto :L14
  :L6
  .line 1217
    const/4 v5, 0
    invoke-static { v4, v5 }, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;
    move-result-object v4
  .line 1218
    const-string v6, "src_uuid"
    invoke-interface { v3, v6, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 1219
    invoke-virtual { v6 }, Ljava/lang/String;->length()I
    move-result v7
    if-lez v7, :L10
  .line 1220
    const-string v7, "\n"
    invoke-virtual { v6, v7 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v6
  .line 1221
    const/4 v7, 0
  :L7
    array-length v8, v6
    if-ge v7, v8, :L10
  .line 1222
    aget-object v8, v6, v7
    const/16 v9, 61
    invoke-virtual { v8, v9 }, Ljava/lang/String;->indexOf(I)I
    move-result v8
  .line 1223
    if-gtz v8, :L8
    goto :L9
  :L8
  .line 1224
    aget-object v9, v6, v7
    invoke-virtual { v9, v5, v8 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v9
    aget-object v10, v6, v7
    add-int/lit8 v8, v8, 1
  .line 1225
    invoke-virtual { v10, v8 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v8
    invoke-static { v8 }, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;
    move-result-object v8
  .line 1224
    invoke-virtual { v4, v9, v8 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;
  :L9
  .line 1221
    add-int/lit8 v7, v7, 1
    goto :L7
  :L10
  .line 1228
    sput-object v2, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1229
    const-string v2, "src_name"
    invoke-interface { v3, v2, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    sput-object v2, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1230
    sput-object v4, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
  .line 1231
    const/4 v2, 0
    sput-object v2, Lcom/innioasis/ipp/Queue;->srcAct:Ljava/lang/ref/WeakReference;
  .line 1232
    const-string v4, "src_level"
    invoke-interface { v3, v4, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 1233
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v4
    if-nez v4, :L11
    goto :L12
  :L11
    move-object v2, v0
  :L12
    sput-object v2, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
  .line 1234
    const-string v0, "src_genre"
    invoke-interface { v3, v0, v5 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->srcGenre:Z
  .line 1235
    const-string v0, "src_ordered"
    invoke-interface { v3, v0, v1 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
  :L13
  .line 1238
    goto :L16
  :L14
  .line 1216
    return-void
  :L15
  .line 1236
    move-exception v0
  .line 1237
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->srcLoaded:Z
  :L16
  .line 1239
    return-void
  :L17
  .line 1204
    return-void
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 2
  .line 1007
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
  .line 706
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 707
    invoke-virtual { p1 }, Ljava/io/File;->isDirectory()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByParentPath(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L1
  .line 708
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 709
    if-nez p0, :L2
    return-object v0
  :L2
  .line 710
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1 }, Ljava/util/ArrayList;-><init>()V
  .line 711
    invoke-virtual { p1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 712
    return-object p1
.end method

.method private static fromSource(Ljava/lang/Object;)Z
  .registers 4
  .line 1012
    sget-object v0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1013
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 1014
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 1015
    instance-of v2, p0, Landroid/app/Activity;
    if-nez v2, :L1
    return v1
  :L1
  .line 1016
    check-cast p0, Landroid/app/Activity;
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object p0
  .line 1017
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
  .line 453
    const/4 v0, -1
    if-ltz p1, :L3
    if-eqz p0, :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p1, v1, :L0
    goto :L3
  :L0
  .line 454
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
    if-ne p0, p2, :L1
    goto :L2
  :L1
    const/4 p1, -1
  :L2
    return p1
  :L3
  .line 453
    return v0
.end method

.method private static has(Ljava/util/ArrayList;I)Z
  .registers 5
  .line 445
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 446
    invoke-virtual { p0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-ne v2, p1, :L1
    const/4 p0, 1
    return p0
  :L1
  .line 445
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 448
    return v0
.end method

.method public static hasSource()Z
  .registers 1
  .line 1125
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1126
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
  .line 140
    if-nez p0, :L0
    const/4 p0, -1
    return p0
  :L0
  .line 141
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
  .line 1397
    const/4 v0, -1
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 1398
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 1399
    if-nez p1, :L1
    return v0
  :L1
  .line 1400
    const/4 v1, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 1401
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1402
    if-eqz v2, :L3
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    return v1
  :L3
  .line 1400
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 1404
    return v0
  :L5
  .line 1397
    return v0
.end method

.method private static insertGuest(Lcom/innioasis/y1/database/Song;)I
  .catchall { :L0 .. :L8 } :L11
  .registers 7
  .line 228
    const/4 v0, -1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 229
    if-nez v1, :L1
    return v0
  :L1
  .line 230
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v2
  .line 231
    if-eqz v2, :L10
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L2
    goto :L10
  :L2
  .line 232
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
  .line 233
    if-ltz v1, :L9
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v1, v3, :L3
    goto :L9
  :L3
  .line 234
    add-int/lit8 v1, v1, 1
  .line 235
    const/4 v3, 0
  :L4
    sget-object v4, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v5
    if-ge v3, v5, :L6
  .line 236
    invoke-virtual { v4, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
  .line 237
    if-lt v4, v1, :L5
    add-int/lit8 v4, v4, 1
    move v1, v4
  :L5
  .line 235
    add-int/lit8 v3, v3, 1
    goto :L4
  :L6
  .line 239
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-le v1, v3, :L7
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v1
  :L7
  .line 240
    invoke-interface { v2, v1, p0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  .line 241
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->shiftUp(I)V
  :L8
  .line 242
    return v1
  :L9
  .line 233
    return v0
  :L10
  .line 231
    return v0
  :L11
  .line 243
    move-exception p0
  .line 244
    return v0
.end method

.method public static isManualRow(I)Z
  .registers 3
  .line 1677
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
  .line 1289
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 1290
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
  .line 1291
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->getStateBarLeftText()Ljava/lang/String;
    move-result-object v0
  .line 1292
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
  .line 595
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L8
  .line 596
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 597
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-nez v3, :L1
    goto :L2
  :L1
  .line 598
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
  .line 599
    if-nez v2, :L3
  :L2
  .line 595
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 600
    const-string p0, "/storage/sdcard0/Audiobooks"
    invoke-virtual { v2, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L6
    const-string p0, "/storage/sdcard0/audiobooks"
  .line 601
    invoke-virtual { v2, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
  :L4
    if-eqz p0, :L5
    goto :L6
  :L5
  .line 602
    goto :L7
  :L6
    const/4 v0, 1
  :L7
  .line 600
    return v0
  :L8
  .line 605
    goto :L10
  :L9
  .line 604
    move-exception p0
  :L10
  .line 606
    return v0
.end method

.method private static list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
  .registers 2
  .line 129
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 130
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
  .line 135
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 136
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
  .line 1170
    const-string v0, "|"
    const/4 v1, 0
    if-nez p0, :L0
    return-object v1
  :L0
  .line 1171
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object p0
  .line 1172
    if-eqz p0, :L5
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L1
    goto :L5
  :L1
  .line 1173
    const/4 v2, 0
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 1174
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    add-int/lit8 v3, v3, -1
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 1175
    instance-of v4, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v4, :L4
    instance-of v4, v3, Lcom/innioasis/y1/database/Song;
    if-nez v4, :L2
    goto :L4
  :L2
  .line 1176
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
  .line 1175
    return-object v1
  :L5
  .line 1172
    return-object v1
  :L6
  .line 1177
    move-exception p0
  .line 1178
    return-object v1
.end method

.method public static manualCount()I
  .registers 1
  .line 108
    sget v0, Lcom/innioasis/ipp/Queue;->manualTotal:I
    return v0
.end method

.method public static manualShown()I
  .registers 1
  .line 103
    sget v0, Lcom/innioasis/ipp/Queue;->rowManual:I
    return v0
.end method

.method static manualSongs()Ljava/util/List;
  .registers 1
  .line 54
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    return-object v0
.end method

.method private static moveGuest(Ljava/util/List;II)I
  .catchall { :L0 .. :L6 } :L7
  .registers 5
  .line 423
    if-eqz p0, :L8
    if-ltz p1, :L8
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L8
  :L1
  .line 424
    if-le p2, p1, :L2
    add-int/lit8 p2, p2, -1
  :L2
    add-int/lit8 p2, p2, 1
  .line 425
    if-ne p2, p1, :L3
    return p1
  :L3
  .line 426
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
  .line 427
    invoke-interface { p0, p1 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 428
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->shiftDown(I)V
  .line 429
    if-gez p2, :L4
    const/4 p2, 0
  :L4
  .line 430
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-le p2, v1, :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p2
  :L5
  .line 431
    invoke-interface { p0, p2, v0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  .line 432
    invoke-static { p2 }, Lcom/innioasis/ipp/Queue;->shiftUp(I)V
  :L6
  .line 433
    return p2
  :L7
  .line 434
    move-exception p0
  .line 435
    return p1
  :L8
  .line 423
    return p1
.end method

.method private static newCycle(II)V
  .registers 5
  .line 729
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 730
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 731
    const/4 v0, 0
  :L0
    if-ge v0, p0, :L2
  .line 732
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
  .line 731
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 734
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    sget-object p1, Lcom/innioasis/ipp/Queue;->rnd:Ljava/util/Random;
    invoke-static { p0, p1 }, Ljava/util/Collections;->shuffle(Ljava/util/List;Ljava/util/Random;)V
  .line 735
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result p0
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 736
    return-void
.end method

.method private static newPlaylist(ILjava/util/List;)V
  .registers 3
  .line 931
    sget v0, Lcom/innioasis/ipp/Queue;->kind:I
    if-eq v0, p0, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->dropGuestsFrom(I)V
  :L0
  .line 932
    sput p0, Lcom/innioasis/ipp/Queue;->kind:I
  .line 933
    invoke-static { }, Lcom/innioasis/ipp/Queue;->clearSession()V
  .line 934
    invoke-static { }, Lcom/innioasis/ipp/Queue;->dropStalePlayer()V
  .line 935
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->noteSource(Ljava/util/List;)V
  .line 936
    invoke-static { }, Lcom/innioasis/ipp/Status;->playerOpening()V
  .line 937
    return-void
.end method

.method public static nextPath()Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L6
  .registers 8
  .line 1657
    sget-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1658
    sget v1, Lcom/innioasis/ipp/Queue;->rowManual:I
    sget v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1660
    const/4 v3, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingPath()Ljava/lang/String;
    move-result-object v4
  .line 1661
    invoke-static { }, Lcom/innioasis/ipp/Queue;->upNext()Ljava/util/List;
    move-result-object v5
  .line 1662
    if-eqz v4, :L5
    invoke-interface { v5 }, Ljava/util/List;->size()I
    move-result v6
    const/4 v7, 2
    if-ge v6, v7, :L1
    goto :L5
  :L1
  .line 1663
    const/4 v6, 0
    invoke-interface { v5, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    const/4 v7, 1
    invoke-interface { v5, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 1664
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
  .line 1665
    instance-of v4, v5, Lcom/innioasis/y1/database/Song;
    if-eqz v4, :L3
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  :L3
  .line 1669
    sput-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1670
    sput v1, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 1671
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1665
    return-object v3
  :L4
  .line 1669
    sput-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1670
    sput v1, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 1671
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1664
    return-object v3
  :L5
  .line 1669
    sput-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1670
    sput v1, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 1671
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1662
    return-object v3
  :L6
  .line 1666
    move-exception v4
  .line 1667
    nop
  .line 1669
    sput-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1670
    sput v1, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 1671
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1667
    return-object v3
.end method

.method private static nextSeq(II)I
  .registers 3
  :L0
  .line 745
    add-int/lit8 p1, p1, 1
    if-ge p1, p0, :L1
  .line 746
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v0
    if-nez v0, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->pendingGuest(I)Z
    move-result v0
    if-nez v0, :L0
    return p1
  :L1
  .line 748
    const/4 p0, -1
    return p0
.end method

.method private static nextShuffled(II)I
  .registers 4
  .line 1499
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->popCycle(II)I
    move-result p0
  .line 1500
    if-ltz p0, :L0
    return p0
  :L0
  .line 1501
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result p0
    const/4 p1, -1
    if-nez p0, :L1
    return p1
  :L1
  .line 1502
    invoke-static { }, Lcom/innioasis/ipp/Queue;->dropGuests()V
  .line 1503
    invoke-static { }, Lcom/innioasis/ipp/Queue;->sizeCur()[I
    move-result-object p0
  .line 1504
    const/4 v0, 0
    aget v0, p0, v0
  .line 1505
    const/4 v1, 1
    aget p0, p0, v1
  .line 1506
    if-gtz v0, :L2
    return p1
  :L2
  .line 1507
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->randomOther(II)I
    move-result p0
  .line 1508
    if-gez p0, :L3
    return p1
  :L3
  .line 1509
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->newCycle(II)V
  .line 1510
    return p0
.end method

.method private static noteBuilt(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  :L0
  .line 986
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v0
  .line 987
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
  .line 988
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Queue;->lastList:Ljava/lang/ref/WeakReference;
  :L2
  .line 990
    goto :L5
  :L3
  .line 987
    return-void
  :L4
  .line 989
    move-exception p0
  :L5
  .line 991
    return-void
.end method

.method private static notePass(Ljava/util/ArrayList;)V
  .catchall { :L0 .. :L6 } :L9
  .registers 6
  :L0
  .line 320
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 321
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 322
    if-nez v1, :L2
    return-void
  :L2
  .line 323
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v2
  .line 324
    if-eqz v2, :L8
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L3
    goto :L8
  :L3
  .line 325
    new-instance v3, Lcom/innioasis/ipp/Queue$Pass;
    invoke-direct { v3 }, Lcom/innioasis/ipp/Queue$Pass;-><init>()V
  .line 326
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct { v4, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v4, v3, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
  .line 327
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
    iput v1, v3, Lcom/innioasis/ipp/Queue$Pass;->index:I
  .line 328
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v1, v3, Lcom/innioasis/ipp/Queue$Pass;->spent:Ljava/util/ArrayList;
  .line 329
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
  .line 330
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->plan:Ljava/util/ArrayList;
  .line 331
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->skip:Ljava/util/ArrayList;
  .line 332
    sget v0, Lcom/innioasis/ipp/Queue;->passLen:I
    iput v0, v3, Lcom/innioasis/ipp/Queue$Pass;->passLen:I
  .line 333
    sget v0, Lcom/innioasis/ipp/Queue;->planFor:I
    iput v0, v3, Lcom/innioasis/ipp/Queue$Pass;->planFor:I
  .line 335
    iget-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
  .line 336
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
  .line 337
    invoke-virtual { p0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 338
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    const/4 v1, 4
    if-le v0, v1, :L7
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  :L6
    goto :L5
  :L7
  .line 340
    goto :L10
  :L8
  .line 324
    return-void
  :L9
  .line 339
    move-exception p0
  :L10
  .line 341
    return-void
.end method

.method private static notePlayerToDrop(Ljava/util/List;)V
  .registers 4
  .line 1099
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
  .line 1100
    const/4 v0, 0
  :L0
    if-eqz p0, :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 1101
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 1102
    instance-of v2, v1, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v2, :L1
  .line 1103
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
  .line 1104
    return-void
  :L1
  .line 1100
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 1107
    return-void
.end method

.method public static noteReopen(Ljava/util/List;I)Z
  .registers 4
  .line 1332
    nop
  .line 1333
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  .line 1334
    invoke-static { }, Lcom/innioasis/ipp/Queue;->atSource()Z
    move-result v1
    if-eqz v1, :L0
    if-eqz p0, :L0
    if-ltz p1, :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge p1, v1, :L0
  .line 1335
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 1336
    instance-of p1, p0, Lcom/innioasis/y1/database/Song;
    if-eqz p1, :L0
  .line 1337
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingMusicPath()Ljava/lang/String;
    move-result-object p1
  .line 1338
    if-eqz p1, :L0
  .line 1339
    check-cast p0, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
  .line 1340
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  :L0
  .line 1344
    return v0
.end method

.method private static noteSource(Ljava/util/List;)V
  .catchall { :L0 .. :L14 } :L15
  .registers 7
  .line 1034
    const-string v0, ""
    const/4 v1, 1
    const/4 v2, 0
    const/4 v3, 0
  :L0
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object v4
  .line 1035
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
  .line 1036
    if-nez v5, :L3
    move-object v5, v0
  :L3
    sput-object v5, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1037
    invoke-static { v4 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v5
    sput-object v5, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1038
    invoke-static { v4, p0 }, Lcom/innioasis/ipp/Queue;->ordered(Landroid/app/Activity;Ljava/util/List;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
  .line 1040
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
  .line 1042
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
  .line 1044
    instance-of p0, v4, Lcom/innioasis/music/AlbumsActivity;
    if-eqz p0, :L10
  .line 1045
    sget-object p0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->levelFor(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    goto :L11
  :L10
    move-object p0, v3
  :L11
    sput-object p0, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
  .line 1046
    instance-of p0, v4, Lcom/innioasis/music/GenresActivity;
    if-eqz p0, :L12
    sget-object p0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1047
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
  .line 1056
    goto :L16
  :L15
  .line 1048
    move-exception p0
  .line 1049
    sput-object v0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1050
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1051
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
  .line 1052
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcAct:Ljava/lang/ref/WeakReference;
  .line 1053
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
  .line 1054
    sput-boolean v2, Lcom/innioasis/ipp/Queue;->srcGenre:Z
  .line 1055
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
  :L16
  .line 1057
    return-void
.end method

.method public static onNewBookPlaylist(Ljava/util/List;)V
  .registers 2
  .line 925
    const/4 v0, 1
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->newPlaylist(ILjava/util/List;)V
  .line 926
    return-void
.end method

.method public static onNewPlaylist(Ljava/util/List;)V
  .registers 2
  .line 917
    const/4 v0, 0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->newPlaylist(ILjava/util/List;)V
  .line 918
    return-void
.end method

.method public static onShuffleChanged()V
  .catch Ljava/lang/Exception; { :L0 .. :L4 } :L5
  .registers 2
  :L0
  .line 783
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 784
    if-nez v0, :L1
    return-void
  :L1
  .line 785
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 786
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 787
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
  .line 789
    goto :L6
  :L5
  .line 788
    move-exception v0
  :L6
  .line 790
    return-void
.end method

.method public static openSource(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L12 } :L14
  .registers 6
  .line 1250
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1251
    if-eqz p0, :L13
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    if-nez v1, :L1
    goto :L13
  :L1
  .line 1252
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcAct:Ljava/lang/ref/WeakReference;
    if-nez v1, :L2
    const/4 v1, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/app/Activity;
  :L3
  .line 1253
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getActivityList()Ljava/util/List;
    move-result-object v2
  .line 1254
    nop
  .line 1255
    const/4 v3, 0
  :L4
    if-eqz v2, :L6
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L6
  .line 1256
    invoke-interface { v2, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    if-ne v4, v1, :L5
    invoke-static { v1 }, Lcom/blankj/utilcode/util/ActivityUtils;->isActivityAlive(Landroid/app/Activity;)Z
    move-result v3
    goto :L7
  :L5
  .line 1255
    add-int/lit8 v3, v3, 1
    goto :L4
  :L6
  .line 1258
    const/4 v3, 0
  :L7
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->notePlayerToDrop(Ljava/util/List;)V
  .line 1260
    new-instance v2, Landroid/content/Intent;
    sget-object v4, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    invoke-direct { v2, v4 }, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
  .line 1261
    const/4 v4, 1
    if-eqz v3, :L8
  .line 1262
    const/high16 v3, 0x00020000
    invoke-virtual { v2, v3 }, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
  .line 1263
    invoke-static { }, Lcom/innioasis/ipp/Follow;->armPending()V
  .line 1264
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 1265
    invoke-static { v1 }, Lcom/innioasis/ipp/Follow;->toPlaying(Landroid/app/Activity;)V
  .line 1266
    return v4
  :L8
  .line 1268
    const/high16 v1, 0x24000000
    invoke-virtual { v2, v1 }, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
  .line 1269
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
    if-eqz v1, :L9
  .line 1270
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingPath()Ljava/lang/String;
    move-result-object v3
    invoke-static { v2, v1, v3 }, Lcom/innioasis/ipp/Albums;->restore(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V
    goto :L11
  :L9
  .line 1271
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcGenre:Z
    if-eqz v1, :L10
  .line 1272
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Genres;->restore(Landroid/content/Intent;Ljava/lang/String;)V
    goto :L11
  :L10
  .line 1274
    invoke-static { }, Lcom/innioasis/ipp/Follow;->armPending()V
  :L11
  .line 1276
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L12
  .line 1277
    return v4
  :L13
  .line 1251
    return v0
  :L14
  .line 1278
    move-exception p0
  .line 1279
    return v0
.end method

.method private static ordered(Landroid/app/Activity;Ljava/util/List;)Z
  .catchall { :L0 .. :L9 } :L14
  .registers 8
  .line 1062
    const/4 v0, 1
    if-eqz p0, :L15
    if-eqz p1, :L15
  :L0
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L15
  :L1
  .line 1063
    sget-object v1, Lcom/innioasis/ipp/Queue;->lastList:Ljava/lang/ref/WeakReference;
  .line 1064
    if-nez v1, :L2
    const/4 v1, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L3
  .line 1065
    instance-of v2, v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v2, :L4
    return v0
  :L4
  .line 1066
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 1067
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v2
    if-eq v2, p0, :L5
    return v0
  :L5
  .line 1068
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object p0
  .line 1069
    if-eqz p0, :L13
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v2
    if-eq v1, v2, :L6
    goto :L13
  :L6
  .line 1070
    const/4 v1, 0
    const/4 v2, 0
  :L7
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L12
  .line 1071
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 1072
    instance-of v5, v3, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L11
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L8
    goto :L11
  :L8
  .line 1073
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
  .line 1070
    add-int/lit8 v2, v2, 1
    goto :L7
  :L11
  .line 1072
    return v0
  :L12
  .line 1075
    return v0
  :L13
  .line 1069
    return v0
  :L14
  .line 1076
    move-exception p0
  .line 1077
    return v0
  :L15
  .line 1062
    return v0
.end method

.method private static pastRestartPoint(Lcom/innioasis/y1/service/PlayerService;)Z
  .catchall { :L0 .. :L3 } :L5
  .registers 8
  .line 847
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayerIsPrepared()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 848
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getDuration()J
    move-result-wide v1
  .line 849
    const-wide/16 v3, 0
    cmp-long v5, v1, v3
    if-gtz v5, :L2
    return v0
  :L2
  .line 850
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getCurrentPosition()J
    move-result-wide v3
  :L3
  .line 851
    const-wide/16 v5, 4000
    cmp-long p0, v3, v5
    if-ltz p0, :L4
    cmp-long p0, v3, v1
    if-gtz p0, :L4
    const/4 v0, 1
  :L4
    return v0
  :L5
  .line 852
    move-exception p0
  .line 853
    return v0
.end method

.method private static pendingBefore(I)I
  .registers 5
  .line 402
    nop
  .line 403
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v0, v3, :L2
  .line 404
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 405
    if-ltz v2, :L1
    if-ge v2, p0, :L1
    add-int/lit8 v1, v1, 1
  :L1
  .line 403
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 407
    return v1
.end method

.method private static pendingGuest(I)Z
  .registers 2
  .line 397
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->has(Ljava/util/ArrayList;I)Z
    move-result p0
    return p0
.end method

.method public static playRow(I)V
  .catch Ljava/lang/Exception; { :L0 .. :L10 } :L14
  .registers 6
  :L0
  .line 1716
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 1717
    if-eqz v0, :L13
    if-gez p0, :L1
    goto :L13
  :L1
  .line 1718
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1719
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 1720
    if-eqz v1, :L12
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L2
    goto :L12
  :L2
  .line 1721
    if-nez p0, :L3
    return-void
  :L3
  .line 1723
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
  .line 1724
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v3
    if-eqz v3, :L5
  .line 1725
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->pushHist(I)V
  .line 1726
    add-int/lit8 p0, p0, -1
    invoke-static { v1, p0, v2 }, Lcom/innioasis/ipp/Queue;->takeManual(Ljava/util/List;II)I
    move-result p0
  .line 1727
    if-gez p0, :L4
    return-void
  :L4
  .line 1728
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 1729
    goto :L9
  :L5
  .line 1730
    sget-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    array-length v4, v3
    if-lt p0, v4, :L6
    return-void
  :L6
  .line 1731
    aget p0, v3, p0
  .line 1732
    if-ltz p0, :L11
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p0, v1, :L7
    goto :L11
  :L7
  .line 1733
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->pushHist(I)V
  .line 1734
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->resume:I
  .line 1735
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v1
    if-eqz v1, :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropPlanThrough(I)V
  :L8
  .line 1736
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L9
  .line 1738
    const/4 p0, 0
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/service/PlayerService;->restartPlay(Z)V
  :L10
  .line 1740
    goto :L15
  :L11
  .line 1732
    return-void
  :L12
  .line 1720
    return-void
  :L13
  .line 1717
    return-void
  :L14
  .line 1739
    move-exception p0
  :L15
  .line 1741
    return-void
.end method

.method private static playingMusicPath()Ljava/lang/String;
  .registers 2
  .line 1319
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 1320
    const/4 v1, 0
    if-nez v0, :L0
  .line 1321
    return-object v1
  :L0
  .line 1323
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 1324
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
  .line 1388
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 1389
    if-nez v1, :L1
    move-object v1, v0
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L2
  .line 1390
    if-nez v1, :L3
    goto :L4
  :L3
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  :L4
    return-object v0
  :L5
  .line 1391
    move-exception v1
  .line 1392
    return-object v0
.end method

.method private static popCycle(II)I
  .registers 4
  .line 875
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->ensureCycle(II)V
  :L0
  .line 876
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 877
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Integer;
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  .line 878
    if-eq v0, p1, :L1
    if-ltz v0, :L1
    if-ge v0, p0, :L1
    return v0
  :L1
  .line 879
    goto :L0
  :L2
  .line 880
    const/4 p0, -1
    return p0
.end method

.method public static prevAction(Lcom/innioasis/y1/service/PlayerService;)I
  .catch Ljava/lang/Exception; { :L0 .. :L12 } :L14
  .registers 9
  .line 1531
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 1532
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1533
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 1534
    if-eqz v1, :L13
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L1
    goto/16 :L13
  :L1
  .line 1535
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
  .line 1536
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v3
  .line 1537
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 1539
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->pastRestartPoint(Lcom/innioasis/y1/service/PlayerService;)Z
    move-result v4
    if-eqz v4, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L2
  .line 1541
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v4
    const/4 v5, -1
    const/4 v6, 1
    if-eqz v4, :L8
  .line 1543
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
  .line 1545
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v7
    if-eqz v7, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L4
  .line 1546
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v7
    sub-int/2addr v7, v6
    invoke-virtual { v1, v7 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  .line 1547
    if-ltz v1, :L7
    if-lt v1, v2, :L5
    goto :L7
  :L5
  .line 1548
    invoke-static { v3, v1, v2 }, Lcom/innioasis/ipp/Queue;->putBackInPlan(III)V
  .line 1549
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v3
    sget v7, Lcom/innioasis/ipp/Queue;->passLen:I
    if-lt v3, v7, :L6
  .line 1551
    invoke-virtual { v4 }, Ljava/util/ArrayList;->clear()V
  .line 1552
    sput v2, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 1553
    sput v2, Lcom/innioasis/ipp/Queue;->passLen:I
  :L6
  .line 1555
    sput v5, Lcom/innioasis/ipp/Queue;->resume:I
  .line 1556
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 1557
    return v6
  :L7
  .line 1547
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L8
  .line 1560
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->prevSeq(I)I
    move-result v2
  .line 1561
    if-gez v2, :L11
  .line 1562
    sget-object v2, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
    invoke-static { p0, v2, v0 }, Lcom/innioasis/ipp/Queue;->restorePass(Lcom/innioasis/y1/service/PlayerService;Ljava/util/ArrayList;Z)Z
    move-result v2
    if-eqz v2, :L9
    return v6
  :L9
  .line 1563
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result v2
    if-nez v2, :L10
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L10
  .line 1566
    sget-object v2, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->notePass(Ljava/util/ArrayList;)V
  .line 1567
    invoke-static { }, Lcom/innioasis/ipp/Queue;->stripGuests()V
  .line 1568
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  .line 1569
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->prevSeq(I)I
    move-result v2
  .line 1570
    if-gez v2, :L11
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L11
  .line 1572
    sput v5, Lcom/innioasis/ipp/Queue;->resume:I
  .line 1573
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L12
  .line 1574
    return v6
  :L13
  .line 1534
    return v0
  :L14
  .line 1575
    move-exception p0
  .line 1576
    return v0
.end method

.method private static prevSeq(I)I
  .registers 2
  .line 753
    add-int/lit8 p0, p0, -1
  :L0
    if-ltz p0, :L2
  .line 754
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v0
    if-nez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->pendingGuest(I)Z
    move-result v0
    if-nez v0, :L1
    return p0
  :L1
  .line 753
    add-int/lit8 p0, p0, -1
    goto :L0
  :L2
  .line 756
    const/4 p0, -1
    return p0
.end method

.method private static pushHist(I)V
  .registers 2
  .line 907
    if-gez p0, :L0
    return-void
  :L0
  .line 908
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 909
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 910
    return-void
.end method

.method private static putBackInPlan(III)V
  .registers 4
  .line 1585
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 1586
    if-ltz p0, :L4
    if-ge p0, p2, :L4
    if-ne p0, p1, :L1
    goto :L4
  :L1
  .line 1587
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result p1
    if-eqz p1, :L2
    return-void
  :L2
  .line 1588
    sget p1, Lcom/innioasis/ipp/Queue;->planFor:I
    if-eq p1, p2, :L3
    return-void
  :L3
  .line 1589
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropFromPlan(I)V
  .line 1590
    sget-object p1, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    const/4 p2, 0
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { p1, p2, p0 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 1591
    return-void
  :L4
  .line 1586
    return-void
.end method

.method private static queued(I)Z
  .registers 2
  .line 441
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
  .line 1515
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1516
    const/4 v1, 0
  :L0
    if-ge v1, p0, :L2
  .line 1517
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
  .line 1516
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 1519
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-eqz p0, :L3
    const/4 p0, -1
    return p0
  :L3
  .line 1520
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
  .line 376
    invoke-virtual { p0 }, Ljava/util/ArrayList;->clear()V
  .line 377
    if-eqz p1, :L0
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
  :L0
  .line 378
    return-void
.end method

.method public static relist(Ljava/lang/Object;)V
  .catchall { :L0 .. :L15 } :L20
  .registers 7
  :L0
  .line 948
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L1
    return-void
  :L1
  .line 949
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->noteBuilt(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 950
    sget-object v0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-eqz v0, :L19
    sget-boolean v0, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
    if-nez v0, :L2
    goto/16 :L19
  :L2
  .line 951
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 952
    if-nez v0, :L3
    return-void
  :L3
  .line 953
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 954
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 955
    if-eqz v1, :L18
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L4
    goto/16 :L18
  :L4
  .line 956
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
  .line 957
    if-ltz v2, :L17
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v2, v3, :L5
    goto :L17
  :L5
  .line 958
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 959
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-nez v3, :L6
    return-void
  :L6
  .line 961
    move-object v3, p0
    check-cast v3, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v3
  .line 962
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
  .line 963
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->sameOrder(Ljava/util/List;Ljava/util/List;)Z
    move-result v1
    if-eqz v1, :L8
    return-void
  :L8
  .line 964
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->fromSource(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L9
    return-void
  :L9
  .line 966
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 967
    nop
  .line 968
    nop
  :L10
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v4, v1, :L12
  .line 969
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 970
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
  .line 968
    add-int/lit8 v4, v4, 1
    goto :L10
  :L12
    const/4 v4, -1
  :L13
  .line 972
    if-gez v4, :L14
    return-void
  :L14
  .line 975
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->setList(Lcom/innioasis/y1/service/PlayerService;Ljava/util/List;)V
  .line 976
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  .line 978
    invoke-static { }, Lcom/innioasis/ipp/Queue;->clearSession()V
  :L15
  .line 980
    goto :L21
  :L16
  .line 962
    return-void
  :L17
  .line 957
    return-void
  :L18
  .line 955
    return-void
  :L19
  .line 950
    return-void
  :L20
  .line 979
    move-exception p0
  :L21
  .line 981
    return-void
.end method

.method public static removeRow(I)V
  .registers 3
  .line 1682
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v0
    if-eqz v0, :L1
  .line 1683
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    add-int/lit8 p0, p0, -1
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 1684
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  .line 1685
    if-ltz p0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropGuest(I)V
  :L0
  .line 1686
    return-void
  :L1
  .line 1688
    if-lez p0, :L4
    sget-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    array-length v1, v0
    if-lt p0, v1, :L2
    goto :L4
  :L2
  .line 1689
    aget p0, v0, p0
  .line 1690
    if-gez p0, :L3
    return-void
  :L3
  .line 1691
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1692
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropFromPlan(I)V
  .line 1693
    return-void
  :L4
  .line 1688
    return-void
.end method

.method private static repeatAll()Z
  .registers 2
  .line 720
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 721
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
  .line 349
    const/4 v0, 0
  :L0
    invoke-virtual { p1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L9
    if-nez p0, :L1
    goto :L9
  :L1
  .line 350
    invoke-virtual { p1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
    invoke-virtual { p1, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/ipp/Queue$Pass;
  .line 351
    if-eqz p1, :L8
    iget-object v1, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    if-eqz v1, :L8
    iget-object v1, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L2
    goto :L8
  :L2
  .line 352
    new-instance v1, Ljava/util/ArrayList;
    iget-object v3, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-direct { v1, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Queue;->setList(Lcom/innioasis/y1/service/PlayerService;Ljava/util/List;)V
  .line 353
    sget-object v1, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    iget-object v3, p1, Lcom/innioasis/ipp/Queue$Pass;->spent:Ljava/util/ArrayList;
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 354
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    iget-object v3, p1, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 355
    sget-object v3, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    iget-object v4, p1, Lcom/innioasis/ipp/Queue$Pass;->plan:Ljava/util/ArrayList;
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 356
    sget-object v3, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    iget-object v4, p1, Lcom/innioasis/ipp/Queue$Pass;->skip:Ljava/util/ArrayList;
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 357
    iget v3, p1, Lcom/innioasis/ipp/Queue$Pass;->passLen:I
    sput v3, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 358
    iget v3, p1, Lcom/innioasis/ipp/Queue$Pass;->planFor:I
    sput v3, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 359
    const/4 v3, -1
    sput v3, Lcom/innioasis/ipp/Queue;->resume:I
  .line 361
    if-eqz p2, :L3
  .line 362
    invoke-virtual { v1 }, Ljava/util/ArrayList;->clear()V
  .line 363
    iget-object p2, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-virtual { p2 }, Ljava/util/ArrayList;->size()I
    move-result p2
    invoke-static { p2, v3 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result p2
    goto :L4
  :L3
  .line 365
    iget p2, p1, Lcom/innioasis/ipp/Queue$Pass;->index:I
  :L4
  .line 367
    if-ltz p2, :L5
    iget-object p1, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-virtual { p1 }, Ljava/util/ArrayList;->size()I
    move-result p1
    if-lt p2, p1, :L6
  :L5
    const/4 p2, 0
  :L6
  .line 368
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L7
  .line 369
    return v2
  :L8
  .line 351
    return v0
  :L9
  .line 349
    return v0
  :L10
  .line 370
    move-exception p0
  .line 371
    return v0
.end method

.method private static sameOrder(Ljava/util/List;Ljava/util/List;)Z
  .registers 8
  .line 995
    nop
  .line 996
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v1, v3, :L7
  .line 997
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->queued(I)Z
    move-result v3
    if-eqz v3, :L1
    goto :L5
  :L1
  .line 998
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v2, v3, :L2
    return v0
  :L2
  .line 999
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    add-int/lit8 v4, v2, 1
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 1000
    instance-of v5, v3, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L6
    instance-of v5, v2, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L3
    goto :L6
  :L3
  .line 1001
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
  .line 996
    add-int/lit8 v1, v1, 1
    goto :L0
  :L6
  .line 1000
    return v0
  :L7
  .line 1003
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
  .line 1146
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v0
  .line 1147
    if-nez v0, :L1
    return-void
  :L1
  .line 1148
    invoke-interface { v0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
  .line 1149
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    if-nez v1, :L2
    const/4 p0, 0
    goto :L3
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->listSig(Lcom/innioasis/y1/service/PlayerService;)Ljava/lang/String;
    move-result-object p0
  :L3
  .line 1150
    const-string v1, "src_sig"
    const-string v2, ""
    if-nez p0, :L5
  :L4
  .line 1151
    invoke-interface { v0, v1, v2 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    goto :L10
  :L5
  .line 1153
    invoke-interface { v0, v1, p0 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1154
    const-string p0, "src_key"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-nez v1, :L6
    move-object v1, v2
  :L6
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1155
    const-string p0, "src_name"
    sget-object v1, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
    if-nez v1, :L7
    move-object v1, v2
  :L7
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1156
    const-string p0, "src_uri"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    const/4 v3, 0
    invoke-virtual { v1, v3 }, Landroid/content/Intent;->toUri(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1157
    const-string p0, "src_uuid"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->uuidExtras(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1158
    const-string p0, "src_level"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
    if-nez v1, :L8
    goto :L9
  :L8
    move-object v2, v1
  :L9
    invoke-interface { v0, p0, v2 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1159
    const-string p0, "src_genre"
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcGenre:Z
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  .line 1160
    const-string p0, "src_ordered"
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  :L10
  .line 1162
    invoke-interface { v0 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L11
  .line 1164
    goto :L13
  :L12
  .line 1163
    move-exception p0
  :L13
  .line 1165
    return-void
.end method

.method private static screenKind(Landroid/content/Context;)I
  .catchall { :L0 .. :L3 } :L6
  .registers 5
  .line 628
    const/4 v0, 0
  :L0
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    return v0
  :L1
  .line 629
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v1
  .line 630
    const-string v2, ".AllAudiobooksActivity"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    const/4 v3, 1
    if-eqz v2, :L2
    return v3
  :L2
  .line 632
    const-string v2, ".FilesActivity"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L5
  .line 633
    check-cast p0, Landroid/app/Activity;
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "now_path"
    invoke-virtual { p0, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 634
    if-eqz p0, :L5
    const-string v1, "/storage/sdcard0/Audiobooks"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L4
    const-string v1, "/storage/sdcard0/audiobooks"
  .line 635
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
  :L3
    if-eqz p0, :L5
  :L4
  .line 636
    return v3
  :L5
  .line 640
    goto :L7
  :L6
  .line 639
    move-exception p0
  :L7
  .line 641
    return v0
.end method

.method private static seqNo(I)I
  .registers 2
  .line 412
    add-int/lit8 v0, p0, 1
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->pendingBefore(I)I
    move-result p0
    sub-int/2addr v0, p0
  .line 413
    const/4 p0, 1
    if-ge v0, p0, :L0
    const/4 v0, 1
  :L0
    return v0
.end method

.method private static setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  .registers 3
  .line 145
    if-nez p0, :L0
    return-void
  :L0
  .line 146
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
    if-eqz v0, :L1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setAudiobookIndex(I)V
    goto :L2
  :L1
  .line 147
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setMusicIndex(I)V
  :L2
  .line 148
    return-void
.end method

.method private static setList(Lcom/innioasis/y1/service/PlayerService;Ljava/util/List;)V
  .registers 3
  .line 151
    if-eqz p0, :L3
    if-nez p1, :L0
    goto :L3
  :L0
  .line 152
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
    if-eqz v0, :L1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setAudiobookList(Ljava/util/List;)V
    goto :L2
  :L1
  .line 153
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setMusicList(Ljava/util/List;)V
  :L2
  .line 154
    return-void
  :L3
  .line 151
    return-void
.end method

.method private static shiftDown(I)V
  .registers 4
  .line 470
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    add-int/lit8 v1, p0, 1
    const/4 v2, -1
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 471
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 472
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 473
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 474
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 475
    sget v0, Lcom/innioasis/ipp/Queue;->resume:I
    if-le v0, p0, :L0
    add-int/lit8 v0, v0, -1
    sput v0, Lcom/innioasis/ipp/Queue;->resume:I
  :L0
  .line 476
    sget p0, Lcom/innioasis/ipp/Queue;->planFor:I
    if-lez p0, :L1
    add-int/lit8 p0, p0, -1
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  :L1
  .line 477
    return-void
.end method

.method private static shiftUp(I)V
  .registers 3
  .line 459
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    const/4 v1, 1
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 460
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 461
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 462
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 463
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 464
    sget v0, Lcom/innioasis/ipp/Queue;->resume:I
    if-lt v0, p0, :L0
    add-int/2addr v0, v1
    sput v0, Lcom/innioasis/ipp/Queue;->resume:I
  :L0
  .line 465
    sget p0, Lcom/innioasis/ipp/Queue;->planFor:I
    if-ltz p0, :L1
    add-int/2addr p0, v1
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  :L1
  .line 466
    return-void
.end method

.method private static shuffle()Z
  .registers 2
  .line 157
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 158
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
  .line 382
    const/4 v0, -1
    const/4 v1, 0
    filled-new-array { v1, v0 }, [I
    move-result-object v0
  :L0
  .line 384
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v2
  .line 385
    if-nez v2, :L1
    return-object v0
  :L1
  .line 386
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v3
  .line 387
    if-nez v3, :L2
    return-object v0
  :L2
  .line 388
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    aput v3, v0, v1
  .line 389
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
    const/4 v2, 1
    aput v1, v0, v2
  :L3
  .line 391
    goto :L5
  :L4
  .line 390
    move-exception v1
  :L5
  .line 392
    return-object v0
.end method

.method private static skipped(I)Z
  .registers 2
  .line 740
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method public static source()Ljava/lang/String;
  .registers 1
  .line 1024
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1025
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
  .line 860
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
  .line 861
    const-wide/16 v0, 0
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setCurrentPosition(J)V
  :L3
  .line 863
    goto :L5
  :L4
  .line 862
    move-exception p0
  :L5
  .line 864
    const/4 p0, 2
    return p0
.end method

.method private static stripGuests()V
  .catchall { :L0 .. :L9 } :L11
  .registers 7
  :L0
  .line 279
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 280
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 281
    if-nez v1, :L2
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
    return-void
  :L2
  .line 282
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v2
  .line 283
    if-nez v2, :L3
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
    return-void
  :L3
  .line 284
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-nez v0, :L10
  .line 285
    nop
  .line 286
    const/4 v0, -1
    const/4 v3, 0
    const/4 v3, -1
    const/4 v4, 0
  :L4
    sget-object v5, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v4, v6, :L6
  .line 287
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/Integer;
    invoke-virtual { v5 }, Ljava/lang/Integer;->intValue()I
    move-result v5
  .line 288
    if-le v5, v3, :L5
    move v0, v4
    move v3, v5
  :L5
  .line 286
    add-int/lit8 v4, v4, 1
    goto :L4
  :L6
  .line 290
    invoke-virtual { v5, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 291
    if-ltz v3, :L3
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v0
    if-lt v3, v0, :L7
    goto :L3
  :L7
  .line 292
    invoke-interface { v2, v3 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 293
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v0
  .line 295
    if-le v0, v3, :L8
    add-int/lit8 v0, v0, -1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Queue;->setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  :L8
  .line 296
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->shiftDown(I)V
  :L9
  .line 297
    goto :L3
  :L10
  .line 299
    goto :L12
  :L11
  .line 298
    move-exception v0
  :L12
  .line 300
    return-void
.end method

.method private static svc()Lcom/innioasis/y1/service/PlayerService;
  .registers 1
  .line 112
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
    return-object v0
.end method

.method private static syncKind()V
  .registers 2
  .line 163
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
  .line 164
    sget v1, Lcom/innioasis/ipp/Queue;->kind:I
    if-ne v0, v1, :L0
    return-void
  :L0
  .line 165
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->dropGuestsFrom(I)V
  .line 166
    sput v0, Lcom/innioasis/ipp/Queue;->kind:I
  .line 167
    invoke-static { }, Lcom/innioasis/ipp/Queue;->clearSession()V
  .line 168
    return-void
.end method

.method private static syncShuffle(II)V
  .registers 5
  .line 764
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v0
  .line 765
    sget v1, Lcom/innioasis/ipp/Queue;->lastShuffle:I
    if-ne v1, v0, :L0
    return-void
  :L0
  .line 766
    const/4 v2, 1
    if-gez v1, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 767
    sput v0, Lcom/innioasis/ipp/Queue;->lastShuffle:I
  .line 768
    if-eqz v1, :L3
    return-void
  :L3
  .line 769
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->clear()V
  .line 770
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->resume:I
  .line 771
    if-ne v0, v2, :L4
  .line 772
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->newCycle(II)V
    goto :L5
  :L4
  .line 774
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->clear()V
  .line 775
    sput v1, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 776
    sput v2, Lcom/innioasis/ipp/Queue;->passLen:I
  :L5
  .line 778
    return-void
.end method

.method private static takeManual(Ljava/util/List;II)I
  .registers 5
  .line 1413
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1414
    sget-object v1, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v1, p1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/Integer;
    invoke-virtual { p1 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  .line 1415
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Queue;->guestAt(Ljava/util/List;ILcom/innioasis/y1/database/Song;)I
    move-result p1
  .line 1416
    if-ltz p1, :L1
  .line 1417
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Queue;->moveGuest(Ljava/util/List;II)I
    move-result p0
  .line 1418
    sget-object p1, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1420
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result p1
    if-eqz p1, :L0
    sget p1, Lcom/innioasis/ipp/Queue;->planFor:I
    if-ltz p1, :L0
    sget p1, Lcom/innioasis/ipp/Queue;->passLen:I
    add-int/lit8 p1, p1, 1
    sput p1, Lcom/innioasis/ipp/Queue;->passLen:I
  :L0
  .line 1421
    return p0
  :L1
  .line 1424
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Queue;->indexOf(Ljava/util/List;Lcom/innioasis/y1/database/Song;)I
    move-result p1
  .line 1425
    if-gez p1, :L3
  .line 1426
    invoke-interface { p0, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 1427
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p1
    add-int/lit8 p1, p1, -1
  .line 1428
    sget p2, Lcom/innioasis/ipp/Queue;->planFor:I
    if-ltz p2, :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  :L2
  .line 1429
    sget-object p0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p2
    invoke-virtual { p0, p2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L5
  :L3
  .line 1431
    sget p0, Lcom/innioasis/ipp/Queue;->resume:I
    if-gez p0, :L4
    sput p2, Lcom/innioasis/ipp/Queue;->resume:I
  :L4
  .line 1433
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result p0
    if-eqz p0, :L5
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->dropFromPlan(I)V
  :L5
  .line 1435
    return p1
.end method

.method public static takeNext(Lcom/innioasis/y1/service/PlayerService;)I
  .catch Ljava/lang/Exception; { :L0 .. :L12 } :L14
  .registers 9
  .line 1446
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 1447
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1448
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 1449
    if-eqz v1, :L13
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L1
    goto/16 :L13
  :L1
  .line 1450
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
  .line 1451
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v3
  .line 1452
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 1453
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v4
  .line 1454
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->pushHist(I)V
  .line 1456
    sget-object v5, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v5
    const/4 v6, 1
    if-nez v5, :L3
  .line 1457
    invoke-static { v1, v0, v3 }, Lcom/innioasis/ipp/Queue;->takeManual(Ljava/util/List;II)I
    move-result v1
  .line 1458
    if-gez v1, :L2
    return v0
  :L2
  .line 1459
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 1460
    return v6
  :L3
  .line 1463
    nop
  .line 1464
    sget v5, Lcom/innioasis/ipp/Queue;->resume:I
    const/4 v7, -1
    if-ltz v5, :L6
  .line 1465
    nop
  .line 1466
    sput v7, Lcom/innioasis/ipp/Queue;->resume:I
  .line 1467
    if-ltz v5, :L5
    if-lt v5, v2, :L4
    goto :L5
  :L4
    move v3, v5
    goto :L6
  :L5
    const/4 v3, 0
  :L6
  .line 1470
    if-eqz v4, :L8
  .line 1471
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->nextShuffled(II)I
    move-result v1
  .line 1472
    if-gez v1, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->stopAtEnd(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L7
  .line 1473
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 1474
    return v6
  :L8
  .line 1477
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v2
  .line 1478
    if-gez v2, :L11
  .line 1479
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result v2
    if-nez v2, :L9
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->stopAtEnd(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L9
  .line 1481
    sget-object v2, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
    invoke-static { p0, v2, v6 }, Lcom/innioasis/ipp/Queue;->restorePass(Lcom/innioasis/y1/service/PlayerService;Ljava/util/ArrayList;Z)Z
    move-result v2
    if-eqz v2, :L10
    return v6
  :L10
  .line 1482
    invoke-static { }, Lcom/innioasis/ipp/Queue;->dropGuests()V
  .line 1483
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  .line 1484
    invoke-static { v1, v7 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v2
  .line 1485
    if-gez v2, :L11
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->stopAtEnd(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L11
  .line 1487
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L12
  .line 1488
    return v6
  :L13
  .line 1449
    return v0
  :L14
  .line 1489
    move-exception p0
  .line 1490
    return v0
.end method

.method private static toStart(Lcom/innioasis/y1/service/PlayerService;)I
  .catchall { :L0 .. :L1 } :L3
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L8 .. :L9 } :L10
  .registers 8
  .line 822
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
  .line 825
    goto :L4
  :L3
  .line 823
    move-exception v4
  .line 824
    nop
  :L4
  .line 826
    const/4 v4, 2
    if-eqz v2, :L8
  :L5
  .line 828
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setCurrentPosition(J)V
  .line 829
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->isPlaying()Z
    move-result v0
    if-nez v0, :L6
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/service/PlayerService;->play(Z)V
  :L6
  .line 830
    return v4
  :L7
  .line 831
    move-exception v0
  :L8
  .line 835
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/service/PlayerService;->restartPlay(Z)V
  :L9
  .line 837
    goto :L11
  :L10
  .line 836
    move-exception p0
  :L11
  .line 838
    return v4
.end method

.method private static toast(I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 3
  :L0
  .line 612
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 613
    if-nez v0, :L1
    return-void
  :L1
  .line 614
    invoke-virtual { v0, p0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    const/4 v1, 0
    invoke-static { v0, p0, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
  .line 615
    invoke-virtual { p0 }, Landroid/widget/Toast;->getView()Landroid/view/View;
    move-result-object v0
  .line 616
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    const v1, 16908299
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L3
  .line 617
    instance-of v1, v0, Landroid/widget/TextView;
    if-eqz v1, :L4
  .line 618
    check-cast v0, Landroid/widget/TextView;
    const/16 v1, 17
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setGravity(I)V
  :L4
  .line 620
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L5
  .line 622
    goto :L7
  :L6
  .line 621
    move-exception p0
  :L7
  .line 623
    return-void
.end method

.method public static trackNo(Lcom/innioasis/y1/service/PlayerService;)I
  .catch Ljava/lang/Exception; { :L0 .. :L4 } :L9
  .registers 4
  .line 795
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 796
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 797
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 798
    if-nez v1, :L1
    const/4 v1, 0
    goto :L2
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  :L2
  .line 799
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
  .line 800
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 801
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v2
    if-nez v2, :L3
  .line 803
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->seqNo(I)I
    move-result p0
    return p0
  :L3
  .line 805
    sget p0, Lcom/innioasis/ipp/Queue;->passLen:I
    sget-object v2, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v2
  :L4
    sub-int/2addr p0, v2
  .line 806
    if-ge p0, v0, :L5
    goto :L6
  :L5
    move v0, p0
  :L6
  .line 807
    if-lez v1, :L7
    if-le v0, v1, :L7
    goto :L8
  :L7
  .line 808
    move v1, v0
  :L8
    return v1
  :L9
  .line 809
    move-exception p0
  .line 810
    return v0
.end method

.method private static unwrap(Ljava/util/ArrayList;Ljava/lang/Object;)V
  .registers 3
  .line 570
    if-nez p1, :L0
    return-void
  :L0
  .line 571
    instance-of v0, p1, Lcom/innioasis/music/SearchActivity$Item;
    if-eqz v0, :L3
  .line 572
    check-cast p1, Lcom/innioasis/music/SearchActivity$Item;
  .line 573
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
    if-eqz v0, :L1
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getSong()Lcom/innioasis/y1/database/Song;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L2
  :L1
  .line 574
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getAlbum()Lcom/innioasis/music/data/Album;
    move-result-object v0
    if-eqz v0, :L2
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getAlbum()Lcom/innioasis/music/data/Album;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 575
    return-void
  :L3
  .line 577
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 578
    return-void
.end method

.method public static upNext()Ljava/util/List;
  .catch Ljava/lang/Exception; { :L0 .. :L19 } :L20
  .registers 10
  .line 1598
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1599
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1601
    const/4 v2, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v3
  .line 1602
    if-nez v3, :L1
    new-array v3, v2, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    sput v2, Lcom/innioasis/ipp/Queue;->rowManual:I
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
    return-object v0
  :L1
  .line 1603
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1604
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v4
  .line 1605
    if-eqz v4, :L18
    invoke-interface { v4 }, Ljava/util/List;->isEmpty()Z
    move-result v5
    if-eqz v5, :L2
    goto/16 :L18
  :L2
  .line 1606
    invoke-interface { v4 }, Ljava/util/List;->size()I
    move-result v5
  .line 1607
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v3
  .line 1608
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 1610
    if-ltz v3, :L3
    if-ge v3, v5, :L3
  .line 1611
    invoke-interface { v4, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    invoke-virtual { v0, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1612
    invoke-static { v3 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1615
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
  .line 1616
    const/4 v7, 0
  :L6
    if-ge v7, v6, :L7
  .line 1617
    sget-object v9, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v9, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v9
    invoke-virtual { v0, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1618
    const/4 v9, -1
    invoke-static { v9 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-virtual { v1, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1616
    add-int/lit8 v7, v7, 1
    goto :L6
  :L7
  .line 1620
    sput v6, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 1621
    sget-object v6, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v6
    sput v6, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 1624
    sget v6, Lcom/innioasis/ipp/Queue;->resume:I
    if-ltz v6, :L8
    goto :L9
  :L8
    move v6, v3
  :L9
  .line 1625
    if-ltz v6, :L10
    if-lt v6, v5, :L11
  :L10
    const/4 v6, 0
  :L11
  .line 1626
    nop
  .line 1627
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v7
    if-eqz v7, :L15
  .line 1628
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Queue;->ensureCycle(II)V
  .line 1629
    const/4 v6, 0
  :L12
    sget-object v7, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result v9
    if-ge v6, v9, :L17
    if-lez v8, :L17
  .line 1630
    invoke-virtual { v7, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Integer;
    invoke-virtual { v7 }, Ljava/lang/Integer;->intValue()I
    move-result v7
  .line 1631
    if-eq v7, v3, :L14
    if-ltz v7, :L14
    if-ge v7, v5, :L14
    invoke-static { v7 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v9
    if-eqz v9, :L13
    goto :L14
  :L13
  .line 1632
    invoke-interface { v4, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
    invoke-virtual { v0, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1633
    invoke-static { v7 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v7
    invoke-virtual { v1, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1634
    add-int/lit8 v8, v8, -1
  :L14
  .line 1629
    add-int/lit8 v6, v6, 1
    goto :L12
  :L15
  .line 1637
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v3
  :L16
    if-ltz v3, :L17
    if-lez v8, :L17
  .line 1638
    invoke-interface { v4, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    invoke-virtual { v0, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1639
    invoke-static { v3 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1640
    add-int/lit8 v8, v8, -1
  .line 1637
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v3
    goto :L16
  :L17
  .line 1644
    goto :L21
  :L18
  .line 1605
    new-array v3, v2, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    sput v2, Lcom/innioasis/ipp/Queue;->rowManual:I
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  :L19
    return-object v0
  :L20
  .line 1643
    move-exception v3
  :L21
  .line 1645
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    new-array v3, v3, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 1646
    nop
  :L22
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L23
  .line 1647
    sget-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    aput v4, v3, v2
  .line 1646
    add-int/lit8 v2, v2, 1
    goto :L22
  :L23
  .line 1649
    return-object v0
.end method

.method private static uuidExtras(Landroid/content/Intent;)Ljava/lang/String;
  .catchall { :L0 .. :L5 } :L7
  .registers 6
  .line 1184
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  :L0
  .line 1186
    invoke-virtual { p0 }, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object p0
  .line 1187
    if-nez p0, :L1
    const-string p0, ""
    return-object p0
  :L1
  .line 1188
    invoke-virtual { p0 }, Landroid/os/Bundle;->keySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L2
  .line 1189
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L6
  .line 1190
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
  .line 1191
    invoke-virtual { p0, v2 }, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v3
  .line 1192
    instance-of v4, v3, Ljava/util/UUID;
    if-nez v4, :L3
    goto :L2
  :L3
  .line 1193
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->length()I
    move-result v4
    if-lez v4, :L4
    const/16 v4, 10
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L4
  .line 1194
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v4, 61
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v3 }, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L5
  .line 1195
    goto :L2
  :L6
  .line 1198
    nop
  .line 1199
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L7
  .line 1196
    move-exception p0
  .line 1197
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

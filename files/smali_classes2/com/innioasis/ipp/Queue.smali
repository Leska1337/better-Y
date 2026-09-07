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
  .line 80
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
  .line 86
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
  .line 96
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
  .line 97
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
  .line 98
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
  .line 99
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
  .line 101
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
  .line 103
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
  .line 104
    new-instance v0, Ljava/util/Random;
    invoke-direct { v0 }, Ljava/util/Random;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Queue;->rnd:Ljava/util/Random;
  .line 114
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->kind:I
  .line 117
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->resume:I
  .line 119
    sput v1, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 128
    sput v1, Lcom/innioasis/ipp/Queue;->lastShuffle:I
  .line 140
    const/4 v2, 1
    sput v2, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 143
    new-array v3, v0, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 144
    sput v0, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 145
    sput v0, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 738
    sput v1, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 1294
    const-string v0, ""
    sput-object v0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1401
    sput-boolean v2, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 66
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static add(Lcom/innioasis/y1/database/Song;)V
  .registers 2
  .line 274
    if-nez p0, :L0
    return-void
  :L0
  .line 275
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 276
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 277
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->insertGuest(Lcom/innioasis/y1/database/Song;)I
    move-result p0
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 278
    return-void
.end method

.method public static addAll(Ljava/util/List;)V
  .registers 4
  .line 615
    if-nez p0, :L0
    return-void
  :L0
  .line 619
    sget v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 620
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 621
    if-gez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->kindOfSongs(Ljava/util/List;)I
    move-result v0
  :L1
  .line 622
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->allowedFrom(I)Z
    move-result v0
    if-nez v0, :L2
    return-void
  :L2
  .line 623
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
  .line 624
    const/4 v1, 0
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 625
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->add(Lcom/innioasis/y1/database/Song;)V
  .line 624
    add-int/lit8 v1, v1, 1
    goto :L3
  :L4
  .line 627
    sget-object p0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result p0
    if-ne p0, v0, :L5
    return-void
  :L5
  .line 628
    const p0, 2131821048
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toast(I)V
  .line 629
    return-void
.end method

.method public static addAllFromMusic(Ljava/util/List;)V
  .registers 2
  .line 742
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 743
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->addAll(Ljava/util/List;)V
  .line 744
    return-void
.end method

.method public static addFromAdapter(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 639
    if-nez p0, :L0
    return-void
  :L0
  .line 640
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->screenKind(Landroid/content/Context;)I
    move-result v0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 641
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 642
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 643
    if-eqz v1, :L4
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L4
  .line 644
    const/4 v2, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 645
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v3
  .line 646
    if-eqz v3, :L2
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 644
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 650
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 651
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
    goto :L5
  :L4
  .line 653
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 654
    if-eqz p0, :L5
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 656
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->addPicked(Ljava/util/List;)V
  .line 657
    return-void
.end method

.method public static addFromListView(Landroid/widget/ListView;)V
  .registers 2
  .line 665
    if-nez p0, :L0
    return-void
  :L0
  .line 666
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object p0
  .line 667
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v0, :L1
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->addFromAdapter(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  :L1
  .line 668
    return-void
.end method

.method public static addFromRvAdapter(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .registers 5
  .line 672
    if-nez p0, :L0
    return-void
  :L0
  .line 673
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 674
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 675
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v2
  .line 676
    if-eqz v2, :L4
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-nez v3, :L4
  .line 677
    nop
  :L1
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L3
  .line 678
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v3
  .line 679
    if-eqz v3, :L2
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 677
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 681
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 682
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
    goto :L5
  :L4
  .line 684
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p0
  .line 685
    if-eqz p0, :L5
    invoke-virtual { v1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 687
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->addPicked(Ljava/util/List;)V
  .line 688
    return-void
.end method

.method public static addFromSearch(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .registers 5
  .line 699
    if-nez p0, :L0
    return-void
  :L0
  .line 700
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Queue;->fromKind:I
  .line 701
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 702
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v2
  .line 703
    if-eqz v2, :L3
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-nez v3, :L3
  .line 704
    nop
  :L1
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L2
  .line 705
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->unwrap(Ljava/util/ArrayList;Ljava/lang/Object;)V
  .line 704
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 707
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 708
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
    goto :L4
  :L3
  .line 710
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p0
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Queue;->unwrap(Ljava/util/ArrayList;Ljava/lang/Object;)V
  :L4
  .line 712
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->addPicked(Ljava/util/List;)V
  .line 713
    return-void
.end method

.method private static addPicked(Ljava/util/List;)V
  .catch Ljava/lang/Exception; { :L0 .. :L11 } :L12
  .registers 8
  :L0
  .line 834
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 835
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 836
    const/4 v2, 0
    const/4 v3, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L10
  .line 837
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 838
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L2
  .line 839
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L9
  :L2
  .line 840
    instance-of v5, v4, Lcom/innioasis/music/data/Album;
    if-eqz v5, :L5
  .line 841
    move-object v5, v4
    check-cast v5, Lcom/innioasis/music/data/Album;
    invoke-virtual { v5 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v5
  .line 842
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L3
  .line 844
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->allSongsArtist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->artistSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/lang/String;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L4
  :L3
  .line 847
    check-cast v4, Lcom/innioasis/music/data/Album;
    const/4 v5, 0
    invoke-virtual { v0, v4, v2, v5 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByAlbumSync(Lcom/innioasis/music/data/Album;ILcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
  :L4
  .line 849
    goto :L9
  :L5
    instance-of v5, v4, Lcom/innioasis/y1/database/Playlist;
    if-eqz v5, :L6
  .line 850
    check-cast v4, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v0, v4 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByPlaylistSync(Lcom/innioasis/y1/database/Playlist;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L9
  :L6
  .line 851
    instance-of v5, v4, Lcom/innioasis/music/data/Genre;
    if-eqz v5, :L7
  .line 852
    check-cast v4, Lcom/innioasis/music/data/Genre;
    invoke-virtual { v0, v4 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByGenreSync(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L9
  :L7
  .line 853
    instance-of v5, v4, Ljava/io/File;
    if-eqz v5, :L8
  .line 854
    check-cast v4, Ljava/io/File;
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->fileSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
    goto :L9
  :L8
  .line 855
    instance-of v5, v4, Ljava/lang/String;
    if-eqz v5, :L9
  .line 856
    check-cast v4, Ljava/lang/String;
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->artistSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/lang/String;)Ljava/util/List;
    move-result-object v4
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Queue;->collect(Ljava/util/ArrayList;Ljava/util/List;)V
  :L9
  .line 836
    add-int/lit8 v3, v3, 1
    goto :L1
  :L10
  .line 859
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->addAll(Ljava/util/List;)V
  :L11
  .line 862
    goto :L13
  :L12
  .line 860
    move-exception p0
  :L13
  .line 863
    return-void
.end method

.method private static allowedFrom(I)Z
  .catchall { :L0 .. :L8 } :L11
  .registers 6
  .line 814
    const/4 v0, 1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 815
    if-nez v1, :L1
    return v0
  :L1
  .line 816
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlaying()Lcom/innioasis/y1/service/PlayerService$Playing;
    move-result-object v2
  .line 818
    sget-object v3, Lcom/innioasis/y1/service/PlayerService$Playing;->Audiobook:Lcom/innioasis/y1/service/PlayerService$Playing;
    const/4 v4, 0
    if-ne v2, v3, :L2
    const/4 v2, 1
    goto :L3
  :L2
  .line 819
    sget-object v3, Lcom/innioasis/y1/service/PlayerService$Playing;->Music:Lcom/innioasis/y1/service/PlayerService$Playing;
    if-ne v2, v3, :L10
    const/4 v2, 0
  :L3
  .line 821
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Queue;->listOf(Lcom/innioasis/y1/service/PlayerService;I)Ljava/util/List;
    move-result-object v1
  .line 822
    if-eqz v1, :L9
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L4
    goto :L9
  :L4
  .line 823
    if-ne p0, v2, :L5
    return v0
  :L5
  .line 824
    if-ne v2, v0, :L6
    const p0, 2131821097
    goto :L7
  :L6
    const p0, 2131821098
  :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toast(I)V
  :L8
  .line 825
    return v4
  :L9
  .line 822
    return v0
  :L10
  .line 820
    return v0
  :L11
  .line 826
    move-exception p0
  .line 827
    return v0
.end method

.method private static artistSongs(Lcom/innioasis/y1/database/Y1Repository;Ljava/lang/String;)Ljava/util/List;
  .registers 2
  .line 890
    const/4 p0, 0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Artists;->forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method public static atSource()Z
  .catchall { :L0 .. :L1 } :L4
  .registers 3
  .line 1696
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1697
    sget-object v0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1698
    const/4 v1, 1
    if-nez v0, :L0
    return v1
  :L0
  .line 1700
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v2
  .line 1701
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
  .line 1702
    move-exception v0
  .line 1703
    return v1
.end method

.method public static atSource(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L10 } :L11
  .registers 7
  .line 1779
    const/4 v0, 1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1780
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1781
    if-nez v1, :L1
    return v0
  :L1
  .line 1782
    instance-of v2, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v2, :L2
    return v0
  :L2
  .line 1783
    move-object v2, p0
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v2
  .line 1784
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
  .line 1785
    sget-object v5, Lcom/innioasis/ipp/Queue;->memoAdapter:Ljava/lang/Object;
    if-ne p0, v5, :L5
    sget-object v5, Lcom/innioasis/ipp/Queue;->memoTitle:Ljava/lang/String;
    if-ne v3, v5, :L5
    sget-object v5, Lcom/innioasis/ipp/Queue;->memoKey:Ljava/lang/String;
    if-ne v1, v5, :L5
    sget-boolean p0, Lcom/innioasis/ipp/Queue;->memoAns:Z
    return p0
  :L5
  .line 1786
    instance-of v5, v2, Landroid/app/Activity;
    if-eqz v5, :L6
    move-object v4, v2
    check-cast v4, Landroid/app/Activity;
  :L6
    invoke-static { v4 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v2
  .line 1787
    sput-object p0, Lcom/innioasis/ipp/Queue;->memoAdapter:Ljava/lang/Object;
  .line 1788
    sput-object v3, Lcom/innioasis/ipp/Queue;->memoTitle:Ljava/lang/String;
  .line 1789
    sput-object v1, Lcom/innioasis/ipp/Queue;->memoKey:Ljava/lang/String;
  .line 1790
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
  .line 1791
    return p0
  :L11
  .line 1792
    move-exception p0
  .line 1793
    return v0
.end method

.method private static book()Z
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 173
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 174
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
  .line 175
    move-exception v1
  .line 176
    return v0
.end method

.method private static bump(Ljava/util/ArrayList;II)V
  .registers 5
  .line 604
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 605
    invoke-virtual { p0, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  .line 606
    if-lt v1, p1, :L1
    add-int/2addr v1, p2
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { p0, v0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 604
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 608
    return-void
.end method

.method public static canRemoveRow(I)Z
  .registers 3
  .line 2147
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
  .line 228
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 229
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 230
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 231
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 232
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 233
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 234
    sget-object v0, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 235
    sget-object v0, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 236
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Queue;->resume:I
  .line 237
    sput v0, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 238
    const/4 v1, 1
    sput v1, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 239
    sput v0, Lcom/innioasis/ipp/Queue;->lastShuffle:I
  .line 240
    return-void
.end method

.method private static collect(Ljava/util/ArrayList;Ljava/util/List;)V
  .registers 4
  .line 866
    if-nez p1, :L0
    return-void
  :L0
  .line 867
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L3
  .line 868
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L2
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 867
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 870
    return-void
.end method

.method public static consumeSkipRestart()Z
  .registers 2
  .line 1757
    sget-boolean v0, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  .line 1758
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  .line 1759
    return v0
.end method

.method private static dropFromPlan(I)V
  .registers 4
  .line 2152
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v0, v2, :L2
  .line 2153
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-ne v2, p0, :L1
  .line 2154
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 2155
    return-void
  :L1
  .line 2152
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 2158
    return-void
.end method

.method private static dropGuest(I)V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  :L0
  .line 331
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 332
    if-nez v0, :L1
    return-void
  :L1
  .line 333
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 334
    if-eqz v1, :L5
    if-ltz p0, :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
    if-lt p0, v2, :L2
    goto :L5
  :L2
  .line 335
    invoke-interface { v1, p0 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 336
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
  .line 337
    if-le v1, p0, :L3
    add-int/lit8 v1, v1, -1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Queue;->setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  :L3
  .line 338
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->shiftDown(I)V
  :L4
  .line 341
    goto :L7
  :L5
  .line 334
    return-void
  :L6
  .line 339
    move-exception p0
  :L7
  .line 342
    return-void
.end method

.method private static dropGuests()V
  .registers 1
  .line 353
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 354
    sget-object v0, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->notePass(Ljava/util/ArrayList;)V
  .line 355
    invoke-static { }, Lcom/innioasis/ipp/Queue;->stripGuests()V
  .line 356
    return-void
.end method

.method private static dropGuestsFrom(I)V
  .catchall { :L0 .. :L13 } :L15
  .registers 9
  :L0
  .line 245
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 246
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->listOf(Lcom/innioasis/y1/service/PlayerService;I)Ljava/util/List;
    move-result-object v1
  .line 247
    if-nez v1, :L1
    return-void
  :L1
  .line 248
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 249
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
  .line 250
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
  .line 251
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v4
    if-nez v4, :L14
  .line 252
    nop
  .line 253
    const/4 v4, -1
    const/4 v5, -1
    const/4 v6, 0
  :L6
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v7
    if-ge v6, v7, :L8
  .line 254
    invoke-virtual { v2, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Integer;
    invoke-virtual { v7 }, Ljava/lang/Integer;->intValue()I
    move-result v7
  .line 255
    if-le v7, v5, :L7
    move v4, v6
    move v5, v7
  :L7
  .line 253
    add-int/lit8 v6, v6, 1
    goto :L6
  :L8
  .line 257
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 258
    if-ltz v5, :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v4
    if-lt v5, v4, :L9
    goto :L5
  :L9
  .line 259
    invoke-interface { v1, v5 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 260
    const/4 v4, 1
    if-ne p0, v4, :L10
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getAudiobookIndex()I
    move-result v6
    goto :L11
  :L10
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicIndex()I
    move-result v6
  :L11
  .line 261
    if-le v6, v5, :L13
  .line 262
    if-ne p0, v4, :L12
    add-int/lit8 v6, v6, -1
    invoke-virtual { v0, v6 }, Lcom/innioasis/y1/service/PlayerService;->setAudiobookIndex(I)V
    goto :L13
  :L12
  .line 263
    add-int/lit8 v6, v6, -1
    invoke-virtual { v0, v6 }, Lcom/innioasis/y1/service/PlayerService;->setMusicIndex(I)V
  :L13
  .line 265
    goto :L5
  :L14
  .line 268
    goto :L16
  :L15
  .line 266
    move-exception p0
  :L16
  .line 269
    return-void
.end method

.method private static dropPlanThrough(I)V
  .registers 5
  .line 2199
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v1, v3, :L4
  .line 2200
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-ne v2, p0, :L3
  .line 2201
    const/4 p0, 0
  :L1
    if-gt p0, v1, :L2
  .line 2202
    sget-object v2, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 2201
    add-int/lit8 p0, p0, 1
    goto :L1
  :L2
  .line 2204
    return-void
  :L3
  .line 2199
    add-int/lit8 v1, v1, 1
    goto :L0
  :L4
  .line 2207
    return-void
.end method

.method private static dropStalePlayer()V
  .catchall { :L0 .. :L6 } :L7
  .registers 2
  :L0
  .line 1433
    sget-object v0, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L2
  .line 1434
    sput-object v1, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
  .line 1435
    instance-of v1, v0, Landroid/app/Activity;
    if-nez v1, :L3
    return-void
  :L3
  .line 1436
    check-cast v0, Landroid/app/Activity;
  .line 1437
    invoke-virtual { v0 }, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-eqz v1, :L4
    return-void
  :L4
  .line 1438
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object v1
    if-ne v0, v1, :L5
    return-void
  :L5
  .line 1439
    invoke-virtual { v0 }, Landroid/app/Activity;->finish()V
  :L6
  .line 1442
    goto :L8
  :L7
  .line 1440
    move-exception v0
  :L8
  .line 1443
    return-void
.end method

.method public static endOfList(Lcom/innioasis/y1/service/PlayerService;)Z
  .catch Ljava/lang/Exception; { :L0 .. :L7 } :L10
  .registers 4
  .line 1103
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 1104
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1105
    sget-object v1, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 1106
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 1107
    if-eqz v1, :L9
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L2
    goto :L9
  :L2
  .line 1108
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  .line 1109
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 1110
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result v2
    if-eqz v2, :L3
    return v0
  :L3
  .line 1111
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v2
    if-eqz v2, :L4
  .line 1112
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Queue;->ensureCycle(II)V
  .line 1113
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    return p0
  :L4
  .line 1115
    sget v2, Lcom/innioasis/ipp/Queue;->resume:I
    if-ltz v2, :L5
    goto :L6
  :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
  :L6
  .line 1116
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result p0
  :L7
    if-gez p0, :L8
    const/4 v0, 1
  :L8
    return v0
  :L9
  .line 1107
    return v0
  :L10
  .line 1117
    move-exception p0
  .line 1118
    return v0
.end method

.method private static ensureCycle(II)V
  .registers 3
  .line 1082
    if-gtz p0, :L0
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->clear()V
    return-void
  :L0
  .line 1083
    sget v0, Lcom/innioasis/ipp/Queue;->planFor:I
    if-eq v0, p0, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->newCycle(II)V
  :L1
  .line 1084
    return-void
.end method

.method private static ensureSource()V
  .catchall { :L1 .. :L13 } :L15
  .registers 11
  .line 1564
    const-string v0, ""
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcLoaded:Z
    if-nez v1, :L17
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-eqz v1, :L0
    goto/16 :L17
  :L0
  .line 1566
    const/4 v1, 1
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v2
  .line 1567
    if-nez v2, :L2
    return-void
  :L2
  .line 1568
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->listSig(Lcom/innioasis/y1/service/PlayerService;)Ljava/lang/String;
    move-result-object v2
  .line 1569
    if-nez v2, :L3
    return-void
  :L3
  .line 1570
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->srcLoaded:Z
  .line 1571
    invoke-static { }, Lcom/innioasis/ipp/Queue;->prefs()Landroid/content/SharedPreferences;
    move-result-object v3
  .line 1572
    if-nez v3, :L4
    return-void
  :L4
  .line 1573
    const-string v4, "src_sig"
    invoke-interface { v3, v4, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L5
    return-void
  :L5
  .line 1574
    const-string v2, "src_key"
    invoke-interface { v3, v2, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1575
    const-string v4, "src_uri"
    invoke-interface { v3, v4, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 1576
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v5
    if-eqz v5, :L14
    invoke-virtual { v4 }, Ljava/lang/String;->length()I
    move-result v5
    if-nez v5, :L6
    goto :L14
  :L6
  .line 1577
    const/4 v5, 0
    invoke-static { v4, v5 }, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;
    move-result-object v4
  .line 1578
    const-string v6, "src_uuid"
    invoke-interface { v3, v6, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 1579
    invoke-virtual { v6 }, Ljava/lang/String;->length()I
    move-result v7
    if-lez v7, :L10
  .line 1580
    const-string v7, "\n"
    invoke-virtual { v6, v7 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v6
  .line 1581
    const/4 v7, 0
  :L7
    array-length v8, v6
    if-ge v7, v8, :L10
  .line 1582
    aget-object v8, v6, v7
    const/16 v9, 61
    invoke-virtual { v8, v9 }, Ljava/lang/String;->indexOf(I)I
    move-result v8
  .line 1583
    if-gtz v8, :L8
    goto :L9
  :L8
  .line 1584
    aget-object v9, v6, v7
    invoke-virtual { v9, v5, v8 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v9
    aget-object v10, v6, v7
    add-int/lit8 v8, v8, 1
  .line 1585
    invoke-virtual { v10, v8 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v8
    invoke-static { v8 }, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;
    move-result-object v8
  .line 1584
    invoke-virtual { v4, v9, v8 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;
  :L9
  .line 1581
    add-int/lit8 v7, v7, 1
    goto :L7
  :L10
  .line 1588
    sput-object v2, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1589
    const-string v2, "src_name"
    invoke-interface { v3, v2, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    sput-object v2, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1590
    sput-object v4, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
  .line 1591
    const/4 v2, 0
    sput-object v2, Lcom/innioasis/ipp/Queue;->srcAct:Ljava/lang/ref/WeakReference;
  .line 1592
    const-string v4, "src_level"
    invoke-interface { v3, v4, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 1593
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v4
    if-nez v4, :L11
    goto :L12
  :L11
    move-object v2, v0
  :L12
    sput-object v2, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
  .line 1594
    const-string v0, "src_genre"
    invoke-interface { v3, v0, v5 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->srcGenre:Z
  .line 1597
    const-string v0, "src_ordered"
    invoke-interface { v3, v0, v1 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
  :L13
  .line 1600
    goto :L16
  :L14
  .line 1576
    return-void
  :L15
  .line 1598
    move-exception v0
  .line 1599
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->srcLoaded:Z
  :L16
  .line 1601
    return-void
  :L17
  .line 1564
    return-void
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 2
  .line 1277
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
  .line 880
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 881
    invoke-virtual { p1 }, Ljava/io/File;->isDirectory()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByParentPath(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
    return-object p0
  :L1
  .line 882
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 883
    if-nez p0, :L2
    return-object v0
  :L2
  .line 884
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1 }, Ljava/util/ArrayList;-><init>()V
  .line 885
    invoke-virtual { p1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 886
    return-object p1
.end method

.method private static fromSource(Ljava/lang/Object;)Z
  .registers 4
  .line 1285
    sget-object v0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1286
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 1287
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 1288
    instance-of v2, p0, Landroid/app/Activity;
    if-nez v2, :L1
    return v1
  :L1
  .line 1289
    check-cast p0, Landroid/app/Activity;
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object p0
  .line 1290
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
  .line 577
    const/4 v0, -1
    if-ltz p1, :L3
    if-eqz p0, :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p1, v1, :L0
    goto :L3
  :L0
  .line 578
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
    if-ne p0, p2, :L1
    goto :L2
  :L1
    const/4 p1, -1
  :L2
    return p1
  :L3
  .line 577
    return v0
.end method

.method private static has(Ljava/util/ArrayList;I)Z
  .registers 5
  .line 569
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 570
    invoke-virtual { p0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-ne v2, p1, :L1
    const/4 p0, 1
    return p0
  :L1
  .line 569
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 572
    return v0
.end method

.method public static hasSource()Z
  .registers 1
  .line 1447
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1448
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
  .line 192
    if-nez p0, :L0
    const/4 p0, -1
    return p0
  :L0
  .line 193
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
  .line 1820
    const/4 v0, -1
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 1821
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 1822
    if-nez p1, :L1
    return v0
  :L1
  .line 1823
    const/4 v1, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 1824
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1825
    if-eqz v2, :L3
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    return v1
  :L3
  .line 1823
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 1827
    return v0
  :L5
  .line 1820
    return v0
.end method

.method private static insertGuest(Lcom/innioasis/y1/database/Song;)I
  .catchall { :L0 .. :L8 } :L11
  .registers 7
  .line 305
    const/4 v0, -1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 306
    if-nez v1, :L1
    return v0
  :L1
  .line 307
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v2
  .line 308
    if-eqz v2, :L10
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L2
    goto :L10
  :L2
  .line 309
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
  .line 310
    if-ltz v1, :L9
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v1, v3, :L3
    goto :L9
  :L3
  .line 311
    add-int/lit8 v1, v1, 1
  .line 312
    const/4 v3, 0
  :L4
    sget-object v4, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v5
    if-ge v3, v5, :L6
  .line 313
    invoke-virtual { v4, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
  .line 314
    if-lt v4, v1, :L5
    add-int/lit8 v4, v4, 1
    move v1, v4
  :L5
  .line 312
    add-int/lit8 v3, v3, 1
    goto :L4
  :L6
  .line 316
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    if-le v1, v3, :L7
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v1
  :L7
  .line 317
    invoke-interface { v2, v1, p0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  .line 318
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->shiftUp(I)V
  :L8
  .line 319
    return v1
  :L9
  .line 310
    return v0
  :L10
  .line 308
    return v0
  :L11
  .line 320
    move-exception p0
  .line 321
    return v0
.end method

.method public static isManualRow(I)Z
  .registers 3
  .line 2126
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
  .line 1681
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 1682
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
  .line 1683
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseActivity;->getStateBarLeftText()Ljava/lang/String;
    move-result-object v0
  .line 1684
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
  .line 749
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L8
  .line 750
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 751
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-nez v3, :L1
    goto :L2
  :L1
  .line 752
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
  .line 753
    if-nez v2, :L3
  :L2
  .line 749
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 754
    const-string p0, "/storage/sdcard0/Audiobooks"
    invoke-virtual { v2, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L6
    const-string p0, "/storage/sdcard0/audiobooks"
  .line 755
    invoke-virtual { v2, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
  :L4
    if-eqz p0, :L5
    goto :L6
  :L5
  .line 756
    goto :L7
  :L6
    const/4 v0, 1
  :L7
  .line 754
    return v0
  :L8
  .line 760
    goto :L10
  :L9
  .line 758
    move-exception p0
  :L10
  .line 761
    return v0
.end method

.method private static list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
  .registers 2
  .line 181
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 182
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
  .line 187
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 188
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
  .line 1522
    const-string v0, "|"
    const/4 v1, 0
    if-nez p0, :L0
    return-object v1
  :L0
  .line 1523
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object p0
  .line 1524
    if-eqz p0, :L5
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L1
    goto :L5
  :L1
  .line 1525
    const/4 v2, 0
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 1526
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    add-int/lit8 v3, v3, -1
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 1527
    instance-of v4, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v4, :L4
    instance-of v4, v3, Lcom/innioasis/y1/database/Song;
    if-nez v4, :L2
    goto :L4
  :L2
  .line 1528
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
  .line 1527
    return-object v1
  :L5
  .line 1524
    return-object v1
  :L6
  .line 1529
    move-exception p0
  .line 1530
    return-object v1
.end method

.method public static manualCount()I
  .registers 1
  .line 154
    sget v0, Lcom/innioasis/ipp/Queue;->manualTotal:I
    return v0
.end method

.method public static manualShown()I
  .registers 1
  .line 149
    sget v0, Lcom/innioasis/ipp/Queue;->rowManual:I
    return v0
.end method

.method public static markAlbum()V
  .registers 0
  .line 1803
    return-void
.end method

.method public static markAlbum(Ljava/lang/String;)V
  .registers 1
  .line 1806
    return-void
.end method

.method private static moveGuest(Ljava/util/List;II)I
  .catchall { :L0 .. :L6 } :L7
  .registers 5
  .line 547
    if-eqz p0, :L8
    if-ltz p1, :L8
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L8
  :L1
  .line 548
    if-le p2, p1, :L2
    add-int/lit8 p2, p2, -1
  :L2
    add-int/lit8 p2, p2, 1
  .line 549
    if-ne p2, p1, :L3
    return p1
  :L3
  .line 550
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
  .line 551
    invoke-interface { p0, p1 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 552
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->shiftDown(I)V
  .line 553
    if-gez p2, :L4
    const/4 p2, 0
  :L4
  .line 554
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-le p2, v1, :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p2
  :L5
  .line 555
    invoke-interface { p0, p2, v0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  .line 556
    invoke-static { p2 }, Lcom/innioasis/ipp/Queue;->shiftUp(I)V
  :L6
  .line 557
    return p2
  :L7
  .line 558
    move-exception p0
  .line 559
    return p1
  :L8
  .line 547
    return p1
.end method

.method private static newCycle(II)V
  .registers 5
  .line 906
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 907
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 908
    const/4 v0, 0
  :L0
    if-ge v0, p0, :L2
  .line 911
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
  .line 908
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 913
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    sget-object p1, Lcom/innioasis/ipp/Queue;->rnd:Ljava/util/Random;
    invoke-static { p0, p1 }, Ljava/util/Collections;->shuffle(Ljava/util/List;Ljava/util/Random;)V
  .line 914
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result p0
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 915
    return-void
.end method

.method private static newPlaylist(ILjava/util/List;)V
  .registers 3
  .line 1162
    sget v0, Lcom/innioasis/ipp/Queue;->kind:I
    if-eq v0, p0, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->dropGuestsFrom(I)V
  :L0
  .line 1163
    sput p0, Lcom/innioasis/ipp/Queue;->kind:I
  .line 1164
    invoke-static { }, Lcom/innioasis/ipp/Queue;->clearSession()V
  .line 1165
    invoke-static { }, Lcom/innioasis/ipp/Queue;->dropStalePlayer()V
  .line 1166
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->noteSource(Ljava/util/List;)V
  .line 1171
    invoke-static { }, Lcom/innioasis/ipp/Status;->playerOpening()V
  .line 1172
    return-void
.end method

.method private static nextSeq(II)I
  .registers 3
  :L0
  .line 924
    add-int/lit8 p1, p1, 1
    if-ge p1, p0, :L1
  .line 925
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v0
    if-nez v0, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->pendingGuest(I)Z
    move-result v0
    if-nez v0, :L0
    return p1
  :L1
  .line 927
    const/4 p0, -1
    return p0
.end method

.method private static nextShuffled(II)I
  .registers 4
  .line 1935
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->popCycle(II)I
    move-result p0
  .line 1936
    if-ltz p0, :L0
    return p0
  :L0
  .line 1937
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result p0
    const/4 p1, -1
    if-nez p0, :L1
    return p1
  :L1
  .line 1938
    invoke-static { }, Lcom/innioasis/ipp/Queue;->dropGuests()V
  .line 1939
    invoke-static { }, Lcom/innioasis/ipp/Queue;->sizeCur()[I
    move-result-object p0
  .line 1940
    const/4 v0, 0
    aget v0, p0, v0
  .line 1941
    const/4 v1, 1
    aget p0, p0, v1
  .line 1942
    if-gtz v0, :L2
    return p1
  :L2
  .line 1943
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->randomOther(II)I
    move-result p0
  .line 1944
    if-gez p0, :L3
    return p1
  :L3
  .line 1945
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->newCycle(II)V
  .line 1946
    return p0
.end method

.method private static noteBuilt(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  :L0
  .line 1250
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v0
  .line 1251
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
  .line 1252
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Queue;->lastList:Ljava/lang/ref/WeakReference;
  :L2
  .line 1255
    goto :L5
  :L3
  .line 1251
    return-void
  :L4
  .line 1253
    move-exception p0
  :L5
  .line 1256
    return-void
.end method

.method private static notePass(Ljava/util/ArrayList;)V
  .catchall { :L0 .. :L6 } :L9
  .registers 6
  :L0
  .line 422
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 423
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 424
    if-nez v1, :L2
    return-void
  :L2
  .line 425
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v2
  .line 426
    if-eqz v2, :L8
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L3
    goto :L8
  :L3
  .line 427
    new-instance v3, Lcom/innioasis/ipp/Queue$Pass;
    invoke-direct { v3 }, Lcom/innioasis/ipp/Queue$Pass;-><init>()V
  .line 428
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct { v4, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v4, v3, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
  .line 429
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
    iput v1, v3, Lcom/innioasis/ipp/Queue$Pass;->index:I
  .line 430
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v1, v3, Lcom/innioasis/ipp/Queue$Pass;->spent:Ljava/util/ArrayList;
  .line 431
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
  .line 432
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->plan:Ljava/util/ArrayList;
  .line 433
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->skip:Ljava/util/ArrayList;
  .line 434
    sget v0, Lcom/innioasis/ipp/Queue;->passLen:I
    iput v0, v3, Lcom/innioasis/ipp/Queue$Pass;->passLen:I
  .line 435
    sget v0, Lcom/innioasis/ipp/Queue;->planFor:I
    iput v0, v3, Lcom/innioasis/ipp/Queue$Pass;->planFor:I
  .line 439
    iget-object v0, v3, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
  .line 440
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
  .line 441
    invoke-virtual { p0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 442
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    const/4 v1, 4
    if-le v0, v1, :L7
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  :L6
    goto :L5
  :L7
  .line 445
    goto :L10
  :L8
  .line 426
    return-void
  :L9
  .line 443
    move-exception p0
  :L10
  .line 446
    return-void
.end method

.method private static notePlayerToDrop(Ljava/util/List;)V
  .registers 4
  .line 1420
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
  .line 1421
    const/4 v0, 0
  :L0
    if-eqz p0, :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L2
  .line 1422
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 1423
    instance-of v2, v1, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v2, :L1
  .line 1424
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Queue;->dropPlayer:Ljava/lang/ref/WeakReference;
  .line 1425
    return-void
  :L1
  .line 1421
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 1428
    return-void
.end method

.method public static noteReopen(Ljava/util/List;I)Z
  .registers 4
  .line 1741
    nop
  .line 1742
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  .line 1743
    invoke-static { }, Lcom/innioasis/ipp/Queue;->atSource()Z
    move-result v1
    if-eqz v1, :L0
    if-eqz p0, :L0
    if-ltz p1, :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge p1, v1, :L0
  .line 1744
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 1745
    instance-of p1, p0, Lcom/innioasis/y1/database/Song;
    if-eqz p1, :L0
  .line 1746
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingMusicPath()Ljava/lang/String;
    move-result-object p1
  .line 1747
    if-eqz p1, :L0
  .line 1748
    check-cast p0, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
  .line 1749
    sput-boolean v0, Lcom/innioasis/ipp/Queue;->skipRestart:Z
  :L0
  .line 1753
    return v0
.end method

.method private static noteSource(Ljava/util/List;)V
  .catchall { :L0 .. :L14 } :L15
  .registers 7
  .line 1312
    const-string v0, ""
    const/4 v1, 1
    const/4 v2, 0
    const/4 v3, 0
  :L0
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object v4
  .line 1313
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
  .line 1314
    if-nez v5, :L3
    move-object v5, v0
  :L3
    sput-object v5, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1315
    invoke-static { v4 }, Lcom/innioasis/ipp/Queue;->keyOf(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v5
    sput-object v5, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1316
    invoke-static { v4, p0 }, Lcom/innioasis/ipp/Queue;->ordered(Landroid/app/Activity;Ljava/util/List;)Z
    move-result p0
    sput-boolean p0, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
  .line 1322
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
  .line 1328
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
  .line 1333
    instance-of p0, v4, Lcom/innioasis/music/AlbumsActivity;
    if-eqz p0, :L10
  .line 1334
    sget-object p0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->levelFor(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    goto :L11
  :L10
    move-object p0, v3
  :L11
    sput-object p0, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
  .line 1335
    instance-of p0, v4, Lcom/innioasis/music/GenresActivity;
    if-eqz p0, :L12
    sget-object p0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1336
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
  .line 1345
    goto :L16
  :L15
  .line 1337
    move-exception p0
  .line 1338
    sput-object v0, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
  .line 1339
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
  .line 1340
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
  .line 1341
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcAct:Ljava/lang/ref/WeakReference;
  .line 1342
    sput-object v3, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
  .line 1343
    sput-boolean v2, Lcom/innioasis/ipp/Queue;->srcGenre:Z
  .line 1344
    sput-boolean v1, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
  :L16
  .line 1346
    return-void
.end method

.method public static onNewBookPlaylist(Ljava/util/List;)V
  .registers 2
  .line 1150
    const/4 v0, 1
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->newPlaylist(ILjava/util/List;)V
  .line 1151
    return-void
.end method

.method public static onNewPlaylist(Ljava/util/List;)V
  .registers 2
  .line 1141
    const/4 v0, 0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->newPlaylist(ILjava/util/List;)V
  .line 1142
    return-void
.end method

.method public static onShuffleChanged()V
  .catch Ljava/lang/Exception; { :L0 .. :L4 } :L5
  .registers 2
  :L0
  .line 968
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 969
    if-nez v0, :L1
    return-void
  :L1
  .line 970
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 971
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 972
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
  .line 975
    goto :L6
  :L5
  .line 973
    move-exception v0
  :L6
  .line 976
    return-void
.end method

.method public static openSource(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L12 } :L14
  .registers 6
  .line 1627
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1628
    if-eqz p0, :L13
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    if-nez v1, :L1
    goto :L13
  :L1
  .line 1629
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcAct:Ljava/lang/ref/WeakReference;
    if-nez v1, :L2
    const/4 v1, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/app/Activity;
  :L3
  .line 1630
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getActivityList()Ljava/util/List;
    move-result-object v2
  .line 1631
    nop
  .line 1632
    const/4 v3, 0
  :L4
    if-eqz v2, :L6
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L6
  .line 1633
    invoke-interface { v2, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    if-ne v4, v1, :L5
    invoke-static { v1 }, Lcom/blankj/utilcode/util/ActivityUtils;->isActivityAlive(Landroid/app/Activity;)Z
    move-result v3
    goto :L7
  :L5
  .line 1632
    add-int/lit8 v3, v3, 1
    goto :L4
  :L6
  .line 1635
    const/4 v3, 0
  :L7
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->notePlayerToDrop(Ljava/util/List;)V
  .line 1637
    new-instance v2, Landroid/content/Intent;
    sget-object v4, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    invoke-direct { v2, v4 }, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
  .line 1638
    const/4 v4, 1
    if-eqz v3, :L8
  .line 1639
    const/high16 v3, 0x00020000
    invoke-virtual { v2, v3 }, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
  .line 1640
    invoke-static { }, Lcom/innioasis/ipp/Follow;->armPending()V
  .line 1641
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 1645
    invoke-static { v1 }, Lcom/innioasis/ipp/Follow;->toPlaying(Landroid/app/Activity;)V
  .line 1646
    return v4
  :L8
  .line 1648
    const/high16 v1, 0x24000000
    invoke-virtual { v2, v1 }, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
  .line 1649
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
    if-eqz v1, :L9
  .line 1650
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingPath()Ljava/lang/String;
    move-result-object v3
    invoke-static { v2, v1, v3 }, Lcom/innioasis/ipp/Albums;->restore(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V
    goto :L11
  :L9
  .line 1651
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcGenre:Z
    if-eqz v1, :L10
  .line 1652
    invoke-static { }, Lcom/innioasis/ipp/Queue;->playingPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Genres;->restore(Landroid/content/Intent;Ljava/lang/String;)V
    goto :L11
  :L10
  .line 1654
    invoke-static { }, Lcom/innioasis/ipp/Follow;->armPending()V
  :L11
  .line 1656
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L12
  .line 1657
    return v4
  :L13
  .line 1628
    return v0
  :L14
  .line 1658
    move-exception p0
  .line 1659
    return v0
.end method

.method private static ordered(Landroid/app/Activity;Ljava/util/List;)Z
  .catchall { :L0 .. :L9 } :L14
  .registers 8
  .line 1360
    const/4 v0, 1
    if-eqz p0, :L15
    if-eqz p1, :L15
  :L0
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L15
  :L1
  .line 1361
    sget-object v1, Lcom/innioasis/ipp/Queue;->lastList:Ljava/lang/ref/WeakReference;
  .line 1362
    if-nez v1, :L2
    const/4 v1, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L3
  .line 1363
    instance-of v2, v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v2, :L4
    return v0
  :L4
  .line 1364
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 1365
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v2
    if-eq v2, p0, :L5
    return v0
  :L5
  .line 1366
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object p0
  .line 1367
    if-eqz p0, :L13
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v2
    if-eq v1, v2, :L6
    goto :L13
  :L6
  .line 1368
    const/4 v1, 0
    const/4 v2, 0
  :L7
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L12
  .line 1369
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 1370
    instance-of v5, v3, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L11
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L8
    goto :L11
  :L8
  .line 1371
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
  .line 1368
    add-int/lit8 v2, v2, 1
    goto :L7
  :L11
  .line 1370
    return v0
  :L12
  .line 1373
    return v0
  :L13
  .line 1367
    return v0
  :L14
  .line 1374
    move-exception p0
  .line 1375
    return v0
  :L15
  .line 1360
    return v0
.end method

.method private static pastRestartPoint(Lcom/innioasis/y1/service/PlayerService;)Z
  .catchall { :L0 .. :L3 } :L5
  .registers 8
  .line 1056
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayerIsPrepared()Z
    move-result v1
    if-nez v1, :L1
    return v0
  :L1
  .line 1057
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getDuration()J
    move-result-wide v1
  .line 1058
    const-wide/16 v3, 0
    cmp-long v5, v1, v3
    if-gtz v5, :L2
    return v0
  :L2
  .line 1059
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getCurrentPosition()J
    move-result-wide v3
  :L3
  .line 1060
    const-wide/16 v5, 4000
    cmp-long p0, v3, v5
    if-ltz p0, :L4
    cmp-long p0, v3, v1
    if-gtz p0, :L4
    const/4 v0, 1
  :L4
    return v0
  :L5
  .line 1061
    move-exception p0
  .line 1062
    return v0
.end method

.method private static pendingBefore(I)I
  .registers 5
  .line 516
    nop
  .line 517
    const/4 v0, 0
    const/4 v1, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v0, v3, :L2
  .line 518
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 519
    if-ltz v2, :L1
    if-ge v2, p0, :L1
    add-int/lit8 v1, v1, 1
  :L1
  .line 517
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 521
    return v1
.end method

.method private static pendingGuest(I)Z
  .registers 2
  .line 511
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->has(Ljava/util/ArrayList;I)Z
    move-result p0
    return p0
.end method

.method public static playRow(I)V
  .catch Ljava/lang/Exception; { :L0 .. :L10 } :L14
  .registers 6
  :L0
  .line 2168
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 2169
    if-eqz v0, :L13
    if-gez p0, :L1
    goto :L13
  :L1
  .line 2170
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 2171
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 2172
    if-eqz v1, :L12
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L2
    goto :L12
  :L2
  .line 2173
    if-nez p0, :L3
    return-void
  :L3
  .line 2175
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
  .line 2176
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v3
    if-eqz v3, :L5
  .line 2177
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->pushHist(I)V
  .line 2179
    add-int/lit8 p0, p0, -1
    invoke-static { v1, p0, v2 }, Lcom/innioasis/ipp/Queue;->takeManual(Ljava/util/List;II)I
    move-result p0
  .line 2180
    if-gez p0, :L4
    return-void
  :L4
  .line 2181
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 2182
    goto :L9
  :L5
  .line 2183
    sget-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    array-length v4, v3
    if-lt p0, v4, :L6
    return-void
  :L6
  .line 2184
    aget p0, v3, p0
  .line 2185
    if-ltz p0, :L11
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-lt p0, v1, :L7
    goto :L11
  :L7
  .line 2186
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->pushHist(I)V
  .line 2187
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->resume:I
  .line 2188
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v1
    if-eqz v1, :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropPlanThrough(I)V
  :L8
  .line 2189
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L9
  .line 2191
    const/4 p0, 0
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/service/PlayerService;->restartPlay(Z)V
  :L10
  .line 2194
    goto :L15
  :L11
  .line 2185
    return-void
  :L12
  .line 2172
    return-void
  :L13
  .line 2169
    return-void
  :L14
  .line 2192
    move-exception p0
  :L15
  .line 2195
    return-void
.end method

.method private static playingMusicPath()Ljava/lang/String;
  .registers 2
  .line 1724
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 1725
    const/4 v1, 0
    if-nez v0, :L0
  .line 1726
    return-object v1
  :L0
  .line 1728
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 1729
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
  .line 1811
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 1812
    if-nez v1, :L1
    move-object v1, v0
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L2
  .line 1813
    if-nez v1, :L3
    goto :L4
  :L3
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  :L4
    return-object v0
  :L5
  .line 1814
    move-exception v1
  .line 1815
    return-object v0
.end method

.method private static popCycle(II)I
  .registers 4
  .line 1088
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->ensureCycle(II)V
  :L0
  .line 1089
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 1090
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Integer;
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  .line 1091
    if-eq v0, p1, :L1
    if-ltz v0, :L1
    if-ge v0, p0, :L1
    return v0
  :L1
  .line 1092
    goto :L0
  :L2
  .line 1093
    const/4 p0, -1
    return p0
.end method

.method private static prefs()Landroid/content/SharedPreferences;
  .registers 3
  .line 1481
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 1482
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    const-string v1, "innioasis_plus"
    const/4 v2, 0
    invoke-virtual { v0, v1, v2 }, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
  :L1
    return-object v0
.end method

.method public static prevAction(Lcom/innioasis/y1/service/PlayerService;)I
  .catch Ljava/lang/Exception; { :L0 .. :L12 } :L14
  .registers 9
  .line 1977
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 1978
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1979
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 1980
    if-eqz v1, :L13
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L1
    goto/16 :L13
  :L1
  .line 1981
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
  .line 1982
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v3
  .line 1983
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 1985
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->pastRestartPoint(Lcom/innioasis/y1/service/PlayerService;)Z
    move-result v4
    if-eqz v4, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L2
  .line 1987
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v4
    const/4 v5, -1
    const/4 v6, 1
    if-eqz v4, :L8
  .line 1990
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
  .line 1994
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v7
    if-eqz v7, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L4
  .line 1995
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v7
    sub-int/2addr v7, v6
    invoke-virtual { v1, v7 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  .line 1996
    if-ltz v1, :L7
    if-lt v1, v2, :L5
    goto :L7
  :L5
  .line 1997
    invoke-static { v3, v1, v2 }, Lcom/innioasis/ipp/Queue;->putBackInPlan(III)V
  .line 1998
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v3
    sget v7, Lcom/innioasis/ipp/Queue;->passLen:I
    if-lt v3, v7, :L6
  .line 2001
    invoke-virtual { v4 }, Ljava/util/ArrayList;->clear()V
  .line 2002
    sput v2, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 2003
    sput v2, Lcom/innioasis/ipp/Queue;->passLen:I
  :L6
  .line 2005
    sput v5, Lcom/innioasis/ipp/Queue;->resume:I
  .line 2006
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 2007
    return v6
  :L7
  .line 1996
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L8
  .line 2010
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->prevSeq(I)I
    move-result v2
  .line 2011
    if-gez v2, :L11
  .line 2014
    sget-object v2, Lcom/innioasis/ipp/Queue;->past:Ljava/util/ArrayList;
    invoke-static { p0, v2, v0 }, Lcom/innioasis/ipp/Queue;->restorePass(Lcom/innioasis/y1/service/PlayerService;Ljava/util/ArrayList;Z)Z
    move-result v2
    if-eqz v2, :L9
    return v6
  :L9
  .line 2015
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result v2
    if-nez v2, :L10
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L10
  .line 2021
    sget-object v2, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->notePass(Ljava/util/ArrayList;)V
  .line 2022
    invoke-static { }, Lcom/innioasis/ipp/Queue;->stripGuests()V
  .line 2023
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  .line 2024
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->prevSeq(I)I
    move-result v2
  .line 2025
    if-gez v2, :L11
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->toStart(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L11
  .line 2027
    sput v5, Lcom/innioasis/ipp/Queue;->resume:I
  .line 2028
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L12
  .line 2029
    return v6
  :L13
  .line 1980
    return v0
  :L14
  .line 2030
    move-exception p0
  .line 2031
    return v0
.end method

.method private static prevSeq(I)I
  .registers 2
  .line 932
    add-int/lit8 p0, p0, -1
  :L0
    if-ltz p0, :L2
  .line 933
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v0
    if-nez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->pendingGuest(I)Z
    move-result v0
    if-nez v0, :L1
    return p0
  :L1
  .line 932
    add-int/lit8 p0, p0, -1
    goto :L0
  :L2
  .line 935
    const/4 p0, -1
    return p0
.end method

.method private static pushHist(I)V
  .registers 2
  .line 1128
    if-gez p0, :L0
    return-void
  :L0
  .line 1129
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 1130
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1131
    return-void
.end method

.method private static putBackInPlan(III)V
  .registers 4
  .line 2046
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 2047
    if-ltz p0, :L4
    if-ge p0, p2, :L4
    if-ne p0, p1, :L1
    goto :L4
  :L1
  .line 2048
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result p1
    if-eqz p1, :L2
    return-void
  :L2
  .line 2049
    sget p1, Lcom/innioasis/ipp/Queue;->planFor:I
    if-eq p1, p2, :L3
    return-void
  :L3
  .line 2050
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropFromPlan(I)V
  .line 2051
    sget-object p1, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    const/4 p2, 0
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { p1, p2, p0 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 2052
    return-void
  :L4
  .line 2047
    return-void
.end method

.method private static queued(I)Z
  .registers 2
  .line 565
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
  .line 1951
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1952
    const/4 v1, 0
  :L0
    if-ge v1, p0, :L2
  .line 1953
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
  .line 1952
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 1955
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-eqz p0, :L3
    const/4 p0, -1
    return p0
  :L3
  .line 1956
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
  .line 489
    invoke-virtual { p0 }, Ljava/util/ArrayList;->clear()V
  .line 490
    if-eqz p1, :L0
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
  :L0
  .line 491
    return-void
.end method

.method public static relist(Ljava/lang/Object;)V
  .catchall { :L0 .. :L15 } :L20
  .registers 7
  :L0
  .line 1208
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L1
    return-void
  :L1
  .line 1209
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->noteBuilt(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 1210
    sget-object v0, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-eqz v0, :L19
    sget-boolean v0, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
    if-nez v0, :L2
    goto/16 :L19
  :L2
  .line 1211
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 1212
    if-nez v0, :L3
    return-void
  :L3
  .line 1213
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1214
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 1215
    if-eqz v1, :L18
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L4
    goto/16 :L18
  :L4
  .line 1216
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v2
  .line 1217
    if-ltz v2, :L17
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v2, v3, :L5
    goto :L17
  :L5
  .line 1218
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 1219
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-nez v3, :L6
    return-void
  :L6
  .line 1221
    move-object v3, p0
    check-cast v3, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v3
  .line 1222
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
  .line 1223
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->sameOrder(Ljava/util/List;Ljava/util/List;)Z
    move-result v1
    if-eqz v1, :L8
    return-void
  :L8
  .line 1224
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->fromSource(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L9
    return-void
  :L9
  .line 1226
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 1227
    nop
  .line 1228
    nop
  :L10
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v4, v1, :L12
  .line 1229
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 1230
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
  .line 1228
    add-int/lit8 v4, v4, 1
    goto :L10
  :L12
    const/4 v4, -1
  :L13
  .line 1232
    if-gez v4, :L14
    return-void
  :L14
  .line 1235
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Queue;->setList(Lcom/innioasis/y1/service/PlayerService;Ljava/util/List;)V
  .line 1236
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Queue;->setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  .line 1241
    invoke-static { }, Lcom/innioasis/ipp/Queue;->clearSession()V
  :L15
  .line 1244
    goto :L21
  :L16
  .line 1222
    return-void
  :L17
  .line 1217
    return-void
  :L18
  .line 1215
    return-void
  :L19
  .line 1210
    return-void
  :L20
  .line 1242
    move-exception p0
  :L21
  .line 1245
    return-void
.end method

.method public static removeRow(I)V
  .registers 3
  .line 2132
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v0
    if-eqz v0, :L1
  .line 2133
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    add-int/lit8 p0, p0, -1
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 2134
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  .line 2135
    if-ltz p0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropGuest(I)V
  :L0
  .line 2136
    return-void
  :L1
  .line 2138
    if-lez p0, :L4
    sget-object v0, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    array-length v1, v0
    if-lt p0, v1, :L2
    goto :L4
  :L2
  .line 2139
    aget p0, v0, p0
  .line 2140
    if-gez p0, :L3
    return-void
  :L3
  .line 2141
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 2142
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->dropFromPlan(I)V
  .line 2143
    return-void
  :L4
  .line 2138
    return-void
.end method

.method private static repeatAll()Z
  .registers 2
  .line 896
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 897
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
  .line 462
    const/4 v0, 0
  :L0
    invoke-virtual { p1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L9
    if-nez p0, :L1
    goto :L9
  :L1
  .line 463
    invoke-virtual { p1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
    invoke-virtual { p1, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/ipp/Queue$Pass;
  .line 464
    if-eqz p1, :L8
    iget-object v1, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    if-eqz v1, :L8
    iget-object v1, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L2
    goto :L8
  :L2
  .line 465
    new-instance v1, Ljava/util/ArrayList;
    iget-object v3, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-direct { v1, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Queue;->setList(Lcom/innioasis/y1/service/PlayerService;Ljava/util/List;)V
  .line 466
    sget-object v1, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    iget-object v3, p1, Lcom/innioasis/ipp/Queue$Pass;->spent:Ljava/util/ArrayList;
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 467
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    iget-object v3, p1, Lcom/innioasis/ipp/Queue$Pass;->hist:Ljava/util/ArrayList;
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 468
    sget-object v3, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    iget-object v4, p1, Lcom/innioasis/ipp/Queue$Pass;->plan:Ljava/util/ArrayList;
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 469
    sget-object v3, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    iget-object v4, p1, Lcom/innioasis/ipp/Queue$Pass;->skip:Ljava/util/ArrayList;
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Queue;->refill(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
  .line 470
    iget v3, p1, Lcom/innioasis/ipp/Queue$Pass;->passLen:I
    sput v3, Lcom/innioasis/ipp/Queue;->passLen:I
  .line 471
    iget v3, p1, Lcom/innioasis/ipp/Queue$Pass;->planFor:I
    sput v3, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 472
    const/4 v3, -1
    sput v3, Lcom/innioasis/ipp/Queue;->resume:I
  .line 474
    if-eqz p2, :L3
  .line 475
    invoke-virtual { v1 }, Ljava/util/ArrayList;->clear()V
  .line 476
    iget-object p2, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-virtual { p2 }, Ljava/util/ArrayList;->size()I
    move-result p2
    invoke-static { p2, v3 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result p2
    goto :L4
  :L3
  .line 478
    iget p2, p1, Lcom/innioasis/ipp/Queue$Pass;->index:I
  :L4
  .line 480
    if-ltz p2, :L5
    iget-object p1, p1, Lcom/innioasis/ipp/Queue$Pass;->list:Ljava/util/ArrayList;
    invoke-virtual { p1 }, Ljava/util/ArrayList;->size()I
    move-result p1
    if-lt p2, p1, :L6
  :L5
    const/4 p2, 0
  :L6
  .line 481
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L7
  .line 482
    return v2
  :L8
  .line 464
    return v0
  :L9
  .line 462
    return v0
  :L10
  .line 483
    move-exception p0
  .line 484
    return v0
.end method

.method private static sameOrder(Ljava/util/List;Ljava/util/List;)Z
  .registers 8
  .line 1265
    nop
  .line 1266
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v1, v3, :L7
  .line 1267
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->queued(I)Z
    move-result v3
    if-eqz v3, :L1
    goto :L5
  :L1
  .line 1268
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    if-lt v2, v3, :L2
    return v0
  :L2
  .line 1269
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    add-int/lit8 v4, v2, 1
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 1270
    instance-of v5, v3, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L6
    instance-of v5, v2, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L3
    goto :L6
  :L3
  .line 1271
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
  .line 1266
    add-int/lit8 v1, v1, 1
    goto :L0
  :L6
  .line 1270
    return v0
  :L7
  .line 1273
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
  .line 1493
    invoke-static { }, Lcom/innioasis/ipp/Queue;->prefs()Landroid/content/SharedPreferences;
    move-result-object v0
  .line 1494
    if-nez v0, :L1
    return-void
  :L1
  .line 1495
    invoke-interface { v0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
  .line 1496
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    if-nez v1, :L2
    const/4 p0, 0
    goto :L3
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->listSig(Lcom/innioasis/y1/service/PlayerService;)Ljava/lang/String;
    move-result-object p0
  :L3
  .line 1497
    const-string v1, "src_sig"
    const-string v2, ""
    if-nez p0, :L5
  :L4
  .line 1498
    invoke-interface { v0, v1, v2 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    goto :L10
  :L5
  .line 1500
    invoke-interface { v0, v1, p0 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1501
    const-string p0, "src_key"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcKey:Ljava/lang/String;
    if-nez v1, :L6
    move-object v1, v2
  :L6
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1502
    const-string p0, "src_name"
    sget-object v1, Lcom/innioasis/ipp/Queue;->source:Ljava/lang/String;
    if-nez v1, :L7
    move-object v1, v2
  :L7
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1503
    const-string p0, "src_uri"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    const/4 v3, 0
    invoke-virtual { v1, v3 }, Landroid/content/Intent;->toUri(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1504
    const-string p0, "src_uuid"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcIntent:Landroid/content/Intent;
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->uuidExtras(Landroid/content/Intent;)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1505
    const-string p0, "src_level"
    sget-object v1, Lcom/innioasis/ipp/Queue;->srcLevel:Ljava/lang/String;
    if-nez v1, :L8
    goto :L9
  :L8
    move-object v2, v1
  :L9
    invoke-interface { v0, p0, v2 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 1506
    const-string p0, "src_genre"
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcGenre:Z
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  .line 1507
    const-string p0, "src_ordered"
    sget-boolean v1, Lcom/innioasis/ipp/Queue;->srcOrdered:Z
    invoke-interface { v0, p0, v1 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  :L10
  .line 1509
    invoke-interface { v0 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L11
  .line 1512
    goto :L13
  :L12
  .line 1510
    move-exception p0
  :L13
  .line 1513
    return-void
.end method

.method private static screenKind(Landroid/content/Context;)I
  .catchall { :L0 .. :L3 } :L6
  .registers 5
  .line 789
    const/4 v0, 0
  :L0
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    return v0
  :L1
  .line 790
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v1
  .line 791
    const-string v2, ".AllAudiobooksActivity"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    const/4 v3, 1
    if-eqz v2, :L2
    return v3
  :L2
  .line 794
    const-string v2, ".FilesActivity"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L5
  .line 795
    check-cast p0, Landroid/app/Activity;
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "now_path"
    invoke-virtual { p0, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 796
    if-eqz p0, :L5
    const-string v1, "/storage/sdcard0/Audiobooks"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L4
    const-string v1, "/storage/sdcard0/audiobooks"
  .line 797
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
  :L3
    if-eqz p0, :L5
  :L4
  .line 798
    return v3
  :L5
  .line 803
    goto :L7
  :L6
  .line 801
    move-exception p0
  :L7
  .line 804
    return v0
.end method

.method private static seqNo(I)I
  .registers 2
  .line 526
    add-int/lit8 v0, p0, 1
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->pendingBefore(I)I
    move-result p0
    sub-int/2addr v0, p0
  .line 527
    const/4 p0, 1
    if-ge v0, p0, :L0
    const/4 v0, 1
  :L0
    return v0
.end method

.method private static setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  .registers 3
  .line 197
    if-nez p0, :L0
    return-void
  :L0
  .line 198
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
    if-eqz v0, :L1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setAudiobookIndex(I)V
    goto :L2
  :L1
  .line 199
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setMusicIndex(I)V
  :L2
  .line 200
    return-void
.end method

.method private static setList(Lcom/innioasis/y1/service/PlayerService;Ljava/util/List;)V
  .registers 3
  .line 203
    if-eqz p0, :L3
    if-nez p1, :L0
    goto :L3
  :L0
  .line 204
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
    if-eqz v0, :L1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setAudiobookList(Ljava/util/List;)V
    goto :L2
  :L1
  .line 205
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/service/PlayerService;->setMusicList(Ljava/util/List;)V
  :L2
  .line 206
    return-void
  :L3
  .line 203
    return-void
.end method

.method private static shiftDown(I)V
  .registers 4
  .line 594
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    add-int/lit8 v1, p0, 1
    const/4 v2, -1
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 595
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 596
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 597
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 598
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 599
    sget v0, Lcom/innioasis/ipp/Queue;->resume:I
    if-le v0, p0, :L0
    add-int/lit8 v0, v0, -1
    sput v0, Lcom/innioasis/ipp/Queue;->resume:I
  :L0
  .line 600
    sget p0, Lcom/innioasis/ipp/Queue;->planFor:I
    if-lez p0, :L1
    add-int/lit8 p0, p0, -1
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  :L1
  .line 601
    return-void
.end method

.method private static shiftUp(I)V
  .registers 3
  .line 583
    sget-object v0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    const/4 v1, 1
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 584
    sget-object v0, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 585
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 586
    sget-object v0, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 587
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { v0, p0, v1 }, Lcom/innioasis/ipp/Queue;->bump(Ljava/util/ArrayList;II)V
  .line 588
    sget v0, Lcom/innioasis/ipp/Queue;->resume:I
    if-lt v0, p0, :L0
    add-int/2addr v0, v1
    sput v0, Lcom/innioasis/ipp/Queue;->resume:I
  :L0
  .line 589
    sget p0, Lcom/innioasis/ipp/Queue;->planFor:I
    if-ltz p0, :L1
    add-int/2addr p0, v1
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  :L1
  .line 590
    return-void
.end method

.method private static shuffle()Z
  .registers 2
  .line 209
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 210
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
  .line 495
    const/4 v0, -1
    const/4 v1, 0
    filled-new-array { v1, v0 }, [I
    move-result-object v0
  :L0
  .line 497
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v2
  .line 498
    if-nez v2, :L1
    return-object v0
  :L1
  .line 499
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v3
  .line 500
    if-nez v3, :L2
    return-object v0
  :L2
  .line 501
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    aput v3, v0, v1
  .line 502
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v1
    const/4 v2, 1
    aput v1, v0, v2
  :L3
  .line 505
    goto :L5
  :L4
  .line 503
    move-exception v1
  :L5
  .line 506
    return-object v0
.end method

.method private static skipped(I)Z
  .registers 2
  .line 919
    sget-object v0, Lcom/innioasis/ipp/Queue;->skip:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method public static source()Ljava/lang/String;
  .registers 1
  .line 1297
    invoke-static { }, Lcom/innioasis/ipp/Queue;->ensureSource()V
  .line 1298
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
  .line 1072
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
  .line 1073
    const-wide/16 v0, 0
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setCurrentPosition(J)V
  :L3
  .line 1076
    goto :L5
  :L4
  .line 1074
    move-exception p0
  :L5
  .line 1077
    const/4 p0, 2
    return p0
.end method

.method private static stripGuests()V
  .catchall { :L0 .. :L9 } :L11
  .registers 7
  :L0
  .line 366
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 367
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 368
    if-nez v1, :L2
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
    return-void
  :L2
  .line 369
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v2
  .line 370
    if-nez v2, :L3
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
    return-void
  :L3
  .line 371
    sget-object v0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-nez v0, :L10
  .line 372
    nop
  .line 373
    const/4 v0, -1
    const/4 v3, 0
    const/4 v3, -1
    const/4 v4, 0
  :L4
    sget-object v5, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v4, v6, :L6
  .line 374
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/Integer;
    invoke-virtual { v5 }, Ljava/lang/Integer;->intValue()I
    move-result v5
  .line 375
    if-le v5, v3, :L5
    move v0, v4
    move v3, v5
  :L5
  .line 373
    add-int/lit8 v4, v4, 1
    goto :L4
  :L6
  .line 377
    invoke-virtual { v5, v0 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 378
    if-ltz v3, :L3
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v0
    if-lt v3, v0, :L7
    goto :L3
  :L7
  .line 379
    invoke-interface { v2, v3 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 380
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v0
  .line 383
    if-le v0, v3, :L8
    add-int/lit8 v0, v0, -1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Queue;->setIndex(Lcom/innioasis/y1/service/PlayerService;I)V
  :L8
  .line 384
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->shiftDown(I)V
  :L9
  .line 385
    goto :L3
  :L10
  .line 388
    goto :L12
  :L11
  .line 386
    move-exception v0
  :L12
  .line 389
    return-void
.end method

.method private static svc()Lcom/innioasis/y1/service/PlayerService;
  .registers 1
  .line 158
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
    return-object v0
.end method

.method private static syncKind()V
  .registers 2
  .line 220
    invoke-static { }, Lcom/innioasis/ipp/Queue;->book()Z
    move-result v0
  .line 221
    sget v1, Lcom/innioasis/ipp/Queue;->kind:I
    if-ne v0, v1, :L0
    return-void
  :L0
  .line 222
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->dropGuestsFrom(I)V
  .line 223
    sput v0, Lcom/innioasis/ipp/Queue;->kind:I
  .line 224
    invoke-static { }, Lcom/innioasis/ipp/Queue;->clearSession()V
  .line 225
    return-void
.end method

.method private static syncShuffle(II)V
  .registers 5
  .line 949
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v0
  .line 950
    sget v1, Lcom/innioasis/ipp/Queue;->lastShuffle:I
    if-ne v1, v0, :L0
    return-void
  :L0
  .line 951
    const/4 v2, 1
    if-gez v1, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 952
    sput v0, Lcom/innioasis/ipp/Queue;->lastShuffle:I
  .line 953
    if-eqz v1, :L3
    return-void
  :L3
  .line 954
    sget-object v1, Lcom/innioasis/ipp/Queue;->hist:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->clear()V
  .line 955
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Queue;->resume:I
  .line 956
    if-ne v0, v2, :L4
  .line 957
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Queue;->newCycle(II)V
    goto :L5
  :L4
  .line 959
    sget-object p0, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/ArrayList;->clear()V
  .line 960
    sput v1, Lcom/innioasis/ipp/Queue;->planFor:I
  .line 961
    sput v2, Lcom/innioasis/ipp/Queue;->passLen:I
  :L5
  .line 963
    return-void
.end method

.method private static takeManual(Ljava/util/List;II)I
  .registers 5
  .line 1841
    sget-object v0, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 1842
    sget-object v1, Lcom/innioasis/ipp/Queue;->guestIdx:Ljava/util/ArrayList;
    invoke-virtual { v1, p1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/Integer;
    invoke-virtual { p1 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  .line 1843
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Queue;->guestAt(Ljava/util/List;ILcom/innioasis/y1/database/Song;)I
    move-result p1
  .line 1844
    if-ltz p1, :L1
  .line 1845
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Queue;->moveGuest(Ljava/util/List;II)I
    move-result p0
  .line 1846
    sget-object p1, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1850
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result p1
    if-eqz p1, :L0
    sget p1, Lcom/innioasis/ipp/Queue;->planFor:I
    if-ltz p1, :L0
    sget p1, Lcom/innioasis/ipp/Queue;->passLen:I
    add-int/lit8 p1, p1, 1
    sput p1, Lcom/innioasis/ipp/Queue;->passLen:I
  :L0
  .line 1851
    return p0
  :L1
  .line 1854
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Queue;->indexOf(Ljava/util/List;Lcom/innioasis/y1/database/Song;)I
    move-result p1
  .line 1855
    if-gez p1, :L3
  .line 1856
    invoke-interface { p0, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 1857
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p1
    add-int/lit8 p1, p1, -1
  .line 1858
    sget p2, Lcom/innioasis/ipp/Queue;->planFor:I
    if-ltz p2, :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Queue;->planFor:I
  :L2
  .line 1859
    sget-object p0, Lcom/innioasis/ipp/Queue;->spent:Ljava/util/ArrayList;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p2
    invoke-virtual { p0, p2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L5
  :L3
  .line 1861
    sget p0, Lcom/innioasis/ipp/Queue;->resume:I
    if-gez p0, :L4
    sput p2, Lcom/innioasis/ipp/Queue;->resume:I
  :L4
  .line 1864
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result p0
    if-eqz p0, :L5
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->dropFromPlan(I)V
  :L5
  .line 1866
    return p1
.end method

.method public static takeNext(Lcom/innioasis/y1/service/PlayerService;)I
  .catch Ljava/lang/Exception; { :L0 .. :L12 } :L14
  .registers 9
  .line 1877
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 1878
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 1879
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 1880
    if-eqz v1, :L13
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L1
    goto/16 :L13
  :L1
  .line 1881
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
  .line 1882
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v3
  .line 1883
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 1884
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v4
  .line 1885
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->pushHist(I)V
  .line 1887
    sget-object v5, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v5
    const/4 v6, 1
    if-nez v5, :L3
  .line 1888
    invoke-static { v1, v0, v3 }, Lcom/innioasis/ipp/Queue;->takeManual(Ljava/util/List;II)I
    move-result v1
  .line 1889
    if-gez v1, :L2
    return v0
  :L2
  .line 1890
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 1891
    return v6
  :L3
  .line 1894
    nop
  .line 1895
    sget v5, Lcom/innioasis/ipp/Queue;->resume:I
    const/4 v7, -1
    if-ltz v5, :L6
  .line 1896
    nop
  .line 1897
    sput v7, Lcom/innioasis/ipp/Queue;->resume:I
  .line 1898
    if-ltz v5, :L5
    if-lt v5, v2, :L4
    goto :L5
  :L4
    move v3, v5
    goto :L6
  :L5
    const/4 v3, 0
  :L6
  .line 1901
    if-eqz v4, :L8
  .line 1902
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->nextShuffled(II)I
    move-result v1
  .line 1903
    if-gez v1, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->stopAtEnd(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L7
  .line 1904
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  .line 1905
    return v6
  :L8
  .line 1908
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v2
  .line 1909
    if-gez v2, :L11
  .line 1912
    invoke-static { }, Lcom/innioasis/ipp/Queue;->repeatAll()Z
    move-result v2
    if-nez v2, :L9
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->stopAtEnd(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L9
  .line 1915
    sget-object v2, Lcom/innioasis/ipp/Queue;->future:Ljava/util/ArrayList;
    invoke-static { p0, v2, v6 }, Lcom/innioasis/ipp/Queue;->restorePass(Lcom/innioasis/y1/service/PlayerService;Ljava/util/ArrayList;Z)Z
    move-result v2
    if-eqz v2, :L10
    return v6
  :L10
  .line 1916
    invoke-static { }, Lcom/innioasis/ipp/Queue;->dropGuests()V
  .line 1917
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  .line 1918
    invoke-static { v1, v7 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v2
  .line 1919
    if-gez v2, :L11
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->stopAtEnd(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
    return p0
  :L11
  .line 1921
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/service/PlayerService;->setPlayIndex(I)V
  :L12
  .line 1922
    return v6
  :L13
  .line 1880
    return v0
  :L14
  .line 1923
    move-exception p0
  .line 1924
    return v0
.end method

.method private static toStart(Lcom/innioasis/y1/service/PlayerService;)I
  .catchall { :L0 .. :L1 } :L3
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L8 .. :L9 } :L10
  .registers 8
  .line 1025
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
  .line 1028
    goto :L4
  :L3
  .line 1026
    move-exception v4
  .line 1027
    nop
  :L4
  .line 1029
    const/4 v4, 2
    if-eqz v2, :L8
  :L5
  .line 1031
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/service/PlayerService;->setCurrentPosition(J)V
  .line 1032
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->isPlaying()Z
    move-result v0
    if-nez v0, :L6
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/service/PlayerService;->play(Z)V
  :L6
  .line 1033
    return v4
  :L7
  .line 1034
    move-exception v0
  :L8
  .line 1039
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/service/PlayerService;->restartPlay(Z)V
  :L9
  .line 1042
    goto :L11
  :L10
  .line 1040
    move-exception p0
  :L11
  .line 1043
    return v4
.end method

.method private static toast(I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 3
  :L0
  .line 772
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 773
    if-nez v0, :L1
    return-void
  :L1
  .line 774
    invoke-virtual { v0, p0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    const/4 v1, 0
    invoke-static { v0, p0, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
  .line 775
    invoke-virtual { p0 }, Landroid/widget/Toast;->getView()Landroid/view/View;
    move-result-object v0
  .line 776
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    const v1, 16908299
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L3
  .line 777
    instance-of v1, v0, Landroid/widget/TextView;
    if-eqz v1, :L4
  .line 778
    check-cast v0, Landroid/widget/TextView;
    const/16 v1, 17
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setGravity(I)V
  :L4
  .line 780
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L5
  .line 783
    goto :L7
  :L6
  .line 781
    move-exception p0
  :L7
  .line 784
    return-void
.end method

.method public static trackNo(Lcom/innioasis/y1/service/PlayerService;)I
  .catch Ljava/lang/Exception; { :L0 .. :L4 } :L9
  .registers 4
  .line 985
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 986
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 987
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v1
  .line 988
    if-nez v1, :L1
    const/4 v1, 0
    goto :L2
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
  :L2
  .line 989
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result p0
  .line 990
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 991
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v2
    if-nez v2, :L3
  .line 998
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->seqNo(I)I
    move-result p0
    return p0
  :L3
  .line 1000
    sget p0, Lcom/innioasis/ipp/Queue;->passLen:I
    sget-object v2, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v2
  :L4
    sub-int/2addr p0, v2
  .line 1001
    if-ge p0, v0, :L5
    goto :L6
  :L5
    move v0, p0
  :L6
  .line 1002
    if-lez v1, :L7
    if-le v0, v1, :L7
    goto :L8
  :L7
  .line 1003
    move v1, v0
  :L8
    return v1
  :L9
  .line 1004
    move-exception p0
  .line 1005
    return v0
.end method

.method private static unwrap(Ljava/util/ArrayList;Ljava/lang/Object;)V
  .registers 3
  .line 716
    if-nez p1, :L0
    return-void
  :L0
  .line 717
    instance-of v0, p1, Lcom/innioasis/music/SearchActivity$Item;
    if-eqz v0, :L3
  .line 718
    check-cast p1, Lcom/innioasis/music/SearchActivity$Item;
  .line 719
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
    if-eqz v0, :L1
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getSong()Lcom/innioasis/y1/database/Song;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L2
  :L1
  .line 720
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getAlbum()Lcom/innioasis/music/data/Album;
    move-result-object v0
    if-eqz v0, :L2
    invoke-virtual { p1 }, Lcom/innioasis/music/SearchActivity$Item;->getAlbum()Lcom/innioasis/music/data/Album;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 721
    return-void
  :L3
  .line 723
    invoke-virtual { p0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 724
    return-void
.end method

.method public static upNext()Ljava/util/List;
  .catch Ljava/lang/Exception; { :L0 .. :L19 } :L20
  .registers 10
  .line 2062
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 2063
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 2065
    const/4 v2, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Queue;->svc()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v3
  .line 2066
    if-nez v3, :L1
    new-array v3, v2, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    sput v2, Lcom/innioasis/ipp/Queue;->rowManual:I
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
    return-object v0
  :L1
  .line 2067
    invoke-static { }, Lcom/innioasis/ipp/Queue;->syncKind()V
  .line 2068
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->list(Lcom/innioasis/y1/service/PlayerService;)Ljava/util/List;
    move-result-object v4
  .line 2069
    if-eqz v4, :L18
    invoke-interface { v4 }, Ljava/util/List;->isEmpty()Z
    move-result v5
    if-eqz v5, :L2
    goto/16 :L18
  :L2
  .line 2070
    invoke-interface { v4 }, Ljava/util/List;->size()I
    move-result v5
  .line 2071
    invoke-static { v3 }, Lcom/innioasis/ipp/Queue;->index(Lcom/innioasis/y1/service/PlayerService;)I
    move-result v3
  .line 2072
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Queue;->syncShuffle(II)V
  .line 2074
    if-ltz v3, :L3
    if-ge v3, v5, :L3
  .line 2075
    invoke-interface { v4, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    invoke-virtual { v0, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 2076
    invoke-static { v3 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 2082
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
  .line 2083
    const/4 v7, 0
  :L6
    if-ge v7, v6, :L7
  .line 2084
    sget-object v9, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v9, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v9
    invoke-virtual { v0, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 2085
    const/4 v9, -1
    invoke-static { v9 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-virtual { v1, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 2083
    add-int/lit8 v7, v7, 1
    goto :L6
  :L7
  .line 2087
    sput v6, Lcom/innioasis/ipp/Queue;->rowManual:I
  .line 2088
    sget-object v6, Lcom/innioasis/ipp/Queue;->manual:Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v6
    sput v6, Lcom/innioasis/ipp/Queue;->manualTotal:I
  .line 2092
    sget v6, Lcom/innioasis/ipp/Queue;->resume:I
    if-ltz v6, :L8
    goto :L9
  :L8
    move v6, v3
  :L9
  .line 2093
    if-ltz v6, :L10
    if-lt v6, v5, :L11
  :L10
    const/4 v6, 0
  :L11
  .line 2097
    nop
  .line 2098
    invoke-static { }, Lcom/innioasis/ipp/Queue;->shuffle()Z
    move-result v7
    if-eqz v7, :L15
  .line 2099
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Queue;->ensureCycle(II)V
  .line 2100
    const/4 v6, 0
  :L12
    sget-object v7, Lcom/innioasis/ipp/Queue;->plan:Ljava/util/ArrayList;
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result v9
    if-ge v6, v9, :L17
    if-lez v8, :L17
  .line 2101
    invoke-virtual { v7, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Integer;
    invoke-virtual { v7 }, Ljava/lang/Integer;->intValue()I
    move-result v7
  .line 2102
    if-eq v7, v3, :L14
    if-ltz v7, :L14
    if-ge v7, v5, :L14
    invoke-static { v7 }, Lcom/innioasis/ipp/Queue;->skipped(I)Z
    move-result v9
    if-eqz v9, :L13
    goto :L14
  :L13
  .line 2103
    invoke-interface { v4, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
    invoke-virtual { v0, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 2104
    invoke-static { v7 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v7
    invoke-virtual { v1, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 2105
    add-int/lit8 v8, v8, -1
  :L14
  .line 2100
    add-int/lit8 v6, v6, 1
    goto :L12
  :L15
  .line 2108
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v3
  :L16
    if-ltz v3, :L17
    if-lez v8, :L17
  .line 2109
    invoke-interface { v4, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    invoke-virtual { v0, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 2110
    invoke-static { v3 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 2111
    add-int/lit8 v8, v8, -1
  .line 2108
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Queue;->nextSeq(II)I
    move-result v3
    goto :L16
  :L17
  .line 2116
    goto :L21
  :L18
  .line 2069
    new-array v3, v2, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    sput v2, Lcom/innioasis/ipp/Queue;->rowManual:I
    sput v2, Lcom/innioasis/ipp/Queue;->manualTotal:I
  :L19
    return-object v0
  :L20
  .line 2114
    move-exception v3
  :L21
  .line 2117
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    new-array v3, v3, [I
    sput-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
  .line 2118
    nop
  :L22
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L23
  .line 2119
    sget-object v3, Lcom/innioasis/ipp/Queue;->rowIdx:[I
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    aput v4, v3, v2
  .line 2118
    add-int/lit8 v2, v2, 1
    goto :L22
  :L23
  .line 2121
    return-object v0
.end method

.method private static uuidExtras(Landroid/content/Intent;)Ljava/lang/String;
  .catchall { :L0 .. :L5 } :L7
  .registers 6
  .line 1540
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  :L0
  .line 1542
    invoke-virtual { p0 }, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object p0
  .line 1543
    if-nez p0, :L1
    const-string p0, ""
    return-object p0
  :L1
  .line 1544
    invoke-virtual { p0 }, Landroid/os/Bundle;->keySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L2
  .line 1545
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L6
  .line 1546
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
  .line 1547
    invoke-virtual { p0, v2 }, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v3
  .line 1548
    instance-of v4, v3, Ljava/util/UUID;
    if-nez v4, :L3
    goto :L2
  :L3
  .line 1549
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->length()I
    move-result v4
    if-lez v4, :L4
    const/16 v4, 10
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L4
  .line 1550
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v4, 61
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v3 }, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L5
  .line 1551
    goto :L2
  :L6
  .line 1554
    nop
  .line 1555
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L7
  .line 1552
    move-exception p0
  .line 1553
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

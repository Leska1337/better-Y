.class public final Lcom/innioasis/ipp/Playlists;
.super Ljava/lang/Object;
.source "Playlists.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Playlists$AddedPick;,
    Lcom/innioasis/ipp/Playlists$AddedCmp;,
    Lcom/innioasis/ipp/Playlists$VideoAddedPick;,
    Lcom/innioasis/ipp/Playlists$VideoAddedCmp;
  }
.end annotation

.field private final static ADDED_KEY:Ljava/lang/String; = "pl_added"

.field private final static FAV_ID:Ljava/lang/String; = "1e5f0a00-0000-4000-8000-000000000001"

.field private final static KEEP:I = -1

.field private final static LANG_KEY:Ljava/lang/String; = "fav_lang"

.field private final static PROTECT:Z = true

.field private final static SQL_ADDED:Ljava/lang/String; = "select songId from songCatPlaylist where playlistId = ? order by date"

.field private final static SQL_VADDED:Ljava/lang/String; = "select pv.video_id from playlist_video pv join video_playlist vp on vp.playlist_id = pv.playlist_id where vp.playlist_name = ? order by pv.rowid"

.field private final static VADDED_KEY:Ljava/lang/String; = "vpl_added"

.field private static added:I

.field private static nothingNew:Z

.field private static pending:I

.field private static vAdded:I

.field private static vKeep:Z

.method static constructor <clinit>()V
  .registers 1
  .line 299
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Playlists;->added:I
  .line 442
    sput v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 49
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$002(I)I
  .registers 1
  .line 49
    sput p0, Lcom/innioasis/ipp/Playlists;->pending:I
    return p0
.end method

.method static synthetic access$100(I)V
  .registers 1
  .line 49
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->setVMode(I)V
    return-void
.end method

.method static synthetic access$202(Z)Z
  .registers 1
  .line 49
    sput-boolean p0, Lcom/innioasis/ipp/Playlists;->vKeep:Z
    return p0
.end method

.method static synthetic access$300(Landroid/app/Activity;)V
  .registers 1
  .line 49
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->relistVideos(Landroid/app/Activity;)V
    return-void
.end method

.method public static addFromMenu(Lcom/innioasis/music/adapter/MyBaseAdapter;Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .catchall { :L1 .. :L10 } :L11
  .registers 8
  .line 603
    const/4 v0, 0
    if-nez p1, :L0
    return v0
  :L0
  .line 604
    const/4 v1, 1
  :L1
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p1
  .line 605
    if-nez p1, :L2
    return v0
  :L2
  .line 606
    if-nez p0, :L3
    return v1
  :L3
  .line 607
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 608
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v3
  .line 609
    if-eqz v3, :L7
    invoke-interface { v3 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-nez v4, :L7
  .line 610
    nop
  :L4
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v0, v4, :L6
  .line 611
    invoke-interface { v3, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v4
  .line 612
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L5
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 610
    add-int/lit8 v0, v0, 1
    goto :L4
  :L6
  .line 614
    invoke-interface { v3 }, Ljava/util/List;->clear()V
  .line 615
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
    goto :L8
  :L7
  .line 617
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v0
  .line 618
    instance-of v3, v0, Lcom/innioasis/y1/database/Song;
    if-eqz v3, :L8
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L8
  .line 620
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L9
    return v1
  :L9
  .line 621
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    invoke-virtual { v0, v2, p1 }, Lcom/innioasis/y1/database/Y1Repository;->addToPlayList(Ljava/util/List;Ljava/util/UUID;)V
  .line 622
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 623
    instance-of p1, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz p1, :L10
  .line 624
    move-object p1, p0
    check-cast p1, Lcom/innioasis/y1/base/BaseActivity;
    const v0, 2131820580
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/base/BaseActivity;->showToast(Ljava/lang/String;)V
  :L10
  .line 628
    goto :L12
  :L11
  .line 626
    move-exception p0
  :L12
  .line 629
    return v1
.end method

.method public static addMsg(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L5
  .registers 3
  :L0
  .line 656
    sget-boolean v0, Lcom/innioasis/ipp/Playlists;->nothingNew:Z
    if-eqz v0, :L4
    if-eqz p0, :L4
    if-nez p1, :L1
    goto :L4
  :L1
  .line 657
    const v0, 2131820580
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L2
    return-object p1
  :L2
  .line 658
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Playlists;->nothingNew:Z
  .line 659
    const v0, 2131821107
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 656
    return-object p1
  :L5
  .line 660
    move-exception p0
  .line 661
    return-object p1
.end method

.method public static addedSortDialog(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 6
  :L0
  .line 337
    instance-of v0, p0, Lcom/innioasis/music/PlayListActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 338
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 339
    const v1, 2131821028
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 340
    const v1, 2131821029
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 344
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Playlists$AddedPick;
    move-object v3, p0
    check-cast v3, Lcom/innioasis/music/PlayListActivity;
    invoke-direct { v2, v3, p1 }, Lcom/innioasis/ipp/Playlists$AddedPick;-><init>(Lcom/innioasis/music/PlayListActivity;Lcom/innioasis/music/util/SubMenuDialog;)V
    const p1, 2131886360
    invoke-direct { v1, p0, v0, v2, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L2
  .line 347
    goto :L4
  :L3
  .line 345
    move-exception p0
  :L4
  .line 348
    return-void
.end method

.method public static byAdded(Landroidx/room/RoomDatabase;Ljava/util/UUID;Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L1 } :L12
  .catchall { :L2 .. :L5 } :L11
  .catchall { :L7 .. :L12 } :L12
  .registers 9
  .line 380
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->mode()I
    move-result v0
    if-eqz v0, :L13
    if-eqz p0, :L13
    if-eqz p1, :L13
    if-eqz p2, :L13
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L0
    goto :L13
  :L0
  .line 384
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  .line 385
    const-string v2, "select songId from songCatPlaylist where playlistId = ? order by date"
    const/4 v3, 1
    new-array v4, v3, [Ljava/lang/Object;
    invoke-static { p1 }, Landroidx/room/util/UUIDUtil;->convertUUIDToByte(Ljava/util/UUID;)[B
    move-result-object p1
    const/4 v5, 0
    aput-object p1, v4, v5
    invoke-virtual { p0, v2, v4 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object p0
  :L1
  .line 387
    const/4 p1, 0
  :L2
  .line 388
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v2
    if-eqz v2, :L7
  .line 389
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v2
    if-eqz v2, :L3
    const/4 v2, 0
    goto :L4
  :L3
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v2
  :L4
  .line 390
    if-eqz v2, :L6
    invoke-virtual { v0, v2 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L6
    add-int/lit8 v4, p1, 1
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, v2, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
    move p1, v4
  :L6
  .line 391
    goto :L2
  :L7
  .line 393
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 394
    nop
  .line 395
    invoke-virtual { v0 }, Ljava/util/HashMap;->isEmpty()Z
    move-result p0
    if-eqz p0, :L8
    return-object p2
  :L8
  .line 396
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, p2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 397
    new-instance p1, Lcom/innioasis/ipp/Playlists$AddedCmp;
    sget v2, Lcom/innioasis/ipp/Playlists;->added:I
    if-ne v2, v1, :L9
    goto :L10
  :L9
    const/4 v3, 0
  :L10
    invoke-direct { p1, v0, v3 }, Lcom/innioasis/ipp/Playlists$AddedCmp;-><init>(Ljava/util/HashMap;Z)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 398
    return-object p0
  :L11
  .line 393
    move-exception p1
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 394
    throw p1
  :L12
  .line 399
    move-exception p0
  .line 400
    return-object p2
  :L13
  .line 381
    return-object p2
.end method

.method public static byAddedOn()Z
  .registers 1
  .line 316
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->mode()I
    move-result v0
    if-eqz v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method public static byAddedVideo(Landroidx/room/RoomDatabase;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L2 .. :L4 } :L10
  .catchall { :L6 .. :L11 } :L11
  .registers 11
  .line 536
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->vMode()I
    move-result v0
    if-eqz v0, :L12
    if-eqz p0, :L12
    if-eqz p1, :L12
    if-eqz p2, :L12
  .line 537
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L0
    goto :L12
  :L0
  .line 541
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  .line 542
    const-string v2, "select pv.video_id from playlist_video pv join video_playlist vp on vp.playlist_id = pv.playlist_id where vp.playlist_name = ? order by pv.rowid"
    const/4 v3, 1
    new-array v4, v3, [Ljava/lang/Object;
    const/4 v5, 0
    aput-object p1, v4, v5
    invoke-virtual { p0, v2, v4 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object p0
  :L1
  .line 544
    const/4 p1, 0
  :L2
  .line 545
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v2
    if-eqz v2, :L6
  .line 546
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v2
    if-eqz v2, :L3
    goto :L2
  :L3
  .line 547
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v6
    invoke-static { v6, v7 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v2
  .line 548
    invoke-virtual { v0, v2 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L5
    add-int/lit8 v4, p1, 1
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, v2, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
    move p1, v4
  :L5
  .line 549
    goto :L2
  :L6
  .line 551
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 552
    nop
  .line 553
    invoke-virtual { v0 }, Ljava/util/HashMap;->isEmpty()Z
    move-result p0
    if-eqz p0, :L7
    return-object p2
  :L7
  .line 554
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, p2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 555
    new-instance p1, Lcom/innioasis/ipp/Playlists$VideoAddedCmp;
    sget v2, Lcom/innioasis/ipp/Playlists;->vAdded:I
    if-ne v2, v1, :L8
    goto :L9
  :L8
    const/4 v3, 0
  :L9
    invoke-direct { p1, v0, v3 }, Lcom/innioasis/ipp/Playlists$VideoAddedCmp;-><init>(Ljava/util/HashMap;Z)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 556
    return-object p0
  :L10
  .line 551
    move-exception p1
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 552
    throw p1
  :L11
  .line 557
    move-exception p0
  .line 558
    return-object p2
  :L12
  .line 538
    return-object p2
.end method

.method public static enabled()Z
  .registers 2
  .line 85
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 86
    const-string v1, "likes"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method public static favMenu(Lcom/innioasis/music/util/SubMenuDialog;Ljava/lang/Object;Landroid/content/Context;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 5
  .line 178
    if-eqz p0, :L9
    if-nez p2, :L0
    goto :L9
  :L0
  .line 179
    instance-of v0, p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v0, :L1
    check-cast p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 180
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L1
    const/4 p1, 1
    goto :L2
  :L1
    const/4 p1, 0
  :L2
  .line 181
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 183
    sget-object v1, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortPlayListIsChange()Z
    move-result v1
    if-eqz v1, :L3
  .line 184
    const v1, 2131820961
    invoke-virtual { p2, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L3
  .line 188
    if-nez p1, :L4
  .line 189
    const v1, 2131820844
    invoke-virtual { p2, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 190
    const v1, 2131820584
    invoke-virtual { p2, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L4
  .line 192
    const v1, 2131820854
    invoke-virtual { p2, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 193
    if-nez p1, :L5
    const p1, 2131820666
    invoke-virtual { p2, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-interface { v0, p1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L5
  .line 194
    const p1, 2131820907
    invoke-virtual { p2, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-interface { v0, p1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 195
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  :L6
  .line 198
    goto :L8
  :L7
  .line 196
    move-exception p0
  :L8
  .line 199
    return-void
  :L9
  .line 178
    return-void
.end method

.method public static first(Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L9 } :L10
  .registers 4
  .line 96
    if-eqz p0, :L11
  :L0
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L1
    goto :L11
  :L1
  .line 97
    nop
  .line 98
    const/4 v0, 0
    const/4 v1, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 99
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    goto :L5
  :L3
  .line 98
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
    const/4 v1, -1
  :L5
  .line 101
    if-gez v1, :L6
    return-object p0
  :L6
  .line 102
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->enabled()Z
    move-result v2
    if-nez v2, :L7
  .line 103
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 104
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 105
    return-object v0
  :L7
  .line 107
    if-nez v1, :L8
    return-object p0
  :L8
  .line 108
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 109
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v2, v0, v1 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  :L9
  .line 110
    return-object v2
  :L10
  .line 111
    move-exception v0
  .line 112
    return-object p0
  :L11
  .line 96
    return-object p0
.end method

.method public static isFav(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L1 } :L6
  .catchall { :L2 .. :L4 } :L6
  .registers 4
  .line 75
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/y1/database/Playlist;
  :L1
    const-string v2, "1e5f0a00-0000-4000-8000-000000000001"
    if-eqz v1, :L3
  :L2
    check-cast p0, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p0
    invoke-static { p0 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    return p0
  :L3
  .line 76
    instance-of v1, p0, Ljava/util/UUID;
    if-eqz v1, :L5
    invoke-virtual { p0 }, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
  :L4
    return p0
  :L5
  .line 77
    return v0
  :L6
  .line 78
    move-exception p0
  .line 79
    return v0
.end method

.method public static keepAdded()V
  .registers 1
  .line 321
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Playlists;->pending:I
  .line 322
    return-void
.end method

.method public static locked(Ljava/lang/Object;)Z
  .registers 1
  .line 69
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method private static mode()I
  .registers 3
  .line 303
    sget v0, Lcom/innioasis/ipp/Playlists;->added:I
    if-gez v0, :L2
  .line 304
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 305
    const/4 v1, 0
    if-nez v0, :L0
    goto :L1
  :L0
    const-string v2, "pl_added"
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
  :L1
    sput v1, Lcom/innioasis/ipp/Playlists;->added:I
  :L2
  .line 307
    sget v0, Lcom/innioasis/ipp/Playlists;->added:I
    return v0
.end method

.method public static noteAdded(Ljava/util/List;Ljava/util/List;)V
  .registers 2
  .line 646
    if-eqz p1, :L0
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result p1
    if-eqz p1, :L0
    if-eqz p0, :L0
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result p0
    if-nez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    sput-boolean p0, Lcom/innioasis/ipp/Playlists;->nothingNew:Z
  .line 647
    return-void
.end method

.method public static notePlaylistSort()V
  .registers 3
  .line 326
    sget v0, Lcom/innioasis/ipp/Playlists;->pending:I
  .line 327
    const/4 v1, 0
    sput v1, Lcom/innioasis/ipp/Playlists;->pending:I
  .line 328
    const/4 v1, -1
    if-ne v0, v1, :L0
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->mode()I
    return-void
  :L0
  .line 329
    sput v0, Lcom/innioasis/ipp/Playlists;->added:I
  .line 330
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 331
    if-eqz v1, :L1
    const-string v2, "pl_added"
    invoke-static { v1, v2, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 332
    return-void
.end method

.method public static noteVideoSort()V
  .registers 2
  .line 462
    sget-boolean v0, Lcom/innioasis/ipp/Playlists;->vKeep:Z
    const/4 v1, 0
    if-eqz v0, :L0
  .line 463
    sput-boolean v1, Lcom/innioasis/ipp/Playlists;->vKeep:Z
  .line 464
    return-void
  :L0
  .line 466
    invoke-static { v1 }, Lcom/innioasis/ipp/Playlists;->setVMode(I)V
  .line 467
    return-void
.end method

.method private static relistVideos(Landroid/app/Activity;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 516
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 517
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    const-string v1, "getVideoBySort"
    const/4 v2, 0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
  .line 518
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Method;->setAccessible(Z)V
  .line 519
    new-array v1, v2, [Ljava/lang/Object;
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 522
    goto :L4
  :L3
  .line 520
    move-exception p0
  :L4
  .line 523
    return-void
.end method

.method private static setVMode(I)V
  .registers 3
  .line 454
    sget v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    if-ne v0, p0, :L0
    return-void
  :L0
  .line 455
    sput p0, Lcom/innioasis/ipp/Playlists;->vAdded:I
  .line 456
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 457
    if-eqz v0, :L1
    const-string v1, "vpl_added"
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 458
    return-void
.end method

.method public static skip(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 236
    if-eqz p1, :L8
    instance-of p1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez p1, :L0
    goto :L8
  :L0
  .line 238
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 239
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p1
  .line 240
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 241
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemCount()I
    move-result v0
  .line 242
    add-int/lit8 v1, p1, 1
  :L2
  .line 243
    if-ge v1, v0, :L3
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 244
    if-lt v1, v0, :L4
    return-void
  :L4
  .line 245
    const/4 v0, 1
    invoke-virtual { p0, v1, v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setSelectPosition(IZ)V
  .line 246
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyItemChanged(I)V
  .line 247
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyItemChanged(I)V
  :L5
  .line 250
    goto :L7
  :L6
  .line 248
    move-exception p0
  :L7
  .line 251
    return-void
  :L8
  .line 236
    return-void
.end method

.method public static syncName(Landroid/content/Context;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 135
    const-string v0, "fav_lang"
    if-nez p0, :L0
    return-void
  :L0
  .line 141
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->ensure(Landroid/content/Context;)V
  .line 143
    sget-object v1, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getLanguage()I
    move-result v1
  .line 144
    const/4 v2, -1
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v2
    if-ne v2, v1, :L1
    return-void
  :L1
  .line 145
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 147
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 148
    if-nez v0, :L2
    return-void
  :L2
  .line 149
    const-string v1, "1e5f0a00-0000-4000-8000-000000000001"
    invoke-static { v1 }, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->getPlaylistById(Ljava/util/UUID;)Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
  .line 150
    if-nez v1, :L3
    return-void
  :L3
  .line 151
    const v2, 2131821035
    invoke-virtual { p0, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
  .line 152
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L4
    return-void
  :L4
  .line 153
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/database/Playlist;->setName(Ljava/lang/String;)V
  .line 154
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/database/Playlist;->setLowerName(Ljava/lang/String;)V
  .line 155
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->updatePlaylist(Lcom/innioasis/y1/database/Playlist;)V
  :L5
  .line 158
    goto :L7
  :L6
  .line 156
    move-exception p0
  :L7
  .line 159
    return-void
.end method

.method public static tickBlocked(Ljava/lang/Object;I)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 4
  .line 219
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L3
    if-gez p1, :L1
    goto :L3
  :L1
  .line 220
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result p0
  :L2
    return p0
  :L3
  .line 219
    return v0
  :L4
  .line 221
    move-exception p0
  .line 222
    return v0
.end method

.method public static untickFav(Ljava/lang/Object;)V
  .catchall { :L0 .. :L8 } :L10
  .registers 7
  :L0
  .line 265
    instance-of v0, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez v0, :L1
    return-void
  :L1
  .line 266
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 267
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v0
  .line 268
    if-eqz v0, :L9
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L2
    goto :L9
  :L2
  .line 269
    nop
  .line 270
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
    const/4 v3, 0
  :L3
    if-ltz v1, :L7
  .line 271
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 272
    instance-of v5, v4, Ljava/lang/Integer;
    if-nez v5, :L4
    goto :L6
  :L4
  .line 273
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L5
    goto :L6
  :L5
  .line 274
    invoke-interface { v0, v1 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 275
    const/4 v3, 1
  :L6
  .line 270
    add-int/lit8 v1, v1, -1
    goto :L3
  :L7
  .line 277
    if-eqz v3, :L8
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  :L8
  .line 280
    goto :L11
  :L9
  .line 268
    return-void
  :L10
  .line 278
    move-exception p0
  :L11
  .line 281
    return-void
.end method

.method private static vMode()I
  .registers 3
  .line 446
    sget v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    if-gez v0, :L2
  .line 447
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 448
    const/4 v1, 0
    if-nez v0, :L0
    goto :L1
  :L0
    const-string v2, "vpl_added"
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
  :L1
    sput v1, Lcom/innioasis/ipp/Playlists;->vAdded:I
  :L2
  .line 450
    sget v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    return v0
.end method

.method public static videoAddedDialog(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 472
    if-nez p0, :L0
    return-void
  :L0
  .line 473
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 474
    const v1, 2131821028
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 475
    const v1, 2131821029
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 477
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Playlists$VideoAddedPick;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/Playlists$VideoAddedPick;-><init>(Landroid/app/Activity;)V
    const v3, 2131886360
    invoke-direct { v1, p0, v0, v2, v3 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L1
  .line 480
    goto :L3
  :L2
  .line 478
    move-exception p0
  :L3
  .line 481
    return-void
.end method

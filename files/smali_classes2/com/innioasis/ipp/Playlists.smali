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

.field private final static HEART:Ljava/lang/String; = "\u2764 "

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
  .line 307
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Playlists;->added:I
  .line 450
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
  .line 611
    const/4 v0, 0
    if-nez p1, :L0
    return v0
  :L0
  .line 612
    const/4 v1, 1
  :L1
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p1
  .line 613
    if-nez p1, :L2
    return v0
  :L2
  .line 614
    if-nez p0, :L3
    return v1
  :L3
  .line 615
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 616
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v3
  .line 617
    if-eqz v3, :L7
    invoke-interface { v3 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-nez v4, :L7
  .line 618
    nop
  :L4
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v0, v4, :L6
  .line 619
    invoke-interface { v3, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v4
  .line 620
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L5
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 618
    add-int/lit8 v0, v0, 1
    goto :L4
  :L6
  .line 622
    invoke-interface { v3 }, Ljava/util/List;->clear()V
  .line 623
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
    goto :L8
  :L7
  .line 625
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v0
  .line 626
    instance-of v3, v0, Lcom/innioasis/y1/database/Song;
    if-eqz v3, :L8
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L8
  .line 628
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L9
    return v1
  :L9
  .line 629
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    invoke-virtual { v0, v2, p1 }, Lcom/innioasis/y1/database/Y1Repository;->addToPlayList(Ljava/util/List;Ljava/util/UUID;)V
  .line 630
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 631
    instance-of p1, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz p1, :L10
  .line 632
    move-object p1, p0
    check-cast p1, Lcom/innioasis/y1/base/BaseActivity;
    const v0, 2131820580
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/base/BaseActivity;->showToast(Ljava/lang/String;)V
  :L10
  .line 636
    goto :L12
  :L11
  .line 634
    move-exception p0
  :L12
  .line 637
    return v1
.end method

.method public static addMsg(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L5
  .registers 3
  :L0
  .line 664
    sget-boolean v0, Lcom/innioasis/ipp/Playlists;->nothingNew:Z
    if-eqz v0, :L4
    if-eqz p0, :L4
    if-nez p1, :L1
    goto :L4
  :L1
  .line 665
    const v0, 2131820580
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L2
    return-object p1
  :L2
  .line 666
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Playlists;->nothingNew:Z
  .line 667
    const v0, 2131821107
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 664
    return-object p1
  :L5
  .line 668
    move-exception p0
  .line 669
    return-object p1
.end method

.method public static addedSortDialog(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 6
  :L0
  .line 345
    instance-of v0, p0, Lcom/innioasis/music/PlayListActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 346
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 347
    const v1, 2131821028
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 348
    const v1, 2131821029
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 352
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Playlists$AddedPick;
    move-object v3, p0
    check-cast v3, Lcom/innioasis/music/PlayListActivity;
    invoke-direct { v2, v3, p1 }, Lcom/innioasis/ipp/Playlists$AddedPick;-><init>(Lcom/innioasis/music/PlayListActivity;Lcom/innioasis/music/util/SubMenuDialog;)V
    const p1, 2131886360
    invoke-direct { v1, p0, v0, v2, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L2
  .line 355
    goto :L4
  :L3
  .line 353
    move-exception p0
  :L4
  .line 356
    return-void
.end method

.method public static byAdded(Landroidx/room/RoomDatabase;Ljava/util/UUID;Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L1 } :L12
  .catchall { :L2 .. :L5 } :L11
  .catchall { :L7 .. :L12 } :L12
  .registers 9
  .line 388
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
  .line 392
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  .line 393
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
  .line 395
    const/4 p1, 0
  :L2
  .line 396
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v2
    if-eqz v2, :L7
  .line 397
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v2
    if-eqz v2, :L3
    const/4 v2, 0
    goto :L4
  :L3
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v2
  :L4
  .line 398
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
  .line 399
    goto :L2
  :L7
  .line 401
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 402
    nop
  .line 403
    invoke-virtual { v0 }, Ljava/util/HashMap;->isEmpty()Z
    move-result p0
    if-eqz p0, :L8
    return-object p2
  :L8
  .line 404
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, p2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 405
    new-instance p1, Lcom/innioasis/ipp/Playlists$AddedCmp;
    sget v2, Lcom/innioasis/ipp/Playlists;->added:I
    if-ne v2, v1, :L9
    goto :L10
  :L9
    const/4 v3, 0
  :L10
    invoke-direct { p1, v0, v3 }, Lcom/innioasis/ipp/Playlists$AddedCmp;-><init>(Ljava/util/HashMap;Z)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 406
    return-object p0
  :L11
  .line 401
    move-exception p1
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 402
    throw p1
  :L12
  .line 407
    move-exception p0
  .line 408
    return-object p2
  :L13
  .line 389
    return-object p2
.end method

.method public static byAddedOn()Z
  .registers 1
  .line 324
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
  .line 544
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->vMode()I
    move-result v0
    if-eqz v0, :L12
    if-eqz p0, :L12
    if-eqz p1, :L12
    if-eqz p2, :L12
  .line 545
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L0
    goto :L12
  :L0
  .line 549
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  .line 550
    const-string v2, "select pv.video_id from playlist_video pv join video_playlist vp on vp.playlist_id = pv.playlist_id where vp.playlist_name = ? order by pv.rowid"
    const/4 v3, 1
    new-array v4, v3, [Ljava/lang/Object;
    const/4 v5, 0
    aput-object p1, v4, v5
    invoke-virtual { p0, v2, v4 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object p0
  :L1
  .line 552
    const/4 p1, 0
  :L2
  .line 553
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v2
    if-eqz v2, :L6
  .line 554
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v2
    if-eqz v2, :L3
    goto :L2
  :L3
  .line 555
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v6
    invoke-static { v6, v7 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v2
  .line 556
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
  .line 557
    goto :L2
  :L6
  .line 559
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 560
    nop
  .line 561
    invoke-virtual { v0 }, Ljava/util/HashMap;->isEmpty()Z
    move-result p0
    if-eqz p0, :L7
    return-object p2
  :L7
  .line 562
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, p2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 563
    new-instance p1, Lcom/innioasis/ipp/Playlists$VideoAddedCmp;
    sget v2, Lcom/innioasis/ipp/Playlists;->vAdded:I
    if-ne v2, v1, :L8
    goto :L9
  :L8
    const/4 v3, 0
  :L9
    invoke-direct { p1, v0, v3 }, Lcom/innioasis/ipp/Playlists$VideoAddedCmp;-><init>(Ljava/util/HashMap;Z)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 564
    return-object p0
  :L10
  .line 559
    move-exception p1
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 560
    throw p1
  :L11
  .line 565
    move-exception p0
  .line 566
    return-object p2
  :L12
  .line 546
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
  .registers 6
  .line 182
    if-eqz p0, :L9
    if-nez p2, :L0
    goto :L9
  :L0
  .line 183
    invoke-static { p2 }, Lcom/innioasis/ipp/PlGrid;->noteMenu(Landroid/content/Context;)V
  .line 184
    instance-of v0, p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v0, :L1
    move-object v0, p1
    check-cast v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 185
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 186
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 188
    sget-object v2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortPlayListIsChange()Z
    move-result v2
    if-eqz v2, :L3
  .line 189
    const v2, 2131820961
    invoke-virtual { p2, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L3
  .line 193
    if-nez v0, :L4
  .line 194
    const v2, 2131820844
    invoke-virtual { p2, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 195
    const v2, 2131820584
    invoke-virtual { p2, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L4
  .line 197
    const v2, 2131820854
    invoke-virtual { p2, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 198
    if-nez v0, :L5
    const v0, 2131820666
    invoke-virtual { p2, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-interface { v1, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L5
  .line 199
    const v0, 2131820907
    invoke-virtual { p2, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-interface { v1, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 200
    invoke-static { v1, p2 }, Lcom/innioasis/ipp/M3u;->menu(Ljava/util/List;Landroid/content/Context;)V
  .line 201
    invoke-static { v1, p1, p2 }, Lcom/innioasis/ipp/PlGrid;->menu(Ljava/util/List;Ljava/lang/Object;Landroid/content/Context;)V
  .line 202
    invoke-static { v1, p2 }, Lcom/innioasis/ipp/PlGrid;->viewEntry(Ljava/util/List;Landroid/content/Context;)V
  .line 203
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  :L6
  .line 206
    goto :L8
  :L7
  .line 204
    move-exception p0
  :L8
  .line 207
    return-void
  :L9
  .line 182
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
  .line 329
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Playlists;->pending:I
  .line 330
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
  .line 311
    sget v0, Lcom/innioasis/ipp/Playlists;->added:I
    if-gez v0, :L2
  .line 312
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 313
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
  .line 315
    sget v0, Lcom/innioasis/ipp/Playlists;->added:I
    return v0
.end method

.method public static noteAdded(Ljava/util/List;Ljava/util/List;)V
  .registers 2
  .line 654
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
  .line 655
    return-void
.end method

.method public static notePlaylistSort()V
  .registers 3
  .line 334
    sget v0, Lcom/innioasis/ipp/Playlists;->pending:I
  .line 335
    const/4 v1, 0
    sput v1, Lcom/innioasis/ipp/Playlists;->pending:I
  .line 336
    const/4 v1, -1
    if-ne v0, v1, :L0
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->mode()I
    return-void
  :L0
  .line 337
    sput v0, Lcom/innioasis/ipp/Playlists;->added:I
  .line 338
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 339
    if-eqz v1, :L1
    const-string v2, "pl_added"
    invoke-static { v1, v2, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 340
    return-void
.end method

.method public static noteVideoSort()V
  .registers 2
  .line 470
    sget-boolean v0, Lcom/innioasis/ipp/Playlists;->vKeep:Z
    const/4 v1, 0
    if-eqz v0, :L0
  .line 471
    sput-boolean v1, Lcom/innioasis/ipp/Playlists;->vKeep:Z
  .line 472
    return-void
  :L0
  .line 474
    invoke-static { v1 }, Lcom/innioasis/ipp/Playlists;->setVMode(I)V
  .line 475
    return-void
.end method

.method private static relistVideos(Landroid/app/Activity;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 524
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 525
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    const-string v1, "getVideoBySort"
    const/4 v2, 0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
  .line 526
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Method;->setAccessible(Z)V
  .line 527
    new-array v1, v2, [Ljava/lang/Object;
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 530
    goto :L4
  :L3
  .line 528
    move-exception p0
  :L4
  .line 531
    return-void
.end method

.method private static setVMode(I)V
  .registers 3
  .line 462
    sget v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    if-ne v0, p0, :L0
    return-void
  :L0
  .line 463
    sput p0, Lcom/innioasis/ipp/Playlists;->vAdded:I
  .line 464
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 465
    if-eqz v0, :L1
    const-string v1, "vpl_added"
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 466
    return-void
.end method

.method public static skip(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 244
    if-eqz p1, :L8
    instance-of p1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez p1, :L0
    goto :L8
  :L0
  .line 246
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 247
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p1
  .line 248
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 249
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemCount()I
    move-result v0
  .line 250
    add-int/lit8 v1, p1, 1
  :L2
  .line 251
    if-ge v1, v0, :L3
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 252
    if-lt v1, v0, :L4
    return-void
  :L4
  .line 253
    const/4 v0, 1
    invoke-virtual { p0, v1, v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setSelectPosition(IZ)V
  .line 254
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyItemChanged(I)V
  .line 255
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyItemChanged(I)V
  :L5
  .line 258
    goto :L7
  :L6
  .line 256
    move-exception p0
  :L7
  .line 259
    return-void
  :L8
  .line 244
    return-void
.end method

.method public static syncName(Landroid/content/Context;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 5
  .line 136
    const-string v0, "fav_lang"
    if-nez p0, :L0
    return-void
  :L0
  .line 142
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->ensure(Landroid/content/Context;)V
  .line 144
    sget-object v1, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getLanguage()I
    move-result v1
  .line 145
    const/4 v2, -1
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v2
    if-eq v2, v1, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 146
    if-eqz v2, :L3
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L3
  .line 148
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 149
    if-nez v0, :L4
    return-void
  :L4
  .line 150
    const-string v1, "1e5f0a00-0000-4000-8000-000000000001"
    invoke-static { v1 }, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->getPlaylistById(Ljava/util/UUID;)Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
  .line 151
    if-nez v1, :L5
    return-void
  :L5
  .line 152
    const v3, 2131821035
    invoke-virtual { p0, v3 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
  .line 153
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p0, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L6
    return-void
  :L6
  .line 156
    if-nez v2, :L7
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "\u2764 "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L7
    return-void
  :L7
  .line 157
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/database/Playlist;->setName(Ljava/lang/String;)V
  .line 158
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/database/Playlist;->setLowerName(Ljava/lang/String;)V
  .line 159
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->updatePlaylist(Lcom/innioasis/y1/database/Playlist;)V
  :L8
  .line 162
    goto :L10
  :L9
  .line 160
    move-exception p0
  :L10
  .line 163
    return-void
.end method

.method public static tickBlocked(Ljava/lang/Object;I)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 4
  .line 227
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L3
    if-gez p1, :L1
    goto :L3
  :L1
  .line 228
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result p0
  :L2
    return p0
  :L3
  .line 227
    return v0
  :L4
  .line 229
    move-exception p0
  .line 230
    return v0
.end method

.method public static untickFav(Ljava/lang/Object;)V
  .catchall { :L0 .. :L8 } :L10
  .registers 7
  :L0
  .line 273
    instance-of v0, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez v0, :L1
    return-void
  :L1
  .line 274
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 275
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v0
  .line 276
    if-eqz v0, :L9
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L2
    goto :L9
  :L2
  .line 277
    nop
  .line 278
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
    const/4 v3, 0
  :L3
    if-ltz v1, :L7
  .line 279
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 280
    instance-of v5, v4, Ljava/lang/Integer;
    if-nez v5, :L4
    goto :L6
  :L4
  .line 281
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
  .line 282
    invoke-interface { v0, v1 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 283
    const/4 v3, 1
  :L6
  .line 278
    add-int/lit8 v1, v1, -1
    goto :L3
  :L7
  .line 285
    if-eqz v3, :L8
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  :L8
  .line 288
    goto :L11
  :L9
  .line 276
    return-void
  :L10
  .line 286
    move-exception p0
  :L11
  .line 289
    return-void
.end method

.method private static vMode()I
  .registers 3
  .line 454
    sget v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    if-gez v0, :L2
  .line 455
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 456
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
  .line 458
    sget v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    return v0
.end method

.method public static videoAddedDialog(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 480
    if-nez p0, :L0
    return-void
  :L0
  .line 481
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 482
    const v1, 2131821028
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 483
    const v1, 2131821029
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 485
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Playlists$VideoAddedPick;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/Playlists$VideoAddedPick;-><init>(Landroid/app/Activity;)V
    const v3, 2131886360
    invoke-direct { v1, p0, v0, v2, v3 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L1
  .line 488
    goto :L3
  :L2
  .line 486
    move-exception p0
  :L3
  .line 489
    return-void
.end method

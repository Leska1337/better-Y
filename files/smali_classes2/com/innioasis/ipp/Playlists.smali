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
  .line 218
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Playlists;->added:I
  .line 337
    sput v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 38
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$002(I)I
  .registers 1
  .line 38
    sput p0, Lcom/innioasis/ipp/Playlists;->pending:I
    return p0
.end method

.method static synthetic access$100(I)V
  .registers 1
  .line 38
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->setVMode(I)V
    return-void
.end method

.method static synthetic access$202(Z)Z
  .registers 1
  .line 38
    sput-boolean p0, Lcom/innioasis/ipp/Playlists;->vKeep:Z
    return p0
.end method

.method static synthetic access$300(Landroid/app/Activity;)V
  .registers 1
  .line 38
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->relistVideos(Landroid/app/Activity;)V
    return-void
.end method

.method public static addFromMenu(Lcom/innioasis/music/adapter/MyBaseAdapter;Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .catchall { :L1 .. :L10 } :L11
  .registers 8
  .line 470
    const/4 v0, 0
    if-nez p1, :L0
    return v0
  :L0
  .line 471
    const/4 v1, 1
  :L1
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p1
  .line 472
    if-nez p1, :L2
    return v0
  :L2
  .line 473
    if-nez p0, :L3
    return v1
  :L3
  .line 474
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 475
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v3
  .line 476
    if-eqz v3, :L7
    invoke-interface { v3 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-nez v4, :L7
  .line 477
    nop
  :L4
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v0, v4, :L6
  .line 478
    invoke-interface { v3, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    invoke-virtual { p0, v4 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v4
  .line 479
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-eqz v5, :L5
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 477
    add-int/lit8 v0, v0, 1
    goto :L4
  :L6
  .line 481
    invoke-interface { v3 }, Ljava/util/List;->clear()V
  .line 482
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
    goto :L8
  :L7
  .line 484
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v0
  .line 485
    instance-of v3, v0, Lcom/innioasis/y1/database/Song;
    if-eqz v3, :L8
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L8
  .line 487
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L9
    return v1
  :L9
  .line 488
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    invoke-virtual { v0, v2, p1 }, Lcom/innioasis/y1/database/Y1Repository;->addToPlayList(Ljava/util/List;Ljava/util/UUID;)V
  .line 489
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 490
    instance-of p1, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz p1, :L10
  .line 491
    move-object p1, p0
    check-cast p1, Lcom/innioasis/y1/base/BaseActivity;
    const v0, 2131820580
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/base/BaseActivity;->showToast(Ljava/lang/String;)V
  :L10
  .line 494
    goto :L12
  :L11
  .line 493
    move-exception p0
  :L12
  .line 495
    return v1
.end method

.method public static addMsg(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L5
  .registers 3
  :L0
  .line 511
    sget-boolean v0, Lcom/innioasis/ipp/Playlists;->nothingNew:Z
    if-eqz v0, :L4
    if-eqz p0, :L4
    if-nez p1, :L1
    goto :L4
  :L1
  .line 512
    const v0, 2131820580
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L2
    return-object p1
  :L2
  .line 513
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Playlists;->nothingNew:Z
  .line 514
    const v0, 2131821107
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 511
    return-object p1
  :L5
  .line 515
    move-exception p0
  .line 516
    return-object p1
.end method

.method public static addedSortDialog(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 6
  :L0
  .line 251
    instance-of v0, p0, Lcom/innioasis/music/PlayListActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 252
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 253
    const v1, 2131821028
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 254
    const v1, 2131821029
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 256
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Playlists$AddedPick;
    move-object v3, p0
    check-cast v3, Lcom/innioasis/music/PlayListActivity;
    invoke-direct { v2, v3, p1 }, Lcom/innioasis/ipp/Playlists$AddedPick;-><init>(Lcom/innioasis/music/PlayListActivity;Lcom/innioasis/music/util/SubMenuDialog;)V
    const p1, 2131886360
    invoke-direct { v1, p0, v0, v2, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L2
  .line 258
    goto :L4
  :L3
  .line 257
    move-exception p0
  :L4
  .line 259
    return-void
.end method

.method public static byAdded(Landroidx/room/RoomDatabase;Ljava/util/UUID;Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L1 } :L12
  .catchall { :L2 .. :L5 } :L11
  .catchall { :L7 .. :L12 } :L12
  .registers 9
  .line 285
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
  .line 289
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  .line 290
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
  .line 292
    const/4 p1, 0
  :L2
  .line 293
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v2
    if-eqz v2, :L7
  .line 294
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v2
    if-eqz v2, :L3
    const/4 v2, 0
    goto :L4
  :L3
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v2
  :L4
  .line 295
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
  .line 296
    goto :L2
  :L7
  .line 298
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 299
    nop
  .line 300
    invoke-virtual { v0 }, Ljava/util/HashMap;->isEmpty()Z
    move-result p0
    if-eqz p0, :L8
    return-object p2
  :L8
  .line 301
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, p2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 302
    new-instance p1, Lcom/innioasis/ipp/Playlists$AddedCmp;
    sget v2, Lcom/innioasis/ipp/Playlists;->added:I
    if-ne v2, v1, :L9
    goto :L10
  :L9
    const/4 v3, 0
  :L10
    invoke-direct { p1, v0, v3 }, Lcom/innioasis/ipp/Playlists$AddedCmp;-><init>(Ljava/util/HashMap;Z)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 303
    return-object p0
  :L11
  .line 298
    move-exception p1
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 299
    throw p1
  :L12
  .line 304
    move-exception p0
  .line 305
    return-object p2
  :L13
  .line 286
    return-object p2
.end method

.method public static byAddedOn()Z
  .registers 1
  .line 231
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
  .line 415
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->vMode()I
    move-result v0
    if-eqz v0, :L12
    if-eqz p0, :L12
    if-eqz p1, :L12
    if-eqz p2, :L12
  .line 416
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L0
    goto :L12
  :L0
  .line 420
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  .line 421
    const-string v2, "select pv.video_id from playlist_video pv join video_playlist vp on vp.playlist_id = pv.playlist_id where vp.playlist_name = ? order by pv.rowid"
    const/4 v3, 1
    new-array v4, v3, [Ljava/lang/Object;
    const/4 v5, 0
    aput-object p1, v4, v5
    invoke-virtual { p0, v2, v4 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object p0
  :L1
  .line 423
    const/4 p1, 0
  :L2
  .line 424
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v2
    if-eqz v2, :L6
  .line 425
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v2
    if-eqz v2, :L3
    goto :L2
  :L3
  .line 426
    invoke-interface { p0, v5 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v6
    invoke-static { v6, v7 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v2
  .line 427
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
  .line 428
    goto :L2
  :L6
  .line 430
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 431
    nop
  .line 432
    invoke-virtual { v0 }, Ljava/util/HashMap;->isEmpty()Z
    move-result p0
    if-eqz p0, :L7
    return-object p2
  :L7
  .line 433
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, p2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 434
    new-instance p1, Lcom/innioasis/ipp/Playlists$VideoAddedCmp;
    sget v2, Lcom/innioasis/ipp/Playlists;->vAdded:I
    if-ne v2, v1, :L8
    goto :L9
  :L8
    const/4 v3, 0
  :L9
    invoke-direct { p1, v0, v3 }, Lcom/innioasis/ipp/Playlists$VideoAddedCmp;-><init>(Ljava/util/HashMap;Z)V
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 435
    return-object p0
  :L10
  .line 430
    move-exception p1
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 431
    throw p1
  :L11
  .line 436
    move-exception p0
  .line 437
    return-object p2
  :L12
  .line 417
    return-object p2
.end method

.method public static enabled()Z
  .registers 2
  .line 64
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 65
    const-string v1, "likes"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method public static favMenu(Lcom/innioasis/music/util/SubMenuDialog;Ljava/lang/Object;Landroid/content/Context;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 6
  .line 131
    if-eqz p0, :L9
    if-nez p2, :L0
    goto :L9
  :L0
  .line 132
    invoke-static { p2 }, Lcom/innioasis/ipp/PlGrid;->noteMenu(Landroid/content/Context;)V
  .line 133
    instance-of v0, p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v0, :L1
    move-object v0, p1
    check-cast v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 134
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
  .line 135
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 137
    sget-object v2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortPlayListIsChange()Z
    move-result v2
    if-eqz v2, :L3
  .line 138
    const v2, 2131820961
    invoke-virtual { p2, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L3
  .line 140
    if-nez v0, :L4
  .line 141
    const v2, 2131820844
    invoke-virtual { p2, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 142
    const v2, 2131820584
    invoke-virtual { p2, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L4
  .line 144
    const v2, 2131820854
    invoke-virtual { p2, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 145
    if-nez v0, :L5
    const v0, 2131820666
    invoke-virtual { p2, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-interface { v1, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L5
  .line 146
    const v0, 2131820907
    invoke-virtual { p2, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-interface { v1, v0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 147
    invoke-static { v1, p2 }, Lcom/innioasis/ipp/M3u;->menu(Ljava/util/List;Landroid/content/Context;)V
  .line 148
    invoke-static { v1, p1, p2 }, Lcom/innioasis/ipp/PlGrid;->menu(Ljava/util/List;Ljava/lang/Object;Landroid/content/Context;)V
  .line 149
    invoke-static { v1, p2 }, Lcom/innioasis/ipp/PlGrid;->viewEntry(Ljava/util/List;Landroid/content/Context;)V
  .line 150
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  :L6
  .line 152
    goto :L8
  :L7
  .line 151
    move-exception p0
  :L8
  .line 153
    return-void
  :L9
  .line 131
    return-void
.end method

.method public static first(Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L9 } :L10
  .registers 4
  .line 71
    if-eqz p0, :L11
  :L0
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L1
    goto :L11
  :L1
  .line 72
    nop
  .line 73
    const/4 v0, 0
    const/4 v1, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 74
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    goto :L5
  :L3
  .line 73
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
    const/4 v1, -1
  :L5
  .line 76
    if-gez v1, :L6
    return-object p0
  :L6
  .line 77
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->enabled()Z
    move-result v2
    if-nez v2, :L7
  .line 78
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 79
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  .line 80
    return-object v0
  :L7
  .line 82
    if-nez v1, :L8
    return-object p0
  :L8
  .line 83
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 84
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v2, v0, v1 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  :L9
  .line 85
    return-object v2
  :L10
  .line 86
    move-exception v0
  .line 87
    return-object p0
  :L11
  .line 71
    return-object p0
.end method

.method public static isFav(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L1 } :L6
  .catchall { :L2 .. :L4 } :L6
  .registers 4
  .line 54
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
  .line 55
    instance-of v1, p0, Ljava/util/UUID;
    if-eqz v1, :L5
    invoke-virtual { p0 }, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
  :L4
    return p0
  :L5
  .line 56
    return v0
  :L6
  .line 57
    move-exception p0
  .line 58
    return v0
.end method

.method public static keepAdded()V
  .registers 1
  .line 236
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Playlists;->pending:I
  .line 237
    return-void
.end method

.method public static locked(Ljava/lang/Object;)Z
  .registers 1
  .line 48
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method private static mode()I
  .registers 3
  .line 222
    sget v0, Lcom/innioasis/ipp/Playlists;->added:I
    if-gez v0, :L2
  .line 223
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 224
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
  .line 226
    sget v0, Lcom/innioasis/ipp/Playlists;->added:I
    return v0
.end method

.method public static noteAdded(Ljava/util/List;Ljava/util/List;)V
  .registers 2
  .line 505
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
  .line 506
    return-void
.end method

.method public static notePlaylistSort()V
  .registers 3
  .line 241
    sget v0, Lcom/innioasis/ipp/Playlists;->pending:I
  .line 242
    const/4 v1, 0
    sput v1, Lcom/innioasis/ipp/Playlists;->pending:I
  .line 243
    const/4 v1, -1
    if-ne v0, v1, :L0
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->mode()I
    return-void
  :L0
  .line 244
    sput v0, Lcom/innioasis/ipp/Playlists;->added:I
  .line 245
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 246
    if-eqz v1, :L1
    const-string v2, "pl_added"
    invoke-static { v1, v2, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 247
    return-void
.end method

.method public static noteVideoSort()V
  .registers 2
  .line 357
    sget-boolean v0, Lcom/innioasis/ipp/Playlists;->vKeep:Z
    const/4 v1, 0
    if-eqz v0, :L0
  .line 358
    sput-boolean v1, Lcom/innioasis/ipp/Playlists;->vKeep:Z
  .line 359
    return-void
  :L0
  .line 361
    invoke-static { v1 }, Lcom/innioasis/ipp/Playlists;->setVMode(I)V
  .line 362
    return-void
.end method

.method private static relistVideos(Landroid/app/Activity;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 398
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-nez v0, :L1
    return-void
  :L1
  .line 399
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    const-string v1, "getVideoBySort"
    const/4 v2, 0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
  .line 400
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Method;->setAccessible(Z)V
  .line 401
    new-array v1, v2, [Ljava/lang/Object;
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 403
    goto :L4
  :L3
  .line 402
    move-exception p0
  :L4
  .line 404
    return-void
.end method

.method private static setVMode(I)V
  .registers 3
  .line 349
    sget v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    if-ne v0, p0, :L0
    return-void
  :L0
  .line 350
    sput p0, Lcom/innioasis/ipp/Playlists;->vAdded:I
  .line 351
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 352
    if-eqz v0, :L1
    const-string v1, "vpl_added"
    invoke-static { v0, v1, p0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 353
    return-void
.end method

.method public static skip(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 172
    if-eqz p1, :L8
    instance-of p1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez p1, :L0
    goto :L8
  :L0
  .line 174
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 175
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p1
  .line 176
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 177
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemCount()I
    move-result v0
  .line 178
    add-int/lit8 v1, p1, 1
  :L2
  .line 179
    if-ge v1, v0, :L3
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 180
    if-lt v1, v0, :L4
    return-void
  :L4
  .line 181
    const/4 v0, 1
    invoke-virtual { p0, v1, v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setSelectPosition(IZ)V
  .line 182
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyItemChanged(I)V
  .line 183
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyItemChanged(I)V
  :L5
  .line 185
    goto :L7
  :L6
  .line 184
    move-exception p0
  :L7
  .line 186
    return-void
  :L8
  .line 172
    return-void
.end method

.method public static syncName(Landroid/content/Context;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 5
  .line 101
    const-string v0, "fav_lang"
    if-nez p0, :L0
    return-void
  :L0
  .line 103
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->ensure(Landroid/content/Context;)V
  .line 105
    sget-object v1, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getLanguage()I
    move-result v1
  .line 106
    const/4 v2, -1
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v2
    if-eq v2, v1, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 107
    if-eqz v2, :L3
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L3
  .line 109
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 110
    if-nez v0, :L4
    return-void
  :L4
  .line 111
    const-string v1, "1e5f0a00-0000-4000-8000-000000000001"
    invoke-static { v1 }, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->getPlaylistById(Ljava/util/UUID;)Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
  .line 112
    if-nez v1, :L5
    return-void
  :L5
  .line 113
    const v3, 2131821035
    invoke-virtual { p0, v3 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
  .line 114
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p0, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L6
    return-void
  :L6
  .line 116
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
  .line 117
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/database/Playlist;->setName(Ljava/lang/String;)V
  .line 118
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/database/Playlist;->setLowerName(Ljava/lang/String;)V
  .line 119
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->updatePlaylist(Lcom/innioasis/y1/database/Playlist;)V
  :L8
  .line 121
    goto :L10
  :L9
  .line 120
    move-exception p0
  :L10
  .line 122
    return-void
.end method

.method public static tickBlocked(Ljava/lang/Object;I)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 4
  .line 163
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L3
    if-gez p1, :L1
    goto :L3
  :L1
  .line 164
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result p0
  :L2
    return p0
  :L3
  .line 163
    return v0
  :L4
  .line 165
    move-exception p0
  .line 166
    return v0
.end method

.method public static untickFav(Ljava/lang/Object;)V
  .catchall { :L0 .. :L8 } :L10
  .registers 7
  :L0
  .line 194
    instance-of v0, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez v0, :L1
    return-void
  :L1
  .line 195
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 196
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v0
  .line 197
    if-eqz v0, :L9
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L2
    goto :L9
  :L2
  .line 198
    nop
  .line 199
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
    const/4 v3, 0
  :L3
    if-ltz v1, :L7
  .line 200
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 201
    instance-of v5, v4, Ljava/lang/Integer;
    if-nez v5, :L4
    goto :L6
  :L4
  .line 202
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
  .line 203
    invoke-interface { v0, v1 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  .line 204
    const/4 v3, 1
  :L6
  .line 199
    add-int/lit8 v1, v1, -1
    goto :L3
  :L7
  .line 206
    if-eqz v3, :L8
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  :L8
  .line 208
    goto :L11
  :L9
  .line 197
    return-void
  :L10
  .line 207
    move-exception p0
  :L11
  .line 209
    return-void
.end method

.method private static vMode()I
  .registers 3
  .line 341
    sget v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    if-gez v0, :L2
  .line 342
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 343
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
  .line 345
    sget v0, Lcom/innioasis/ipp/Playlists;->vAdded:I
    return v0
.end method

.method public static videoAddedDialog(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 366
    if-nez p0, :L0
    return-void
  :L0
  .line 367
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 368
    const v1, 2131821028
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 369
    const v1, 2131821029
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 370
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Playlists$VideoAddedPick;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/Playlists$VideoAddedPick;-><init>(Landroid/app/Activity;)V
    const v3, 2131886360
    invoke-direct { v1, p0, v0, v2, v3 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L1
  .line 372
    goto :L3
  :L2
  .line 371
    move-exception p0
  :L3
  .line 373
    return-void
.end method

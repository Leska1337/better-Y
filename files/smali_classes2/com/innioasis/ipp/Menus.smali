.class public final Lcom/innioasis/ipp/Menus;
.super Ljava/lang/Object;
.source "Menus.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Menus$Snap;
  }
.end annotation

.field private final static MULTI:[I

.field private final static SNAPS:Ljava/util/WeakHashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 73
    const/16 v0, 11
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Menus;->MULTI:[I
  .line 90
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    return-void
  :L0
  .array-data 4
      2131820584
      2131820844
      2131820841
      2131820591
      2131820582
      2131820589
      2131821094
      2131820906
      2131820666
      2131821008
      2131821047
  .end array-data
.end method

.method private constructor <init>()V
  .registers 1
  .line 64
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 65
    return-void
.end method

.method private static browseTicks(Ljava/util/List;)I
  .registers 5
  .line 353
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 354
    nop
  .line 355
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v0, v2, :L3
  .line 356
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 357
    instance-of v3, v2, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
    if-eqz v3, :L2
    check-cast v2, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 358
    invoke-virtual { v2 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->isMultiSelect()Z
    move-result v2
    if-eqz v2, :L2
  .line 359
    add-int/lit8 v1, v1, 1
  :L2
  .line 355
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 362
    return v1
.end method

.method private static filter(Landroid/app/Dialog;)V
  .catchall { :L1 .. :L15 } :L17
  .registers 12
  .line 135
    if-nez p0, :L0
    return-void
  :L0
  .line 136
    const v0, 2131362413
  :L1
    invoke-virtual { p0, v0 }, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 137
    instance-of v1, v0, Landroid/widget/ListView;
    if-nez v1, :L2
    return-void
  :L2
  .line 138
    check-cast v0, Landroid/widget/ListView;
    invoke-virtual { v0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 139
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L3
    return-void
  :L3
  .line 140
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 141
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v1
  .line 142
    if-eqz v1, :L16
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L4
    goto/16 :L16
  :L4
  .line 144
    sget-object v2, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v2, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Menus$Snap;
  .line 145
    const/4 v4, 0
    if-eqz v3, :L5
    iget-object v5, v3, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
    invoke-static { v1, v5 }, Lcom/innioasis/ipp/Menus;->same(Ljava/util/List;Ljava/util/List;)Z
    move-result v5
    if-eqz v5, :L5
  .line 146
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 147
    iget-object v2, v3, Lcom/innioasis/ipp/Menus$Snap;->full:Ljava/util/ArrayList;
    invoke-interface { v1, v2 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    goto :L6
  :L5
  .line 149
    new-instance v3, Lcom/innioasis/ipp/Menus$Snap;
    invoke-direct { v3, v4 }, Lcom/innioasis/ipp/Menus$Snap;-><init>(Lcom/innioasis/ipp/Menus$1;)V
  .line 150
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v5, v3, Lcom/innioasis/ipp/Menus$Snap;->full:Ljava/util/ArrayList;
  .line 151
    invoke-virtual { v2, p0, v3 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L6
  .line 153
    iput-object v4, v3, Lcom/innioasis/ipp/Menus$Snap;->map:[I
  .line 155
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->hostOf(Landroid/app/Dialog;)Landroid/app/Activity;
    move-result-object p0
  .line 156
    const/4 v2, 0
    if-eqz p0, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->ticks(Landroid/app/Activity;)I
    move-result v4
    const/4 v5, 1
    if-le v4, v5, :L7
    goto :L8
  :L7
    const/4 v5, 0
  :L8
  .line 157
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->selfPlaylist(Landroid/app/Activity;)Ljava/util/UUID;
    move-result-object v4
  .line 158
    if-nez v5, :L9
    if-eqz v4, :L14
  :L9
  .line 159
    new-instance v6, Ljava/util/ArrayList;
    invoke-direct { v6 }, Ljava/util/ArrayList;-><init>()V
  .line 160
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct { v7 }, Ljava/util/ArrayList;-><init>()V
  .line 161
    const/4 v8, 0
  :L10
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v9
    if-ge v8, v9, :L12
  .line 162
    invoke-interface { v1, v8 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
  .line 163
    invoke-static { p0, v9, v5, v4 }, Lcom/innioasis/ipp/Menus;->keeps(Landroid/app/Activity;Ljava/lang/Object;ZLjava/util/UUID;)Z
    move-result v10
    if-eqz v10, :L11
  .line 164
    invoke-virtual { v6, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 165
    invoke-static { v8 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-virtual { v7, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L11
  .line 161
    add-int/lit8 v8, v8, 1
    goto :L10
  :L12
  .line 171
    invoke-virtual { v6 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-nez p0, :L14
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result p0
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v4
    if-ge p0, v4, :L14
  .line 172
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 173
    invoke-interface { v1, v6 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 174
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [I
    iput-object p0, v3, Lcom/innioasis/ipp/Menus$Snap;->map:[I
  .line 175
    nop
  :L13
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result p0
    if-ge v2, p0, :L14
  .line 176
    iget-object p0, v3, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    invoke-virtual { v7, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    aput v4, p0, v2
  .line 175
    add-int/lit8 v2, v2, 1
    goto :L13
  :L14
  .line 180
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object p0, v3, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
  .line 181
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  :L15
  .line 184
    goto :L18
  :L16
  .line 142
    return-void
  :L17
  .line 182
    move-exception p0
  :L18
  .line 185
    return-void
.end method

.method private static hostOf(Landroid/app/Dialog;)Landroid/app/Activity;
  .catchall { :L0 .. :L4 } :L6
  .catchall { :L7 .. :L8 } :L9
  .registers 2
  :L0
  .line 402
    invoke-virtual { p0 }, Landroid/app/Dialog;->getOwnerActivity()Landroid/app/Activity;
    move-result-object v0
  .line 403
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 404
    invoke-virtual { p0 }, Landroid/app/Dialog;->getContext()Landroid/content/Context;
    move-result-object p0
  :L2
  .line 405
    instance-of v0, p0, Landroid/content/ContextWrapper;
    if-eqz v0, :L5
  .line 406
    instance-of v0, p0, Landroid/app/Activity;
    if-eqz v0, :L3
    check-cast p0, Landroid/app/Activity;
    return-object p0
  :L3
  .line 407
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
  :L4
    goto :L2
  :L5
  .line 411
    goto :L7
  :L6
  .line 409
    move-exception p0
  :L7
  .line 413
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object p0
  :L8
    return-object p0
  :L9
  .line 414
    move-exception p0
  .line 415
    const/4 p0, 0
    return-object p0
.end method

.method public static index(Lcom/innioasis/music/util/SubMenuDialog;I)I
  .registers 2
  .line 193
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Menus;->mapped(Landroid/app/Dialog;I)I
    move-result p0
    return p0
.end method

.method private static isPlaylistEntry(Ljava/lang/Object;)Z
  .registers 4
  .line 247
    instance-of v0, p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    const/4 v1, 1
    const/4 v2, 0
    if-eqz v0, :L2
    check-cast p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 v1, 0
  :L1
    return v1
  :L2
  .line 248
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    if-eqz v0, :L5
  .line 249
    check-cast p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/video/VideoPlaylist;
    move-result-object p0
    if-eqz p0, :L3
    goto :L4
  :L3
    const/4 v1, 0
  :L4
    return v1
  :L5
  .line 251
    return v2
.end method

.method private static keeps(Landroid/app/Activity;Ljava/lang/Object;ZLjava/util/UUID;)Z
  .registers 7
  .line 223
    invoke-static { p1 }, Lcom/innioasis/ipp/Menus;->isPlaylistEntry(Ljava/lang/Object;)Z
    move-result v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L2
  .line 224
    invoke-static { p1 }, Lcom/innioasis/ipp/Menus;->playlistId(Ljava/lang/Object;)Ljava/util/UUID;
    move-result-object p0
  .line 225
    if-eqz p3, :L0
    if-eqz p0, :L0
    invoke-virtual { p3, p0 }, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L1
  :L0
    const/4 v1, 1
  :L1
    return v1
  :L2
  .line 227
    if-nez p2, :L3
    return v2
  :L3
  .line 228
    invoke-static { p1 }, Lcom/innioasis/ipp/Menus;->label(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p1
  .line 229
    if-nez p1, :L4
    return v2
  :L4
  .line 230
    const/4 p2, 0
  :L5
    sget-object p3, Lcom/innioasis/ipp/Menus;->MULTI:[I
    array-length v0, p3
    if-ge p2, v0, :L7
  .line 231
    aget p3, p3, p2
    invoke-virtual { p0, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { p1, p3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-eqz p3, :L6
    return v2
  :L6
  .line 230
    add-int/lit8 p2, p2, 1
    goto :L5
  :L7
  .line 233
    return v1
.end method

.method private static label(Ljava/lang/Object;)Ljava/lang/String;
  .registers 2
  .line 240
    instance-of v0, p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    if-eqz v0, :L0
    check-cast p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 241
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    if-eqz v0, :L1
    check-cast p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 242
    const/4 p0, 0
    return-object p0
.end method

.method private static mapped(Landroid/app/Dialog;I)I
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  :L0
  .line 207
    sget-object v0, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Menus$Snap;
  .line 208
    if-eqz p0, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    if-eqz v0, :L3
    if-ltz p1, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    array-length v0, v0
    if-lt p1, v0, :L1
    goto :L3
  :L1
  .line 209
    iget-object p0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    aget p0, p0, p1
  :L2
    return p0
  :L3
  .line 208
    return p1
  :L4
  .line 210
    move-exception p0
  .line 211
    return p1
.end method

.method public static onShow(Lcom/innioasis/music/util/SubMenuDialog;)V
  .registers 2
  .line 113
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->hold(Z)V
  .line 114
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->filter(Landroid/app/Dialog;)V
  .line 115
    return-void
.end method

.method public static onShowVideo(Lcom/innioasis/y1/activity/video/SubMenuVideoDialog;)V
  .registers 1
  .line 129
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->filter(Landroid/app/Dialog;)V
  .line 130
    return-void
.end method

.method public static photos(Ljava/util/List;Ljava/util/List;I)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  .line 389
    if-eqz p0, :L8
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L8
  :L1
  .line 390
    if-eqz p1, :L6
    if-ltz p2, :L6
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p2, v0, :L2
    goto :L6
  :L2
  .line 391
    invoke-interface { p1, p2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 392
    instance-of p2, p1, Lcom/innioasis/y1/activity/PhotosActivity$Item;
    if-nez p2, :L3
    return-object p0
  :L3
  .line 393
    check-cast p1, Lcom/innioasis/y1/activity/PhotosActivity$Item;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/PhotosActivity$Item;->isDirectory()Z
    move-result p1
    if-nez p1, :L4
    return-object p0
  :L4
  .line 394
    new-instance p1, Ljava/util/ArrayList;
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p2
    add-int/lit8 p2, p2, -1
    const/4 v0, 0
    invoke-interface { p0, v0, p2 }, Ljava/util/List;->subList(II)Ljava/util/List;
    move-result-object p2
    invoke-direct { p1, p2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L5
    return-object p1
  :L6
  .line 390
    return-object p0
  :L7
  .line 395
    move-exception p1
  .line 396
    return-object p0
  :L8
  .line 389
    return-object p0
.end method

.method private static playlistId(Ljava/lang/Object;)Ljava/util/UUID;
  .registers 3
  .line 260
    instance-of v0, p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 261
    check-cast p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
  .line 262
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v1
  :L2
    return-object v1
.end method

.method private static same(Ljava/util/List;Ljava/util/List;)Z
  .registers 6
  .line 282
    const/4 v0, 0
    if-eqz p1, :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v2
    if-eq v1, v2, :L0
    goto :L4
  :L0
  .line 283
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 284
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    if-eq v2, v3, :L2
    return v0
  :L2
  .line 283
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 286
    const/4 p0, 1
    return p0
  :L4
  .line 282
    return v0
.end method

.method private static selfPlaylist(Landroid/app/Activity;)Ljava/util/UUID;
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 272
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/PlayListActivity;
    if-nez v1, :L1
    return-object v0
  :L1
  .line 273
    check-cast p0, Lcom/innioasis/music/PlayListActivity;
    invoke-virtual { p0 }, Lcom/innioasis/music/PlayListActivity;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
  .line 274
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v0
  :L3
    return-object v0
  :L4
  .line 275
    move-exception p0
  .line 276
    return-object v0
.end method

.method private static ticks(Landroid/app/Activity;)I
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 297
    const/4 v0, 0
    if-eqz p0, :L4
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    if-nez v1, :L1
    goto :L4
  :L1
  .line 298
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->ticksIn(Landroid/view/View;)I
    move-result p0
  :L2
    return p0
  :L3
  .line 299
    move-exception p0
  .line 300
    return v0
  :L4
  .line 297
    return v0
.end method

.method private static ticksIn(Landroid/view/View;)I
  .registers 4
  .line 305
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 306
    instance-of v1, p0, Landroid/widget/AbsListView;
    if-eqz v1, :L4
  .line 307
    check-cast p0, Landroid/widget/AbsListView;
    invoke-virtual { p0 }, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;
    move-result-object p0
  .line 308
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v1, :L3
  .line 309
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  .line 310
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L2
    return v0
  :L3
  .line 312
    return v0
  :L4
  .line 314
    instance-of v1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L12
  .line 315
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 316
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L7
  .line 317
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
  .line 318
    if-nez p0, :L5
    goto :L6
  :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L6
    return v0
  :L7
  .line 320
    instance-of v1, p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v1, :L10
  .line 321
    check-cast p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
  .line 322
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
  .line 323
    if-nez p0, :L8
    goto :L9
  :L8
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L9
    return v0
  :L10
  .line 330
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-eqz v1, :L11
  .line 331
    check-cast p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->browseTicks(Ljava/util/List;)I
    move-result p0
    return p0
  :L11
  .line 333
    return v0
  :L12
  .line 335
    instance-of v1, p0, Landroid/view/ViewGroup;
    if-eqz v1, :L16
  .line 336
    check-cast p0, Landroid/view/ViewGroup;
  .line 337
    nop
  .line 338
    const/4 v1, 0
  :L13
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L15
  .line 339
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Menus;->ticksIn(Landroid/view/View;)I
    move-result v2
  .line 340
    if-le v2, v1, :L14
    move v1, v2
  :L14
  .line 338
    add-int/lit8 v0, v0, 1
    goto :L13
  :L15
  .line 342
    return v1
  :L16
  .line 344
    return v0
.end method

.method public static videoIndex(Lcom/innioasis/y1/activity/video/SubMenuVideoDialog;I)I
  .registers 2
  .line 202
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Menus;->mapped(Landroid/app/Dialog;I)I
    move-result p0
    return p0
.end method

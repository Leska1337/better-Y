.class public final Lcom/innioasis/ipp/Menus;
.super Ljava/lang/Object;
.source "Menus.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Menus$Snap;,
    Lcom/innioasis/ipp/Menus$ByName;,
    Lcom/innioasis/ipp/Menus$Chosen;
  }
.end annotation

.field private final static CHOOSERS:Ljava/util/WeakHashMap;

.field private final static MULTI:[I

.field private final static SNAPS:Ljava/util/WeakHashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 50
    const/16 v0, 13
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Menus;->MULTI:[I
  .line 68
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
  .line 80
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Menus;->CHOOSERS:Ljava/util/WeakHashMap;
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
      2131821141
      2131821137
  .end array-data
.end method

.method private constructor <init>()V
  .registers 1
  .line 43
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 44
    return-void
.end method

.method static synthetic access$100(Ljava/lang/Object;)Ljava/lang/String;
  .registers 1
  .line 41
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->playlistName(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$200(Landroid/app/Dialog;Ljava/lang/Object;Ljava/lang/Object;I)V
  .registers 4
  .line 41
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Menus;->dispatch(Landroid/app/Dialog;Ljava/lang/Object;Ljava/lang/Object;I)V
    return-void
.end method

.method private static browseTicks(Ljava/util/List;)I
  .registers 5
  .line 461
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 462
    nop
  .line 463
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v0, v2, :L3
  .line 464
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 465
    instance-of v3, v2, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
    if-eqz v3, :L2
    check-cast v2, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 466
    invoke-virtual { v2 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->isMultiSelect()Z
    move-result v2
    if-eqz v2, :L2
  .line 467
    add-int/lit8 v1, v1, 1
  :L2
  .line 463
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 470
    return v1
.end method

.method private static collapse(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/ipp/Menus$Snap;)V
  .registers 16
  .line 179
    const/4 v0, 0
    iput-object v0, p2, Lcom/innioasis/ipp/Menus$Snap;->group:Ljava/lang/Object;
  .line 180
    iput-object v0, p2, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
  .line 181
    iput-object v0, p2, Lcom/innioasis/ipp/Menus$Snap;->entryIndex:[I
  .line 182
    if-nez p0, :L0
    return-void
  :L0
  .line 183
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 184
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 185
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 186
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct { v4 }, Ljava/util/ArrayList;-><init>()V
  .line 187
    nop
  .line 188
    nop
  .line 189
    nop
  .line 190
    const/4 v5, -1
    const/4 v6, 0
    const/4 v7, 0
    const/4 v8, -1
    const/4 v9, -1
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v10
    if-ge v7, v10, :L8
  .line 191
    invoke-interface { p1, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v10
  .line 192
    iget-object v11, p2, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    if-nez v11, :L2
    move v11, v7
    goto :L3
  :L2
    iget-object v11, p2, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    aget v11, v11, v7
  :L3
  .line 193
    invoke-static { v10 }, Lcom/innioasis/ipp/Menus;->isPlaylistEntry(Ljava/lang/Object;)Z
    move-result v12
    if-eqz v12, :L6
  .line 194
    if-gez v8, :L4
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v8
  :L4
  .line 195
    invoke-static { v10 }, Lcom/innioasis/ipp/Menus;->isFavEntry(Ljava/lang/Object;)Z
    move-result v12
    if-eqz v12, :L5
  .line 196
    nop
  .line 197
    move-object v0, v10
    move v9, v11
    goto :L7
  :L5
  .line 199
    invoke-virtual { v1, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 200
    invoke-static { v11 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v10
    invoke-virtual { v2, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L7
  :L6
  .line 203
    invoke-virtual { v3, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 204
    invoke-static { v11 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v10
    invoke-virtual { v4, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 190
    add-int/lit8 v7, v7, 1
    goto :L1
  :L8
  .line 207
    if-gez v8, :L9
    return-void
  :L9
  .line 208
    if-eqz v0, :L10
    move-object v7, v0
    goto :L11
  :L10
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
  :L11
    instance-of v7, v7, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
  .line 209
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v10
    if-nez v10, :L13
  .line 210
    const v10, 2131821169
    invoke-virtual { p0, v10 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-static { v7, p0 }, Lcom/innioasis/ipp/Menus;->entry(ZLjava/lang/String;)Ljava/lang/Object;
    move-result-object p0
  .line 211
    invoke-virtual { v3, v8, p0 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 212
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v4, v8, v5 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 213
    iput-object p0, p2, Lcom/innioasis/ipp/Menus$Snap;->group:Ljava/lang/Object;
  .line 214
    iput-object v1, p2, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
  .line 215
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [I
    iput-object p0, p2, Lcom/innioasis/ipp/Menus$Snap;->entryIndex:[I
  .line 216
    const/4 p0, 0
  :L12
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v1
    if-ge p0, v1, :L13
    iget-object v1, p2, Lcom/innioasis/ipp/Menus$Snap;->entryIndex:[I
    invoke-virtual { v2, p0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/Integer;
    invoke-virtual { v5 }, Ljava/lang/Integer;->intValue()I
    move-result v5
    aput v5, v1, p0
    add-int/lit8 p0, p0, 1
    goto :L12
  :L13
  .line 218
    if-eqz v0, :L14
  .line 219
    invoke-virtual { v3, v8, v0 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 220
    invoke-static { v9 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v4, v8, p0 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  :L14
  .line 222
    invoke-interface { p1 }, Ljava/util/List;->clear()V
  .line 223
    invoke-interface { p1, v3 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 224
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [I
    iput-object p0, p2, Lcom/innioasis/ipp/Menus$Snap;->map:[I
  .line 225
    nop
  :L15
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result p0
    if-ge v6, p0, :L16
    iget-object p0, p2, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    invoke-virtual { v4, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/Integer;
    invoke-virtual { p1 }, Ljava/lang/Integer;->intValue()I
    move-result p1
    aput p1, p0, v6
    add-int/lit8 v6, v6, 1
    goto :L15
  :L16
  .line 226
    return-void
.end method

.method private static dispatch(Landroid/app/Dialog;Ljava/lang/Object;Ljava/lang/Object;I)V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 274
    nop
  :L0
  .line 275
    instance-of v0, p1, Lcom/innioasis/music/util/SubMenuDialog$Callback;
    if-eqz v0, :L1
    instance-of v0, p2, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    if-eqz v0, :L1
  .line 276
    check-cast p1, Lcom/innioasis/music/util/SubMenuDialog$Callback;
    check-cast p2, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-interface { p1, p3, p2 }, Lcom/innioasis/music/util/SubMenuDialog$Callback;->select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
    move-result p1
    goto :L3
  :L1
  .line 277
    instance-of v0, p1, Lcom/innioasis/y1/activity/video/SubMenuVideoDialog$Callback;
    if-eqz v0, :L2
    instance-of v0, p2, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    if-eqz v0, :L2
  .line 278
    check-cast p1, Lcom/innioasis/y1/activity/video/SubMenuVideoDialog$Callback;
    check-cast p2, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    invoke-interface { p1, p3, p2 }, Lcom/innioasis/y1/activity/video/SubMenuVideoDialog$Callback;->select(ILcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;)Z
    move-result p1
    goto :L3
  :L2
  .line 280
    const/4 p1, 1
  :L3
    if-eqz p1, :L4
    invoke-virtual { p0 }, Landroid/app/Dialog;->isShowing()Z
    move-result p1
    if-eqz p1, :L4
    invoke-virtual { p0 }, Landroid/app/Dialog;->dismiss()V
  :L4
  .line 282
    goto :L6
  :L5
  .line 281
    move-exception p0
  :L6
  .line 283
    return-void
.end method

.method private static entry(ZLjava/lang/String;)Ljava/lang/Object;
  .registers 3
  .line 230
    const/4 v0, 0
    if-eqz p0, :L0
    new-instance p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;-><init>(Ljava/lang/String;Lcom/innioasis/y1/database/video/VideoPlaylist;)V
    goto :L1
  :L0
  .line 231
    new-instance p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;-><init>(Ljava/lang/String;Lcom/innioasis/y1/database/Playlist;)V
  :L1
  .line 230
    return-object p0
.end method

.method private static filter(Landroid/app/Dialog;)V
  .catchall { :L0 .. :L15 } :L17
  .registers 12
  .line 103
    if-eqz p0, :L19
  :L0
    sget-object v0, Lcom/innioasis/ipp/Menus;->CHOOSERS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    goto/16 :L19
  :L1
  .line 104
    const v0, 2131362413
    invoke-virtual { p0, v0 }, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 105
    instance-of v1, v0, Landroid/widget/ListView;
    if-nez v1, :L2
    return-void
  :L2
  .line 106
    check-cast v0, Landroid/widget/ListView;
    invoke-virtual { v0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 107
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L3
    return-void
  :L3
  .line 108
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 109
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v1
  .line 110
    if-eqz v1, :L16
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L4
    goto/16 :L16
  :L4
  .line 112
    sget-object v2, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v2, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Menus$Snap;
  .line 113
    const/4 v4, 0
    if-eqz v3, :L5
    iget-object v5, v3, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
    invoke-static { v1, v5 }, Lcom/innioasis/ipp/Menus;->same(Ljava/util/List;Ljava/util/List;)Z
    move-result v5
    if-eqz v5, :L5
  .line 114
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 115
    iget-object v2, v3, Lcom/innioasis/ipp/Menus$Snap;->full:Ljava/util/ArrayList;
    invoke-interface { v1, v2 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    goto :L6
  :L5
  .line 117
    new-instance v3, Lcom/innioasis/ipp/Menus$Snap;
    invoke-direct { v3, v4 }, Lcom/innioasis/ipp/Menus$Snap;-><init>(Lcom/innioasis/ipp/Menus$1;)V
  .line 118
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v5, v3, Lcom/innioasis/ipp/Menus$Snap;->full:Ljava/util/ArrayList;
  .line 119
    invoke-virtual { v2, p0, v3 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L6
  .line 121
    iput-object v4, v3, Lcom/innioasis/ipp/Menus$Snap;->map:[I
  .line 123
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->hostOf(Landroid/app/Dialog;)Landroid/app/Activity;
    move-result-object p0
  .line 124
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
  .line 125
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->selfPlaylist(Landroid/app/Activity;)Ljava/util/UUID;
    move-result-object v4
  .line 126
    if-nez v5, :L9
    if-eqz v4, :L14
  :L9
  .line 127
    new-instance v6, Ljava/util/ArrayList;
    invoke-direct { v6 }, Ljava/util/ArrayList;-><init>()V
  .line 128
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct { v7 }, Ljava/util/ArrayList;-><init>()V
  .line 129
    const/4 v8, 0
  :L10
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v9
    if-ge v8, v9, :L12
  .line 130
    invoke-interface { v1, v8 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
  .line 131
    invoke-static { p0, v9, v5, v4 }, Lcom/innioasis/ipp/Menus;->keeps(Landroid/app/Activity;Ljava/lang/Object;ZLjava/util/UUID;)Z
    move-result v10
    if-eqz v10, :L11
  .line 132
    invoke-virtual { v6, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 133
    invoke-static { v8 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-virtual { v7, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L11
  .line 129
    add-int/lit8 v8, v8, 1
    goto :L10
  :L12
  .line 137
    invoke-virtual { v6 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v4
    if-nez v4, :L14
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v4
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L14
  .line 138
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 139
    invoke-interface { v1, v6 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 140
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result v4
    new-array v4, v4, [I
    iput-object v4, v3, Lcom/innioasis/ipp/Menus$Snap;->map:[I
  .line 141
    nop
  :L13
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result v4
    if-ge v2, v4, :L14
  .line 142
    iget-object v4, v3, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    invoke-virtual { v7, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/Integer;
    invoke-virtual { v5 }, Ljava/lang/Integer;->intValue()I
    move-result v5
    aput v5, v4, v2
  .line 141
    add-int/lit8 v2, v2, 1
    goto :L13
  :L14
  .line 146
    invoke-static { p0, v1, v3 }, Lcom/innioasis/ipp/Menus;->collapse(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/ipp/Menus$Snap;)V
  .line 147
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object p0, v3, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
  .line 148
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  :L15
  .line 150
    goto :L18
  :L16
  .line 110
    return-void
  :L17
  .line 149
    move-exception p0
  :L18
  .line 151
    return-void
  :L19
  .line 103
    return-void
.end method

.method public static group(Lcom/innioasis/music/util/SubMenuDialog;ILcom/innioasis/music/util/SubMenuDialog$Callback;)Z
  .registers 3
  .line 236
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Menus;->ours(Landroid/app/Dialog;ILjava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method public static groupVideo(Lcom/innioasis/y1/activity/video/SubMenuVideoDialog;ILcom/innioasis/y1/activity/video/SubMenuVideoDialog$Callback;)Z
  .registers 3
  .line 241
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Menus;->ours(Landroid/app/Dialog;ILjava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method private static hostOf(Landroid/app/Dialog;)Landroid/app/Activity;
  .catchall { :L0 .. :L4 } :L6
  .catchall { :L7 .. :L8 } :L9
  .registers 2
  :L0
  .line 497
    invoke-virtual { p0 }, Landroid/app/Dialog;->getOwnerActivity()Landroid/app/Activity;
    move-result-object v0
  .line 498
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 499
    invoke-virtual { p0 }, Landroid/app/Dialog;->getContext()Landroid/content/Context;
    move-result-object p0
  :L2
  .line 500
    instance-of v0, p0, Landroid/content/ContextWrapper;
    if-eqz v0, :L5
  .line 501
    instance-of v0, p0, Landroid/app/Activity;
    if-eqz v0, :L3
    check-cast p0, Landroid/app/Activity;
    return-object p0
  :L3
  .line 502
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
  :L4
    goto :L2
  :L5
  .line 505
    goto :L7
  :L6
  .line 504
    move-exception p0
  :L7
  .line 507
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object p0
  :L8
    return-object p0
  :L9
  .line 508
    move-exception p0
  .line 509
    const/4 p0, 0
    return-object p0
.end method

.method public static index(Lcom/innioasis/music/util/SubMenuDialog;I)I
  .registers 2
  .line 155
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Menus;->mapped(Landroid/app/Dialog;I)I
    move-result p0
    return p0
.end method

.method private static isFavEntry(Ljava/lang/Object;)Z
  .registers 2
  .line 316
    instance-of v0, p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    if-eqz v0, :L0
    check-cast p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static isPlaylistEntry(Ljava/lang/Object;)Z
  .registers 4
  .line 376
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
  .line 377
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    if-eqz v0, :L5
  .line 378
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
  .line 380
    return v2
.end method

.method private static keeps(Landroid/app/Activity;Ljava/lang/Object;ZLjava/util/UUID;)Z
  .registers 7
  .line 349
    invoke-static { p1 }, Lcom/innioasis/ipp/Menus;->isPlaylistEntry(Ljava/lang/Object;)Z
    move-result v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L2
  .line 350
    invoke-static { p1 }, Lcom/innioasis/ipp/Menus;->playlistId(Ljava/lang/Object;)Ljava/util/UUID;
    move-result-object p0
  .line 351
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
  .line 353
    invoke-static { p1 }, Lcom/innioasis/ipp/Menus;->label(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p1
  .line 354
    if-eqz p3, :L3
    if-eqz p1, :L3
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result p3
    if-nez p3, :L3
  .line 355
    const p3, 2131821136
    invoke-virtual { p0, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { p1, p3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-eqz p3, :L3
  .line 356
    return v1
  :L3
  .line 358
    if-nez p2, :L4
    return v2
  :L4
  .line 359
    if-nez p1, :L5
    return v2
  :L5
  .line 360
    const/4 p2, 0
  :L6
    sget-object p3, Lcom/innioasis/ipp/Menus;->MULTI:[I
    array-length v0, p3
    if-ge p2, v0, :L8
  .line 361
    aget p3, p3, p2
    invoke-virtual { p0, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { p1, p3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-eqz p3, :L7
    return v2
  :L7
  .line 360
    add-int/lit8 p2, p2, 1
    goto :L6
  :L8
  .line 363
    return v1
.end method

.method private static label(Ljava/lang/Object;)Ljava/lang/String;
  .registers 2
  .line 369
    instance-of v0, p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    if-eqz v0, :L0
    check-cast p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 370
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    if-eqz v0, :L1
    check-cast p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 371
    const/4 p0, 0
    return-object p0
.end method

.method private static mapped(Landroid/app/Dialog;I)I
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  :L0
  .line 165
    sget-object v0, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Menus$Snap;
  .line 166
    if-eqz p0, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    if-eqz v0, :L3
    if-ltz p1, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    array-length v0, v0
    if-lt p1, v0, :L1
    goto :L3
  :L1
  .line 167
    iget-object p0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    aget p0, p0, p1
  :L2
    return p0
  :L3
  .line 166
    return p1
  :L4
  .line 168
    move-exception p0
  .line 169
    return p1
.end method

.method public static onShow(Lcom/innioasis/music/util/SubMenuDialog;)V
  .registers 2
  .line 89
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->hold(Z)V
  .line 90
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->filter(Landroid/app/Dialog;)V
  .line 91
    return-void
.end method

.method public static onShowVideo(Lcom/innioasis/y1/activity/video/SubMenuVideoDialog;)V
  .registers 1
  .line 98
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->filter(Landroid/app/Dialog;)V
  .line 99
    return-void
.end method

.method private static ours(Landroid/app/Dialog;ILjava/lang/Object;)Z
  .catchall { :L0 .. :L8 } :L11
  .registers 15
  .line 246
    const/4 v0, 1
  :L0
    sget-object v1, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Menus$Snap;
  .line 247
    const/4 v2, 0
    if-eqz v1, :L10
    iget-object v3, v1, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
    if-eqz v3, :L10
    if-ltz p1, :L10
    iget-object v3, v1, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-lt p1, v3, :L1
    goto/16 :L10
  :L1
  .line 248
    iget-object v3, v1, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
    invoke-virtual { v3, p1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 249
    if-eqz p1, :L9
    iget-object v3, v1, Lcom/innioasis/ipp/Menus$Snap;->group:Ljava/lang/Object;
    if-eq p1, v3, :L2
    goto :L9
  :L2
  .line 250
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->hostOf(Landroid/app/Dialog;)Landroid/app/Activity;
    move-result-object p1
  .line 251
    if-nez p1, :L3
    return v0
  :L3
  .line 252
    iget-object v3, v1, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    new-array v4, v3, [Ljava/lang/Integer;
  .line 253
    const/4 v5, 0
  :L4
    if-ge v5, v3, :L5
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
    aput-object v6, v4, v5
    add-int/lit8 v5, v5, 1
    goto :L4
  :L5
  .line 254
    new-instance v5, Lcom/innioasis/ipp/Menus$ByName;
    iget-object v6, v1, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
    invoke-direct { v5, v6 }, Lcom/innioasis/ipp/Menus$ByName;-><init>(Ljava/util/List;)V
    invoke-static { v4, v5 }, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V
  .line 255
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 256
    new-array v11, v3, [I
  .line 257
    nop
  :L6
    if-ge v2, v3, :L7
  .line 258
    aget-object v6, v4, v2
    invoke-virtual { v6 }, Ljava/lang/Integer;->intValue()I
    move-result v6
    aput v6, v11, v2
  .line 259
    iget-object v6, v1, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
    aget v7, v11, v2
    invoke-virtual { v6, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Menus;->playlistName(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v6
    invoke-interface { v5, v6 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 257
    add-int/lit8 v2, v2, 1
    goto :L6
  :L7
  .line 262
    new-instance v2, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v3, Lcom/innioasis/ipp/Menus$Chosen;
    iget-object v9, v1, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
    iget-object v10, v1, Lcom/innioasis/ipp/Menus$Snap;->entryIndex:[I
    move-object v6, v3
    move-object v7, p0
    move-object v8, p2
    invoke-direct/range { v6 .. v11 }, Lcom/innioasis/ipp/Menus$Chosen;-><init>(Landroid/app/Dialog;Ljava/lang/Object;Ljava/util/List;[I[I)V
    const p0, 2131886360
    invoke-direct { v2, p1, v5, v3, p0 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
  .line 264
    sget-object p0, Lcom/innioasis/ipp/Menus;->CHOOSERS:Ljava/util/WeakHashMap;
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v2, p1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 265
    invoke-virtual { v2 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L8
  .line 267
    goto :L12
  :L9
  .line 249
    return v2
  :L10
  .line 247
    return v2
  :L11
  .line 266
    move-exception p0
  :L12
  .line 268
    return v0
.end method

.method public static photos(Ljava/util/List;Ljava/util/List;I)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  .line 480
    if-eqz p0, :L8
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L8
  :L1
  .line 481
    if-eqz p1, :L6
    if-ltz p2, :L6
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p2, v0, :L2
    goto :L6
  :L2
  .line 482
    invoke-interface { p1, p2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 483
    instance-of p2, p1, Lcom/innioasis/y1/activity/PhotosActivity$Item;
    if-nez p2, :L3
    return-object p0
  :L3
  .line 484
    check-cast p1, Lcom/innioasis/y1/activity/PhotosActivity$Item;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/PhotosActivity$Item;->isDirectory()Z
    move-result p1
    if-nez p1, :L4
    return-object p0
  :L4
  .line 485
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
  .line 481
    return-object p0
  :L7
  .line 486
    move-exception p1
  .line 487
    return-object p0
  :L8
  .line 480
    return-object p0
.end method

.method private static playlistId(Ljava/lang/Object;)Ljava/util/UUID;
  .registers 3
  .line 385
    instance-of v0, p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 386
    check-cast p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
  .line 387
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v1
  :L2
    return-object v1
.end method

.method private static playlistName(Ljava/lang/Object;)Ljava/lang/String;
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  :L0
  .line 287
    instance-of v0, p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    if-eqz v0, :L1
  .line 288
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object v0
  .line 289
    if-eqz v0, :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 291
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    if-eqz v0, :L3
  .line 292
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/video/VideoPlaylist;
    move-result-object v0
  .line 293
    if-eqz v0, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/video/VideoPlaylist;->getPlaylistName()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/video/VideoPlaylist;->getPlaylistName()Ljava/lang/String;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 296
    goto :L5
  :L4
  .line 295
    move-exception v0
  :L5
  .line 297
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->label(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
  .line 298
    if-nez p0, :L6
    const-string p0, ""
  :L6
    return-object p0
.end method

.method private static same(Ljava/util/List;Ljava/util/List;)Z
  .registers 6
  .line 403
    const/4 v0, 0
    if-eqz p1, :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v2
    if-eq v1, v2, :L0
    goto :L4
  :L0
  .line 404
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 405
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    if-eq v2, v3, :L2
    return v0
  :L2
  .line 404
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 407
    const/4 p0, 1
    return p0
  :L4
  .line 403
    return v0
.end method

.method private static selfPlaylist(Landroid/app/Activity;)Ljava/util/UUID;
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 393
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/PlayListActivity;
    if-nez v1, :L1
    return-object v0
  :L1
  .line 394
    check-cast p0, Lcom/innioasis/music/PlayListActivity;
    invoke-virtual { p0 }, Lcom/innioasis/music/PlayListActivity;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
  .line 395
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v0
  :L3
    return-object v0
  :L4
  .line 396
    move-exception p0
  .line 397
    return-object v0
.end method

.method private static ticks(Landroid/app/Activity;)I
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 413
    const/4 v0, 0
    if-eqz p0, :L4
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    if-nez v1, :L1
    goto :L4
  :L1
  .line 414
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->ticksIn(Landroid/view/View;)I
    move-result p0
  :L2
    return p0
  :L3
  .line 415
    move-exception p0
  .line 416
    return v0
  :L4
  .line 413
    return v0
.end method

.method private static ticksIn(Landroid/view/View;)I
  .registers 4
  .line 421
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 422
    instance-of v1, p0, Landroid/widget/AbsListView;
    if-eqz v1, :L4
  .line 423
    check-cast p0, Landroid/widget/AbsListView;
    invoke-virtual { p0 }, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;
    move-result-object p0
  .line 424
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v1, :L3
  .line 425
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  .line 426
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L2
    return v0
  :L3
  .line 428
    return v0
  :L4
  .line 430
    instance-of v1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L12
  .line 431
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 432
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L7
  .line 433
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
  .line 434
    if-nez p0, :L5
    goto :L6
  :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L6
    return v0
  :L7
  .line 436
    instance-of v1, p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v1, :L10
  .line 437
    check-cast p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
  .line 438
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
  .line 439
    if-nez p0, :L8
    goto :L9
  :L8
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L9
    return v0
  :L10
  .line 442
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-eqz v1, :L11
  .line 443
    check-cast p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->browseTicks(Ljava/util/List;)I
    move-result p0
    return p0
  :L11
  .line 445
    return v0
  :L12
  .line 447
    instance-of v1, p0, Landroid/view/ViewGroup;
    if-eqz v1, :L16
  .line 448
    check-cast p0, Landroid/view/ViewGroup;
  .line 449
    nop
  .line 450
    const/4 v1, 0
  :L13
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L15
  .line 451
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Menus;->ticksIn(Landroid/view/View;)I
    move-result v2
  .line 452
    if-le v2, v1, :L14
    move v1, v2
  :L14
  .line 450
    add-int/lit8 v0, v0, 1
    goto :L13
  :L15
  .line 454
    return v1
  :L16
  .line 456
    return v0
.end method

.method public static videoIndex(Lcom/innioasis/y1/activity/video/SubMenuVideoDialog;I)I
  .registers 2
  .line 160
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Menus;->mapped(Landroid/app/Dialog;I)I
    move-result p0
    return p0
.end method

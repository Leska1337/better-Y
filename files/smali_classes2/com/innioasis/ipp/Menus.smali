.class public final Lcom/innioasis/ipp/Menus;
.super Ljava/lang/Object;
.source "Menus.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Menus$Fit;,
    Lcom/innioasis/ipp/Menus$Snap;,
    Lcom/innioasis/ipp/Menus$ByName;,
    Lcom/innioasis/ipp/Menus$Chosen;
  }
.end annotation

.field private final static CHOOSERS:Ljava/util/WeakHashMap;

.field private final static MULTI:[I

.field private final static PHOTO_FULL:[I

.field private final static PHOTO_MAPS:Ljava/util/WeakHashMap;

.field private final static SNAPS:Ljava/util/WeakHashMap;

.method static constructor <clinit>()V
  .registers 3
  .line 53
    const/16 v0, 13
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Menus;->MULTI:[I
  .line 71
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
  .line 83
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Menus;->CHOOSERS:Ljava/util/WeakHashMap;
  .line 572
    const/4 v0, 3
    const/4 v1, 4
    const/4 v2, 0
    filled-new-array { v2, v0, v1 }, [I
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Menus;->PHOTO_FULL:[I
  .line 575
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Menus;->PHOTO_MAPS:Ljava/util/WeakHashMap;
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
  .line 46
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 47
    return-void
.end method

.method static synthetic access$000(Landroid/view/View;)Landroid/widget/TextView;
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->firstText(Landroid/view/View;)Landroid/widget/TextView;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$100(Ljava/lang/Object;)Ljava/lang/String;
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->label(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$300(Ljava/lang/Object;)Ljava/lang/String;
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->playlistName(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$400(Landroid/app/Dialog;Ljava/lang/Object;Ljava/lang/Object;I)V
  .registers 4
  .line 44
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Menus;->dispatch(Landroid/app/Dialog;Ljava/lang/Object;Ljava/lang/Object;I)V
    return-void
.end method

.method private static browseTicks(Ljava/util/List;)I
  .registers 5
  .line 541
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 542
    nop
  .line 543
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v0, v2, :L3
  .line 544
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 545
    instance-of v3, v2, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
    if-eqz v3, :L2
    check-cast v2, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 546
    invoke-virtual { v2 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->isMultiSelect()Z
    move-result v2
    if-eqz v2, :L2
  .line 547
    add-int/lit8 v1, v1, 1
  :L2
  .line 543
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 550
    return v1
.end method

.method private static collapse(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/ipp/Menus$Snap;)V
  .registers 16
  .line 262
    const/4 v0, 0
    iput-object v0, p2, Lcom/innioasis/ipp/Menus$Snap;->group:Ljava/lang/Object;
  .line 263
    iput-object v0, p2, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
  .line 264
    iput-object v0, p2, Lcom/innioasis/ipp/Menus$Snap;->entryIndex:[I
  .line 265
    if-nez p0, :L0
    return-void
  :L0
  .line 266
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 267
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 268
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 269
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct { v4 }, Ljava/util/ArrayList;-><init>()V
  .line 270
    nop
  .line 271
    nop
  .line 272
    nop
  .line 273
    const/4 v5, -1
    const/4 v6, 0
    const/4 v7, 0
    const/4 v8, -1
    const/4 v9, -1
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v10
    if-ge v7, v10, :L8
  .line 274
    invoke-interface { p1, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v10
  .line 275
    iget-object v11, p2, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    if-nez v11, :L2
    move v11, v7
    goto :L3
  :L2
    iget-object v11, p2, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    aget v11, v11, v7
  :L3
  .line 276
    invoke-static { v10 }, Lcom/innioasis/ipp/Menus;->isPlaylistEntry(Ljava/lang/Object;)Z
    move-result v12
    if-eqz v12, :L6
  .line 277
    if-gez v8, :L4
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v8
  :L4
  .line 278
    invoke-static { v10 }, Lcom/innioasis/ipp/Menus;->isFavEntry(Ljava/lang/Object;)Z
    move-result v12
    if-eqz v12, :L5
  .line 279
    nop
  .line 280
    move-object v0, v10
    move v9, v11
    goto :L7
  :L5
  .line 282
    invoke-virtual { v1, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 283
    invoke-static { v11 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v10
    invoke-virtual { v2, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L7
  :L6
  .line 286
    invoke-virtual { v3, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 287
    invoke-static { v11 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v10
    invoke-virtual { v4, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 273
    add-int/lit8 v7, v7, 1
    goto :L1
  :L8
  .line 290
    if-gez v8, :L9
    return-void
  :L9
  .line 291
    if-eqz v0, :L10
    move-object v7, v0
    goto :L11
  :L10
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
  :L11
    instance-of v7, v7, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
  .line 292
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v10
    if-nez v10, :L13
  .line 293
    const v10, 2131821169
    invoke-virtual { p0, v10 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-static { v7, p0 }, Lcom/innioasis/ipp/Menus;->entry(ZLjava/lang/String;)Ljava/lang/Object;
    move-result-object p0
  .line 294
    invoke-virtual { v3, v8, p0 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 295
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v4, v8, v5 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 296
    iput-object p0, p2, Lcom/innioasis/ipp/Menus$Snap;->group:Ljava/lang/Object;
  .line 297
    iput-object v1, p2, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
  .line 298
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [I
    iput-object p0, p2, Lcom/innioasis/ipp/Menus$Snap;->entryIndex:[I
  .line 299
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
  .line 301
    if-eqz v0, :L14
  .line 302
    invoke-virtual { v3, v8, v0 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 303
    invoke-static { v9 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v4, v8, p0 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  :L14
  .line 305
    invoke-interface { p1 }, Ljava/util/List;->clear()V
  .line 306
    invoke-interface { p1, v3 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 307
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [I
    iput-object p0, p2, Lcom/innioasis/ipp/Menus$Snap;->map:[I
  .line 308
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
  .line 309
    return-void
.end method

.method private static dispatch(Landroid/app/Dialog;Ljava/lang/Object;Ljava/lang/Object;I)V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 357
    nop
  :L0
  .line 358
    instance-of v0, p1, Lcom/innioasis/music/util/SubMenuDialog$Callback;
    if-eqz v0, :L1
    instance-of v0, p2, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    if-eqz v0, :L1
  .line 359
    check-cast p1, Lcom/innioasis/music/util/SubMenuDialog$Callback;
    check-cast p2, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-interface { p1, p3, p2 }, Lcom/innioasis/music/util/SubMenuDialog$Callback;->select(ILcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
    move-result p1
    goto :L3
  :L1
  .line 360
    instance-of v0, p1, Lcom/innioasis/y1/activity/video/SubMenuVideoDialog$Callback;
    if-eqz v0, :L2
    instance-of v0, p2, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    if-eqz v0, :L2
  .line 361
    check-cast p1, Lcom/innioasis/y1/activity/video/SubMenuVideoDialog$Callback;
    check-cast p2, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    invoke-interface { p1, p3, p2 }, Lcom/innioasis/y1/activity/video/SubMenuVideoDialog$Callback;->select(ILcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;)Z
    move-result p1
    goto :L3
  :L2
  .line 363
    const/4 p1, 1
  :L3
    if-eqz p1, :L4
    invoke-virtual { p0 }, Landroid/app/Dialog;->isShowing()Z
    move-result p1
    if-eqz p1, :L4
    invoke-virtual { p0 }, Landroid/app/Dialog;->dismiss()V
  :L4
  .line 365
    goto :L6
  :L5
  .line 364
    move-exception p0
  :L6
  .line 366
    return-void
.end method

.method private static entry(ZLjava/lang/String;)Ljava/lang/Object;
  .registers 3
  .line 313
    const/4 v0, 0
    if-eqz p0, :L0
    new-instance p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;-><init>(Ljava/lang/String;Lcom/innioasis/y1/database/video/VideoPlaylist;)V
    goto :L1
  :L0
  .line 314
    new-instance p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;-><init>(Ljava/lang/String;Lcom/innioasis/y1/database/Playlist;)V
  :L1
  .line 313
    return-object p0
.end method

.method private static filter(Landroid/app/Dialog;)V
  .catchall { :L0 .. :L16 } :L18
  .registers 12
  .line 188
    if-eqz p0, :L20
  :L0
    sget-object v0, Lcom/innioasis/ipp/Menus;->CHOOSERS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    goto/16 :L20
  :L1
  .line 189
    const v0, 2131362413
    invoke-virtual { p0, v0 }, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 190
    const/4 v1, 0
    if-nez v0, :L2
    move-object v0, v1
    goto :L3
  :L2
    invoke-static { v0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  :L3
  .line 191
    if-nez v0, :L4
    return-void
  :L4
  .line 192
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v2
  .line 193
    if-eqz v2, :L17
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L5
    goto/16 :L17
  :L5
  .line 195
    sget-object v3, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v3, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Menus$Snap;
  .line 196
    if-eqz v4, :L6
    iget-object v5, v4, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
    invoke-static { v2, v5 }, Lcom/innioasis/ipp/Menus;->same(Ljava/util/List;Ljava/util/List;)Z
    move-result v5
    if-eqz v5, :L6
  .line 197
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 198
    iget-object v3, v4, Lcom/innioasis/ipp/Menus$Snap;->full:Ljava/util/ArrayList;
    invoke-interface { v2, v3 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    goto :L7
  :L6
  .line 200
    new-instance v4, Lcom/innioasis/ipp/Menus$Snap;
    invoke-direct { v4, v1 }, Lcom/innioasis/ipp/Menus$Snap;-><init>(Lcom/innioasis/ipp/Menus$1;)V
  .line 201
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v5, v4, Lcom/innioasis/ipp/Menus$Snap;->full:Ljava/util/ArrayList;
  .line 202
    invoke-virtual { v3, p0, v4 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 204
    iput-object v1, v4, Lcom/innioasis/ipp/Menus$Snap;->map:[I
  .line 206
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->hostOf(Landroid/app/Dialog;)Landroid/app/Activity;
    move-result-object p0
  .line 207
    const/4 v1, 0
    if-eqz p0, :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->ticks(Landroid/app/Activity;)I
    move-result v3
    const/4 v5, 1
    if-le v3, v5, :L8
    goto :L9
  :L8
    const/4 v5, 0
  :L9
  .line 208
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->selfPlaylist(Landroid/app/Activity;)Ljava/util/UUID;
    move-result-object v3
  .line 209
    if-nez v5, :L10
    if-eqz v3, :L15
  :L10
  .line 210
    new-instance v6, Ljava/util/ArrayList;
    invoke-direct { v6 }, Ljava/util/ArrayList;-><init>()V
  .line 211
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct { v7 }, Ljava/util/ArrayList;-><init>()V
  .line 212
    const/4 v8, 0
  :L11
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v9
    if-ge v8, v9, :L13
  .line 213
    invoke-interface { v2, v8 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
  .line 214
    invoke-static { p0, v9, v5, v3 }, Lcom/innioasis/ipp/Menus;->keeps(Landroid/app/Activity;Ljava/lang/Object;ZLjava/util/UUID;)Z
    move-result v10
    if-eqz v10, :L12
  .line 215
    invoke-virtual { v6, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 216
    invoke-static { v8 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-virtual { v7, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L12
  .line 212
    add-int/lit8 v8, v8, 1
    goto :L11
  :L13
  .line 220
    invoke-virtual { v6 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v3
    if-nez v3, :L15
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v3
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v3, v5, :L15
  .line 221
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 222
    invoke-interface { v2, v6 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 223
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result v3
    new-array v3, v3, [I
    iput-object v3, v4, Lcom/innioasis/ipp/Menus$Snap;->map:[I
  .line 224
    nop
  :L14
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v1, v3, :L15
  .line 225
    iget-object v3, v4, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    invoke-virtual { v7, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/Integer;
    invoke-virtual { v5 }, Ljava/lang/Integer;->intValue()I
    move-result v5
    aput v5, v3, v1
  .line 224
    add-int/lit8 v1, v1, 1
    goto :L14
  :L15
  .line 229
    invoke-static { p0, v2, v4 }, Lcom/innioasis/ipp/Menus;->collapse(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/ipp/Menus$Snap;)V
  .line 230
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object p0, v4, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
  .line 231
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  :L16
  .line 233
    goto :L19
  :L17
  .line 193
    return-void
  :L18
  .line 232
    move-exception p0
  :L19
  .line 234
    return-void
  :L20
  .line 188
    return-void
.end method

.method private static firstText(Landroid/view/View;)Landroid/widget/TextView;
  .registers 4
  .line 176
    instance-of v0, p0, Landroid/widget/TextView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/TextView;
    return-object p0
  :L0
  .line 177
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 178
    check-cast p0, Landroid/view/ViewGroup;
  .line 179
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L4
  .line 180
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Menus;->firstText(Landroid/view/View;)Landroid/widget/TextView;
    move-result-object v2
  .line 181
    if-eqz v2, :L3
    return-object v2
  :L3
  .line 179
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 183
    return-object v1
.end method

.method private static fit(Landroid/app/Dialog;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  :L0
  .line 114
    invoke-virtual { p0 }, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object v0
  .line 115
    const v1, 2131362413
    invoke-virtual { p0, v1 }, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 116
    if-eqz v0, :L4
    instance-of v2, v1, Landroid/view/ViewGroup;
    if-eqz v2, :L4
    invoke-static { v1 }, Lcom/innioasis/ipp/Lv;->is(Landroid/view/View;)Z
    move-result v2
    if-nez v2, :L1
    goto :L4
  :L1
  .line 117
    invoke-virtual { p0 }, Landroid/app/Dialog;->getContext()Landroid/content/Context;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const v2, 2131165784
    invoke-virtual { p0, v2 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result p0
    float-to-int p0, p0
  .line 118
    invoke-virtual { v0 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v2
  .line 119
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->width:I
    if-eq v3, p0, :L2
  .line 120
    iput p0, v2, Landroid/view/WindowManager$LayoutParams;->width:I
  .line 121
    invoke-virtual { v0, v2 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  :L2
  .line 123
    invoke-virtual { v1 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v2
    new-instance v3, Lcom/innioasis/ipp/Menus$Fit;
    check-cast v1, Landroid/view/ViewGroup;
    invoke-direct { v3, v0, v1, p0 }, Lcom/innioasis/ipp/Menus$Fit;-><init>(Landroid/view/Window;Landroid/view/ViewGroup;I)V
    invoke-virtual { v2, v3 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L3
  .line 125
    goto :L6
  :L4
  .line 116
    return-void
  :L5
  .line 124
    move-exception p0
  :L6
  .line 126
    return-void
.end method

.method public static group(Lcom/innioasis/music/util/SubMenuDialog;ILcom/innioasis/music/util/SubMenuDialog$Callback;)Z
  .registers 3
  .line 319
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Menus;->ours(Landroid/app/Dialog;ILjava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method public static groupVideo(Lcom/innioasis/y1/activity/video/SubMenuVideoDialog;ILcom/innioasis/y1/activity/video/SubMenuVideoDialog$Callback;)Z
  .registers 3
  .line 324
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Menus;->ours(Landroid/app/Dialog;ILjava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method private static hostOf(Landroid/app/Dialog;)Landroid/app/Activity;
  .catchall { :L0 .. :L4 } :L6
  .catchall { :L7 .. :L8 } :L9
  .registers 2
  :L0
  .line 605
    invoke-virtual { p0 }, Landroid/app/Dialog;->getOwnerActivity()Landroid/app/Activity;
    move-result-object v0
  .line 606
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 607
    invoke-virtual { p0 }, Landroid/app/Dialog;->getContext()Landroid/content/Context;
    move-result-object p0
  :L2
  .line 608
    instance-of v0, p0, Landroid/content/ContextWrapper;
    if-eqz v0, :L5
  .line 609
    instance-of v0, p0, Landroid/app/Activity;
    if-eqz v0, :L3
    check-cast p0, Landroid/app/Activity;
    return-object p0
  :L3
  .line 610
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
  :L4
    goto :L2
  :L5
  .line 613
    goto :L7
  :L6
  .line 612
    move-exception p0
  :L7
  .line 615
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object p0
  :L8
    return-object p0
  :L9
  .line 616
    move-exception p0
  .line 617
    const/4 p0, 0
    return-object p0
.end method

.method public static index(Lcom/innioasis/music/util/SubMenuDialog;I)I
  .registers 2
  .line 238
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Menus;->mapped(Landroid/app/Dialog;I)I
    move-result p0
    return p0
.end method

.method private static isFavEntry(Ljava/lang/Object;)Z
  .registers 2
  .line 399
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
  .line 459
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
  .line 460
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    if-eqz v0, :L5
  .line 461
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
  .line 463
    return v2
.end method

.method private static keeps(Landroid/app/Activity;Ljava/lang/Object;ZLjava/util/UUID;)Z
  .registers 7
  .line 432
    invoke-static { p1 }, Lcom/innioasis/ipp/Menus;->isPlaylistEntry(Ljava/lang/Object;)Z
    move-result v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L2
  .line 433
    invoke-static { p1 }, Lcom/innioasis/ipp/Menus;->playlistId(Ljava/lang/Object;)Ljava/util/UUID;
    move-result-object p0
  .line 434
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
  .line 436
    invoke-static { p1 }, Lcom/innioasis/ipp/Menus;->label(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p1
  .line 437
    if-eqz p3, :L3
    if-eqz p1, :L3
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result p3
    if-nez p3, :L3
  .line 438
    const p3, 2131821136
    invoke-virtual { p0, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { p1, p3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-eqz p3, :L3
  .line 439
    return v1
  :L3
  .line 441
    if-nez p2, :L4
    return v2
  :L4
  .line 442
    if-nez p1, :L5
    return v2
  :L5
  .line 443
    const/4 p2, 0
  :L6
    sget-object p3, Lcom/innioasis/ipp/Menus;->MULTI:[I
    array-length v0, p3
    if-ge p2, v0, :L8
  .line 444
    aget p3, p3, p2
    invoke-virtual { p0, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { p1, p3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-eqz p3, :L7
    return v2
  :L7
  .line 443
    add-int/lit8 p2, p2, 1
    goto :L6
  :L8
  .line 446
    return v1
.end method

.method private static label(Ljava/lang/Object;)Ljava/lang/String;
  .registers 2
  .line 452
    instance-of v0, p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    if-eqz v0, :L0
    check-cast p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 453
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    if-eqz v0, :L1
    check-cast p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 454
    const/4 p0, 0
    return-object p0
.end method

.method private static mapped(Landroid/app/Dialog;I)I
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  :L0
  .line 248
    sget-object v0, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Menus$Snap;
  .line 249
    if-eqz p0, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    if-eqz v0, :L3
    if-ltz p1, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    array-length v0, v0
    if-lt p1, v0, :L1
    goto :L3
  :L1
  .line 250
    iget-object p0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    aget p0, p0, p1
  :L2
    return p0
  :L3
  .line 249
    return p1
  :L4
  .line 251
    move-exception p0
  .line 252
    return p1
.end method

.method public static onShow(Lcom/innioasis/music/util/SubMenuDialog;)V
  .registers 2
  .line 92
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->hold(Z)V
  .line 93
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->filter(Landroid/app/Dialog;)V
  .line 94
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->fit(Landroid/app/Dialog;)V
  .line 95
    return-void
.end method

.method public static onShowVideo(Lcom/innioasis/y1/activity/video/SubMenuVideoDialog;)V
  .registers 1
  .line 102
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->filter(Landroid/app/Dialog;)V
  .line 103
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->fit(Landroid/app/Dialog;)V
  .line 104
    return-void
.end method

.method private static ours(Landroid/app/Dialog;ILjava/lang/Object;)Z
  .catchall { :L0 .. :L8 } :L11
  .registers 15
  .line 329
    const/4 v0, 1
  :L0
    sget-object v1, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Menus$Snap;
  .line 330
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
  .line 331
    iget-object v3, v1, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
    invoke-virtual { v3, p1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 332
    if-eqz p1, :L9
    iget-object v3, v1, Lcom/innioasis/ipp/Menus$Snap;->group:Ljava/lang/Object;
    if-eq p1, v3, :L2
    goto :L9
  :L2
  .line 333
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->hostOf(Landroid/app/Dialog;)Landroid/app/Activity;
    move-result-object p1
  .line 334
    if-nez p1, :L3
    return v0
  :L3
  .line 335
    iget-object v3, v1, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    new-array v4, v3, [Ljava/lang/Integer;
  .line 336
    const/4 v5, 0
  :L4
    if-ge v5, v3, :L5
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
    aput-object v6, v4, v5
    add-int/lit8 v5, v5, 1
    goto :L4
  :L5
  .line 337
    new-instance v5, Lcom/innioasis/ipp/Menus$ByName;
    iget-object v6, v1, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
    invoke-direct { v5, v6 }, Lcom/innioasis/ipp/Menus$ByName;-><init>(Ljava/util/List;)V
    invoke-static { v4, v5 }, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V
  .line 338
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 339
    new-array v11, v3, [I
  .line 340
    nop
  :L6
    if-ge v2, v3, :L7
  .line 341
    aget-object v6, v4, v2
    invoke-virtual { v6 }, Ljava/lang/Integer;->intValue()I
    move-result v6
    aput v6, v11, v2
  .line 342
    iget-object v6, v1, Lcom/innioasis/ipp/Menus$Snap;->entries:Ljava/util/ArrayList;
    aget v7, v11, v2
    invoke-virtual { v6, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Menus;->playlistName(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v6
    invoke-interface { v5, v6 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 340
    add-int/lit8 v2, v2, 1
    goto :L6
  :L7
  .line 345
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
  .line 347
    sget-object p0, Lcom/innioasis/ipp/Menus;->CHOOSERS:Ljava/util/WeakHashMap;
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v2, p1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 348
    invoke-virtual { v2 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L8
  .line 350
    goto :L12
  :L9
  .line 332
    return v2
  :L10
  .line 330
    return v2
  :L11
  .line 349
    move-exception p0
  :L12
  .line 351
    return v0
.end method

.method public static photoIndex(Ljava/util/List;I)I
  .registers 3
  .line 595
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Menus;->PHOTO_MAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [I
  :L1
  .line 596
    if-eqz p0, :L3
    if-ltz p1, :L3
    array-length v0, p0
    if-lt p1, v0, :L2
    goto :L3
  :L2
    aget p1, p0, p1
  :L3
    return p1
.end method

.method public static photos(Ljava/util/List;Ljava/util/List;I)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  .line 560
    if-eqz p0, :L8
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L8
  :L1
  .line 561
    if-eqz p1, :L6
    if-ltz p2, :L6
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p2, v0, :L2
    goto :L6
  :L2
  .line 562
    invoke-interface { p1, p2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 563
    instance-of p2, p1, Lcom/innioasis/y1/activity/PhotosActivity$Item;
    if-nez p2, :L3
    return-object p0
  :L3
  .line 564
    check-cast p1, Lcom/innioasis/y1/activity/PhotosActivity$Item;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/PhotosActivity$Item;->isDirectory()Z
    move-result p1
    if-nez p1, :L4
    return-object p0
  :L4
  .line 565
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
  .line 561
    return-object p0
  :L7
  .line 566
    move-exception p1
  .line 567
    return-object p0
  :L8
  .line 560
    return-object p0
.end method

.method public static photosFull(Ljava/util/List;Z)Ljava/util/List;
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 583
    if-eqz p1, :L6
    if-eqz p0, :L6
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p1
    const/4 v0, 5
    if-eq p1, v0, :L1
    goto :L6
  :L1
  .line 584
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1 }, Ljava/util/ArrayList;-><init>()V
  .line 585
    const/4 v0, 0
  :L2
    sget-object v1, Lcom/innioasis/ipp/Menus;->PHOTO_FULL:[I
    array-length v2, v1
    if-ge v0, v2, :L3
    aget v1, v1, v0
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v0, v0, 1
    goto :L2
  :L3
  .line 586
    sget-object v0, Lcom/innioasis/ipp/Menus;->PHOTO_MAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p1, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 587
    return-object p1
  :L5
  .line 588
    move-exception p1
  .line 589
    return-object p0
  :L6
  .line 583
    return-object p0
.end method

.method private static playlistId(Ljava/lang/Object;)Ljava/util/UUID;
  .registers 3
  .line 468
    instance-of v0, p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 469
    check-cast p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
  .line 470
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
  .line 370
    instance-of v0, p0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    if-eqz v0, :L1
  .line 371
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object v0
  .line 372
    if-eqz v0, :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 374
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    if-eqz v0, :L3
  .line 375
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/video/SubmenuVideoAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/video/VideoPlaylist;
    move-result-object v0
  .line 376
    if-eqz v0, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/video/VideoPlaylist;->getPlaylistName()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/video/VideoPlaylist;->getPlaylistName()Ljava/lang/String;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 379
    goto :L5
  :L4
  .line 378
    move-exception v0
  :L5
  .line 380
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->label(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
  .line 381
    if-nez p0, :L6
    const-string p0, ""
  :L6
    return-object p0
.end method

.method private static same(Ljava/util/List;Ljava/util/List;)Z
  .registers 6
  .line 486
    const/4 v0, 0
    if-eqz p1, :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v2
    if-eq v1, v2, :L0
    goto :L4
  :L0
  .line 487
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 488
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    if-eq v2, v3, :L2
    return v0
  :L2
  .line 487
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 490
    const/4 p0, 1
    return p0
  :L4
  .line 486
    return v0
.end method

.method private static selfPlaylist(Landroid/app/Activity;)Ljava/util/UUID;
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 476
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/PlayListActivity;
    if-nez v1, :L1
    return-object v0
  :L1
  .line 477
    check-cast p0, Lcom/innioasis/music/PlayListActivity;
    invoke-virtual { p0 }, Lcom/innioasis/music/PlayListActivity;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
  .line 478
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v0
  :L3
    return-object v0
  :L4
  .line 479
    move-exception p0
  .line 480
    return-object v0
.end method

.method private static ticks(Landroid/app/Activity;)I
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 496
    const/4 v0, 0
    if-eqz p0, :L4
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    if-nez v1, :L1
    goto :L4
  :L1
  .line 497
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->ticksIn(Landroid/view/View;)I
    move-result p0
  :L2
    return p0
  :L3
  .line 498
    move-exception p0
  .line 499
    return v0
  :L4
  .line 496
    return v0
.end method

.method private static ticksIn(Landroid/view/View;)I
  .registers 4
  .line 504
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 505
    instance-of v1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L12
  .line 506
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 507
    instance-of v1, p0, Lcom/innioasis/ipp/SongRows;
    if-eqz v1, :L1
    check-cast p0, Lcom/innioasis/ipp/SongRows;
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->model()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  :L1
  .line 508
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v1, :L4
  .line 509
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  .line 510
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L3
    return v0
  :L4
  .line 512
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L7
  .line 513
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
  .line 514
    if-nez p0, :L5
    goto :L6
  :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L6
    return v0
  :L7
  .line 516
    instance-of v1, p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v1, :L10
  .line 517
    check-cast p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
  .line 518
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
  .line 519
    if-nez p0, :L8
    goto :L9
  :L8
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L9
    return v0
  :L10
  .line 522
    instance-of v1, p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-eqz v1, :L11
  .line 523
    check-cast p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->browseTicks(Ljava/util/List;)I
    move-result p0
    return p0
  :L11
  .line 525
    return v0
  :L12
  .line 527
    instance-of v1, p0, Landroid/view/ViewGroup;
    if-eqz v1, :L16
  .line 528
    check-cast p0, Landroid/view/ViewGroup;
  .line 529
    nop
  .line 530
    const/4 v1, 0
  :L13
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L15
  .line 531
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Menus;->ticksIn(Landroid/view/View;)I
    move-result v2
  .line 532
    if-le v2, v1, :L14
    move v1, v2
  :L14
  .line 530
    add-int/lit8 v0, v0, 1
    goto :L13
  :L15
  .line 534
    return v1
  :L16
  .line 536
    return v0
.end method

.method public static videoIndex(Lcom/innioasis/y1/activity/video/SubMenuVideoDialog;I)I
  .registers 2
  .line 243
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Menus;->mapped(Landroid/app/Dialog;I)I
    move-result p0
    return p0
.end method

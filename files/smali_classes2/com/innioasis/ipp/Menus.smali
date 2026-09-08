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
  .line 65
    const/16 v0, 10
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Menus;->MULTI:[I
  .line 79
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    return-void
  :L0
  .array-data 4
      2131820584
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
  .line 56
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 57
    return-void
.end method

.method private static hostOf(Lcom/innioasis/music/util/SubMenuDialog;)Landroid/app/Activity;
  .catchall { :L0 .. :L4 } :L6
  .catchall { :L7 .. :L8 } :L9
  .registers 2
  :L0
  .line 305
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->getOwnerActivity()Landroid/app/Activity;
    move-result-object v0
  .line 306
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 307
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->getContext()Landroid/content/Context;
    move-result-object p0
  :L2
  .line 308
    instance-of v0, p0, Landroid/content/ContextWrapper;
    if-eqz v0, :L5
  .line 309
    instance-of v0, p0, Landroid/app/Activity;
    if-eqz v0, :L3
    check-cast p0, Landroid/app/Activity;
    return-object p0
  :L3
  .line 310
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
  :L4
    goto :L2
  :L5
  .line 314
    goto :L7
  :L6
  .line 312
    move-exception p0
  :L7
  .line 316
    invoke-static { }, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;
    move-result-object p0
  :L8
    return-object p0
  :L9
  .line 317
    move-exception p0
  .line 318
    const/4 p0, 0
    return-object p0
.end method

.method public static index(Lcom/innioasis/music/util/SubMenuDialog;I)I
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  :L0
  .line 163
    sget-object v0, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/ipp/Menus$Snap;
  .line 164
    if-eqz p0, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    if-eqz v0, :L3
    if-ltz p1, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    array-length v0, v0
    if-lt p1, v0, :L1
    goto :L3
  :L1
  .line 165
    iget-object p0, p0, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    aget p0, p0, p1
  :L2
    return p0
  :L3
  .line 164
    return p1
  :L4
  .line 166
    move-exception p0
  .line 167
    return p1
.end method

.method private static keeps(Landroid/app/Activity;Ljava/lang/Object;ZLjava/util/UUID;)Z
  .registers 7
  .line 179
    instance-of v0, p1, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
    const/4 v1, 1
    if-nez v0, :L0
    return v1
  :L0
  .line 180
    check-cast p1, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;
  .line 181
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object v0
  .line 182
    const/4 v2, 0
    if-eqz v0, :L3
  .line 183
    if-eqz p3, :L2
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p0
    invoke-virtual { p3, p0 }, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    return v1
  :L3
  .line 185
    if-nez p2, :L4
    return v1
  :L4
  .line 186
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  .line 187
    if-nez p1, :L5
    return v1
  :L5
  .line 188
    const/4 p2, 0
  :L6
    sget-object p3, Lcom/innioasis/ipp/Menus;->MULTI:[I
    array-length v0, p3
    if-ge p2, v0, :L8
  .line 189
    aget p3, p3, p2
    invoke-virtual { p0, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p3
    invoke-virtual { p1, p3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p3
    if-eqz p3, :L7
    return v1
  :L7
  .line 188
    add-int/lit8 p2, p2, 1
    goto :L6
  :L8
  .line 191
    return v2
.end method

.method public static onShow(Lcom/innioasis/music/util/SubMenuDialog;)V
  .catchall { :L1 .. :L15 } :L17
  .registers 12
  .line 102
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->hold(Z)V
  .line 104
    if-nez p0, :L0
    return-void
  :L0
  .line 105
    const v1, 2131362413
  :L1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/util/SubMenuDialog;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 106
    instance-of v2, v1, Landroid/widget/ListView;
    if-nez v2, :L2
    return-void
  :L2
  .line 107
    check-cast v1, Landroid/widget/ListView;
    invoke-virtual { v1 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v1
  .line 108
    instance-of v2, v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v2, :L3
    return-void
  :L3
  .line 109
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 110
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v2
  .line 111
    if-eqz v2, :L16
    invoke-interface { v2 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L4
    goto/16 :L16
  :L4
  .line 113
    sget-object v3, Lcom/innioasis/ipp/Menus;->SNAPS:Ljava/util/WeakHashMap;
    invoke-virtual { v3, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Menus$Snap;
  .line 114
    const/4 v5, 0
    if-eqz v4, :L5
    iget-object v6, v4, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
    invoke-static { v2, v6 }, Lcom/innioasis/ipp/Menus;->same(Ljava/util/List;Ljava/util/List;)Z
    move-result v6
    if-eqz v6, :L5
  .line 115
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 116
    iget-object v3, v4, Lcom/innioasis/ipp/Menus$Snap;->full:Ljava/util/ArrayList;
    invoke-interface { v2, v3 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    goto :L6
  :L5
  .line 118
    new-instance v4, Lcom/innioasis/ipp/Menus$Snap;
    invoke-direct { v4, v5 }, Lcom/innioasis/ipp/Menus$Snap;-><init>(Lcom/innioasis/ipp/Menus$1;)V
  .line 119
    new-instance v6, Ljava/util/ArrayList;
    invoke-direct { v6, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object v6, v4, Lcom/innioasis/ipp/Menus$Snap;->full:Ljava/util/ArrayList;
  .line 120
    invoke-virtual { v3, p0, v4 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L6
  .line 122
    iput-object v5, v4, Lcom/innioasis/ipp/Menus$Snap;->map:[I
  .line 124
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->hostOf(Lcom/innioasis/music/util/SubMenuDialog;)Landroid/app/Activity;
    move-result-object p0
  .line 125
    const/4 v3, 0
    if-eqz p0, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->ticks(Landroid/app/Activity;)I
    move-result v5
    if-le v5, v0, :L7
    goto :L8
  :L7
    const/4 v0, 0
  :L8
  .line 126
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->selfPlaylist(Landroid/app/Activity;)Ljava/util/UUID;
    move-result-object v5
  .line 127
    if-nez v0, :L9
    if-eqz v5, :L14
  :L9
  .line 128
    new-instance v6, Ljava/util/ArrayList;
    invoke-direct { v6 }, Ljava/util/ArrayList;-><init>()V
  .line 129
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct { v7 }, Ljava/util/ArrayList;-><init>()V
  .line 130
    const/4 v8, 0
  :L10
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v9
    if-ge v8, v9, :L12
  .line 131
    invoke-interface { v2, v8 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
  .line 132
    invoke-static { p0, v9, v0, v5 }, Lcom/innioasis/ipp/Menus;->keeps(Landroid/app/Activity;Ljava/lang/Object;ZLjava/util/UUID;)Z
    move-result v10
    if-eqz v10, :L11
  .line 133
    invoke-virtual { v6, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 134
    invoke-static { v8 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-virtual { v7, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L11
  .line 130
    add-int/lit8 v8, v8, 1
    goto :L10
  :L12
  .line 140
    invoke-virtual { v6 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-nez p0, :L14
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result p0
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v0
    if-ge p0, v0, :L14
  .line 141
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 142
    invoke-interface { v2, v6 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 143
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [I
    iput-object p0, v4, Lcom/innioasis/ipp/Menus$Snap;->map:[I
  .line 144
    nop
  :L13
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result p0
    if-ge v3, p0, :L14
  .line 145
    iget-object p0, v4, Lcom/innioasis/ipp/Menus$Snap;->map:[I
    invoke-virtual { v7, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Integer;
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
    aput v0, p0, v3
  .line 144
    add-int/lit8 v3, v3, 1
    goto :L13
  :L14
  .line 149
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    iput-object p0, v4, Lcom/innioasis/ipp/Menus$Snap;->shown:Ljava/util/ArrayList;
  .line 150
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  :L15
  .line 153
    goto :L18
  :L16
  .line 111
    return-void
  :L17
  .line 151
    move-exception p0
  :L18
  .line 154
    return-void
.end method

.method public static photos(Ljava/util/List;Ljava/util/List;I)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  .line 292
    if-eqz p0, :L8
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L8
  :L1
  .line 293
    if-eqz p1, :L6
    if-ltz p2, :L6
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p2, v0, :L2
    goto :L6
  :L2
  .line 294
    invoke-interface { p1, p2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 295
    instance-of p2, p1, Lcom/innioasis/y1/activity/PhotosActivity$Item;
    if-nez p2, :L3
    return-object p0
  :L3
  .line 296
    check-cast p1, Lcom/innioasis/y1/activity/PhotosActivity$Item;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/PhotosActivity$Item;->isDirectory()Z
    move-result p1
    if-nez p1, :L4
    return-object p0
  :L4
  .line 297
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
  .line 293
    return-object p0
  :L7
  .line 298
    move-exception p1
  .line 299
    return-object p0
  :L8
  .line 292
    return-object p0
.end method

.method private static same(Ljava/util/List;Ljava/util/List;)Z
  .registers 6
  .line 211
    const/4 v0, 0
    if-eqz p1, :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v2
    if-eq v1, v2, :L0
    goto :L4
  :L0
  .line 212
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 213
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    if-eq v2, v3, :L2
    return v0
  :L2
  .line 212
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 215
    const/4 p0, 1
    return p0
  :L4
  .line 211
    return v0
.end method

.method private static selfPlaylist(Landroid/app/Activity;)Ljava/util/UUID;
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 201
    const/4 v0, 0
  :L0
    instance-of v1, p0, Lcom/innioasis/music/PlayListActivity;
    if-nez v1, :L1
    return-object v0
  :L1
  .line 202
    check-cast p0, Lcom/innioasis/music/PlayListActivity;
    invoke-virtual { p0 }, Lcom/innioasis/music/PlayListActivity;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p0
  .line 203
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v0
  :L3
    return-object v0
  :L4
  .line 204
    move-exception p0
  .line 205
    return-object v0
.end method

.method private static ticks(Landroid/app/Activity;)I
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 226
    const/4 v0, 0
    if-eqz p0, :L4
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    if-nez v1, :L1
    goto :L4
  :L1
  .line 227
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Menus;->ticksIn(Landroid/view/View;)I
    move-result p0
  :L2
    return p0
  :L3
  .line 228
    move-exception p0
  .line 229
    return v0
  :L4
  .line 226
    return v0
.end method

.method private static ticksIn(Landroid/view/View;)I
  .registers 4
  .line 234
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 235
    instance-of v1, p0, Landroid/widget/AbsListView;
    if-eqz v1, :L4
  .line 236
    check-cast p0, Landroid/widget/AbsListView;
    invoke-virtual { p0 }, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;
    move-result-object p0
  .line 237
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v1, :L3
  .line 238
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  .line 239
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L2
    return v0
  :L3
  .line 241
    return v0
  :L4
  .line 243
    instance-of v1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L11
  .line 244
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 245
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L7
  .line 246
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
  .line 247
    if-nez p0, :L5
    goto :L6
  :L5
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L6
    return v0
  :L7
  .line 249
    instance-of v1, p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
    if-eqz v1, :L10
  .line 250
    check-cast p0, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;
  .line 251
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/adapter/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p0
  .line 252
    if-nez p0, :L8
    goto :L9
  :L8
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  :L9
    return v0
  :L10
  .line 254
    return v0
  :L11
  .line 256
    instance-of v1, p0, Landroid/view/ViewGroup;
    if-eqz v1, :L15
  .line 257
    check-cast p0, Landroid/view/ViewGroup;
  .line 258
    nop
  .line 259
    const/4 v1, 0
  :L12
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L14
  .line 260
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Menus;->ticksIn(Landroid/view/View;)I
    move-result v2
  .line 261
    if-le v2, v1, :L13
    move v1, v2
  :L13
  .line 259
    add-int/lit8 v0, v0, 1
    goto :L12
  :L14
  .line 263
    return v1
  :L15
  .line 265
    return v0
.end method

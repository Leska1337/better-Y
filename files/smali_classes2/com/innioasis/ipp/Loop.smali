.class public final Lcom/innioasis/ipp/Loop;
.super Ljava/lang/Object;
.source "Loop.java"

.field public final static KEY:Ljava/lang/String; = "loop_scroll"

.field private static kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;

.field private static wrapped:Z

.method private constructor <init>()V
  .registers 1
  .line 38
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static count(Lcom/innioasis/y1/base/BaseActivity;)I
  .registers 3
  .line 95
    instance-of v0, p0, Lcom/innioasis/y1/activity/BluetoothActivity;
    if-eqz v0, :L0
  .line 97
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;
  .line 98
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->recyclerMyDevice:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Loop;->items(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v0
    add-int/lit8 v0, v0, 1
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;->recyclerOtherDevice:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->items(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    add-int/2addr v0, p0
    return v0
  :L0
  .line 100
    instance-of v0, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const/4 v1, 0
    if-nez v0, :L2
    instance-of v0, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-nez v0, :L2
    instance-of v0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-nez v0, :L2
    instance-of v0, p0, Lcom/innioasis/y1/activity/PhotosActivity;
    if-nez v0, :L2
    instance-of v0, p0, Lcom/innioasis/y1/activity/theme/ThemeListActivity;
    if-nez v0, :L2
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperActivity;
    if-nez v0, :L2
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-nez v0, :L2
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-nez v0, :L2
    instance-of v0, p0, Lcom/innioasis/fm/MenuActivity;
    if-eqz v0, :L1
    goto :L2
  :L1
  .line 110
    return v1
  :L2
  .line 105
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    invoke-interface { p0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object p0
  .line 107
    if-eqz p0, :L4
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v0
    if-nez v0, :L3
    goto :L4
  :L3
  .line 108
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->items(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    return p0
  :L4
  .line 107
    return v1
.end method

.method private static firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
  .registers 4
  .line 120
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    return-object p0
  :L0
  .line 121
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 122
    check-cast p0, Landroid/view/ViewGroup;
  .line 123
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L4
  .line 124
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Loop;->firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v2
  .line 125
    if-eqz v2, :L3
    return-object v2
  :L3
  .line 123
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 127
    return-object v1
.end method

.method static fromShuffle(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
  .registers 6
  .line 138
    const/4 v0, 0
    const/4 v1, 1
    if-eq p2, v1, :L4
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p2
    if-gez p2, :L4
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result p2
    if-nez p2, :L0
    goto :L4
  :L0
  .line 139
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->shuffleRow(Landroid/widget/ListView;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object p2
  .line 140
    if-eqz p2, :L3
    invoke-virtual { p2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v2
    if-nez v2, :L1
    goto :L3
  :L1
  .line 141
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
  .line 142
    if-gtz v2, :L2
    return v0
  :L2
  .line 143
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
  .line 144
    invoke-virtual { p2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onClockwise()V
  .line 145
    sub-int/2addr v2, v1
    invoke-static { p0, p1, v2 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 146
    return v1
  :L3
  .line 140
    return v0
  :L4
  .line 138
    return v0
.end method

.method private static items(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 2
  .line 114
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 115
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p0
    return p0
  :L1
  .line 114
    const/4 p0, 0
    return p0
.end method

.method public static keep(Lcom/innioasis/y1/view/ShufflePlaylistItemView;)Z
  .registers 2
  .line 191
    if-eqz p0, :L1
    sget-object v0, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eq p0, v0, :L0
    goto :L1
  :L0
  .line 192
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 193
    const/4 p0, 1
    return p0
  :L1
  .line 191
    const/4 p0, 0
    return p0
.end method

.method public static lastOfStrip(IZ)I
  .registers 2
  .line 71
    add-int/lit8 p0, p0, -1
  .line 72
    if-eqz p1, :L0
    const/4 p1, 4
    if-ne p0, p1, :L0
    const/4 p0, 3
  :L0
  .line 73
    if-gez p0, :L1
    const/4 p0, 0
  :L1
    return p0
.end method

.method static list(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;II)Z
  .registers 9
  .line 151
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 152
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 153
    if-gtz v0, :L1
    return v1
  :L1
  .line 154
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->shuffleRow(Landroid/widget/ListView;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object v2
  .line 155
    const/4 v3, 1
    if-eqz v2, :L2
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getVisibility()I
    move-result v4
    if-nez v4, :L2
  .line 156
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v4
    invoke-interface { v4 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-eqz v4, :L2
    const/4 v4, 1
    goto :L3
  :L2
    const/4 v4, 0
  :L3
  .line 157
    if-ne p2, v3, :L6
  .line 158
    sub-int/2addr v0, v3
    if-eq p3, v0, :L4
    return v1
  :L4
  .line 159
    if-eqz v4, :L5
  .line 162
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
  .line 163
    invoke-virtual { p1, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 164
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->recordOldPosition()V
  .line 165
    invoke-virtual { v2, v1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onAntiClockwise(Z)V
  .line 166
    sput-object v2, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 167
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 168
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->rest(Landroid/widget/ListView;)V
  .line 169
    return v3
  :L5
  .line 171
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 172
    return v3
  :L6
  .line 174
    if-eqz p3, :L7
    return v1
  :L7
  .line 175
    if-eqz v4, :L8
    return v1
  :L8
  .line 176
    if-ne v0, v3, :L9
    return v1
  :L9
  .line 177
    sub-int/2addr v0, v3
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 178
    return v3
.end method

.method public static mark(Lcom/innioasis/y1/base/BaseActivity;I)V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 83
    if-eqz p0, :L7
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    if-nez v0, :L1
    goto :L7
  :L1
  .line 84
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->count(Lcom/innioasis/y1/base/BaseActivity;)I
    move-result v0
  .line 85
    const/4 v1, 1
    if-gt v0, v1, :L2
    return-void
  :L2
  .line 86
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v1
  .line 87
    if-lez p1, :L3
    add-int/lit8 v2, v0, -1
    if-lt v1, v2, :L3
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result v2
    if-eqz v2, :L3
    const/4 p1, -1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
    goto :L4
  :L3
  .line 88
    if-gez p1, :L4
    if-gtz v1, :L4
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p1
    if-eqz p1, :L4
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
  :L4
  .line 90
    goto :L6
  :L5
  .line 89
    move-exception p0
  :L6
  .line 91
    return-void
  :L7
  .line 83
    return-void
.end method

.method public static on()Z
  .registers 2
  .line 41
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 42
    const-string v1, "loop_scroll"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static shuffleRow(Landroid/widget/ListView;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .registers 3
  .line 197
    invoke-virtual { p0 }, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 198
    instance-of v0, p0, Landroid/view/View;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 199
    check-cast p0, Landroid/view/View;
    const v0, 2131362396
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 200
    instance-of v0, p0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eqz v0, :L1
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  :L1
    return-object v1
.end method

.method public static step(III)I
  .registers 4
  .line 62
    if-gtz p2, :L0
    return p0
  :L0
  .line 63
    const/4 v0, 1
    if-lez p1, :L1
    const/4 p1, 1
    goto :L2
  :L1
    const/4 p1, -1
  :L2
    add-int/2addr p0, p1
  .line 64
    const/4 p1, 0
    if-lt p0, p2, :L5
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p0
    if-eqz p0, :L3
    goto :L4
  :L3
    add-int/lit8 p1, p2, -1
  :L4
    return p1
  :L5
  .line 65
    if-gez p0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p0
    if-eqz p0, :L6
    add-int/lit8 p1, p2, -1
  :L6
    return p1
  :L7
  .line 66
    return p0
.end method

.method public static takeWrap()Z
  .registers 2
  .line 56
    sget-boolean v0, Lcom/innioasis/ipp/Loop;->wrapped:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 57
    sput-boolean v1, Lcom/innioasis/ipp/Loop;->wrapped:Z
  .line 58
    const/4 v0, 1
    return v0
.end method

.method private static toRow(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .registers 3
  .line 182
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
  .line 183
    invoke-virtual { p1, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 184
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 185
    if-nez p2, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->rest(Landroid/widget/ListView;)V
    goto :L1
  :L0
  .line 186
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  :L1
  .line 187
    return-void
.end method

.method public static wrap()Z
  .registers 1
  .line 47
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    if-nez v0, :L0
    const/4 v0, 0
    return v0
  :L0
  .line 48
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Loop;->wrapped:Z
  .line 49
    return v0
.end method

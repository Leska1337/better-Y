.class public final Lcom/innioasis/ipp/Loop;
.super Ljava/lang/Object;
.source "Loop.java"

.field private final static JUST_MS:J = 150L

.field public final static KEY:Ljava/lang/String; = "loop_scroll"

.field private static kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;

.field private static wrapped:Z

.field private static wrappedAt:J

.method private constructor <init>()V
  .registers 1
  .line 38
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static count(Lcom/innioasis/y1/base/BaseActivity;)I
  .registers 3
  .line 108
    instance-of v0, p0, Lcom/innioasis/y1/activity/BluetoothActivity;
    if-eqz v0, :L0
  .line 110
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;
  .line 111
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
  .line 113
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
  .line 123
    return v1
  :L2
  .line 118
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    invoke-interface { p0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object p0
  .line 120
    if-eqz p0, :L4
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v0
    if-nez v0, :L3
    goto :L4
  :L3
  .line 121
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->items(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    return p0
  :L4
  .line 120
    return v1
.end method

.method private static firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
  .registers 4
  .line 133
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    return-object p0
  :L0
  .line 134
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 135
    check-cast p0, Landroid/view/ViewGroup;
  .line 136
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L4
  .line 137
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Loop;->firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v2
  .line 138
    if-eqz v2, :L3
    return-object v2
  :L3
  .line 136
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 140
    return-object v1
.end method

.method static fromShuffle(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
  .registers 6
  .line 151
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
  .line 152
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->shuffleRow(Landroid/widget/ListView;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object p2
  .line 153
    if-eqz p2, :L3
    invoke-virtual { p2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v2
    if-nez v2, :L1
    goto :L3
  :L1
  .line 154
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
  .line 155
    if-gtz v2, :L2
    return v0
  :L2
  .line 156
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
  .line 157
    invoke-virtual { p2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onClockwise()V
  .line 158
    sub-int/2addr v2, v1
    invoke-static { p0, p1, v2 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 159
    return v1
  :L3
  .line 153
    return v0
  :L4
  .line 151
    return v0
.end method

.method private static items(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 2
  .line 127
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 128
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p0
    return p0
  :L1
  .line 127
    const/4 p0, 0
    return p0
.end method

.method static justWrapped()Z
  .registers 5
  .line 58
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sget-wide v2, Lcom/innioasis/ipp/Loop;->wrappedAt:J
    sub-long/2addr v0, v2
    const-wide/16 v2, 150
    cmp-long v4, v0, v2
    if-gez v4, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 59
    const-wide/16 v1, 0
    sput-wide v1, Lcom/innioasis/ipp/Loop;->wrappedAt:J
  .line 60
    return v0
.end method

.method public static keep(Lcom/innioasis/y1/view/ShufflePlaylistItemView;)Z
  .registers 2
  .line 204
    if-eqz p0, :L1
    sget-object v0, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eq p0, v0, :L0
    goto :L1
  :L0
  .line 205
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 206
    const/4 p0, 1
    return p0
  :L1
  .line 204
    const/4 p0, 0
    return p0
.end method

.method public static lastOfStrip(IZ)I
  .registers 2
  .line 82
    add-int/lit8 p0, p0, -1
  .line 83
    if-eqz p1, :L0
    const/4 p1, 4
    if-ne p0, p1, :L0
    const/4 p0, 3
  :L0
  .line 84
    if-gez p0, :L1
    const/4 p0, 0
  :L1
    return p0
.end method

.method static list(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;II)Z
  .registers 9
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 165
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 166
    if-gtz v0, :L1
    return v1
  :L1
  .line 167
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->shuffleRow(Landroid/widget/ListView;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object v2
  .line 168
    const/4 v3, 1
    if-eqz v2, :L2
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getVisibility()I
    move-result v4
    if-nez v4, :L2
  .line 169
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
  .line 170
    if-ne p2, v3, :L6
  .line 171
    sub-int/2addr v0, v3
    if-eq p3, v0, :L4
    return v1
  :L4
  .line 172
    if-eqz v4, :L5
  .line 175
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
  .line 176
    invoke-virtual { p1, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 177
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->recordOldPosition()V
  .line 178
    invoke-virtual { v2, v1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onAntiClockwise(Z)V
  .line 179
    sput-object v2, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 180
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 181
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->rest(Landroid/widget/ListView;)V
  .line 182
    return v3
  :L5
  .line 184
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 185
    return v3
  :L6
  .line 187
    if-eqz p3, :L7
    return v1
  :L7
  .line 188
    if-eqz v4, :L8
    return v1
  :L8
  .line 189
    if-ne v0, v3, :L9
    return v1
  :L9
  .line 190
    sub-int/2addr v0, v3
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 191
    return v3
.end method

.method public static mark(Lcom/innioasis/y1/base/BaseActivity;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 94
    if-eqz p0, :L8
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    if-nez v0, :L1
    goto :L8
  :L1
  .line 95
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->count(Lcom/innioasis/y1/base/BaseActivity;)I
    move-result v0
  .line 96
    const/4 v1, 1
    if-gt v0, v1, :L2
    return-void
  :L2
  .line 97
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v1
  .line 99
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v2
    invoke-interface { v2 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Loop;->firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v2
    invoke-static { v2, p1 }, Lcom/innioasis/ipp/Bar;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v2
    if-eqz v2, :L3
    return-void
  :L3
  .line 100
    if-lez p1, :L4
    add-int/lit8 v2, v0, -1
    if-lt v1, v2, :L4
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result v2
    if-eqz v2, :L4
    const/4 p1, -1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
    goto :L5
  :L4
  .line 101
    if-gez p1, :L5
    if-gtz v1, :L5
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p1
    if-eqz p1, :L5
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
  :L5
  .line 103
    goto :L7
  :L6
  .line 102
    move-exception p0
  :L7
  .line 104
    return-void
  :L8
  .line 94
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
  .line 210
    invoke-virtual { p0 }, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 211
    instance-of v0, p0, Landroid/view/View;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 212
    check-cast p0, Landroid/view/View;
    const v0, 2131362396
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 213
    instance-of v0, p0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eqz v0, :L1
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  :L1
    return-object v1
.end method

.method public static step(III)I
  .registers 4
  .line 73
    if-gtz p2, :L0
    return p0
  :L0
  .line 74
    const/4 v0, 1
    if-lez p1, :L1
    const/4 p1, 1
    goto :L2
  :L1
    const/4 p1, -1
  :L2
    add-int/2addr p0, p1
  .line 75
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
  .line 76
    if-gez p0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p0
    if-eqz p0, :L6
    add-int/lit8 p1, p2, -1
  :L6
    return p1
  :L7
  .line 77
    return p0
.end method

.method public static takeWrap()Z
  .registers 2
  .line 67
    sget-boolean v0, Lcom/innioasis/ipp/Loop;->wrapped:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 68
    sput-boolean v1, Lcom/innioasis/ipp/Loop;->wrapped:Z
  .line 69
    const/4 v0, 1
    return v0
.end method

.method private static toRow(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .registers 3
  .line 195
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
  .line 196
    invoke-virtual { p1, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 197
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 198
    if-nez p2, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->rest(Landroid/widget/ListView;)V
    goto :L1
  :L0
  .line 199
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  :L1
  .line 200
    return-void
.end method

.method public static wrap()Z
  .registers 3
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
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Loop;->wrappedAt:J
  .line 50
    return v0
.end method

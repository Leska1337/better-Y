.class public final Lcom/innioasis/ipp/Loop;
.super Ljava/lang/Object;
.source "Loop.java"

.field private final static FAST_MS:J = 130L

.field private final static JUST_MS:J = 150L

.field public final static KEY:Ljava/lang/String; = "loop_scroll"

.field private final static SAME_CLICK_MS:J = 25L

.field private static kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;

.field private static postWrap:Z

.field private static swallowAt:J

.field private static swallowed:Z

.field private static wrapped:Z

.field private static wrappedAt:J

.field static wraps:I

.method private constructor <init>()V
  .registers 1
  .line 37
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static afterWrap()Z
  .registers 6
  .line 96
    sget-boolean v0, Lcom/innioasis/ipp/Loop;->postWrap:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 97
    sput-boolean v1, Lcom/innioasis/ipp/Loop;->postWrap:Z
  .line 98
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sget-wide v4, Lcom/innioasis/ipp/Wheel;->stepAt:J
    sub-long/2addr v2, v4
    const-wide/16 v4, 130
    cmp-long v0, v2, v4
    if-gez v0, :L1
    const/4 v1, 1
  :L1
    return v1
.end method

.method private static count(Lcom/innioasis/y1/base/BaseActivity;)I
  .registers 3
  .line 158
    instance-of v0, p0, Lcom/innioasis/y1/activity/BluetoothActivity;
    if-eqz v0, :L0
  .line 160
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;
  .line 161
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
  .line 163
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
  .line 173
    return v1
  :L2
  .line 168
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    invoke-interface { p0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object p0
  .line 170
    if-eqz p0, :L4
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v0
    if-nez v0, :L3
    goto :L4
  :L3
  .line 171
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->items(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    return p0
  :L4
  .line 170
    return v1
.end method

.method private static cursorRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
  .registers 3
  .line 248
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p1
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    add-int/2addr p1, p0
    return p1
.end method

.method private static firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
  .registers 4
  .line 183
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    return-object p0
  :L0
  .line 184
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 185
    check-cast p0, Landroid/view/ViewGroup;
  .line 186
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L4
  .line 187
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Loop;->firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v2
  .line 188
    if-eqz v2, :L3
    return-object v2
  :L3
  .line 186
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 190
    return-object v1
.end method

.method static fromShuffle(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
  .registers 6
  .line 201
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
  .line 202
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->shuffle(Landroid/view/View;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object p2
  .line 203
    if-eqz p2, :L3
    invoke-virtual { p2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v2
    if-nez v2, :L1
    goto :L3
  :L1
  .line 204
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
  .line 205
    if-gtz v2, :L2
    return v0
  :L2
  .line 206
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
  .line 207
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Loop;->cursorRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
    move-result v0
  .line 208
    invoke-virtual { p2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onClockwise()V
  .line 209
    sub-int/2addr v2, v1
    invoke-static { p0, p1, v2, v0 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .line 210
    return v1
  :L3
  .line 203
    return v0
  :L4
  .line 201
    return v0
.end method

.method private static items(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 2
  .line 177
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 178
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p0
    return p0
  :L1
  .line 177
    const/4 p0, 0
    return p0
.end method

.method static justWrapped()Z
  .registers 5
  .line 108
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
  .line 109
    const-wide/16 v1, 0
    sput-wide v1, Lcom/innioasis/ipp/Loop;->wrappedAt:J
  .line 110
    return v0
.end method

.method public static keep(Lcom/innioasis/y1/view/ShufflePlaylistItemView;)Z
  .registers 2
  .line 263
    if-eqz p0, :L1
    sget-object v0, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eq p0, v0, :L0
    goto :L1
  :L0
  .line 264
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 265
    const/4 p0, 1
    return p0
  :L1
  .line 263
    const/4 p0, 0
    return p0
.end method

.method public static lastOfStrip(IZ)I
  .registers 2
  .line 132
    add-int/lit8 p0, p0, -1
  .line 133
    if-eqz p1, :L0
    const/4 p1, 4
    if-ne p0, p1, :L0
    const/4 p0, 3
  :L0
  .line 134
    if-gez p0, :L1
    const/4 p0, 0
  :L1
    return p0
.end method

.method static list(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)Z
  .registers 10
  .line 215
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 216
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 217
    if-gtz v0, :L1
    return v1
  :L1
  .line 218
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->shuffle(Landroid/view/View;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object v2
  .line 219
    const/4 v3, 1
    if-eqz v2, :L2
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getVisibility()I
    move-result v4
    if-nez v4, :L2
  .line 220
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
  .line 221
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Loop;->cursorRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
    move-result v5
  .line 222
    if-ne p2, v3, :L7
  .line 223
    sub-int/2addr v0, v3
    if-eq p3, v0, :L4
    return v1
  :L4
  .line 224
    if-eqz v4, :L6
  .line 227
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
  .line 228
    invoke-virtual { p1, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 229
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->recordOldPosition()V
  .line 230
    invoke-virtual { v2, v1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onAntiClockwise(Z)V
  .line 231
    sput-object v2, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 232
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 233
    instance-of p1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz p1, :L5
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p1
    invoke-static { p0, v5, v1, p1 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L5
  .line 234
    return v3
  :L6
  .line 236
    invoke-static { p0, p1, v1, v5 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .line 237
    return v3
  :L7
  .line 239
    if-eqz p3, :L8
    return v1
  :L8
  .line 240
    if-eqz v4, :L9
    return v1
  :L9
  .line 241
    if-ne v0, v3, :L10
    return v1
  :L10
  .line 242
    sub-int/2addr v0, v3
    invoke-static { p0, p1, v0, v5 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .line 243
    return v3
.end method

.method public static mark(Lcom/innioasis/y1/base/BaseActivity;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 144
    if-eqz p0, :L8
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    if-nez v0, :L1
    goto :L8
  :L1
  .line 145
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->count(Lcom/innioasis/y1/base/BaseActivity;)I
    move-result v0
  .line 146
    const/4 v1, 1
    if-gt v0, v1, :L2
    return-void
  :L2
  .line 147
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v1
  .line 149
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
  .line 150
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
  .line 151
    if-gez p1, :L5
    if-gtz v1, :L5
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p1
    if-eqz p1, :L5
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
  :L5
  .line 153
    goto :L7
  :L6
  .line 152
    move-exception p0
  :L7
  .line 154
    return-void
  :L8
  .line 144
    return-void
.end method

.method static moved()V
  .registers 1
  .line 103
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Loop;->swallowed:Z
  .line 104
    return-void
.end method

.method static noteWrap()V
  .registers 2
  .line 90
    sget v0, Lcom/innioasis/ipp/Loop;->wraps:I
    const/4 v1, 1
    add-int/2addr v0, v1
    sput v0, Lcom/innioasis/ipp/Loop;->wraps:I
  .line 91
    sput-boolean v1, Lcom/innioasis/ipp/Loop;->postWrap:Z
  .line 92
    return-void
.end method

.method public static on()Z
  .registers 2
  .line 40
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 41
    const-string v1, "loop_scroll"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method public static step(III)I
  .registers 4
  .line 123
    if-gtz p2, :L0
    return p0
  :L0
  .line 124
    const/4 v0, 1
    if-lez p1, :L1
    const/4 p1, 1
    goto :L2
  :L1
    const/4 p1, -1
  :L2
    add-int/2addr p0, p1
  .line 125
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
  .line 126
    if-gez p0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p0
    if-eqz p0, :L6
    add-int/lit8 p1, p2, -1
  :L6
    return p1
  :L7
  .line 127
    return p0
.end method

.method static swallow()Z
  .registers 8
  .line 74
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 75
    sget-boolean v2, Lcom/innioasis/ipp/Loop;->swallowed:Z
    const/4 v3, 1
    if-eqz v2, :L0
    sget-wide v4, Lcom/innioasis/ipp/Loop;->swallowAt:J
    sub-long v4, v0, v4
    const-wide/16 v6, 25
    cmp-long v2, v4, v6
    if-gez v2, :L0
    return v3
  :L0
  .line 76
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v2
    if-eqz v2, :L2
    sget-boolean v2, Lcom/innioasis/ipp/Loop;->swallowed:Z
    if-nez v2, :L2
    sget-wide v4, Lcom/innioasis/ipp/Wheel;->stepAt:J
    sub-long v4, v0, v4
    const-wide/16 v6, 130
    cmp-long v2, v4, v6
    if-ltz v2, :L1
    goto :L2
  :L1
  .line 80
    sput-boolean v3, Lcom/innioasis/ipp/Loop;->swallowed:Z
  .line 81
    sput-wide v0, Lcom/innioasis/ipp/Loop;->swallowAt:J
  .line 82
    return v3
  :L2
  .line 77
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Loop;->swallowed:Z
  .line 78
    return v0
.end method

.method public static takeWrap()Z
  .registers 2
  .line 117
    sget-boolean v0, Lcom/innioasis/ipp/Loop;->wrapped:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 118
    sput-boolean v1, Lcom/innioasis/ipp/Loop;->wrapped:Z
  .line 119
    const/4 v0, 1
    return v0
.end method

.method private static toRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .registers 4
  .line 252
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
  .line 253
    invoke-virtual { p1, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 254
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 256
    instance-of p1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz p1, :L0
  .line 257
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p1
    add-int/2addr p2, p1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p1
    invoke-static { p0, p3, p2, p1 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L0
  .line 259
    return-void
.end method

.method public static wrap()Z
  .registers 3
  .line 50
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 51
    invoke-static { }, Lcom/innioasis/ipp/Loop;->swallow()Z
    move-result v0
    if-eqz v0, :L1
    return v1
  :L1
  .line 52
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Loop;->wrapped:Z
  .line 53
    sget v1, Lcom/innioasis/ipp/Loop;->wraps:I
    add-int/2addr v1, v0
    sput v1, Lcom/innioasis/ipp/Loop;->wraps:I
  .line 54
    sput-boolean v0, Lcom/innioasis/ipp/Loop;->postWrap:Z
  .line 55
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Loop;->wrappedAt:J
  .line 56
    return v0
.end method

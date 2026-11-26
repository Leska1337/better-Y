.class public final Lcom/innioasis/ipp/Loop;
.super Ljava/lang/Object;
.source "Loop.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Loop$Bumper;
  }
.end annotation

.field public final static BUMP_V:F = 240.0F

.field private final static JUST_MS:J = 150L

.field public final static KEY:Ljava/lang/String; = "loop_scroll"

.field public final static PAUSE_MS:J = 100L

.field private final static SAME_CLICK_MS:J = 25L

.field private final static SETTLE_MS:J = 40L

.field public final static STOP_MS:J = 300L

.field private static animAt:J

.field private static bumper:Ljava/lang/ref/WeakReference;

.field private static clickAt:J

.field private static edgeAt:J

.field private static kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;

.field private static movedAt:J

.field private static postWrap:Z

.field private static swallowAt:J

.field private static swallowed:Z

.field private static wrapTime:J

.field private static wrapped:Z

.field private static wrappedAt:J

.field static wraps:I

.method private constructor <init>()V
  .registers 1
  .line 37
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static aboveShuffle()V
  .registers 1
  .line 302
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Loop;->edge()V
  :L0
  .line 303
    return-void
.end method

.method static afterWrap()Z
  .registers 6
  .line 169
    sget-boolean v0, Lcom/innioasis/ipp/Loop;->postWrap:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 170
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sget-wide v4, Lcom/innioasis/ipp/Loop;->wrapTime:J
    sub-long/2addr v2, v4
    const-wide/16 v4, 100
    cmp-long v0, v2, v4
    if-gez v0, :L1
    const/4 v0, 1
    return v0
  :L1
  .line 171
    sput-boolean v1, Lcom/innioasis/ipp/Loop;->postWrap:Z
  .line 172
    return v1
.end method

.method public static animating()V
  .registers 2
  .line 99
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Loop;->animAt:J
  .line 100
    return-void
.end method

.method private static bump()V
  .registers 3
  .line 144
    sget-object v0, Lcom/innioasis/ipp/Loop;->bumper:Ljava/lang/ref/WeakReference;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Loop$Bumper;
  :L1
  .line 145
    if-nez v0, :L2
    return-void
  :L2
  .line 146
    invoke-interface { v0 }, Lcom/innioasis/ipp/Loop$Bumper;->count()I
    move-result v1
  .line 147
    if-lez v1, :L5
    invoke-interface { v0 }, Lcom/innioasis/ipp/Loop$Bumper;->at()I
    move-result v2
    div-int/lit8 v1, v1, 2
    if-ge v2, v1, :L3
    const/4 v1, -1
    goto :L4
  :L3
    const/4 v1, 1
  :L4
    invoke-interface { v0, v1 }, Lcom/innioasis/ipp/Loop$Bumper;->bump(I)V
  :L5
  .line 148
    return-void
.end method

.method public static bumper(Lcom/innioasis/ipp/Loop$Bumper;)V
  .registers 2
  .line 129
    sget-object v0, Lcom/innioasis/ipp/Loop;->bumper:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L1
  :L0
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Loop;->bumper:Ljava/lang/ref/WeakReference;
  :L1
  .line 130
    return-void
.end method

.method private static count(Lcom/innioasis/y1/base/BaseActivity;)I
  .registers 3
  .line 244
    instance-of v0, p0, Lcom/innioasis/y1/activity/BluetoothActivity;
    if-eqz v0, :L0
  .line 246
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityBlutoothBinding;
  .line 247
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
  .line 249
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
  .line 259
    return v1
  :L2
  .line 254
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    invoke-interface { p0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object p0
  .line 256
    if-eqz p0, :L4
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v0
    if-nez v0, :L3
    goto :L4
  :L3
  .line 257
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->items(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    return p0
  :L4
  .line 256
    return v1
.end method

.method private static cursorRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
  .registers 3
  .line 344
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

.method private static edge()V
  .registers 7
  .line 136
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 137
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 138
    sget-wide v2, Lcom/innioasis/ipp/Loop;->edgeAt:J
    sub-long v2, v0, v2
    const-wide/16 v4, 25
    cmp-long v6, v2, v4
    if-gez v6, :L1
    return-void
  :L1
  .line 139
    sput-wide v0, Lcom/innioasis/ipp/Loop;->edgeAt:J
  .line 140
    invoke-static { }, Lcom/innioasis/ipp/Loop;->bump()V
  .line 141
    return-void
.end method

.method private static firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
  .registers 4
  .line 269
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    return-object p0
  :L0
  .line 270
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 271
    check-cast p0, Landroid/view/ViewGroup;
  .line 272
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L4
  .line 273
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Loop;->firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v2
  .line 274
    if-eqz v2, :L3
    return-object v2
  :L3
  .line 272
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 276
    return-object v1
.end method

.method static fromShuffle(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
  .registers 6
  .line 287
    const/4 v0, 0
    const/4 v1, 1
    if-eq p2, v1, :L5
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p2
    if-gez p2, :L5
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result p2
    if-nez p2, :L0
    goto :L5
  :L0
  .line 288
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->shuffle(Landroid/view/View;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object p2
  .line 289
    if-eqz p2, :L4
    invoke-virtual { p2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->isSelect()Z
    move-result v2
    if-nez v2, :L1
    goto :L4
  :L1
  .line 290
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
  .line 291
    if-gtz v2, :L2
    return v0
  :L2
  .line 293
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result v0
    if-nez v0, :L3
    return v1
  :L3
  .line 294
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Loop;->cursorRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
    move-result v0
  .line 295
    invoke-virtual { p2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onClockwise()V
  .line 296
    sub-int/2addr v2, v1
    invoke-static { p0, p1, v2, v0 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .line 297
    return v1
  :L4
  .line 289
    return v0
  :L5
  .line 287
    return v0
.end method

.method private static items(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 2
  .line 263
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 264
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result p0
    return p0
  :L1
  .line 263
    const/4 p0, 0
    return p0
.end method

.method static justWrapped()Z
  .registers 5
  .line 183
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
  .line 184
    const-wide/16 v1, 0
    sput-wide v1, Lcom/innioasis/ipp/Loop;->wrappedAt:J
  .line 185
    return v0
.end method

.method public static keep(Lcom/innioasis/y1/view/ShufflePlaylistItemView;)Z
  .registers 2
  .line 359
    if-eqz p0, :L1
    sget-object v0, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eq p0, v0, :L0
    goto :L1
  :L0
  .line 360
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 361
    const/4 p0, 1
    return p0
  :L1
  .line 359
    const/4 p0, 0
    return p0
.end method

.method public static lastOfStrip(IZ)I
  .registers 2
  .line 214
    add-int/lit8 p0, p0, -1
  .line 215
    if-eqz p1, :L0
    const/4 p1, 4
    if-ne p0, p1, :L0
    const/4 p0, 3
  :L0
  .line 216
    if-gez p0, :L1
    const/4 p0, 0
  :L1
    return p0
.end method

.method static list(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)Z
  .registers 10
  .line 307
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
  .line 308
    invoke-static { }, Lcom/innioasis/ipp/Loop;->edge()V
  .line 309
    return v1
  :L0
  .line 311
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 312
    if-gtz v0, :L1
    return v1
  :L1
  .line 313
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->shuffle(Landroid/view/View;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object v2
  .line 314
    const/4 v3, 1
    if-eqz v2, :L2
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getVisibility()I
    move-result v4
    if-nez v4, :L2
  .line 315
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
  .line 316
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Loop;->cursorRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
    move-result v5
  .line 317
    if-ne p2, v3, :L8
  .line 318
    sub-int/2addr v0, v3
    if-eq p3, v0, :L4
    return v1
  :L4
  .line 319
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p2
    if-nez p2, :L5
    return v1
  :L5
  .line 320
    if-eqz v4, :L7
  .line 323
    invoke-virtual { p1, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 324
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->recordOldPosition()V
  .line 325
    invoke-virtual { v2, v1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->onAntiClockwise(Z)V
  .line 326
    sput-object v2, Lcom/innioasis/ipp/Loop;->kept:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 327
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 328
    instance-of p1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz p1, :L6
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p1
    invoke-static { p0, v5, v1, p1 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L6
  .line 329
    return v3
  :L7
  .line 331
    invoke-static { p0, p1, v1, v5 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .line 332
    return v3
  :L8
  .line 334
    if-eqz p3, :L9
    return v1
  :L9
  .line 335
    if-eqz v4, :L10
    return v1
  :L10
  .line 336
    if-ne v0, v3, :L11
    return v1
  :L11
  .line 337
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p2
    if-nez p2, :L12
    return v1
  :L12
  .line 338
    sub-int/2addr v0, v3
    invoke-static { p0, p1, v0, v5 }, Lcom/innioasis/ipp/Loop;->toRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .line 339
    return v3
.end method

.method public static mark(Lcom/innioasis/y1/base/BaseActivity;I)V
  .catchall { :L0 .. :L8 } :L9
  .registers 6
  .line 226
    if-nez p0, :L0
    return-void
  :L0
  .line 227
    invoke-static { p0 }, Lcom/innioasis/ipp/Loop;->count(Lcom/innioasis/y1/base/BaseActivity;)I
    move-result v0
  .line 228
    const/4 v1, 1
    if-gt v0, v1, :L1
    return-void
  :L1
  .line 229
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v2
  .line 230
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v3
    if-nez v3, :L5
  .line 231
    if-lez p1, :L2
    sub-int/2addr v0, v1
    if-lt v2, v0, :L4
    goto :L3
  :L2
    if-gtz v2, :L4
  :L3
    invoke-static { }, Lcom/innioasis/ipp/Loop;->edge()V
  :L4
  .line 232
    return-void
  :L5
  .line 235
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v1
    invoke-interface { v1 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Loop;->firstList(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Bar;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v1
    if-eqz v1, :L6
    return-void
  :L6
  .line 236
    if-lez p1, :L7
    add-int/lit8 v1, v0, -1
    if-lt v2, v1, :L7
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result v1
    if-eqz v1, :L7
    const/4 p1, -1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
    goto :L8
  :L7
  .line 237
    if-gez p1, :L8
    if-gtz v2, :L8
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p1
    if-eqz p1, :L8
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
  :L8
  .line 239
    goto :L10
  :L9
  .line 238
    move-exception p0
  :L10
  .line 240
    return-void
.end method

.method static moved()V
  .registers 2
  .line 177
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Loop;->swallowed:Z
  .line 178
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Loop;->movedAt:J
  .line 179
    return-void
.end method

.method static noteWrap()V
  .registers 2
  .line 162
    sget v0, Lcom/innioasis/ipp/Loop;->wraps:I
    const/4 v1, 1
    add-int/2addr v0, v1
    sput v0, Lcom/innioasis/ipp/Loop;->wraps:I
  .line 163
    sput-boolean v1, Lcom/innioasis/ipp/Loop;->postWrap:Z
  .line 164
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Loop;->wrapTime:J
  .line 165
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

.method public static rows(III)I
  .registers 3
  .line 207
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Loop;->step(III)I
    move-result p1
  .line 208
    if-eq p1, p0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Loop;->moved()V
  :L0
  .line 209
    return p1
.end method

.method private static settled(J)Z
  .registers 7
  .line 111
    sget-wide v0, Lcom/innioasis/ipp/Loop;->animAt:J
    sub-long v0, p0, v0
    const-wide/16 v2, 40
    cmp-long v4, v0, v2
    if-lez v4, :L0
    sget-wide v0, Lcom/innioasis/ipp/Loop;->movedAt:J
    sget-wide v2, Lcom/innioasis/ipp/Loop;->clickAt:J
    invoke-static { v0, v1, v2, v3 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide v0
    sub-long/2addr p0, v0
    const-wide/16 v0, 300
    cmp-long v2, p0, v0
    if-lez v2, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static step(III)I
  .registers 4
  .line 198
    if-gtz p2, :L0
    return p0
  :L0
  .line 199
    const/4 v0, 1
    if-lez p1, :L1
    const/4 p1, 1
    goto :L2
  :L1
    const/4 p1, -1
  :L2
    add-int/2addr p0, p1
  .line 200
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
  .line 201
    if-gez p0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Loop;->wrap()Z
    move-result p0
    if-eqz p0, :L6
    add-int/lit8 p1, p2, -1
  :L6
    return p1
  :L7
  .line 202
    return p0
.end method

.method static swallow()Z
  .registers 8
  .line 76
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 77
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
  .line 78
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Loop;->settled(J)Z
    move-result v2
  .line 79
    sput-wide v0, Lcom/innioasis/ipp/Loop;->clickAt:J
  .line 80
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v4
    if-eqz v4, :L2
    if-eqz v2, :L1
    goto :L2
  :L1
  .line 84
    sput-boolean v3, Lcom/innioasis/ipp/Loop;->swallowed:Z
  .line 85
    sput-wide v0, Lcom/innioasis/ipp/Loop;->swallowAt:J
  .line 86
    invoke-static { }, Lcom/innioasis/ipp/Loop;->bump()V
  .line 87
    return v3
  :L2
  .line 81
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Loop;->swallowed:Z
  .line 82
    return v0
.end method

.method public static takeWrap()Z
  .registers 2
  .line 192
    sget-boolean v0, Lcom/innioasis/ipp/Loop;->wrapped:Z
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 193
    sput-boolean v1, Lcom/innioasis/ipp/Loop;->wrapped:Z
  .line 194
    const/4 v0, 1
    return v0
.end method

.method private static toRow(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .registers 4
  .line 349
    invoke-virtual { p1, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 350
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 352
    instance-of p1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz p1, :L0
  .line 353
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p1
    add-int/2addr p2, p1
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p1
    invoke-static { p0, p3, p2, p1 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L0
  .line 355
    return-void
.end method

.method public static wrap()Z
  .registers 3
  .line 50
    invoke-static { }, Lcom/innioasis/ipp/Loop;->on()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
  .line 51
    invoke-static { }, Lcom/innioasis/ipp/Loop;->edge()V
  .line 52
    return v1
  :L0
  .line 54
    invoke-static { }, Lcom/innioasis/ipp/Loop;->swallow()Z
    move-result v0
    if-eqz v0, :L1
    return v1
  :L1
  .line 55
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Loop;->wrapped:Z
  .line 56
    sget v1, Lcom/innioasis/ipp/Loop;->wraps:I
    add-int/2addr v1, v0
    sput v1, Lcom/innioasis/ipp/Loop;->wraps:I
  .line 57
    sput-boolean v0, Lcom/innioasis/ipp/Loop;->postWrap:Z
  .line 58
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Loop;->wrappedAt:J
  .line 59
    sput-wide v1, Lcom/innioasis/ipp/Loop;->wrapTime:J
  .line 60
    return v0
.end method

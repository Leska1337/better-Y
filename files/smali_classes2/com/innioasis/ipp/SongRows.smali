.class public final Lcom/innioasis/ipp/SongRows;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.implements Lcom/innioasis/ipp/Bar$Cursor;
.implements Lcom/innioasis/ipp/Bar$Ticks;
.source "SongRows.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/SongRows$Watch;,
    Lcom/innioasis/ipp/SongRows$HeadHolder;,
    Lcom/innioasis/ipp/SongRows$Holder;,
    Lcom/innioasis/ipp/SongRows$Shown;,
    Lcom/innioasis/ipp/SongRows$Reveal;
  }
.end annotation

.field private final static HEAD:I = 1

.field private final static HEADS:Ljava/util/WeakHashMap;

.field final static HEAD_ROWS:I = 1

.field private final static POOL:I = 16

.field private final static REVEAL:Lcom/innioasis/ipp/SongRows$Reveal;

.field private final static ROW:I

.field static dbgBindMs:J

.field static dbgBinds:I

.field static dbgMade:I

.field static dbgReqAfter:I

.field static dbgReqBefore:I

.field static dbgWho:Ljava/lang/String;

.field private static volatile deleted:I

.field private idBase:J

.field private final list:Ljava/lang/ref/WeakReference;

.field private final model:Lcom/innioasis/music/adapter/SongListAdapter;

.field private final spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;

.method static constructor <clinit>()V
  .registers 1
  .line 279
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/SongRows;->deleted:I
  .line 361
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/SongRows;->HEADS:Ljava/util/WeakHashMap;
  .line 363
    new-instance v0, Lcom/innioasis/ipp/SongRows$Reveal;
    invoke-direct { v0 }, Lcom/innioasis/ipp/SongRows$Reveal;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/SongRows;->REVEAL:Lcom/innioasis/ipp/SongRows$Reveal;
    return-void
.end method

.method private constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/view/ShufflePlaylistItemView;Lcom/innioasis/music/adapter/SongListAdapter;)V
  .registers 4
  .line 48
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V
  .line 49
    iput-object p3, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/SongListAdapter;
  .line 50
    new-instance p3, Ljava/lang/ref/WeakReference;
    invoke-direct { p3, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object p3, p0, Lcom/innioasis/ipp/SongRows;->list:Ljava/lang/ref/WeakReference;
  .line 51
    iput-object p2, p0, Lcom/innioasis/ipp/SongRows;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 52
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/ipp/SongRows;)Lcom/innioasis/music/adapter/SongListAdapter;
  .registers 1
  .line 34
    iget-object p0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/SongListAdapter;
    return-object p0
.end method

.method public static attach(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/music/adapter/SongListAdapter;)V
  .registers 5
  .line 56
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getParent()Landroid/view/ViewParent;
    move-result-object v1
  :L1
  .line 57
    instance-of v2, v1, Landroid/view/View;
    if-eqz v2, :L2
    check-cast v1, Landroid/view/View;
    const v2, 2131362396
    invoke-virtual { v1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
    goto :L3
  :L2
    move-object v1, v0
  :L3
  .line 58
    instance-of v2, v1, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eqz v2, :L4
    move-object v0, v1
    check-cast v0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  :L4
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/SongRows;->attach(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/view/ShufflePlaylistItemView;Lcom/innioasis/music/adapter/SongListAdapter;)V
  .line 59
    return-void
.end method

.method public static attach(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/view/ShufflePlaylistItemView;Lcom/innioasis/music/adapter/SongListAdapter;)V
  .registers 6
  .line 63
    if-eqz p0, :L5
    if-nez p2, :L0
    goto :L5
  :L0
  .line 64
    if-eqz p1, :L3
    invoke-virtual { p1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v0, v0, Landroid/view/ViewGroup;
    if-eqz v0, :L3
    invoke-virtual { p1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    if-eq v0, p0, :L3
  .line 65
    invoke-virtual { p1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    if-nez v0, :L1
    const/4 v0, -2
    goto :L2
  :L1
  .line 66
    invoke-virtual { p1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
  :L2
  .line 67
    invoke-virtual { p1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup;
    invoke-virtual { v1, p1 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  .line 68
    new-instance v1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    const/4 v2, -1
    invoke-direct { v1, v2, v0 }, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V
    invoke-virtual { p1, v1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L3
  .line 70
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 71
    new-instance v0, Lcom/innioasis/ipp/SongRows;
    invoke-direct { v0, p0, p1, p2 }, Lcom/innioasis/ipp/SongRows;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/view/ShufflePlaylistItemView;Lcom/innioasis/music/adapter/SongListAdapter;)V
  .line 73
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/SongRows;->setHasStableIds(Z)V
  .line 74
    if-eqz p1, :L4
    sget-object v1, Lcom/innioasis/ipp/SongRows;->HEADS:Ljava/util/WeakHashMap;
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v1, p1, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 75
    new-instance p1, Lcom/innioasis/ipp/SongRows$Watch;
    invoke-direct { p1, v0 }, Lcom/innioasis/ipp/SongRows$Watch;-><init>(Lcom/innioasis/ipp/SongRows;)V
    invoke-virtual { p2, p1 }, Lcom/innioasis/music/adapter/SongListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V
  .line 76
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->tune(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 79
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getRecycledViewPool()Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;
    move-result-object p1
    const/4 p2, 0
    const/16 v1, 16
    invoke-virtual { p1, p2, v1 }, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V
  .line 80
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 81
    return-void
  :L5
  .line 63
    return-void
.end method

.method private bindRow(Lcom/innioasis/ipp/SongRows$Holder;I)V
  .registers 13
  .line 196
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/SongListAdapter;
  .line 197
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
  .line 198
    invoke-static { v0 }, Lcom/innioasis/ipp/ListWatch;->tick(Landroid/widget/BaseAdapter;)V
  .line 199
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Follow;->note(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/ViewGroup;)V
  .line 200
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Disc;->note(Ljava/lang/Object;Landroid/view/View;)V
  .line 201
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getItemList()Ljava/util/List;
    move-result-object v2
  .line 202
    invoke-interface { v2, p2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 203
    iget-object p1, p1, Lcom/innioasis/ipp/SongRows$Holder;->b:Lcom/innioasis/y1/databinding/ItemSonglistBinding;
  .line 204
    invoke-virtual { p1 }, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;
    move-result-object v4
  .line 205
    invoke-static { v4, v2, p2, v0 }, Lcom/innioasis/ipp/Disc;->bind(Landroid/view/View;Ljava/util/List;ILjava/lang/Object;)V
  .line 206
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongIndex:Landroid/widget/TextView;
    invoke-static { v3, v2, p2, v0 }, Lcom/innioasis/ipp/Disc;->rowIndex(Lcom/innioasis/y1/database/Song;Ljava/util/List;ILjava/lang/Object;)Ljava/lang/String;
    move-result-object v6
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Rows;->text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .line 207
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongIndex:Landroid/widget/TextView;
    invoke-static { v5, v2, v0 }, Lcom/innioasis/ipp/Rows;->indexWidth(Landroid/widget/TextView;Ljava/util/List;Ljava/lang/Object;)V
  .line 208
    iget-object v2, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v2
    const-string v5, "meta_title"
    invoke-static { v2, v5 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L0
  .line 209
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v2, v5 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    goto :L1
  :L0
  .line 210
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    sget-object v5, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v2, v5 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  :L1
  .line 211
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    invoke-static { v5, v2 }, Lcom/innioasis/ipp/Rows;->text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .line 212
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 213
    sget-object v5, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5, v6 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 214
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getCanShowTime()Z
    move-result v5
    const-string v6, "     "
    if-eqz v5, :L2
  .line 215
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 216
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getFormat()Ljava/text/SimpleDateFormat;
    move-result-object v5
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v7
    invoke-static { v7, v8 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v7
    invoke-virtual { v5, v7 }, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L2
  .line 218
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getCanShowAlbum()Z
    move-result v5
    if-eqz v5, :L3
  .line 219
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 220
    sget-object v5, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v5, v3 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L3
  .line 222
    iget-object v3, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvArtists:Landroid/widget/TextView;
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static { v3, v2 }, Lcom/innioasis/ipp/Rows;->text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .line 224
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
  .line 225
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v3
  .line 227
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->on(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
  .line 229
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getPosition()I
    move-result v5
    const v6, 2131231050
    const/4 v7, 0
    const/4 v8, 1
    if-ne p2, v5, :L5
  .line 230
    iget-object v2, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    invoke-static { v2 }, Lcom/innioasis/ipp/Scroll;->rowText(Landroid/widget/TextView;)V
  .line 231
    if-nez v1, :L4
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v4, v6, v8 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L4
  .line 232
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->rightArrow:Landroid/widget/ImageView;
    const v6, 2131623981
    invoke-virtual { v2, v5, v6 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetRightArrow(Landroid/widget/ImageView;I)V
  .line 233
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->rightArrow:Landroid/widget/ImageView;
    invoke-virtual { v2, v5 }, Lcom/innioasis/music/util/Other;->showV(Landroid/view/View;)V
  .line 234
    goto :L7
  :L5
  .line 235
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v5
    invoke-static { p2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-interface { v5, v9 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L8
  .line 236
    iget-object v2, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    invoke-static { v2 }, Lcom/innioasis/ipp/Scroll;->rowPlain(Landroid/widget/TextView;)V
  .line 237
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->rightArrow:Landroid/widget/ImageView;
    invoke-virtual { v2, v5 }, Lcom/innioasis/music/util/Other;->hideV(Landroid/view/View;)V
  .line 238
    if-nez v1, :L6
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v4, v6, v8 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L6
  .line 239
    nop
  :L7
  .line 246
    move v2, v3
    goto :L10
  :L8
  .line 241
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->rowPlain(Landroid/widget/TextView;)V
  .line 242
    sget-object v5, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    iget-object v6, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->rightArrow:Landroid/widget/ImageView;
    invoke-virtual { v5, v6 }, Lcom/innioasis/music/util/Other;->hideV(Landroid/view/View;)V
  .line 243
    if-nez v1, :L9
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v6, 2131231044
    invoke-virtual { v5, v4, v6, v7 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L9
  .line 244
    const v5, 2131100267
    invoke-virtual { v2, v5 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  :L10
  .line 246
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongIndex:Landroid/widget/TextView;
    if-ne v2, v3, :L11
    const/4 v9, 1
    goto :L12
  :L11
    const/4 v9, 0
  :L12
    invoke-virtual { v5, v6, v2, v9 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 247
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    if-ne v2, v3, :L13
    const/4 v9, 1
    goto :L14
  :L13
    const/4 v9, 0
  :L14
    invoke-virtual { v5, v6, v2, v9 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 248
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object p1, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvArtists:Landroid/widget/TextView;
    if-ne v2, v3, :L15
    const/4 v7, 1
  :L15
    invoke-virtual { v5, p1, v2, v7 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 249
    invoke-static { v4, p2, v0 }, Lcom/innioasis/ipp/Rows;->songMark(Landroid/view/View;ILjava/lang/Object;)V
  .line 250
    if-nez v1, :L16
    invoke-static { v4 }, Lcom/innioasis/ipp/Rows;->flat(Landroid/view/View;)V
  :L16
  .line 251
    invoke-static { v4 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 252
    return-void
.end method

.method public static cancel(Landroidx/recyclerview/widget/RecyclerView;[Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 335
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
  .line 336
    if-eqz p0, :L6
    if-nez p1, :L0
    goto :L6
  :L0
  .line 337
    const/4 v0, 0
  :L1
    array-length v1, p1
    if-ge v0, v1, :L5
  .line 338
    aget-object v1, p1, v0
    iget-object v2, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/SongListAdapter;
    if-eq v1, v2, :L2
    goto :L4
  :L2
  .line 339
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/SongListAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 340
    if-eqz v1, :L3
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L3
  .line 341
    iget-object v1, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/SongListAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/SongListAdapter;->notifyDataSetChanged()V
  :L4
  .line 337
    add-int/lit8 v0, v0, 1
    goto :L1
  :L5
  .line 343
    return-void
  :L6
  .line 336
    return-void
.end method

.method public static deleting(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 283
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  :L1
  .line 284
    nop
  .line 285
    const/4 v0, -1
    const/4 v1, 0
  :L2
    if-eqz p0, :L6
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L6
  .line 286
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 287
    instance-of v3, v2, Ljava/lang/Integer;
    if-nez v3, :L3
    goto :L5
  :L3
  .line 288
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 289
    if-ltz v2, :L5
    if-ltz v0, :L4
    if-ge v2, v0, :L5
  :L4
    move v0, v2
  :L5
  .line 285
    add-int/lit8 v1, v1, 1
    goto :L2
  :L6
  .line 291
    sput v0, Lcom/innioasis/ipp/SongRows;->deleted:I
  .line 292
    return-void
.end method

.method public static kept(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 4
  .line 300
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 301
    if-nez v0, :L0
    return-void
  :L0
  .line 302
    sget v1, Lcom/innioasis/ipp/SongRows;->deleted:I
    if-ltz v1, :L1
    sget p1, Lcom/innioasis/ipp/SongRows;->deleted:I
  :L1
  .line 303
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/SongRows;->deleted:I
  .line 304
    iget-object v0, v0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/SongListAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getCount()I
    move-result v1
    add-int/lit8 v1, v1, -1
    invoke-static { p1, v1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    invoke-virtual { v0, p1 }, Lcom/innioasis/music/adapter/SongListAdapter;->setPosition(I)V
  .line 305
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .line 306
    new-instance p1, Lcom/innioasis/ipp/SongRows$Shown;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/SongRows$Shown;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  .line 307
    return-void
.end method

.method static moving(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 7
  .line 122
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 123
    if-eqz v0, :L2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-nez v1, :L0
    goto :L2
  :L0
  .line 124
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 125
    invoke-virtual { v2 }, Landroid/view/View;->getHeight()I
    move-result v3
  .line 126
    if-gtz v3, :L1
    return-void
  :L1
  .line 128
    add-int/2addr p2, v3
    add-int/lit8 p2, p2, -1
    invoke-static { v1, p2 }, Ljava/lang/Math;->max(II)I
    move-result p2
    div-int/2addr p2, v3
  .line 129
    invoke-virtual { p0, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result p0
  .line 130
    iget-wide v1, v0, Lcom/innioasis/ipp/SongRows;->idBase:J
    sub-int/2addr p1, p2
    sub-int/2addr p0, p1
    int-to-long p0, p0
    add-long/2addr v1, p0
    iput-wide v1, v0, Lcom/innioasis/ipp/SongRows;->idBase:J
  .line 131
    return-void
  :L2
  .line 123
    return-void
.end method

.method static of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
  .registers 3
  .line 84
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  :L1
  .line 85
    instance-of v1, p0, Lcom/innioasis/ipp/SongRows;
    if-eqz v1, :L2
    move-object v0, p0
    check-cast v0, Lcom/innioasis/ipp/SongRows;
  :L2
    return-object v0
.end method

.method static reveal(Lcom/innioasis/y1/view/ShufflePlaylistItemView;)V
  .registers 4
  .line 350
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    sget-object v1, Lcom/innioasis/ipp/SongRows;->HEADS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  :L1
  .line 351
    if-nez v1, :L2
    move-object v1, v0
    goto :L3
  :L2
    check-cast v1, Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/SongRows;
  :L3
  .line 352
    if-nez v1, :L4
    goto :L5
  :L4
    invoke-virtual { v1 }, Lcom/innioasis/ipp/SongRows;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v0
  :L5
  .line 353
    if-eqz v0, :L8
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v2
    if-eq v2, v1, :L6
    goto :L8
  :L6
  .line 355
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    if-ne v1, v0, :L7
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getTop()I
    move-result p0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v1
    if-lt p0, v1, :L7
    return-void
  :L7
  .line 356
    sget-object p0, Lcom/innioasis/ipp/SongRows;->REVEAL:Lcom/innioasis/ipp/SongRows$Reveal;
    invoke-virtual { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 357
    invoke-virtual { p0, v0 }, Lcom/innioasis/ipp/SongRows$Reveal;->at(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows$Reveal;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  .line 358
    return-void
  :L8
  .line 353
    return-void
.end method

.method public static row(Landroidx/recyclerview/widget/RecyclerView;I)Landroid/view/View;
  .registers 2
  .line 267
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Lv;->row(Landroid/view/View;I)Landroid/view/View;
    move-result-object p0
  :L1
    return-object p0
.end method

.method public static select(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 3
  .line 272
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
    if-nez v0, :L0
    return-void
  :L0
  .line 273
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .line 274
    if-gtz p1, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->rest(Landroid/view/View;)V
    goto :L2
  :L1
  .line 275
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Lv;->pin(Landroid/view/View;I)V
  :L2
  .line 276
    return-void
.end method

.method static tinted(Landroid/view/View;)V
  .registers 4
  .line 256
    const v0, 2131362500
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 257
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L0
    return-void
  :L0
  .line 258
    check-cast v0, Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
  .line 259
    const v1, 2131362551
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 260
    instance-of v2, v1, Landroid/widget/ImageView;
    if-eqz v2, :L1
    invoke-virtual { v1 }, Landroid/view/View;->getVisibility()I
    move-result v2
    if-nez v2, :L1
    check-cast v1, Landroid/widget/ImageView;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L1
  .line 261
    instance-of v1, p0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eqz v1, :L2
    const v1, 2131362087
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    goto :L3
  :L2
    const/4 p0, 0
  :L3
  .line 262
    instance-of v1, p0, Landroid/widget/ImageView;
    if-eqz v1, :L4
    check-cast p0, Landroid/widget/ImageView;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L4
  .line 263
    return-void
.end method

.method private static who(Landroid/view/View;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 168
    invoke-virtual { p0 }, Landroid/view/View;->isLayoutRequested()Z
    move-result v0
    if-eqz v0, :L5
  :L0
  .line 171
    invoke-virtual { p0 }, Landroid/view/View;->getId()I
    move-result v0
    const/4 v1, -1
    if-ne v0, v1, :L1
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v0
    goto :L2
  :L1
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { p0 }, Landroid/view/View;->getId()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;
    move-result-object v0
  :L2
  .line 174
    goto :L4
  :L3
  .line 172
    move-exception v0
  .line 173
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v0
  :L4
  .line 175
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const/16 v1, 32
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L5
  .line 177
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :L7
  .line 178
    check-cast p0, Landroid/view/ViewGroup;
  .line 179
    const/4 v0, 0
  :L6
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L7
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/SongRows;->who(Landroid/view/View;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    add-int/lit8 v0, v0, 1
    goto :L6
  :L7
  .line 181
    return-object p1
.end method

.method public cursor()I
  .registers 2
  .line 186
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/SongListAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getPosition()I
    move-result v0
    add-int/lit8 v0, v0, 1
    return v0
.end method

.method public getItemCount()I
  .registers 2
  .line 101
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/SongListAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getCount()I
    move-result v0
  .line 102
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    add-int/lit8 v0, v0, 1
  :L1
    return v0
.end method

.method public getItemId(I)J
  .registers 6
  .line 112
    int-to-long v0, p1
    iget-wide v2, p0, Lcom/innioasis/ipp/SongRows;->idBase:J
    add-long/2addr v0, v2
    return-wide v0
.end method

.method public getItemViewType(I)I
  .registers 3
  .line 134
    const/4 v0, 1
    if-ge p1, v0, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method list()Landroidx/recyclerview/widget/RecyclerView;
  .registers 2
  .line 97
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->list:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    return-object v0
.end method

.method model()Lcom/innioasis/music/adapter/SongListAdapter;
  .registers 2
  .line 89
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/SongListAdapter;
    return-object v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 7
  :L0
  .line 148
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 149
    iget-object v2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    invoke-virtual { v2 }, Landroid/view/View;->isLayoutRequested()Z
    move-result v2
    if-eqz v2, :L1
    sget v2, Lcom/innioasis/ipp/SongRows;->dbgReqBefore:I
    add-int/lit8 v2, v2, 1
    sput v2, Lcom/innioasis/ipp/SongRows;->dbgReqBefore:I
  :L1
  .line 150
    instance-of v2, p1, Lcom/innioasis/ipp/SongRows$Holder;
    if-eqz v2, :L2
    move-object v2, p1
    check-cast v2, Lcom/innioasis/ipp/SongRows$Holder;
    add-int/lit8 p2, p2, -1
    invoke-direct { p0, v2, p2 }, Lcom/innioasis/ipp/SongRows;->bindRow(Lcom/innioasis/ipp/SongRows$Holder;I)V
    goto :L3
  :L2
  .line 151
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    invoke-static { p2 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  :L3
  .line 152
    sget p2, Lcom/innioasis/ipp/SongRows;->dbgBinds:I
    add-int/lit8 p2, p2, 1
    sput p2, Lcom/innioasis/ipp/SongRows;->dbgBinds:I
  .line 153
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    invoke-virtual { p2 }, Landroid/view/View;->isLayoutRequested()Z
    move-result p2
    if-eqz p2, :L4
  .line 154
    sget p2, Lcom/innioasis/ipp/SongRows;->dbgReqAfter:I
    add-int/lit8 p2, p2, 1
    sput p2, Lcom/innioasis/ipp/SongRows;->dbgReqAfter:I
  .line 155
    sget-object p2, Lcom/innioasis/ipp/SongRows;->dbgWho:Ljava/lang/String;
    if-nez p2, :L4
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    new-instance p2, Ljava/lang/StringBuilder;
    invoke-direct { p2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/SongRows;->who(Landroid/view/View;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    sput-object p1, Lcom/innioasis/ipp/SongRows;->dbgWho:Ljava/lang/String;
  :L4
  .line 157
    sget-wide p1, Lcom/innioasis/ipp/SongRows;->dbgBindMs:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sub-long/2addr v2, v0
    add-long/2addr p1, v2
    sput-wide p1, Lcom/innioasis/ipp/SongRows;->dbgBindMs:J
  :L5
  .line 159
    goto :L7
  :L6
  .line 158
    move-exception p1
  :L7
  .line 160
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
  .registers 5
  .line 138
    const/4 v0, 1
    if-ne p2, v0, :L2
  .line 139
    iget-object p2, p0, Lcom/innioasis/ipp/SongRows;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eqz p2, :L0
    invoke-virtual { p2 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getParent()Landroid/view/ViewParent;
    move-result-object p2
    if-nez p2, :L0
    iget-object p1, p0, Lcom/innioasis/ipp/SongRows;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    goto :L1
  :L0
    new-instance p2, Landroid/view/View;
    invoke-virtual { p1 }, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;
    move-result-object p1
    invoke-direct { p2, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    move-object p1, p2
  :L1
  .line 140
    new-instance p2, Lcom/innioasis/ipp/SongRows$HeadHolder;
    invoke-direct { p2, p1 }, Lcom/innioasis/ipp/SongRows$HeadHolder;-><init>(Landroid/view/View;)V
    return-object p2
  :L2
  .line 142
    sget p2, Lcom/innioasis/ipp/SongRows;->dbgMade:I
    add-int/2addr p2, v0
    sput p2, Lcom/innioasis/ipp/SongRows;->dbgMade:I
  .line 143
    new-instance p2, Lcom/innioasis/ipp/SongRows$Holder;
    invoke-virtual { p1 }, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;
    move-result-object v0
    const/4 v1, 0
    invoke-static { v0, p1, v1 }, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/innioasis/y1/databinding/ItemSonglistBinding;
    move-result-object p1
    invoke-direct { p2, p1 }, Lcom/innioasis/ipp/SongRows$Holder;-><init>(Lcom/innioasis/y1/databinding/ItemSonglistBinding;)V
    return-object p2
.end method

.method shuffle()Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .registers 2
  .line 93
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    return-object v0
.end method

.method public ticked(I)Z
  .registers 4
  .line 190
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/SongListAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v0
  .line 191
    const/4 v1, 1
    if-lt p1, v1, :L0
    if-eqz v0, :L0
    sub-int/2addr p1, v1
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-interface { v0, p1 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L0
    goto :L1
  :L0
    const/4 v1, 0
  :L1
    return v1
.end method

.class public final Lcom/innioasis/ipp/SongRows;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.implements Lcom/innioasis/ipp/Bar$Cursor;
.implements Lcom/innioasis/ipp/Bar$Ticks;
.source "SongRows.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/SongRows$Watch;,
    Lcom/innioasis/ipp/SongRows$Gap;,
    Lcom/innioasis/ipp/SongRows$Plate;,
    Lcom/innioasis/ipp/SongRows$HeadHolder;,
    Lcom/innioasis/ipp/SongRows$Holder;,
    Lcom/innioasis/ipp/SongRows$ItemHolder;,
    Lcom/innioasis/ipp/SongRows$Shown;,
    Lcom/innioasis/ipp/SongRows$Reveal;
  }
.end annotation

.field private final static HEAD:I = 1

.field private final static HEADS:Ljava/util/WeakHashMap;

.field private final static MODELS:Ljava/util/WeakHashMap;

.field private final static POOL:I = 16

.field private final static REVEAL:Lcom/innioasis/ipp/SongRows$Reveal;

.field private final static ROW:I

.field private final static SPVS:Ljava/util/WeakHashMap;

.field private final static TYPES:Ljava/util/HashMap;

.field private static volatile deleted:I

.field private idBase:J

.field private final list:Ljava/lang/ref/WeakReference;

.field private final model:Lcom/innioasis/music/adapter/MyBaseAdapter;

.field private final rowType:I

.field private final spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;

.method static constructor <clinit>()V
  .registers 1
  .line 59
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/SongRows;->TYPES:Ljava/util/HashMap;
  .line 103
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/SongRows;->MODELS:Ljava/util/WeakHashMap;
  .line 134
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/SongRows;->SPVS:Ljava/util/WeakHashMap;
  .line 484
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/SongRows;->deleted:I
  .line 567
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/SongRows;->HEADS:Ljava/util/WeakHashMap;
  .line 569
    new-instance v0, Lcom/innioasis/ipp/SongRows$Reveal;
    invoke-direct { v0 }, Lcom/innioasis/ipp/SongRows$Reveal;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/SongRows;->REVEAL:Lcom/innioasis/ipp/SongRows$Reveal;
    return-void
.end method

.method private constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/view/ShufflePlaylistItemView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 51
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V
  .line 52
    iput-object p3, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 53
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/SongRows;->list:Ljava/lang/ref/WeakReference;
  .line 54
    instance-of p1, p3, Lcom/innioasis/music/adapter/SongListAdapter;
  .line 55
    if-nez p1, :L1
    instance-of v0, p3, Lcom/innioasis/y1/adapter/AudiobookAdapter;
    if-eqz v0, :L0
    goto :L1
  :L0
    const/4 p2, 0
  :L1
    iput-object p2, p0, Lcom/innioasis/ipp/SongRows;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 56
    if-eqz p1, :L2
    const/4 p1, 0
    goto :L3
  :L2
    invoke-virtual { p3 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/SongRows;->typeOf(Ljava/lang/Class;)I
    move-result p1
  :L3
    iput p1, p0, Lcom/innioasis/ipp/SongRows;->rowType:I
  .line 57
    return-void
.end method

.method static synthetic access$000(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
  .registers 1
  .line 37
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->plate(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$100(Landroid/view/View;)I
  .registers 1
  .line 37
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->plateHeight(Landroid/view/View;)I
    move-result p0
    return p0
.end method

.method static synthetic access$200(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 1
  .line 37
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->headBottom(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/SongRows;)Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 1
  .line 37
    iget-object p0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    return-object p0
.end method

.method public static adapter(Landroidx/recyclerview/widget/RecyclerView;)Landroid/widget/ListAdapter;
  .registers 1
  .line 143
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
  .line 144
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    iget-object p0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
  :L1
    return-object p0
.end method

.method private static albumTinted(Landroid/view/View;)Z
  .registers 3
  .line 363
    const v0, 2131361870
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 364
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 365
    const v1, 2131361978
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 366
    instance-of v1, p0, Landroid/widget/ImageView;
    if-eqz v1, :L1
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getColorFilter()Landroid/graphics/ColorFilter;
    move-result-object v1
    if-eqz v1, :L1
  .line 367
    check-cast v0, Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L1
  .line 369
    const/4 p0, 1
    return p0
.end method

.method public static attach(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/music/adapter/SongListAdapter;)V
  .registers 2
  .line 72
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->set(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/ListAdapter;)V
  .line 73
    return-void
.end method

.method private bindItem(Landroid/view/View;I)V
  .registers 5
  .line 248
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
    invoke-virtual { v0, p2, p1, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
  .line 249
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 250
    return-void
.end method

.method private bindRow(Lcom/innioasis/ipp/SongRows$Holder;I)V
  .registers 13
  .line 271
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    check-cast v0, Lcom/innioasis/music/adapter/SongListAdapter;
  .line 272
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
  .line 273
    invoke-static { v0 }, Lcom/innioasis/ipp/ListWatch;->tick(Landroid/widget/BaseAdapter;)V
  .line 274
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Follow;->note(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/ViewGroup;)V
  .line 275
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Disc;->note(Ljava/lang/Object;Landroid/view/View;)V
  .line 276
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getItemList()Ljava/util/List;
    move-result-object v2
  .line 277
    invoke-interface { v2, p2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 278
    iget-object p1, p1, Lcom/innioasis/ipp/SongRows$Holder;->b:Lcom/innioasis/y1/databinding/ItemSonglistBinding;
  .line 279
    invoke-virtual { p1 }, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;
    move-result-object v4
  .line 280
    invoke-static { v4, v2, p2, v0 }, Lcom/innioasis/ipp/Disc;->bind(Landroid/view/View;Ljava/util/List;ILjava/lang/Object;)V
  .line 281
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongIndex:Landroid/widget/TextView;
    invoke-static { v3, v2, p2, v0 }, Lcom/innioasis/ipp/Disc;->rowIndex(Lcom/innioasis/y1/database/Song;Ljava/util/List;ILjava/lang/Object;)Ljava/lang/String;
    move-result-object v6
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Rows;->text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .line 282
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongIndex:Landroid/widget/TextView;
    invoke-static { v5, v2, v0 }, Lcom/innioasis/ipp/Rows;->indexWidth(Landroid/widget/TextView;Ljava/util/List;Ljava/lang/Object;)V
  .line 283
    iget-object v2, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v2
    const-string v5, "meta_title"
    invoke-static { v2, v5 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L0
  .line 284
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v2, v5 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    goto :L1
  :L0
  .line 285
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    sget-object v5, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v2, v5 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  :L1
  .line 286
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    invoke-static { v5, v2 }, Lcom/innioasis/ipp/Rows;->text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .line 287
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 288
    sget-object v5, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5, v6 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 289
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getCanShowTime()Z
    move-result v5
    const-string v6, "     "
    if-eqz v5, :L2
  .line 290
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 291
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
  .line 293
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getCanShowAlbum()Z
    move-result v5
    if-eqz v5, :L3
  .line 294
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 295
    sget-object v5, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v5, v3 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L3
  .line 297
    iget-object v3, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvArtists:Landroid/widget/TextView;
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static { v3, v2 }, Lcom/innioasis/ipp/Rows;->text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .line 299
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
  .line 300
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v3
  .line 302
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->on(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v1
  .line 304
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getPosition()I
    move-result v5
    const v6, 2131231050
    const/4 v7, 0
    const/4 v8, 1
    if-ne p2, v5, :L5
  .line 305
    iget-object v2, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    invoke-static { v2 }, Lcom/innioasis/ipp/Scroll;->rowText(Landroid/widget/TextView;)V
  .line 306
    if-nez v1, :L4
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v4, v6, v8 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L4
  .line 307
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->rightArrow:Landroid/widget/ImageView;
    const v6, 2131623981
    invoke-virtual { v2, v5, v6 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetRightArrow(Landroid/widget/ImageView;I)V
  .line 308
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->rightArrow:Landroid/widget/ImageView;
    invoke-virtual { v2, v5 }, Lcom/innioasis/music/util/Other;->showV(Landroid/view/View;)V
  .line 309
    goto :L7
  :L5
  .line 310
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v5
    invoke-static { p2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-interface { v5, v9 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L8
  .line 311
    iget-object v2, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    invoke-static { v2 }, Lcom/innioasis/ipp/Scroll;->rowPlain(Landroid/widget/TextView;)V
  .line 312
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->rightArrow:Landroid/widget/ImageView;
    invoke-virtual { v2, v5 }, Lcom/innioasis/music/util/Other;->hideV(Landroid/view/View;)V
  .line 313
    if-nez v1, :L6
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v4, v6, v8 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L6
  .line 314
    nop
  :L7
  .line 321
    move v2, v3
    goto :L10
  :L8
  .line 316
    iget-object v5, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->rowPlain(Landroid/widget/TextView;)V
  .line 317
    sget-object v5, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    iget-object v6, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->rightArrow:Landroid/widget/ImageView;
    invoke-virtual { v5, v6 }, Lcom/innioasis/music/util/Other;->hideV(Landroid/view/View;)V
  .line 318
    if-nez v1, :L9
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v6, 2131231044
    invoke-virtual { v5, v4, v6, v7 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L9
  .line 319
    const v5, 2131100267
    invoke-virtual { v2, v5 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  :L10
  .line 321
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongIndex:Landroid/widget/TextView;
    if-ne v2, v3, :L11
    const/4 v9, 1
    goto :L12
  :L11
    const/4 v9, 0
  :L12
    invoke-virtual { v5, v6, v2, v9 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 322
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvSongName:Landroid/widget/TextView;
    if-ne v2, v3, :L13
    const/4 v9, 1
    goto :L14
  :L13
    const/4 v9, 0
  :L14
    invoke-virtual { v5, v6, v2, v9 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 323
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object p1, p1, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->tvArtists:Landroid/widget/TextView;
    if-ne v2, v3, :L15
    const/4 v7, 1
  :L15
    invoke-virtual { v5, p1, v2, v7 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 324
    invoke-static { v4, p2, v0 }, Lcom/innioasis/ipp/Rows;->songMark(Landroid/view/View;ILjava/lang/Object;)V
  .line 325
    if-nez v1, :L16
    invoke-static { v4 }, Lcom/innioasis/ipp/Rows;->flat(Landroid/view/View;)V
  :L16
  .line 326
    invoke-static { v4 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 327
    return-void
.end method

.method public static cancel(Landroidx/recyclerview/widget/RecyclerView;[Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 541
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
  .line 542
    if-eqz p0, :L6
    if-nez p1, :L0
    goto :L6
  :L0
  .line 543
    const/4 v0, 0
  :L1
    array-length v1, p1
    if-ge v0, v1, :L5
  .line 544
    aget-object v1, p1, v0
    iget-object v2, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eq v1, v2, :L2
    goto :L4
  :L2
  .line 545
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 546
    if-eqz v1, :L3
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L3
  .line 547
    iget-object v1, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  :L4
  .line 543
    add-int/lit8 v0, v0, 1
    goto :L1
  :L5
  .line 549
    return-void
  :L6
  .line 542
    return-void
.end method

.method public static deleting(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 5
  .line 488
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  :L1
  .line 489
    nop
  .line 490
    const/4 v0, -1
    const/4 v1, 0
  :L2
    if-eqz p0, :L6
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L6
  .line 491
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 492
    instance-of v3, v2, Ljava/lang/Integer;
    if-nez v3, :L3
    goto :L5
  :L3
  .line 493
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 494
    if-ltz v2, :L5
    if-ltz v0, :L4
    if-ge v2, v0, :L5
  :L4
    move v0, v2
  :L5
  .line 490
    add-int/lit8 v1, v1, 1
    goto :L2
  :L6
  .line 496
    sput v0, Lcom/innioasis/ipp/SongRows;->deleted:I
  .line 497
    return-void
.end method

.method private static fileTinted(Landroid/view/View;)V
  .registers 4
  .line 348
    const v0, 2131362042
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 349
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L2
  .line 350
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->albumTinted(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 351
    const v0, 2131362492
    const v1, 2131362559
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/SongRows;->markTinted(Landroid/view/View;II)Z
    move-result v0
    if-nez v0, :L1
    const v0, 2131362491
    const v1, 2131362556
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/SongRows;->markTinted(Landroid/view/View;II)Z
  :L1
  .line 352
    return-void
  :L2
  .line 354
    check-cast v0, Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
  .line 355
    const v1, 2131362550
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 356
    instance-of v2, v1, Landroid/widget/ImageView;
    if-eqz v2, :L3
    invoke-virtual { v1 }, Landroid/view/View;->getVisibility()I
    move-result v2
    if-nez v2, :L3
    check-cast v1, Landroid/widget/ImageView;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L3
  .line 357
    const v1, 2131362159
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 358
    instance-of v1, p0, Landroid/widget/ImageView;
    if-eqz v1, :L4
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getColorFilter()Landroid/graphics/ColorFilter;
    move-result-object v1
    if-eqz v1, :L4
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L4
  .line 359
    return-void
.end method

.method public static go(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .registers 3
  .line 149
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 150
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->set(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/ListAdapter;)V
  .line 151
    if-ltz p2, :L1
    invoke-virtual { p1, p2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  :L1
  .line 152
    if-ltz p2, :L2
    goto :L3
  :L2
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p2
  :L3
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/SongRows;->select(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 153
    return-void
  :L4
  .line 149
    return-void
.end method

.method private static headBottom(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 4
  .line 411
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 412
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    iget-object v0, v0, Lcom/innioasis/ipp/SongRows;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  :L1
  .line 413
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v1
  .line 414
    if-eqz v0, :L3
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    if-eq v2, p0, :L2
    goto :L3
  :L2
  .line 415
    invoke-virtual { v0 }, Landroid/view/View;->getBottom()I
    move-result p0
    invoke-static { v1, p0 }, Ljava/lang/Math;->max(II)I
    move-result p0
    return p0
  :L3
  .line 414
    return v1
.end method

.method static heads(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 1
  .line 173
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
  .line 174
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->heads()I
    move-result p0
  :L1
    return p0
.end method

.method public static kept(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 4
  .line 505
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 506
    if-nez v0, :L0
    return-void
  :L0
  .line 507
    sget v1, Lcom/innioasis/ipp/SongRows;->deleted:I
    if-ltz v1, :L1
    sget p1, Lcom/innioasis/ipp/SongRows;->deleted:I
  :L1
  .line 508
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/SongRows;->deleted:I
  .line 509
    iget-object v0, v0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    add-int/lit8 v1, v1, -1
    invoke-static { p1, v1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    invoke-virtual { v0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 510
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .line 511
    new-instance p1, Lcom/innioasis/ipp/SongRows$Shown;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/SongRows$Shown;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  .line 512
    return-void
.end method

.method private static markTinted(Landroid/view/View;II)Z
  .registers 3
  .line 374
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  .line 375
    invoke-virtual { p0, p2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 376
    instance-of p2, p1, Landroid/widget/TextView;
    if-eqz p2, :L2
    instance-of p2, p0, Landroid/widget/ImageView;
    if-nez p2, :L0
    goto :L2
  :L0
  .line 377
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-nez p2, :L1
    check-cast p0, Landroid/widget/ImageView;
    check-cast p1, Landroid/widget/TextView;
    invoke-virtual { p1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L1
  .line 378
    const/4 p0, 1
    return p0
  :L2
  .line 376
    const/4 p0, 0
    return p0
.end method

.method static moving(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 7
  .line 199
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 200
    if-eqz v0, :L3
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-nez v1, :L0
    goto :L3
  :L0
  .line 201
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 202
    invoke-virtual { v2 }, Landroid/view/View;->getHeight()I
    move-result v3
  .line 203
    if-gtz v3, :L1
    return-void
  :L1
  .line 205
    add-int/2addr p2, v3
    add-int/lit8 p2, p2, -1
    invoke-static { v1, p2 }, Ljava/lang/Math;->max(II)I
    move-result p2
    div-int/2addr p2, v3
  .line 206
    invoke-virtual { p0, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result p0
  .line 207
    sub-int/2addr p1, p2
    sub-int/2addr p0, p1
  .line 208
    if-nez p0, :L2
    return-void
  :L2
  .line 209
    iget-wide p1, v0, Lcom/innioasis/ipp/SongRows;->idBase:J
    int-to-long v1, p0
    add-long/2addr p1, v1
    iput-wide p1, v0, Lcom/innioasis/ipp/SongRows;->idBase:J
  .line 211
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->notifyDataSetChanged()V
  .line 212
    return-void
  :L3
  .line 200
    return-void
.end method

.method static of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
  .registers 3
  .line 137
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  :L1
  .line 138
    instance-of v1, p0, Lcom/innioasis/ipp/SongRows;
    if-eqz v1, :L2
    move-object v0, p0
    check-cast v0, Lcom/innioasis/ipp/SongRows;
  :L2
    return-object v0
.end method

.method static pinTop(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 2
  .line 439
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v0
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->plate(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->plateHeight(Landroid/view/View;)I
    move-result p0
    add-int/2addr v0, p0
    return v0
.end method

.method private static plate(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
  .registers 4
  .line 398
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 399
    instance-of v0, p0, Landroid/view/View;
    const/4 v1, 0
    if-eqz v0, :L0
    move-object v0, p0
    check-cast v0, Landroid/view/View;
    const v2, 2131362548
    invoke-virtual { v0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    goto :L1
  :L0
    move-object v0, v1
  :L1
  .line 400
    if-eqz v0, :L3
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    if-eq v2, p0, :L2
    goto :L3
  :L2
    move-object v1, v0
  :L3
    return-object v1
.end method

.method static plateChanged(Landroid/view/View;)V
  .registers 2
  .line 444
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
    if-eqz v0, :L0
  .line 445
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidateItemDecorations()V
  :L0
  .line 447
    return-void
.end method

.method private static plateHeight(Landroid/view/View;)I
  .registers 3
  .line 404
    if-eqz p0, :L3
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-eqz v0, :L0
    goto :L3
  :L0
  .line 405
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 406
    if-eqz v0, :L1
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-lez v1, :L1
    iget p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    goto :L2
  :L1
    invoke-virtual { p0 }, Landroid/view/View;->getHeight()I
    move-result p0
  :L2
    return p0
  :L3
  .line 404
    const/4 p0, 0
    return p0
.end method

.method static plateSpan(Landroidx/recyclerview/widget/RecyclerView;)[I
  .registers 2
  .line 431
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->plate(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->plateHeight(Landroid/view/View;)I
    move-result v0
  .line 432
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 433
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->headBottom(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
  .line 434
    add-int/2addr v0, p0
    filled-new-array { p0, v0 }, [I
    move-result-object p0
    return-object p0
.end method

.method static reveal(Lcom/innioasis/y1/view/ShufflePlaylistItemView;)V
  .registers 4
  .line 556
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    sget-object v1, Lcom/innioasis/ipp/SongRows;->HEADS:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  :L1
  .line 557
    if-nez v1, :L2
    move-object v1, v0
    goto :L3
  :L2
    check-cast v1, Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/SongRows;
  :L3
  .line 558
    if-nez v1, :L4
    goto :L5
  :L4
    invoke-virtual { v1 }, Lcom/innioasis/ipp/SongRows;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v0
  :L5
  .line 559
    if-eqz v0, :L8
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v2
    if-eq v2, v1, :L6
    goto :L8
  :L6
  .line 561
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
  .line 562
    sget-object p0, Lcom/innioasis/ipp/SongRows;->REVEAL:Lcom/innioasis/ipp/SongRows$Reveal;
    invoke-virtual { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 563
    invoke-virtual { p0, v0 }, Lcom/innioasis/ipp/SongRows$Reveal;->at(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows$Reveal;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  .line 564
    return-void
  :L8
  .line 559
    return-void
.end method

.method public static row(Landroidx/recyclerview/widget/RecyclerView;I)Landroid/view/View;
  .registers 2
  .line 383
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
  .line 388
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
    if-nez v0, :L0
    return-void
  :L0
  .line 389
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .line 390
    if-gtz p1, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->rest(Landroid/view/View;)V
    goto :L2
  :L1
  .line 391
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Lv;->pin(Landroid/view/View;I)V
  :L2
  .line 392
    return-void
.end method

.method public static set(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/ListAdapter;)V
  .registers 5
  .line 77
    if-eqz p0, :L8
    instance-of v0, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    goto :L8
  :L0
  .line 78
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 79
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 80
    if-eqz v0, :L1
    iget-object v1, v0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-ne v1, p1, :L1
  .line 81
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->notifyDataSetChanged()V
  .line 82
    return-void
  :L1
  .line 84
    if-nez v0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->setUp(Landroidx/recyclerview/widget/RecyclerView;)V
  :L2
  .line 85
    sget-object v0, Lcom/innioasis/ipp/SongRows;->MODELS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p1 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 86
    if-nez v1, :L3
    const/4 v1, 0
    goto :L4
  :L3
    check-cast v1, Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/SongRows;
  :L4
  .line 87
    if-eqz v1, :L5
    invoke-virtual { v1 }, Lcom/innioasis/ipp/SongRows;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v2
    if-eq v2, p0, :L6
  :L5
  .line 88
    new-instance v1, Lcom/innioasis/ipp/SongRows;
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->shuffleOf(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object v2
    invoke-direct { v1, p0, v2, p1 }, Lcom/innioasis/ipp/SongRows;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/y1/view/ShufflePlaylistItemView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .line 90
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Lcom/innioasis/ipp/SongRows;->setHasStableIds(Z)V
  .line 91
    new-instance v2, Lcom/innioasis/ipp/SongRows$Watch;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/SongRows$Watch;-><init>(Lcom/innioasis/ipp/SongRows;)V
    invoke-virtual { p1, v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V
  .line 92
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v0, p1, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L6
  .line 94
    iget-object p1, v1, Lcom/innioasis/ipp/SongRows;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eqz p1, :L7
    sget-object v0, Lcom/innioasis/ipp/SongRows;->HEADS:Ljava/util/WeakHashMap;
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v0, p1, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 97
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getRecycledViewPool()Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;
    move-result-object p1
    iget v0, v1, Lcom/innioasis/ipp/SongRows;->rowType:I
    const/16 v2, 16
    invoke-virtual { p1, v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V
  .line 98
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 99
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->tune(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 100
    return-void
  :L8
  .line 77
    return-void
.end method

.method private static setUp(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 106
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
    instance-of v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v0, :L0
  .line 107
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  :L0
  .line 109
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->plate(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L1
  .line 110
    new-instance v0, Lcom/innioasis/ipp/SongRows$Gap;
    invoke-direct { v0 }, Lcom/innioasis/ipp/SongRows$Gap;-><init>()V
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 111
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/SongRows$Plate;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/SongRows$Plate;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 113
    return-void
.end method

.method private static shuffleOf(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .registers 6
  .line 117
    sget-object v0, Lcom/innioasis/ipp/SongRows;->SPVS:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 118
    const/4 v2, 0
    if-nez v1, :L0
    move-object v1, v2
    goto :L1
  :L0
    check-cast v1, Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L1
  .line 119
    instance-of v3, v1, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eqz v3, :L2
    check-cast v1, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    return-object v1
  :L2
  .line 120
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getParent()Landroid/view/ViewParent;
    move-result-object v1
  .line 121
    instance-of v3, v1, Landroid/view/View;
    if-eqz v3, :L3
    check-cast v1, Landroid/view/View;
    const v3, 2131362396
    invoke-virtual { v1, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
    goto :L4
  :L3
    move-object v1, v2
  :L4
  .line 122
    instance-of v3, v1, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-nez v3, :L5
    return-object v2
  :L5
  .line 123
    check-cast v1, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .line 124
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    instance-of v2, v2, Landroid/view/ViewGroup;
    if-eqz v2, :L8
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    if-eq v2, p0, :L8
  .line 125
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    if-nez v2, :L6
    const/4 v2, -2
    goto :L7
  :L6
  .line 126
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I
  :L7
  .line 127
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/ViewGroup;
    invoke-virtual { v3, v1 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  .line 128
    new-instance v3, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    const/4 v4, -1
    invoke-direct { v3, v4, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v3 }, Lcom/innioasis/y1/view/ShufflePlaylistItemView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L8
  .line 130
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    invoke-virtual { v0, p0, v2 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 131
    return-object v1
.end method

.method static tinted(Landroid/view/View;)V
  .registers 4
  .line 331
    const v0, 2131362500
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 332
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L0
  .line 333
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->fileTinted(Landroid/view/View;)V
  .line 334
    return-void
  :L0
  .line 336
    check-cast v0, Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
  .line 337
    const v1, 2131362551
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 338
    instance-of v2, v1, Landroid/widget/ImageView;
    if-eqz v2, :L1
    invoke-virtual { v1 }, Landroid/view/View;->getVisibility()I
    move-result v2
    if-nez v2, :L1
    check-cast v1, Landroid/widget/ImageView;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L1
  .line 339
    instance-of v1, p0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eqz v1, :L2
    const v1, 2131362087
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    goto :L3
  :L2
    const/4 p0, 0
  :L3
  .line 340
    instance-of v1, p0, Landroid/widget/ImageView;
    if-eqz v1, :L4
    check-cast p0, Landroid/widget/ImageView;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L4
  .line 341
    return-void
.end method

.method static top(Landroidx/recyclerview/widget/RecyclerView;I)I
  .registers 4
  .line 423
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v0
  .line 424
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v1
    if-ge p1, v1, :L0
    return v0
  :L0
  .line 425
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->plate(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/SongRows;->plateHeight(Landroid/view/View;)I
    move-result p1
  .line 426
    if-nez p1, :L1
    goto :L2
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->headBottom(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    add-int v0, p0, p1
  :L2
    return v0
.end method

.method private static typeOf(Ljava/lang/Class;)I
  .registers 3
  .line 62
    sget-object v0, Lcom/innioasis/ipp/SongRows;->TYPES:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 63
    if-nez v1, :L0
  .line 64
    invoke-virtual { v0 }, Ljava/util/HashMap;->size()I
    move-result v1
    add-int/lit8 v1, v1, 2
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
  .line 65
    invoke-virtual { v0, p0, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 67
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result p0
    return p0
.end method

.method public cursor()I
  .registers 3
  .line 254
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->heads()I
    move-result v1
    add-int/2addr v0, v1
    return v0
.end method

.method public getItemCount()I
  .registers 3
  .line 178
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 179
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->heads()I
    move-result v1
    add-int/2addr v0, v1
  :L1
    return v0
.end method

.method public getItemId(I)J
  .registers 6
  .line 189
    int-to-long v0, p1
    iget-wide v2, p0, Lcom/innioasis/ipp/SongRows;->idBase:J
    add-long/2addr v0, v2
    return-wide v0
.end method

.method public getItemViewType(I)I
  .registers 3
  .line 215
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->heads()I
    move-result v0
    if-ge p1, v0, :L0
    const/4 p1, 1
    goto :L1
  :L0
    iget p1, p0, Lcom/innioasis/ipp/SongRows;->rowType:I
  :L1
    return p1
.end method

.method heads()I
  .registers 2
  .line 169
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    const/4 v0, 1
  :L1
    return v0
.end method

.method list()Landroidx/recyclerview/widget/RecyclerView;
  .registers 2
  .line 164
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->list:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    return-object v0
.end method

.method model()Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 2
  .line 156
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    return-object v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  :L0
  .line 239
    instance-of v0, p1, Lcom/innioasis/ipp/SongRows$Holder;
    if-eqz v0, :L1
    check-cast p1, Lcom/innioasis/ipp/SongRows$Holder;
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->heads()I
    move-result v0
    sub-int/2addr p2, v0
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/SongRows;->bindRow(Lcom/innioasis/ipp/SongRows$Holder;I)V
    goto :L3
  :L1
  .line 240
    instance-of v0, p1, Lcom/innioasis/ipp/SongRows$ItemHolder;
    if-eqz v0, :L2
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->heads()I
    move-result v0
    sub-int/2addr p2, v0
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/SongRows;->bindItem(Landroid/view/View;I)V
    goto :L3
  :L2
  .line 241
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  :L3
  .line 243
    goto :L5
  :L4
  .line 242
    move-exception p1
  :L5
  .line 244
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
  .registers 5
  .line 219
    const/4 v0, 1
    if-ne p2, v0, :L2
  .line 220
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
  .line 221
    new-instance p2, Lcom/innioasis/ipp/SongRows$HeadHolder;
    invoke-direct { p2, p1 }, Lcom/innioasis/ipp/SongRows$HeadHolder;-><init>(Landroid/view/View;)V
    return-object p2
  :L2
  .line 223
    const/4 v0, 0
    if-nez p2, :L3
  .line 224
    new-instance p2, Lcom/innioasis/ipp/SongRows$Holder;
    invoke-virtual { p1 }, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-static { v1 }, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;
    move-result-object v1
    invoke-static { v1, p1, v0 }, Lcom/innioasis/y1/databinding/ItemSonglistBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/innioasis/y1/databinding/ItemSonglistBinding;
    move-result-object p1
    invoke-direct { p2, p1 }, Lcom/innioasis/ipp/SongRows$Holder;-><init>(Lcom/innioasis/y1/databinding/ItemSonglistBinding;)V
    return-object p2
  :L3
  .line 227
    iget-object p2, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    invoke-virtual { p2, v0, v1, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    move-result-object p1
  .line 228
    invoke-virtual { p1 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p2
  .line 229
    instance-of v0, p2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    if-nez v0, :L6
  .line 231
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
  .line 232
    if-eqz p2, :L4
    iget p2, p2, Landroid/view/ViewGroup$LayoutParams;->height:I
    goto :L5
  :L4
    const/4 p2, -2
  :L5
    const/4 v1, -1
    invoke-direct { v0, v1, p2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V
  .line 231
    invoke-virtual { p1, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L6
  .line 234
    new-instance p2, Lcom/innioasis/ipp/SongRows$ItemHolder;
    invoke-direct { p2, p1 }, Lcom/innioasis/ipp/SongRows$ItemHolder;-><init>(Landroid/view/View;)V
    return-object p2
.end method

.method shuffle()Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .registers 2
  .line 160
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->spv:Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    return-object v0
.end method

.method public ticked(I)Z
  .registers 7
  .line 258
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows;->model:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v0
  .line 259
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->heads()I
    move-result v1
    const/4 v2, 0
    if-lt p1, v1, :L4
    if-eqz v0, :L4
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L0
    goto :L4
  :L0
  .line 261
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->heads()I
    move-result v1
    sub-int/2addr p1, v1
  .line 262
    const/4 v1, 0
  :L1
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v1, v3, :L3
  .line 263
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 264
    instance-of v4, v3, Ljava/lang/Integer;
    if-eqz v4, :L2
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    if-ne v3, p1, :L2
    const/4 p1, 1
    return p1
  :L2
  .line 262
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 266
    return v2
  :L4
  .line 259
    return v2
.end method

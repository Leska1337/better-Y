.class public final Lcom/innioasis/ipp/Wheel;
.super Ljava/lang/Object;
.source "Wheel.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Wheel$Repaint;,
    Lcom/innioasis/ipp/Wheel$Fit;,
    Lcom/innioasis/ipp/Wheel$Rest;,
    Lcom/innioasis/ipp/Wheel$Now;
  }
.end annotation

.field private final static FIT:Lcom/innioasis/ipp/Wheel$Fit;

.field private final static NOW:Lcom/innioasis/ipp/Wheel$Now;

.field private final static PANEL_MS:I = 70

.field private final static REPAINT:Lcom/innioasis/ipp/Wheel$Repaint;

.field private final static REST:Lcom/innioasis/ipp/Wheel$Rest;

.field private static busy:Z

.field private static fitLv:Ljava/lang/ref/WeakReference;

.field private static fitPos:I

.field private static lastAdapter:Ljava/lang/ref/WeakReference;

.field private static lastPos:I

.field private static lastRv:Ljava/lang/ref/WeakReference;

.field private final static level:Ljava/util/WeakHashMap;

.field private static noFast:Ljava/lang/ref/WeakReference;

.field private static painted:Ljava/lang/String;

.field private static painting:Z

.field private static panelAt:J

.field private static panelHost:Ljava/lang/ref/WeakReference;

.field private static panelTitle:Ljava/lang/String;

.field private static pendFrom:I

.field private static pendLv:Ljava/lang/ref/WeakReference;

.field private static pendOn:Z

.field private static restPos:I

.field private static restRv:Ljava/lang/ref/WeakReference;

.field private static tuned:Ljava/lang/ref/WeakReference;

.field private static tunedLm:Ljava/lang/ref/WeakReference;

.method static constructor <clinit>()V
  .registers 2
  .line 47
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 66
    new-instance v1, Lcom/innioasis/ipp/Wheel$Repaint;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Wheel$Repaint;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->REPAINT:Lcom/innioasis/ipp/Wheel$Repaint;
  .line 203
    sput v0, Lcom/innioasis/ipp/Wheel;->fitPos:I
  .line 204
    new-instance v1, Lcom/innioasis/ipp/Wheel$Fit;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Wheel$Fit;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->FIT:Lcom/innioasis/ipp/Wheel$Fit;
  .line 239
    sput v0, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 241
    new-instance v0, Lcom/innioasis/ipp/Wheel$Rest;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Rest;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
  .line 242
    new-instance v0, Lcom/innioasis/ipp/Wheel$Now;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Now;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->NOW:Lcom/innioasis/ipp/Wheel$Now;
  .line 527
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 24
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 24
    sget-object v0, Lcom/innioasis/ipp/Wheel;->fitLv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$002(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 24
    sput-object p0, Lcom/innioasis/ipp/Wheel;->fitLv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$100()I
  .registers 1
  .line 24
    sget v0, Lcom/innioasis/ipp/Wheel;->fitPos:I
    return v0
.end method

.method static synthetic access$1000(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
  .registers 5
  .line 24
    invoke-static { p0, p1, p2, p3, p4 }, Lcom/innioasis/ipp/Wheel;->bind(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
    move-result p0
    return p0
.end method

.method static synthetic access$102(I)I
  .registers 1
  .line 24
    sput p0, Lcom/innioasis/ipp/Wheel;->fitPos:I
    return p0
.end method

.method static synthetic access$200()J
  .registers 2
  .line 24
    sget-wide v0, Lcom/innioasis/ipp/Wheel;->panelAt:J
    return-wide v0
.end method

.method static synthetic access$300()V
  .registers 0
  .line 24
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->paintPanel()V
    return-void
.end method

.method static synthetic access$402(Z)Z
  .registers 1
  .line 24
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->busy:Z
    return p0
.end method

.method static synthetic access$502(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 24
    sput-object p0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$600()Z
  .registers 1
  .line 24
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->pendOn:Z
    return v0
.end method

.method static synthetic access$700()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 24
    sget-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$800()I
  .registers 1
  .line 24
    sget v0, Lcom/innioasis/ipp/Wheel;->pendFrom:I
    return v0
.end method

.method static synthetic access$900()V
  .registers 0
  .line 24
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
    return-void
.end method

.method private static arm(Landroid/widget/ListView;I)V
  .registers 3
  .line 150
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->pendOn:Z
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L1
  :L0
  .line 151
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
  .line 152
    sput p1, Lcom/innioasis/ipp/Wheel;->pendFrom:I
  .line 153
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Wheel;->pendOn:Z
  .line 154
    sget-object p1, Lcom/innioasis/ipp/Wheel;->REPAINT:Lcom/innioasis/ipp/Wheel$Repaint;
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  :L1
  .line 156
    return-void
.end method

.method private static bind(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
  .registers 7
  .line 379
    const/4 v0, 1
    if-lt p2, p3, :L5
    if-le p2, p4, :L0
    goto :L5
  :L0
  .line 380
    const/4 p4, 0
    if-ltz p2, :L4
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-lt p2, v1, :L1
    goto :L4
  :L1
  .line 381
    sub-int p3, p2, p3
    invoke-virtual { p0, p3 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p3
  .line 382
    if-nez p3, :L2
    return p4
  :L2
  .line 383
    invoke-virtual { p1, p2, p3, p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    move-result-object p0
    if-ne p0, p3, :L3
    return v0
  :L3
  .line 384
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Wheel;->noFast:Ljava/lang/ref/WeakReference;
  .line 385
    return p4
  :L4
  .line 380
    return p4
  :L5
  .line 379
    return v0
.end method

.method static cutAtTop(Landroid/widget/ListView;II)Z
  .registers 4
  .line 179
    sub-int/2addr p1, p2
  .line 180
    const/4 p2, 0
    if-ltz p1, :L3
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L3
  :L0
  .line 181
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p1
  .line 182
    if-nez p1, :L1
    return p2
  :L1
  .line 183
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result p1
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result p0
    if-ge p1, p0, :L2
    const/4 p2, 1
  :L2
    return p2
  :L3
  .line 180
    return p2
.end method

.method private static drop()V
  .registers 1
  .line 159
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
  .line 160
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel;->pendFrom:I
  .line 161
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->pendOn:Z
  .line 162
    return-void
.end method

.method private static end(Landroid/view/View;Z)I
  .registers 4
  .line 515
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
    move-result-object v0
  .line 516
    const/4 v1, 0
    if-eqz p1, :L2
    invoke-virtual { p0 }, Landroid/view/View;->getRight()I
    move-result p0
    if-nez v0, :L0
    goto :L1
  :L0
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
  :L1
    add-int/2addr p0, v1
    return p0
  :L2
  .line 517
    invoke-virtual { p0 }, Landroid/view/View;->getBottom()I
    move-result p0
    if-nez v0, :L3
    goto :L4
  :L3
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
  :L4
    add-int/2addr p0, v1
    return p0
.end method

.method public static fast(Lcom/innioasis/y1/base/BaseActivity;)Z
  .registers 2
  .line 31
    instance-of v0, p0, Lcom/innioasis/music/SongListActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/AlbumsActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/ArtistsActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/GenresActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/FilesActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/PlaylistsActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/PlayListActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/SearchActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/SearchVideoActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/PlayerActivity;
    if-nez v0, :L1
    instance-of p0, p0, Lcom/innioasis/y1/activity/BookMarkActivity;
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method static firstShown(Landroid/widget/ListView;II)I
  .registers 6
  .line 169
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
  .line 170
    const/4 v1, 0
  :L0
    if-ge v1, v0, :L2
  .line 171
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 172
    if-eqz v2, :L1
    invoke-virtual { v2 }, Landroid/view/View;->getBottom()I
    move-result v2
    if-le v2, p2, :L1
    add-int/2addr p1, v1
    return p1
  :L1
  .line 170
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 174
    return p1
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .registers 5
  .line 396
    if-nez p0, :L0
    return-void
  :L0
  .line 397
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 398
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p3 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
  .line 399
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 400
    invoke-static { p0, p2, p3 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 401
    return-void
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  .line 405
    if-nez p0, :L0
    return-void
  :L0
  .line 408
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 409
    sget-object v1, Lcom/innioasis/ipp/Wheel;->tuned:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L1
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, p0, :L1
    sget-object v1, Lcom/innioasis/ipp/Wheel;->tunedLm:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L1
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, v0, :L2
  :L1
  .line 410
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->tuned:Ljava/lang/ref/WeakReference;
  .line 411
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->tunedLm:Ljava/lang/ref/WeakReference;
  .line 412
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V
  .line 416
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemViewCacheSize(I)V
  .line 419
    if-eqz v0, :L2
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->setItemPrefetchEnabled(Z)V
  :L2
  .line 423
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 425
    if-eqz p2, :L6
  .line 426
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v0
  .line 428
    sget-object v1, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, p0, :L3
    sget-object v1, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
  .line 429
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, p2, :L3
    sget v1, Lcom/innioasis/ipp/Wheel;->lastPos:I
    goto :L4
  :L3
    const/4 v1, -1
  :L4
  .line 432
    if-ltz v1, :L5
    invoke-static { p0, p2, v1, v0 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v1
    if-eqz v1, :L5
    invoke-static { p0, p2, p1, v0 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v0
    if-nez v0, :L6
  :L5
  .line 433
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L6
  .line 436
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 437
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
  .line 438
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 440
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L7
  .line 442
    goto :L9
  :L8
  .line 441
    move-exception p0
  :L9
  .line 443
    return-void
.end method

.method public static gotoLevel(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 6
  .line 547
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 548
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
  .line 549
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
  .line 550
    sget-object v1, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p1 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 551
    instance-of v2, v1, [I
    if-eqz v2, :L1
    check-cast v1, [I
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 552
    if-eqz v1, :L3
    const/4 v2, 0
    aget v3, v1, v2
    if-ltz v3, :L3
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result p1
    if-ge v3, p1, :L3
    const/4 p1, 2
    aget p1, v1, p1
    if-ne p1, v0, :L3
  .line 554
    aget p1, v1, v2
    const/4 v0, 1
    aget v0, v1, v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Head;->restore(Landroid/widget/ListView;II)V
    goto :L4
  :L3
  .line 556
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->setSelection(I)V
  :L4
  .line 558
    return-void
  :L5
  .line 547
    return-void
.end method

.method public static list(Landroid/widget/ListView;I)V
  .catchall { :L0 .. :L26 } :L27
  .registers 13
  .line 70
    if-nez p0, :L0
    return-void
  :L0
  .line 71
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 72
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return-void
  :L1
  .line 73
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 77
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Follow;->touched(Landroid/widget/ListView;Ljava/lang/Object;)V
  .line 80
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Alpha;->step(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
    move-result v1
    if-eqz v1, :L2
  .line 81
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
  .line 82
    return-void
  :L2
  .line 86
    invoke-static { p0 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 88
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v1
  .line 89
    invoke-virtual { p0 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result v2
  .line 90
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
  .line 93
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Loop;->fromShuffle(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
    move-result v4
    if-eqz v4, :L3
  .line 94
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
  .line 95
    return-void
  :L3
  .line 97
    const/4 v4, 1
    if-ne p1, v4, :L4
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toNext()V
    goto :L5
  :L4
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toPrevious()V
  :L5
  .line 98
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v5
  .line 99
    if-ne v5, v3, :L7
  .line 101
    invoke-static { p0, v0, p1, v3 }, Lcom/innioasis/ipp/Loop;->list(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;II)Z
    move-result p0
    if-eqz p0, :L6
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
  :L6
  .line 102
    return-void
  :L7
  .line 108
    const/4 v6, 0
    if-ne p1, v4, :L9
  .line 109
    if-lt v5, v2, :L8
    const/4 v7, 1
    goto :L12
  :L8
    const/4 v7, 0
    goto :L12
  :L9
  .line 110
    if-lt v5, v1, :L11
    invoke-static { p0, v5, v1 }, Lcom/innioasis/ipp/Wheel;->cutAtTop(Landroid/widget/ListView;II)Z
    move-result v7
    if-eqz v7, :L10
    goto :L11
  :L10
    const/4 v7, 0
    goto :L12
  :L11
    const/4 v7, 1
  :L12
  .line 111
    if-eqz v7, :L24
  .line 112
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
  .line 115
    if-ne p1, v4, :L13
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->variableRows(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L13
    const/4 v3, 1
    goto :L14
  :L13
    const/4 v3, 0
  :L14
  .line 116
    if-eqz v3, :L15
    invoke-static { p0, v5, v1 }, Lcom/innioasis/ipp/Wheel;->rowHeight(Landroid/widget/ListView;II)I
    move-result v7
    goto :L16
  :L15
    const/4 v7, 0
  :L16
  .line 118
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result v8
  .line 119
    invoke-virtual { p0 }, Landroid/widget/ListView;->getHeight()I
    move-result v9
    invoke-virtual { p0 }, Landroid/widget/ListView;->getPaddingBottom()I
    move-result v10
    sub-int/2addr v9, v10
  .line 120
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 121
    if-eqz v3, :L17
    if-lez v7, :L17
    sub-int v0, v9, v8
    if-gt v7, v0, :L17
  .line 123
    sub-int/2addr v9, v7
    invoke-static { p0, v5, v9 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
    goto :L23
  :L17
  .line 124
    if-ne p1, v4, :L22
  .line 126
    sub-int p1, v5, v2
    invoke-static { p0, v1, v8 }, Lcom/innioasis/ipp/Wheel;->firstShown(Landroid/widget/ListView;II)I
    move-result v0
    add-int/2addr p1, v0
    add-int/2addr p1, v4
  .line 127
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->headerShowing(Landroid/widget/ListView;)Z
    move-result v0
    if-eqz v0, :L18
    add-int/lit8 p1, p1, -1
  :L18
  .line 128
    if-gez p1, :L19
    goto :L20
  :L19
    move v6, p1
  :L20
  .line 129
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  .line 130
    if-eqz v3, :L21
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/Wheel;->postFit(Landroid/widget/ListView;I)V
  :L21
  .line 131
    goto :L23
  :L22
  .line 132
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  .line 133
    if-eqz v3, :L23
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/Wheel;->postFit(Landroid/widget/ListView;I)V
  :L23
  .line 135
    return-void
  :L24
  .line 138
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->skipFast(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p1
    if-eqz p1, :L25
  .line 139
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 140
    return-void
  :L25
  .line 143
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Wheel;->arm(Landroid/widget/ListView;I)V
  :L26
  .line 145
    goto :L28
  :L27
  .line 144
    move-exception p0
  :L28
  .line 146
    return-void
.end method

.method private static margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
  .registers 2
  .line 521
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p0
  .line 522
    instance-of v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v0, :L0
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return-object p0
.end method

.method public static noteLevel(Landroid/widget/ListView;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 532
    if-nez p0, :L0
    return-void
  :L0
  .line 533
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 534
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return-void
  :L1
  .line 535
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 536
    sget-object v3, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    const/4 v4, 3
    new-array v4, v4, [I
  .line 537
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result p0
    aput p0, v4, v1
  .line 538
    if-nez v2, :L2
    goto :L3
  :L2
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v1
  :L3
    const/4 p0, 1
    aput v1, v4, p0
    move-object p0, v0
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 539
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p0
    const/4 v1, 2
    aput p0, v4, v1
  .line 536
    invoke-virtual { v3, v0, v4 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 542
    goto :L6
  :L5
  .line 541
    move-exception p0
  :L6
  .line 543
    return-void
.end method

.method private static paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 451
    const/4 v0, 0
    if-ltz p2, :L6
    if-lt p2, p3, :L0
    goto :L6
  :L0
  .line 452
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p3
  .line 453
    instance-of v1, p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L1
    return v0
  :L1
  .line 454
    check-cast p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { p3, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p3
  .line 456
    const/4 v1, 1
    if-nez p3, :L2
    return v1
  :L2
  .line 457
    invoke-virtual { p0, p3 }, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object p0
  .line 458
    if-nez p0, :L3
    return v0
  :L3
  .line 459
    invoke-virtual { p1, p0, p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->bindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  :L4
  .line 460
    return v1
  :L5
  .line 461
    move-exception p0
  .line 462
    return v0
  :L6
  .line 451
    return v0
.end method

.method private static paintPanel()V
  .catchall { :L2 .. :L3 } :L4
  .registers 3
  .line 314
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Wheel;->panelAt:J
  .line 315
    invoke-static { }, Lcom/innioasis/ipp/Eq;->paint()V
  .line 316
    sget-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 317
    sget-object v2, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 318
    sput-object v1, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 319
    sput-object v1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 320
    instance-of v1, v0, Lcom/innioasis/y1/activity/SettingActivity;
    if-eqz v1, :L6
    if-eqz v2, :L6
  .line 321
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->painting:Z
  .line 323
    const/4 v1, 0
  :L2
    sput-object v2, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 324
    check-cast v0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  :L3
    goto :L5
  :L4
  .line 325
    move-exception v0
  :L5
  .line 327
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->painting:Z
  .line 328
    nop
  :L6
  .line 330
    return-void
.end method

.method public static panelShows(Ljava/lang/String;)Z
  .registers 2
  .line 309
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static panelUpdate(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 3
  .line 273
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->busy:Z
    if-eqz v0, :L1
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->painting:Z
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 278
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 279
    sput-object p1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 280
    const/4 p0, 1
    return p0
  :L1
  .line 274
    sput-object p1, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 275
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->stateShift(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)V
  .line 276
    const/4 p0, 0
    return p0
.end method

.method private static postFit(Landroid/widget/ListView;I)V
  .registers 3
  .line 207
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->fitLv:Ljava/lang/ref/WeakReference;
  .line 208
    sput p1, Lcom/innioasis/ipp/Wheel;->fitPos:I
  .line 209
    sget-object p1, Lcom/innioasis/ipp/Wheel;->FIT:Lcom/innioasis/ipp/Wheel$Fit;
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 210
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  .line 211
    return-void
.end method

.method private static postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 4
  .line 254
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
  .line 255
    sput p1, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 256
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Wheel;->busy:Z
  .line 257
    sget-object p1, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 258
    const-wide/16 v0, 70
    invoke-virtual { p0, p1, v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 259
    sget-object p1, Lcom/innioasis/ipp/Wheel;->NOW:Lcom/innioasis/ipp/Wheel$Now;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 260
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  .line 261
    return-void
.end method

.method private static rowHeight(Landroid/widget/ListView;II)I
  .registers 6
  .line 191
    sub-int v0, p1, p2
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  .line 192
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result p0
    return p0
  :L0
  .line 193
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
  .line 194
    const/4 v1, 0
    if-nez v0, :L1
    return v1
  :L1
  .line 195
    add-int/lit8 v2, v0, -1
    invoke-virtual { p0, v2 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p0
  .line 196
    if-nez p0, :L2
    return v1
  :L2
  .line 197
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->stripPx(Landroid/view/View;)I
    move-result v2
  .line 198
    invoke-virtual { p0 }, Landroid/view/View;->getHeight()I
    move-result p0
    add-int/2addr p2, v0
    add-int/lit8 p2, p2, -1
    invoke-static { p2 }, Lcom/innioasis/ipp/Disc;->startsDisc(I)Z
    move-result p2
    if-eqz p2, :L3
    move p2, v2
    goto :L4
  :L3
    const/4 p2, 0
  :L4
    sub-int/2addr p0, p2
  .line 199
    invoke-static { p1 }, Lcom/innioasis/ipp/Disc;->startsDisc(I)Z
    move-result p1
    if-eqz p1, :L5
    move v1, v2
  :L5
    add-int/2addr p0, v1
    return p0
.end method

.method private static scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 10
  .line 471
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 472
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L0
  .line 473
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  .line 474
    return-void
  :L0
  .line 476
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 477
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I
    move-result v1
  .line 478
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I
    move-result v2
  .line 479
    if-ltz v1, :L1
    if-lt p1, v1, :L1
    if-gt p1, v2, :L1
  .line 480
    return-void
  :L1
  .line 483
    const/4 v3, 1
    const/4 v4, 0
    if-ltz v1, :L3
    if-le p1, v2, :L2
    goto :L3
  :L2
    const/4 v1, 0
    goto :L4
  :L3
    const/4 v1, 1
  :L4
  .line 485
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v2
    if-nez v2, :L5
    goto :L6
  :L5
    const/4 v3, 0
  :L6
  .line 486
    if-eqz v3, :L7
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingLeft()I
    move-result v2
    goto :L8
  :L7
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v2
  :L8
  .line 487
    if-eqz v3, :L9
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingRight()I
    move-result v6
    sub-int/2addr v5, v6
    goto :L10
  :L9
  .line 488
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v6
    sub-int/2addr v5, v6
  :L10
  .line 489
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v6
  .line 490
    if-eqz v6, :L15
  .line 492
    if-eqz v1, :L11
    invoke-static { v6, v3 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result p1
    sub-int/2addr p1, v5
    goto :L12
  :L11
    invoke-static { v6, v3 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result p1
    sub-int/2addr p1, v2
  :L12
  .line 493
    if-eqz p1, :L14
  .line 494
    if-eqz v3, :L13
    invoke-virtual { p0, p1, v4 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
    goto :L14
  :L13
    invoke-virtual { p0, v4, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  :L14
  .line 496
    return-void
  :L15
  .line 498
    invoke-virtual { v0, v4 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 499
    if-nez v6, :L16
    const/4 v7, 0
    goto :L17
  :L16
    invoke-static { v6, v3 }, Lcom/innioasis/ipp/Wheel;->end(Landroid/view/View;Z)I
    move-result v7
    invoke-static { v6, v3 }, Lcom/innioasis/ipp/Wheel;->start(Landroid/view/View;Z)I
    move-result v3
    sub-int/2addr v7, v3
  :L17
  .line 500
    if-lez v7, :L19
    if-le v5, v2, :L19
  .line 501
    if-eqz v1, :L18
    sub-int/2addr v5, v2
    sub-int v4, v5, v7
  :L18
    invoke-virtual { v0, p1, v4 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V
    goto :L20
  :L19
  .line 503
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  :L20
  .line 505
    return-void
.end method

.method private static skipFast(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 2
  .line 391
    sget-object v0, Lcom/innioasis/ipp/Wheel;->noFast:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static start(Landroid/view/View;Z)I
  .registers 4
  .line 509
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
    move-result-object v0
  .line 510
    const/4 v1, 0
    if-eqz p1, :L2
    invoke-virtual { p0 }, Landroid/view/View;->getLeft()I
    move-result p0
    if-nez v0, :L0
    goto :L1
  :L0
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  :L1
    sub-int/2addr p0, v1
    return p0
  :L2
  .line 511
    invoke-virtual { p0 }, Landroid/view/View;->getTop()I
    move-result p0
    if-nez v0, :L3
    goto :L4
  :L3
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  :L4
    sub-int/2addr p0, v1
    return p0
.end method

.method private static stateShift(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 289
    const v0, 2131362097
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 290
    if-nez v0, :L1
    return-void
  :L1
  .line 291
    invoke-virtual { v0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 292
    if-nez v1, :L2
    return-void
  :L2
  .line 293
    nop
  .line 294
    const v2, 2131820921
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L3
  .line 295
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const p1, 2131165811
    invoke-virtual { p0, p1 }, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    move-result p0
    goto :L4
  :L3
  .line 294
    const/4 p0, 0
  :L4
  .line 297
    iget p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    if-eq p1, p0, :L5
  .line 298
    iput p0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 299
    invoke-virtual { v0, v1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L5
  .line 302
    goto :L7
  :L6
  .line 301
    move-exception p0
  :L7
  .line 303
    return-void
.end method

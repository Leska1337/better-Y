.class public final Lcom/innioasis/ipp/Wheel;
.super Ljava/lang/Object;
.source "Wheel.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Wheel$Repaint;,
    Lcom/innioasis/ipp/Wheel$Fit;,
    Lcom/innioasis/ipp/Wheel$Rest;
  }
.end annotation

.field private final static FIT:Lcom/innioasis/ipp/Wheel$Fit;

.field private final static PANEL_MS:I = 70

.field private final static REPAINT:Lcom/innioasis/ipp/Wheel$Repaint;

.field private final static REST:Lcom/innioasis/ipp/Wheel$Rest;

.field private static busy:Z

.field private static fitLv:Ljava/lang/ref/WeakReference;

.field private static fitPos:I

.field private static lastPos:I

.field private static lastRv:Ljava/lang/ref/WeakReference;

.field private final static level:Ljava/util/WeakHashMap;

.field private static noFast:Ljava/lang/ref/WeakReference;

.field private static painted:Ljava/lang/String;

.field private static panelHost:Ljava/lang/ref/WeakReference;

.field private static panelTitle:Ljava/lang/String;

.field private static pendFrom:I

.field private static pendLv:Ljava/lang/ref/WeakReference;

.field private static pendOn:Z

.field private static restPos:I

.field private static restRv:Ljava/lang/ref/WeakReference;

.field private static tuned:Ljava/lang/ref/WeakReference;

.method static constructor <clinit>()V
  .registers 2
  .line 34
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 100
    new-instance v1, Lcom/innioasis/ipp/Wheel$Repaint;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Wheel$Repaint;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->REPAINT:Lcom/innioasis/ipp/Wheel$Repaint;
  .line 291
    sput v0, Lcom/innioasis/ipp/Wheel;->fitPos:I
  .line 292
    new-instance v1, Lcom/innioasis/ipp/Wheel$Fit;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Wheel$Fit;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->FIT:Lcom/innioasis/ipp/Wheel$Fit;
  .line 328
    sput v0, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 330
    new-instance v0, Lcom/innioasis/ipp/Wheel$Rest;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Rest;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
  .line 700
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 31
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 31
    sget-object v0, Lcom/innioasis/ipp/Wheel;->fitLv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$002(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 31
    sput-object p0, Lcom/innioasis/ipp/Wheel;->fitLv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$100()I
  .registers 1
  .line 31
    sget v0, Lcom/innioasis/ipp/Wheel;->fitPos:I
    return v0
.end method

.method static synthetic access$1000()V
  .registers 0
  .line 31
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
    return-void
.end method

.method static synthetic access$102(I)I
  .registers 1
  .line 31
    sput p0, Lcom/innioasis/ipp/Wheel;->fitPos:I
    return p0
.end method

.method static synthetic access$1100(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
  .registers 5
  .line 31
    invoke-static { p0, p1, p2, p3, p4 }, Lcom/innioasis/ipp/Wheel;->bind(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
    move-result p0
    return p0
.end method

.method static synthetic access$202(Z)Z
  .registers 1
  .line 31
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->busy:Z
    return p0
.end method

.method static synthetic access$302(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 31
    sput-object p0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$400()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 31
    sget-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$402(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 31
    sput-object p0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$500()Ljava/lang/String;
  .registers 1
  .line 31
    sget-object v0, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$502(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 31
    sput-object p0, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$602(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 31
    sput-object p0, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$700()Z
  .registers 1
  .line 31
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->pendOn:Z
    return v0
.end method

.method static synthetic access$800()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 31
    sget-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$900()I
  .registers 1
  .line 31
    sget v0, Lcom/innioasis/ipp/Wheel;->pendFrom:I
    return v0
.end method

.method private static arm(Landroid/widget/ListView;I)V
  .registers 3
  .line 218
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->pendOn:Z
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L1
  :L0
  .line 219
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
  .line 220
    sput p1, Lcom/innioasis/ipp/Wheel;->pendFrom:I
  .line 221
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Wheel;->pendOn:Z
  .line 222
    sget-object p1, Lcom/innioasis/ipp/Wheel;->REPAINT:Lcom/innioasis/ipp/Wheel$Repaint;
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  :L1
  .line 224
    return-void
.end method

.method private static bind(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
  .registers 7
  .line 497
    const/4 v0, 1
    if-lt p2, p3, :L5
    if-le p2, p4, :L0
    goto :L5
  :L0
  .line 498
    const/4 p4, 0
    if-ltz p2, :L4
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-lt p2, v1, :L1
    goto :L4
  :L1
  .line 499
    sub-int p3, p2, p3
    invoke-virtual { p0, p3 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p3
  .line 500
    if-nez p3, :L2
    return p4
  :L2
  .line 501
    invoke-virtual { p1, p2, p3, p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    move-result-object p0
    if-ne p0, p3, :L3
    return v0
  :L3
  .line 502
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Wheel;->noFast:Ljava/lang/ref/WeakReference;
  .line 503
    return p4
  :L4
  .line 498
    return p4
  :L5
  .line 497
    return v0
.end method

.method static cutAtTop(Landroid/widget/ListView;II)Z
  .registers 4
  .line 260
    sub-int/2addr p1, p2
  .line 261
    const/4 p2, 0
    if-ltz p1, :L3
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L3
  :L0
  .line 262
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p1
  .line 263
    if-nez p1, :L1
    return p2
  :L1
  .line 264
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result p1
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result p0
    if-ge p1, p0, :L2
    const/4 p2, 1
  :L2
    return p2
  :L3
  .line 261
    return p2
.end method

.method private static drop()V
  .registers 1
  .line 227
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
  .line 228
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel;->pendFrom:I
  .line 229
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->pendOn:Z
  .line 230
    return-void
.end method

.method static firstShown(Landroid/widget/ListView;II)I
  .registers 6
  .line 251
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
  .line 252
    const/4 v1, 0
  :L0
    if-ge v1, v0, :L2
  .line 253
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 254
    if-eqz v2, :L1
    invoke-virtual { v2 }, Landroid/view/View;->getBottom()I
    move-result v2
    if-le v2, p2, :L1
    add-int/2addr p1, v1
    return p1
  :L1
  .line 252
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 256
    return p1
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .registers 5
  .line 523
    if-nez p0, :L0
    return-void
  :L0
  .line 524
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 525
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 526
    invoke-static { p0, p2, p3 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 527
    return-void
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  .line 531
    if-nez p0, :L0
    return-void
  :L0
  .line 536
    sget-object v0, Lcom/innioasis/ipp/Wheel;->tuned:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L2
  :L1
  .line 537
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->tuned:Ljava/lang/ref/WeakReference;
  .line 538
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V
  .line 556
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setItemViewCacheSize(I)V
  .line 574
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v1
  .line 575
    if-eqz v1, :L2
    invoke-virtual { v1, v0 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->setItemPrefetchEnabled(Z)V
  :L2
  .line 581
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 583
    if-eqz p2, :L6
  .line 584
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v0
  .line 585
    sget-object v1, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, p0, :L3
    sget v1, Lcom/innioasis/ipp/Wheel;->lastPos:I
    goto :L4
  :L3
    const/4 v1, -1
  :L4
  .line 595
    if-ltz v1, :L5
    invoke-static { p0, p2, v1, v0 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v1
    if-eqz v1, :L5
    invoke-static { p0, p2, p1, v0 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v0
    if-nez v0, :L6
  :L5
  .line 596
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L6
  .line 599
    new-instance p2, Ljava/lang/ref/WeakReference;
    invoke-direct { p2, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p2, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 600
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 602
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L7
  .line 605
    goto :L9
  :L8
  .line 603
    move-exception p0
  :L9
  .line 606
    return-void
.end method

.method public static gotoLevel(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 6
  .line 721
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 722
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
  .line 723
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
  .line 724
    sget-object v1, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p1 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 725
    instance-of v2, v1, [I
    if-eqz v2, :L1
    check-cast v1, [I
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 726
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
  .line 729
    aget p1, v1, v2
    const/4 v0, 1
    aget v0, v1, v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Head;->restore(Landroid/widget/ListView;II)V
    goto :L4
  :L3
  .line 731
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->setSelection(I)V
  :L4
  .line 733
    return-void
  :L5
  .line 721
    return-void
.end method

.method public static list(Landroid/widget/ListView;I)V
  .catchall { :L0 .. :L24 } :L25
  .registers 13
  .line 104
    if-nez p0, :L0
    return-void
  :L0
  .line 105
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 106
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return-void
  :L1
  .line 107
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 115
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Follow;->touched(Landroid/widget/ListView;Ljava/lang/Object;)V
  .line 120
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Alpha;->step(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
    move-result v1
    if-eqz v1, :L2
  .line 121
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
  .line 122
    return-void
  :L2
  .line 130
    invoke-static { p0 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 132
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v1
  .line 133
    invoke-virtual { p0 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result v2
  .line 134
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
  .line 136
    const/4 v4, 1
    if-ne p1, v4, :L3
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toNext()V
    goto :L4
  :L3
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toPrevious()V
  :L4
  .line 137
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v5
  .line 138
    if-ne v5, v3, :L5
    return-void
  :L5
  .line 157
    const/4 v6, 0
    if-ne p1, v4, :L7
  .line 158
    if-lt v5, v2, :L6
    const/4 v7, 1
    goto :L10
  :L6
    const/4 v7, 0
    goto :L10
  :L7
  .line 159
    if-lt v5, v1, :L9
    invoke-static { p0, v5, v1 }, Lcom/innioasis/ipp/Wheel;->cutAtTop(Landroid/widget/ListView;II)Z
    move-result v7
    if-eqz v7, :L8
    goto :L9
  :L8
    const/4 v7, 0
    goto :L10
  :L9
    const/4 v7, 1
  :L10
  .line 160
    if-eqz v7, :L22
  .line 161
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
  .line 170
    if-ne p1, v4, :L11
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->variableRows(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L11
    const/4 v3, 1
    goto :L12
  :L11
    const/4 v3, 0
  :L12
  .line 171
    if-eqz v3, :L13
    invoke-static { p0, v5, v1 }, Lcom/innioasis/ipp/Wheel;->rowHeight(Landroid/widget/ListView;II)I
    move-result v7
    goto :L14
  :L13
    const/4 v7, 0
  :L14
  .line 176
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result v8
  .line 177
    invoke-virtual { p0 }, Landroid/widget/ListView;->getHeight()I
    move-result v9
    invoke-virtual { p0 }, Landroid/widget/ListView;->getPaddingBottom()I
    move-result v10
    sub-int/2addr v9, v10
  .line 178
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 179
    if-eqz v3, :L15
    if-lez v7, :L15
    sub-int v0, v9, v8
    if-gt v7, v0, :L15
  .line 183
    sub-int/2addr v9, v7
    invoke-static { p0, v5, v9 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
    goto :L21
  :L15
  .line 184
    if-ne p1, v4, :L20
  .line 189
    sub-int p1, v5, v2
    invoke-static { p0, v1, v8 }, Lcom/innioasis/ipp/Wheel;->firstShown(Landroid/widget/ListView;II)I
    move-result v0
    add-int/2addr p1, v0
    add-int/2addr p1, v4
  .line 190
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->headerShowing(Landroid/widget/ListView;)Z
    move-result v0
    if-eqz v0, :L16
    add-int/lit8 p1, p1, -1
  :L16
  .line 191
    if-gez p1, :L17
    goto :L18
  :L17
    move v6, p1
  :L18
  .line 192
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  .line 193
    if-eqz v3, :L19
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/Wheel;->postFit(Landroid/widget/ListView;I)V
  :L19
  .line 194
    goto :L21
  :L20
  .line 195
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  .line 196
    if-eqz v3, :L21
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/Wheel;->postFit(Landroid/widget/ListView;I)V
  :L21
  .line 198
    return-void
  :L22
  .line 201
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->skipFast(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p1
    if-eqz p1, :L23
  .line 202
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 203
    return-void
  :L23
  .line 206
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Wheel;->arm(Landroid/widget/ListView;I)V
  :L24
  .line 209
    goto :L26
  :L25
  .line 207
    move-exception p0
  :L26
  .line 210
    return-void
.end method

.method public static noteLevel(Landroid/widget/ListView;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 705
    if-nez p0, :L0
    return-void
  :L0
  .line 706
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 707
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return-void
  :L1
  .line 708
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 709
    sget-object v3, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    const/4 v4, 3
    new-array v4, v4, [I
  .line 710
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result p0
    aput p0, v4, v1
  .line 711
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
  .line 712
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p0
    const/4 v1, 2
    aput p0, v4, v1
  .line 709
    invoke-virtual { v3, v0, v4 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 716
    goto :L6
  :L5
  .line 714
    move-exception p0
  :L6
  .line 717
    return-void
.end method

.method private static paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 617
    const/4 v0, 0
    if-ltz p2, :L6
    if-lt p2, p3, :L0
    goto :L6
  :L0
  .line 618
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p3
  .line 619
    instance-of v1, p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L1
    return v0
  :L1
  .line 620
    check-cast p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { p3, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p3
  .line 623
    const/4 v1, 1
    if-nez p3, :L2
    return v1
  :L2
  .line 624
    invoke-virtual { p0, p3 }, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object p0
  .line 625
    if-nez p0, :L3
    return v0
  :L3
  .line 626
    invoke-virtual { p1, p0, p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->bindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  :L4
  .line 627
    return v1
  :L5
  .line 628
    move-exception p0
  .line 629
    return v0
  :L6
  .line 617
    return v0
.end method

.method public static panelShows(Ljava/lang/String;)Z
  .registers 2
  .line 431
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
  .line 375
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->busy:Z
    if-nez v0, :L0
  .line 376
    sput-object p1, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 377
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->stateShift(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)V
  .line 378
    const/4 p0, 0
    return p0
  :L0
  .line 380
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 381
    sput-object p1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 382
    const/4 p0, 1
    return p0
.end method

.method private static postFit(Landroid/widget/ListView;I)V
  .registers 3
  .line 295
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->fitLv:Ljava/lang/ref/WeakReference;
  .line 296
    sput p1, Lcom/innioasis/ipp/Wheel;->fitPos:I
  .line 297
    sget-object p1, Lcom/innioasis/ipp/Wheel;->FIT:Lcom/innioasis/ipp/Wheel$Fit;
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 298
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  .line 299
    return-void
.end method

.method private static postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 4
  .line 346
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
  .line 347
    sput p1, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 348
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Wheel;->busy:Z
  .line 349
    sget-object p1, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 350
    const-wide/16 v0, 70
    invoke-virtual { p0, p1, v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 351
    return-void
.end method

.method private static rowHeight(Landroid/widget/ListView;II)I
  .registers 6
  .line 279
    sub-int v0, p1, p2
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  .line 280
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result p0
    return p0
  :L0
  .line 281
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
  .line 282
    const/4 v1, 0
    if-nez v0, :L1
    return v1
  :L1
  .line 283
    add-int/lit8 v2, v0, -1
    invoke-virtual { p0, v2 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p0
  .line 284
    if-nez p0, :L2
    return v1
  :L2
  .line 285
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->stripPx(Landroid/view/View;)I
    move-result v2
  .line 286
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
  .line 287
    invoke-static { p1 }, Lcom/innioasis/ipp/Disc;->startsDisc(I)Z
    move-result p1
    if-eqz p1, :L5
    move v1, v2
  :L5
    add-int/2addr p0, v1
    return p0
.end method

.method private static scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 9
  .line 649
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 650
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L0
  .line 651
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  .line 652
    return-void
  :L0
  .line 654
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 655
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I
    move-result v1
  .line 656
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I
    move-result v2
  .line 657
    if-ltz v1, :L1
    if-lt p1, v1, :L1
    if-gt p1, v2, :L1
  .line 658
    return-void
  :L1
  .line 661
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
  .line 667
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v2
    if-nez v2, :L5
    goto :L6
  :L5
    const/4 v3, 0
  :L6
  .line 668
    if-eqz v3, :L7
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingLeft()I
    move-result v2
    goto :L8
  :L7
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v2
  :L8
  .line 669
    if-eqz v3, :L9
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingRight()I
    move-result v6
    sub-int/2addr v5, v6
    goto :L10
  :L9
  .line 670
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v6
    sub-int/2addr v5, v6
  :L10
  .line 671
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v6
  .line 672
    if-eqz v6, :L19
  .line 675
    if-eqz v1, :L13
    if-eqz v3, :L11
    invoke-virtual { v6 }, Landroid/view/View;->getRight()I
    move-result p1
    goto :L12
  :L11
    invoke-virtual { v6 }, Landroid/view/View;->getBottom()I
    move-result p1
  :L12
    sub-int/2addr p1, v5
    goto :L16
  :L13
  .line 676
    if-eqz v3, :L14
    invoke-virtual { v6 }, Landroid/view/View;->getLeft()I
    move-result p1
    goto :L15
  :L14
    invoke-virtual { v6 }, Landroid/view/View;->getTop()I
    move-result p1
  :L15
    sub-int/2addr p1, v2
  :L16
  .line 677
    if-eqz p1, :L18
  .line 678
    if-eqz v3, :L17
    invoke-virtual { p0, p1, v4 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
    goto :L18
  :L17
    invoke-virtual { p0, v4, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  :L18
  .line 680
    return-void
  :L19
  .line 682
    invoke-virtual { v0, v4 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 683
    if-nez v6, :L20
    const/4 v3, 0
    goto :L22
  :L20
    if-eqz v3, :L21
    invoke-virtual { v6 }, Landroid/view/View;->getWidth()I
    move-result v3
    goto :L22
  :L21
    invoke-virtual { v6 }, Landroid/view/View;->getHeight()I
    move-result v3
  :L22
  .line 684
    if-lez v3, :L24
    if-le v5, v2, :L24
  .line 685
    if-eqz v1, :L23
    sub-int/2addr v5, v2
    sub-int v4, v5, v3
  :L23
    invoke-virtual { v0, p1, v4 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V
    goto :L25
  :L24
  .line 687
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  :L25
  .line 689
    return-void
.end method

.method private static skipFast(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 2
  .line 509
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

.method private static stateShift(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 405
    const v0, 2131362097
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 406
    if-nez v0, :L1
    return-void
  :L1
  .line 407
    invoke-virtual { v0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 408
    if-nez v1, :L2
    return-void
  :L2
  .line 409
    nop
  .line 410
    const v2, 2131820921
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L3
  .line 411
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const p1, 2131165811
    invoke-virtual { p0, p1 }, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    move-result p0
    goto :L4
  :L3
  .line 410
    const/4 p0, 0
  :L4
  .line 413
    iget p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    if-eq p1, p0, :L5
  .line 414
    iput p0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 415
    invoke-virtual { v0, v1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L5
  .line 419
    goto :L7
  :L6
  .line 417
    move-exception p0
  :L7
  .line 420
    return-void
.end method

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
  .line 35
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 109
    new-instance v1, Lcom/innioasis/ipp/Wheel$Repaint;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Wheel$Repaint;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->REPAINT:Lcom/innioasis/ipp/Wheel$Repaint;
  .line 300
    sput v0, Lcom/innioasis/ipp/Wheel;->fitPos:I
  .line 301
    new-instance v1, Lcom/innioasis/ipp/Wheel$Fit;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Wheel$Fit;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->FIT:Lcom/innioasis/ipp/Wheel$Fit;
  .line 337
    sput v0, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 339
    new-instance v0, Lcom/innioasis/ipp/Wheel$Rest;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Rest;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
  .line 340
    new-instance v0, Lcom/innioasis/ipp/Wheel$Now;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Now;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->NOW:Lcom/innioasis/ipp/Wheel$Now;
  .line 766
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 32
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 32
    sget-object v0, Lcom/innioasis/ipp/Wheel;->fitLv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$002(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 32
    sput-object p0, Lcom/innioasis/ipp/Wheel;->fitLv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$100()I
  .registers 1
  .line 32
    sget v0, Lcom/innioasis/ipp/Wheel;->fitPos:I
    return v0
.end method

.method static synthetic access$1000(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
  .registers 5
  .line 32
    invoke-static { p0, p1, p2, p3, p4 }, Lcom/innioasis/ipp/Wheel;->bind(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
    move-result p0
    return p0
.end method

.method static synthetic access$102(I)I
  .registers 1
  .line 32
    sput p0, Lcom/innioasis/ipp/Wheel;->fitPos:I
    return p0
.end method

.method static synthetic access$200()J
  .registers 2
  .line 32
    sget-wide v0, Lcom/innioasis/ipp/Wheel;->panelAt:J
    return-wide v0
.end method

.method static synthetic access$300()V
  .registers 0
  .line 32
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->paintPanel()V
    return-void
.end method

.method static synthetic access$402(Z)Z
  .registers 1
  .line 32
    sput-boolean p0, Lcom/innioasis/ipp/Wheel;->busy:Z
    return p0
.end method

.method static synthetic access$502(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 32
    sput-object p0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$600()Z
  .registers 1
  .line 32
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->pendOn:Z
    return v0
.end method

.method static synthetic access$700()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 32
    sget-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$800()I
  .registers 1
  .line 32
    sget v0, Lcom/innioasis/ipp/Wheel;->pendFrom:I
    return v0
.end method

.method static synthetic access$900()V
  .registers 0
  .line 32
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
    return-void
.end method

.method private static arm(Landroid/widget/ListView;I)V
  .registers 3
  .line 227
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->pendOn:Z
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-eq v0, p0, :L1
  :L0
  .line 228
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
  .line 229
    sput p1, Lcom/innioasis/ipp/Wheel;->pendFrom:I
  .line 230
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Wheel;->pendOn:Z
  .line 231
    sget-object p1, Lcom/innioasis/ipp/Wheel;->REPAINT:Lcom/innioasis/ipp/Wheel$Repaint;
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  :L1
  .line 233
    return-void
.end method

.method private static bind(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
  .registers 7
  .line 529
    const/4 v0, 1
    if-lt p2, p3, :L5
    if-le p2, p4, :L0
    goto :L5
  :L0
  .line 530
    const/4 p4, 0
    if-ltz p2, :L4
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-lt p2, v1, :L1
    goto :L4
  :L1
  .line 531
    sub-int p3, p2, p3
    invoke-virtual { p0, p3 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p3
  .line 532
    if-nez p3, :L2
    return p4
  :L2
  .line 533
    invoke-virtual { p1, p2, p3, p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    move-result-object p0
    if-ne p0, p3, :L3
    return v0
  :L3
  .line 534
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Wheel;->noFast:Ljava/lang/ref/WeakReference;
  .line 535
    return p4
  :L4
  .line 530
    return p4
  :L5
  .line 529
    return v0
.end method

.method static cutAtTop(Landroid/widget/ListView;II)Z
  .registers 4
  .line 269
    sub-int/2addr p1, p2
  .line 270
    const/4 p2, 0
    if-ltz p1, :L3
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L3
  :L0
  .line 271
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p1
  .line 272
    if-nez p1, :L1
    return p2
  :L1
  .line 273
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result p1
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result p0
    if-ge p1, p0, :L2
    const/4 p2, 1
  :L2
    return p2
  :L3
  .line 270
    return p2
.end method

.method private static drop()V
  .registers 1
  .line 236
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Wheel;->pendLv:Ljava/lang/ref/WeakReference;
  .line 237
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Wheel;->pendFrom:I
  .line 238
    sput-boolean v0, Lcom/innioasis/ipp/Wheel;->pendOn:Z
  .line 239
    return-void
.end method

.method private static end(Landroid/view/View;Z)I
  .registers 4
  .line 747
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
    move-result-object v0
  .line 748
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
  .line 749
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

.method static firstShown(Landroid/widget/ListView;II)I
  .registers 6
  .line 260
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
  .line 261
    const/4 v1, 0
  :L0
    if-ge v1, v0, :L2
  .line 262
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 263
    if-eqz v2, :L1
    invoke-virtual { v2 }, Landroid/view/View;->getBottom()I
    move-result v2
    if-le v2, p2, :L1
    add-int/2addr p1, v1
    return p1
  :L1
  .line 261
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 265
    return p1
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .registers 5
  .line 555
    if-nez p0, :L0
    return-void
  :L0
  .line 556
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 557
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p3 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
  .line 558
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 559
    invoke-static { p0, p2, p3 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 560
    return-void
.end method

.method public static follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  .line 564
    if-nez p0, :L0
    return-void
  :L0
  .line 571
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 572
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
  .line 573
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->tuned:Ljava/lang/ref/WeakReference;
  .line 574
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Wheel;->tunedLm:Ljava/lang/ref/WeakReference;
  .line 575
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V
  .line 593
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemViewCacheSize(I)V
  .line 611
    if-eqz v0, :L2
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->setItemPrefetchEnabled(Z)V
  :L2
  .line 617
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 619
    if-eqz p2, :L6
  .line 620
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v0
  .line 626
    sget-object v1, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, p0, :L3
    sget-object v1, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
  .line 627
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, p2, :L3
    sget v1, Lcom/innioasis/ipp/Wheel;->lastPos:I
    goto :L4
  :L3
    const/4 v1, -1
  :L4
  .line 637
    if-ltz v1, :L5
    invoke-static { p0, p2, v1, v0 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v1
    if-eqz v1, :L5
    invoke-static { p0, p2, p1, v0 }, Lcom/innioasis/ipp/Wheel;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
    move-result v0
    if-nez v0, :L6
  :L5
  .line 638
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L6
  .line 641
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastRv:Ljava/lang/ref/WeakReference;
  .line 642
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->lastAdapter:Ljava/lang/ref/WeakReference;
  .line 643
    sput p1, Lcom/innioasis/ipp/Wheel;->lastPos:I
  .line 645
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->scrollTo(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L7
  .line 648
    goto :L9
  :L8
  .line 646
    move-exception p0
  :L9
  .line 649
    return-void
.end method

.method public static gotoLevel(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .registers 6
  .line 787
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 788
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
  .line 789
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
  .line 790
    sget-object v1, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p1 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 791
    instance-of v2, v1, [I
    if-eqz v2, :L1
    check-cast v1, [I
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 792
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
  .line 795
    aget p1, v1, v2
    const/4 v0, 1
    aget v0, v1, v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Head;->restore(Landroid/widget/ListView;II)V
    goto :L4
  :L3
  .line 797
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->setSelection(I)V
  :L4
  .line 799
    return-void
  :L5
  .line 787
    return-void
.end method

.method public static list(Landroid/widget/ListView;I)V
  .catchall { :L0 .. :L24 } :L25
  .registers 13
  .line 113
    if-nez p0, :L0
    return-void
  :L0
  .line 114
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 115
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return-void
  :L1
  .line 116
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 124
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Follow;->touched(Landroid/widget/ListView;Ljava/lang/Object;)V
  .line 129
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Alpha;->step(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
    move-result v1
    if-eqz v1, :L2
  .line 130
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
  .line 131
    return-void
  :L2
  .line 139
    invoke-static { p0 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 141
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v1
  .line 142
    invoke-virtual { p0 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result v2
  .line 143
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v3
  .line 145
    const/4 v4, 1
    if-ne p1, v4, :L3
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toNext()V
    goto :L4
  :L3
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->toPrevious()V
  :L4
  .line 146
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v5
  .line 147
    if-ne v5, v3, :L5
    return-void
  :L5
  .line 166
    const/4 v6, 0
    if-ne p1, v4, :L7
  .line 167
    if-lt v5, v2, :L6
    const/4 v7, 1
    goto :L10
  :L6
    const/4 v7, 0
    goto :L10
  :L7
  .line 168
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
  .line 169
    if-eqz v7, :L22
  .line 170
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->drop()V
  .line 179
    if-ne p1, v4, :L11
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->variableRows(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L11
    const/4 v3, 1
    goto :L12
  :L11
    const/4 v3, 0
  :L12
  .line 180
    if-eqz v3, :L13
    invoke-static { p0, v5, v1 }, Lcom/innioasis/ipp/Wheel;->rowHeight(Landroid/widget/ListView;II)I
    move-result v7
    goto :L14
  :L13
    const/4 v7, 0
  :L14
  .line 185
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result v8
  .line 186
    invoke-virtual { p0 }, Landroid/widget/ListView;->getHeight()I
    move-result v9
    invoke-virtual { p0 }, Landroid/widget/ListView;->getPaddingBottom()I
    move-result v10
    sub-int/2addr v9, v10
  .line 187
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 188
    if-eqz v3, :L15
    if-lez v7, :L15
    sub-int v0, v9, v8
    if-gt v7, v0, :L15
  .line 192
    sub-int/2addr v9, v7
    invoke-static { p0, v5, v9 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
    goto :L21
  :L15
  .line 193
    if-ne p1, v4, :L20
  .line 198
    sub-int p1, v5, v2
    invoke-static { p0, v1, v8 }, Lcom/innioasis/ipp/Wheel;->firstShown(Landroid/widget/ListView;II)I
    move-result v0
    add-int/2addr p1, v0
    add-int/2addr p1, v4
  .line 199
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->headerShowing(Landroid/widget/ListView;)Z
    move-result v0
    if-eqz v0, :L16
    add-int/lit8 p1, p1, -1
  :L16
  .line 200
    if-gez p1, :L17
    goto :L18
  :L17
    move v6, p1
  :L18
  .line 201
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  .line 202
    if-eqz v3, :L19
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/Wheel;->postFit(Landroid/widget/ListView;I)V
  :L19
  .line 203
    goto :L21
  :L20
  .line 204
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  .line 205
    if-eqz v3, :L21
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/Wheel;->postFit(Landroid/widget/ListView;I)V
  :L21
  .line 207
    return-void
  :L22
  .line 210
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->skipFast(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result p1
    if-eqz p1, :L23
  .line 211
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 212
    return-void
  :L23
  .line 215
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Wheel;->arm(Landroid/widget/ListView;I)V
  :L24
  .line 218
    goto :L26
  :L25
  .line 216
    move-exception p0
  :L26
  .line 219
    return-void
.end method

.method private static margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
  .registers 2
  .line 753
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p0
  .line 754
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
  .line 771
    if-nez p0, :L0
    return-void
  :L0
  .line 772
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 773
    instance-of v1, v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return-void
  :L1
  .line 774
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 775
    sget-object v3, Lcom/innioasis/ipp/Wheel;->level:Ljava/util/WeakHashMap;
    const/4 v4, 3
    new-array v4, v4, [I
  .line 776
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result p0
    aput p0, v4, v1
  .line 777
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
  .line 778
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p0
    const/4 v1, 2
    aput p0, v4, v1
  .line 775
    invoke-virtual { v3, v0, v4 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 782
    goto :L6
  :L5
  .line 780
    move-exception p0
  :L6
  .line 783
    return-void
.end method

.method private static paint(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;II)Z
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 660
    const/4 v0, 0
    if-ltz p2, :L6
    if-lt p2, p3, :L0
    goto :L6
  :L0
  .line 661
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p3
  .line 662
    instance-of v1, p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L1
    return v0
  :L1
  .line 663
    check-cast p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual { p3, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p3
  .line 666
    const/4 v1, 1
    if-nez p3, :L2
    return v1
  :L2
  .line 667
    invoke-virtual { p0, p3 }, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object p0
  .line 668
    if-nez p0, :L3
    return v0
  :L3
  .line 669
    invoke-virtual { p1, p0, p2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->bindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  :L4
  .line 670
    return v1
  :L5
  .line 671
    move-exception p0
  .line 672
    return v0
  :L6
  .line 660
    return v0
.end method

.method private static paintPanel()V
  .catchall { :L2 .. :L3 } :L4
  .registers 3
  .line 456
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Wheel;->panelAt:J
  .line 457
    invoke-static { }, Lcom/innioasis/ipp/Eq;->paint()V
  .line 458
    sget-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 459
    sget-object v2, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 460
    sput-object v1, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 461
    sput-object v1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 462
    instance-of v1, v0, Lcom/innioasis/y1/activity/SettingActivity;
    if-eqz v1, :L6
    if-eqz v2, :L6
  .line 463
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->painting:Z
  .line 465
    const/4 v1, 0
  :L2
    sput-object v2, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 466
    check-cast v0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  :L3
    goto :L5
  :L4
  .line 467
    move-exception v0
  :L5
  .line 470
    sput-boolean v1, Lcom/innioasis/ipp/Wheel;->painting:Z
  .line 471
    nop
  :L6
  .line 473
    return-void
.end method

.method public static panelShows(Ljava/lang/String;)Z
  .registers 2
  .line 448
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
  .line 392
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->busy:Z
    if-eqz v0, :L1
    sget-boolean v0, Lcom/innioasis/ipp/Wheel;->painting:Z
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 397
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->panelHost:Ljava/lang/ref/WeakReference;
  .line 398
    sput-object p1, Lcom/innioasis/ipp/Wheel;->panelTitle:Ljava/lang/String;
  .line 399
    const/4 p0, 1
    return p0
  :L1
  .line 393
    sput-object p1, Lcom/innioasis/ipp/Wheel;->painted:Ljava/lang/String;
  .line 394
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Wheel;->stateShift(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)V
  .line 395
    const/4 p0, 0
    return p0
.end method

.method private static postFit(Landroid/widget/ListView;I)V
  .registers 3
  .line 304
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->fitLv:Ljava/lang/ref/WeakReference;
  .line 305
    sput p1, Lcom/innioasis/ipp/Wheel;->fitPos:I
  .line 306
    sget-object p1, Lcom/innioasis/ipp/Wheel;->FIT:Lcom/innioasis/ipp/Wheel$Fit;
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 307
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  .line 308
    return-void
.end method

.method private static postRest(Landroidx/recyclerview/widget/RecyclerView;I)V
  .registers 4
  .line 360
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Wheel;->restRv:Ljava/lang/ref/WeakReference;
  .line 361
    sput p1, Lcom/innioasis/ipp/Wheel;->restPos:I
  .line 362
    const/4 p1, 1
    sput-boolean p1, Lcom/innioasis/ipp/Wheel;->busy:Z
  .line 363
    sget-object p1, Lcom/innioasis/ipp/Wheel;->REST:Lcom/innioasis/ipp/Wheel$Rest;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 364
    const-wide/16 v0, 70
    invoke-virtual { p0, p1, v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 365
    sget-object p1, Lcom/innioasis/ipp/Wheel;->NOW:Lcom/innioasis/ipp/Wheel$Now;
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 366
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  .line 367
    return-void
.end method

.method private static rowHeight(Landroid/widget/ListView;II)I
  .registers 6
  .line 288
    sub-int v0, p1, p2
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  .line 289
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result p0
    return p0
  :L0
  .line 290
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
  .line 291
    const/4 v1, 0
    if-nez v0, :L1
    return v1
  :L1
  .line 292
    add-int/lit8 v2, v0, -1
    invoke-virtual { p0, v2 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p0
  .line 293
    if-nez p0, :L2
    return v1
  :L2
  .line 294
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->stripPx(Landroid/view/View;)I
    move-result v2
  .line 295
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
  .line 296
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
  .line 692
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 693
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-nez v1, :L0
  .line 694
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  .line 695
    return-void
  :L0
  .line 697
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 698
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I
    move-result v1
  .line 699
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I
    move-result v2
  .line 700
    if-ltz v1, :L1
    if-lt p1, v1, :L1
    if-gt p1, v2, :L1
  .line 701
    return-void
  :L1
  .line 704
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
  .line 710
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result v2
    if-nez v2, :L5
    goto :L6
  :L5
    const/4 v3, 0
  :L6
  .line 711
    if-eqz v3, :L7
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingLeft()I
    move-result v2
    goto :L8
  :L7
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v2
  :L8
  .line 712
    if-eqz v3, :L9
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingRight()I
    move-result v6
    sub-int/2addr v5, v6
    goto :L10
  :L9
  .line 713
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v5
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v6
    sub-int/2addr v5, v6
  :L10
  .line 714
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v6
  .line 715
    if-eqz v6, :L15
  .line 718
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
  .line 719
    if-eqz p1, :L14
  .line 720
    if-eqz v3, :L13
    invoke-virtual { p0, p1, v4 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
    goto :L14
  :L13
    invoke-virtual { p0, v4, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  :L14
  .line 722
    return-void
  :L15
  .line 724
    invoke-virtual { v0, v4 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;
    move-result-object v6
  .line 725
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
  .line 726
    if-lez v7, :L19
    if-le v5, v2, :L19
  .line 727
    if-eqz v1, :L18
    sub-int/2addr v5, v2
    sub-int v4, v5, v7
  :L18
    invoke-virtual { v0, p1, v4 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V
    goto :L20
  :L19
  .line 729
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  :L20
  .line 731
    return-void
.end method

.method private static skipFast(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 2
  .line 541
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
  .line 741
    invoke-static { p0 }, Lcom/innioasis/ipp/Wheel;->margins(Landroid/view/View;)Landroid/view/ViewGroup$MarginLayoutParams;
    move-result-object v0
  .line 742
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
  .line 743
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
  .line 422
    const v0, 2131362097
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 423
    if-nez v0, :L1
    return-void
  :L1
  .line 424
    invoke-virtual { v0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 425
    if-nez v1, :L2
    return-void
  :L2
  .line 426
    nop
  .line 427
    const v2, 2131820921
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L3
  .line 428
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const p1, 2131165811
    invoke-virtual { p0, p1 }, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    move-result p0
    goto :L4
  :L3
  .line 427
    const/4 p0, 0
  :L4
  .line 430
    iget p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    if-eq p1, p0, :L5
  .line 431
    iput p0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 432
    invoke-virtual { v0, v1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L5
  .line 436
    goto :L7
  :L6
  .line 434
    move-exception p0
  :L7
  .line 437
    return-void
.end method

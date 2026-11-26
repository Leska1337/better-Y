.class public final Lcom/innioasis/ipp/Column;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.implements Lcom/innioasis/ipp/Bar$Cursor;
.source "Column.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Column$Painter;,
    Lcom/innioasis/ipp/Column$Holder;
  }
.end annotation

.field public final static TEXT:I = 2131362437

.field public final static TITLE:I = 2131362459

.field private final painter:Lcom/innioasis/ipp/Column$Painter;

.field private final rows:[Landroid/view/View;

.field private final rv:Landroidx/recyclerview/widget/RecyclerView;

.field private sel:I

.method public constructor <init>(Landroid/content/Context;[Landroid/view/View;Lcom/innioasis/ipp/Column$Painter;)V
  .registers 4
  .line 31
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V
  .line 32
    iput-object p2, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
  .line 33
    iput-object p3, p0, Lcom/innioasis/ipp/Column;->painter:Lcom/innioasis/ipp/Column$Painter;
  .line 34
    new-instance p2, Lcom/innioasis/ipp/Fixed;
    invoke-direct { p2, p1 }, Lcom/innioasis/ipp/Fixed;-><init>(Landroid/content/Context;)V
    iput-object p2, p0, Lcom/innioasis/ipp/Column;->rv:Landroidx/recyclerview/widget/RecyclerView;
  .line 35
    new-instance p3, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-direct { p3, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V
  .line 36
    invoke-virtual { p2, p3 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 37
    const/4 p1, 0
    invoke-virtual { p2, p1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V
  .line 38
    const/4 p1, 0
    invoke-virtual { p2, p1 }, Landroidx/recyclerview/widget/RecyclerView;->setItemViewCacheSize(I)V
  .line 39
    invoke-virtual { p3, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->setItemPrefetchEnabled(Z)V
  .line 40
    const/high16 p1, 0x00060000
    invoke-virtual { p2, p1 }, Landroidx/recyclerview/widget/RecyclerView;->setDescendantFocusability(I)V
  .line 41
    invoke-virtual { p2, p0 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 42
    invoke-static { p2 }, Lcom/innioasis/ipp/Fill;->list(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 43
    return-void
.end method

.method public bar(Landroid/app/Activity;ZIII)V
  .registers 13
  .line 54
    const/4 v6, 0
    move-object v0, p0
    move-object v1, p1
    move v2, p2
    move v3, p3
    move v4, p4
    move v5, p5
    invoke-virtual/range { v0 .. v6 }, Lcom/innioasis/ipp/Column;->bar(Landroid/app/Activity;ZIIII)V
  .line 55
    return-void
.end method

.method public bar(Landroid/app/Activity;ZIIII)V
  .registers 15
  .line 59
    iget-object v1, p0, Lcom/innioasis/ipp/Column;->rv:Landroidx/recyclerview/widget/RecyclerView;
    const v0, 2131362459
    const v2, 2131362437
    filled-new-array { v0, v2 }, [I
    move-result-object v6
    move-object v0, p1
    move v2, p2
    move v3, p3
    move v4, p4
    move v5, p5
    move v7, p6
    invoke-static/range { v0 .. v7 }, Lcom/innioasis/ipp/Bar;->column(Landroid/app/Activity;Landroidx/recyclerview/widget/RecyclerView;ZIII[II)V
  .line 60
    return-void
.end method

.method public barred()Z
  .registers 2
  .line 68
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->on(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v0
    return v0
.end method

.method public cursor()I
  .registers 2
  .line 72
    iget v0, p0, Lcom/innioasis/ipp/Column;->sel:I
    return v0
.end method

.method public getItemCount()I
  .registers 2
  .line 122
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
    array-length v0, v0
    return v0
.end method

.method public getItemViewType(I)I
  .registers 2
  .line 126
    return p1
.end method

.method public list()Landroidx/recyclerview/widget/RecyclerView;
  .registers 2
  .line 46
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rv:Landroidx/recyclerview/widget/RecyclerView;
    return-object v0
.end method

.method public move(I)V
  .registers 5
  .line 96
    iget v0, p0, Lcom/innioasis/ipp/Column;->sel:I
  .line 97
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 98
    iput p1, p0, Lcom/innioasis/ipp/Column;->sel:I
  .line 99
    iget-object v1, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
    array-length v2, v1
    if-ge v0, v2, :L1
    array-length v2, v1
    if-ge p1, v2, :L1
  .line 100
    iget-object v1, p0, Lcom/innioasis/ipp/Column;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v1, v0, p1, p0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 101
    return-void
  :L1
  .line 103
    array-length v1, v1
    if-ge v0, v1, :L2
    invoke-virtual { p0, v0 }, Lcom/innioasis/ipp/Column;->repaint(I)V
  :L2
  .line 104
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
    array-length v0, v0
    if-ge p1, v0, :L3
  .line 105
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  .line 106
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Column;->repaint(I)V
  :L3
  .line 108
    iget-object p1, p0, Lcom/innioasis/ipp/Column;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  .line 109
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
  .registers 4
  .line 137
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->painter:Lcom/innioasis/ipp/Column$Painter;
    invoke-virtual { v0, p2 }, Lcom/innioasis/ipp/Column$Painter;->paint(I)V
  .line 138
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 139
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
  .registers 5
  .line 130
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
    aget-object p2, v0, p2
  .line 131
    invoke-virtual { p2 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 132
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-eqz v1, :L0
    if-eq v0, p1, :L0
    check-cast v0, Landroid/view/ViewGroup;
    invoke-virtual { v0, p2 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L0
  .line 133
    new-instance p1, Lcom/innioasis/ipp/Column$Holder;
    invoke-direct { p1, p2 }, Lcom/innioasis/ipp/Column$Holder;-><init>(Landroid/view/View;)V
    return-object p1
.end method

.method public paintAll()V
  .registers 3
  .line 118
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
    array-length v1, v1
    if-ge v0, v1, :L1
    invoke-virtual { p0, v0 }, Lcom/innioasis/ipp/Column;->repaint(I)V
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 119
    return-void
.end method

.method public repaint(I)V
  .registers 3
  .line 112
    if-ltz p1, :L1
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
    array-length v0, v0
    if-lt p1, v0, :L0
    goto :L1
  :L0
  .line 113
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->painter:Lcom/innioasis/ipp/Column$Painter;
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Column$Painter;->paint(I)V
  .line 114
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
    aget-object p1, v0, p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Bar;->row(Landroid/view/View;)V
  .line 115
    return-void
  :L1
  .line 112
    return-void
.end method

.method public sel()I
  .registers 2
  .line 76
    iget v0, p0, Lcom/innioasis/ipp/Column;->sel:I
    return v0
.end method

.method public set(I)V
  .registers 3
  .line 81
    iput p1, p0, Lcom/innioasis/ipp/Column;->sel:I
  .line 82
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .line 83
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
    array-length v0, v0
    if-ge p1, v0, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  :L0
  .line 84
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Column;->paintAll()V
  .line 85
    return-void
.end method

.method public step(I)V
  .registers 6
  .line 89
    const/4 v0, 0
    const/4 v1, 1
    iget v2, p0, Lcom/innioasis/ipp/Column;->sel:I
    if-lez p1, :L0
    iget-object v3, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
    array-length v3, v3
    sub-int/2addr v3, v1
    if-lt v2, v3, :L2
    goto :L1
  :L0
    if-gtz v2, :L2
  :L1
    const/4 v0, 1
  :L2
  .line 90
    if-eqz v0, :L3
    iget-object v0, p0, Lcom/innioasis/ipp/Column;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Bar;->holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
    move-result v0
    if-eqz v0, :L3
    return-void
  :L3
  .line 91
    iget v0, p0, Lcom/innioasis/ipp/Column;->sel:I
    iget-object v1, p0, Lcom/innioasis/ipp/Column;->rows:[Landroid/view/View;
    array-length v1, v1
    invoke-static { v0, p1, v1 }, Lcom/innioasis/ipp/Loop;->step(III)I
    move-result p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Column;->move(I)V
  .line 92
    return-void
.end method

.class final Lcom/innioasis/ipp/Lv;
.super Ljava/lang/Object;
.source "Lv.java"

.method private constructor <init>()V
  .registers 1
  .line 19
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static bottom(Landroid/view/View;)I
  .registers 2
  .line 71
    invoke-virtual { p0 }, Landroid/view/View;->getHeight()I
    move-result v0
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingBottom()I
    move-result p0
    sub-int/2addr v0, p0
    return v0
.end method

.method static find(Landroid/view/View;)Landroid/view/View;
  .registers 4
  .line 134
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->is(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L0
    return-object p0
  :L0
  .line 135
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 136
    check-cast p0, Landroid/view/ViewGroup;
  .line 137
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L4
  .line 138
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Lv;->find(Landroid/view/View;)Landroid/view/View;
    move-result-object v2
  .line 139
    if-eqz v2, :L3
    return-object v2
  :L3
  .line 137
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 141
    return-object v1
.end method

.method static first(Landroid/view/View;)I
  .registers 3
  .line 43
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 44
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 45
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v0
    if-nez v0, :L1
    return v1
  :L1
  .line 46
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v0
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    sub-int/2addr v0, p0
    return v0
.end method

.method static firstShown(Landroid/view/View;I)I
  .registers 7
  .line 98
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 99
    move-object v0, p0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 100
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v2
  .line 101
    nop
  :L1
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-ge v1, v3, :L3
  .line 102
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 103
    invoke-virtual { v0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v4
    sub-int/2addr v4, v2
  .line 104
    if-ltz v4, :L2
    invoke-virtual { v3 }, Landroid/view/View;->getBottom()I
    move-result v3
    if-le v3, p1, :L2
    return v4
  :L2
  .line 101
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 106
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->first(Landroid/view/View;)I
    move-result p0
    return p0
.end method

.method static go(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .registers 4
  .line 111
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/SongRows;->go(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  :L0
  .line 112
    return-void
.end method

.method static is(Landroid/view/View;)Z
  .registers 1
  .line 23
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->rows(Landroid/view/View;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method static last(Landroid/view/View;)I
  .registers 3
  .line 50
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    const/4 v1, -1
    if-nez v0, :L0
    return v1
  :L0
  .line 51
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 52
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v0
  .line 53
    if-nez v0, :L1
    return v1
  :L1
  .line 54
    add-int/lit8 v0, v0, -1
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v0
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    sub-int/2addr v0, p0
    return v0
.end method

.method private static lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
  .registers 3
  .line 36
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 37
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
  .line 38
    instance-of v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-eqz v0, :L1
    move-object v1, p0
    check-cast v1, Landroidx/recyclerview/widget/LinearLayoutManager;
  :L1
    return-object v1
.end method

.method static model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 1
  .line 27
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->rows(Landroid/view/View;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
  .line 28
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->model()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  :L1
    return-object p0
.end method

.method static pin(Landroid/view/View;I)V
  .registers 3
  .line 88
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    move-object v0, p0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->pinTop(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
  :L0
  .line 89
    return-void
.end method

.method static place(Landroid/view/View;II)V
  .registers 5
  .line 76
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
    move-result-object v0
  .line 77
    if-nez v0, :L0
    return-void
  :L0
  .line 78
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 79
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 80
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 81
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v1
  .line 82
    add-int/2addr p1, v1
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/SongRows;->moving(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 83
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result p0
    sub-int/2addr p2, p0
    invoke-virtual { v0, p1, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V
  .line 84
    return-void
.end method

.method static rest(Landroid/view/View;)V
  .registers 3
  .line 93
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    move-object v0, p0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v0
    neg-int v0, v0
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingTop()I
    move-result v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
  :L0
  .line 94
    return-void
.end method

.method static row(Landroid/view/View;I)Landroid/view/View;
  .registers 3
  .line 59
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
    move-result-object v0
  .line 60
    if-nez v0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    add-int/2addr p1, p0
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p0
  :L1
    return-object p0
.end method

.method private static rows(Landroid/view/View;)Lcom/innioasis/ipp/SongRows;
  .registers 2
  .line 32
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return-object p0
.end method

.method static scrolled(Landroid/view/View;)I
  .registers 3
  .line 121
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
    move-result-object v0
  .line 122
    const/4 v1, 0
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 123
    if-nez v0, :L2
    const/4 p0, -1
    goto :L3
  :L2
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingTop()I
    move-result p0
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v0
    sub-int/2addr p0, v0
    invoke-static { v1, p0 }, Ljava/lang/Math;->max(II)I
    move-result p0
  :L3
    return p0
.end method

.method static select(Landroid/view/View;I)V
  .registers 3
  .line 116
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->select(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L0
  .line 117
    return-void
.end method

.method static shuffle(Landroid/view/View;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .registers 1
  .line 128
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->rows(Landroid/view/View;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
  .line 129
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->shuffle()Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object p0
  :L1
    return-object p0
.end method

.method static top(Landroid/view/View;)I
  .registers 2
  .line 65
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v0, :L0
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingTop()I
    move-result p0
    return p0
  :L0
  .line 66
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 67
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result p0
    return p0
.end method

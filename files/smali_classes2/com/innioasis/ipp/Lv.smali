.class final Lcom/innioasis/ipp/Lv;
.super Ljava/lang/Object;
.source "Lv.java"

.method private constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static bottom(Landroid/view/View;)I
  .registers 2
  .line 81
    invoke-virtual { p0 }, Landroid/view/View;->getHeight()I
    move-result v0
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingBottom()I
    move-result p0
    sub-int/2addr v0, p0
    return v0
.end method

.method static find(Landroid/view/View;)Landroid/view/View;
  .registers 4
  .line 136
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->is(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L0
    return-object p0
  :L0
  .line 137
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 138
    check-cast p0, Landroid/view/ViewGroup;
  .line 139
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L4
  .line 140
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Lv;->find(Landroid/view/View;)Landroid/view/View;
    move-result-object v2
  .line 141
    if-eqz v2, :L3
    return-object v2
  :L3
  .line 139
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 143
    return-object v1
.end method

.method static first(Landroid/view/View;)I
  .registers 3
  .line 49
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result p0
    return p0
  :L0
  .line 50
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 51
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v0
    const/4 v1, 0
    if-nez v0, :L1
    return v1
  :L1
  .line 52
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result p0
    add-int/lit8 p0, p0, -1
    return p0
.end method

.method static is(Landroid/view/View;)Z
  .registers 2
  .line 26
    instance-of v0, p0, Landroid/widget/ListView;
    if-nez v0, :L1
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
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

.method static last(Landroid/view/View;)I
  .registers 2
  .line 56
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-virtual { p0 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result p0
    return p0
  :L0
  .line 57
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 58
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v0
  .line 59
    if-nez v0, :L1
    const/4 p0, -1
    return p0
  :L1
  .line 60
    add-int/lit8 v0, v0, -1
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result p0
    add-int/lit8 p0, p0, -1
    return p0
.end method

.method private static lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
  .registers 2
  .line 43
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
  .line 44
    instance-of v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return-object p0
.end method

.method static model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
  .registers 3
  .line 30
    instance-of v0, p0, Landroid/widget/ListView;
    const/4 v1, 0
    if-eqz v0, :L1
  .line 31
    check-cast p0, Landroid/widget/ListView;
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object p0
  .line 32
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v0, :L0
    move-object v1, p0
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  :L0
    return-object v1
  :L1
  .line 34
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->rows(Landroid/view/View;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
  .line 35
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->model()Lcom/innioasis/music/adapter/SongListAdapter;
    move-result-object v1
  :L3
    return-object v1
.end method

.method static pin(Landroid/view/View;I)V
  .registers 3
  .line 101
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
    goto :L1
  :L0
  .line 102
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->top(Landroid/view/View;)I
    move-result v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
  :L1
  .line 103
    return-void
.end method

.method static place(Landroid/view/View;II)V
  .registers 4
  .line 86
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
  .line 87
    check-cast p0, Landroid/widget/ListView;
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
  .line 88
    return-void
  :L0
  .line 90
    move-object v0, p0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 91
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
    move-result-object p0
  .line 92
    if-nez p0, :L1
    return-void
  :L1
  .line 93
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 94
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 95
    add-int/lit8 p1, p1, 1
    invoke-static { v0, p1, p2 }, Lcom/innioasis/ipp/SongRows;->moving(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 96
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v0
    sub-int/2addr p2, v0
    invoke-virtual { p0, p1, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V
  .line 97
    return-void
.end method

.method static rest(Landroid/view/View;)V
  .registers 3
  .line 107
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->rest(Landroid/widget/ListView;)V
    goto :L1
  :L0
  .line 108
    const/4 v0, -1
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->top(Landroid/view/View;)I
    move-result v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
  :L1
  .line 109
    return-void
.end method

.method static row(Landroid/view/View;I)Landroid/view/View;
  .registers 4
  .line 65
    instance-of v0, p0, Landroid/widget/ListView;
    const/4 v1, 0
    if-eqz v0, :L2
  .line 66
    check-cast p0, Landroid/widget/ListView;
  .line 67
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
    sub-int/2addr p1, v0
  .line 68
    if-ltz p1, :L1
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L1
  :L0
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  :L1
    return-object v1
  :L2
  .line 70
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
    move-result-object p0
  .line 71
    if-nez p0, :L3
    goto :L4
  :L3
    add-int/lit8 p1, p1, 1
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v1
  :L4
    return-object v1
.end method

.method private static rows(Landroid/view/View;)Lcom/innioasis/ipp/SongRows;
  .registers 2
  .line 39
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
  .registers 4
  .line 113
    instance-of v0, p0, Landroid/widget/ListView;
    const/4 v1, -1
    const/4 v2, 0
    if-eqz v0, :L4
  .line 114
    check-cast p0, Landroid/widget/ListView;
  .line 115
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
    if-nez v0, :L3
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
    if-nez v0, :L0
    goto :L3
  :L0
  .line 116
    invoke-virtual { p0, v2 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  .line 117
    if-nez v0, :L1
    goto :L2
  :L1
    invoke-virtual { p0 }, Landroid/widget/ListView;->getPaddingTop()I
    move-result p0
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v0
    sub-int/2addr p0, v0
    invoke-static { v2, p0 }, Ljava/lang/Math;->max(II)I
    move-result v1
  :L2
    return v1
  :L3
  .line 115
    return v1
  :L4
  .line 119
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
    move-result-object v0
  .line 120
    if-nez v0, :L5
    const/4 v0, 0
    goto :L6
  :L5
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v0
  :L6
  .line 121
    if-nez v0, :L7
    goto :L8
  :L7
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingTop()I
    move-result p0
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v0
    sub-int/2addr p0, v0
    invoke-static { v2, p0 }, Ljava/lang/Math;->max(II)I
    move-result v1
  :L8
    return v1
.end method

.method static shuffle(Landroid/view/View;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .registers 3
  .line 126
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->rows(Landroid/view/View;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 127
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->shuffle()Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object p0
    return-object p0
  :L0
  .line 128
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 129
    instance-of v0, p0, Landroid/view/View;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 130
    check-cast p0, Landroid/view/View;
    const v0, 2131362396
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 131
    instance-of v0, p0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eqz v0, :L2
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  :L2
    return-object v1
.end method

.method static top(Landroid/view/View;)I
  .registers 2
  .line 76
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result p0
    return p0
  :L0
  .line 77
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingTop()I
    move-result p0
    return p0
.end method

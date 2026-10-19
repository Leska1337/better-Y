.class final Lcom/innioasis/ipp/Lv;
.super Ljava/lang/Object;
.source "Lv.java"

.method private constructor <init>()V
  .registers 1
  .line 23
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static bottom(Landroid/view/View;)I
  .registers 2
  .line 83
    invoke-virtual { p0 }, Landroid/view/View;->getHeight()I
    move-result v0
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingBottom()I
    move-result p0
    sub-int/2addr v0, p0
    return v0
.end method

.method static find(Landroid/view/View;)Landroid/view/View;
  .registers 4
  .line 167
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->is(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L0
    return-object p0
  :L0
  .line 168
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 169
    check-cast p0, Landroid/view/ViewGroup;
  .line 170
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v0, v2, :L4
  .line 171
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Lv;->find(Landroid/view/View;)Landroid/view/View;
    move-result-object v2
  .line 172
    if-eqz v2, :L3
    return-object v2
  :L3
  .line 170
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 174
    return-object v1
.end method

.method static first(Landroid/view/View;)I
  .registers 3
  .line 50
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result p0
    return p0
  :L0
  .line 51
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 52
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v0
    const/4 v1, 0
    if-nez v0, :L1
    return v1
  :L1
  .line 53
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
  .line 116
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
  .line 117
    check-cast p0, Landroid/widget/ListView;
  .line 118
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Wheel;->firstShown(Landroid/widget/ListView;II)I
    move-result p0
    return p0
  :L0
  .line 120
    move-object v0, p0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 121
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v1
  .line 122
    const/4 v2, 0
  :L1
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-ge v2, v3, :L3
  .line 123
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 124
    invoke-virtual { v0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v4
    sub-int/2addr v4, v1
  .line 125
    if-ltz v4, :L2
    invoke-virtual { v3 }, Landroid/view/View;->getBottom()I
    move-result v3
    if-le v3, p1, :L2
    return v4
  :L2
  .line 122
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 127
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->first(Landroid/view/View;)I
    move-result p0
    return p0
.end method

.method static go(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .registers 4
  .line 132
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    check-cast p0, Landroid/widget/ListView;
    invoke-virtual { v0, p0, p1, p2 }, Lcom/innioasis/music/util/Other;->gotoAdapter(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
    goto :L1
  :L0
  .line 133
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L1
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/SongRows;->go(Landroidx/recyclerview/widget/RecyclerView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  :L1
  .line 134
    return-void
.end method

.method static is(Landroid/view/View;)Z
  .registers 2
  .line 27
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
  .line 57
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-virtual { p0 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result p0
    return p0
  :L0
  .line 58
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 59
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v0
  .line 60
    if-nez v0, :L1
    const/4 p0, -1
    return p0
  :L1
  .line 61
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
  .registers 2
  .line 44
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
  .line 45
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
  .line 31
    instance-of v0, p0, Landroid/widget/ListView;
    const/4 v1, 0
    if-eqz v0, :L1
  .line 32
    check-cast p0, Landroid/widget/ListView;
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object p0
  .line 33
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v0, :L0
    move-object v1, p0
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  :L0
    return-object v1
  :L1
  .line 35
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->rows(Landroid/view/View;)Lcom/innioasis/ipp/SongRows;
    move-result-object p0
  .line 36
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows;->model()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v1
  :L3
    return-object v1
.end method

.method static pin(Landroid/view/View;I)V
  .registers 3
  .line 104
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
    goto :L1
  :L0
  .line 105
    move-object v0, p0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->pinTop(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
  :L1
  .line 106
    return-void
.end method

.method static place(Landroid/view/View;II)V
  .registers 5
  .line 88
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
  .line 89
    check-cast p0, Landroid/widget/ListView;
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
  .line 90
    return-void
  :L0
  .line 92
    move-object v0, p0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 93
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
    move-result-object p0
  .line 94
    if-nez p0, :L1
    return-void
  :L1
  .line 95
    invoke-static { }, Lcom/innioasis/ipp/Wheel$Glider;->stop()V
  .line 96
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V
  .line 97
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v1
  .line 98
    add-int/2addr p1, v1
    invoke-static { v0, p1, p2 }, Lcom/innioasis/ipp/SongRows;->moving(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 99
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v0
    sub-int/2addr p2, v0
    invoke-virtual { p0, p1, p2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V
  .line 100
    return-void
.end method

.method static rest(Landroid/view/View;)V
  .registers 3
  .line 110
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->rest(Landroid/widget/ListView;)V
    goto :L1
  :L0
  .line 111
    move-object v0, p0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v0
    neg-int v0, v0
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingTop()I
    move-result v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
  :L1
  .line 112
    return-void
.end method

.method static row(Landroid/view/View;I)Landroid/view/View;
  .registers 4
  .line 66
    instance-of v0, p0, Landroid/widget/ListView;
    const/4 v1, 0
    if-eqz v0, :L2
  .line 67
    check-cast p0, Landroid/widget/ListView;
  .line 68
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
    sub-int/2addr p1, v0
  .line 69
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
  .line 71
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
    move-result-object v0
  .line 72
    if-nez v0, :L3
    goto :L4
  :L3
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result p0
    add-int/2addr p1, p0
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v1
  :L4
    return-object v1
.end method

.method private static rows(Landroid/view/View;)Lcom/innioasis/ipp/SongRows;
  .registers 2
  .line 40
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
  .line 144
    instance-of v0, p0, Landroid/widget/ListView;
    const/4 v1, -1
    const/4 v2, 0
    if-eqz v0, :L4
  .line 145
    check-cast p0, Landroid/widget/ListView;
  .line 146
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
    if-nez v0, :L3
    invoke-virtual { p0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
    if-nez v0, :L0
    goto :L3
  :L0
  .line 147
    invoke-virtual { p0, v2 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  .line 148
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
  .line 146
    return v1
  :L4
  .line 150
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->lm(Landroid/view/View;)Landroidx/recyclerview/widget/LinearLayoutManager;
    move-result-object v0
  .line 151
    if-nez v0, :L5
    const/4 v0, 0
    goto :L6
  :L5
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v0
  :L6
  .line 152
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

.method static select(Landroid/view/View;I)V
  .registers 3
  .line 138
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->setSelection(I)V
    goto :L1
  :L0
  .line 139
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L1
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/SongRows;->select(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L1
  .line 140
    return-void
.end method

.method static shuffle(Landroid/view/View;)Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  .registers 3
  .line 157
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->rows(Landroid/view/View;)Lcom/innioasis/ipp/SongRows;
    move-result-object v0
  .line 158
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->shuffle()Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    move-result-object p0
    return-object p0
  :L0
  .line 159
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 160
    instance-of v0, p0, Landroid/view/View;
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 161
    check-cast p0, Landroid/view/View;
    const v0, 2131362396
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 162
    instance-of v0, p0, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    if-eqz v0, :L2
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
  :L2
    return-object v1
.end method

.method static top(Landroid/view/View;)I
  .registers 2
  .line 77
    instance-of v0, p0, Landroid/widget/ListView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/ListView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result p0
    return p0
  :L0
  .line 78
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 79
    invoke-static { p0 }, Lcom/innioasis/ipp/SongRows;->heads(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result p0
    return p0
.end method

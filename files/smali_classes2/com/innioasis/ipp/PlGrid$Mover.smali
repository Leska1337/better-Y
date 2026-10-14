.class final Lcom/innioasis/ipp/PlGrid$Mover;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Mover"
.end annotation

.field private final static RATE:F = 14.0F

.field private final static VMAX:F = 6000.0F

.field private final static VMIN:F = 400.0F

.field private b:F

.field private final draw:Landroid/graphics/RectF;

.field private has:Z

.field private l:F

.field private last:J

.field private final paint:Landroid/graphics/Paint;

.field private r:F

.field private radius:F

.field private t:F

.method constructor <init>()V
  .registers 3
  .line 171
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 176
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
  .line 178
    new-instance v0, Landroid/graphics/RectF;
    invoke-direct { v0 }, Landroid/graphics/RectF;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L22 } :L23
  .registers 21
  .line 186
    move-object/from16 v1, p0
  :L0
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 187
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v2
  .line 188
    instance-of v3, v2, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    const/4 v4, 0
    if-eqz v3, :L21
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->access$100(Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :L21
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$200()Z
    move-result v0
    if-eqz v0, :L1
    goto/16 :L21
  :L1
  .line 192
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result v0
  .line 193
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v3
    const/4 v5, 0
    if-nez v3, :L2
    move-object v2, v5
    goto :L3
  :L2
  .line 194
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v3
    check-cast v2, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result v2
    invoke-virtual { v3, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v2
  :L3
  .line 195
    if-nez v2, :L4
    goto :L5
  :L4
    const v3, 2131362091
    invoke-virtual { v2, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v5
  :L5
  .line 196
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 197
    nop
  .line 198
    instance-of v6, v5, Landroidx/cardview/widget/CardView;
    const-wide/16 v7, 0
    if-eqz v6, :L15
  .line 201
    invoke-virtual { v5 }, Landroid/view/View;->getPaddingLeft()I
    move-result v6
    int-to-float v6, v6
    invoke-virtual { v5 }, Landroid/view/View;->getPaddingTop()I
    move-result v9
    add-int/2addr v9, v0
    int-to-float v9, v9
  .line 202
    move-object v10, v5
  :L6
    if-eqz v10, :L8
    move-object/from16 v11, p2
    if-eq v10, v11, :L9
  .line 203
    invoke-virtual { v10 }, Landroid/view/View;->getLeft()I
    move-result v12
    int-to-float v12, v12
    add-float/2addr v6, v12
  .line 204
    invoke-virtual { v10 }, Landroid/view/View;->getTop()I
    move-result v12
    int-to-float v12, v12
    add-float/2addr v9, v12
  .line 205
    invoke-virtual { v10 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v12
    instance-of v12, v12, Landroid/view/View;
    if-nez v12, :L7
    goto :L9
  :L7
  .line 202
    invoke-virtual { v10 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v10
    check-cast v10, Landroid/view/View;
    goto :L6
  :L8
    move-object/from16 v11, p2
  :L9
  .line 207
    invoke-virtual { v5 }, Landroid/view/View;->getWidth()I
    move-result v10
    int-to-float v10, v10
    add-float/2addr v10, v6
    invoke-virtual { v5 }, Landroid/view/View;->getPaddingLeft()I
    move-result v12
    int-to-float v12, v12
    sub-float/2addr v10, v12
    invoke-virtual { v5 }, Landroid/view/View;->getPaddingRight()I
    move-result v12
    int-to-float v12, v12
    sub-float/2addr v10, v12
  .line 208
    invoke-virtual { v5 }, Landroid/view/View;->getHeight()I
    move-result v12
    int-to-float v12, v12
    add-float/2addr v12, v9
    invoke-virtual { v5 }, Landroid/view/View;->getPaddingTop()I
    move-result v13
    int-to-float v13, v13
    sub-float/2addr v12, v13
    invoke-virtual { v5 }, Landroid/view/View;->getPaddingBottom()I
    move-result v13
    int-to-float v13, v13
    sub-float/2addr v12, v13
  .line 209
    check-cast v5, Landroidx/cardview/widget/CardView;
    invoke-virtual { v5 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result v5
    iput v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
  .line 210
    iget-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    const/4 v13, 1
    if-nez v5, :L10
  .line 211
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    iput v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    iput v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->r:F
    iput v12, v1, Lcom/innioasis/ipp/PlGrid$Mover;->b:F
  .line 212
    iput-boolean v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    goto/16 :L16
  :L10
  .line 214
    iget-wide v14, v1, Lcom/innioasis/ipp/PlGrid$Mover;->last:J
    cmp-long v5, v14, v7
    if-nez v5, :L11
    const v5, 1015222895
    goto :L12
  :L11
    sub-long v14, v2, v14
    long-to-float v5, v14
    const/high16 v14, 0x447A0000
    div-float/2addr v5, v14
    const v14, 1028443341
    invoke-static { v14, v5 }, Ljava/lang/Math;->min(FF)F
    move-result v5
  :L12
  .line 215
    iget v14, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    sub-float v14, v6, v14
    iget v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    sub-float v15, v9, v15
  .line 216
    mul-float v14, v14, v14
    mul-float v15, v15, v15
    add-float/2addr v14, v15
    float-to-double v14, v14
    invoke-static { v14, v15 }, Ljava/lang/Math;->sqrt(D)D
    move-result-wide v14
    double-to-float v14, v14
  .line 217
    nop
  .line 218
    const/high16 v15, 0x3F800000
    cmpl-float v16, v14, v15
    if-ltz v16, :L13
  .line 219
    const/high16 v16, 0x41600000
    mul-float v7, v14, v16
    const v8, 1169915904
    invoke-static { v8, v7 }, Ljava/lang/Math;->min(FF)F
    move-result v7
    const/high16 v8, 0x43C80000
    invoke-static { v8, v7 }, Ljava/lang/Math;->max(FF)F
    move-result v7
  .line 220
    mul-float v7, v7, v5
    div-float/2addr v7, v14
    invoke-static { v15, v7 }, Ljava/lang/Math;->min(FF)F
    move-result v5
    goto :L14
  :L13
  .line 218
    const/high16 v5, 0x3F800000
  :L14
  .line 222
    iget v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    sub-float/2addr v6, v7
    mul-float v6, v6, v5
    add-float/2addr v7, v6
    iput v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 223
    iget v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    sub-float/2addr v9, v6
    mul-float v9, v9, v5
    add-float/2addr v6, v9
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 224
    iget v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->r:F
    sub-float/2addr v10, v6
    mul-float v10, v10, v5
    add-float/2addr v6, v10
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->r:F
  .line 225
    iget v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->b:F
    sub-float/2addr v12, v6
    mul-float v12, v12, v5
    add-float/2addr v6, v12
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->b:F
  .line 226
    cmpg-float v5, v5, v15
    if-gez v5, :L16
    const/4 v4, 1
    goto :L16
  :L15
  .line 198
    move-object/from16 v11, p2
  :L16
  .line 229
    if-eqz v4, :L17
    goto :L18
  :L17
    const-wide/16 v2, 0
  :L18
    iput-wide v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->last:J
  .line 230
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez v2, :L19
    return-void
  :L19
  .line 231
    iget-object v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileFrame()I
    move-result v3
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setColor(I)V
  .line 232
    iget-object v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    iget v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    iget v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    int-to-float v0, v0
    sub-float/2addr v5, v0
    iget v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->r:F
    iget v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->b:F
    sub-float/2addr v7, v0
    invoke-virtual { v2, v3, v5, v6, v7 }, Landroid/graphics/RectF;->set(FFFF)V
  .line 233
    iget-object v0, v1, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
    iget-object v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
    move-object/from16 v5, p1
    invoke-virtual { v5, v0, v2, v2, v3 }, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V
  .line 234
    if-eqz v4, :L20
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateOnAnimation()V
  :L20
  .line 236
    goto :L24
  :L21
  .line 189
    iput-boolean v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
  :L22
  .line 190
    return-void
  :L23
  .line 235
    move-exception v0
  :L24
  .line 237
    return-void
.end method

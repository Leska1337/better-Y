.class final Lcom/innioasis/ipp/Follow$Land;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Follow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Follow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Land"
.end annotation

.field private final a:Lcom/innioasis/music/adapter/MyBaseAdapter;

.field private final lv:Landroid/view/View;

.field private passes:I

.field private final pos:I

.field private settled:I

.field private snaps:I

.field private final until:J

.method constructor <init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  .registers 8
  .line 283
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 278
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    const-wide/16 v2, 2000
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/ipp/Follow$Land;->until:J
  .line 284
    iput-object p1, p0, Lcom/innioasis/ipp/Follow$Land;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 285
    iput-object p2, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
  .line 286
    iput p3, p0, Lcom/innioasis/ipp/Follow$Land;->pos:I
  .line 287
    return-void
.end method

.method private done()Z
  .registers 2
  .line 314
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Follow$Land;->drop()V
  .line 315
    invoke-static { }, Lcom/innioasis/ipp/Follow;->access$200()Lcom/innioasis/ipp/Follow$Land;
    move-result-object v0
    if-ne v0, p0, :L0
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->access$202(Lcom/innioasis/ipp/Follow$Land;)Lcom/innioasis/ipp/Follow$Land;
  :L0
  .line 316
    const/4 v0, 1
    return v0
.end method

.method private restIfNoNeed(Landroid/view/View;II)Z
  .registers 7
  .line 295
    iget v0, p0, Lcom/innioasis/ipp/Follow$Land;->snaps:I
    const/4 v1, 2
    const/4 v2, 0
    if-lt v0, v1, :L0
    return v2
  :L0
  .line 296
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Lv;->scrolled(Landroid/view/View;)I
    move-result v0
  .line 297
    if-gtz v0, :L1
    return v2
  :L1
  .line 298
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result p1
    add-int/2addr p1, v0
    sub-int/2addr p2, p3
    if-le p1, p2, :L2
    return v2
  :L2
  .line 299
    iget p1, p0, Lcom/innioasis/ipp/Follow$Land;->snaps:I
    const/4 p2, 1
    add-int/2addr p1, p2
    iput p1, p0, Lcom/innioasis/ipp/Follow$Land;->snaps:I
  .line 300
    iget-object p1, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    invoke-static { p1 }, Lcom/innioasis/ipp/Lv;->rest(Landroid/view/View;)V
  .line 301
    iput v2, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
  .line 302
    return p2
.end method

.method drop()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 308
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 310
    goto :L3
  :L2
  .line 309
    move-exception v0
  :L3
  .line 311
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L17 } :L18
  .registers 9
  :L0
  .line 323
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v0
  .line 324
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Land;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eq v0, v1, :L1
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
    return v0
  :L1
  .line 326
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Lv;->top(Landroid/view/View;)I
    move-result v0
  .line 327
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    invoke-static { v1 }, Lcom/innioasis/ipp/Lv;->bottom(Landroid/view/View;)I
    move-result v1
  .line 328
    iget v2, p0, Lcom/innioasis/ipp/Follow$Land;->passes:I
    const/4 v3, 1
    add-int/2addr v2, v3
    iput v2, p0, Lcom/innioasis/ipp/Follow$Land;->passes:I
    const/16 v4, 12
    if-gt v2, v4, :L16
  .line 329
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    iget-wide v6, p0, Lcom/innioasis/ipp/Follow$Land;->until:J
    cmp-long v2, v4, v6
    if-lez v2, :L2
    goto/16 :L16
  :L2
  .line 330
    if-gt v1, v0, :L3
    return v3
  :L3
  .line 332
    iget-object v2, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    iget v4, p0, Lcom/innioasis/ipp/Follow$Land;->pos:I
    invoke-static { v2, v4 }, Lcom/innioasis/ipp/Lv;->row(Landroid/view/View;I)Landroid/view/View;
    move-result-object v2
  .line 333
    const/4 v4, 0
    if-eqz v2, :L9
  .line 334
    invoke-virtual { v2 }, Landroid/view/View;->getHeight()I
    move-result v5
  .line 335
    sub-int v6, v1, v0
    if-le v5, v6, :L4
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
    return v0
  :L4
  .line 336
    invoke-direct { p0, v2, v1, v5 }, Lcom/innioasis/ipp/Follow$Land;->restIfNoNeed(Landroid/view/View;II)Z
    move-result v6
    if-eqz v6, :L5
    return v4
  :L5
  .line 337
    invoke-virtual { v2 }, Landroid/view/View;->getBottom()I
    move-result v6
    if-le v6, v1, :L6
  .line 338
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    iget v2, p0, Lcom/innioasis/ipp/Follow$Land;->pos:I
    sub-int/2addr v1, v5
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
  .line 339
    iput v4, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
  .line 340
    return v4
  :L6
  .line 342
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v1
    if-ge v1, v0, :L7
  .line 343
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    iget v2, p0, Lcom/innioasis/ipp/Follow$Land;->pos:I
    invoke-static { v1, v2, v0 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
  .line 344
    iput v4, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
  .line 345
    return v4
  :L7
  .line 347
    iget v0, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
    add-int/2addr v0, v3
    iput v0, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
    const/4 v1, 3
    if-lt v0, v1, :L8
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
    return v0
  :L8
  .line 348
    return v3
  :L9
  .line 352
    nop
  .line 353
    const/4 v2, 0
    const/4 v3, 0
  :L10
    iget-object v5, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    check-cast v5, Landroid/view/ViewGroup;
    invoke-virtual { v5 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v5
    if-ge v2, v5, :L12
  .line 354
    iget-object v5, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    check-cast v5, Landroid/view/ViewGroup;
    invoke-virtual { v5, v2 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v5
  .line 355
    if-eqz v5, :L11
    invoke-virtual { v5 }, Landroid/view/View;->getHeight()I
    move-result v6
    if-le v6, v3, :L11
    invoke-virtual { v5 }, Landroid/view/View;->getHeight()I
    move-result v3
  :L11
  .line 353
    add-int/lit8 v2, v2, 1
    goto :L10
  :L12
  .line 357
    if-gtz v3, :L13
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
    return v0
  :L13
  .line 358
    sub-int/2addr v1, v3
  .line 359
    if-ge v1, v0, :L14
    goto :L15
  :L14
    move v0, v1
  :L15
  .line 360
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/view/View;
    iget v2, p0, Lcom/innioasis/ipp/Follow$Land;->pos:I
    invoke-static { v1, v2, v0 }, Lcom/innioasis/ipp/Lv;->place(Landroid/view/View;II)V
  .line 361
    iput v4, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
  .line 362
    return v4
  :L16
  .line 329
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
  :L17
    return v0
  :L18
  .line 363
    move-exception v0
  .line 364
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
    return v0
.end method

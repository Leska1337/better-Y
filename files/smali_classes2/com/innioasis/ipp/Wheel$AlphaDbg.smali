.class final Lcom/innioasis/ipp/Wheel$AlphaDbg;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.implements Landroid/view/Choreographer$FrameCallback;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Wheel.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wheel;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "AlphaDbg"
.end annotation

.field private final at:J

.field private frame:J

.field private laid:J

.field private pre:J

.field private final rv:Landroidx/recyclerview/widget/RecyclerView;

.method constructor <init>(JLandroidx/recyclerview/widget/RecyclerView;)V
  .registers 4
  .line 481
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 482
    iput-wide p1, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->at:J
  .line 483
    iput-object p3, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->rv:Landroidx/recyclerview/widget/RecyclerView;
  .line 484
    return-void
.end method

.method public doFrame(J)V
  .registers 3
  .line 487
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p1
    iput-wide p1, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->frame:J
  .line 488
    iget-object p1, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
  .line 489
    iget-object p1, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 490
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1000()Landroid/os/Handler;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 491
    return-void
.end method

.method public onGlobalLayout()V
  .registers 6
  .line 494
    iget-wide v0, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->laid:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-nez v4, :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iput-wide v0, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->laid:J
  :L0
  .line 495
    return-void
.end method

.method public onPreDraw()Z
  .registers 6
  .line 498
    iget-wide v0, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->pre:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-nez v4, :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iput-wide v0, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->pre:J
  :L0
  .line 499
    const/4 v0, 1
    return v0
.end method

.method public run()V
  .registers 13
  .line 503
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 504
    iget-object v2, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v2
    invoke-virtual { v2, p0 }, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
  .line 505
    iget-object v2, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v2
    invoke-virtual { v2, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 506
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "alpha frame "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    iget-wide v3, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->at:J
    sub-long v3, v0, v3
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " ms: wait "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    iget-wide v3, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->frame:J
    iget-wide v5, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->at:J
    sub-long/2addr v3, v5
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " layout "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    iget-wide v3, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->laid:J
    const-wide/16 v5, -1
    const-wide/16 v7, 0
    cmp-long v9, v3, v7
    if-nez v9, :L0
    move-wide v3, v5
    goto :L1
  :L0
    iget-wide v9, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->frame:J
    sub-long/2addr v3, v9
  :L1
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " predraw "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 507
    iget-wide v3, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->pre:J
    cmp-long v9, v3, v7
    if-nez v9, :L2
    move-wide v3, v5
    goto :L4
  :L2
    iget-wide v9, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->laid:J
    cmp-long v11, v9, v7
    if-nez v11, :L3
    iget-wide v9, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->frame:J
  :L3
    sub-long/2addr v3, v9
  :L4
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " draw "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    iget-wide v3, p0, Lcom/innioasis/ipp/Wheel$AlphaDbg;->pre:J
    cmp-long v9, v3, v7
    if-nez v9, :L5
    goto :L6
  :L5
    sub-long v5, v0, v3
  :L6
    invoke-virtual { v2, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ", binds "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget v1, Lcom/innioasis/ipp/SongRows;->dbgBinds:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " in "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-wide v1, Lcom/innioasis/ipp/SongRows;->dbgBindMs:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms, made "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget v1, Lcom/innioasis/ipp/SongRows;->dbgMade:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ", requested before "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget v1, Lcom/innioasis/ipp/SongRows;->dbgReqBefore:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " after "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget v1, Lcom/innioasis/ipp/SongRows;->dbgReqAfter:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ["
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/SongRows;->dbgWho:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "]"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 506
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->dbg(Ljava/lang/String;)V
  .line 509
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/SongRows;->dbgWho:Ljava/lang/String;
  .line 510
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/SongRows;->dbgReqBefore:I
  .line 511
    sput v0, Lcom/innioasis/ipp/SongRows;->dbgReqAfter:I
  .line 512
    sput v0, Lcom/innioasis/ipp/SongRows;->dbgBinds:I
  .line 513
    sput-wide v7, Lcom/innioasis/ipp/SongRows;->dbgBindMs:J
  .line 514
    sput v0, Lcom/innioasis/ipp/SongRows;->dbgMade:I
  .line 515
    return-void
.end method

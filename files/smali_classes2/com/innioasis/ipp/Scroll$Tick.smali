.class final Lcom/innioasis/ipp/Scroll$Tick;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Scroll.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Scroll;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Tick"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 473
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private post(I)V
  .registers 6
  .line 581
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$000()Z
    move-result v0
    if-nez v0, :L0
  .line 582
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$002(Z)Z
  .line 583
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$1400()Landroid/os/Handler;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$1300()Lcom/innioasis/ipp/Scroll$Tick;
    move-result-object v1
    int-to-long v2, p1
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L0
  .line 585
    return-void
.end method

.method public run()V
  .registers 13
  .line 476
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$002(Z)Z
  .line 477
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
  :L0
    if-ltz v1, :L2
  .line 478
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v3
    invoke-virtual { v3, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Scroll;
    invoke-static { v3 }, Lcom/innioasis/ipp/Scroll;->access$200(Lcom/innioasis/ipp/Scroll;)Z
    move-result v3
    if-eqz v3, :L1
  .line 479
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v3
    invoke-virtual { v3, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  :L1
  .line 477
    add-int/lit8 v1, v1, -1
    goto :L0
  :L2
  .line 482
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
  .line 483
    if-nez v1, :L3
  .line 484
    return-void
  :L3
  .line 487
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v3
  .line 488
    nop
  .line 489
    nop
  .line 490
    nop
  .line 491
    nop
  .line 492
    const/4 v4, 0
    const/4 v5, 0
    const/4 v6, 0
    const/4 v7, 0
    const/4 v8, 0
  :L4
    if-ge v4, v1, :L12
  .line 493
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v9
    invoke-virtual { v9, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Lcom/innioasis/ipp/Scroll;
  .line 494
    if-eqz v3, :L5
    invoke-static { v9 }, Lcom/innioasis/ipp/Scroll;->access$300(Lcom/innioasis/ipp/Scroll;)Landroid/widget/TextView;
    move-result-object v10
    invoke-virtual { v10 }, Landroid/widget/TextView;->isShown()Z
    move-result v10
    if-eqz v10, :L5
    const/4 v10, 1
    goto :L6
  :L5
    const/4 v10, 0
  :L6
  .line 495
    invoke-static { v9 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v11
    if-eqz v11, :L7
  .line 496
    const/4 v8, 1
  :L7
  .line 498
    if-eqz v10, :L8
    invoke-static { v9 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v11
    if-nez v11, :L8
  .line 499
    const/4 v7, 1
  :L8
  .line 501
    if-nez v10, :L9
    invoke-static { v9 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v11
    if-eqz v11, :L9
  .line 502
    const/4 v6, 1
  :L9
  .line 504
    invoke-static { v9, v10 }, Lcom/innioasis/ipp/Scroll;->access$402(Lcom/innioasis/ipp/Scroll;Z)Z
  .line 505
    if-nez v10, :L10
  .line 506
    invoke-static { v9 }, Lcom/innioasis/ipp/Scroll;->access$500(Lcom/innioasis/ipp/Scroll;)V
    goto :L11
  :L10
  .line 508
    const/4 v5, 1
  :L11
  .line 492
    add-int/lit8 v4, v4, 1
    goto :L4
  :L12
  .line 511
    const/16 v2, 1000
    if-nez v5, :L13
  .line 512
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$602(I)I
  .line 513
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 514
    return-void
  :L13
  .line 523
    const-wide/16 v3, 0
    if-nez v6, :L14
    if-eqz v7, :L15
    if-nez v8, :L15
  :L14
  .line 524
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$602(I)I
  .line 525
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Scroll;->access$702(J)J
  :L15
  .line 531
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$700()J
    move-result-wide v5
    const/16 v7, 40
    cmp-long v8, v5, v3
    if-eqz v8, :L17
  .line 532
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$700()J
    move-result-wide v8
    cmp-long v10, v5, v8
    if-lez v10, :L16
  .line 533
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Scroll;->access$702(J)J
    goto :L17
  :L16
  .line 535
    invoke-direct { p0, v7 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 536
    return-void
  :L17
  .line 542
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$600()I
    move-result v3
    const/16 v4, 38
    if-ne v3, v4, :L20
  .line 543
    const/4 v3, 0
  :L18
    if-ge v3, v1, :L20
  .line 544
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v5
    invoke-virtual { v5, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/ipp/Scroll;
  .line 545
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->access$800(Lcom/innioasis/ipp/Scroll;)Z
    move-result v6
    if-nez v6, :L19
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v6
    if-eqz v6, :L19
  .line 546
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->access$900(Lcom/innioasis/ipp/Scroll;)V
  :L19
  .line 543
    add-int/lit8 v3, v3, 1
    goto :L18
  :L20
  .line 551
    nop
  .line 552
    const/4 v3, 0
    const/4 v5, 0
  :L21
    if-ge v3, v1, :L23
  .line 553
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v6
    invoke-virtual { v6, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Scroll;
  .line 554
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$1000(Lcom/innioasis/ipp/Scroll;)Z
    move-result v8
    if-eqz v8, :L22
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v8
    if-eqz v8, :L22
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$1100(Lcom/innioasis/ipp/Scroll;)I
    move-result v8
    if-le v8, v5, :L22
  .line 555
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$1100(Lcom/innioasis/ipp/Scroll;)I
    move-result v5
  :L22
  .line 552
    add-int/lit8 v3, v3, 1
    goto :L21
  :L23
  .line 561
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$600()I
    move-result v3
    if-lt v3, v4, :L24
    if-nez v5, :L24
  .line 562
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 563
    return-void
  :L24
  .line 566
    const/4 v2, 0
  :L25
    if-ge v2, v1, :L27
  .line 567
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Scroll;
  .line 568
    invoke-static { v3 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v6
    if-eqz v6, :L26
  .line 569
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$600()I
    move-result v6
    invoke-static { v3, v6 }, Lcom/innioasis/ipp/Scroll;->access$1200(Lcom/innioasis/ipp/Scroll;I)V
  :L26
  .line 566
    add-int/lit8 v2, v2, 1
    goto :L25
  :L27
  .line 573
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$608()I
  .line 574
    if-lez v5, :L28
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$600()I
    move-result v1
    div-int/lit8 v5, v5, 2
    add-int/2addr v5, v4
    if-le v1, v5, :L28
  .line 575
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$602(I)I
  :L28
  .line 577
    invoke-direct { p0, v7 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 578
    return-void
.end method

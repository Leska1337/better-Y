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
  .line 487
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private post(I)V
  .registers 6
  .line 618
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$000()Z
    move-result v0
    if-nez v0, :L0
  .line 619
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$002(Z)Z
  .line 620
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$1500()Landroid/os/Handler;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$1400()Lcom/innioasis/ipp/Scroll$Tick;
    move-result-object v1
    int-to-long v2, p1
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L0
  .line 622
    return-void
.end method

.method public run()V
  .registers 14
  .line 490
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$002(Z)Z
  .line 491
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
  :L0
    if-ltz v1, :L2
  .line 492
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v3
    invoke-virtual { v3, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Scroll;
    invoke-static { v3 }, Lcom/innioasis/ipp/Scroll;->access$200(Lcom/innioasis/ipp/Scroll;)Z
    move-result v3
    if-eqz v3, :L1
  .line 493
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v3
    invoke-virtual { v3, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  :L1
  .line 491
    add-int/lit8 v1, v1, -1
    goto :L0
  :L2
  .line 496
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
  .line 497
    if-nez v1, :L3
  .line 498
    return-void
  :L3
  .line 501
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v3
  .line 502
    nop
  .line 503
    nop
  .line 504
    nop
  .line 505
    nop
  .line 506
    nop
  .line 507
    const/4 v4, 0
    const/4 v5, 0
    const/4 v6, 0
    const/4 v7, 0
    const/4 v8, 0
    const/4 v9, 0
  :L4
    if-ge v4, v1, :L13
  .line 508
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v10
    invoke-virtual { v10, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Lcom/innioasis/ipp/Scroll;
  .line 509
    if-eqz v3, :L5
    invoke-static { v10 }, Lcom/innioasis/ipp/Scroll;->access$300(Lcom/innioasis/ipp/Scroll;)Landroid/widget/TextView;
    move-result-object v11
    invoke-virtual { v11 }, Landroid/widget/TextView;->isShown()Z
    move-result v11
    if-eqz v11, :L5
    const/4 v11, 1
    goto :L6
  :L5
    const/4 v11, 0
  :L6
  .line 510
    invoke-static { v10 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v12
    if-eqz v12, :L7
  .line 511
    const/4 v8, 1
  :L7
  .line 513
    if-eqz v11, :L8
    invoke-static { v10 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v12
    if-nez v12, :L8
  .line 514
    const/4 v7, 1
  :L8
  .line 516
    if-nez v11, :L9
    invoke-static { v10 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v12
    if-eqz v12, :L9
  .line 517
    const/4 v6, 1
  :L9
  .line 519
    invoke-static { v10, v11 }, Lcom/innioasis/ipp/Scroll;->access$402(Lcom/innioasis/ipp/Scroll;Z)Z
  .line 520
    if-nez v11, :L10
  .line 521
    invoke-static { v10 }, Lcom/innioasis/ipp/Scroll;->access$500(Lcom/innioasis/ipp/Scroll;)V
    goto :L12
  :L10
  .line 523
    nop
  .line 524
    invoke-static { v10 }, Lcom/innioasis/ipp/Scroll;->access$600(Lcom/innioasis/ipp/Scroll;)Z
    move-result v5
    if-eqz v5, :L11
  .line 525
    invoke-static { v10, v0 }, Lcom/innioasis/ipp/Scroll;->access$602(Lcom/innioasis/ipp/Scroll;Z)Z
  .line 526
    const/4 v5, 1
    const/4 v9, 1
    goto :L12
  :L11
  .line 524
    const/4 v5, 1
  :L12
  .line 507
    add-int/lit8 v4, v4, 1
    goto :L4
  :L13
  .line 530
    const/16 v2, 1000
    if-nez v5, :L14
  .line 531
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$702(I)I
  .line 532
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 533
    return-void
  :L14
  .line 542
    const-wide/16 v3, 0
    if-nez v6, :L16
    if-eqz v7, :L15
    if-nez v8, :L15
    goto :L16
  :L15
  .line 545
    if-eqz v9, :L17
  .line 552
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$702(I)I
    goto :L17
  :L16
  .line 543
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$702(I)I
  .line 544
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Scroll;->access$802(J)J
  :L17
  .line 558
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$800()J
    move-result-wide v5
    const/16 v7, 40
    cmp-long v8, v5, v3
    if-eqz v8, :L19
  .line 559
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$800()J
    move-result-wide v8
    cmp-long v10, v5, v8
    if-lez v10, :L18
  .line 560
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Scroll;->access$802(J)J
    goto :L19
  :L18
  .line 562
    invoke-direct { p0, v7 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 563
    return-void
  :L19
  .line 569
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$700()I
    move-result v3
    const/16 v4, 38
    if-ne v3, v4, :L22
  .line 570
    const/4 v3, 0
  :L20
    if-ge v3, v1, :L22
  .line 571
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v5
    invoke-virtual { v5, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/ipp/Scroll;
  .line 572
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->access$900(Lcom/innioasis/ipp/Scroll;)Z
    move-result v6
    if-nez v6, :L21
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v6
    if-eqz v6, :L21
  .line 573
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->access$1000(Lcom/innioasis/ipp/Scroll;)V
  :L21
  .line 570
    add-int/lit8 v3, v3, 1
    goto :L20
  :L22
  .line 578
    nop
  .line 579
    const/4 v3, 0
    const/4 v5, 0
  :L23
    if-ge v3, v1, :L25
  .line 580
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v6
    invoke-virtual { v6, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Scroll;
  .line 581
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$1100(Lcom/innioasis/ipp/Scroll;)Z
    move-result v8
    if-eqz v8, :L24
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v8
    if-eqz v8, :L24
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$1200(Lcom/innioasis/ipp/Scroll;)I
    move-result v8
    if-le v8, v5, :L24
  .line 582
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$1200(Lcom/innioasis/ipp/Scroll;)I
    move-result v5
  :L24
  .line 579
    add-int/lit8 v3, v3, 1
    goto :L23
  :L25
  .line 597
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$700()I
    move-result v3
    if-lt v3, v4, :L26
    if-nez v5, :L26
  .line 598
    invoke-static { v4 }, Lcom/innioasis/ipp/Scroll;->access$702(I)I
  .line 599
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 600
    return-void
  :L26
  .line 603
    const/4 v2, 0
  :L27
    if-ge v2, v1, :L29
  .line 604
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Scroll;
  .line 605
    invoke-static { v3 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)Z
    move-result v6
    if-eqz v6, :L28
  .line 606
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$700()I
    move-result v6
    invoke-static { v3, v6 }, Lcom/innioasis/ipp/Scroll;->access$1300(Lcom/innioasis/ipp/Scroll;I)V
  :L28
  .line 603
    add-int/lit8 v2, v2, 1
    goto :L27
  :L29
  .line 610
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$708()I
  .line 611
    if-lez v5, :L30
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$700()I
    move-result v1
    div-int/lit8 v5, v5, 2
    add-int/2addr v5, v4
    if-le v1, v5, :L30
  .line 612
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$702(I)I
  :L30
  .line 614
    invoke-direct { p0, v7 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 615
    return-void
.end method

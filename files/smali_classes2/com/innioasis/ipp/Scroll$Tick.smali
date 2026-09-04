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
  .line 406
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private post(I)V
  .registers 6
  .line 476
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$000()Z
    move-result v0
    if-nez v0, :L0
  .line 477
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$002(Z)Z
  .line 478
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$1200()Landroid/os/Handler;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$1100()Lcom/innioasis/ipp/Scroll$Tick;
    move-result-object v1
    int-to-long v2, p1
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L0
  .line 480
    return-void
.end method

.method public run()V
  .registers 9
  .line 409
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$002(Z)Z
  .line 410
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    const/4 v2, 1
    sub-int/2addr v1, v2
  :L0
    if-ltz v1, :L2
  .line 411
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v3
    invoke-virtual { v3, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Scroll;
    invoke-static { v3 }, Lcom/innioasis/ipp/Scroll;->access$200(Lcom/innioasis/ipp/Scroll;)Z
    move-result v3
    if-eqz v3, :L1
  .line 412
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v3
    invoke-virtual { v3, v1 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
  :L1
  .line 410
    add-int/lit8 v1, v1, -1
    goto :L0
  :L2
  .line 415
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
  .line 416
    if-nez v1, :L3
  .line 417
    return-void
  :L3
  .line 420
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v3
  .line 421
    nop
  .line 422
    const/4 v4, 0
    const/4 v5, 0
  :L4
    if-ge v4, v1, :L8
  .line 423
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v6
    invoke-virtual { v6, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Scroll;
  .line 424
    if-eqz v3, :L6
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$300(Lcom/innioasis/ipp/Scroll;)Landroid/widget/TextView;
    move-result-object v7
    invoke-virtual { v7 }, Landroid/widget/TextView;->isShown()Z
    move-result v7
    if-nez v7, :L5
    goto :L6
  :L5
  .line 427
    const/4 v5, 1
    goto :L7
  :L6
  .line 425
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$400(Lcom/innioasis/ipp/Scroll;)V
  :L7
  .line 422
    add-int/lit8 v4, v4, 1
    goto :L4
  :L8
  .line 430
    const/16 v2, 1000
    if-nez v5, :L9
  .line 431
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$502(I)I
  .line 432
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 433
    return-void
  :L9
  .line 437
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$500()I
    move-result v3
    const/16 v4, 38
    if-ne v3, v4, :L12
  .line 438
    const/4 v3, 0
  :L10
    if-ge v3, v1, :L12
  .line 439
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v5
    invoke-virtual { v5, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/ipp/Scroll;
  .line 440
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->access$600(Lcom/innioasis/ipp/Scroll;)Z
    move-result v6
    if-nez v6, :L11
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->access$300(Lcom/innioasis/ipp/Scroll;)Landroid/widget/TextView;
    move-result-object v6
    invoke-virtual { v6 }, Landroid/widget/TextView;->isShown()Z
    move-result v6
    if-eqz v6, :L11
  .line 441
    invoke-static { v5 }, Lcom/innioasis/ipp/Scroll;->access$700(Lcom/innioasis/ipp/Scroll;)V
  :L11
  .line 438
    add-int/lit8 v3, v3, 1
    goto :L10
  :L12
  .line 446
    nop
  .line 447
    const/4 v3, 0
    const/4 v5, 0
  :L13
    if-ge v3, v1, :L15
  .line 448
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v6
    invoke-virtual { v6, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/ipp/Scroll;
  .line 449
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$800(Lcom/innioasis/ipp/Scroll;)Z
    move-result v7
    if-eqz v7, :L14
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$300(Lcom/innioasis/ipp/Scroll;)Landroid/widget/TextView;
    move-result-object v7
    invoke-virtual { v7 }, Landroid/widget/TextView;->isShown()Z
    move-result v7
    if-eqz v7, :L14
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$900(Lcom/innioasis/ipp/Scroll;)I
    move-result v7
    if-le v7, v5, :L14
  .line 450
    invoke-static { v6 }, Lcom/innioasis/ipp/Scroll;->access$900(Lcom/innioasis/ipp/Scroll;)I
    move-result v5
  :L14
  .line 447
    add-int/lit8 v3, v3, 1
    goto :L13
  :L15
  .line 456
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$500()I
    move-result v3
    if-lt v3, v4, :L16
    if-nez v5, :L16
  .line 457
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 458
    return-void
  :L16
  .line 461
    const/4 v2, 0
  :L17
    if-ge v2, v1, :L19
  .line 462
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$100()Ljava/util/ArrayList;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Scroll;
  .line 463
    invoke-static { v3 }, Lcom/innioasis/ipp/Scroll;->access$300(Lcom/innioasis/ipp/Scroll;)Landroid/widget/TextView;
    move-result-object v6
    invoke-virtual { v6 }, Landroid/widget/TextView;->isShown()Z
    move-result v6
    if-eqz v6, :L18
  .line 464
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$500()I
    move-result v6
    invoke-static { v3, v6 }, Lcom/innioasis/ipp/Scroll;->access$1000(Lcom/innioasis/ipp/Scroll;I)V
  :L18
  .line 461
    add-int/lit8 v2, v2, 1
    goto :L17
  :L19
  .line 468
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$508()I
  .line 469
    if-lez v5, :L20
    invoke-static { }, Lcom/innioasis/ipp/Scroll;->access$500()I
    move-result v1
    div-int/lit8 v5, v5, 2
    add-int/2addr v5, v4
    if-le v1, v5, :L20
  .line 470
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->access$502(I)I
  :L20
  .line 472
    const/16 v0, 40
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Scroll$Tick;->post(I)V
  .line 473
    return-void
.end method

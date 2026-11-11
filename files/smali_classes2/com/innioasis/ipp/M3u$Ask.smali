.class public final Lcom/innioasis/ipp/M3u$Ask;
.super Ljava/lang/Object;
.source "M3u.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/M3u;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Ask"
.end annotation

.field private final a:Landroid/app/Activity;

.field private at:I

.field private final cancel:Ljava/lang/Runnable;

.field private final done:Ljava/lang/Runnable;

.field private final existing:Ljava/util/HashMap;

.field private fav:I

.field private final planned:Ljava/util/HashSet;

.field private final plans:Ljava/util/List;

.field private reg:I

.method public constructor <init>(Landroid/app/Activity;Ljava/util/List;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  .line 497
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 491
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Ask;->existing:Ljava/util/HashMap;
  .line 492
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/M3u$Ask;->planned:Ljava/util/HashSet;
  .line 494
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/M3u$Ask;->reg:I
  .line 495
    iput v0, p0, Lcom/innioasis/ipp/M3u$Ask;->fav:I
  .line 498
    iput-object p1, p0, Lcom/innioasis/ipp/M3u$Ask;->a:Landroid/app/Activity;
  .line 499
    iput-object p2, p0, Lcom/innioasis/ipp/M3u$Ask;->plans:Ljava/util/List;
  .line 500
    iput-object p3, p0, Lcom/innioasis/ipp/M3u$Ask;->done:Ljava/lang/Runnable;
  .line 501
    iput-object p4, p0, Lcom/innioasis/ipp/M3u$Ask;->cancel:Ljava/lang/Runnable;
  :L0
  .line 503
    invoke-static { }, Lcom/innioasis/ipp/M3u;->access$500()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object p1
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object p1
  .line 504
    const/4 p2, 0
  :L1
    if-eqz p1, :L4
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result p3
    if-ge p2, p3, :L4
  .line 505
    invoke-interface { p1, p2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p3
  .line 506
    instance-of p4, p3, Lcom/innioasis/y1/database/Playlist;
    if-eqz p4, :L3
    invoke-static { p3 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result p4
    if-eqz p4, :L2
    goto :L3
  :L2
  .line 507
    check-cast p3, Lcom/innioasis/y1/database/Playlist;
  .line 508
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object p4
    if-eqz p4, :L3
    iget-object p4, p0, Lcom/innioasis/ipp/M3u$Ask;->existing:Ljava/util/HashMap;
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p4, v0, p3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 504
    add-int/lit8 p2, p2, 1
    goto :L1
  :L4
  .line 511
    goto :L6
  :L5
  .line 510
    move-exception p1
  :L6
  .line 512
    return-void
.end method

.method private askFav(Lcom/innioasis/ipp/M3u$Plan;)V
  .registers 7
  .line 557
    nop
  .line 558
    iget p1, p0, Lcom/innioasis/ipp/M3u$Ask;->at:I
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/ipp/M3u$Ask;->plans:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge p1, v2, :L2
  .line 559
    iget-object v2, p0, Lcom/innioasis/ipp/M3u$Ask;->plans:Ljava/util/List;
    invoke-interface { v2, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/M3u$Plan;
    iget-boolean v2, v2, Lcom/innioasis/ipp/M3u$Plan;->fav:Z
    if-eqz v2, :L1
    add-int/lit8 v1, v1, 1
  :L1
  .line 558
    add-int/lit8 p1, p1, 1
    goto :L0
  :L2
  .line 561
    iget-object p1, p0, Lcom/innioasis/ipp/M3u$Ask;->a:Landroid/app/Activity;
    const v2, 2131821035
    invoke-virtual { p1, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    const/4 v2, 2
    new-array v2, v2, [Ljava/lang/String;
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Ask;->a:Landroid/app/Activity;
  .line 562
    const v4, 2131821143
    invoke-virtual { v3, v4 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v3
    aput-object v3, v2, v0
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Ask;->a:Landroid/app/Activity;
    const v3, 2131821144
    invoke-virtual { v0, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    const/4 v3, 1
    aput-object v0, v2, v3
  .line 561
    invoke-direct { p0, p1, v2, v1 }, Lcom/innioasis/ipp/M3u$Ask;->show(Ljava/lang/String;[Ljava/lang/String;I)V
  .line 563
    return-void
.end method

.method private askReg(Lcom/innioasis/ipp/M3u$Plan;)V
  .registers 7
  .line 546
    nop
  .line 547
    iget v0, p0, Lcom/innioasis/ipp/M3u$Ask;->at:I
    const/4 v1, 0
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Ask;->plans:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L2
  .line 548
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Ask;->plans:Ljava/util/List;
    invoke-interface { v3, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/M3u$Plan;
  .line 549
    iget-object v4, v3, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    invoke-virtual { v4 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v4
  .line 550
    iget-boolean v3, v3, Lcom/innioasis/ipp/M3u$Plan;->fav:Z
    if-nez v3, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Ask;->planned:Ljava/util/HashSet;
    invoke-virtual { v3, v4 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Ask;->existing:Ljava/util/HashMap;
    invoke-virtual { v3, v4 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L1
    add-int/lit8 v2, v2, 1
  :L1
  .line 547
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 552
    iget-object p1, p1, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    const/4 v0, 3
    new-array v0, v0, [Ljava/lang/String;
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Ask;->a:Landroid/app/Activity;
    const v4, 2131821143
    invoke-virtual { v3, v4 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v3
    aput-object v3, v0, v1
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Ask;->a:Landroid/app/Activity;
  .line 553
    const v3, 2131821144
    invoke-virtual { v1, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    const/4 v3, 1
    aput-object v1, v0, v3
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Ask;->a:Landroid/app/Activity;
    const v3, 2131821145
    invoke-virtual { v1, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    const/4 v3, 2
    aput-object v1, v0, v3
  .line 552
    invoke-direct { p0, p1, v0, v2 }, Lcom/innioasis/ipp/M3u$Ask;->show(Ljava/lang/String;[Ljava/lang/String;I)V
  .line 554
    return-void
.end method

.method private free(Ljava/lang/String;)Ljava/lang/String;
  .registers 6
  .line 598
    const/4 v0, 2
  :L0
  .line 599
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " ("
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, ")"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 600
    invoke-virtual { v1 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v2
  .line 601
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Ask;->existing:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Ask;->planned:Ljava/util/HashSet;
    invoke-virtual { v3, v2 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L1
    return-object v1
  :L1
  .line 598
    add-int/lit8 v0, v0, 1
    goto :L0
.end method

.method private next()V
  .registers 5
  .line 519
    nop
  :L0
    iget v0, p0, Lcom/innioasis/ipp/M3u$Ask;->at:I
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Ask;->plans:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L9
  .line 520
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Ask;->plans:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/ipp/M3u$Ask;->at:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/M3u$Plan;
  .line 521
    iget-boolean v1, v0, Lcom/innioasis/ipp/M3u$Plan;->fav:Z
    const/4 v2, 1
    if-eqz v1, :L4
  .line 522
    iget v1, p0, Lcom/innioasis/ipp/M3u$Ask;->fav:I
    if-gez v1, :L1
  .line 523
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/M3u$Ask;->askFav(Lcom/innioasis/ipp/M3u$Plan;)V
  .line 524
    return-void
  :L1
  .line 526
    if-nez v1, :L2
    const/4 v1, 1
    goto :L3
  :L2
    const/4 v1, 2
  :L3
    iput v1, v0, Lcom/innioasis/ipp/M3u$Plan;->mode:I
    goto :L8
  :L4
  .line 528
    iget-object v1, v0, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    invoke-virtual { v1 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v1
  .line 529
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Ask;->planned:Ljava/util/HashSet;
    invoke-virtual { v3, v1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
  .line 530
    iget-object v1, v0, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/M3u$Ask;->free(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    goto :L7
  :L5
  .line 531
    iget-object v3, p0, Lcom/innioasis/ipp/M3u$Ask;->existing:Ljava/util/HashMap;
    invoke-virtual { v3, v1 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L7
  .line 532
    iget v1, p0, Lcom/innioasis/ipp/M3u$Ask;->reg:I
    if-gez v1, :L6
  .line 533
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/M3u$Ask;->askReg(Lcom/innioasis/ipp/M3u$Plan;)V
  .line 534
    return-void
  :L6
  .line 536
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/ipp/M3u$Ask;->reg(Lcom/innioasis/ipp/M3u$Plan;I)V
  :L7
  .line 538
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Ask;->planned:Ljava/util/HashSet;
    iget-object v0, v0, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    invoke-virtual { v0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L8
  .line 540
    iget v0, p0, Lcom/innioasis/ipp/M3u$Ask;->at:I
    add-int/2addr v0, v2
    iput v0, p0, Lcom/innioasis/ipp/M3u$Ask;->at:I
  .line 541
    goto :L0
  :L9
  .line 542
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Ask;->done:Ljava/lang/Runnable;
    invoke-interface { v0 }, Ljava/lang/Runnable;->run()V
  .line 543
    return-void
.end method

.method private reg(Lcom/innioasis/ipp/M3u$Plan;I)V
  .registers 4
  .line 588
    const/4 v0, 2
    if-ne p2, v0, :L0
  .line 589
    const/4 p2, 0
    iput p2, p1, Lcom/innioasis/ipp/M3u$Plan;->mode:I
  .line 590
    iget-object p2, p1, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/M3u$Ask;->free(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p2
    iput-object p2, p1, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
  .line 591
    return-void
  :L0
  .line 593
    if-nez p2, :L1
    const/4 v0, 1
  :L1
    iput v0, p1, Lcom/innioasis/ipp/M3u$Plan;->mode:I
  .line 594
    iget-object p2, p0, Lcom/innioasis/ipp/M3u$Ask;->existing:Ljava/util/HashMap;
    iget-object v0, p1, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    invoke-virtual { v0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p2, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p2
    check-cast p2, Lcom/innioasis/y1/database/Playlist;
    iput-object p2, p1, Lcom/innioasis/ipp/M3u$Plan;->target:Lcom/innioasis/y1/database/Playlist;
  .line 595
    return-void
.end method

.method private show(Ljava/lang/String;[Ljava/lang/String;I)V
  .registers 12
  .line 566
    new-instance v7, Lcom/innioasis/ipp/BackupDialog;
    iget-object v1, p0, Lcom/innioasis/ipp/M3u$Ask;->a:Landroid/app/Activity;
    const/4 v0, 1
    new-array v2, v0, [Ljava/lang/Object;
    const/4 v3, 0
    aput-object p1, v2, v3
  .line 567
    const p1, 2131821142
    invoke-virtual { v1, p1, v2 }, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
    const/4 v4, 0
  .line 568
    if-le p3, v0, :L0
    iget-object p1, p0, Lcom/innioasis/ipp/M3u$Ask;->a:Landroid/app/Activity;
    const p3, 2131821147
    invoke-virtual { p1, p3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    move-object v5, p1
    new-instance v6, Lcom/innioasis/ipp/M3u$AskGo;
    invoke-direct { v6, p0 }, Lcom/innioasis/ipp/M3u$AskGo;-><init>(Lcom/innioasis/ipp/M3u$Ask;)V
    move-object v0, v7
    move-object v3, p2
    invoke-direct/range { v0 .. v6 }, Lcom/innioasis/ipp/BackupDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/BackupDialog$Go;)V
  .line 569
    new-instance p1, Lcom/innioasis/ipp/M3u$Run;
    iget-object p2, p0, Lcom/innioasis/ipp/M3u$Ask;->cancel:Ljava/lang/Runnable;
    invoke-direct { p1, p2 }, Lcom/innioasis/ipp/M3u$Run;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v7, p1 }, Lcom/innioasis/ipp/BackupDialog;->setOnBack(Lkotlin/jvm/functions/Function0;)V
  .line 570
    invoke-virtual { v7 }, Lcom/innioasis/ipp/BackupDialog;->show()V
  .line 571
    return-void
.end method

.method answer(IZ)V
  .registers 6
  .line 574
    iget-object v0, p0, Lcom/innioasis/ipp/M3u$Ask;->plans:Ljava/util/List;
    iget v1, p0, Lcom/innioasis/ipp/M3u$Ask;->at:I
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/M3u$Plan;
  .line 575
    iget-boolean v1, v0, Lcom/innioasis/ipp/M3u$Plan;->fav:Z
    const/4 v2, 1
    if-eqz v1, :L2
  .line 576
    if-nez p1, :L0
    const/4 v1, 1
    goto :L1
  :L0
    const/4 v1, 2
  :L1
    iput v1, v0, Lcom/innioasis/ipp/M3u$Plan;->mode:I
  .line 577
    if-eqz p2, :L4
    iput p1, p0, Lcom/innioasis/ipp/M3u$Ask;->fav:I
    goto :L4
  :L2
  .line 579
    invoke-direct { p0, v0, p1 }, Lcom/innioasis/ipp/M3u$Ask;->reg(Lcom/innioasis/ipp/M3u$Plan;I)V
  .line 580
    if-eqz p2, :L3
    iput p1, p0, Lcom/innioasis/ipp/M3u$Ask;->reg:I
  :L3
  .line 581
    iget-object p1, p0, Lcom/innioasis/ipp/M3u$Ask;->planned:Ljava/util/HashSet;
    iget-object p2, v0, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
    invoke-virtual { p2 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L4
  .line 583
    iget p1, p0, Lcom/innioasis/ipp/M3u$Ask;->at:I
    add-int/2addr p1, v2
    iput p1, p0, Lcom/innioasis/ipp/M3u$Ask;->at:I
  .line 584
    invoke-direct { p0 }, Lcom/innioasis/ipp/M3u$Ask;->next()V
  .line 585
    return-void
.end method

.method public start()V
  .registers 1
  .line 515
    invoke-direct { p0 }, Lcom/innioasis/ipp/M3u$Ask;->next()V
  .line 516
    return-void
.end method

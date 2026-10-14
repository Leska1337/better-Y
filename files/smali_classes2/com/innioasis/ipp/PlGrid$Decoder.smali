.class final Lcom/innioasis/ipp/PlGrid$Decoder;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Decoder"
.end annotation
.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;
  }
.end annotation

.field private final static queue:Ljava/util/LinkedList;

.field private static repaintPosted:Z

.field private static running:Z

.field private static view:Ljava/lang/ref/WeakReference;

.method static constructor <clinit>()V
  .registers 2
  .line 511
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
  .line 513
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 510
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$600()Ljava/util/LinkedList;
  .registers 1
  .line 510
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    return-object v0
.end method

.method static synthetic access$702(Z)Z
  .registers 1
  .line 510
    sput-boolean p0, Lcom/innioasis/ipp/PlGrid$Decoder;->repaintPosted:Z
    return p0
.end method

.method static all(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  :L0
  .line 540
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$300()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  .line 541
    if-nez v0, :L1
    return-void
  :L1
  .line 542
    const/4 v1, 0
    const/4 v2, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 543
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 544
    instance-of v4, v3, Lcom/innioasis/y1/database/Playlist;
    if-eqz v4, :L3
    check-cast v3, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v3
    invoke-static { v3, p0, v1 }, Lcom/innioasis/ipp/PlGrid$Decoder;->want(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;Z)V
  :L3
  .line 542
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 547
    goto :L6
  :L5
  .line 546
    move-exception p0
  :L6
  .line 548
    return-void
.end method

.method static attach(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 518
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 519
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
  .line 520
    monitor-exit v0
  .line 521
    return-void
  :L1
  .line 520
    move-exception p0
    monitor-exit v0
  :L2
    throw p0
.end method

.method private static repaint()V
  .catchall { :L0 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 3
  .line 579
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 580
    sget-boolean v1, Lcom/innioasis/ipp/PlGrid$Decoder;->repaintPosted:Z
    if-eqz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 581
    sget-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 582
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 583
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/PlGrid$Decoder;->repaintPosted:Z
  .line 584
    monitor-exit v0
  :L3
  .line 585
    new-instance v0, Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { v1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z
  .line 586
    return-void
  :L4
  .line 584
    move-exception v1
  :L5
    monitor-exit v0
  :L6
    throw v1
.end method

.method static want(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;Z)V
  .catchall { :L0 .. :L6 } :L1
  .catchall { :L7 .. :L8 } :L1
  .registers 5
  .line 524
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  .line 525
    if-eqz p1, :L2
  :L0
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    goto :L2
  :L1
  .line 531
    move-exception p0
    goto :L7
  :L2
  .line 526
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z
  .line 527
    if-eqz p2, :L3
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V
    goto :L4
  :L3
  .line 528
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  :L4
  .line 529
    sget-boolean p0, Lcom/innioasis/ipp/PlGrid$Decoder;->running:Z
    if-eqz p0, :L5
    monitor-exit v0
    return-void
  :L5
  .line 530
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/PlGrid$Decoder;->running:Z
  .line 531
    monitor-exit v0
  :L6
  .line 532
    new-instance p1, Ljava/lang/Thread;
    new-instance p2, Lcom/innioasis/ipp/PlGrid$Decoder;
    invoke-direct { p2 }, Lcom/innioasis/ipp/PlGrid$Decoder;-><init>()V
    const-string v0, "ipp-pl-covers"
    invoke-direct { p1, p2, v0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 533
    invoke-virtual { p1, p0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 534
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  .line 535
    return-void
  :L7
  .line 531
    monitor-exit v0
  :L8
    throw p0
.end method

.method public run()V
  .catchall { :L1 .. :L3 } :L8
  .catchall { :L3 .. :L5 } :L6
  .catchall { :L9 .. :L10 } :L8
  .registers 11
  .line 551
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 552
    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;
    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;
  :L0
  .line 555
    sget-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v1
  :L1
  .line 556
    invoke-virtual { v1 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v2
    const/4 v3, 0
    if-eqz v2, :L2
  .line 557
    sput-boolean v3, Lcom/innioasis/ipp/PlGrid$Decoder;->running:Z
  .line 558
    monitor-exit v1
    return-void
  :L2
  .line 560
    invoke-virtual { v1 }, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/UUID;
  .line 561
    monitor-exit v1
  :L3
  .line 563
    invoke-static { v2 }, Lcom/innioasis/ipp/PlGrid;->access$400(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v1
  .line 564
    invoke-virtual { v1 }, Ljava/io/File;->lastModified()J
    move-result-wide v4
  .line 565
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$500()Ljava/util/Hashtable;
    move-result-object v6
    invoke-virtual { v6, v2 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, [Ljava/lang/Object;
  .line 566
    const-wide/16 v7, 0
    cmp-long v9, v4, v7
    if-eqz v9, :L0
    if-eqz v6, :L4
    aget-object v6, v6, v3
    check-cast v6, Ljava/lang/Long;
    invoke-virtual { v6 }, Ljava/lang/Long;->longValue()J
    move-result-wide v6
    cmp-long v8, v6, v4
    if-nez v8, :L4
    goto :L0
  :L4
  .line 568
    invoke-virtual { v1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1, v0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 569
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$500()Ljava/util/Hashtable;
    move-result-object v6
    const/4 v7, 2
    new-array v7, v7, [Ljava/lang/Object;
    invoke-static { v4, v5 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v4
    aput-object v4, v7, v3
    const/4 v3, 1
    aput-object v1, v7, v3
    invoke-virtual { v6, v2, v7 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 570
    invoke-static { }, Lcom/innioasis/ipp/PlGrid$Decoder;->repaint()V
  :L5
  .line 572
    goto :L7
  :L6
  .line 571
    move-exception v1
  :L7
  .line 573
    goto :L0
  :L8
  .line 561
    move-exception v0
  :L9
    monitor-exit v1
  :L10
    goto :L12
  :L11
    throw v0
  :L12
    goto :L11
.end method

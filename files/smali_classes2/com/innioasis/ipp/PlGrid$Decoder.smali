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
  .line 854
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
  .line 856
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method constructor <init>()V
  .registers 1
  .line 853
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$1000()Ljava/util/LinkedList;
  .registers 1
  .line 853
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    return-object v0
.end method

.method static synthetic access$1102(Z)Z
  .registers 1
  .line 853
    sput-boolean p0, Lcom/innioasis/ipp/PlGrid$Decoder;->repaintPosted:Z
    return p0
.end method

.method static all(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  :L0
  .line 889
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$600()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  .line 890
    if-nez v0, :L1
    return-void
  :L1
  .line 891
    const/4 v1, 0
    const/4 v2, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L4
  .line 892
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 893
    instance-of v4, v3, Lcom/innioasis/y1/database/Playlist;
    if-eqz v4, :L3
    check-cast v3, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v3
    invoke-static { v3, p0, v1 }, Lcom/innioasis/ipp/PlGrid$Decoder;->want(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;Z)V
  :L3
  .line 891
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 896
    goto :L6
  :L5
  .line 895
    move-exception p0
  :L6
  .line 897
    return-void
.end method

.method static attach(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 861
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 862
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
  .line 863
    monitor-exit v0
  .line 864
    return-void
  :L1
  .line 863
    move-exception p0
    monitor-exit v0
  :L2
    throw p0
.end method

.method static grid()Landroidx/recyclerview/widget/RecyclerView;
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 867
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 868
    sget-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
    monitor-exit v0
    return-object v1
  :L1
  .line 869
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method private static repaint()V
  .catchall { :L0 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 3
  .line 948
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 949
    sget-boolean v1, Lcom/innioasis/ipp/PlGrid$Decoder;->repaintPosted:Z
    if-eqz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 950
    sget-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 951
    if-nez v1, :L2
  .line 952
    const-string v1, "playlist covers: no grid to repaint"
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 953
    monitor-exit v0
    return-void
  :L2
  .line 955
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/PlGrid$Decoder;->repaintPosted:Z
  .line 956
    monitor-exit v0
  :L3
  .line 959
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$100()Landroid/os/Handler;
    move-result-object v0
    new-instance v2, Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { v0, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 960
    return-void
  :L4
  .line 956
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
  .line 873
    sget-object v0, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v0
  .line 874
    if-eqz p1, :L2
  :L0
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/PlGrid$Decoder;->view:Ljava/lang/ref/WeakReference;
    goto :L2
  :L1
  .line 880
    move-exception p0
    goto :L7
  :L2
  .line 875
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z
  .line 876
    if-eqz p2, :L3
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V
    goto :L4
  :L3
  .line 877
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  :L4
  .line 878
    sget-boolean p0, Lcom/innioasis/ipp/PlGrid$Decoder;->running:Z
    if-eqz p0, :L5
    monitor-exit v0
    return-void
  :L5
  .line 879
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/PlGrid$Decoder;->running:Z
  .line 880
    monitor-exit v0
  :L6
  .line 881
    new-instance p1, Ljava/lang/Thread;
    new-instance p2, Lcom/innioasis/ipp/PlGrid$Decoder;
    invoke-direct { p2 }, Lcom/innioasis/ipp/PlGrid$Decoder;-><init>()V
    const-string v0, "ipp-pl-covers"
    invoke-direct { p1, p2, v0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 882
    invoke-virtual { p1, p0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 883
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  .line 884
    return-void
  :L7
  .line 880
    monitor-exit v0
  :L8
    throw p0
.end method

.method public run()V
  .catchall { :L1 .. :L7 } :L18
  .catchall { :L8 .. :L14 } :L16
  .catchall { :L19 .. :L20 } :L18
  .registers 17
  .line 900
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 901
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;
  .line 902
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 903
    nop
  .line 904
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v5, 0
    const/4 v6, 0
  :L0
  .line 907
    sget-object v7, Lcom/innioasis/ipp/PlGrid$Decoder;->queue:Ljava/util/LinkedList;
    monitor-enter v7
  :L1
  .line 908
    invoke-virtual { v7 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L6
  .line 909
    sput-boolean v5, Lcom/innioasis/ipp/PlGrid$Decoder;->running:Z
  .line 910
    if-gtz v6, :L2
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->length()I
    move-result v0
    if-lez v0, :L5
  :L2
  .line 911
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "playlist covers: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " read in "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 912
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sub-long/2addr v5, v2
    invoke-virtual { v0, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 913
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->length()I
    move-result v1
    if-lez v1, :L3
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, ", did not:"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    goto :L4
  :L3
    const-string v1, ""
  :L4
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 911
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L5
  .line 915
    monitor-exit v7
    return-void
  :L6
  .line 917
    invoke-virtual { v7 }, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/util/UUID;
  .line 918
    monitor-exit v7
  :L7
  .line 920
    const/16 v7, 32
  :L8
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->access$700(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v8
  .line 921
    invoke-virtual { v8 }, Ljava/io/File;->lastModified()J
    move-result-wide v9
  .line 922
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$800()Ljava/util/Hashtable;
    move-result-object v11
    invoke-virtual { v11, v0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v11
    check-cast v11, [Ljava/lang/Object;
  .line 923
    const-wide/16 v12, 0
    cmp-long v14, v9, v12
    if-eqz v14, :L15
    const/4 v12, 1
    if-eqz v11, :L9
    aget-object v13, v11, v5
    check-cast v13, Ljava/lang/Long;
    invoke-virtual { v13 }, Ljava/lang/Long;->longValue()J
    move-result-wide v13
    cmp-long v15, v13, v9
    if-nez v15, :L9
    aget-object v11, v11, v12
    check-cast v11, Landroid/graphics/Bitmap;
  .line 924
    invoke-static { v11 }, Lcom/innioasis/ipp/PlGrid;->access$900(Landroid/graphics/Bitmap;)Z
    move-result v11
    if-nez v11, :L9
    goto :L15
  :L9
  .line 926
    invoke-virtual { v8 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-static { v8, v1 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v8
  .line 928
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileCardSide()I
    move-result v11
  .line 929
    if-eqz v8, :L11
    if-lez v11, :L11
    invoke-virtual { v8 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v13
    if-le v13, v11, :L11
  .line 930
    nop
  .line 931
    invoke-virtual { v8 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v13
    mul-int v13, v13, v11
    invoke-virtual { v8 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v14
    div-int/2addr v13, v14
    invoke-static { v12, v13 }, Ljava/lang/Math;->max(II)I
    move-result v13
  .line 930
    invoke-static { v8, v11, v13, v12 }, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    move-result-object v11
  .line 932
    if-eq v11, v8, :L10
    invoke-virtual { v8 }, Landroid/graphics/Bitmap;->recycle()V
  :L10
  .line 933
    move-object v8, v11
  :L11
  .line 935
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$800()Ljava/util/Hashtable;
    move-result-object v11
    const/4 v13, 2
    new-array v13, v13, [Ljava/lang/Object;
    invoke-static { v9, v10 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v9
    aput-object v9, v13, v5
    aput-object v8, v13, v12
    invoke-virtual { v11, v0, v13 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 936
    if-eqz v8, :L12
    add-int/lit8 v6, v6, 1
    goto :L13
  :L12
  .line 937
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
  :L13
  .line 938
    invoke-static { }, Lcom/innioasis/ipp/PlGrid$Decoder;->repaint()V
  :L14
  .line 941
    goto :L17
  :L15
  .line 924
    goto/16 :L0
  :L16
  .line 939
    move-exception v0
  .line 940
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v7, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L17
  .line 942
    goto/16 :L0
  :L18
  .line 918
    move-exception v0
  :L19
    monitor-exit v7
  :L20
    goto :L22
  :L21
    throw v0
  :L22
    goto :L21
.end method

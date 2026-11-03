.class final Lcom/innioasis/y1/activity/IppActivity$SongWorker;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "SongWorker"
.end annotation

.field private final byPath:Ljava/util/List;

.field private final covers:Z

.field failed:I

.field private final paths:Ljava/util/ArrayList;

.field private final q:Lcom/innioasis/y1/activity/IppActivity$Blocks;

.field private final read:Ljava/util/ArrayList;

.field private final slides:Ljava/util/HashSet;

.field final steps:Lcom/innioasis/y1/activity/IppActivity$Steps;

.field private final tags:Z

.field private final task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;

.field private final thumbs:Ljava/util/Map;

.field unwritten:I

.field final walk:Lcom/innioasis/ipp/BigCover$Walk;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZLjava/util/Map;Ljava/util/HashSet;)V
  .registers 9
  .line 1809
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1799
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
  .line 1800
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->read:Ljava/util/ArrayList;
  .line 1805
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Steps;
    invoke-direct { v0 }, Lcom/innioasis/y1/activity/IppActivity$Steps;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
  .line 1806
    new-instance v0, Lcom/innioasis/ipp/BigCover$Walk;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Walk;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->walk:Lcom/innioasis/ipp/BigCover$Walk;
  .line 1810
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
  .line 1811
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->byPath:Ljava/util/List;
  .line 1812
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .line 1813
    iput-boolean p4, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->tags:Z
  .line 1814
    iput-boolean p5, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->covers:Z
  .line 1815
    iput-object p6, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->thumbs:Ljava/util/Map;
  .line 1816
    iput-object p7, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->slides:Ljava/util/HashSet;
  .line 1817
    return-void
.end method

.method private one(Lcom/innioasis/ipp/BigCover$Walk;Lcom/innioasis/y1/database/Song;)V
  .catchall { :L7 .. :L8 } :L9
  .registers 14
  .line 1837
    if-eqz p2, :L13
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    goto/16 :L13
  :L0
  .line 1838
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 1839
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->tags:Z
    const/4 v2, 0
    const/4 v3, 1
    if-eqz v1, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/DiscCache;->known(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 1840
    iget-boolean v4, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->covers:Z
    if-eqz v4, :L3
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->needs(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L3
    const/4 v2, 1
  :L3
  .line 1841
    if-nez v1, :L4
    if-nez v2, :L4
    return-void
  :L4
  .line 1842
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/DiscCache;->read(Ljava/lang/String;ZZ)Lcom/innioasis/ipp/DiscCache$Tags;
    move-result-object v4
  .line 1843
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    invoke-virtual { v5, v0, v4 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->read(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .line 1844
    iget-boolean v5, v4, Lcom/innioasis/ipp/DiscCache$Tags;->ok:Z
    if-nez v5, :L5
  .line 1845
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr p1, v3
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
  .line 1846
    return-void
  :L5
  .line 1848
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-static { p2 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { v5, p2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touch(Ljava/lang/String;)V
  .line 1849
    const/4 p2, 0
    if-eqz v2, :L11
  .line 1850
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
  .line 1851
    iget-object v2, v4, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
    invoke-static { p1, v0, v2 }, Lcom/innioasis/ipp/BigCover;->cache(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)Z
    move-result p1
  .line 1852
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    iget-wide v7, v2, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v9
    sub-long/2addr v9, v5
    add-long/2addr v7, v9
    iput-wide v7, v2, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverNs:J
  .line 1853
    if-nez p1, :L6
  .line 1854
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    add-int/2addr p1, v3
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    goto :L11
  :L6
  .line 1857
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->thumbs:Ljava/util/Map;
    invoke-interface { p1, v0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1858
    if-eqz p1, :L10
  .line 1859
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
  .line 1860
    iget-object v2, v4, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  :L7
  .line 1862
    iget-object v2, p1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L8
  .line 1864
    invoke-static { p2, p2 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1865
    nop
  .line 1866
    iput-boolean v3, p1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->done:Z
  .line 1867
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    iget-wide v2, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->thumbNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
    sub-long/2addr v7, v5
    add-long/2addr v2, v7
    iput-wide v2, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->thumbNs:J
    goto :L10
  :L9
  .line 1864
    move-exception p1
    invoke-static { p2, p2 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1865
    throw p1
  :L10
  .line 1869
    iget-object p1, v4, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
    if-eqz p1, :L11
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->slides:Ljava/util/HashSet;
    invoke-virtual { p1, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L11
  .line 1870
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
  .line 1871
    iget-object p1, v4, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Flow;->slideFrom(Ljava/lang/String;[B)Z
  .line 1872
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    iget-wide v5, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->slideNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
    sub-long/2addr v7, v2
    add-long/2addr v5, v7
    iput-wide v5, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->slideNs:J
  :L11
  .line 1877
    iput-object p2, v4, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
  .line 1878
    if-eqz v1, :L12
  .line 1879
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
    invoke-virtual { p1, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1880
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->read:Ljava/util/ArrayList;
    invoke-virtual { p1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L12
  .line 1882
    return-void
  :L13
  .line 1837
    return-void
.end method

.method commit()V
  .registers 6
  .line 1886
    nop
  .line 1887
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v1, v3, :L2
  .line 1888
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
    invoke-virtual { v3, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->read:Ljava/util/ArrayList;
    invoke-virtual { v4, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/DiscCache$Tags;
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/DiscCache;->commit(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .line 1889
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->read:Ljava/util/ArrayList;
    const/4 v4, 0
    invoke-virtual { v3, v1, v4 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  .line 1890
    add-int/lit8 v2, v2, 1
    const/16 v3, 1000
    if-ne v2, v3, :L1
  .line 1891
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  .line 1892
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-virtual { v3, v2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->committed(I)V
  .line 1893
    const/4 v2, 0
  :L1
  .line 1887
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 1896
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->committed(I)V
  .line 1897
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L6 .. :L7 } :L8
  .registers 6
  .line 1820
    const/4 v0, 5
  :L0
    invoke-static { v0 }, Landroid/os/Process;->setThreadPriority(I)V
  :L1
    goto :L3
  :L2
    move-exception v0
  :L3
  .line 1821
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->walk:Lcom/innioasis/ipp/BigCover$Walk;
  :L4
  .line 1823
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->take()I
    move-result v1
    if-ltz v1, :L11
  .line 1824
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v2, v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from(I)I
    move-result v2
  :L5
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v3, v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to(I)I
    move-result v3
    if-ge v2, v3, :L10
  :L6
  .line 1826
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->byPath:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, v0, v3 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->one(Lcom/innioasis/ipp/BigCover$Walk;Lcom/innioasis/y1/database/Song;)V
  :L7
  .line 1829
    goto :L9
  :L8
  .line 1827
    move-exception v3
  .line 1828
    iget v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/lit8 v3, v3, 1
    iput v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
  :L9
  .line 1830
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    const/4 v4, 2
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick(I)V
  .line 1824
    add-int/lit8 v2, v2, 1
    goto :L5
  :L10
  .line 1832
    invoke-virtual { v0 }, Lcom/innioasis/ipp/BigCover$Walk;->done()V
    goto :L4
  :L11
  .line 1834
    return-void
.end method

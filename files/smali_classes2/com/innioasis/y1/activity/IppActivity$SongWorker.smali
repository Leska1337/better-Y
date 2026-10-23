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
  .line 1725
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1715
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
  .line 1716
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->read:Ljava/util/ArrayList;
  .line 1721
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$Steps;
    invoke-direct { v0 }, Lcom/innioasis/y1/activity/IppActivity$Steps;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
  .line 1722
    new-instance v0, Lcom/innioasis/ipp/BigCover$Walk;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Walk;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->walk:Lcom/innioasis/ipp/BigCover$Walk;
  .line 1726
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
  .line 1727
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->byPath:Ljava/util/List;
  .line 1728
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .line 1729
    iput-boolean p4, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->tags:Z
  .line 1730
    iput-boolean p5, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->covers:Z
  .line 1731
    iput-object p6, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->thumbs:Ljava/util/Map;
  .line 1732
    iput-object p7, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->slides:Ljava/util/HashSet;
  .line 1733
    return-void
.end method

.method private one(Lcom/innioasis/ipp/BigCover$Walk;Lcom/innioasis/y1/database/Song;)V
  .catchall { :L7 .. :L8 } :L9
  .registers 14
  .line 1753
    if-eqz p2, :L13
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    goto/16 :L13
  :L0
  .line 1754
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 1755
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
  .line 1756
    iget-boolean v4, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->covers:Z
    if-eqz v4, :L3
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->needs(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L3
    const/4 v2, 1
  :L3
  .line 1757
    if-nez v1, :L4
    if-nez v2, :L4
    return-void
  :L4
  .line 1758
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/DiscCache;->read(Ljava/lang/String;ZZ)Lcom/innioasis/ipp/DiscCache$Tags;
    move-result-object v4
  .line 1759
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    invoke-virtual { v5, v0, v4 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->read(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .line 1760
    iget-boolean v5, v4, Lcom/innioasis/ipp/DiscCache$Tags;->ok:Z
    if-nez v5, :L5
  .line 1761
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr p1, v3
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
  .line 1762
    return-void
  :L5
  .line 1764
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-static { p2 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { v5, p2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touch(Ljava/lang/String;)V
  .line 1765
    const/4 p2, 0
    if-eqz v2, :L11
  .line 1766
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
  .line 1767
    iget-object v2, v4, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
    invoke-static { p1, v0, v2 }, Lcom/innioasis/ipp/BigCover;->cache(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)Z
    move-result p1
  .line 1768
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    iget-wide v7, v2, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v9
    sub-long/2addr v9, v5
    add-long/2addr v7, v9
    iput-wide v7, v2, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverNs:J
  .line 1769
    if-nez p1, :L6
  .line 1770
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    add-int/2addr p1, v3
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    goto :L11
  :L6
  .line 1773
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->thumbs:Ljava/util/Map;
    invoke-interface { p1, v0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1774
    if-eqz p1, :L10
  .line 1775
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
  .line 1776
    iget-object v2, v4, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  :L7
  .line 1778
    iget-object v2, p1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L8
  .line 1780
    invoke-static { p2, p2 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1781
    nop
  .line 1782
    iput-boolean v3, p1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->done:Z
  .line 1783
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    iget-wide v2, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->thumbNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
    sub-long/2addr v7, v5
    add-long/2addr v2, v7
    iput-wide v2, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->thumbNs:J
  .line 1784
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
    goto :L10
  :L9
  .line 1780
    move-exception p1
    invoke-static { p2, p2 }, Lcom/innioasis/ipp/Art;->hint(Ljava/lang/String;[B)V
  .line 1781
    throw p1
  :L10
  .line 1786
    iget-object p1, v4, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
    if-eqz p1, :L11
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->slides:Ljava/util/HashSet;
    invoke-virtual { p1, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L11
  .line 1787
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
  .line 1788
    iget-object p1, v4, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Flow;->slideFrom(Ljava/lang/String;[B)Z
  .line 1789
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    iget-wide v5, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->slideNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
    sub-long/2addr v7, v2
    add-long/2addr v5, v7
    iput-wide v5, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->slideNs:J
  :L11
  .line 1794
    iput-object p2, v4, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
  .line 1795
    if-eqz v1, :L12
  .line 1796
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
    invoke-virtual { p1, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1797
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->read:Ljava/util/ArrayList;
    invoke-virtual { p1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L12
  .line 1799
    return-void
  :L13
  .line 1753
    return-void
.end method

.method commit()V
  .registers 4
  .line 1803
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    if-ge v0, v1, :L1
  .line 1804
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->read:Ljava/util/ArrayList;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/DiscCache$Tags;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/DiscCache;->commit(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .line 1803
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 1806
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L6 .. :L7 } :L8
  .registers 5
  .line 1736
    const/4 v0, 5
  :L0
    invoke-static { v0 }, Landroid/os/Process;->setThreadPriority(I)V
  :L1
    goto :L3
  :L2
    move-exception v0
  :L3
  .line 1737
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->walk:Lcom/innioasis/ipp/BigCover$Walk;
  :L4
  .line 1739
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->take()I
    move-result v1
    if-ltz v1, :L11
  .line 1740
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v2, v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from(I)I
    move-result v2
  :L5
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v3, v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to(I)I
    move-result v3
    if-ge v2, v3, :L10
  :L6
  .line 1742
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->byPath:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, v0, v3 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->one(Lcom/innioasis/ipp/BigCover$Walk;Lcom/innioasis/y1/database/Song;)V
  :L7
  .line 1745
    goto :L9
  :L8
  .line 1743
    move-exception v3
  .line 1744
    iget v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/lit8 v3, v3, 1
    iput v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
  :L9
  .line 1746
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1740
    add-int/lit8 v2, v2, 1
    goto :L5
  :L10
  .line 1748
    invoke-virtual { v0 }, Lcom/innioasis/ipp/BigCover$Walk;->done()V
    goto :L4
  :L11
  .line 1750
    return-void
.end method

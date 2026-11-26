.class final Lcom/innioasis/y1/activity/IppActivity$Steps;
.super Ljava/lang/Object;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Steps"
.end annotation

.field artNs:J

.field final byExt:Ljava/util/HashMap;

.field coverFailed:J

.field coverNs:J

.field decodeNs:J

.field embedded:J

.field encodeNs:J

.field encoded:J

.field extLookups:J

.field external:J

.field externalNs:J

.field files:J

.field none:J

.field openNs:J

.field own:J

.field probes:J

.field sameBytes:J

.field samePixels:J

.field slideNs:J

.field srcDecodeNs:J

.field storeNs:J

.field thumbNs:J

.field verbatim:J

.field writeNs:J

.method constructor <init>()V
  .registers 2
  .line 1806
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1808
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->byExt:Ljava/util/HashMap;
    return-void
.end method

.method add(Lcom/innioasis/y1/activity/IppActivity$Steps;)V
  .registers 9
  .line 1858
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->files:J
    iget-wide v2, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->files:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->files:J
  .line 1859
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->openNs:J
    iget-wide v2, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->openNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->openNs:J
  .line 1860
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->artNs:J
    iget-wide v2, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->artNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->artNs:J
  .line 1861
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverNs:J
    iget-wide v2, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverNs:J
  .line 1862
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->thumbNs:J
    iget-wide v2, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->thumbNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->thumbNs:J
  .line 1863
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->slideNs:J
    iget-wide v2, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->slideNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->slideNs:J
  .line 1864
    iget-object p1, p1, Lcom/innioasis/y1/activity/IppActivity$Steps;->byExt:Ljava/util/HashMap;
    invoke-virtual { p1 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object p1
    invoke-interface { p1 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object p1
  :L0
  .line 1865
    invoke-interface { p1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v0
    if-eqz v0, :L2
  .line 1866
    invoke-interface { p1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/util/Map$Entry;
  .line 1867
    invoke-interface { v0 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [J
  .line 1868
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->byExt:Ljava/util/HashMap;
    invoke-interface { v0 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [J
  .line 1869
    if-nez v2, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->byExt:Ljava/util/HashMap;
    invoke-interface { v0 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v0
    const/4 v3, 3
    new-array v3, v3, [J
    invoke-virtual { v2, v0, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-object v2, v3
  :L1
  .line 1870
    const/4 v0, 0
    aget-wide v3, v2, v0
    aget-wide v5, v1, v0
    add-long/2addr v3, v5
    aput-wide v3, v2, v0
  .line 1871
    const/4 v0, 1
    aget-wide v3, v2, v0
    aget-wide v5, v1, v0
    add-long/2addr v3, v5
    aput-wide v3, v2, v0
  .line 1872
    const/4 v0, 2
    aget-wide v3, v2, v0
    aget-wide v5, v1, v0
    add-long/2addr v3, v5
    aput-wide v3, v2, v0
  .line 1873
    goto :L0
  :L2
  .line 1874
    return-void
.end method

.method cover(Lcom/innioasis/ipp/BigCover$Walk;)V
  .registers 6
  .line 1828
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->srcDecodeNs:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->srcDecodeNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->srcDecodeNs:J
  .line 1829
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->encodeNs:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->encodeNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->encodeNs:J
  .line 1830
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->probes:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->probes:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->probes:J
  .line 1831
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->writeNs:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->writeNs:J
  .line 1832
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->embedded:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->embedded:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->embedded:J
  .line 1833
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->external:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->external:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->external:J
  .line 1834
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->none:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->none:J
  .line 1835
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->sameBytes:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->sameBytes:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->sameBytes:J
  .line 1836
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->verbatim:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->verbatim:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->verbatim:J
  .line 1837
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->encoded:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->encoded:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->encoded:J
  .line 1838
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->samePixels:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->samePixels:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->samePixels:J
  .line 1839
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->own:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->own:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->own:J
  .line 1840
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverFailed:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverFailed:J
  .line 1841
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->externalNs:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->externalNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->externalNs:J
  .line 1842
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->extLookups:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->extLookups:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->extLookups:J
  .line 1843
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->decodeNs:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->decodeNs:J
  .line 1844
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->storeNs:J
    iget-wide v2, p1, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->storeNs:J
  .line 1845
    return-void
.end method

.method coverLine()Ljava/lang/String;
  .registers 6
  .line 1848
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "picture from tags "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->embedded:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ", from a cover file "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->external:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ", none "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->none:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "; same bytes "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->sameBytes:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ", new album stored as is "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->verbatim:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ", re-encoded "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->encoded:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ", same pixels "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->samePixels:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ", own "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->own:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ", failed "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverFailed:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "; cover file read "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->externalNs:J
    const-wide/32 v3, 1000000
    div-long/2addr v1, v3
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms ("
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->extLookups:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " folders looked up), decode "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->decodeNs:J
    div-long/2addr v1, v3
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms, encode+write "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->storeNs:J
    div-long/2addr v1, v3
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms (source decode "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->srcDecodeNs:J
    div-long/2addr v1, v3
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms, "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->probes:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " encodes "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->encodeNs:J
    div-long/2addr v1, v3
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms, write "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->writeNs:J
    div-long/2addr v1, v3
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms)"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method line()Ljava/lang/String;
  .registers 12
  .line 1877
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 1878
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->files:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " files, open "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-wide v2, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->openNs:J
    const-wide/32 v4, 1000000
    div-long/2addr v2, v4
    invoke-virtual { v1, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 1879
    const-string v2, " ms, art "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-wide v2, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->artNs:J
    div-long/2addr v2, v4
    invoke-virtual { v1, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 1880
    const-string v2, " ms, cover "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-wide v2, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverNs:J
    div-long/2addr v2, v4
    invoke-virtual { v1, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 1881
    const-string v2, " ms, thumb "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-wide v2, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->thumbNs:J
    div-long/2addr v2, v4
    invoke-virtual { v1, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 1882
    const-string v2, " ms, slide "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-wide v2, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->slideNs:J
    div-long/2addr v2, v4
    invoke-virtual { v1, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " ms;"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 1883
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->byExt:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L0
  .line 1884
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L2
  .line 1885
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
  .line 1886
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, [J
  .line 1887
    const/16 v6, 32
    invoke-virtual { v0, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v7, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    const/4 v6, 0
    aget-wide v7, v3, v6
    invoke-virtual { v2, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 1888
    const-string v7, " x "
    invoke-virtual { v2, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-wide v6, v3, v6
    const-wide/16 v8, 0
    cmp-long v10, v6, v8
    if-lez v10, :L1
    const/4 v8, 1
    aget-wide v8, v3, v8
    div-long/2addr v8, v6
    div-long/2addr v8, v4
  :L1
    invoke-virtual { v2, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v6, " ms (ours "
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/4 v6, 2
    aget-wide v6, v3, v6
    invoke-virtual { v2, v6, v7 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ")"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 1889
    goto :L0
  :L2
  .line 1890
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method read(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .registers 11
  .line 1811
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->files:J
    const-wide/16 v2, 1
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->files:J
  .line 1812
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->openNs:J
    iget-wide v4, p2, Lcom/innioasis/ipp/DiscCache$Tags;->openNs:J
    add-long/2addr v0, v4
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->openNs:J
  .line 1813
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->artNs:J
    iget-wide v4, p2, Lcom/innioasis/ipp/DiscCache$Tags;->artNs:J
    add-long/2addr v0, v4
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->artNs:J
  .line 1814
    const/16 v0, 46
    invoke-virtual { p1, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 1815
    const/4 v1, 1
    if-gez v0, :L0
    const-string p1, "?"
    goto :L1
  :L0
    add-int/2addr v0, v1
    invoke-virtual { p1, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 1816
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->byExt:Ljava/util/HashMap;
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [J
  .line 1817
    if-nez v0, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Steps;->byExt:Ljava/util/HashMap;
    const/4 v4, 3
    new-array v4, v4, [J
    invoke-virtual { v0, p1, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-object v0, v4
  :L2
  .line 1818
    const/4 p1, 0
    aget-wide v4, v0, p1
    add-long/2addr v4, v2
    aput-wide v4, v0, p1
  .line 1819
    aget-wide v4, v0, v1
    iget-wide v6, p2, Lcom/innioasis/ipp/DiscCache$Tags;->openNs:J
    add-long/2addr v4, v6
    aput-wide v4, v0, v1
  .line 1820
    iget-boolean p1, p2, Lcom/innioasis/ipp/DiscCache$Tags;->ours:Z
    if-eqz p1, :L3
    const/4 p1, 2
    aget-wide v4, v0, p1
    add-long/2addr v4, v2
    aput-wide v4, v0, p1
  :L3
  .line 1821
    return-void
.end method

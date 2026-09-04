.class public final Lcom/innioasis/ipp/TrackComparator;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "TrackComparator.java"

.method public constructor <init>()V
  .registers 1
  .line 17
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 3
  .line 21
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/TrackCache;->get(Ljava/lang/String;)I
    move-result p1
  .line 22
    check-cast p2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p2
    invoke-static { p2 }, Lcom/innioasis/ipp/TrackCache;->get(Ljava/lang/String;)I
    move-result p2
  .line 23
    if-ge p1, p2, :L0
  .line 24
    const/4 p1, -1
    return p1
  :L0
  .line 26
    if-le p1, p2, :L1
  .line 27
    const/4 p1, 1
    return p1
  :L1
  .line 29
    const/4 p1, 0
    return p1
.end method

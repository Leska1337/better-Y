.class final Lcom/innioasis/ipp/BigCover$Lru;
.super Ljava/util/LinkedHashMap;
.source "BigCover.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/BigCover;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Lru"
.end annotation

.method constructor <init>()V
  .registers 4
  .line 70
    const/high16 v0, 0x3F400000
    const/4 v1, 1
    const/16 v2, 32
    invoke-direct { p0, v2, v0, v1 }, Ljava/util/LinkedHashMap;-><init>(IFZ)V
    return-void
.end method

.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
  .registers 3
  .line 72
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BigCover$Lru;->size()I
    move-result p1
    const/16 v0, 24
    if-le p1, v0, :L0
    const/4 p1, 1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method

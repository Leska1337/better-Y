.class public final Lcom/innioasis/ipp/YearComparator;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "YearComparator.java"

.field private final desc:Z

.field private final years:Ljava/util/HashMap;

.method public constructor <init>(Z)V
  .registers 3
  .line 16
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 14
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/YearComparator;->years:Ljava/util/HashMap;
  .line 17
    iput-boolean p1, p0, Lcom/innioasis/ipp/YearComparator;->desc:Z
  .line 18
    return-void
.end method

.method private year(Ljava/lang/Object;)I
  .registers 4
  .line 21
    iget-object v0, p0, Lcom/innioasis/ipp/YearComparator;->years:Ljava/util/HashMap;
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  .line 22
    if-nez v0, :L0
  .line 23
    invoke-static { p1 }, Lcom/innioasis/ipp/YearComparator;->yearOf(Ljava/lang/Object;)I
    move-result v0
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
  .line 24
    iget-object v1, p0, Lcom/innioasis/ipp/YearComparator;->years:Ljava/util/HashMap;
    invoke-virtual { v1, p1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 26
    check-cast v0, Ljava/lang/Integer;
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result p1
    return p1
.end method

.method private static yearOf(Ljava/lang/Object;)I
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 31
    const/4 v0, 0
    if-nez p0, :L0
  .line 32
    return v0
  :L0
  .line 34
    check-cast p0, Ljava/lang/String;
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 35
    if-eqz p0, :L4
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 4
    if-eq v1, v2, :L1
    goto :L4
  :L1
  .line 39
    invoke-static { p0 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result p0
  :L2
    return p0
  :L3
  .line 40
    move-exception p0
  .line 41
    return v0
  :L4
  .line 36
    return v0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 4
  .line 47
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/YearComparator;->year(Ljava/lang/Object;)I
    move-result p1
  .line 48
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/YearComparator;->year(Ljava/lang/Object;)I
    move-result p2
  .line 49
    const v0, 2147483647
    if-nez p1, :L0
  .line 50
    const p1, 2147483647
  :L0
  .line 52
    if-nez p2, :L1
  .line 53
    const p2, 2147483647
  :L1
  .line 55
    if-ne p1, p2, :L2
  .line 56
    const/4 p1, 0
    return p1
  :L2
  .line 58
    if-ge p1, p2, :L3
    const/4 p1, -1
    goto :L4
  :L3
    const/4 p1, 1
  :L4
  .line 59
    iget-boolean p2, p0, Lcom/innioasis/ipp/YearComparator;->desc:Z
    if-eqz p2, :L5
    neg-int p1, p1
  :L5
    return p1
.end method

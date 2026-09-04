.class public final Lcom/innioasis/ipp/YearComparator;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "YearComparator.java"

.field private final desc:Z

.method public constructor <init>(Z)V
  .registers 2
  .line 20
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 21
    iput-boolean p1, p0, Lcom/innioasis/ipp/YearComparator;->desc:Z
  .line 22
    return-void
.end method

.method private static yearOf(Ljava/lang/Object;)I
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 26
    const/4 v0, 0
    if-nez p0, :L0
  .line 27
    return v0
  :L0
  .line 29
    check-cast p0, Ljava/lang/String;
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 30
    if-eqz p0, :L4
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 4
    if-eq v1, v2, :L1
    goto :L4
  :L1
  .line 34
    invoke-static { p0 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result p0
  :L2
    return p0
  :L3
  .line 35
    move-exception p0
  .line 36
    return v0
  :L4
  .line 31
    return v0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 4
  .line 42
    invoke-static { p1 }, Lcom/innioasis/ipp/YearComparator;->yearOf(Ljava/lang/Object;)I
    move-result p1
  .line 43
    invoke-static { p2 }, Lcom/innioasis/ipp/YearComparator;->yearOf(Ljava/lang/Object;)I
    move-result p2
  .line 44
    const v0, 2147483647
    if-nez p1, :L0
  .line 45
    const p1, 2147483647
  :L0
  .line 47
    if-nez p2, :L1
  .line 48
    const p2, 2147483647
  :L1
  .line 50
    if-ne p1, p2, :L2
  .line 51
    const/4 p1, 0
    return p1
  :L2
  .line 53
    if-ge p1, p2, :L3
    const/4 p1, -1
    goto :L4
  :L3
    const/4 p1, 1
  :L4
  .line 54
    iget-boolean p2, p0, Lcom/innioasis/ipp/YearComparator;->desc:Z
    if-eqz p2, :L5
    neg-int p1, p1
  :L5
    return p1
.end method

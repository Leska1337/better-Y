.class final Lcom/innioasis/ipp/Flow$Order;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Flow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Flow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Order"
.end annotation

.field private final groups:Ljava/util/HashMap;

.field private final sort:I

.field private final years:Lcom/innioasis/ipp/YearComparator;

.method constructor <init>(ILjava/util/HashMap;)V
  .registers 4
  .line 314
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 315
    iput p1, p0, Lcom/innioasis/ipp/Flow$Order;->sort:I
  .line 316
    iput-object p2, p0, Lcom/innioasis/ipp/Flow$Order;->groups:Ljava/util/HashMap;
  .line 317
    const/4 p2, 2
    const/4 v0, 3
    if-eq p1, p2, :L1
    if-ne p1, v0, :L0
    goto :L1
  :L0
    const/4 p1, 0
    goto :L4
  :L1
    new-instance p2, Lcom/innioasis/ipp/YearComparator;
    if-ne p1, v0, :L2
    const/4 p1, 1
    goto :L3
  :L2
    const/4 p1, 0
  :L3
    invoke-direct { p2, p1 }, Lcom/innioasis/ipp/YearComparator;-><init>(Z)V
    move-object p1, p2
  :L4
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Order;->years:Lcom/innioasis/ipp/YearComparator;
  .line 318
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 6
  .line 321
    check-cast p1, Lcom/innioasis/ipp/Flow$Item;
    check-cast p2, Lcom/innioasis/ipp/Flow$Item;
  .line 323
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Order;->groups:Ljava/util/HashMap;
    if-eqz v0, :L0
  .line 324
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Order;->groups:Ljava/util/HashMap;
    invoke-virtual { v1, p2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v0
  .line 325
    if-eqz v0, :L0
    return v0
  :L0
  .line 327
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Order;->years:Lcom/innioasis/ipp/YearComparator;
    if-eqz v0, :L1
  .line 328
    iget-object v1, p1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v2, p2, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-virtual { v0, v1, v2 }, Lcom/innioasis/ipp/YearComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I
    move-result v0
  .line 329
    if-eqz v0, :L1
    return v0
  :L1
  .line 331
    invoke-static { }, Lcom/innioasis/ipp/Flow;->access$000()Ljava/util/Comparator;
    move-result-object v0
    invoke-interface { v0, p1, p2 }, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I
    move-result p1
  .line 332
    iget p2, p0, Lcom/innioasis/ipp/Flow$Order;->sort:I
    const/4 v0, 1
    if-ne p2, v0, :L2
    neg-int p1, p1
  :L2
    return p1
.end method

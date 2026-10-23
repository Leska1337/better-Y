.class final Lcom/innioasis/ipp/Lab$ByCount;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Lab.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lab;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "ByCount"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 436
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 4
  .line 438
    check-cast p2, Ljava/util/Map$Entry;
    invoke-interface { p2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object p2
    check-cast p2, [I
    const/4 v0, 0
    aget p2, p2, v0
    check-cast p1, Ljava/util/Map$Entry;
  .line 439
    invoke-interface { p1 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object p1
    check-cast p1, [I
    aget p1, p1, v0
    sub-int/2addr p2, p1
  .line 438
    return p2
.end method

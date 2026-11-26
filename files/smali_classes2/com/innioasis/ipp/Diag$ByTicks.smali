.class final Lcom/innioasis/ipp/Diag$ByTicks;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Diag.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Diag;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "ByTicks"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 239
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 7
  .line 241
    check-cast p1, [Ljava/lang/Object;
    const/4 v0, 1
    aget-object p1, p1, v0
    check-cast p1, Ljava/lang/Long;
    invoke-virtual { p1 }, Ljava/lang/Long;->longValue()J
    move-result-wide v1
    check-cast p2, [Ljava/lang/Object;
    aget-object p1, p2, v0
    check-cast p1, Ljava/lang/Long;
    invoke-virtual { p1 }, Ljava/lang/Long;->longValue()J
    move-result-wide p1
  .line 242
    cmp-long v3, v1, p1
    if-lez v3, :L0
    const/4 v0, -1
    goto :L2
  :L0
    cmp-long v3, v1, p1
    if-gez v3, :L1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
    return v0
.end method

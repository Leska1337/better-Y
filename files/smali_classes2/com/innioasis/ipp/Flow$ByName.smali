.class final Lcom/innioasis/ipp/Flow$ByName;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Flow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Flow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "ByName"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 338
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Flow$1;)V
  .registers 2
  .line 338
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$ByName;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 5
  .line 340
    check-cast p1, Lcom/innioasis/ipp/Flow$Item;
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Item;->sort:Ljava/lang/String;
    check-cast p2, Lcom/innioasis/ipp/Flow$Item;
    iget-object v1, p2, Lcom/innioasis/ipp/Flow$Item;->sort:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v0
  .line 341
    if-eqz v0, :L0
    goto :L1
  :L0
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object p2, p2, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v0
  :L1
    return v0
.end method

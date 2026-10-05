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
  .line 127
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Flow$1;)V
  .registers 2
  .line 127
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$ByName;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 7
  .line 129
    check-cast p1, Lcom/innioasis/ipp/Flow$Item;
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 130
    check-cast p2, Lcom/innioasis/ipp/Flow$Item;
    iget-object v1, p2, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 131
    const-string v2, ""
    if-nez v0, :L0
    move-object v0, v2
  :L0
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v0, v3 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  .line 132
    if-nez v1, :L1
    move-object v1, v2
  :L1
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v0
  .line 133
    if-eqz v0, :L2
    goto :L3
  :L2
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object p2, p2, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v0
  :L3
    return v0
.end method

.class final Lcom/innioasis/ipp/Find$NameCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Find.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Find;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "NameCmp"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 404
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Find$1;)V
  .registers 2
  .line 404
    invoke-direct { p0 }, Lcom/innioasis/ipp/Find$NameCmp;-><init>()V
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 5
  .line 406
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p1
  .line 407
    check-cast p2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object p2
  .line 408
    const-string v0, ""
    if-nez p1, :L0
    move-object p1, v0
    goto :L1
  :L0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p1, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p1
  :L1
  .line 409
    if-nez p2, :L2
    goto :L3
  :L2
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p2, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  :L3
  .line 410
    invoke-virtual { p1, v0 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
    return p1
.end method

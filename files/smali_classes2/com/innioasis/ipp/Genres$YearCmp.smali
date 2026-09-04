.class final Lcom/innioasis/ipp/Genres$YearCmp;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Genres.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Genres;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "YearCmp"
.end annotation

.field private final byName:Lcom/innioasis/ipp/Genres$NameCmp;

.field private final desc:Z

.method constructor <init>(Z)V
  .registers 4
  .line 942
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 941
    new-instance v0, Lcom/innioasis/ipp/Genres$NameCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Genres$NameCmp;-><init>(Z)V
    iput-object v0, p0, Lcom/innioasis/ipp/Genres$YearCmp;->byName:Lcom/innioasis/ipp/Genres$NameCmp;
  .line 942
    iput-boolean p1, p0, Lcom/innioasis/ipp/Genres$YearCmp;->desc:Z
    return-void
.end method

.method private year(Ljava/lang/Object;)I
  .catchall { :L0 .. :L2 } :L4
  .registers 5
  .line 951
    const/4 v0, 0
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Genres;->access$1000(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 952
    if-eqz p1, :L3
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 4
    if-eq v1, v2, :L1
    goto :L3
  :L1
  .line 953
    invoke-static { p1 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result p1
  :L2
    return p1
  :L3
  .line 952
    return v0
  :L4
  .line 954
    move-exception p1
  .line 955
    return v0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 6
  .line 944
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Genres$YearCmp;->year(Ljava/lang/Object;)I
    move-result v0
  .line 945
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Genres$YearCmp;->year(Ljava/lang/Object;)I
    move-result v1
  .line 946
    if-eq v0, v1, :L4
    iget-boolean p1, p0, Lcom/innioasis/ipp/Genres$YearCmp;->desc:Z
    const/4 p2, -1
    const/4 v2, 1
    if-eqz p1, :L0
    if-ge v0, v1, :L1
    goto :L2
  :L0
    if-ge v0, v1, :L2
  :L1
    goto :L3
  :L2
    const/4 p2, 1
  :L3
    return p2
  :L4
  .line 947
    iget-object v0, p0, Lcom/innioasis/ipp/Genres$YearCmp;->byName:Lcom/innioasis/ipp/Genres$NameCmp;
    invoke-virtual { v0, p1, p2 }, Lcom/innioasis/ipp/Genres$NameCmp;->compare(Ljava/lang/Object;Ljava/lang/Object;)I
    move-result p1
    return p1
.end method

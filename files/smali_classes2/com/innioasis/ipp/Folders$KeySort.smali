.class final Lcom/innioasis/ipp/Folders$KeySort;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Folders.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Folders;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "KeySort"
.end annotation

.field private final asc:Z

.field private final byName:Z

.field private final dirsFirst:Z

.field private final sorted:Z

.method constructor <init>(ZZZZ)V
  .registers 5
  .line 668
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 669
    iput-boolean p1, p0, Lcom/innioasis/ipp/Folders$KeySort;->sorted:Z
    iput-boolean p2, p0, Lcom/innioasis/ipp/Folders$KeySort;->byName:Z
    iput-boolean p3, p0, Lcom/innioasis/ipp/Folders$KeySort;->asc:Z
    iput-boolean p4, p0, Lcom/innioasis/ipp/Folders$KeySort;->dirsFirst:Z
  .line 670
    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 11
  .line 673
    check-cast p1, Lcom/innioasis/ipp/Folders$Key;
    check-cast p2, Lcom/innioasis/ipp/Folders$Key;
  .line 676
    iget-boolean v0, p0, Lcom/innioasis/ipp/Folders$KeySort;->dirsFirst:Z
    const/4 v1, -1
    const/4 v2, 1
    if-eqz v0, :L2
    iget-boolean v0, p1, Lcom/innioasis/ipp/Folders$Key;->dir:Z
    iget-boolean v3, p2, Lcom/innioasis/ipp/Folders$Key;->dir:Z
    if-eq v0, v3, :L2
    iget-boolean p1, p1, Lcom/innioasis/ipp/Folders$Key;->dir:Z
    if-eqz p1, :L0
    goto :L1
  :L0
    const/4 v1, 1
  :L1
    return v1
  :L2
  .line 677
    iget-boolean v0, p0, Lcom/innioasis/ipp/Folders$KeySort;->sorted:Z
    const/4 v3, 0
    if-nez v0, :L3
    return v3
  :L3
  .line 679
    iget-boolean v0, p0, Lcom/innioasis/ipp/Folders$KeySort;->byName:Z
    if-eqz v0, :L4
  .line 680
    iget-object p1, p1, Lcom/innioasis/ipp/Folders$Key;->name:Ljava/lang/String;
    iget-object p2, p2, Lcom/innioasis/ipp/Folders$Key;->name:Ljava/lang/String;
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
    goto :L9
  :L4
  .line 682
    iget-wide v4, p1, Lcom/innioasis/ipp/Folders$Key;->time:J
    iget-wide v6, p2, Lcom/innioasis/ipp/Folders$Key;->time:J
    cmp-long v0, v4, v6
    if-gez v0, :L5
    goto :L7
  :L5
    iget-wide v0, p1, Lcom/innioasis/ipp/Folders$Key;->time:J
    iget-wide v4, p2, Lcom/innioasis/ipp/Folders$Key;->time:J
    cmp-long v6, v0, v4
    if-lez v6, :L6
    const/4 v1, 1
    goto :L7
  :L6
    const/4 v1, 0
  :L7
  .line 689
    if-nez v1, :L8
    iget-object p1, p1, Lcom/innioasis/ipp/Folders$Key;->name:Ljava/lang/String;
    iget-object p2, p2, Lcom/innioasis/ipp/Folders$Key;->name:Ljava/lang/String;
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
    goto :L9
  :L8
    move p1, v1
  :L9
  .line 691
    iget-boolean p2, p0, Lcom/innioasis/ipp/Folders$KeySort;->asc:Z
    if-eqz p2, :L10
    goto :L11
  :L10
    neg-int p1, p1
  :L11
    return p1
.end method

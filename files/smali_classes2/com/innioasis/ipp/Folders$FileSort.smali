.class final Lcom/innioasis/ipp/Folders$FileSort;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Folders.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Folders;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "FileSort"
.end annotation

.field private final asc:Z

.field private final byName:Z

.method constructor <init>(ZZ)V
  .registers 3
  .line 555
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-boolean p1, p0, Lcom/innioasis/ipp/Folders$FileSort;->byName:Z
    iput-boolean p2, p0, Lcom/innioasis/ipp/Folders$FileSort;->asc:Z
    return-void
.end method

.method private byName(Ljava/io/File;Ljava/io/File;)I
  .registers 4
  .line 579
    invoke-virtual { p1 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p2
  .line 580
    const-string v0, ""
    if-nez p1, :L0
    move-object p1, v0
  :L0
    if-nez p2, :L1
    move-object p2, v0
  :L1
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p1
    return p1
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 9
  .line 558
    instance-of v0, p1, Ljava/io/File;
    const/4 v1, 0
    if-eqz v0, :L8
    instance-of v0, p2, Ljava/io/File;
    if-nez v0, :L0
    goto :L8
  :L0
  .line 559
    check-cast p1, Ljava/io/File;
    check-cast p2, Ljava/io/File;
  .line 561
    iget-boolean v0, p0, Lcom/innioasis/ipp/Folders$FileSort;->byName:Z
    if-eqz v0, :L1
  .line 562
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Folders$FileSort;->byName(Ljava/io/File;Ljava/io/File;)I
    move-result p1
    goto :L5
  :L1
  .line 564
    invoke-virtual { p1 }, Ljava/io/File;->lastModified()J
    move-result-wide v2
    invoke-virtual { p2 }, Ljava/io/File;->lastModified()J
    move-result-wide v4
  .line 565
    cmp-long v0, v2, v4
    if-gez v0, :L2
    const/4 v1, -1
    goto :L3
  :L2
    cmp-long v0, v2, v4
    if-lez v0, :L3
    const/4 v1, 1
  :L3
  .line 572
    if-nez v1, :L4
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Folders$FileSort;->byName(Ljava/io/File;Ljava/io/File;)I
    move-result p1
    goto :L5
  :L4
    move p1, v1
  :L5
  .line 574
    iget-boolean p2, p0, Lcom/innioasis/ipp/Folders$FileSort;->asc:Z
    if-eqz p2, :L6
    goto :L7
  :L6
    neg-int p1, p1
  :L7
    return p1
  :L8
  .line 558
    return v1
.end method

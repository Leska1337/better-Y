.class final Lcom/innioasis/ipp/Audiobooks$SongSort;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "Audiobooks.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Audiobooks;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "SongSort"
.end annotation

.field private final asc:Z

.field private final byName:Z

.method constructor <init>(ZZ)V
  .registers 3
  .line 257
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-boolean p1, p0, Lcom/innioasis/ipp/Audiobooks$SongSort;->byName:Z
    iput-boolean p2, p0, Lcom/innioasis/ipp/Audiobooks$SongSort;->asc:Z
    return-void
.end method

.method private key(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 4
  .line 285
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPinyinName()Ljava/lang/String;
    move-result-object v0
  .line 286
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L0
    return-object v0
  :L0
  .line 287
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Audiobooks;->access$200(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    return-object p1
.end method

.method private name(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)I
  .registers 5
  .line 278
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Audiobooks$SongSort;->key(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Audiobooks$SongSort;->key(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v0
  .line 281
    if-eqz v0, :L0
    goto :L1
  :L0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Audiobooks$SongSort;->nz(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p2
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Audiobooks$SongSort;->nz(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v0
  :L1
    return v0
.end method

.method private nz(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 290
    if-nez p1, :L0
    const-string p1, ""
  :L0
    return-object p1
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 9
  .line 260
    instance-of v0, p1, Lcom/innioasis/y1/database/Song;
    const/4 v1, 0
    if-eqz v0, :L8
    instance-of v0, p2, Lcom/innioasis/y1/database/Song;
    if-nez v0, :L0
    goto :L8
  :L0
  .line 261
    check-cast p1, Lcom/innioasis/y1/database/Song;
    check-cast p2, Lcom/innioasis/y1/database/Song;
  .line 263
    iget-boolean v0, p0, Lcom/innioasis/ipp/Audiobooks$SongSort;->byName:Z
    if-eqz v0, :L1
  .line 264
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Audiobooks$SongSort;->name(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)I
    move-result p1
    goto :L5
  :L1
  .line 266
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v2
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v4
  .line 267
    cmp-long v0, v2, v4
    if-gez v0, :L2
    const/4 v1, -1
    goto :L3
  :L2
    cmp-long v0, v2, v4
    if-lez v0, :L3
    const/4 v1, 1
  :L3
  .line 272
    if-nez v1, :L4
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Audiobooks$SongSort;->name(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)I
    move-result p1
    goto :L5
  :L4
    move p1, v1
  :L5
  .line 274
    iget-boolean p2, p0, Lcom/innioasis/ipp/Audiobooks$SongSort;->asc:Z
    if-eqz p2, :L6
    goto :L7
  :L6
    neg-int p1, p1
  :L7
    return p1
  :L8
  .line 260
    return v1
.end method

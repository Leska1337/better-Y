.class final Lcom/innioasis/ipp/Stale$Need;
.super Ljava/lang/Object;
.source "Stale.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Stale;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Need"
.end annotation

.field final albums:Ljava/util/HashSet;

.field final big:Lcom/innioasis/ipp/Stale$Keys;

.field private final byDir:Ljava/util/HashMap;

.field final flow:Lcom/innioasis/ipp/Stale$Keys;

.field final folders:Ljava/util/HashSet;

.field private last:Ljava/lang/String;

.field private lastHash:I

.method private constructor <init>()V
  .registers 2
  .line 74
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 75
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Stale$Need;->folders:Ljava/util/HashSet;
  .line 76
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Stale$Need;->albums:Ljava/util/HashSet;
  .line 78
    new-instance v0, Lcom/innioasis/ipp/Stale$Keys;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Stale$Keys;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Stale$Need;->big:Lcom/innioasis/ipp/Stale$Keys;
  .line 80
    new-instance v0, Lcom/innioasis/ipp/Stale$Keys;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Stale$Keys;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Stale$Need;->flow:Lcom/innioasis/ipp/Stale$Keys;
  .line 81
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Stale$Need;->byDir:Ljava/util/HashMap;
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Stale$1;)V
  .registers 2
  .line 74
    invoke-direct { p0 }, Lcom/innioasis/ipp/Stale$Need;-><init>()V
    return-void
.end method

.method private add(Lcom/innioasis/y1/database/Song;Z)V
  .registers 12
  .line 94
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 95
    if-nez v0, :L0
    return-void
  :L0
  .line 96
    invoke-virtual { v0 }, Ljava/lang/String;->hashCode()I
    move-result v1
  .line 97
    iget-object v2, p0, Lcom/innioasis/ipp/Stale$Need;->big:Lcom/innioasis/ipp/Stale$Keys;
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Stale$Keys;->of(II)J
    move-result-wide v3
    invoke-virtual { v2, v3, v4 }, Lcom/innioasis/ipp/Stale$Keys;->add(J)V
  .line 98
    const/16 v2, 47
    invoke-virtual { v0, v2 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v2
  .line 99
    iget-object v3, p0, Lcom/innioasis/ipp/Stale$Need;->last:Ljava/lang/String;
    const-string v4, ""
    if-eqz v3, :L1
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v3
    if-ne v2, v3, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Stale$Need;->last:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L4
  :L1
  .line 100
    if-gez v2, :L2
    move-object v0, v4
    goto :L3
  :L2
    const/4 v3, 0
    invoke-virtual { v0, v3, v2 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
  :L3
    iput-object v0, p0, Lcom/innioasis/ipp/Stale$Need;->last:Ljava/lang/String;
  .line 101
    invoke-virtual { v0 }, Ljava/lang/String;->hashCode()I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Stale$Need;->lastHash:I
  .line 102
    iget-object v0, p0, Lcom/innioasis/ipp/Stale$Need;->folders:Ljava/util/HashSet;
    iget-object v2, p0, Lcom/innioasis/ipp/Stale$Need;->last:Ljava/lang/String;
    invoke-virtual { v0, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L4
    iget-object v0, p0, Lcom/innioasis/ipp/Stale$Need;->big:Lcom/innioasis/ipp/Stale$Keys;
    iget v2, p0, Lcom/innioasis/ipp/Stale$Need;->lastHash:I
    iget-object v3, p0, Lcom/innioasis/ipp/Stale$Need;->last:Ljava/lang/String;
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v3
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Stale$Keys;->of(II)J
    move-result-wide v2
    invoke-virtual { v0, v2, v3 }, Lcom/innioasis/ipp/Stale$Keys;->add(J)V
  :L4
  .line 104
    iget-object v0, p0, Lcom/innioasis/ipp/Stale$Need;->flow:Lcom/innioasis/ipp/Stale$Keys;
    iget v2, p0, Lcom/innioasis/ipp/Stale$Need;->lastHash:I
    int-to-long v2, v2
    const/16 v5, 32
    shl-long/2addr v2, v5
    int-to-long v5, v1
    const-wide v7, 4294967295L
    and-long/2addr v5, v7
    or-long/2addr v2, v5
    invoke-virtual { v0, v2, v3 }, Lcom/innioasis/ipp/Stale$Keys;->add(J)V
  .line 105
    if-eqz p2, :L5
    iget-object p2, p0, Lcom/innioasis/ipp/Stale$Need;->albums:Ljava/util/HashSet;
    iget-object v0, p0, Lcom/innioasis/ipp/Stale$Need;->byDir:Ljava/util/HashMap;
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p2, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L5
  .line 106
    iget-object p2, p0, Lcom/innioasis/ipp/Stale$Need;->albums:Ljava/util/HashSet;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L6
    goto :L7
  :L6
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v4
  :L7
    invoke-virtual { p2, v4 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 107
    return-void
.end method

.method addAll(Ljava/util/List;Z)V
  .registers 6
  .line 86
    if-nez p1, :L0
    return-void
  :L0
  .line 87
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L3
  .line 88
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 89
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L2
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, v1, p2 }, Lcom/innioasis/ipp/Stale$Need;->add(Lcom/innioasis/y1/database/Song;Z)V
  :L2
  .line 87
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 91
    return-void
.end method

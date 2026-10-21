.class public final Lcom/innioasis/ipp/DiscCache;
.super Ljava/lang/Object;
.source "DiscCache.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/DiscCache$Tags;
  }
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 12
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static commit(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .registers 3
  .line 64
    if-eqz p0, :L1
    if-eqz p1, :L1
    iget-boolean v0, p1, Lcom/innioasis/ipp/DiscCache$Tags;->wanted:Z
    if-eqz v0, :L1
    iget-boolean v0, p1, Lcom/innioasis/ipp/DiscCache$Tags;->ok:Z
    if-nez v0, :L0
    goto :L1
  :L0
  .line 65
    iget-object p1, p1, Lcom/innioasis/ipp/DiscCache$Tags;->info:Lcom/innioasis/ipp/Meta$Info;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  .line 66
    return-void
  :L1
  .line 64
    return-void
.end method

.method public static flush()V
  .registers 0
  .line 97
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 98
    return-void
.end method

.method public static get(Ljava/lang/String;)I
  .registers 2
  .line 23
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 24
    if-nez p0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 25
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/DiscCache;->parse(Ljava/lang/String;)I
    move-result v0
  .line 26
    if-lez v0, :L1
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/DiscCache;->sideOf(Ljava/lang/String;)I
    move-result v0
  :L2
    return v0
.end method

.method public static known(Ljava/lang/String;)Z
  .registers 2
  .line 16
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 17
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 18
    if-eqz p0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result p0
    if-nez p0, :L1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
    return v0
.end method

.method private static parse(Ljava/lang/String;)I
  .registers 7
  .line 84
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 85
    nop
  .line 86
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 0
  :L1
  .line 87
    const/16 v3, 57
    const/16 v4, 48
    if-ge v2, v1, :L3
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    if-lt v5, v4, :L2
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    if-le v5, v3, :L3
  :L2
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 88
    nop
  :L4
  .line 89
    if-ge v2, v1, :L5
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    if-lt v5, v4, :L5
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    if-gt v5, v3, :L5
  .line 90
    mul-int/lit8 v0, v0, 10
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    sub-int/2addr v5, v4
    add-int/2addr v0, v5
  .line 91
    add-int/lit8 v2, v2, 1
    goto :L4
  :L5
  .line 93
    return v0
.end method

.method public static read(Ljava/lang/String;ZZ)Lcom/innioasis/ipp/DiscCache$Tags;
  .registers 4
  .line 47
    new-instance v0, Lcom/innioasis/ipp/DiscCache$Tags;
    invoke-direct { v0 }, Lcom/innioasis/ipp/DiscCache$Tags;-><init>()V
  .line 48
    iput-boolean p1, v0, Lcom/innioasis/ipp/DiscCache$Tags;->wanted:Z
  .line 49
    if-nez p0, :L0
    return-object v0
  :L0
  .line 50
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object p0
  .line 51
    iget-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->art:[B
    iput-object p2, v0, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
  .line 53
    const/4 p2, 0
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->art:[B
  .line 54
    if-eqz p1, :L1
    iput-object p0, v0, Lcom/innioasis/ipp/DiscCache$Tags;->info:Lcom/innioasis/ipp/Meta$Info;
  :L1
  .line 55
    iget-boolean p1, p0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    iput-boolean p1, v0, Lcom/innioasis/ipp/DiscCache$Tags;->ok:Z
  .line 56
    iget-wide p1, p0, Lcom/innioasis/ipp/Meta$Info;->openNs:J
    iput-wide p1, v0, Lcom/innioasis/ipp/DiscCache$Tags;->openNs:J
  .line 57
    iget-wide p1, p0, Lcom/innioasis/ipp/Meta$Info;->artNs:J
    iput-wide p1, v0, Lcom/innioasis/ipp/DiscCache$Tags;->artNs:J
  .line 58
    iget-boolean p0, p0, Lcom/innioasis/ipp/Meta$Info;->ours:Z
    iput-boolean p0, v0, Lcom/innioasis/ipp/DiscCache$Tags;->ours:Z
  .line 59
    return-object v0
.end method

.method private static sideOf(Ljava/lang/String;)I
  .registers 6
  .line 73
    const/4 v0, 0
    if-eqz p0, :L6
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 2
    if-ge v1, v2, :L0
    goto :L6
  :L0
  .line 74
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v1
  .line 75
    const/16 v2, 97
    if-lt v1, v2, :L1
    const/16 v2, 122
    if-gt v1, v2, :L1
    add-int/lit8 v1, v1, -32
    int-to-char v1, v1
  :L1
  .line 76
    const/16 v2, 65
    if-lt v1, v2, :L5
    const/16 v3, 90
    if-le v1, v3, :L2
    goto :L5
  :L2
  .line 77
    const/4 v3, 1
    invoke-virtual { p0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result p0
  .line 78
    const/16 v4, 48
    if-lt p0, v4, :L4
    const/16 v4, 57
    if-le p0, v4, :L3
    goto :L4
  :L3
  .line 79
    sub-int/2addr v1, v2
    add-int/2addr v1, v3
    add-int/lit16 v1, v1, 1000
    return v1
  :L4
  .line 78
    return v0
  :L5
  .line 76
    return v0
  :L6
  .line 73
    return v0
.end method

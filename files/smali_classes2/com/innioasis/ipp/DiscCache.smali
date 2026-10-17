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
  .line 17
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 100
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 101
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L2
  .line 102
    if-eqz v0, :L3
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_discs.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L3
  .line 104
    goto :L5
  :L4
  .line 103
    move-exception v0
  :L5
  .line 105
    return-void
.end method

.method public static commit(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .registers 3
  .line 61
    if-eqz p0, :L1
    if-eqz p1, :L1
    iget-boolean v0, p1, Lcom/innioasis/ipp/DiscCache$Tags;->wanted:Z
    if-eqz v0, :L1
    iget-boolean v0, p1, Lcom/innioasis/ipp/DiscCache$Tags;->ok:Z
    if-nez v0, :L0
    goto :L1
  :L0
  .line 62
    iget-object p1, p1, Lcom/innioasis/ipp/DiscCache$Tags;->info:Lcom/innioasis/ipp/Meta$Info;
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  .line 63
    return-void
  :L1
  .line 61
    return-void
.end method

.method public static flush()V
  .registers 0
  .line 94
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 95
    return-void
.end method

.method public static get(Ljava/lang/String;)I
  .registers 2
  .line 28
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 29
    if-nez p0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 30
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/DiscCache;->parse(Ljava/lang/String;)I
    move-result v0
  .line 31
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
  .line 21
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 22
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 23
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
  .line 81
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 82
    nop
  .line 83
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 0
  :L1
  .line 84
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
  .line 85
    nop
  :L4
  .line 86
    if-ge v2, v1, :L5
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    if-lt v5, v4, :L5
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    if-gt v5, v3, :L5
  .line 87
    mul-int/lit8 v0, v0, 10
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    sub-int/2addr v5, v4
    add-int/2addr v0, v5
  .line 88
    add-int/lit8 v2, v2, 1
    goto :L4
  :L5
  .line 90
    return v0
.end method

.method public static read(Ljava/lang/String;ZZ)Lcom/innioasis/ipp/DiscCache$Tags;
  .registers 4
  .line 49
    new-instance v0, Lcom/innioasis/ipp/DiscCache$Tags;
    invoke-direct { v0 }, Lcom/innioasis/ipp/DiscCache$Tags;-><init>()V
  .line 50
    iput-boolean p1, v0, Lcom/innioasis/ipp/DiscCache$Tags;->wanted:Z
  .line 51
    if-nez p0, :L0
    return-object v0
  :L0
  .line 52
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object p0
  .line 53
    if-eqz p1, :L1
    iput-object p0, v0, Lcom/innioasis/ipp/DiscCache$Tags;->info:Lcom/innioasis/ipp/Meta$Info;
  :L1
  .line 54
    iget-object p1, p0, Lcom/innioasis/ipp/Meta$Info;->art:[B
    iput-object p1, v0, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
  .line 55
    iget-boolean p0, p0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    iput-boolean p0, v0, Lcom/innioasis/ipp/DiscCache$Tags;->ok:Z
  .line 56
    return-object v0
.end method

.method private static sideOf(Ljava/lang/String;)I
  .registers 6
  .line 70
    const/4 v0, 0
    if-eqz p0, :L6
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 2
    if-ge v1, v2, :L0
    goto :L6
  :L0
  .line 71
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v1
  .line 72
    const/16 v2, 97
    if-lt v1, v2, :L1
    const/16 v2, 122
    if-gt v1, v2, :L1
    add-int/lit8 v1, v1, -32
    int-to-char v1, v1
  :L1
  .line 73
    const/16 v2, 65
    if-lt v1, v2, :L5
    const/16 v3, 90
    if-le v1, v3, :L2
    goto :L5
  :L2
  .line 74
    const/4 v3, 1
    invoke-virtual { p0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result p0
  .line 75
    const/16 v4, 48
    if-lt p0, v4, :L4
    const/16 v4, 57
    if-le p0, v4, :L3
    goto :L4
  :L3
  .line 76
    sub-int/2addr v1, v2
    add-int/2addr v1, v3
    add-int/lit16 v1, v1, 1000
    return v1
  :L4
  .line 75
    return v0
  :L5
  .line 73
    return v0
  :L6
  .line 70
    return v0
.end method

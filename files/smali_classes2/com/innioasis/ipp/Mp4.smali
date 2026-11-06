.class final Lcom/innioasis/ipp/Mp4;
.super Ljava/lang/Object;
.source "Mp4.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Mp4$Box;
  }
.end annotation

.field private final static MAX_ART:I = 8388608

.field private final static MAX_TEXT:I = 65536

.method private constructor <init>()V
  .registers 1
  .line 18
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static be32([BI)I
  .registers 4
  .line 176
    aget-byte v0, p0, p1
    and-int/lit16 v0, v0, 255
    shl-int/lit8 v0, v0, 24
    add-int/lit8 v1, p1, 1
    aget-byte v1, p0, v1
    and-int/lit16 v1, v1, 255
    shl-int/lit8 v1, v1, 16
    or-int/2addr v0, v1
    add-int/lit8 v1, p1, 2
    aget-byte v1, p0, v1
    and-int/lit16 v1, v1, 255
    shl-int/lit8 v1, v1, 8
    or-int/2addr v0, v1
    add-int/lit8 p1, p1, 3
    aget-byte p0, p0, p1
    and-int/lit16 p0, p0, 255
    or-int/2addr p0, v0
    return p0
.end method

.method private static be64([BI)J
  .registers 7
  .line 180
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mp4;->be32([BI)I
    move-result v0
    int-to-long v0, v0
    const-wide v2, 4294967295L
    and-long/2addr v0, v2
    const/16 v4, 32
    shl-long/2addr v0, v4
    add-int/lit8 p1, p1, 4
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mp4;->be32([BI)I
    move-result p0
    int-to-long p0, p0
    and-long/2addr p0, v2
    or-long/2addr p0, v0
    return-wide p0
.end method

.method private static box(Ljava/io/RandomAccessFile;JJ[B)Lcom/innioasis/ipp/Mp4$Box;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 12
  .line 58
    invoke-virtual { p0, p1, p2 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 59
    const/4 v0, 0
    const/16 v1, 8
    invoke-virtual { p0, p5, v0, v1 }, Ljava/io/RandomAccessFile;->readFully([BII)V
  .line 60
    invoke-static { p5, v0 }, Lcom/innioasis/ipp/Mp4;->be32([BI)I
    move-result v0
    int-to-long v2, v0
    const-wide v4, 4294967295L
    and-long/2addr v2, v4
  .line 61
    nop
  .line 62
    const-wide/16 v4, 1
    cmp-long v0, v2, v4
    if-nez v0, :L0
  .line 63
    invoke-virtual { p0, p5, v1, v1 }, Ljava/io/RandomAccessFile;->readFully([BII)V
  .line 64
    invoke-static { p5, v1 }, Lcom/innioasis/ipp/Mp4;->be64([BI)J
    move-result-wide v2
  .line 65
    const/16 v1, 16
    goto :L1
  :L0
  .line 66
    const-wide/16 v4, 0
    cmp-long p0, v2, v4
    if-nez p0, :L1
  .line 67
    sub-long v2, p3, p1
  :L1
  .line 69
    int-to-long v0, v1
    const/4 p0, 0
    cmp-long v4, v2, v0
    if-ltz v4, :L3
    add-long/2addr v2, p1
    cmp-long v4, v2, p3
    if-lez v4, :L2
    goto :L3
  :L2
  .line 70
    new-instance p3, Lcom/innioasis/ipp/Mp4$Box;
    invoke-direct { p3, p0 }, Lcom/innioasis/ipp/Mp4$Box;-><init>(Lcom/innioasis/ipp/Mp4$1;)V
  .line 71
    new-instance p0, Ljava/lang/String;
    const-string p4, "ISO-8859-1"
    const/4 v4, 4
    invoke-direct { p0, p5, v4, v4, p4 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    iput-object p0, p3, Lcom/innioasis/ipp/Mp4$Box;->type:Ljava/lang/String;
  .line 72
    add-long/2addr p1, v0
    iput-wide p1, p3, Lcom/innioasis/ipp/Mp4$Box;->body:J
  .line 73
    iput-wide v2, p3, Lcom/innioasis/ipp/Mp4$Box;->end:J
  .line 74
    return-object p3
  :L3
  .line 69
    return-object p0
.end method

.method private static created(Ljava/io/RandomAccessFile;J[B)Ljava/lang/String;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 6
  .line 107
    invoke-virtual { p0, p1, p2 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 108
    const/16 p1, 12
    const/4 p2, 0
    invoke-virtual { p0, p3, p2, p1 }, Ljava/io/RandomAccessFile;->readFully([BII)V
  .line 110
    aget-byte p0, p3, p2
    const/4 p1, 1
    const/4 p2, 4
    if-ne p0, p1, :L0
    invoke-static { p3, p2 }, Lcom/innioasis/ipp/Mp4;->be64([BI)J
    move-result-wide p0
    goto :L1
  :L0
  .line 111
    invoke-static { p3, p2 }, Lcom/innioasis/ipp/Mp4;->be32([BI)I
    move-result p0
    int-to-long p0, p0
    const-wide p2, 4294967295L
    and-long/2addr p0, p2
  :L1
  .line 112
    new-instance p2, Ljava/text/SimpleDateFormat;
    const-string p3, "yyyyMMdd'T'HHmmss'.000Z'"
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { p2, p3, v0 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
  .line 113
    const-string p3, "UTC"
    invoke-static { p3 }, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;
    move-result-object p3
    invoke-virtual { p2, p3 }, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V
  .line 114
    new-instance p3, Ljava/util/Date;
    const-wide/32 v0, 2082844800
    sub-long/2addr p0, v0
    const-wide/16 v0, 1000
    mul-long p0, p0, v0
    invoke-direct { p3, p0, p1 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { p2, p3 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static items(Ljava/io/RandomAccessFile;JJLcom/innioasis/ipp/Meta$Info;Z[B)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 22
  .line 119
    move-object v6, p0
    move-object/from16 v7, p5
    move-wide v1, p1
  :L0
    const-wide/16 v8, 8
    add-long v3, v1, v8
    cmp-long v0, v3, p3
    if-gtz v0, :L12
  .line 120
    move-object v0, p0
    move-wide/from16 v3, p3
    move-object/from16 v5, p7
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Mp4;->box(Ljava/io/RandomAccessFile;JJ[B)Lcom/innioasis/ipp/Mp4$Box;
    move-result-object v0
  .line 121
    if-nez v0, :L1
    return-void
  :L1
  .line 122
    iget-wide v10, v0, Lcom/innioasis/ipp/Mp4$Box;->end:J
  .line 123
    iget-object v12, v0, Lcom/innioasis/ipp/Mp4$Box;->type:Ljava/lang/String;
  .line 124
    const-string v1, "covr"
    invoke-virtual { v12, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v13
  .line 125
    if-eqz v13, :L2
    if-nez p6, :L2
    goto :L11
  :L2
  .line 126
    if-nez v13, :L4
    invoke-static { v12 }, Lcom/innioasis/ipp/Mp4;->wanted(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L4
    iget-boolean v1, v7, Lcom/innioasis/ipp/Meta$Info;->wantLyrics:Z
    if-eqz v1, :L3
    const-string v1, "\u00a9lyr"
    invoke-virtual { v12, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L4
  :L3
    goto :L11
  :L4
  .line 128
    iget-wide v1, v0, Lcom/innioasis/ipp/Mp4$Box;->body:J
    iget-wide v3, v0, Lcom/innioasis/ipp/Mp4$Box;->end:J
    move-object v0, p0
    move-object/from16 v5, p7
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Mp4;->box(Ljava/io/RandomAccessFile;JJ[B)Lcom/innioasis/ipp/Mp4$Box;
    move-result-object v0
  .line 129
    if-eqz v0, :L11
    iget-object v1, v0, Lcom/innioasis/ipp/Mp4$Box;->type:Ljava/lang/String;
    const-string v2, "data"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L5
    goto :L11
  :L5
  .line 130
    iget-wide v1, v0, Lcom/innioasis/ipp/Mp4$Box;->end:J
    iget-wide v3, v0, Lcom/innioasis/ipp/Mp4$Box;->body:J
    sub-long/2addr v1, v3
    sub-long/2addr v1, v8
  .line 131
    const-wide/16 v3, 0
    cmp-long v5, v1, v3
    if-lez v5, :L11
    if-eqz v13, :L6
    const/high16 v3, 0x00800000
    goto :L7
  :L6
    const/high16 v3, 0x00010000
  :L7
    int-to-long v3, v3
    cmp-long v5, v1, v3
    if-lez v5, :L8
    goto :L11
  :L8
  .line 132
    long-to-int v2, v1
    new-array v1, v2, [B
  .line 133
    iget-wide v2, v0, Lcom/innioasis/ipp/Mp4$Box;->body:J
    add-long/2addr v2, v8
    invoke-virtual { p0, v2, v3 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 134
    invoke-virtual { p0, v1 }, Ljava/io/RandomAccessFile;->readFully([B)V
  .line 135
    if-eqz v13, :L9
  .line 136
    iget-object v0, v7, Lcom/innioasis/ipp/Meta$Info;->art:[B
    if-nez v0, :L10
    iput-object v1, v7, Lcom/innioasis/ipp/Meta$Info;->art:[B
    goto :L10
  :L9
  .line 138
    invoke-static { v7, v12, v1 }, Lcom/innioasis/ipp/Mp4;->put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;[B)V
  :L10
  .line 140
    nop
  :L11
  .line 119
    move-wide v1, v10
    goto/16 :L0
  :L12
  .line 141
    return-void
.end method

.method private static put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;[B)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 7
  .line 150
    const-string v0, "trkn"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    const/4 v2, 2
    if-nez v1, :L11
    const-string v1, "disk"
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L0
    goto/16 :L11
  :L0
  .line 159
    const-string v0, "gnre"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
  .line 160
    array-length p1, p2
    if-ge p1, v2, :L1
    return-void
  :L1
  .line 161
    const/4 p1, 0
    aget-byte p1, p2, p1
    and-int/lit16 p1, p1, 255
    shl-int/lit8 p1, p1, 8
    const/4 v0, 1
    aget-byte p2, p2, v0
    and-int/lit16 p2, p2, 255
    or-int/2addr p1, p2
    sub-int/2addr p1, v0
  .line 162
    if-ltz p1, :L2
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
  :L2
  .line 163
    return-void
  :L3
  .line 165
    new-instance v0, Ljava/lang/String;
    const-string v1, "UTF-8"
    invoke-direct { v0, p2, v1 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
  .line 166
    const-string p2, "\u00a9nam"
    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L4
    iput-object v0, p0, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    goto :L10
  :L4
  .line 167
    const-string p2, "\u00a9ART"
    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L5
    iput-object v0, p0, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    goto :L10
  :L5
  .line 168
    const-string p2, "aART"
    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L6
    iput-object v0, p0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
    goto :L10
  :L6
  .line 169
    const-string p2, "\u00a9alb"
    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L7
    iput-object v0, p0, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    goto :L10
  :L7
  .line 170
    const-string p2, "\u00a9gen"
    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L8
    iput-object v0, p0, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    goto :L10
  :L8
  .line 171
    const-string p2, "\u00a9day"
    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L9
    iput-object v0, p0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
    goto :L10
  :L9
  .line 172
    const-string p2, "\u00a9lyr"
    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L10
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Meta;->offerLyrics(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;)V
  :L10
  .line 173
    return-void
  :L11
  .line 151
    array-length v1, p2
    const/4 v3, 6
    if-ge v1, v3, :L12
    return-void
  :L12
  .line 152
    aget-byte v1, p2, v2
    and-int/lit16 v1, v1, 255
    shl-int/lit8 v1, v1, 8
    const/4 v2, 3
    aget-byte v2, p2, v2
    and-int/lit16 v2, v2, 255
    or-int/2addr v1, v2
  .line 153
    const/4 v2, 4
    aget-byte v2, p2, v2
    and-int/lit16 v2, v2, 255
    shl-int/lit8 v2, v2, 8
    const/4 v3, 5
    aget-byte p2, p2, v3
    and-int/lit16 p2, p2, 255
    or-int/2addr p2, v2
  .line 154
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "/"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p2
    invoke-virtual { p2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p2
  .line 155
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L13
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    goto :L14
  :L13
  .line 156
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
  :L14
  .line 157
    return-void
.end method

.method static read(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .catchall { :L0 .. :L1 } :L22
  .catchall { :L1 .. :L3 } :L21
  .catchall { :L4 .. :L5 } :L6
  .catchall { :L8 .. :L9 } :L21
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L14 .. :L15 } :L21
  .catchall { :L17 .. :L18 } :L19
  .catchall { :L24 .. :L25 } :L26
  .registers 15
  .line 25
    nop
  .line 27
    const/4 v0, 0
    const/4 v1, 0
  :L0
    new-instance v11, Ljava/io/RandomAccessFile;
    const-string v2, "r"
    invoke-direct { v11, p0, v2 }, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  :L1
  .line 28
    invoke-virtual { v11 }, Ljava/io/RandomAccessFile;->length()J
    move-result-wide v8
  .line 29
    nop
  .line 30
    const/16 p0, 16
    new-array p0, p0, [B
    const-wide/16 v1, 0
    move-wide v3, v1
  :L2
  .line 31
    const-wide/16 v1, 8
    add-long/2addr v1, v3
    cmp-long v5, v1, v8
    if-gtz v5, :L16
  .line 32
    move-object v2, v11
    move-wide v5, v8
    move-object v7, p0
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Mp4;->box(Ljava/io/RandomAccessFile;JJ[B)Lcom/innioasis/ipp/Mp4$Box;
    move-result-object v1
  :L3
  .line 33
    if-nez v1, :L8
  :L4
  .line 45
    invoke-virtual { v11 }, Ljava/io/RandomAccessFile;->close()V
  :L5
  .line 47
    goto :L7
  :L6
  .line 46
    move-exception p0
  :L7
  .line 33
    return v0
  :L8
  .line 34
    iget-object v2, v1, Lcom/innioasis/ipp/Mp4$Box;->type:Ljava/lang/String;
    const-string v3, "moov"
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L14
  .line 35
    iget-wide v3, v1, Lcom/innioasis/ipp/Mp4$Box;->body:J
    iget-wide v5, v1, Lcom/innioasis/ipp/Mp4$Box;->end:J
    const/4 v10, 0
    move-object v2, v11
    move-object v7, p1
    move v8, p2
    move-object v9, p0
    invoke-static/range { v2 .. v10 }, Lcom/innioasis/ipp/Mp4;->walk(Ljava/io/RandomAccessFile;JJLcom/innioasis/ipp/Meta$Info;Z[BI)V
  :L9
  .line 36
    nop
  :L10
  .line 45
    invoke-virtual { v11 }, Ljava/io/RandomAccessFile;->close()V
  :L11
  .line 47
    goto :L13
  :L12
  .line 46
    move-exception p0
  :L13
  .line 36
    const/4 p0, 1
    return p0
  :L14
  .line 38
    iget-wide v3, v1, Lcom/innioasis/ipp/Mp4$Box;->end:J
  :L15
  .line 39
    goto :L2
  :L16
  .line 40
    nop
  :L17
  .line 45
    invoke-virtual { v11 }, Ljava/io/RandomAccessFile;->close()V
  :L18
  .line 47
    goto :L20
  :L19
  .line 46
    move-exception p0
  :L20
  .line 40
    return v0
  :L21
  .line 41
    move-exception p0
    move-object v1, v11
    goto :L23
  :L22
    move-exception p0
  :L23
  .line 42
    nop
  .line 45
    if-eqz v1, :L27
  :L24
    invoke-virtual { v1 }, Ljava/io/RandomAccessFile;->close()V
  :L25
    goto :L27
  :L26
  .line 46
    move-exception p0
    goto :L28
  :L27
  .line 47
    nop
  :L28
  .line 42
    return v0
.end method

.method private static walk(Ljava/io/RandomAccessFile;JJLcom/innioasis/ipp/Meta$Info;Z[BI)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 24
  .line 80
    move-object v9, p0
    move-object/from16 v10, p7
    move/from16 v11, p8
    const/4 v12, 4
    if-le v11, v12, :L0
    return-void
  :L0
    move-wide/from16 v1, p1
  :L1
  .line 81
    const-wide/16 v3, 8
    add-long/2addr v3, v1
    cmp-long v0, v3, p3
    if-gtz v0, :L10
  .line 82
    move-object v0, p0
    move-wide/from16 v3, p3
    move-object/from16 v5, p7
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Mp4;->box(Ljava/io/RandomAccessFile;JJ[B)Lcom/innioasis/ipp/Mp4$Box;
    move-result-object v13
  .line 83
    if-nez v13, :L2
    return-void
  :L2
  .line 84
    iget-object v0, v13, Lcom/innioasis/ipp/Mp4$Box;->type:Ljava/lang/String;
    const-string v1, "mvhd"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    if-nez v11, :L3
  .line 85
    iget-wide v0, v13, Lcom/innioasis/ipp/Mp4$Box;->body:J
    invoke-static { p0, v0, v1, v10 }, Lcom/innioasis/ipp/Mp4;->created(Ljava/io/RandomAccessFile;J[B)Ljava/lang/String;
    move-result-object v0
    move-object/from16 v14, p5
    iput-object v0, v14, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
    goto/16 :L9
  :L3
  .line 84
    move-object/from16 v14, p5
  .line 86
    iget-object v0, v13, Lcom/innioasis/ipp/Mp4$Box;->type:Ljava/lang/String;
    const-string v1, "udta"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L4
  .line 87
    iget-wide v1, v13, Lcom/innioasis/ipp/Mp4$Box;->body:J
    iget-wide v3, v13, Lcom/innioasis/ipp/Mp4$Box;->end:J
    add-int/lit8 v8, v11, 1
    move-object v0, p0
    move-object/from16 v5, p5
    move/from16 v6, p6
    move-object/from16 v7, p7
    invoke-static/range { v0 .. v8 }, Lcom/innioasis/ipp/Mp4;->walk(Ljava/io/RandomAccessFile;JJLcom/innioasis/ipp/Meta$Info;Z[BI)V
    goto :L9
  :L4
  .line 88
    iget-object v0, v13, Lcom/innioasis/ipp/Mp4$Box;->type:Ljava/lang/String;
    const-string v1, "meta"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L7
  .line 90
    iget-wide v0, v13, Lcom/innioasis/ipp/Mp4$Box;->body:J
  .line 91
    const-wide/16 v2, 4
    add-long/2addr v2, v0
    invoke-virtual { p0, v2, v3 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 92
    const/4 v4, 0
    invoke-virtual { p0, v10, v4, v12 }, Ljava/io/RandomAccessFile;->readFully([BII)V
  .line 93
    new-instance v5, Ljava/lang/String;
    const-string v6, "ISO-8859-1"
    invoke-direct { v5, v10, v4, v12, v6 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    const-string v4, "hdlr"
    invoke-virtual { v5, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L5
    move-wide v1, v2
    goto :L6
  :L5
    move-wide v1, v0
  :L6
  .line 94
    iget-wide v3, v13, Lcom/innioasis/ipp/Mp4$Box;->end:J
    add-int/lit8 v8, v11, 1
    move-object v0, p0
    move-object/from16 v5, p5
    move/from16 v6, p6
    move-object/from16 v7, p7
    invoke-static/range { v0 .. v8 }, Lcom/innioasis/ipp/Mp4;->walk(Ljava/io/RandomAccessFile;JJLcom/innioasis/ipp/Meta$Info;Z[BI)V
    goto :L8
  :L7
  .line 95
    iget-object v0, v13, Lcom/innioasis/ipp/Mp4$Box;->type:Ljava/lang/String;
    const-string v1, "ilst"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L8
  .line 96
    iget-wide v1, v13, Lcom/innioasis/ipp/Mp4$Box;->body:J
    iget-wide v3, v13, Lcom/innioasis/ipp/Mp4$Box;->end:J
    move-object v0, p0
    move-object/from16 v5, p5
    move/from16 v6, p6
    move-object/from16 v7, p7
    invoke-static/range { v0 .. v7 }, Lcom/innioasis/ipp/Mp4;->items(Ljava/io/RandomAccessFile;JJLcom/innioasis/ipp/Meta$Info;Z[B)V
    goto :L9
  :L8
  .line 95
    nop
  :L9
  .line 98
    iget-wide v1, v13, Lcom/innioasis/ipp/Mp4$Box;->end:J
  .line 99
    goto/16 :L1
  :L10
  .line 100
    return-void
.end method

.method private static wanted(Ljava/lang/String;)Z
  .registers 2
  .line 144
    const-string v0, "\u00a9nam"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "\u00a9ART"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "aART"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "\u00a9alb"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 145
    const-string v0, "\u00a9gen"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "gnre"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "trkn"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "disk"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 146
    const-string v0, "\u00a9day"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
  .line 144
    return p0
.end method

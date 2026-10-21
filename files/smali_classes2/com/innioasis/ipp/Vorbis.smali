.class final Lcom/innioasis/ipp/Vorbis;
.super Ljava/lang/Object;
.source "Vorbis.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Vorbis$Pic;
  }
.end annotation

.field private final static MAX_ART:I = 8388608

.field private final static MAX_BLOCK:I = 12582912

.method private constructor <init>()V
  .registers 1
  .line 15
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static be32([BI)I
  .registers 4
  .line 244
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

.method private static close(Ljava/io/RandomAccessFile;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 249
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Ljava/io/RandomAccessFile;->close()V
  :L1
    goto :L3
  :L2
  .line 250
    move-exception p0
    goto :L4
  :L3
  .line 251
    nop
  :L4
  .line 252
    return-void
.end method

.method private static codec([BI)I
  .registers 9
  .line 145
    const/4 v0, 7
    const/4 v1, 3
    const/4 v2, 2
    const/4 v3, 0
    const/4 v4, 1
    if-lt p1, v0, :L0
    aget-byte v0, p0, v3
    if-ne v0, v4, :L0
    aget-byte v0, p0, v4
    const/16 v5, 118
    if-ne v0, v5, :L0
    aget-byte v0, p0, v2
    const/16 v5, 111
    if-ne v0, v5, :L0
    aget-byte v0, p0, v1
    const/16 v5, 114
    if-ne v0, v5, :L0
    return v4
  :L0
  .line 146
    const/16 v0, 8
    const/4 v5, 4
    if-lt p1, v0, :L1
    aget-byte v0, p0, v3
    const/16 v6, 79
    if-ne v0, v6, :L1
    aget-byte v0, p0, v4
    const/16 v6, 112
    if-ne v0, v6, :L1
    aget-byte v0, p0, v2
    const/16 v6, 117
    if-ne v0, v6, :L1
    aget-byte v0, p0, v1
    const/16 v6, 115
    if-ne v0, v6, :L1
    aget-byte v0, p0, v5
    const/16 v6, 72
    if-ne v0, v6, :L1
    return v2
  :L1
  .line 147
    const/4 v0, 5
    if-lt p1, v0, :L2
    aget-byte p1, p0, v3
    and-int/lit16 p1, p1, 255
    const/16 v0, 127
    if-ne p1, v0, :L2
    aget-byte p1, p0, v4
    const/16 v0, 70
    if-ne p1, v0, :L2
    aget-byte p1, p0, v2
    const/16 v0, 76
    if-ne p1, v0, :L2
    aget-byte p1, p0, v1
    const/16 v0, 65
    if-ne p1, v0, :L2
    aget-byte p0, p0, v5
    const/16 p1, 67
    if-ne p0, p1, :L2
    return v1
  :L2
  .line 148
    return v3
.end method

.method private static comment([BIILcom/innioasis/ipp/Meta$Info;Lcom/innioasis/ipp/Vorbis$Pic;Z)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L8 .. :L9 } :L10
  .registers 14
  .line 160
    add-int/lit8 v0, p1, 4
    if-le v0, p2, :L0
    return-void
  :L0
  .line 161
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result p1
  .line 162
    nop
  .line 163
    if-ltz p1, :L16
    add-int/2addr v0, p1
    add-int/lit8 p1, v0, 4
    if-le p1, p2, :L1
    goto/16 :L16
  :L1
  .line 164
    nop
  .line 165
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result v0
  .line 166
    nop
  .line 167
    const/4 v1, 0
    const/4 v2, 0
  :L2
    if-ge v2, v0, :L15
    add-int/lit8 v3, p1, 4
    if-gt v3, p2, :L15
  .line 168
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result p1
  .line 169
    nop
  .line 170
    if-ltz p1, :L14
    add-int/2addr p1, v3
    if-le p1, p2, :L3
    goto :L14
  :L3
  .line 171
    nop
  .line 172
    move v4, v3
  :L4
    if-ge v4, p1, :L6
    add-int/lit8 v5, v3, 64
    if-ge v4, v5, :L6
  .line 173
    aget-byte v5, p0, v4
    const/16 v6, 61
    if-ne v5, v6, :L5
    goto :L7
  :L5
  .line 172
    add-int/lit8 v4, v4, 1
    goto :L4
  :L6
  .line 175
    const/4 v4, -1
  :L7
    if-le v4, v3, :L13
  .line 176
    new-instance v5, Ljava/lang/String;
    sub-int v6, v4, v3
    const-string v7, "ISO-8859-1"
    invoke-direct { v5, p0, v3, v6, v7 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v5, v3 }, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v3
  .line 177
    add-int/lit8 v4, v4, 1
  .line 178
    sub-int v5, p1, v4
  .line 179
    const-string v6, "METADATA_BLOCK_PICTURE"
    invoke-virtual { v3, v6 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :L12
  .line 180
    if-eqz p5, :L13
    if-lez v5, :L13
  :L8
  .line 182
    invoke-static { p0, v4, v5, v1 }, Landroid/util/Base64;->decode([BIII)[B
    move-result-object v3
  .line 183
    array-length v4, v3
    invoke-static { v3, v1, v4, p4 }, Lcom/innioasis/ipp/Vorbis;->picture([BIILcom/innioasis/ipp/Vorbis$Pic;)V
  :L9
    goto :L11
  :L10
  .line 184
    move-exception v3
  :L11
  .line 185
    goto :L13
  :L12
  .line 187
    if-lez v5, :L13
    const/high16 v6, 0x00010000
    if-gt v5, v6, :L13
  .line 188
    invoke-static { p0, v4, v5 }, Lcom/innioasis/ipp/Vorbis;->utf8([BII)Ljava/lang/String;
    move-result-object v4
    invoke-static { p3, v3, v4 }, Lcom/innioasis/ipp/Vorbis;->put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  :L13
  .line 191
    nop
  .line 167
    add-int/lit8 v2, v2, 1
    goto :L2
  :L14
  .line 170
    return-void
  :L15
  .line 193
    return-void
  :L16
  .line 163
    return-void
.end method

.method static flac(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .catchall { :L0 .. :L1 } :L26
  .catchall { :L2 .. :L3 } :L25
  .catchall { :L4 .. :L6 } :L25
  .catchall { :L8 .. :L23 } :L25
  .registers 24
  .line 22
    nop
  .line 24
    const/4 v1, 0
    const/4 v2, 0
  :L0
    new-instance v3, Ljava/io/RandomAccessFile;
    const-string v0, "r"
    move-object/from16 v4, p0
    invoke-direct { v3, v4, v0 }, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  :L1
  .line 25
    const/16 v0, 10
  :L2
    new-array v4, v0, [B
  .line 26
    nop
  .line 27
    invoke-virtual { v3, v4 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v5
  :L3
    if-eq v5, v0, :L4
  .line 62
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 27
    return v1
  :L4
  .line 28
    aget-byte v5, v4, v1
    const/16 v6, 73
    const/16 v7, 8
    const/4 v8, 6
    const/4 v9, 2
    const/4 v10, 1
    const/4 v11, 4
    const/16 v12, 127
    if-ne v5, v6, :L7
    aget-byte v5, v4, v10
    const/16 v6, 68
    if-ne v5, v6, :L7
    aget-byte v5, v4, v9
    const/16 v6, 51
    if-ne v5, v6, :L7
  .line 30
    aget-byte v5, v4, v8
    and-int/2addr v5, v12
    shl-int/lit8 v5, v5, 21
    const/4 v6, 7
    aget-byte v13, v4, v6
    and-int/2addr v13, v12
    shl-int/lit8 v13, v13, 14
    or-int/2addr v5, v13
    aget-byte v13, v4, v7
    and-int/2addr v13, v12
    shl-int/lit8 v6, v13, 7
    or-int/2addr v5, v6
    const/16 v6, 9
    aget-byte v6, v4, v6
    and-int/2addr v6, v12
    or-int/2addr v5, v6
    add-int/2addr v5, v0
    int-to-long v5, v5
  .line 31
    const/4 v0, 5
    aget-byte v0, v4, v0
    and-int/lit8 v0, v0, 16
    if-eqz v0, :L5
    const-wide/16 v13, 10
    add-long/2addr v5, v13
  :L5
  .line 32
    invoke-virtual { v3, v5, v6 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 33
    invoke-virtual { v3, v4, v1, v11 }, Ljava/io/RandomAccessFile;->read([BII)I
    move-result v0
  :L6
    if-eq v0, v11, :L8
  .line 62
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 33
    return v1
  :L7
  .line 35
    const-wide/16 v5, 0
  :L8
    aget-byte v0, v4, v1
    const/16 v13, 102
    if-ne v0, v13, :L24
    aget-byte v0, v4, v10
    const/16 v13, 76
    if-ne v0, v13, :L24
    aget-byte v0, v4, v9
    const/16 v13, 97
    if-ne v0, v13, :L24
    const/4 v0, 3
    aget-byte v4, v4, v0
    const/16 v13, 67
    if-eq v4, v13, :L9
    goto/16 :L24
  :L9
  .line 36
    const-wide/16 v13, 4
    add-long/2addr v5, v13
  .line 37
    new-instance v4, Lcom/innioasis/ipp/Vorbis$Pic;
    invoke-direct { v4, v2 }, Lcom/innioasis/ipp/Vorbis$Pic;-><init>(Lcom/innioasis/ipp/Vorbis$1;)V
  .line 38
    new-array v2, v11, [B
  :L10
  .line 40
    invoke-virtual { v3, v5, v6 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 41
    invoke-virtual { v3, v2 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v15
    if-eq v15, v11, :L11
    goto/16 :L22
  :L11
  .line 42
    aget-byte v15, v2, v1
    and-int/lit16 v12, v15, 128
    if-eqz v12, :L12
    const/4 v12, 1
    goto :L13
  :L12
    const/4 v12, 0
  :L13
  .line 43
    and-int/lit8 v15, v15, 127
  .line 44
    aget-byte v1, v2, v10
    and-int/lit16 v1, v1, 255
    shl-int/lit8 v1, v1, 16
    aget-byte v10, v2, v9
    and-int/lit16 v10, v10, 255
    shl-int/2addr v10, v7
    or-int/2addr v1, v10
    aget-byte v10, v2, v0
    and-int/lit16 v10, v10, 255
    or-int/2addr v1, v10
  .line 45
    add-long/2addr v5, v13
  .line 46
    int-to-long v9, v1
    add-long/2addr v9, v5
  .line 47
    if-eq v15, v11, :L15
    if-ne v15, v8, :L14
    if-eqz p2, :L14
    goto :L15
  :L14
    move v5, v15
    goto :L19
  :L15
  .line 48
    const/high16 v0, 0x00C00000
    if-le v1, v0, :L17
    if-eqz v12, :L16
    goto :L22
  :L16
    const/16 v0, 127
    goto :L21
  :L17
  .line 49
    new-array v0, v1, [B
  .line 50
    invoke-virtual { v3, v5, v6 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 51
    invoke-virtual { v3, v0 }, Ljava/io/RandomAccessFile;->readFully([B)V
  .line 52
    if-ne v15, v11, :L18
    const/16 v16, 0
    move v5, v15
    move-object v15, v0
    move/from16 v17, v1
    move-object/from16 v18, p1
    move-object/from16 v19, v4
    move/from16 v20, p2
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/Vorbis;->comment([BIILcom/innioasis/ipp/Meta$Info;Lcom/innioasis/ipp/Vorbis$Pic;Z)V
    goto :L19
  :L18
  .line 53
    move v5, v15
    const/4 v6, 0
    invoke-static { v0, v6, v1, v4 }, Lcom/innioasis/ipp/Vorbis;->picture([BIILcom/innioasis/ipp/Vorbis$Pic;)V
  :L19
  .line 55
    if-nez v12, :L22
    const/16 v0, 127
    if-ne v5, v0, :L20
    goto :L22
  :L20
  .line 56
    nop
  :L21
  .line 40
    move-wide v5, v9
    const/4 v0, 3
    const/4 v1, 0
    const/4 v9, 2
    const/4 v10, 1
    const/16 v12, 127
    goto :L10
  :L22
  .line 57
    iget-object v0, v4, Lcom/innioasis/ipp/Vorbis$Pic;->data:[B
    if-eqz v0, :L23
    iget-object v0, v4, Lcom/innioasis/ipp/Vorbis$Pic;->data:[B
    move-object/from16 v1, p1
    iput-object v0, v1, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L23
  .line 58
    nop
  .line 62
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 58
    const/4 v0, 1
    return v0
  :L24
  .line 62
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 35
    const/4 v1, 0
    return v1
  :L25
  .line 59
    move-exception v0
    move-object v2, v3
    goto :L27
  :L26
    move-exception v0
  :L27
  .line 60
    nop
  .line 62
    invoke-static { v2 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 60
    const/4 v1, 0
    return v1
.end method

.method private static le32([BI)I
  .registers 4
  .line 240
    aget-byte v0, p0, p1
    and-int/lit16 v0, v0, 255
    add-int/lit8 v1, p1, 1
    aget-byte v1, p0, v1
    and-int/lit16 v1, v1, 255
    shl-int/lit8 v1, v1, 8
    or-int/2addr v0, v1
    add-int/lit8 v1, p1, 2
    aget-byte v1, p0, v1
    and-int/lit16 v1, v1, 255
    shl-int/lit8 v1, v1, 16
    or-int/2addr v0, v1
    add-int/lit8 p1, p1, 3
    aget-byte p0, p0, p1
    and-int/lit16 p0, p0, 255
    shl-int/lit8 p0, p0, 24
    or-int/2addr p0, v0
    return p0
.end method

.method static ogg(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .catchall { :L0 .. :L1 } :L52
  .catchall { :L1 .. :L3 } :L51
  .catchall { :L4 .. :L7 } :L51
  .catchall { :L10 .. :L16 } :L51
  .catchall { :L17 .. :L22 } :L51
  .catchall { :L24 .. :L28 } :L51
  .catchall { :L33 .. :L34 } :L51
  .catchall { :L39 .. :L40 } :L51
  .catchall { :L43 .. :L44 } :L51
  .registers 36
  .line 71
    nop
  .line 73
    const/4 v1, 0
  :L0
    new-instance v3, Ljava/io/RandomAccessFile;
    const-string v0, "r"
    move-object/from16 v4, p0
    invoke-direct { v3, v4, v0 }, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  :L1
  .line 74
    invoke-virtual { v3 }, Ljava/io/RandomAccessFile;->length()J
    move-result-wide v4
  .line 75
    const/16 v0, 27
    new-array v6, v0, [B
  .line 76
    const/16 v7, 255
    new-array v8, v7, [B
  .line 77
    nop
  .line 78
    nop
  .line 79
    nop
  .line 80
    nop
  .line 81
    const/16 v9, 16
    new-array v9, v9, [B
  .line 82
    nop
  .line 83
    nop
  .line 84
    nop
  .line 85
    const/4 v10, 1
    const-wide/16 v11, 0
    const/4 v13, 1
    const/4 v14, 0
    const/4 v15, 0
    const/16 v16, 0
    const/16 v17, 0
    const/16 v18, 0
    const/16 v19, 0
  :L2
  .line 86
    const-wide/16 v20, 27
    add-long v20, v11, v20
    cmp-long v22, v20, v4
    if-gtz v22, :L50
  .line 87
    invoke-virtual { v3, v11, v12 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 88
    invoke-virtual { v3, v6 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v11
  :L3
    if-eq v11, v0, :L4
  .line 140
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 88
    return v1
  :L4
  .line 89
    aget-byte v11, v6, v1
    const/16 v12, 79
    if-ne v11, v12, :L49
    aget-byte v11, v6, v10
    const/16 v0, 103
    if-ne v11, v0, :L49
    const/4 v11, 2
    aget-byte v12, v6, v11
    if-ne v12, v0, :L49
    const/4 v0, 3
    aget-byte v12, v6, v0
    const/16 v0, 83
    if-eq v12, v0, :L5
    goto/16 :L49
  :L5
  .line 90
    const/16 v0, 14
    invoke-static { v6, v0 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result v0
  .line 91
    if-eqz v13, :L6
    move v14, v0
    const/4 v13, 0
  :L6
  .line 92
    const/16 v12, 26
    aget-byte v12, v6, v12
    and-int/2addr v12, v7
  .line 93
    invoke-virtual { v3, v8, v1, v12 }, Ljava/io/RandomAccessFile;->read([BII)I
    move-result v2
  :L7
    if-eq v2, v12, :L8
  .line 140
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 93
    return v1
  :L8
  .line 94
    nop
  .line 95
    const/4 v2, 0
    const/4 v11, 0
  :L9
    if-ge v2, v12, :L11
  :L10
    aget-byte v1, v8, v2
    and-int/2addr v1, v7
    add-int/2addr v11, v1
    add-int/lit8 v2, v2, 1
    const/4 v1, 0
    goto :L9
  :L11
  .line 96
    int-to-long v1, v12
    add-long v20, v20, v1
  .line 97
    int-to-long v1, v11
    add-long v1, v20, v1
  .line 98
    if-eq v0, v14, :L12
    move-wide v11, v1
    const/16 v0, 27
    const/4 v1, 0
    goto :L2
  :L12
  .line 99
    new-array v0, v11, [B
  .line 100
    invoke-virtual { v3, v0 }, Ljava/io/RandomAccessFile;->readFully([B)V
  .line 101
    nop
  .line 102
    move-wide/from16 v20, v1
    move/from16 v11, v16
    move/from16 v10, v17
    move/from16 v24, v18
    const/4 v1, 0
    const/4 v7, 0
  :L13
    if-ge v7, v12, :L48
  .line 103
    aget-byte v2, v8, v7
    move-wide/from16 v25, v4
    const/16 v4, 255
    and-int/2addr v2, v4
  .line 104
    if-nez v11, :L15
  .line 105
    rsub-int/lit8 v4, v10, 16
    invoke-static { v2, v4 }, Ljava/lang/Math;->min(II)I
    move-result v4
  .line 106
    if-lez v4, :L14
    invoke-static { v0, v1, v9, v10, v4 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    add-int/2addr v10, v4
  :L14
  .line 107
    move-object/from16 v18, v6
    move-object/from16 v27, v15
    move/from16 v4, v24
    goto :L21
  :L15
    const/4 v4, 1
    if-ne v11, v4, :L20
  .line 108
    if-nez v15, :L16
    const/16 v4, 4096
    invoke-static { v4, v2 }, Ljava/lang/Math;->max(II)I
    move-result v4
    new-array v15, v4, [B
  :L16
  .line 109
    move/from16 v4, v24
    add-int v5, v4, v2
    move-object/from16 v18, v6
    const/high16 v6, 0x00C00000
    if-le v5, v6, :L17
  .line 140
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 109
    const/4 v1, 0
    return v1
  :L17
  .line 110
    array-length v6, v15
    if-le v5, v6, :L18
  .line 111
    array-length v6, v15
    const/16 v23, 2
    mul-int/lit8 v6, v6, 2
    invoke-static { v5, v6 }, Ljava/lang/Math;->max(II)I
    move-result v6
    new-array v6, v6, [B
  .line 112
    move/from16 v24, v5
    const/4 v5, 0
    invoke-static { v15, v5, v6, v5, v4 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 113
    move-object v15, v6
    goto :L19
  :L18
  .line 110
    move/from16 v24, v5
  :L19
  .line 115
    invoke-static { v0, v1, v15, v4, v2 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 116
    move-object/from16 v27, v15
    move/from16 v4, v24
    goto :L21
  :L20
  .line 107
    move-object/from16 v18, v6
    move/from16 v4, v24
    move-object/from16 v27, v15
  :L21
  .line 118
    add-int/2addr v1, v2
  .line 119
    const/16 v5, 255
    if-ge v2, v5, :L46
  .line 120
    if-nez v11, :L22
    invoke-static { v9, v10 }, Lcom/innioasis/ipp/Vorbis;->codec([BI)I
    move-result v19
  :L22
    move/from16 v2, v19
  .line 121
    if-nez v11, :L23
    if-nez v2, :L23
  .line 140
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 121
    const/4 v1, 0
    return v1
  :L23
  .line 122
    add-int/lit8 v11, v11, 1
  .line 123
    const/4 v6, 2
    if-ne v11, v6, :L45
  :L24
  .line 124
    new-instance v0, Lcom/innioasis/ipp/Vorbis$Pic;
    const/4 v6, 0
    invoke-direct { v0, v6 }, Lcom/innioasis/ipp/Vorbis$Pic;-><init>(Lcom/innioasis/ipp/Vorbis$1;)V
  .line 125
    const/16 v1, 8
    const/4 v5, 7
    const/4 v6, 4
    const/4 v7, 1
    if-ne v2, v7, :L25
    const/16 v28, 7
    goto :L27
  :L25
    const/4 v8, 2
    if-ne v2, v8, :L26
    const/16 v28, 8
    goto :L27
  :L26
    const/16 v28, 4
  :L27
  .line 126
    if-ne v2, v7, :L31
    if-le v4, v5, :L30
    const/4 v5, 0
    aget-byte v7, v27, v5
  :L28
    const/4 v5, 3
    if-eq v7, v5, :L29
    goto :L30
  :L29
    const/4 v5, 0
    goto :L32
  :L30
  .line 140
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 126
    const/4 v5, 0
    return v5
  :L31
    const/4 v5, 0
  :L32
  .line 127
    const/4 v15, 2
    if-ne v2, v15, :L37
    if-le v4, v1, :L36
  :L33
    aget-byte v1, v27, v5
    const/16 v5, 79
    if-ne v1, v5, :L36
    aget-byte v1, v27, v6
  :L34
    const/16 v5, 84
    if-eq v1, v5, :L35
    goto :L36
  :L35
    const/4 v1, 0
    goto :L38
  :L36
  .line 140
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 127
    const/4 v1, 0
    return v1
  :L37
    const/4 v1, 0
  :L38
  .line 128
    const/4 v5, 3
    if-ne v2, v5, :L42
    if-le v4, v6, :L41
  :L39
    aget-byte v2, v27, v1
  :L40
    and-int/lit8 v1, v2, 127
    if-eq v1, v6, :L42
  :L41
  .line 140
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 128
    const/4 v0, 1
    return v0
  :L42
  .line 129
    move/from16 v29, v4
    move-object/from16 v30, p1
    move-object/from16 v31, v0
    move/from16 v32, p2
  :L43
    invoke-static/range { v27 .. v32 }, Lcom/innioasis/ipp/Vorbis;->comment([BIILcom/innioasis/ipp/Meta$Info;Lcom/innioasis/ipp/Vorbis$Pic;Z)V
  .line 130
    iget-object v1, v0, Lcom/innioasis/ipp/Vorbis$Pic;->data:[B
    if-eqz v1, :L44
    iget-object v0, v0, Lcom/innioasis/ipp/Vorbis$Pic;->data:[B
    move-object/from16 v1, p1
    iput-object v0, v1, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L44
  .line 131
    nop
  .line 140
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 131
    const/16 v16, 1
    return v16
  :L45
  .line 123
    const/4 v6, 0
    const/4 v15, 2
    const/16 v16, 1
    const/16 v17, 79
    const/16 v22, 3
    move/from16 v19, v2
    goto :L47
  :L46
  .line 119
    const/4 v6, 0
    const/4 v15, 2
    const/16 v16, 1
    const/16 v17, 79
    const/16 v22, 3
  :L47
  .line 102
    add-int/lit8 v7, v7, 1
    move/from16 v24, v4
    move-object/from16 v6, v18
    move-wide/from16 v4, v25
    move-object/from16 v15, v27
    goto/16 :L13
  :L48
  .line 135
    move-wide/from16 v25, v4
    move-object/from16 v18, v6
    move/from16 v4, v24
    const/16 v5, 255
    const/4 v6, 0
    const/16 v16, 1
    move/from16 v17, v10
    move/from16 v16, v11
    move-object/from16 v6, v18
    move-wide/from16 v11, v20
    const/16 v0, 27
    const/4 v1, 0
    const/16 v7, 255
    const/4 v10, 1
    move/from16 v18, v4
    move-wide/from16 v4, v25
    goto/16 :L2
  :L49
  .line 140
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 89
    const/4 v1, 0
    return v1
  :L50
  .line 136
    nop
  .line 140
    invoke-static { v3 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 136
    return v1
  :L51
  .line 137
    move-exception v0
    move-object v2, v3
    goto :L53
  :L52
    move-exception v0
    const/4 v6, 0
    move-object v2, v6
  :L53
  .line 138
    nop
  .line 140
    invoke-static { v2 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 138
    const/4 v1, 0
    return v1
.end method

.method private static picture([BIILcom/innioasis/ipp/Vorbis$Pic;)V
  .registers 7
  .line 209
    add-int/lit8 v0, p1, 8
    if-le v0, p2, :L0
    return-void
  :L0
  .line 210
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->be32([BI)I
    move-result v0
  .line 211
    add-int/lit8 p1, p1, 4
  .line 212
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->be32([BI)I
    move-result v1
  .line 213
    add-int/lit8 p1, p1, 4
  .line 214
    if-ltz v1, :L10
    add-int/2addr p1, v1
    add-int/lit8 v1, p1, 4
    if-le v1, p2, :L1
    goto :L10
  :L1
  .line 215
    nop
  .line 216
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->be32([BI)I
    move-result p1
  .line 217
    nop
  .line 218
    if-ltz p1, :L9
    add-int v2, v1, p1
    add-int/lit8 v2, v2, 20
    if-le v2, p2, :L2
    goto :L9
  :L2
  .line 219
    add-int/lit8 p1, p1, 16
    add-int/2addr v1, p1
  .line 220
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Vorbis;->be32([BI)I
    move-result p1
  .line 221
    add-int/lit8 v1, v1, 4
  .line 222
    if-lez p1, :L8
    const/high16 v2, 0x00800000
    if-gt p1, v2, :L8
    add-int v2, v1, p1
    if-le v2, p2, :L3
    goto :L8
  :L3
  .line 223
    const/4 p2, 3
    const/4 v2, 0
    if-ne v0, p2, :L4
    const/4 p2, 1
    goto :L5
  :L4
    const/4 p2, 0
  :L5
  .line 224
    iget-object v0, p3, Lcom/innioasis/ipp/Vorbis$Pic;->data:[B
    if-eqz v0, :L7
    iget-boolean v0, p3, Lcom/innioasis/ipp/Vorbis$Pic;->front:Z
    if-nez v0, :L6
    if-nez p2, :L7
  :L6
    return-void
  :L7
  .line 225
    new-array v0, p1, [B
  .line 226
    invoke-static { p0, v1, v0, v2, p1 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 227
    iput-object v0, p3, Lcom/innioasis/ipp/Vorbis$Pic;->data:[B
  .line 228
    iput-boolean p2, p3, Lcom/innioasis/ipp/Vorbis$Pic;->front:Z
  .line 229
    return-void
  :L8
  .line 222
    return-void
  :L9
  .line 218
    return-void
  :L10
  .line 214
    return-void
.end method

.method private static put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 196
    if-nez p2, :L0
    return-void
  :L0
  .line 197
    const-string v0, "TITLE"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    goto :L9
  :L1
  .line 198
    const-string v0, "ARTIST"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    goto :L9
  :L2
  .line 199
    const-string v0, "ALBUMARTIST"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L8
    const-string v0, "ALBUM ARTIST"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    goto :L8
  :L3
  .line 200
    const-string v0, "ALBUM"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L4
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    goto :L9
  :L4
  .line 201
    const-string v0, "GENRE"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L5
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    goto :L9
  :L5
  .line 202
    const-string v0, "TRACKNUMBER"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L6
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    goto :L9
  :L6
  .line 203
    const-string v0, "DISCNUMBER"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L7
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
    goto :L9
  :L7
  .line 204
    const-string v0, "DATE"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L9
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
    goto :L9
  :L8
  .line 199
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  :L9
  .line 205
    return-void
.end method

.method private static utf8([BII)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 233
    new-instance v0, Ljava/lang/String;
    const-string v1, "UTF-8"
    invoke-direct { v0, p0, p1, p2, v1 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
  :L1
    return-object v0
  :L2
  .line 234
    move-exception p0
  .line 235
    const/4 p0, 0
    return-object p0
.end method

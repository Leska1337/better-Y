.class final Lcom/innioasis/ipp/Vorbis;
.super Ljava/lang/Object;
.source "Vorbis.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Vorbis$Pic;,
    Lcom/innioasis/ipp/Vorbis$Ogg;
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

.method static synthetic access$100([BI)I
  .registers 2
  .line 13
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result p0
    return p0
.end method

.method private static be32([BI)I
  .registers 4
  .line 378
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
  .line 383
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Ljava/io/RandomAccessFile;->close()V
  :L1
    goto :L3
  :L2
  .line 384
    move-exception p0
    goto :L4
  :L3
  .line 385
    nop
  :L4
  .line 386
    return-void
.end method

.method private static codec([BI)I
  .registers 9
  .line 275
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
  .line 276
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
  .line 277
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
  .line 278
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
  .line 290
    add-int/lit8 v0, p1, 4
    if-le v0, p2, :L0
    return-void
  :L0
  .line 291
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result p1
  .line 292
    nop
  .line 293
    if-ltz p1, :L16
    add-int/2addr v0, p1
    add-int/lit8 p1, v0, 4
    if-le p1, p2, :L1
    goto/16 :L16
  :L1
  .line 294
    nop
  .line 295
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result v0
  .line 296
    nop
  .line 297
    const/4 v1, 0
    const/4 v2, 0
  :L2
    if-ge v2, v0, :L15
    add-int/lit8 v3, p1, 4
    if-gt v3, p2, :L15
  .line 298
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result p1
  .line 299
    nop
  .line 300
    if-ltz p1, :L14
    add-int/2addr p1, v3
    if-le p1, p2, :L3
    goto :L14
  :L3
  .line 301
    nop
  .line 302
    move v4, v3
  :L4
    if-ge v4, p1, :L6
    add-int/lit8 v5, v3, 64
    if-ge v4, v5, :L6
  .line 303
    aget-byte v5, p0, v4
    const/16 v6, 61
    if-ne v5, v6, :L5
    goto :L7
  :L5
  .line 302
    add-int/lit8 v4, v4, 1
    goto :L4
  :L6
  .line 305
    const/4 v4, -1
  :L7
    if-le v4, v3, :L13
  .line 306
    new-instance v5, Ljava/lang/String;
    sub-int v6, v4, v3
    const-string v7, "ISO-8859-1"
    invoke-direct { v5, p0, v3, v6, v7 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v5, v3 }, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v3
  .line 307
    add-int/lit8 v4, v4, 1
  .line 308
    sub-int v5, p1, v4
  .line 309
    const-string v6, "METADATA_BLOCK_PICTURE"
    invoke-virtual { v3, v6 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :L12
  .line 310
    if-eqz p5, :L13
    if-lez v5, :L13
  :L8
  .line 312
    invoke-static { p0, v4, v5, v1 }, Landroid/util/Base64;->decode([BIII)[B
    move-result-object v3
  .line 313
    array-length v4, v3
    invoke-static { v3, v1, v4, p4 }, Lcom/innioasis/ipp/Vorbis;->picture([BIILcom/innioasis/ipp/Vorbis$Pic;)V
  :L9
    goto :L11
  :L10
  .line 314
    move-exception v3
  :L11
  .line 315
    goto :L13
  :L12
  .line 317
    if-lez v5, :L13
    const/high16 v6, 0x00010000
    if-gt v5, v6, :L13
  .line 318
    invoke-static { p0, v4, v5 }, Lcom/innioasis/ipp/Vorbis;->utf8([BII)Ljava/lang/String;
    move-result-object v4
    invoke-static { p3, v3, v4 }, Lcom/innioasis/ipp/Vorbis;->put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  :L13
  .line 321
    nop
  .line 297
    add-int/lit8 v2, v2, 1
    goto :L2
  :L14
  .line 300
    return-void
  :L15
  .line 323
    return-void
  :L16
  .line 293
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
  .line 374
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
  .catchall { :L0 .. :L1 } :L56
  .catchall { :L1 .. :L2 } :L55
  .catchall { :L3 .. :L7 } :L55
  .catchall { :L9 .. :L10 } :L55
  .catchall { :L13 .. :L14 } :L55
  .catchall { :L17 .. :L18 } :L55
  .catchall { :L20 .. :L21 } :L55
  .catchall { :L22 .. :L24 } :L55
  .catchall { :L25 .. :L40 } :L55
  .catchall { :L42 .. :L43 } :L44
  .catchall { :L47 .. :L50 } :L55
  .catchall { :L51 .. :L52 } :L55
  .catchall { :L53 .. :L54 } :L55
  .registers 19
  .line 72
    move-object/from16 v1, p1
    move/from16 v2, p2
  .line 74
    const/4 v3, 0
    const/4 v4, 0
  :L0
    new-instance v5, Ljava/io/RandomAccessFile;
    const-string v0, "r"
    move-object/from16 v6, p0
    invoke-direct { v5, v6, v0 }, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  :L1
  .line 75
    new-instance v6, Lcom/innioasis/ipp/Vorbis$Ogg;
    invoke-direct { v6, v5, v2 }, Lcom/innioasis/ipp/Vorbis$Ogg;-><init>(Ljava/io/RandomAccessFile;Z)V
  .line 76
    const/16 v0, 16
    new-array v7, v0, [B
  .line 77
    invoke-virtual { v6, v7, v3, v0 }, Lcom/innioasis/ipp/Vorbis$Ogg;->read([BII)I
    move-result v0
    invoke-static { v7, v0 }, Lcom/innioasis/ipp/Vorbis;->codec([BI)I
    move-result v0
  :L2
  .line 78
    if-nez v0, :L3
  .line 139
    invoke-static { v5 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 78
    return v3
  :L3
  .line 79
    invoke-virtual { v6 }, Lcom/innioasis/ipp/Vorbis$Ogg;->nextPacket()V
  .line 81
    const/16 v7, 8
    const/4 v8, 2
    const/4 v9, 4
    const/4 v10, 1
    if-ne v0, v10, :L4
    const/4 v11, 7
    goto :L6
  :L4
    if-ne v0, v8, :L5
    const/16 v11, 8
    goto :L6
  :L5
    const/4 v11, 4
  :L6
  .line 82
    new-array v7, v7, [B
  .line 83
    invoke-virtual { v6, v7, v3, v11 }, Lcom/innioasis/ipp/Vorbis$Ogg;->read([BII)I
    move-result v12
  .line 84
    iget-boolean v13, v6, Lcom/innioasis/ipp/Vorbis$Ogg;->eof:Z
  :L7
    if-eqz v13, :L8
  .line 139
    invoke-static { v5 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 84
    return v3
  :L8
  .line 85
    const/4 v13, 3
    if-ne v0, v10, :L12
    if-ne v12, v11, :L11
  :L9
    aget-byte v14, v7, v3
  :L10
    if-eq v14, v13, :L12
  :L11
  .line 139
    invoke-static { v5 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 85
    return v3
  :L12
  .line 86
    if-ne v0, v8, :L16
    if-ne v12, v11, :L15
  :L13
    aget-byte v8, v7, v3
    const/16 v14, 79
    if-ne v8, v14, :L15
    aget-byte v8, v7, v9
  :L14
    const/16 v14, 84
    if-eq v8, v14, :L16
  :L15
  .line 139
    invoke-static { v5 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 86
    return v3
  :L16
  .line 87
    if-ne v0, v13, :L20
    if-ne v12, v11, :L19
  :L17
    aget-byte v0, v7, v3
  :L18
    and-int/lit8 v0, v0, 127
    if-eq v0, v9, :L20
  :L19
  .line 139
    invoke-static { v5 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 87
    return v10
  :L20
  .line 89
    new-instance v7, Lcom/innioasis/ipp/Vorbis$Pic;
    invoke-direct { v7, v4 }, Lcom/innioasis/ipp/Vorbis$Pic;-><init>(Lcom/innioasis/ipp/Vorbis$1;)V
  .line 90
    new-array v4, v9, [B
  .line 91
    invoke-virtual { v6, v4, v3, v9 }, Lcom/innioasis/ipp/Vorbis$Ogg;->read([BII)I
    move-result v0
    if-eq v0, v9, :L22
    iget-boolean v0, v6, Lcom/innioasis/ipp/Vorbis$Ogg;->eof:Z
  :L21
  .line 139
    xor-int/2addr v0, v10
    invoke-static { v5 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 91
    return v0
  :L22
  .line 92
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result v0
  .line 93
    if-ltz v0, :L53
    int-to-long v11, v0
    invoke-virtual { v6, v11, v12 }, Lcom/innioasis/ipp/Vorbis$Ogg;->skip(J)Z
    move-result v0
    if-nez v0, :L23
    goto/16 :L53
  :L23
  .line 94
    invoke-virtual { v6, v4, v3, v9 }, Lcom/innioasis/ipp/Vorbis$Ogg;->read([BII)I
    move-result v0
    if-eq v0, v9, :L25
    iget-boolean v0, v6, Lcom/innioasis/ipp/Vorbis$Ogg;->eof:Z
  :L24
  .line 139
    xor-int/2addr v0, v10
    invoke-static { v5 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 94
    return v0
  :L25
  .line 95
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result v8
  .line 96
    const/16 v11, 64
    new-array v12, v11, [B
  .line 97
    const/4 v13, 0
  :L26
    if-ge v13, v8, :L49
  .line 98
    invoke-virtual { v6, v4, v3, v9 }, Lcom/innioasis/ipp/Vorbis$Ogg;->read([BII)I
    move-result v0
    if-eq v0, v9, :L27
    goto/16 :L49
  :L27
  .line 99
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Vorbis;->le32([BI)I
    move-result v0
  .line 100
    if-gez v0, :L28
    goto/16 :L49
  :L28
  .line 101
    invoke-static { v0, v11 }, Ljava/lang/Math;->min(II)I
    move-result v14
    invoke-virtual { v6, v12, v3, v14 }, Lcom/innioasis/ipp/Vorbis$Ogg;->read([BII)I
    move-result v14
  .line 102
    invoke-static { v0, v11 }, Ljava/lang/Math;->min(II)I
    move-result v15
    if-ge v14, v15, :L29
    goto/16 :L49
  :L29
  .line 103
    nop
  .line 104
    const/4 v15, 0
  :L30
    if-ge v15, v14, :L32
  .line 105
    aget-byte v9, v12, v15
    const/16 v11, 61
    if-ne v9, v11, :L31
    goto :L33
  :L31
  .line 104
    add-int/lit8 v15, v15, 1
    const/4 v9, 4
    const/16 v11, 64
    goto :L30
  :L32
    const/4 v15, -1
  :L33
  .line 107
    if-gtz v15, :L34
  .line 108
    sub-int/2addr v0, v14
    int-to-long v14, v0
    invoke-virtual { v6, v14, v15 }, Lcom/innioasis/ipp/Vorbis$Ogg;->skip(J)Z
    move-result v0
    if-nez v0, :L48
    goto/16 :L49
  :L34
  .line 111
    new-instance v9, Ljava/lang/String;
    const-string v11, "ISO-8859-1"
    invoke-direct { v9, v12, v3, v15, v11 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    sget-object v11, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v9, v11 }, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v9
  .line 112
    sub-int v11, v0, v15
    sub-int/2addr v11, v10
  .line 113
    const-string v3, "METADATA_BLOCK_PICTURE"
    invoke-virtual { v9, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
  .line 114
    if-eqz v3, :L35
    if-eqz v2, :L37
    if-lez v11, :L37
    const/high16 v10, 0x00C00000
    if-gt v11, v10, :L37
    goto :L36
  :L35
    if-lez v11, :L37
    const/high16 v10, 0x00010000
    if-gt v11, v10, :L37
  :L36
    const/4 v10, 1
    goto :L38
  :L37
    const/4 v10, 0
  :L38
  .line 115
    if-nez v10, :L39
  .line 116
    sub-int/2addr v0, v14
    int-to-long v9, v0
    invoke-virtual { v6, v9, v10 }, Lcom/innioasis/ipp/Vorbis$Ogg;->skip(J)Z
    move-result v0
    if-nez v0, :L48
    goto :L49
  :L39
  .line 119
    new-array v0, v11, [B
  .line 120
    sub-int/2addr v14, v15
    const/4 v10, 1
    sub-int/2addr v14, v10
  .line 121
    add-int/lit8 v15, v15, 1
    const/4 v10, 0
    invoke-static { v12, v15, v0, v10, v14 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 122
    sub-int v10, v11, v14
    invoke-virtual { v6, v0, v14, v10 }, Lcom/innioasis/ipp/Vorbis$Ogg;->read([BII)I
    move-result v14
  :L40
    if-eq v14, v10, :L41
    goto :L49
  :L41
  .line 123
    if-eqz v3, :L46
  .line 125
    const/4 v3, 0
  :L42
    invoke-static { v0, v3, v11, v3 }, Landroid/util/Base64;->decode([BIII)[B
    move-result-object v0
  .line 126
    array-length v9, v0
    invoke-static { v0, v3, v9, v7 }, Lcom/innioasis/ipp/Vorbis;->picture([BIILcom/innioasis/ipp/Vorbis$Pic;)V
  :L43
    goto :L45
  :L44
  .line 127
    move-exception v0
  :L45
  .line 128
    goto :L48
  :L46
  .line 130
    const/4 v3, 0
  :L47
    invoke-static { v0, v3, v11 }, Lcom/innioasis/ipp/Vorbis;->utf8([BII)Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v9, v0 }, Lcom/innioasis/ipp/Vorbis;->put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  :L48
  .line 97
    add-int/lit8 v13, v13, 1
    const/4 v3, 0
    const/4 v9, 4
    const/4 v10, 1
    const/16 v11, 64
    goto/16 :L26
  :L49
  .line 133
    iget-boolean v0, v6, Lcom/innioasis/ipp/Vorbis$Ogg;->eof:Z
  :L50
    if-eqz v0, :L51
  .line 139
    invoke-static { v5 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 133
    const/4 v1, 0
    return v1
  :L51
  .line 134
    iget-object v0, v7, Lcom/innioasis/ipp/Vorbis$Pic;->data:[B
    if-eqz v0, :L52
    iget-object v0, v7, Lcom/innioasis/ipp/Vorbis$Pic;->data:[B
    iput-object v0, v1, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L52
  .line 135
    nop
  .line 139
    invoke-static { v5 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 135
    const/4 v1, 1
    return v1
  :L53
  .line 93
    iget-boolean v0, v6, Lcom/innioasis/ipp/Vorbis$Ogg;->eof:Z
  :L54
    const/4 v1, 1
  .line 139
    xor-int/2addr v0, v1
    invoke-static { v5 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 93
    return v0
  :L55
  .line 136
    move-exception v0
    move-object v4, v5
    goto :L57
  :L56
    move-exception v0
  :L57
  .line 137
    nop
  .line 139
    invoke-static { v4 }, Lcom/innioasis/ipp/Vorbis;->close(Ljava/io/RandomAccessFile;)V
  .line 137
    const/4 v1, 0
    return v1
.end method

.method private static picture([BIILcom/innioasis/ipp/Vorbis$Pic;)V
  .registers 7
  .line 343
    add-int/lit8 v0, p1, 8
    if-le v0, p2, :L0
    return-void
  :L0
  .line 344
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->be32([BI)I
    move-result v0
  .line 345
    add-int/lit8 p1, p1, 4
  .line 346
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->be32([BI)I
    move-result v1
  .line 347
    add-int/lit8 p1, p1, 4
  .line 348
    if-ltz v1, :L10
    add-int/2addr p1, v1
    add-int/lit8 v1, p1, 4
    if-le v1, p2, :L1
    goto :L10
  :L1
  .line 349
    nop
  .line 350
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Vorbis;->be32([BI)I
    move-result p1
  .line 351
    nop
  .line 352
    if-ltz p1, :L9
    add-int v2, v1, p1
    add-int/lit8 v2, v2, 20
    if-le v2, p2, :L2
    goto :L9
  :L2
  .line 353
    add-int/lit8 p1, p1, 16
    add-int/2addr v1, p1
  .line 354
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Vorbis;->be32([BI)I
    move-result p1
  .line 355
    add-int/lit8 v1, v1, 4
  .line 356
    if-lez p1, :L8
    const/high16 v2, 0x00800000
    if-gt p1, v2, :L8
    add-int v2, v1, p1
    if-le v2, p2, :L3
    goto :L8
  :L3
  .line 357
    const/4 p2, 3
    const/4 v2, 0
    if-ne v0, p2, :L4
    const/4 p2, 1
    goto :L5
  :L4
    const/4 p2, 0
  :L5
  .line 358
    iget-object v0, p3, Lcom/innioasis/ipp/Vorbis$Pic;->data:[B
    if-eqz v0, :L7
    iget-boolean v0, p3, Lcom/innioasis/ipp/Vorbis$Pic;->front:Z
    if-nez v0, :L6
    if-nez p2, :L7
  :L6
    return-void
  :L7
  .line 359
    new-array v0, p1, [B
  .line 360
    invoke-static { p0, v1, v0, v2, p1 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 361
    iput-object v0, p3, Lcom/innioasis/ipp/Vorbis$Pic;->data:[B
  .line 362
    iput-boolean p2, p3, Lcom/innioasis/ipp/Vorbis$Pic;->front:Z
  .line 363
    return-void
  :L8
  .line 356
    return-void
  :L9
  .line 352
    return-void
  :L10
  .line 348
    return-void
.end method

.method private static put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 326
    if-nez p2, :L0
    return-void
  :L0
  .line 327
    const-string v0, "TITLE"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    goto/16 :L11
  :L1
  .line 328
    const-string v0, "ARTIST"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    goto/16 :L11
  :L2
  .line 329
    const-string v0, "ALBUMARTIST"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L10
    const-string v0, "ALBUM ARTIST"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    goto :L10
  :L3
  .line 330
    const-string v0, "ALBUM"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L4
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    goto :L11
  :L4
  .line 331
    const-string v0, "GENRE"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L5
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    goto :L11
  :L5
  .line 332
    const-string v0, "TRACKNUMBER"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L6
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    goto :L11
  :L6
  .line 333
    const-string v0, "DISCNUMBER"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L7
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
    goto :L11
  :L7
  .line 334
    const-string v0, "DATE"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L8
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
    goto :L11
  :L8
  .line 335
    iget-boolean v0, p0, Lcom/innioasis/ipp/Meta$Info;->wantLyrics:Z
    if-eqz v0, :L11
    const-string v0, "LYRICS"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L9
    const-string v0, "UNSYNCEDLYRICS"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L9
  .line 336
    const-string v0, "UNSYNCED LYRICS"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L9
    const-string v0, "SYNCEDLYRICS"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L11
  :L9
  .line 337
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Meta;->offerLyrics(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;)V
    goto :L11
  :L10
  .line 329
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  :L11
  .line 339
    return-void
.end method

.method private static utf8([BII)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 367
    new-instance v0, Ljava/lang/String;
    const-string v1, "UTF-8"
    invoke-direct { v0, p0, p1, p2, v1 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
  :L1
    return-object v0
  :L2
  .line 368
    move-exception p0
  .line 369
    const/4 p0, 0
    return-object p0
.end method

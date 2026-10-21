.class public final Lcom/innioasis/ipp/Meta;
.super Ljava/lang/Object;
.source "Meta.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Meta$Info;,
    Lcom/innioasis/ipp/Meta$Pic;
  }
.end annotation

.field private final static HUGE:J = 3080192L

.field private final static KEY_READER:Ljava/lang/String; = "meta_v"

.field private final static MAX_ART:I = 8388608

.field private final static MAX_TEXT:I = 65536

.field private final static READER:I = 1

.method private constructor <init>()V
  .registers 1
  .line 20
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static art(Ljava/lang/String;)[B
  .catchall { :L1 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L6
  .registers 4
  .line 111
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 112
    nop
  .line 113
    new-instance v1, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v1 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  :L1
  .line 115
    invoke-virtual { v1, p0 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 116
    invoke-virtual { v1 }, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B
    move-result-object v0
  :L2
  .line 118
    goto :L4
  :L3
  .line 117
    move-exception v2
  :L4
  .line 120
    invoke-virtual { v1 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L5
  .line 122
    goto :L7
  :L6
  .line 121
    move-exception v1
  :L7
  .line 123
    if-eqz v0, :L8
    array-length v1, v0
    if-lez v1, :L8
    goto :L9
  :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->tagArt(Ljava/lang/String;)[B
    move-result-object v0
  :L9
    return-object v0
.end method

.method private static ascii([BII)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 445
    new-instance v0, Ljava/lang/String;
    const-string v1, "ISO-8859-1"
    invoke-direct { v0, p0, p1, p2, v1 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
  :L1
    return-object v0
  :L2
  .line 446
    move-exception p0
  .line 447
    const-string p0, ""
    return-object p0
.end method

.method private static be32([BI)J
  .registers 9
  .line 457
    aget-byte v0, p0, p1
    int-to-long v0, v0
    const-wide/16 v2, 255
    and-long/2addr v0, v2
    const/16 v4, 24
    shl-long/2addr v0, v4
    add-int/lit8 v4, p1, 1
    aget-byte v4, p0, v4
    int-to-long v4, v4
    and-long/2addr v4, v2
    const/16 v6, 16
    shl-long/2addr v4, v6
    or-long/2addr v0, v4
    add-int/lit8 v4, p1, 2
    aget-byte v4, p0, v4
    int-to-long v4, v4
    and-long/2addr v4, v2
    const/16 v6, 8
    shl-long/2addr v4, v6
    or-long/2addr v0, v4
    add-int/lit8 p1, p1, 3
    aget-byte p0, p0, p1
    int-to-long p0, p0
    and-long/2addr p0, v2
    or-long/2addr p0, v0
    return-wide p0
.end method

.method private static close(Ljava/io/RandomAccessFile;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 462
    if-nez p0, :L0
    return-void
  :L0
  .line 464
    invoke-virtual { p0 }, Ljava/io/RandomAccessFile;->close()V
  :L1
  .line 466
    goto :L3
  :L2
  .line 465
    move-exception p0
  :L3
  .line 467
    return-void
.end method

.method private static extendedHeader(Ljava/io/RandomAccessFile;JI)J
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 6
  .line 338
    const/4 v0, 4
    new-array v1, v0, [B
  .line 339
    invoke-virtual { p0, p1, p2 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 340
    invoke-virtual { p0, v1 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result p0
    if-eq p0, v0, :L0
    const-wide/16 p0, 0
    return-wide p0
  :L0
  .line 342
    const/4 p0, 0
    if-lt p3, v0, :L1
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Meta;->syncsafe([BI)J
    move-result-wide p0
    goto :L2
  :L1
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Meta;->be32([BI)J
    move-result-wide p0
    const-wide/16 p2, 4
    add-long/2addr p0, p2
  :L2
    return-wide p0
.end method

.method public static fixSong(Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 5
  .line 142
    if-nez p0, :L0
    return-void
  :L0
  .line 144
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 145
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L1
    return-void
  :L1
  .line 147
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->info(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v1
  .line 148
    const/4 v2, 0
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)V
  .line 149
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .line 150
    invoke-static { }, Lcom/innioasis/y1/utils/HanziToPinyin;->getInstance()Lcom/innioasis/y1/utils/HanziToPinyin;
    move-result-object v0
  .line 152
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    if-eqz v2, :L2
  .line 153
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setSongName(Ljava/lang/String;)V
  .line 154
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setPinyinSongName(Ljava/lang/String;)V
  :L2
  .line 156
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    if-eqz v2, :L3
  .line 157
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setAlbum(Ljava/lang/String;)V
  .line 158
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v2, v3 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setLowAlbum(Ljava/lang/String;)V
  .line 159
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setPinyinAlbum(Ljava/lang/String;)V
  :L3
  .line 161
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    if-eqz v2, :L4
  .line 162
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setArtist(Ljava/lang/String;)V
  .line 163
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setPinyinArtist(Ljava/lang/String;)V
  :L4
  .line 165
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    if-eqz v2, :L5
  .line 166
    iget-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setGenre(Ljava/lang/String;)V
  .line 167
    iget-object v1, v1, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setPinyinGenre(Ljava/lang/String;)V
  :L5
  .line 170
    goto :L7
  :L6
  .line 169
    move-exception p0
  :L7
  .line 171
    return-void
.end method

.method private static frameLen([BI)J
  .registers 8
  .line 331
    const/4 v0, 2
    const/4 v1, 4
    if-ne p1, v0, :L0
  .line 332
    const/4 p1, 3
    aget-byte p1, p0, p1
    int-to-long v2, p1
    const-wide/16 v4, 255
    and-long/2addr v2, v4
    const/16 p1, 16
    shl-long/2addr v2, p1
    aget-byte p1, p0, v1
    int-to-long v0, p1
    and-long/2addr v0, v4
    const/16 p1, 8
    shl-long/2addr v0, p1
    or-long/2addr v0, v2
    const/4 p1, 5
    aget-byte p0, p0, p1
    int-to-long p0, p0
    and-long/2addr p0, v4
    or-long/2addr p0, v0
    return-wide p0
  :L0
  .line 334
    if-lt p1, v1, :L1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Meta;->syncsafe([BI)J
    move-result-wide p0
    goto :L2
  :L1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Meta;->be32([BI)J
    move-result-wide p0
  :L2
    return-wide p0
.end method

.method private static genre(Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 313
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 314
    const-string v0, "("
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
  .line 315
    const/16 v0, 41
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
  .line 316
    if-lez v0, :L0
    add-int/2addr v0, v1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  :L0
  .line 318
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v2, 0
    if-nez v0, :L1
    return-object v2
  :L1
  .line 319
    nop
  .line 320
    const/4 v0, 0
    const/4 v3, 0
  :L2
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v4
    if-ge v3, v4, :L5
  .line 321
    invoke-virtual { p0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result v4
    const/16 v5, 48
    if-lt v4, v5, :L4
    invoke-virtual { p0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result v4
    const/16 v5, 57
    if-le v4, v5, :L3
    goto :L4
  :L3
  .line 320
    add-int/lit8 v3, v3, 1
    goto :L2
  :L4
  .line 321
    const/4 v1, 0
  :L5
  .line 323
    if-eqz v1, :L6
    move-object p0, v2
  :L6
    return-object p0
.end method

.method private static id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)V
  .catchall { :L0 .. :L1 } :L38
  .catchall { :L2 .. :L3 } :L37
  .catchall { :L5 .. :L34 } :L37
  .registers 25
  .line 219
    move-object/from16 v0, p1
  .line 221
    const/4 v1, 0
  :L0
    new-instance v2, Ljava/io/RandomAccessFile;
    const-string v3, "r"
    move-object/from16 v4, p0
    invoke-direct { v2, v4, v3 }, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  :L1
  .line 222
    const/16 v3, 10
  :L2
    new-array v4, v3, [B
  .line 223
    invoke-virtual { v2, v4 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v5
  :L3
    if-eq v5, v3, :L4
  .line 273
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 223
    return-void
  :L4
  .line 224
    const/4 v5, 0
  :L5
    aget-byte v6, v4, v5
    const/16 v7, 73
    if-ne v6, v7, :L36
    const/4 v6, 1
    aget-byte v7, v4, v6
    const/16 v8, 68
    if-ne v7, v8, :L36
    const/4 v7, 2
    aget-byte v8, v4, v7
    const/16 v9, 51
    if-eq v8, v9, :L6
    goto/16 :L36
  :L6
  .line 226
    const/4 v8, 3
    aget-byte v9, v4, v8
    and-int/lit16 v9, v9, 255
  .line 227
    if-lt v9, v7, :L35
    const/4 v10, 4
    if-le v9, v10, :L7
    goto/16 :L35
  :L7
  .line 228
    const/4 v11, 5
    aget-byte v11, v4, v11
    and-int/lit16 v11, v11, 255
  .line 229
    and-int/lit16 v12, v11, 128
    if-eqz v12, :L8
    const/4 v12, 1
    goto :L9
  :L8
    const/4 v12, 0
  :L9
  .line 230
    const/4 v13, 6
    invoke-static { v4, v13 }, Lcom/innioasis/ipp/Meta;->syncsafe([BI)J
    move-result-wide v14
    const-wide/16 v3, 10
    add-long/2addr v14, v3
  .line 232
    nop
  .line 233
    and-int/lit8 v11, v11, 64
    if-eqz v11, :L10
    invoke-static { v2, v3, v4, v9 }, Lcom/innioasis/ipp/Meta;->extendedHeader(Ljava/io/RandomAccessFile;JI)J
    move-result-wide v16
    add-long v3, v16, v3
  :L10
  .line 235
    if-ne v9, v7, :L11
    goto :L12
  :L11
    const/4 v8, 4
  :L12
  .line 236
    if-ne v9, v7, :L13
    goto :L14
  :L13
    const/16 v13, 10
  :L14
  .line 237
    new-array v7, v13, [B
  .line 238
    nop
  :L15
  .line 240
    int-to-long v10, v13
    add-long/2addr v10, v3
    cmp-long v16, v10, v14
    if-gtz v16, :L33
  .line 241
    invoke-virtual { v2, v3, v4 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 242
    invoke-virtual { v2, v7 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v3
    if-eq v3, v13, :L16
    goto/16 :L33
  :L16
  .line 243
    aget-byte v3, v7, v5
    if-nez v3, :L17
    goto/16 :L33
  :L17
  .line 244
    invoke-static { v7, v5, v8 }, Lcom/innioasis/ipp/Meta;->ascii([BII)Ljava/lang/String;
    move-result-object v3
  .line 245
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->isFrameId(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L18
    goto/16 :L33
  :L18
  .line 247
    invoke-static { v7, v9 }, Lcom/innioasis/ipp/Meta;->frameLen([BI)J
    move-result-wide v5
  .line 248
    const-wide/16 v16, 0
    cmp-long v18, v5, v16
    if-ltz v18, :L33
    add-long v16, v10, v5
    cmp-long v18, v16, v14
    if-lez v18, :L19
    goto/16 :L33
  :L19
  .line 249
    nop
  .line 250
    nop
  .line 252
    const-string v4, "APIC"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L21
    const-string v4, "PIC"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L20
    goto :L21
  :L20
    const/4 v4, 0
    goto :L22
  :L21
    const/4 v4, 1
  :L22
  .line 253
    if-eqz v4, :L24
    if-eqz p2, :L23
    const-wide/32 v19, 8388608
    cmp-long v21, v5, v19
    if-lez v21, :L24
  :L23
    move-object/from16 v20, v7
    move/from16 v19, v8
    goto/16 :L32
  :L24
  .line 254
    if-nez v4, :L26
    const-wide/16 v19, 1
    cmp-long v21, v5, v19
    if-ltz v21, :L25
    const-wide/32 v19, 65536
    cmp-long v21, v5, v19
    if-lez v21, :L26
  :L25
    move-object/from16 v20, v7
    move/from16 v19, v8
    goto :L32
  :L26
  .line 255
    if-nez v4, :L27
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->wanted(Ljava/lang/String;)Z
    move-result v19
    if-nez v19, :L27
    move-object/from16 v20, v7
    move/from16 v19, v8
    goto :L32
  :L27
  .line 257
    invoke-virtual { v2, v10, v11 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 258
    long-to-int v10, v5
    new-array v10, v10, [B
  .line 259
    invoke-virtual { v2, v10 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v11
    move-object/from16 v20, v7
    move/from16 v19, v8
    int-to-long v7, v11
    cmp-long v11, v7, v5
    if-eqz v11, :L28
    goto :L33
  :L28
  .line 260
    if-eqz v12, :L29
    invoke-static { v10 }, Lcom/innioasis/ipp/Meta;->resync([B)[B
    move-result-object v10
  :L29
  .line 262
    if-eqz v4, :L31
  .line 264
    invoke-static { v10, v9 }, Lcom/innioasis/ipp/Meta;->picture([BI)Lcom/innioasis/ipp/Meta$Pic;
    move-result-object v3
  .line 265
    if-eqz v3, :L32
    if-eqz v1, :L30
    iget-boolean v4, v3, Lcom/innioasis/ipp/Meta$Pic;->front:Z
    if-eqz v4, :L32
    iget-boolean v4, v1, Lcom/innioasis/ipp/Meta$Pic;->front:Z
    if-nez v4, :L32
  :L30
    move-object v1, v3
    move-wide/from16 v3, v16
    move/from16 v8, v19
    move-object/from16 v7, v20
    const/4 v5, 0
    const/4 v6, 1
    goto/16 :L15
  :L31
  .line 268
    invoke-static { v10 }, Lcom/innioasis/ipp/Meta;->text([B)Ljava/lang/String;
    move-result-object v4
    invoke-static { v0, v3, v4 }, Lcom/innioasis/ipp/Meta;->put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  .line 269
    nop
  :L32
  .line 240
    move-wide/from16 v3, v16
    move/from16 v8, v19
    move-object/from16 v7, v20
    const/4 v5, 0
    const/4 v6, 1
    goto/16 :L15
  :L33
  .line 270
    if-eqz v1, :L34
    iget-object v1, v1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L34
  .line 273
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
    goto :L40
  :L35
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 227
    return-void
  :L36
  .line 273
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 224
    return-void
  :L37
  .line 271
    move-exception v0
    move-object v1, v2
    goto :L39
  :L38
    move-exception v0
  :L39
  .line 273
    invoke-static { v1 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  :L40
  .line 274
    nop
  .line 275
    return-void
.end method

.method private static isFrameId(Ljava/lang/String;)Z
  .registers 5
  .line 436
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    if-ge v1, v2, :L4
  .line 437
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v2
  .line 438
    const/16 v3, 65
    if-lt v2, v3, :L1
    const/16 v3, 90
    if-le v2, v3, :L2
  :L1
    const/16 v3, 48
    if-lt v2, v3, :L3
    const/16 v3, 57
    if-le v2, v3, :L2
    goto :L3
  :L2
  .line 436
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 438
    return v0
  :L4
  .line 440
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    if-lez p0, :L5
    const/4 v0, 1
  :L5
    return v0
.end method

.method public static libraryRead(Landroid/content/Context;)Z
  .registers 3
  .line 59
    const/4 v0, 0
    if-eqz p0, :L0
    const-string v1, "meta_v"
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p0
    const/4 v1, 1
    if-lt p0, v1, :L0
    const/4 v0, 1
  :L0
    return v0
.end method

.method public static noteLibraryRead(Landroid/content/Context;)V
  .registers 3
  .line 64
    if-nez p0, :L0
    return-void
  :L0
  .line 65
    const-string v0, "meta_v"
    const/4 v1, 1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 66
    return-void
.end method

.method public static oversized(Ljava/lang/String;)Z
  .catchall { :L3 .. :L4 } :L13
  .catchall { :L5 .. :L6 } :L12
  .catchall { :L7 .. :L9 } :L12
  .registers 9
  .line 193
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 194
    const/16 v1, 46
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 195
    if-gez v1, :L1
    return v0
  :L1
  .line 196
    const/4 v2, 1
    add-int/2addr v1, v2
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v1
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v1, v3 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1
  .line 197
    const-string v3, "mp3"
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    const-string v3, "aiff"
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    const-string v3, "aif"
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    const-string v3, "wav"
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L2
  .line 198
    return v0
  :L2
  .line 200
    nop
  .line 202
    const/4 v1, 0
  :L3
    new-instance v3, Ljava/io/RandomAccessFile;
    const-string v4, "r"
    invoke-direct { v3, p0, v4 }, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  :L4
  .line 203
    const/16 p0, 10
  :L5
    new-array v1, p0, [B
  .line 204
    invoke-virtual { v3, v1 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v4
  :L6
    if-eq v4, p0, :L7
  .line 210
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 204
    return v0
  :L7
  .line 205
    aget-byte p0, v1, v0
    const/16 v4, 73
    if-ne p0, v4, :L11
    aget-byte p0, v1, v2
    const/16 v4, 68
    if-ne p0, v4, :L11
    const/4 p0, 2
    aget-byte p0, v1, p0
    const/16 v4, 51
    if-eq p0, v4, :L8
    goto :L11
  :L8
  .line 206
    const/4 p0, 6
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Meta;->syncsafe([BI)J
    move-result-wide v4
  :L9
    const-wide/32 v6, 3080192
    cmp-long p0, v4, v6
    if-ltz p0, :L10
    const/4 v0, 1
  :L10
  .line 210
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 206
    return v0
  :L11
  .line 210
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 205
    return v0
  :L12
  .line 207
    move-exception p0
    move-object v1, v3
    goto :L14
  :L13
    move-exception p0
  :L14
  .line 208
    nop
  .line 210
    invoke-static { v1 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 208
    return v0
.end method

.method private static picture([BI)Lcom/innioasis/ipp/Meta$Pic;
  .registers 10
  .line 350
    array-length v0, p0
    const/4 v1, 0
    const/4 v2, 4
    if-ge v0, v2, :L0
    return-object v1
  :L0
  .line 351
    const/4 v0, 0
    aget-byte v3, p0, v0
    and-int/lit16 v3, v3, 255
  .line 352
    nop
  .line 353
    const/4 v4, 2
    const/4 v5, 1
    if-ne p1, v4, :L1
  .line 354
    goto :L4
  :L1
  .line 353
    const/4 p1, 1
  :L2
  .line 356
    array-length v2, p0
    if-ge p1, v2, :L3
    aget-byte v2, p0, p1
    if-eqz v2, :L3
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 357
    add-int/lit8 v2, p1, 1
  :L4
  .line 359
    array-length p1, p0
    if-lt v2, p1, :L5
    return-object v1
  :L5
  .line 360
    new-instance p1, Lcom/innioasis/ipp/Meta$Pic;
    invoke-direct { p1, v1 }, Lcom/innioasis/ipp/Meta$Pic;-><init>(Lcom/innioasis/ipp/Meta$1;)V
  .line 361
    aget-byte v6, p0, v2
    and-int/lit16 v6, v6, 255
    const/4 v7, 3
    if-ne v6, v7, :L6
    const/4 v6, 1
    goto :L7
  :L6
    const/4 v6, 0
  :L7
    iput-boolean v6, p1, Lcom/innioasis/ipp/Meta$Pic;->front:Z
  .line 362
    add-int/2addr v2, v5
  .line 363
    if-eq v3, v5, :L9
    if-ne v3, v4, :L8
    goto :L9
  :L8
    const/4 v3, 0
    goto :L10
  :L9
    const/4 v3, 1
  :L10
  .line 364
    if-eqz v3, :L14
  :L11
  .line 365
    add-int/lit8 v3, v2, 1
    array-length v5, p0
    if-ge v3, v5, :L13
    aget-byte v5, p0, v2
    if-nez v5, :L12
    aget-byte v3, p0, v3
    if-eqz v3, :L13
  :L12
    add-int/lit8 v2, v2, 2
    goto :L11
  :L13
  .line 366
    add-int/2addr v2, v4
    goto :L16
  :L14
  .line 368
    array-length v3, p0
    if-ge v2, v3, :L15
    aget-byte v3, p0, v2
    if-eqz v3, :L15
    add-int/lit8 v2, v2, 1
    goto :L14
  :L15
  .line 369
    add-int/2addr v2, v5
  :L16
  .line 371
    array-length v3, p0
    if-lt v2, v3, :L17
    return-object v1
  :L17
  .line 372
    array-length v1, p0
    sub-int/2addr v1, v2
    new-array v1, v1, [B
    iput-object v1, p1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
  .line 373
    iget-object v1, p1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
    iget-object v3, p1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
    array-length v3, v3
    invoke-static { p0, v2, v1, v0, v3 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 374
    return-object p1
.end method

.method private static put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 296
    if-eqz p2, :L19
    invoke-virtual { p2 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto/16 :L19
  :L0
  .line 297
    const-string v0, "TIT2"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L17
    const-string v0, "TT2"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    goto/16 :L17
  :L1
  .line 298
    const-string v0, "TPE1"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L16
    const-string v0, "TP1"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    goto/16 :L16
  :L2
  .line 299
    const-string v0, "TPE2"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L15
    const-string v0, "TP2"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    goto/16 :L15
  :L3
  .line 300
    const-string v0, "TALB"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L14
    const-string v0, "TAL"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L4
    goto/16 :L14
  :L4
  .line 301
    const-string v0, "TCON"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L13
    const-string v0, "TCO"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L5
    goto :L13
  :L5
  .line 302
    const-string v0, "TRCK"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L12
    const-string v0, "TRK"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L6
    goto :L12
  :L6
  .line 303
    const-string v0, "TPOS"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L11
    const-string v0, "TPA"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L7
    goto :L11
  :L7
  .line 304
    const-string v0, "TYER"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L10
    const-string v0, "TYE"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L8
    goto :L10
  :L8
  .line 305
    const-string v0, "TDRC"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L9
    const-string v0, "TDRL"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L18
  :L9
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
    goto :L18
  :L10
  .line 304
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
    goto :L18
  :L11
  .line 303
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
    goto :L18
  :L12
  .line 302
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    goto :L18
  :L13
  .line 301
    invoke-static { p2 }, Lcom/innioasis/ipp/Meta;->genre(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    goto :L18
  :L14
  .line 300
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    goto :L18
  :L15
  .line 299
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
    goto :L18
  :L16
  .line 298
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    goto :L18
  :L17
  .line 297
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
  :L18
  .line 306
    return-void
  :L19
  .line 296
    return-void
.end method

.method public static read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
  .catchall { :L1 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L7
  .registers 11
  .line 73
    new-instance v0, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 74
    if-nez p0, :L0
    return-object v0
  :L0
  .line 76
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
  .line 77
    new-instance v3, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v3 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  .line 79
    const/4 v4, 1
  :L1
    invoke-virtual { v3, p0 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 80
    const/4 v5, 7
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
  .line 81
    const/4 v5, 2
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
  .line 82
    const/16 v5, 13
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 83
    invoke-virtual { v3, v4 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
  .line 84
    const/4 v5, 6
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
  .line 85
    const/4 v5, 0
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
  .line 86
    const/16 v5, 14
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
  .line 87
    const/16 v5, 8
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
  .line 88
    const/4 v5, 5
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
  .line 89
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
  .line 90
    if-eqz p1, :L2
    invoke-virtual { v3 }, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B
    move-result-object v7
    iput-object v7, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L2
  .line 91
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
    sub-long/2addr v7, v5
    iput-wide v7, v0, Lcom/innioasis/ipp/Meta$Info;->artNs:J
  .line 92
    iput-boolean v4, v0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  :L3
  .line 94
    goto :L5
  :L4
  .line 93
    move-exception v5
  :L5
  .line 96
    invoke-virtual { v3 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L6
  .line 98
    goto :L8
  :L7
  .line 97
    move-exception v3
  :L8
  .line 100
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result v3
  .line 101
    if-eqz v3, :L9
  .line 102
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)V
  .line 103
    iput-boolean v4, v0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  :L9
  .line 105
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide p0
    sub-long/2addr p0, v1
    iget-wide v1, v0, Lcom/innioasis/ipp/Meta$Info;->artNs:J
    sub-long/2addr p0, v1
    iput-wide p0, v0, Lcom/innioasis/ipp/Meta$Info;->openNs:J
  .line 106
    return-object v0
.end method

.method private static resync([B)[B
  .registers 7
  .line 420
    nop
  .line 421
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, p0
    const/16 v4, 255
    if-ge v1, v3, :L3
  .line 422
    if-lez v1, :L1
    aget-byte v3, p0, v1
    and-int/2addr v3, v4
    if-nez v3, :L1
    add-int/lit8 v3, v1, -1
    aget-byte v3, p0, v3
    and-int/2addr v3, v4
    if-ne v3, v4, :L1
    goto :L2
  :L1
  .line 423
    add-int/lit8 v2, v2, 1
  :L2
  .line 421
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 425
    array-length v1, p0
    if-ne v2, v1, :L4
    return-object p0
  :L4
  .line 426
    new-array v1, v2, [B
  .line 427
    nop
  .line 428
    const/4 v2, 0
  :L5
    array-length v3, p0
    if-ge v0, v3, :L8
  .line 429
    if-lez v0, :L6
    aget-byte v3, p0, v0
    and-int/2addr v3, v4
    if-nez v3, :L6
    add-int/lit8 v3, v0, -1
    aget-byte v3, p0, v3
    and-int/2addr v3, v4
    if-ne v3, v4, :L6
    goto :L7
  :L6
  .line 430
    add-int/lit8 v3, v2, 1
    aget-byte v5, p0, v0
    aput-byte v5, v1, v2
    move v2, v3
  :L7
  .line 428
    add-int/lit8 v0, v0, 1
    goto :L5
  :L8
  .line 432
    return-object v1
.end method

.method public static scanned(Landroid/media/MediaMetadataRetriever;Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 178
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 180
    new-instance v0, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 181
    const/16 v1, 13
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 182
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
  .line 183
    const/16 v1, 14
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
  .line 184
    const/16 v1, 8
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
  .line 185
    const/4 v1, 5
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object p0
    iput-object p0, v0, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
  .line 186
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  :L1
  .line 188
    goto :L3
  :L2
  .line 187
    move-exception p0
  :L3
  .line 189
    return-void
  :L4
  .line 178
    return-void
.end method

.method private static syncsafe([BI)J
  .registers 9
  .line 452
    aget-byte v0, p0, p1
    int-to-long v0, v0
    const-wide/16 v2, 127
    and-long/2addr v0, v2
    const/16 v4, 21
    shl-long/2addr v0, v4
    add-int/lit8 v4, p1, 1
    aget-byte v4, p0, v4
    int-to-long v4, v4
    and-long/2addr v4, v2
    const/16 v6, 14
    shl-long/2addr v4, v6
    or-long/2addr v0, v4
    add-int/lit8 v4, p1, 2
    aget-byte v4, p0, v4
    int-to-long v4, v4
    and-long/2addr v4, v2
    const/4 v6, 7
    shl-long/2addr v4, v6
    or-long/2addr v0, v4
    add-int/lit8 p1, p1, 3
    aget-byte p0, p0, p1
    int-to-long p0, p0
    and-long/2addr p0, v2
    or-long/2addr p0, v0
    return-wide p0
.end method

.method public static tagArt(Ljava/lang/String;)[B
  .registers 3
  .line 131
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 132
    new-instance v0, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 133
    const/4 v1, 1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)V
  .line 134
    iget-object p0, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
    return-object p0
.end method

.method private static text([B)Ljava/lang/String;
  .catchall { :L10 .. :L11 } :L12
  .registers 10
  .line 379
    const/4 v0, 0
    aget-byte v1, p0, v0
    const/16 v2, 255
    and-int/2addr v1, v2
  .line 380
    nop
  .line 381
    array-length v3, p0
    const/4 v4, 1
    sub-int/2addr v3, v4
  .line 383
    const-string v5, "UTF-16BE"
    const/4 v6, 3
    const/4 v7, 2
    if-ne v1, v4, :L2
  .line 385
    const/16 v1, 254
    if-lt v3, v7, :L0
    aget-byte v8, p0, v4
    and-int/2addr v8, v2
    if-ne v8, v2, :L0
    aget-byte v8, p0, v7
    and-int/2addr v8, v2
    if-ne v8, v1, :L0
  .line 386
    nop
  .line 387
    nop
  .line 388
    add-int/lit8 v3, v3, -2
    const-string v5, "UTF-16LE"
    const/4 v4, 3
    goto :L5
  :L0
  .line 389
    if-lt v3, v7, :L1
    aget-byte v8, p0, v4
    and-int/2addr v8, v2
    if-ne v8, v1, :L1
    aget-byte v1, p0, v7
    and-int/2addr v1, v2
    if-ne v1, v2, :L1
  .line 390
    nop
  .line 391
    nop
  .line 392
    add-int/lit8 v3, v3, -2
    const/4 v4, 3
    goto :L5
  :L1
  .line 394
    goto :L5
  :L2
  .line 396
    if-ne v1, v7, :L3
  .line 397
    goto :L5
  :L3
  .line 398
    if-ne v1, v6, :L4
  .line 399
    const-string v5, "UTF-8"
    goto :L5
  :L4
  .line 401
    const-string v5, "ISO-8859-1"
  :L5
  .line 403
    const-string v1, "UTF-16"
    invoke-virtual { v5, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
  .line 404
    nop
  .line 405
    if-eqz v1, :L8
  :L6
  .line 406
    add-int/lit8 v1, v0, 1
    if-ge v1, v3, :L9
    add-int v1, v4, v0
    aget-byte v2, p0, v1
    if-nez v2, :L7
    add-int/lit8 v1, v1, 1
    aget-byte v1, p0, v1
    if-eqz v1, :L9
  :L7
    add-int/lit8 v0, v0, 2
    goto :L6
  :L8
  .line 408
    if-ge v0, v3, :L9
    add-int v1, v4, v0
    aget-byte v1, p0, v1
    if-eqz v1, :L9
    add-int/lit8 v0, v0, 1
    goto :L8
  :L9
  .line 410
    const/4 v1, 0
    if-gtz v0, :L10
    return-object v1
  :L10
  .line 412
    new-instance v2, Ljava/lang/String;
    invoke-direct { v2, p0, v4, v0, v5 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  :L11
    return-object p0
  :L12
  .line 413
    move-exception p0
  .line 414
    return-object v1
.end method

.method private static wanted(Ljava/lang/String;)Z
  .registers 2
  .line 284
    const-string v0, "TIT2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TT2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 285
    const-string v0, "TPE1"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TP1"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 286
    const-string v0, "TPE2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TP2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 287
    const-string v0, "TALB"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TAL"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 288
    const-string v0, "TCON"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TCO"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 289
    const-string v0, "TRCK"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TRK"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 290
    const-string v0, "TPOS"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TPA"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 291
    const-string v0, "TYER"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TYE"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 292
    const-string v0, "TDRC"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TDRL"
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
  .line 284
    return p0
.end method

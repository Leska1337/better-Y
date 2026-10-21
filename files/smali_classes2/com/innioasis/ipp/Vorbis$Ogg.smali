.class final Lcom/innioasis/ipp/Vorbis$Ogg;
.super Ljava/lang/Object;
.source "Vorbis.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Vorbis;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Ogg"
.end annotation

.field private any:Z

.field private body:J

.field private bodyLen:I

.field private final buf:[B

.field eof:Z

.field private final f:Ljava/io/RandomAccessFile;

.field private final len:J

.field private loaded:Z

.field private next:J

.field private nseg:I

.field private off:I

.field private packetEnd:Z

.field private final ph:[B

.field private final seg:[B

.field private segAt:I

.field private segLen:I

.field private segStart:I

.field private serial:I

.field private si:I

.field private started:Z

.field private winAt:I

.field private winLen:I

.method constructor <init>(Ljava/io/RandomAccessFile;Z)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 4
  .line 173
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 154
    const/16 v0, 282
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->ph:[B
  .line 155
    const/16 v0, 255
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->seg:[B
  .line 174
    iput-object p1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
  .line 175
    if-eqz p2, :L0
    const p2, 65025
    goto :L1
  :L0
    const/16 p2, 4096
  :L1
    new-array p2, p2, [B
    iput-object p2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->buf:[B
  .line 176
    invoke-virtual { p1 }, Ljava/io/RandomAccessFile;->length()J
    move-result-wide p1
    iput-wide p1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->len:J
  .line 177
    return-void
.end method

.method private more()Z
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 6
  .line 218
    nop
  :L0
    iget-boolean v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->started:Z
    const/4 v1, 1
    if-eqz v0, :L2
    iget v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    iget v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segLen:I
    if-ne v2, v3, :L1
    goto :L2
  :L1
  .line 234
    return v1
  :L2
  .line 219
    const/4 v2, 0
    if-eqz v0, :L3
    iget-boolean v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->packetEnd:Z
    if-eqz v0, :L3
    return v2
  :L3
  .line 220
    iget v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->si:I
    iget v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->nseg:I
    if-lt v0, v3, :L4
  .line 221
    invoke-direct { p0 }, Lcom/innioasis/ipp/Vorbis$Ogg;->page()Z
    move-result v0
    if-nez v0, :L3
  .line 222
    iput-boolean v1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->eof:Z
  .line 223
    return v2
  :L4
  .line 226
    iget-object v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->seg:[B
    add-int/lit8 v4, v0, 1
    iput v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->si:I
    aget-byte v0, v3, v0
    const/16 v3, 255
    and-int/2addr v0, v3
  .line 227
    iget v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->off:I
    iput v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segStart:I
  .line 228
    add-int/2addr v4, v0
    iput v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->off:I
  .line 229
    iput v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segLen:I
  .line 230
    iput v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
  .line 231
    if-ge v0, v3, :L5
    const/4 v2, 1
  :L5
    iput-boolean v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->packetEnd:Z
  .line 232
    iput-boolean v1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->started:Z
  .line 233
    goto :L0
.end method

.method private page()Z
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 12
  .line 181
    nop
  :L0
    iget-wide v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->next:J
    const-wide/16 v2, 27
    add-long v4, v0, v2
    iget-wide v6, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->len:J
    const/4 v8, 0
    cmp-long v9, v4, v6
    if-lez v9, :L1
    return v8
  :L1
  .line 183
    iget-object v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
    invoke-virtual { v4, v0, v1 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 184
    iget-object v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->ph:[B
    array-length v0, v0
    int-to-long v0, v0
    iget-wide v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->len:J
    iget-wide v6, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->next:J
    sub-long/2addr v4, v6
    invoke-static { v0, v1, v4, v5 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v0
    long-to-int v1, v0
  .line 185
    const/4 v0, 0
  :L2
  .line 186
    if-ge v0, v1, :L4
  .line 187
    iget-object v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
    iget-object v5, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->ph:[B
    sub-int v6, v1, v0
    invoke-virtual { v4, v5, v0, v6 }, Ljava/io/RandomAccessFile;->read([BII)I
    move-result v4
  .line 188
    if-gez v4, :L3
    goto :L4
  :L3
  .line 189
    add-int/2addr v0, v4
  .line 190
    goto :L2
  :L4
  .line 191
    const/16 v1, 27
    if-lt v0, v1, :L10
    iget-object v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->ph:[B
    aget-byte v5, v4, v8
    const/16 v6, 79
    if-ne v5, v6, :L10
    const/4 v5, 1
    aget-byte v6, v4, v5
    const/16 v7, 103
    if-ne v6, v7, :L10
    const/4 v6, 2
    aget-byte v6, v4, v6
    if-ne v6, v7, :L10
    const/4 v6, 3
    aget-byte v6, v4, v6
    const/16 v7, 83
    if-ne v6, v7, :L10
  .line 194
    const/16 v6, 14
    invoke-static { v4, v6 }, Lcom/innioasis/ipp/Vorbis;->access$100([BI)I
    move-result v4
  .line 195
    iget-object v6, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->ph:[B
    const/16 v7, 26
    aget-byte v7, v6, v7
    and-int/lit16 v7, v7, 255
  .line 196
    add-int/lit8 v9, v7, 27
    if-gt v9, v0, :L9
  .line 197
    iget-object v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->seg:[B
    invoke-static { v6, v1, v0, v8, v7 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 198
    nop
  .line 199
    const/4 v0, 0
    const/4 v1, 0
  :L5
    if-ge v0, v7, :L6
    iget-object v6, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->seg:[B
    aget-byte v6, v6, v0
    and-int/lit16 v6, v6, 255
    add-int/2addr v1, v6
    add-int/lit8 v0, v0, 1
    goto :L5
  :L6
  .line 200
    iget-wide v9, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->next:J
    add-long/2addr v9, v2
    int-to-long v2, v7
    add-long/2addr v9, v2
    iput-wide v9, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->body:J
  .line 201
    int-to-long v2, v1
    add-long/2addr v9, v2
    iput-wide v9, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->next:J
  .line 202
    iget-boolean v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->any:Z
    if-nez v0, :L7
  .line 203
    iput v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->serial:I
  .line 204
    iput-boolean v5, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->any:Z
  :L7
  .line 206
    iget v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->serial:I
    if-eq v4, v0, :L8
    goto/16 :L0
  :L8
  .line 207
    iput v7, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->nseg:I
  .line 208
    iput v8, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->si:I
  .line 209
    iput v8, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->off:I
  .line 210
    iput v1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->bodyLen:I
  .line 211
    iput-boolean v8, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->loaded:Z
  .line 212
    return v5
  :L9
  .line 196
    new-instance v0, Ljava/io/IOException;
    const-string v1, "short page"
    invoke-direct { v0, v1 }, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    throw v0
  :L10
  .line 192
    new-instance v0, Ljava/io/IOException;
    const-string v1, "not an Ogg page"
    invoke-direct { v0, v1 }, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    goto :L12
  :L11
    throw v0
  :L12
    goto :L11
.end method

.method nextPacket()V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 2
  .line 269
    nop
  :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Vorbis$Ogg;->more()Z
    move-result v0
    if-eqz v0, :L1
    iget v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segLen:I
    iput v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    goto :L0
  :L1
  .line 270
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->started:Z
  .line 271
    return-void
.end method

.method read([BII)I
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 13
  .line 238
    const/4 v0, 0
    const/4 v1, 0
  :L0
  .line 239
    if-ge v1, p3, :L4
    invoke-direct { p0 }, Lcom/innioasis/ipp/Vorbis$Ogg;->more()Z
    move-result v2
    if-eqz v2, :L4
  .line 240
    iget v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segStart:I
    iget v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    add-int/2addr v2, v3
  .line 241
    iget-boolean v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->loaded:Z
    if-eqz v3, :L1
    iget v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->winAt:I
    if-lt v2, v3, :L1
    iget v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->winLen:I
    add-int/2addr v3, v4
    if-lt v2, v3, :L2
  :L1
  .line 244
    iget-wide v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->body:J
    iget v5, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->bodyLen:I
    int-to-long v6, v5
    add-long/2addr v3, v6
    iget-wide v6, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->len:J
    cmp-long v8, v3, v6
    if-gtz v8, :L3
  .line 245
    iput v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->winAt:I
  .line 246
    iget-object v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->buf:[B
    array-length v3, v3
    sub-int/2addr v5, v2
    invoke-static { v3, v5 }, Ljava/lang/Math;->min(II)I
    move-result v3
    iput v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->winLen:I
  .line 247
    iget-object v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
    iget-wide v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->body:J
    int-to-long v6, v2
    add-long/2addr v4, v6
    invoke-virtual { v3, v4, v5 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 248
    iget-object v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
    iget-object v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->buf:[B
    iget v5, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->winLen:I
    invoke-virtual { v3, v4, v0, v5 }, Ljava/io/RandomAccessFile;->readFully([BII)V
  .line 249
    const/4 v3, 1
    iput-boolean v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->loaded:Z
  :L2
  .line 251
    sub-int v3, p3, v1
    iget v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segLen:I
    iget v5, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    sub-int/2addr v4, v5
    invoke-static { v3, v4 }, Ljava/lang/Math;->min(II)I
    move-result v3
    iget v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->winAt:I
    iget v5, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->winLen:I
    add-int/2addr v4, v5
    sub-int/2addr v4, v2
    invoke-static { v3, v4 }, Ljava/lang/Math;->min(II)I
    move-result v3
  .line 252
    iget-object v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->buf:[B
    iget v5, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->winAt:I
    sub-int/2addr v2, v5
    add-int v5, p2, v1
    invoke-static { v4, v2, p1, v5, v3 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 253
    iget v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    add-int/2addr v2, v3
    iput v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
  .line 254
    add-int/2addr v1, v3
  .line 255
    goto :L0
  :L3
  .line 244
    new-instance p1, Ljava/io/IOException;
    const-string p2, "short page"
    invoke-direct { p1, p2 }, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    throw p1
  :L4
  .line 256
    return v1
.end method

.method skip(J)Z
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 6
  .line 260
    nop
  :L0
    const-wide/16 v0, 0
    cmp-long v2, p1, v0
    if-lez v2, :L1
    invoke-direct { p0 }, Lcom/innioasis/ipp/Vorbis$Ogg;->more()Z
    move-result v2
    if-eqz v2, :L1
  .line 261
    iget v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segLen:I
    iget v1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    sub-int/2addr v0, v1
    int-to-long v0, v0
    invoke-static { p1, p2, v0, v1 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v0
    long-to-int v1, v0
  .line 262
    iget v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    add-int/2addr v0, v1
    iput v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
  .line 263
    int-to-long v0, v1
    sub-long/2addr p1, v0
  .line 264
    goto :L0
  :L1
  .line 265
    cmp-long v2, p1, v0
    if-nez v2, :L2
    const/4 p1, 1
    goto :L3
  :L2
    const/4 p1, 0
  :L3
    return p1
.end method

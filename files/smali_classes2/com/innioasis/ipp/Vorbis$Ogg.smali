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

.method constructor <init>(Ljava/io/RandomAccessFile;)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 4
  .line 170
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 154
    const/16 v0, 27
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->ph:[B
  .line 155
    const/16 v0, 255
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->seg:[B
  .line 160
    const v0, 65025
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->buf:[B
  .line 171
    iput-object p1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
  .line 172
    invoke-virtual { p1 }, Ljava/io/RandomAccessFile;->length()J
    move-result-wide v0
    iput-wide v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->len:J
  .line 173
    return-void
.end method

.method private more()Z
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 6
  .line 206
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
  .line 222
    return v1
  :L2
  .line 207
    const/4 v2, 0
    if-eqz v0, :L3
    iget-boolean v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->packetEnd:Z
    if-eqz v0, :L3
    return v2
  :L3
  .line 208
    iget v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->si:I
    iget v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->nseg:I
    if-lt v0, v3, :L4
  .line 209
    invoke-direct { p0 }, Lcom/innioasis/ipp/Vorbis$Ogg;->page()Z
    move-result v0
    if-nez v0, :L3
  .line 210
    iput-boolean v1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->eof:Z
  .line 211
    return v2
  :L4
  .line 214
    iget-object v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->seg:[B
    add-int/lit8 v4, v0, 1
    iput v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->si:I
    aget-byte v0, v3, v0
    const/16 v3, 255
    and-int/2addr v0, v3
  .line 215
    iget v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->off:I
    iput v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segStart:I
  .line 216
    add-int/2addr v4, v0
    iput v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->off:I
  .line 217
    iput v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segLen:I
  .line 218
    iput v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
  .line 219
    if-ge v0, v3, :L5
    const/4 v2, 1
  :L5
    iput-boolean v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->packetEnd:Z
  .line 220
    iput-boolean v1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->started:Z
  .line 221
    goto :L0
.end method

.method private page()Z
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 12
  .line 177
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
  .line 178
    iget-object v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
    invoke-virtual { v4, v0, v1 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 179
    iget-object v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
    iget-object v1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->ph:[B
    invoke-virtual { v0, v1 }, Ljava/io/RandomAccessFile;->readFully([B)V
  .line 180
    iget-object v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->ph:[B
    aget-byte v1, v0, v8
    const/16 v4, 79
    if-ne v1, v4, :L6
    const/4 v1, 1
    aget-byte v4, v0, v1
    const/16 v5, 103
    if-ne v4, v5, :L6
    const/4 v4, 2
    aget-byte v4, v0, v4
    if-ne v4, v5, :L6
    const/4 v4, 3
    aget-byte v4, v0, v4
    const/16 v5, 83
    if-ne v4, v5, :L6
  .line 183
    const/16 v4, 14
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Vorbis;->access$100([BI)I
    move-result v0
  .line 184
    iget-object v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->ph:[B
    const/16 v5, 26
    aget-byte v4, v4, v5
    and-int/lit16 v4, v4, 255
  .line 185
    iget-object v5, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
    iget-object v6, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->seg:[B
    invoke-virtual { v5, v6, v8, v4 }, Ljava/io/RandomAccessFile;->readFully([BII)V
  .line 186
    nop
  .line 187
    const/4 v5, 0
    const/4 v6, 0
  :L2
    if-ge v5, v4, :L3
    iget-object v7, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->seg:[B
    aget-byte v7, v7, v5
    and-int/lit16 v7, v7, 255
    add-int/2addr v6, v7
    add-int/lit8 v5, v5, 1
    goto :L2
  :L3
  .line 188
    iget-wide v9, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->next:J
    add-long/2addr v9, v2
    int-to-long v2, v4
    add-long/2addr v9, v2
    iput-wide v9, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->body:J
  .line 189
    int-to-long v2, v6
    add-long/2addr v9, v2
    iput-wide v9, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->next:J
  .line 190
    iget-boolean v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->any:Z
    if-nez v2, :L4
  .line 191
    iput v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->serial:I
  .line 192
    iput-boolean v1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->any:Z
  :L4
  .line 194
    iget v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->serial:I
    if-eq v0, v2, :L5
    goto :L0
  :L5
  .line 195
    iput v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->nseg:I
  .line 196
    iput v8, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->si:I
  .line 197
    iput v8, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->off:I
  .line 198
    iput v6, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->bodyLen:I
  .line 199
    iput-boolean v8, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->loaded:Z
  .line 200
    return v1
  :L6
  .line 181
    new-instance v0, Ljava/io/IOException;
    const-string v1, "not an Ogg page"
    invoke-direct { v0, v1 }, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    goto :L8
  :L7
    throw v0
  :L8
    goto :L7
.end method

.method nextPacket()V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 2
  .line 252
    nop
  :L0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Vorbis$Ogg;->more()Z
    move-result v0
    if-eqz v0, :L1
    iget v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segLen:I
    iput v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    goto :L0
  :L1
  .line 253
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->started:Z
  .line 254
    return-void
.end method

.method read([BII)I
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 13
  .line 226
    const/4 v0, 0
    const/4 v1, 0
  :L0
  .line 227
    if-ge v1, p3, :L3
    invoke-direct { p0 }, Lcom/innioasis/ipp/Vorbis$Ogg;->more()Z
    move-result v2
    if-eqz v2, :L3
  .line 228
    iget-boolean v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->loaded:Z
    if-nez v2, :L2
  .line 229
    iget-wide v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->body:J
    iget v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->bodyLen:I
    int-to-long v4, v4
    add-long/2addr v4, v2
    iget-wide v6, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->len:J
    cmp-long v8, v4, v6
    if-gtz v8, :L1
  .line 230
    iget-object v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
    invoke-virtual { v4, v2, v3 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 231
    iget-object v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->f:Ljava/io/RandomAccessFile;
    iget-object v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->buf:[B
    iget v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->bodyLen:I
    invoke-virtual { v2, v3, v0, v4 }, Ljava/io/RandomAccessFile;->readFully([BII)V
  .line 232
    const/4 v2, 1
    iput-boolean v2, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->loaded:Z
    goto :L2
  :L1
  .line 229
    new-instance p1, Ljava/io/IOException;
    const-string p2, "short page"
    invoke-direct { p1, p2 }, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    throw p1
  :L2
  .line 234
    sub-int v2, p3, v1
    iget v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segLen:I
    iget v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    sub-int/2addr v3, v4
    invoke-static { v2, v3 }, Ljava/lang/Math;->min(II)I
    move-result v2
  .line 235
    iget-object v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->buf:[B
    iget v4, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segStart:I
    iget v5, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    add-int/2addr v4, v5
    add-int v5, p2, v1
    invoke-static { v3, v4, p1, v5, v2 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 236
    iget v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    add-int/2addr v3, v2
    iput v3, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
  .line 237
    add-int/2addr v1, v2
  .line 238
    goto :L0
  :L3
  .line 239
    return v1
.end method

.method skip(J)Z
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 6
  .line 243
    nop
  :L0
    const-wide/16 v0, 0
    cmp-long v2, p1, v0
    if-lez v2, :L1
    invoke-direct { p0 }, Lcom/innioasis/ipp/Vorbis$Ogg;->more()Z
    move-result v2
    if-eqz v2, :L1
  .line 244
    iget v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segLen:I
    iget v1, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    sub-int/2addr v0, v1
    int-to-long v0, v0
    invoke-static { p1, p2, v0, v1 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v0
    long-to-int v1, v0
  .line 245
    iget v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
    add-int/2addr v0, v1
    iput v0, p0, Lcom/innioasis/ipp/Vorbis$Ogg;->segAt:I
  .line 246
    int-to-long v0, v1
    sub-long/2addr p1, v0
  .line 247
    goto :L0
  :L1
  .line 248
    cmp-long v2, p1, v0
    if-nez v2, :L2
    const/4 p1, 1
    goto :L3
  :L2
    const/4 p1, 0
  :L3
    return p1
.end method

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

.field private final static READER:I = 2

.field private static volatile genres:[Ljava/lang/String;

.method private constructor <init>()V
  .registers 1
  .line 23
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static art(Ljava/lang/String;)[B
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L7
  .registers 4
  .line 179
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 180
    const/4 v1, 1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Meta;->own(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v1
  .line 181
    if-eqz v1, :L1
    iget-boolean v2, v1, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    if-eqz v2, :L1
    iget-object p0, v1, Lcom/innioasis/ipp/Meta$Info;->art:[B
    return-object p0
  :L1
  .line 182
    nop
  .line 183
    new-instance v1, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v1 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  :L2
  .line 185
    invoke-virtual { v1, p0 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 186
    invoke-virtual { v1 }, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B
    move-result-object v0
  :L3
  .line 188
    goto :L5
  :L4
  .line 187
    move-exception v2
  :L5
  .line 190
    invoke-virtual { v1 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L6
  .line 192
    goto :L8
  :L7
  .line 191
    move-exception v1
  :L8
  .line 193
    if-eqz v0, :L9
    array-length v1, v0
    if-lez v1, :L9
    goto :L10
  :L9
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->tagArt(Ljava/lang/String;)[B
    move-result-object v0
  :L10
    return-object v0
.end method

.method private static ascii([BII)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 614
    new-instance v0, Ljava/lang/String;
    const-string v1, "ISO-8859-1"
    invoke-direct { v0, p0, p1, p2, v1 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
  :L1
    return-object v0
  :L2
  .line 615
    move-exception p0
  .line 616
    const-string p0, ""
    return-object p0
.end method

.method private static be32([BI)J
  .registers 9
  .line 626
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

.method public static blind(Ljava/lang/String;)Z
  .registers 2
  .line 168
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->ext(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 169
    if-eqz p0, :L1
    const-string v0, "opus"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L0
    const-string v0, "oga"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L0
    const-string v0, "m4b"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L1
  :L0
    const/4 p0, 1
    goto :L2
  :L1
    const/4 p0, 0
  :L2
    return p0
.end method

.method private static close(Ljava/io/RandomAccessFile;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 631
    if-nez p0, :L0
    return-void
  :L0
  .line 633
    invoke-virtual { p0 }, Ljava/io/RandomAccessFile;->close()V
  :L1
  .line 635
    goto :L3
  :L2
  .line 634
    move-exception p0
  :L3
  .line 636
    return-void
.end method

.method private static ext(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 158
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 159
    const/16 v1, 46
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 160
    if-gez v1, :L1
    goto :L2
  :L1
    add-int/lit8 v1, v1, 1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
  :L2
    return-object v0
.end method

.method private static extendedHeader(Ljava/io/RandomAccessFile;JI)J
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 6
  .line 507
    const/4 v0, 4
    new-array v1, v0, [B
  .line 508
    invoke-virtual { p0, p1, p2 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 509
    invoke-virtual { p0, v1 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result p0
    if-eq p0, v0, :L0
    const-wide/16 p0, 0
    return-wide p0
  :L0
  .line 511
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

.method private static fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)Z
  .registers 6
  .line 287
    iget-object v0, p1, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->stockValue(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 288
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->number(Ljava/lang/String;)Ljava/lang/Integer;
    move-result-object v1
  .line 289
    if-eqz v1, :L2
  .line 290
    invoke-static { }, Lcom/innioasis/ipp/Meta;->genreNames()[Ljava/lang/String;
    move-result-object v0
  .line 291
    if-eqz v0, :L1
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-ltz v2, :L1
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    array-length v3, v0
    if-lt v2, v3, :L0
    goto :L1
  :L0
  .line 292
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    aget-object v0, v0, v1
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->stockValue(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :L2
  :L1
  .line 291
    const/4 p0, 0
    return p0
  :L2
  .line 294
    invoke-static { }, Lcom/innioasis/y1/utils/HanziToPinyin;->getInstance()Lcom/innioasis/y1/utils/HanziToPinyin;
    move-result-object v1
  .line 295
    iget-object v2, p1, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->stockValue(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 296
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setSongName(Ljava/lang/String;)V
  .line 297
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setPinyinSongName(Ljava/lang/String;)V
  .line 298
    iget-object v2, p1, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->stockValue(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 299
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setAlbum(Ljava/lang/String;)V
  .line 300
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v2, v3 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/database/Song;->setLowAlbum(Ljava/lang/String;)V
  .line 301
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setPinyinAlbum(Ljava/lang/String;)V
  .line 302
    iget-object v2, p1, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->stockValue(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 303
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setArtist(Ljava/lang/String;)V
  .line 304
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setPinyinArtist(Ljava/lang/String;)V
  .line 305
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setGenre(Ljava/lang/String;)V
  .line 306
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setPinyinGenre(Ljava/lang/String;)V
  .line 307
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .line 308
    const/4 p0, 1
    return p0
.end method

.method public static fixSong(Lcom/innioasis/y1/database/Song;)V
  .registers 5
  .line 217
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 218
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->fixSongBody(Lcom/innioasis/y1/database/Song;)V
  .line 219
    if-eqz p0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->blind(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L0
  .line 220
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "blind "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->ext(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
    sub-long/2addr v2, v0
    const/4 v0, 1
    invoke-static { p0, v2, v3, v0 }, Lcom/innioasis/ipp/ScanProbe;->own(Ljava/lang/String;JZ)V
  :L0
  .line 222
    return-void
.end method

.method private static fixSongBody(Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  .line 225
    if-nez p0, :L0
    return-void
  :L0
  .line 227
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 228
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->blind(Ljava/lang/String;)Z
    move-result v1
  .line 229
    if-nez v1, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L1
    return-void
  :L1
  .line 231
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->info(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v2
  .line 232
    const/4 v3, 0
    if-eqz v1, :L2
  .line 233
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->ext(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static { v1, v0, v2, v3 }, Lcom/innioasis/ipp/Meta;->ownInto(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result v0
    if-nez v0, :L3
    return-void
  :L2
  .line 235
    invoke-static { v0, v2, v3 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  :L3
  .line 237
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .line 238
    invoke-static { }, Lcom/innioasis/y1/utils/HanziToPinyin;->getInstance()Lcom/innioasis/y1/utils/HanziToPinyin;
    move-result-object v0
  .line 240
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    if-eqz v1, :L4
  .line 241
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setSongName(Ljava/lang/String;)V
  .line 242
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setPinyinSongName(Ljava/lang/String;)V
  :L4
  .line 244
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    if-eqz v1, :L5
  .line 245
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setAlbum(Ljava/lang/String;)V
  .line 246
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v1, v3 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setLowAlbum(Ljava/lang/String;)V
  .line 247
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setPinyinAlbum(Ljava/lang/String;)V
  :L5
  .line 249
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    if-eqz v1, :L6
  .line 250
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setArtist(Ljava/lang/String;)V
  .line 251
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setPinyinArtist(Ljava/lang/String;)V
  :L6
  .line 253
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    if-eqz v1, :L7
  .line 254
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setGenre(Ljava/lang/String;)V
  .line 255
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setPinyinGenre(Ljava/lang/String;)V
  :L7
  .line 258
    goto :L9
  :L8
  .line 257
    move-exception p0
  :L9
  .line 259
    return-void
.end method

.method private static frameLen([BI)J
  .registers 8
  .line 500
    const/4 v0, 2
    const/4 v1, 4
    if-ne p1, v0, :L0
  .line 501
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
  .line 503
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

.method private static genreNames()[Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 340
    sget-object v0, Lcom/innioasis/ipp/Meta;->genres:[Ljava/lang/String;
  .line 341
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 343
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 344
    const-class v1, Lcom/innioasis/y1/database/Y1Repository;
    const-string v2, "STANDARD_GENRES"
    invoke-virtual { v1, v2 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 345
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 346
    invoke-virtual { v1, v0 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [Ljava/lang/String;
  .line 347
    sput-object v0, Lcom/innioasis/ipp/Meta;->genres:[Ljava/lang/String;
  :L1
  .line 350
    goto :L3
  :L2
  .line 348
    move-exception v0
  .line 349
    const/4 v0, 0
  :L3
  .line 351
    return-object v0
.end method

.method private static id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .catchall { :L0 .. :L1 } :L46
  .catchall { :L2 .. :L3 } :L45
  .catchall { :L4 .. :L17 } :L45
  .catchall { :L19 .. :L40 } :L41
  .registers 25
  .line 401
    move-object/from16 v0, p1
  .line 402
    nop
  .line 404
    const/4 v1, 0
    const/4 v2, 0
  :L0
    new-instance v3, Ljava/io/RandomAccessFile;
    const-string v4, "r"
    move-object/from16 v5, p0
    invoke-direct { v3, v5, v4 }, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  :L1
  .line 405
    const/16 v4, 10
  :L2
    new-array v5, v4, [B
  .line 406
    invoke-virtual { v3, v5 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v6
  :L3
    if-eq v6, v4, :L4
  .line 459
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 406
    return v1
  :L4
  .line 407
    aget-byte v6, v5, v1
    const/16 v7, 73
    if-ne v6, v7, :L44
    const/4 v6, 1
    aget-byte v7, v5, v6
    const/16 v8, 68
    if-ne v7, v8, :L44
    const/4 v7, 2
    aget-byte v8, v5, v7
    const/16 v9, 51
    if-eq v8, v9, :L5
    goto/16 :L44
  :L5
  .line 409
    const/4 v8, 3
    aget-byte v9, v5, v8
    and-int/lit16 v9, v9, 255
  .line 410
    if-lt v9, v7, :L43
    const/4 v10, 4
    if-le v9, v10, :L6
    goto/16 :L43
  :L6
  .line 411
    const/4 v11, 5
    aget-byte v11, v5, v11
    and-int/lit16 v11, v11, 255
  .line 412
    and-int/lit16 v12, v11, 128
    if-eqz v12, :L7
    const/4 v12, 1
    goto :L8
  :L7
    const/4 v12, 0
  :L8
  .line 413
    const/4 v13, 6
    invoke-static { v5, v13 }, Lcom/innioasis/ipp/Meta;->syncsafe([BI)J
    move-result-wide v14
    const-wide/16 v4, 10
    add-long/2addr v14, v4
  .line 415
    nop
  .line 416
    and-int/lit8 v11, v11, 64
    if-eqz v11, :L9
    invoke-static { v3, v4, v5, v9 }, Lcom/innioasis/ipp/Meta;->extendedHeader(Ljava/io/RandomAccessFile;JI)J
    move-result-wide v16
    add-long v4, v16, v4
  :L9
  .line 418
    if-ne v9, v7, :L10
    goto :L11
  :L10
    const/4 v8, 4
  :L11
  .line 419
    if-ne v9, v7, :L12
    goto :L13
  :L12
    const/16 v13, 10
  :L13
  .line 420
    new-array v7, v13, [B
  .line 421
    nop
  .line 424
    nop
  :L14
  .line 425
    int-to-long v10, v13
    add-long/2addr v10, v4
    cmp-long v16, v10, v14
    if-gtz v16, :L37
  .line 426
    invoke-virtual { v3, v4, v5 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 427
    invoke-virtual { v3, v7 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v4
    if-eq v4, v13, :L15
    move-object v1, v2
    const/4 v6, 0
    goto/16 :L39
  :L15
  .line 428
    aget-byte v4, v7, v1
    if-nez v4, :L16
    move-object v1, v2
    goto/16 :L38
  :L16
  .line 429
    invoke-static { v7, v1, v8 }, Lcom/innioasis/ipp/Meta;->ascii([BII)Ljava/lang/String;
    move-result-object v4
  .line 430
    invoke-static { v4 }, Lcom/innioasis/ipp/Meta;->isFrameId(Ljava/lang/String;)Z
    move-result v5
  :L17
    if-nez v5, :L18
    move-object v1, v2
    const/4 v6, 0
    goto/16 :L39
  :L18
  .line 432
    move-object/from16 p0, v2
  :L19
    invoke-static { v7, v9 }, Lcom/innioasis/ipp/Meta;->frameLen([BI)J
    move-result-wide v1
  .line 433
    const-wide/16 v16, 0
    cmp-long v18, v1, v16
    if-ltz v18, :L35
    add-long v16, v10, v1
    cmp-long v18, v16, v14
    if-lez v18, :L20
    move-object/from16 v1, p0
    goto/16 :L36
  :L20
  .line 434
    nop
  .line 435
    nop
  .line 437
    const-string v5, "APIC"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L22
    const-string v5, "PIC"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L21
    goto :L22
  :L21
    const/4 v5, 0
    goto :L23
  :L22
    const/4 v5, 1
  :L23
  .line 438
    if-eqz v5, :L25
    if-eqz p2, :L24
    const-wide/32 v19, 8388608
    cmp-long v21, v1, v19
    if-lez v21, :L25
  :L24
    move-object/from16 v1, p0
    move-object/from16 v20, v7
    goto/16 :L34
  :L25
  .line 439
    if-nez v5, :L27
    const-wide/16 v19, 1
    cmp-long v21, v1, v19
    if-ltz v21, :L26
    const-wide/32 v19, 65536
    cmp-long v21, v1, v19
    if-lez v21, :L27
  :L26
    move-object/from16 v1, p0
    move-object/from16 v20, v7
    goto :L34
  :L27
  .line 440
    if-nez v5, :L28
    invoke-static { v4 }, Lcom/innioasis/ipp/Meta;->wanted(Ljava/lang/String;)Z
    move-result v19
    if-nez v19, :L28
    move-object/from16 v1, p0
    move-object/from16 v20, v7
    goto :L34
  :L28
  .line 442
    invoke-virtual { v3, v10, v11 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 443
    long-to-int v10, v1
    new-array v10, v10, [B
  .line 444
    invoke-virtual { v3, v10 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v11
    move-object/from16 v20, v7
    int-to-long v6, v11
    cmp-long v11, v6, v1
    if-eqz v11, :L29
    const/4 v6, 0
    move-object/from16 v1, p0
    goto :L39
  :L29
  .line 445
    if-eqz v12, :L30
    invoke-static { v10 }, Lcom/innioasis/ipp/Meta;->resync([B)[B
    move-result-object v10
  :L30
  .line 447
    if-eqz v5, :L33
  .line 449
    invoke-static { v10, v9 }, Lcom/innioasis/ipp/Meta;->picture([BI)Lcom/innioasis/ipp/Meta$Pic;
    move-result-object v2
  .line 450
    if-eqz v2, :L32
    if-eqz p0, :L31
    iget-boolean v1, v2, Lcom/innioasis/ipp/Meta$Pic;->front:Z
    if-eqz v1, :L32
    move-object/from16 v1, p0
    iget-boolean v4, v1, Lcom/innioasis/ipp/Meta$Pic;->front:Z
    if-nez v4, :L34
  :L31
    move-wide/from16 v4, v16
    move-object/from16 v7, v20
    const/4 v1, 0
    const/4 v6, 1
    goto/16 :L14
  :L32
    move-object/from16 v1, p0
    goto :L34
  :L33
  .line 453
    move-object/from16 v1, p0
    invoke-static { v10 }, Lcom/innioasis/ipp/Meta;->text([B)Ljava/lang/String;
    move-result-object v2
    invoke-static { v0, v4, v2 }, Lcom/innioasis/ipp/Meta;->put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  .line 454
    nop
  :L34
  .line 425
    move-object v2, v1
    move-wide/from16 v4, v16
    move-object/from16 v7, v20
    const/4 v1, 0
    const/4 v6, 1
    goto/16 :L14
  :L35
  .line 433
    move-object/from16 v1, p0
  :L36
    const/4 v6, 0
    goto :L39
  :L37
  .line 425
    move-object v1, v2
  :L38
  .line 455
    const/4 v6, 1
  :L39
    if-eqz v1, :L42
    iget-object v1, v1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L40
    goto :L42
  :L41
  .line 456
    move-exception v0
    move-object v2, v3
    const/4 v1, 0
    goto :L47
  :L42
  .line 459
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 460
    move v1, v6
    goto :L48
  :L43
  .line 459
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 410
    const/4 v1, 0
    return v1
  :L44
  .line 459
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 407
    const/4 v1, 0
    return v1
  :L45
  .line 456
    move-exception v0
    move-object v2, v3
    goto :L47
  :L46
    move-exception v0
  :L47
  .line 457
    nop
  .line 459
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 460
    nop
  :L48
  .line 461
    return v1
.end method

.method private static isFrameId(Ljava/lang/String;)Z
  .registers 5
  .line 605
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    if-ge v1, v2, :L4
  .line 606
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v2
  .line 607
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
  .line 605
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 607
    return v0
  :L4
  .line 609
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    if-lez p0, :L5
    const/4 v0, 1
  :L5
    return v0
.end method

.method public static libraryRead(Landroid/content/Context;)Z
  .registers 3
  .line 64
    const/4 v0, 0
    if-eqz p0, :L0
    const-string v1, "meta_v"
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p0
    const/4 v1, 2
    if-lt p0, v1, :L0
    const/4 v0, 1
  :L0
    return v0
.end method

.method public static noteLibraryRead(Landroid/content/Context;)V
  .registers 3
  .line 69
    if-nez p0, :L0
    return-void
  :L0
  .line 70
    const-string v0, "meta_v"
    const/4 v1, 2
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 71
    return-void
.end method

.method private static number(Ljava/lang/String;)Ljava/lang/Integer;
  .catchall { :L0 .. :L10 } :L11
  .registers 8
  .line 324
    nop
  .line 325
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    const/16 v2, 43
    const/4 v3, 1
    const/4 v4, 0
    if-lez v1, :L2
    invoke-virtual { p0, v4 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    const/16 v5, 45
    if-eq v1, v5, :L1
    invoke-virtual { p0, v4 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    if-ne v1, v2, :L2
  :L1
    const/4 v1, 1
    goto :L3
  :L2
  .line 326
    const/4 v1, 0
  :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v5
    if-lt v1, v5, :L4
    return-object v0
  :L4
  .line 327
    nop
  :L5
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v5
    if-ge v1, v5, :L8
  .line 328
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    const/16 v6, 48
    if-lt v5, v6, :L7
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    const/16 v6, 57
    if-le v5, v6, :L6
    goto :L7
  :L6
  .line 327
    add-int/lit8 v1, v1, 1
    goto :L5
  :L7
  .line 328
    return-object v0
  :L8
  .line 330
    invoke-virtual { p0, v4 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    if-ne v1, v2, :L9
    invoke-virtual { p0, v3 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  :L9
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    move-result-object p0
  :L10
    return-object p0
  :L11
  .line 331
    move-exception p0
  .line 332
    return-object v0
.end method

.method public static oversized(Ljava/lang/String;)Z
  .catchall { :L3 .. :L4 } :L13
  .catchall { :L5 .. :L6 } :L12
  .catchall { :L7 .. :L9 } :L12
  .registers 9
  .line 374
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 375
    const/16 v1, 46
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 376
    if-gez v1, :L1
    return v0
  :L1
  .line 377
    const/4 v2, 1
    add-int/2addr v1, v2
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v1
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v1, v3 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1
  .line 378
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
  .line 379
    return v0
  :L2
  .line 381
    nop
  .line 383
    const/4 v1, 0
  :L3
    new-instance v3, Ljava/io/RandomAccessFile;
    const-string v4, "r"
    invoke-direct { v3, p0, v4 }, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  :L4
  .line 384
    const/16 p0, 10
  :L5
    new-array v1, p0, [B
  .line 385
    invoke-virtual { v3, v1 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v4
  :L6
    if-eq v4, p0, :L7
  .line 391
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 385
    return v0
  :L7
  .line 386
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
  .line 387
    const/4 p0, 6
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Meta;->syncsafe([BI)J
    move-result-wide v4
  :L9
    const-wide/32 v6, 3080192
    cmp-long p0, v4, v6
    if-ltz p0, :L10
    const/4 v0, 1
  :L10
  .line 391
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 387
    return v0
  :L11
  .line 391
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 386
    return v0
  :L12
  .line 388
    move-exception p0
    move-object v1, v3
    goto :L14
  :L13
    move-exception p0
  :L14
  .line 389
    nop
  .line 391
    invoke-static { v1 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 389
    return v0
.end method

.method public static own(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
  .registers 7
  .line 126
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->ext(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 127
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 128
    new-instance v2, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 129
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v3
  .line 130
    invoke-static { v0, p0, v2, p1 }, Lcom/innioasis/ipp/Meta;->ownInto(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result p0
    if-nez p0, :L2
  .line 131
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->readable(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L1
    return-object v1
  :L1
  .line 132
    const/4 p0, 0
    iput-boolean p0, v2, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    goto :L3
  :L2
  .line 134
    const/4 p0, 1
    iput-boolean p0, v2, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  .line 135
    iput-boolean p0, v2, Lcom/innioasis/ipp/Meta$Info;->ours:Z
  :L3
  .line 137
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide p0
    sub-long/2addr p0, v3
    iput-wide p0, v2, Lcom/innioasis/ipp/Meta$Info;->openNs:J
  .line 138
    return-object v2
.end method

.method private static ownInto(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .registers 5
  .line 148
    const-string v0, "mp3"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result p0
    return p0
  :L0
  .line 149
    const-string v0, "flac"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Vorbis;->flac(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result p0
    return p0
  :L1
  .line 150
    const-string v0, "ogg"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L5
    const-string v0, "oga"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L5
    const-string v0, "opus"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    goto :L5
  :L2
  .line 151
    const-string v0, "m4a"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L4
    const-string v0, "m4b"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L4
    const-string v0, "m4r"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L4
    const-string v0, "mp4"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L3
    goto :L4
  :L3
  .line 154
    const/4 p0, 0
    return p0
  :L4
  .line 152
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Mp4;->read(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result p0
    return p0
  :L5
  .line 150
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Vorbis;->ogg(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result p0
    return p0
.end method

.method private static picture([BI)Lcom/innioasis/ipp/Meta$Pic;
  .registers 10
  .line 519
    array-length v0, p0
    const/4 v1, 0
    const/4 v2, 4
    if-ge v0, v2, :L0
    return-object v1
  :L0
  .line 520
    const/4 v0, 0
    aget-byte v3, p0, v0
    and-int/lit16 v3, v3, 255
  .line 521
    nop
  .line 522
    const/4 v4, 2
    const/4 v5, 1
    if-ne p1, v4, :L1
  .line 523
    goto :L4
  :L1
  .line 522
    const/4 p1, 1
  :L2
  .line 525
    array-length v2, p0
    if-ge p1, v2, :L3
    aget-byte v2, p0, p1
    if-eqz v2, :L3
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 526
    add-int/lit8 v2, p1, 1
  :L4
  .line 528
    array-length p1, p0
    if-lt v2, p1, :L5
    return-object v1
  :L5
  .line 529
    new-instance p1, Lcom/innioasis/ipp/Meta$Pic;
    invoke-direct { p1, v1 }, Lcom/innioasis/ipp/Meta$Pic;-><init>(Lcom/innioasis/ipp/Meta$1;)V
  .line 530
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
  .line 531
    add-int/2addr v2, v5
  .line 532
    if-eq v3, v5, :L9
    if-ne v3, v4, :L8
    goto :L9
  :L8
    const/4 v3, 0
    goto :L10
  :L9
    const/4 v3, 1
  :L10
  .line 533
    if-eqz v3, :L14
  :L11
  .line 534
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
  .line 535
    add-int/2addr v2, v4
    goto :L16
  :L14
  .line 537
    array-length v3, p0
    if-ge v2, v3, :L15
    aget-byte v3, p0, v2
    if-eqz v3, :L15
    add-int/lit8 v2, v2, 1
    goto :L14
  :L15
  .line 538
    add-int/2addr v2, v5
  :L16
  .line 540
    array-length v3, p0
    if-lt v2, v3, :L17
    return-object v1
  :L17
  .line 541
    array-length v1, p0
    sub-int/2addr v1, v2
    new-array v1, v1, [B
    iput-object v1, p1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
  .line 542
    iget-object v1, p1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
    iget-object v3, p1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
    array-length v3, v3
    invoke-static { p0, v2, v1, v0, v3 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 543
    return-object p1
.end method

.method private static put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 483
    if-eqz p2, :L19
    invoke-virtual { p2 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto/16 :L19
  :L0
  .line 484
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
  .line 485
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
  .line 486
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
  .line 487
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
  .line 488
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
  .line 489
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
  .line 490
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
  .line 491
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
  .line 492
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
  .line 491
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
    goto :L18
  :L11
  .line 490
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
    goto :L18
  :L12
  .line 489
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    goto :L18
  :L13
  .line 488
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    goto :L18
  :L14
  .line 487
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    goto :L18
  :L15
  .line 486
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
    goto :L18
  :L16
  .line 485
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    goto :L18
  :L17
  .line 484
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
  :L18
  .line 493
    return-void
  :L19
  .line 483
    return-void
.end method

.method public static read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
  .catchall { :L2 .. :L4 } :L5
  .catchall { :L6 .. :L7 } :L8
  .registers 11
  .line 79
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Meta;->own(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v0
  .line 80
    if-eqz v0, :L0
    iget-boolean v1, v0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    if-eqz v1, :L0
    return-object v0
  :L0
  .line 82
    new-instance v0, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 83
    if-nez p0, :L1
    return-object v0
  :L1
  .line 85
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
  .line 86
    new-instance v3, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v3 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  .line 88
    const/4 v4, 1
  :L2
    invoke-virtual { v3, p0 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 89
    const/4 v5, 7
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
  .line 90
    const/4 v5, 2
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
  .line 91
    const/16 v5, 13
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 92
    invoke-virtual { v3, v4 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
  .line 93
    const/4 v5, 6
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
  .line 94
    const/4 v5, 0
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
  .line 95
    const/16 v5, 14
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
  .line 96
    const/16 v5, 8
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
  .line 97
    const/4 v5, 5
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
  .line 98
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
  .line 99
    if-eqz p1, :L3
    invoke-virtual { v3 }, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B
    move-result-object v7
    iput-object v7, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L3
  .line 100
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
    sub-long/2addr v7, v5
    iput-wide v7, v0, Lcom/innioasis/ipp/Meta$Info;->artNs:J
  .line 101
    iput-boolean v4, v0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  :L4
  .line 103
    goto :L6
  :L5
  .line 102
    move-exception v5
  :L6
  .line 105
    invoke-virtual { v3 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L7
  .line 107
    goto :L9
  :L8
  .line 106
    move-exception v3
  :L9
  .line 109
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result v3
  .line 110
    if-eqz v3, :L10
  .line 111
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .line 112
    iput-boolean v4, v0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  :L10
  .line 114
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide p0
    sub-long/2addr p0, v1
    iget-wide v1, v0, Lcom/innioasis/ipp/Meta$Info;->artNs:J
    sub-long/2addr p0, v1
    iput-wide p0, v0, Lcom/innioasis/ipp/Meta$Info;->openNs:J
  .line 115
    return-object v0
.end method

.method private static readable(Ljava/lang/String;)Z
  .registers 2
  .line 142
    const-string v0, "mp3"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "flac"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "ogg"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "oga"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 143
    const-string v0, "opus"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "m4a"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "m4b"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "m4r"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 144
    const-string v0, "mp4"
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
  .line 142
    return p0
.end method

.method public static reread(Ljava/lang/String;)Z
  .registers 2
  .line 174
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->blind(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method private static resync([B)[B
  .registers 7
  .line 589
    nop
  .line 590
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, p0
    const/16 v4, 255
    if-ge v1, v3, :L3
  .line 591
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
  .line 592
    add-int/lit8 v2, v2, 1
  :L2
  .line 590
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 594
    array-length v1, p0
    if-ne v2, v1, :L4
    return-object p0
  :L4
  .line 595
    new-array v1, v2, [B
  .line 596
    nop
  .line 597
    const/4 v2, 0
  :L5
    array-length v3, p0
    if-ge v0, v3, :L8
  .line 598
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
  .line 599
    add-int/lit8 v3, v2, 1
    aget-byte v5, p0, v0
    aput-byte v5, v1, v2
    move v2, v3
  :L7
  .line 597
    add-int/lit8 v0, v0, 1
    goto :L5
  :L8
  .line 601
    return-object v1
.end method

.method public static scanOwn(Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L1 .. :L3 } :L4
  .registers 8
  .line 267
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 268
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
  .line 269
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  .line 270
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->ext(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 271
    nop
  .line 273
    if-eqz v4, :L5
  :L1
    const-string v5, "mp3"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L2
    const-string v5, "flac"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L2
    const-string v5, "ogg"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L2
    const-string v5, "m4a"
  .line 274
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L2
    const-string v5, "m4r"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L5
  :L2
  .line 275
    new-instance v5, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v5 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 276
    invoke-static { v4, v3, v5, v0 }, Lcom/innioasis/ipp/Meta;->ownInto(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result v3
    if-eqz v3, :L5
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/Meta;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)Z
    move-result v0
  :L3
    goto :L5
  :L4
  .line 278
    move-exception p0
  .line 279
    goto :L6
  :L5
  .line 280
    nop
  :L6
  .line 281
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
    sub-long/2addr v5, v1
    invoke-static { v4, v5, v6, v0 }, Lcom/innioasis/ipp/ScanProbe;->own(Ljava/lang/String;JZ)V
  .line 282
    return v0
.end method

.method public static scanned(Landroid/media/MediaMetadataRetriever;Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 359
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 361
    new-instance v0, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 362
    const/16 v1, 13
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 363
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
  .line 364
    const/16 v1, 14
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
  .line 365
    const/16 v1, 8
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
  .line 366
    const/4 v1, 5
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object p0
    iput-object p0, v0, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
  .line 367
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  :L1
  .line 369
    goto :L3
  :L2
  .line 368
    move-exception p0
  :L3
  .line 370
    return-void
  :L4
  .line 359
    return-void
.end method

.method private static stockValue(Ljava/lang/String;)Ljava/lang/String;
  .registers 5
  .line 313
    const-string v0, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    if-nez p0, :L0
    return-object v0
  :L0
  .line 314
    const/4 v1, 0
  :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    if-ge v1, v2, :L3
  .line 315
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v2
  .line 316
    invoke-static { v2 }, Ljava/lang/Character;->isWhitespace(C)Z
    move-result v3
    if-nez v3, :L2
    invoke-static { v2 }, Ljava/lang/Character;->isSpaceChar(C)Z
    move-result v2
    if-nez v2, :L2
    return-object p0
  :L2
  .line 314
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 318
    return-object v0
.end method

.method private static syncsafe([BI)J
  .registers 9
  .line 621
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
  .registers 4
  .line 201
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->blind(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L1
  .line 202
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Meta;->own(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object p0
  .line 203
    if-eqz p0, :L0
    iget-boolean v0, p0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    if-eqz v0, :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L0
    return-object v1
  :L1
  .line 205
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L2
    return-object v1
  :L2
  .line 206
    new-instance v0, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 207
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .line 208
    iget-object p0, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
    return-object p0
.end method

.method private static text([B)Ljava/lang/String;
  .catchall { :L10 .. :L11 } :L12
  .registers 10
  .line 548
    const/4 v0, 0
    aget-byte v1, p0, v0
    const/16 v2, 255
    and-int/2addr v1, v2
  .line 549
    nop
  .line 550
    array-length v3, p0
    const/4 v4, 1
    sub-int/2addr v3, v4
  .line 552
    const-string v5, "UTF-16BE"
    const/4 v6, 3
    const/4 v7, 2
    if-ne v1, v4, :L2
  .line 554
    const/16 v1, 254
    if-lt v3, v7, :L0
    aget-byte v8, p0, v4
    and-int/2addr v8, v2
    if-ne v8, v2, :L0
    aget-byte v8, p0, v7
    and-int/2addr v8, v2
    if-ne v8, v1, :L0
  .line 555
    nop
  .line 556
    nop
  .line 557
    add-int/lit8 v3, v3, -2
    const-string v5, "UTF-16LE"
    const/4 v4, 3
    goto :L5
  :L0
  .line 558
    if-lt v3, v7, :L1
    aget-byte v8, p0, v4
    and-int/2addr v8, v2
    if-ne v8, v1, :L1
    aget-byte v1, p0, v7
    and-int/2addr v1, v2
    if-ne v1, v2, :L1
  .line 559
    nop
  .line 560
    nop
  .line 561
    add-int/lit8 v3, v3, -2
    const/4 v4, 3
    goto :L5
  :L1
  .line 563
    goto :L5
  :L2
  .line 565
    if-ne v1, v7, :L3
  .line 566
    goto :L5
  :L3
  .line 567
    if-ne v1, v6, :L4
  .line 568
    const-string v5, "UTF-8"
    goto :L5
  :L4
  .line 570
    const-string v5, "ISO-8859-1"
  :L5
  .line 572
    const-string v1, "UTF-16"
    invoke-virtual { v5, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
  .line 573
    nop
  .line 574
    if-eqz v1, :L8
  :L6
  .line 575
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
  .line 577
    if-ge v0, v3, :L9
    add-int v1, v4, v0
    aget-byte v1, p0, v1
    if-eqz v1, :L9
    add-int/lit8 v0, v0, 1
    goto :L8
  :L9
  .line 579
    const/4 v1, 0
    if-gtz v0, :L10
    return-object v1
  :L10
  .line 581
    new-instance v2, Ljava/lang/String;
    invoke-direct { v2, p0, v4, v0, v5 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  :L11
    return-object p0
  :L12
  .line 582
    move-exception p0
  .line 583
    return-object v1
.end method

.method private static wanted(Ljava/lang/String;)Z
  .registers 2
  .line 471
    const-string v0, "TIT2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TT2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 472
    const-string v0, "TPE1"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TP1"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 473
    const-string v0, "TPE2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TP2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 474
    const-string v0, "TALB"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TAL"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 475
    const-string v0, "TCON"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TCO"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 476
    const-string v0, "TRCK"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TRK"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 477
    const-string v0, "TPOS"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TPA"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 478
    const-string v0, "TYER"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TYE"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 479
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
  .line 471
    return p0
.end method

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

.field private final static MAX_LYRICS:I = 262144

.field private final static MAX_TEXT:I = 65536

.field private final static READER:I = 2

.field private static volatile genres:[Ljava/lang/String;

.method private constructor <init>()V
  .registers 1
  .line 23
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static ascii([BII)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 729
    new-instance v0, Ljava/lang/String;
    const-string v1, "ISO-8859-1"
    invoke-direct { v0, p0, p1, p2, v1 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
  :L1
    return-object v0
  :L2
  .line 730
    move-exception p0
  .line 731
    const-string p0, ""
    return-object p0
.end method

.method private static be32([BI)J
  .registers 9
  .line 741
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
  .line 202
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->ext(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 203
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

.method private static charsetOf([BIII)Ljava/nio/charset/Charset;
  .registers 5
  .line 671
    const/4 v0, 3
    if-ne p3, v0, :L0
    const-string p0, "UTF-8"
    invoke-static { p0 }, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    move-result-object p0
    return-object p0
  :L0
  .line 672
    const/4 v0, 2
    if-ne p3, v0, :L1
    const-string p0, "UTF-16BE"
    invoke-static { p0 }, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    move-result-object p0
    return-object p0
  :L1
  .line 673
    const/4 v0, 1
    if-ne p3, v0, :L2
    const/4 p0, 0
    return-object p0
  :L2
  .line 674
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Lyrics;->guess([BII)Ljava/nio/charset/Charset;
    move-result-object p0
    return-object p0
.end method

.method private static close(Ljava/io/RandomAccessFile;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 746
    if-nez p0, :L0
    return-void
  :L0
  .line 748
    invoke-virtual { p0 }, Ljava/io/RandomAccessFile;->close()V
  :L1
  .line 750
    goto :L3
  :L2
  .line 749
    move-exception p0
  :L3
  .line 751
    return-void
.end method

.method private static decode([BIIILjava/nio/charset/Charset;)Ljava/lang/String;
  .catchall { :L4 .. :L5 } :L11
  .catchall { :L7 .. :L10 } :L11
  .registers 9
  .line 679
    const/4 v0, 2
    const/4 v1, 1
    if-eq p3, v1, :L1
    if-ne p3, v0, :L0
    goto :L1
  :L0
  .line 683
    if-le p2, p1, :L2
    add-int/lit8 v2, p2, -1
    aget-byte v2, p0, v2
    if-nez v2, :L2
    add-int/lit8 p2, p2, -1
    goto :L0
  :L1
  .line 681
    sub-int v2, p2, p1
    if-lt v2, v0, :L2
    add-int/lit8 v2, p2, -1
    aget-byte v2, p0, v2
    if-nez v2, :L2
    add-int/lit8 v2, p2, -2
    aget-byte v2, p0, v2
    if-nez v2, :L2
    add-int/lit8 p2, p2, -2
    goto :L1
  :L2
  .line 685
    const/4 v2, 0
    if-gt p2, p1, :L3
    return-object v2
  :L3
  .line 687
    if-ne p3, v1, :L9
  .line 688
    sub-int/2addr p2, p1
    const/16 p3, 254
    const/16 p4, 255
    if-lt p2, v0, :L6
  :L4
    aget-byte v1, p0, p1
    and-int/2addr v1, p4
    if-ne v1, p4, :L6
    add-int/lit8 v1, p1, 1
    aget-byte v1, p0, v1
    and-int/2addr v1, p4
    if-ne v1, p3, :L6
  .line 689
    new-instance p3, Ljava/lang/String;
    add-int/2addr p1, v0
    sub-int/2addr p2, v0
    const-string p4, "UTF-16LE"
    invoke-direct { p3, p0, p1, p2, p4 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
  :L5
    return-object p3
  :L6
  .line 691
    const-string v1, "UTF-16BE"
    if-lt p2, v0, :L8
  :L7
    aget-byte v3, p0, p1
    and-int/2addr v3, p4
    if-ne v3, p3, :L8
    add-int/lit8 p3, p1, 1
    aget-byte p3, p0, p3
    and-int/2addr p3, p4
    if-ne p3, p4, :L8
  .line 692
    new-instance p3, Ljava/lang/String;
    add-int/2addr p1, v0
    sub-int/2addr p2, v0
    invoke-direct { p3, p0, p1, p2, v1 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    return-object p3
  :L8
  .line 694
    new-instance p3, Ljava/lang/String;
    invoke-direct { p3, p0, p1, p2, v1 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    return-object p3
  :L9
  .line 696
    new-instance p3, Ljava/lang/String;
    sub-int/2addr p2, p1
    invoke-virtual { p4 }, Ljava/nio/charset/Charset;->name()Ljava/lang/String;
    move-result-object p4
    invoke-direct { p3, p0, p1, p2, p4 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
  :L10
    return-object p3
  :L11
  .line 697
    move-exception p0
  .line 698
    return-object v2
.end method

.method private static ext(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 192
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 193
    const/16 v1, 46
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 194
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
  .line 519
    const/4 v0, 4
    new-array v1, v0, [B
  .line 520
    invoke-virtual { p0, p1, p2 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 521
    invoke-virtual { p0, v1 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result p0
    if-eq p0, v0, :L0
    const-wide/16 p0, 0
    return-wide p0
  :L0
  .line 523
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
  .line 292
    iget-object v0, p1, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->stockValue(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 293
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->number(Ljava/lang/String;)Ljava/lang/Integer;
    move-result-object v1
  .line 294
    if-eqz v1, :L2
  .line 295
    invoke-static { }, Lcom/innioasis/ipp/Meta;->genreNames()[Ljava/lang/String;
    move-result-object v0
  .line 296
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
  .line 297
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    aget-object v0, v0, v1
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->stockValue(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :L2
  :L1
  .line 296
    const/4 p0, 0
    return p0
  :L2
  .line 299
    invoke-static { }, Lcom/innioasis/y1/utils/HanziToPinyin;->getInstance()Lcom/innioasis/y1/utils/HanziToPinyin;
    move-result-object v1
  .line 300
    iget-object v2, p1, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->stockValue(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 301
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setSongName(Ljava/lang/String;)V
  .line 302
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setPinyinSongName(Ljava/lang/String;)V
  .line 303
    iget-object v2, p1, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->stockValue(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 304
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setAlbum(Ljava/lang/String;)V
  .line 305
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v2, v3 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/database/Song;->setLowAlbum(Ljava/lang/String;)V
  .line 306
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Scan;->pinyin(Lcom/innioasis/y1/utils/HanziToPinyin;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setPinyinAlbum(Ljava/lang/String;)V
  .line 307
    iget-object v2, p1, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->stockValue(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 308
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setArtist(Ljava/lang/String;)V
  .line 309
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Scan;->pinyin(Lcom/innioasis/y1/utils/HanziToPinyin;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/database/Song;->setPinyinArtist(Ljava/lang/String;)V
  .line 310
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setGenre(Ljava/lang/String;)V
  .line 311
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scan;->pinyin(Lcom/innioasis/y1/utils/HanziToPinyin;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setPinyinGenre(Ljava/lang/String;)V
  .line 312
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .line 313
    const/4 p0, 1
    return p0
.end method

.method public static fixSong(Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  .line 232
    if-nez p0, :L0
    return-void
  :L0
  .line 234
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 235
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->blind(Ljava/lang/String;)Z
    move-result v1
  .line 236
    if-nez v1, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L1
    return-void
  :L1
  .line 238
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->info(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v2
  .line 239
    const/4 v3, 0
    if-eqz v1, :L2
  .line 240
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->ext(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static { v1, v0, v2, v3 }, Lcom/innioasis/ipp/Meta;->ownInto(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result v0
    if-nez v0, :L3
    return-void
  :L2
  .line 242
    invoke-static { v0, v2, v3 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  :L3
  .line 244
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .line 245
    invoke-static { }, Lcom/innioasis/y1/utils/HanziToPinyin;->getInstance()Lcom/innioasis/y1/utils/HanziToPinyin;
    move-result-object v0
  .line 247
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    if-eqz v1, :L4
  .line 248
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setSongName(Ljava/lang/String;)V
  .line 249
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setPinyinSongName(Ljava/lang/String;)V
  :L4
  .line 251
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    if-eqz v1, :L5
  .line 252
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setAlbum(Ljava/lang/String;)V
  .line 253
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v1, v3 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setLowAlbum(Ljava/lang/String;)V
  .line 254
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Scan;->pinyin(Lcom/innioasis/y1/utils/HanziToPinyin;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setPinyinAlbum(Ljava/lang/String;)V
  :L5
  .line 256
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    if-eqz v1, :L6
  .line 257
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setArtist(Ljava/lang/String;)V
  .line 258
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Scan;->pinyin(Lcom/innioasis/y1/utils/HanziToPinyin;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setPinyinArtist(Ljava/lang/String;)V
  :L6
  .line 260
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    if-eqz v1, :L7
  .line 261
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/database/Song;->setGenre(Ljava/lang/String;)V
  .line 262
    iget-object v1, v2, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Scan;->pinyin(Lcom/innioasis/y1/utils/HanziToPinyin;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setPinyinGenre(Ljava/lang/String;)V
  :L7
  .line 265
    goto :L9
  :L8
  .line 264
    move-exception p0
  :L9
  .line 266
    return-void
.end method

.method private static frameLen([BI)J
  .registers 8
  .line 512
    const/4 v0, 2
    const/4 v1, 4
    if-ne p1, v0, :L0
  .line 513
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
  .line 515
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
  .line 345
    sget-object v0, Lcom/innioasis/ipp/Meta;->genres:[Ljava/lang/String;
  .line 346
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 348
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 349
    const-class v1, Lcom/innioasis/y1/database/Y1Repository;
    const-string v2, "STANDARD_GENRES"
    invoke-virtual { v1, v2 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 350
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 351
    invoke-virtual { v1, v0 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [Ljava/lang/String;
  .line 352
    sput-object v0, Lcom/innioasis/ipp/Meta;->genres:[Ljava/lang/String;
  :L1
  .line 355
    goto :L3
  :L2
  .line 353
    move-exception v0
  .line 354
    const/4 v0, 0
  :L3
  .line 356
    return-object v0
.end method

.method private static id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .catchall { :L0 .. :L1 } :L61
  .catchall { :L2 .. :L3 } :L60
  .catchall { :L4 .. :L17 } :L60
  .catchall { :L19 .. :L24 } :L56
  .catchall { :L25 .. :L55 } :L56
  .registers 28
  .line 406
    move-object/from16 v0, p1
  .line 407
    nop
  .line 409
    const/4 v1, 0
    const/4 v2, 0
  :L0
    new-instance v3, Ljava/io/RandomAccessFile;
    const-string v4, "r"
    move-object/from16 v5, p0
    invoke-direct { v3, v5, v4 }, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  :L1
  .line 410
    const/16 v4, 10
  :L2
    new-array v5, v4, [B
  .line 411
    invoke-virtual { v3, v5 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v6
  :L3
    if-eq v6, v4, :L4
  .line 471
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 411
    return v1
  :L4
  .line 412
    aget-byte v6, v5, v1
    const/16 v7, 73
    if-ne v6, v7, :L59
    const/4 v6, 1
    aget-byte v7, v5, v6
    const/16 v8, 68
    if-ne v7, v8, :L59
    const/4 v7, 2
    aget-byte v8, v5, v7
    const/16 v9, 51
    if-eq v8, v9, :L5
    goto/16 :L59
  :L5
  .line 414
    const/4 v8, 3
    aget-byte v9, v5, v8
    and-int/lit16 v9, v9, 255
  .line 415
    if-lt v9, v7, :L58
    const/4 v10, 4
    if-le v9, v10, :L6
    goto/16 :L58
  :L6
  .line 416
    const/4 v11, 5
    aget-byte v11, v5, v11
    and-int/lit16 v11, v11, 255
  .line 417
    and-int/lit16 v12, v11, 128
    if-eqz v12, :L7
    const/4 v12, 1
    goto :L8
  :L7
    const/4 v12, 0
  :L8
  .line 418
    const/4 v13, 6
    invoke-static { v5, v13 }, Lcom/innioasis/ipp/Meta;->syncsafe([BI)J
    move-result-wide v14
    const-wide/16 v4, 10
    add-long/2addr v14, v4
  .line 420
    nop
  .line 421
    and-int/lit8 v11, v11, 64
    if-eqz v11, :L9
    invoke-static { v3, v4, v5, v9 }, Lcom/innioasis/ipp/Meta;->extendedHeader(Ljava/io/RandomAccessFile;JI)J
    move-result-wide v16
    add-long v4, v16, v4
  :L9
  .line 423
    if-ne v9, v7, :L10
    goto :L11
  :L10
    const/4 v8, 4
  :L11
  .line 424
    if-ne v9, v7, :L12
    goto :L13
  :L12
    const/16 v13, 10
  :L13
  .line 425
    new-array v7, v13, [B
  .line 426
    nop
  .line 429
    nop
  :L14
  .line 430
    int-to-long v10, v13
    add-long/2addr v10, v4
    cmp-long v16, v10, v14
    if-gtz v16, :L52
  .line 431
    invoke-virtual { v3, v4, v5 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 432
    invoke-virtual { v3, v7 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v4
    if-eq v4, v13, :L15
    move-object v1, v2
    const/4 v6, 0
    goto/16 :L54
  :L15
  .line 433
    aget-byte v4, v7, v1
    if-nez v4, :L16
    move-object v1, v2
    goto/16 :L53
  :L16
  .line 434
    invoke-static { v7, v1, v8 }, Lcom/innioasis/ipp/Meta;->ascii([BII)Ljava/lang/String;
    move-result-object v4
  .line 435
    invoke-static { v4 }, Lcom/innioasis/ipp/Meta;->isFrameId(Ljava/lang/String;)Z
    move-result v5
  :L17
    if-nez v5, :L18
    move-object v1, v2
    const/4 v6, 0
    goto/16 :L54
  :L18
  .line 437
    move-object/from16 p0, v2
  :L19
    invoke-static { v7, v9 }, Lcom/innioasis/ipp/Meta;->frameLen([BI)J
    move-result-wide v1
  .line 438
    const-wide/16 v16, 0
    cmp-long v18, v1, v16
    if-ltz v18, :L50
    add-long v16, v10, v1
    cmp-long v18, v16, v14
    if-lez v18, :L20
    move-object/from16 v1, p0
    goto/16 :L51
  :L20
  .line 439
    nop
  .line 440
    nop
  .line 442
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
  .line 443
    iget-boolean v6, v0, Lcom/innioasis/ipp/Meta$Info;->wantLyrics:Z
  :L24
    move-object/from16 v19, v7
    const-string v7, "SLT"
    move/from16 v20, v8
    const-string v8, "SYLT"
    if-eqz v6, :L27
  :L25
    const-string v6, "USLT"
    invoke-virtual { v4, v6 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L26
    const-string v6, "ULT"
    invoke-virtual { v4, v6 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L26
  .line 444
    invoke-virtual { v4, v8 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :L26
    invoke-virtual { v4, v7 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :L27
  :L26
    const/4 v6, 1
    goto :L28
  :L27
    const/4 v6, 0
  :L28
  .line 445
    if-eqz v5, :L30
    if-eqz p2, :L29
    const-wide/32 v21, 8388608
    cmp-long v23, v1, v21
    if-lez v23, :L30
  :L29
    move-object/from16 v1, p0
    move/from16 v22, v13
    move-wide/from16 v23, v14
    goto/16 :L49
  :L30
  .line 446
    if-nez v5, :L35
    const-wide/16 v21, 1
    cmp-long v23, v1, v21
    if-ltz v23, :L33
    if-eqz v6, :L31
    const/high16 v21, 0x00040000
    move/from16 v22, v13
    const/high16 v13, 0x00040000
    goto :L32
  :L31
    const/high16 v21, 0x00010000
    move/from16 v22, v13
    const/high16 v13, 0x00010000
  :L32
    move-wide/from16 v23, v14
    int-to-long v13, v13
    cmp-long v15, v1, v13
    if-lez v15, :L36
    goto :L34
  :L33
    move/from16 v22, v13
    move-wide/from16 v23, v14
  :L34
    move-object/from16 v1, p0
    goto/16 :L49
  :L35
    move/from16 v22, v13
    move-wide/from16 v23, v14
  :L36
  .line 447
    if-nez v5, :L37
    if-nez v6, :L37
    invoke-static { v4 }, Lcom/innioasis/ipp/Meta;->wanted(Ljava/lang/String;)Z
    move-result v13
    if-nez v13, :L37
    move-object/from16 v1, p0
    goto/16 :L49
  :L37
  .line 449
    invoke-virtual { v3, v10, v11 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 450
    long-to-int v10, v1
    new-array v10, v10, [B
  .line 451
    invoke-virtual { v3, v10 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v11
    int-to-long v13, v11
    cmp-long v11, v13, v1
    if-eqz v11, :L38
    const/4 v6, 0
    move-object/from16 v1, p0
    goto/16 :L54
  :L38
  .line 452
    if-eqz v12, :L39
    invoke-static { v10 }, Lcom/innioasis/ipp/Meta;->resync([B)[B
    move-result-object v10
  :L39
  .line 454
    if-eqz v5, :L42
  .line 456
    invoke-static { v10, v9 }, Lcom/innioasis/ipp/Meta;->picture([BI)Lcom/innioasis/ipp/Meta$Pic;
    move-result-object v2
  .line 457
    if-eqz v2, :L41
    if-eqz p0, :L40
    iget-boolean v1, v2, Lcom/innioasis/ipp/Meta$Pic;->front:Z
    if-eqz v1, :L41
    move-object/from16 v1, p0
    iget-boolean v4, v1, Lcom/innioasis/ipp/Meta$Pic;->front:Z
    if-nez v4, :L49
  :L40
    move-wide/from16 v4, v16
    move-object/from16 v7, v19
    move/from16 v8, v20
    move/from16 v13, v22
    move-wide/from16 v14, v23
    const/4 v1, 0
    const/4 v6, 1
    goto/16 :L14
  :L41
    move-object/from16 v1, p0
    goto :L49
  :L42
  .line 460
    move-object/from16 v1, p0
    if-eqz v6, :L48
  .line 461
    invoke-virtual { v4, v8 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L44
    invoke-virtual { v4, v7 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L43
    goto :L44
  :L43
    const/4 v5, 0
    goto :L45
  :L44
    const/4 v5, 1
  :L45
  .line 462
    if-eqz v5, :L46
    invoke-static { v10 }, Lcom/innioasis/ipp/Meta;->sylt([B)Ljava/lang/String;
    move-result-object v2
    goto :L47
  :L46
    invoke-static { v10 }, Lcom/innioasis/ipp/Meta;->uslt([B)Ljava/lang/String;
    move-result-object v2
  :L47
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Meta;->offerLyrics(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;)V
  .line 463
    goto :L49
  :L48
  .line 465
    invoke-static { v10 }, Lcom/innioasis/ipp/Meta;->text([B)Ljava/lang/String;
    move-result-object v2
    invoke-static { v0, v4, v2 }, Lcom/innioasis/ipp/Meta;->put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  .line 466
    nop
  :L49
  .line 430
    move-object v2, v1
    move-wide/from16 v4, v16
    move-object/from16 v7, v19
    move/from16 v8, v20
    move/from16 v13, v22
    move-wide/from16 v14, v23
    const/4 v1, 0
    const/4 v6, 1
    goto/16 :L14
  :L50
  .line 438
    move-object/from16 v1, p0
  :L51
    const/4 v6, 0
    goto :L54
  :L52
  .line 430
    move-object v1, v2
  :L53
  .line 467
    const/4 v6, 1
  :L54
    if-eqz v1, :L57
    iget-object v1, v1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L55
    goto :L57
  :L56
  .line 468
    move-exception v0
    move-object v2, v3
    const/4 v1, 0
    goto :L62
  :L57
  .line 471
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 472
    move v1, v6
    goto :L63
  :L58
  .line 471
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 415
    const/4 v1, 0
    return v1
  :L59
  .line 471
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 412
    const/4 v1, 0
    return v1
  :L60
  .line 468
    move-exception v0
    move-object v2, v3
    goto :L62
  :L61
    move-exception v0
  :L62
  .line 469
    nop
  .line 471
    invoke-static { v2 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 472
    nop
  :L63
  .line 473
    return v1
.end method

.method private static isFrameId(Ljava/lang/String;)Z
  .registers 5
  .line 720
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    if-ge v1, v2, :L4
  .line 721
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v2
  .line 722
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
  .line 720
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 722
    return v0
  :L4
  .line 724
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    if-lez p0, :L5
    const/4 v0, 1
  :L5
    return v0
.end method

.method public static libraryRead(Landroid/content/Context;)Z
  .registers 3
  .line 71
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

.method public static lyrics(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 153
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->ext(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 154
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 155
    new-instance v1, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 156
    const/4 v2, 1
    iput-boolean v2, v1, Lcom/innioasis/ipp/Meta$Info;->wantLyrics:Z
  .line 158
    const/4 v2, 0
  :L1
    invoke-static { v0, p0, v1, v2 }, Lcom/innioasis/ipp/Meta;->ownInto(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  :L2
  .line 160
    goto :L4
  :L3
  .line 159
    move-exception p0
  :L4
  .line 161
    iget-object p0, v1, Lcom/innioasis/ipp/Meta$Info;->lyrics:Ljava/lang/String;
    return-object p0
.end method

.method public static noteLibraryRead(Landroid/content/Context;)V
  .registers 3
  .line 76
    if-nez p0, :L0
    return-void
  :L0
  .line 77
    const-string v0, "meta_v"
    const/4 v1, 2
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 78
    return-void
.end method

.method private static number(Ljava/lang/String;)Ljava/lang/Integer;
  .catchall { :L0 .. :L10 } :L11
  .registers 8
  .line 329
    nop
  .line 330
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
  .line 331
    const/4 v1, 0
  :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v5
    if-lt v1, v5, :L4
    return-object v0
  :L4
  .line 332
    nop
  :L5
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v5
    if-ge v1, v5, :L8
  .line 333
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
  .line 332
    add-int/lit8 v1, v1, 1
    goto :L5
  :L7
  .line 333
    return-object v0
  :L8
  .line 335
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
  .line 336
    move-exception p0
  .line 337
    return-object v0
.end method

.method static offerLyrics(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;)V
  .registers 4
  .line 166
    if-nez p1, :L0
    return-void
  :L0
  .line 167
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p1
  .line 168
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 169
    invoke-static { p1 }, Lcom/innioasis/ipp/Lrc;->timed(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L2
    const/4 v0, 2
    goto :L3
  :L2
    const/4 v0, 1
  :L3
  .line 170
    iget v1, p0, Lcom/innioasis/ipp/Meta$Info;->lyricsRank:I
    if-ge v0, v1, :L4
    return-void
  :L4
  .line 171
    iput-object p1, p0, Lcom/innioasis/ipp/Meta$Info;->lyrics:Ljava/lang/String;
  .line 172
    iput v0, p0, Lcom/innioasis/ipp/Meta$Info;->lyricsRank:I
  .line 173
    return-void
.end method

.method public static oversized(Ljava/lang/String;)Z
  .catchall { :L3 .. :L4 } :L13
  .catchall { :L5 .. :L6 } :L12
  .catchall { :L7 .. :L9 } :L12
  .registers 9
  .line 379
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 380
    const/16 v1, 46
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 381
    if-gez v1, :L1
    return v0
  :L1
  .line 382
    const/4 v2, 1
    add-int/2addr v1, v2
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v1
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v1, v3 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1
  .line 383
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
  .line 384
    return v0
  :L2
  .line 386
    nop
  .line 388
    const/4 v1, 0
  :L3
    new-instance v3, Ljava/io/RandomAccessFile;
    const-string v4, "r"
    invoke-direct { v3, p0, v4 }, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  :L4
  .line 389
    const/16 p0, 10
  :L5
    new-array v1, p0, [B
  .line 390
    invoke-virtual { v3, v1 }, Ljava/io/RandomAccessFile;->read([B)I
    move-result v4
  :L6
    if-eq v4, p0, :L7
  .line 396
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 390
    return v0
  :L7
  .line 391
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
  .line 392
    const/4 p0, 6
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Meta;->syncsafe([BI)J
    move-result-wide v4
  :L9
    const-wide/32 v6, 3080192
    cmp-long p0, v4, v6
    if-ltz p0, :L10
    const/4 v0, 1
  :L10
  .line 396
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 392
    return v0
  :L11
  .line 396
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 391
    return v0
  :L12
  .line 393
    move-exception p0
    move-object v1, v3
    goto :L14
  :L13
    move-exception p0
  :L14
  .line 394
    nop
  .line 396
    invoke-static { v1 }, Lcom/innioasis/ipp/Meta;->close(Ljava/io/RandomAccessFile;)V
  .line 394
    return v0
.end method

.method public static own(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
  .registers 7
  .line 133
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->ext(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 134
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 135
    new-instance v2, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 136
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v3
  .line 137
    invoke-static { v0, p0, v2, p1 }, Lcom/innioasis/ipp/Meta;->ownInto(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result p0
    if-nez p0, :L2
  .line 138
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->readable(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L1
    return-object v1
  :L1
  .line 139
    const/4 p0, 0
    iput-boolean p0, v2, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    goto :L3
  :L2
  .line 141
    const/4 p0, 1
    iput-boolean p0, v2, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  .line 142
    iput-boolean p0, v2, Lcom/innioasis/ipp/Meta$Info;->ours:Z
  :L3
  .line 144
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide p0
    sub-long/2addr p0, v3
    iput-wide p0, v2, Lcom/innioasis/ipp/Meta$Info;->openNs:J
  .line 145
    return-object v2
.end method

.method private static ownInto(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .registers 5
  .line 182
    const-string v0, "mp3"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result p0
    return p0
  :L0
  .line 183
    const-string v0, "flac"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Vorbis;->flac(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result p0
    return p0
  :L1
  .line 184
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
  .line 185
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
  .line 188
    const/4 p0, 0
    return p0
  :L4
  .line 186
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Mp4;->read(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result p0
    return p0
  :L5
  .line 184
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Vorbis;->ogg(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result p0
    return p0
.end method

.method private static past([BII)I
  .registers 6
  .line 655
    const/4 v0, -1
    const/4 v1, 2
    const/4 v2, 1
    if-eq p2, v2, :L3
    if-ne p2, v1, :L0
    goto :L3
  :L0
  .line 662
    array-length p2, p0
    if-ge p1, p2, :L2
  .line 663
    aget-byte p2, p0, p1
    if-nez p2, :L1
    add-int/2addr p1, v2
    return p1
  :L1
  .line 664
    add-int/lit8 p1, p1, 1
    goto :L0
  :L2
  .line 666
    return v0
  :L3
  .line 656
    add-int/lit8 p2, p1, 1
    array-length v2, p0
    if-ge p2, v2, :L5
  .line 657
    aget-byte v2, p0, p1
    if-nez v2, :L4
    aget-byte p2, p0, p2
    if-nez p2, :L4
    add-int/2addr p1, v1
    return p1
  :L4
  .line 658
    add-int/lit8 p1, p1, 2
    goto :L3
  :L5
  .line 660
    return v0
.end method

.method private static picture([BI)Lcom/innioasis/ipp/Meta$Pic;
  .registers 10
  .line 531
    array-length v0, p0
    const/4 v1, 0
    const/4 v2, 4
    if-ge v0, v2, :L0
    return-object v1
  :L0
  .line 532
    const/4 v0, 0
    aget-byte v3, p0, v0
    and-int/lit16 v3, v3, 255
  .line 533
    nop
  .line 534
    const/4 v4, 2
    const/4 v5, 1
    if-ne p1, v4, :L1
  .line 535
    goto :L4
  :L1
  .line 534
    const/4 p1, 1
  :L2
  .line 537
    array-length v2, p0
    if-ge p1, v2, :L3
    aget-byte v2, p0, p1
    if-eqz v2, :L3
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 538
    add-int/lit8 v2, p1, 1
  :L4
  .line 540
    array-length p1, p0
    if-lt v2, p1, :L5
    return-object v1
  :L5
  .line 541
    new-instance p1, Lcom/innioasis/ipp/Meta$Pic;
    invoke-direct { p1, v1 }, Lcom/innioasis/ipp/Meta$Pic;-><init>(Lcom/innioasis/ipp/Meta$1;)V
  .line 542
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
  .line 543
    add-int/2addr v2, v5
  .line 544
    if-eq v3, v5, :L9
    if-ne v3, v4, :L8
    goto :L9
  :L8
    const/4 v3, 0
    goto :L10
  :L9
    const/4 v3, 1
  :L10
  .line 545
    if-eqz v3, :L14
  :L11
  .line 546
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
  .line 547
    add-int/2addr v2, v4
    goto :L16
  :L14
  .line 549
    array-length v3, p0
    if-ge v2, v3, :L15
    aget-byte v3, p0, v2
    if-eqz v3, :L15
    add-int/lit8 v2, v2, 1
    goto :L14
  :L15
  .line 550
    add-int/2addr v2, v5
  :L16
  .line 552
    array-length v3, p0
    if-lt v2, v3, :L17
    return-object v1
  :L17
  .line 553
    array-length v1, p0
    sub-int/2addr v1, v2
    new-array v1, v1, [B
    iput-object v1, p1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
  .line 554
    iget-object v1, p1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
    iget-object v3, p1, Lcom/innioasis/ipp/Meta$Pic;->data:[B
    array-length v3, v3
    invoke-static { p0, v2, v1, v0, v3 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 555
    return-object p1
.end method

.method private static put(Lcom/innioasis/ipp/Meta$Info;Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 495
    if-eqz p2, :L19
    invoke-virtual { p2 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto/16 :L19
  :L0
  .line 496
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
  .line 497
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
  .line 498
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
  .line 499
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
  .line 500
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
  .line 501
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
  .line 502
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
  .line 503
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
  .line 504
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
  .line 503
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
    goto :L18
  :L11
  .line 502
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
    goto :L18
  :L12
  .line 501
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    goto :L18
  :L13
  .line 500
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
    goto :L18
  :L14
  .line 499
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
    goto :L18
  :L15
  .line 498
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
    goto :L18
  :L16
  .line 497
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
    goto :L18
  :L17
  .line 496
    iput-object p2, p0, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
  :L18
  .line 505
    return-void
  :L19
  .line 495
    return-void
.end method

.method public static read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
  .catchall { :L2 .. :L4 } :L5
  .catchall { :L6 .. :L7 } :L8
  .registers 11
  .line 86
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Meta;->own(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v0
  .line 87
    if-eqz v0, :L0
    iget-boolean v1, v0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    if-eqz v1, :L0
    return-object v0
  :L0
  .line 89
    new-instance v0, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 90
    if-nez p0, :L1
    return-object v0
  :L1
  .line 92
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
  .line 93
    new-instance v3, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v3 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  .line 95
    const/4 v4, 1
  :L2
    invoke-virtual { v3, p0 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 96
    const/4 v5, 7
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->title:Ljava/lang/String;
  .line 97
    const/4 v5, 2
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->artist:Ljava/lang/String;
  .line 98
    const/16 v5, 13
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 99
    invoke-virtual { v3, v4 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->album:Ljava/lang/String;
  .line 100
    const/4 v5, 6
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->genre:Ljava/lang/String;
  .line 101
    const/4 v5, 0
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
  .line 102
    const/16 v5, 14
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
  .line 103
    const/16 v5, 8
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
  .line 104
    const/4 v5, 5
    invoke-virtual { v3, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v0, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
  .line 105
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
  .line 106
    if-eqz p1, :L3
    invoke-virtual { v3 }, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B
    move-result-object v7
    iput-object v7, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L3
  .line 107
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
    sub-long/2addr v7, v5
    iput-wide v7, v0, Lcom/innioasis/ipp/Meta$Info;->artNs:J
  .line 108
    iput-boolean v4, v0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  :L4
  .line 110
    goto :L6
  :L5
  .line 109
    move-exception v5
  :L6
  .line 112
    invoke-virtual { v3 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L7
  .line 114
    goto :L9
  :L8
  .line 113
    move-exception v3
  :L9
  .line 116
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result v3
  .line 117
    if-eqz v3, :L10
  .line 118
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .line 119
    iput-boolean v4, v0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  :L10
  .line 121
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide p0
    sub-long/2addr p0, v1
    iget-wide v1, v0, Lcom/innioasis/ipp/Meta$Info;->artNs:J
    sub-long/2addr p0, v1
    iput-wide p0, v0, Lcom/innioasis/ipp/Meta$Info;->openNs:J
  .line 122
    return-object v0
.end method

.method private static readable(Ljava/lang/String;)Z
  .registers 2
  .line 176
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
  .line 177
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
  .line 178
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
  .line 176
    return p0
.end method

.method public static reread(Ljava/lang/String;)Z
  .registers 2
  .line 208
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
  .line 704
    nop
  .line 705
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, p0
    const/16 v4, 255
    if-ge v1, v3, :L3
  .line 706
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
  .line 707
    add-int/lit8 v2, v2, 1
  :L2
  .line 705
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 709
    array-length v1, p0
    if-ne v2, v1, :L4
    return-object p0
  :L4
  .line 710
    new-array v1, v2, [B
  .line 711
    nop
  .line 712
    const/4 v2, 0
  :L5
    array-length v3, p0
    if-ge v0, v3, :L8
  .line 713
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
  .line 714
    add-int/lit8 v3, v2, 1
    aget-byte v5, p0, v0
    aput-byte v5, v1, v2
    move v2, v3
  :L7
  .line 712
    add-int/lit8 v0, v0, 1
    goto :L5
  :L8
  .line 716
    return-object v1
.end method

.method public static scanOwn(Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L1 .. :L3 } :L4
  .registers 5
  .line 274
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 275
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 276
    invoke-static { v1 }, Lcom/innioasis/ipp/Meta;->ext(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 277
    nop
  .line 279
    if-eqz v2, :L5
  :L1
    const-string v3, "mp3"
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    const-string v3, "flac"
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    const-string v3, "ogg"
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    const-string v3, "m4a"
  .line 280
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    const-string v3, "m4r"
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
  :L2
  .line 281
    new-instance v3, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v3 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 282
    invoke-static { v2, v1, v3, v0 }, Lcom/innioasis/ipp/Meta;->ownInto(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
    move-result v1
    if-eqz v1, :L5
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Meta;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)Z
    move-result v0
  :L3
    goto :L5
  :L4
  .line 284
    move-exception p0
  .line 285
    goto :L6
  :L5
  .line 286
    nop
  :L6
  .line 287
    return v0
.end method

.method public static scanned(Landroid/media/MediaMetadataRetriever;Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 364
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 366
    new-instance v0, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 367
    const/16 v1, 13
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 368
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
  .line 369
    const/16 v1, 14
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
  .line 370
    const/16 v1, 8
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
  .line 371
    const/4 v1, 5
    invoke-virtual { p0, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object p0
    iput-object p0, v0, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
  .line 372
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  :L1
  .line 374
    goto :L3
  :L2
  .line 373
    move-exception p0
  :L3
  .line 375
    return-void
  :L4
  .line 364
    return-void
.end method

.method private static stockValue(Ljava/lang/String;)Ljava/lang/String;
  .registers 5
  .line 318
    const-string v0, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    if-nez p0, :L0
    return-object v0
  :L0
  .line 319
    const/4 v1, 0
  :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    if-ge v1, v2, :L3
  .line 320
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v2
  .line 321
    invoke-static { v2 }, Ljava/lang/Character;->isWhitespace(C)Z
    move-result v3
    if-nez v3, :L2
    invoke-static { v2 }, Ljava/lang/Character;->isSpaceChar(C)Z
    move-result v2
    if-nez v2, :L2
    return-object p0
  :L2
  .line 319
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 323
    return-object v0
.end method

.method private static sylt([B)Ljava/lang/String;
  .registers 18
  .line 615
    move-object/from16 v0, p0
    array-length v1, v0
    const/4 v2, 7
    const/4 v3, 0
    if-ge v1, v2, :L0
    return-object v3
  :L0
  .line 616
    const/4 v1, 0
    aget-byte v2, v0, v1
    and-int/lit16 v2, v2, 255
  .line 617
    const/4 v4, 4
    aget-byte v4, v0, v4
    and-int/lit16 v4, v4, 255
    const/4 v5, 2
    if-eq v4, v5, :L1
    return-object v3
  :L1
  .line 618
    const/4 v4, 6
    invoke-static { v0, v4, v2 }, Lcom/innioasis/ipp/Meta;->past([BII)I
    move-result v4
  .line 619
    if-gez v4, :L2
    return-object v3
  :L2
  .line 620
    array-length v6, v0
    sub-int/2addr v6, v4
    invoke-static { v0, v4, v6, v2 }, Lcom/innioasis/ipp/Meta;->charsetOf([BIII)Ljava/nio/charset/Charset;
    move-result-object v6
  .line 621
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct { v7 }, Ljava/util/ArrayList;-><init>()V
  .line 622
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8 }, Ljava/util/ArrayList;-><init>()V
  .line 623
    const/4 v9, 0
  :L3
  .line 624
    array-length v10, v0
    const-string v11, "\r"
    const-string v12, "\n"
    const/4 v13, 1
    if-ge v4, v10, :L11
  .line 625
    invoke-static { v0, v4, v2 }, Lcom/innioasis/ipp/Meta;->past([BII)I
    move-result v10
  .line 626
    if-ltz v10, :L11
    add-int/lit8 v14, v10, 4
    array-length v15, v0
    if-le v14, v15, :L4
    goto :L11
  :L4
  .line 627
    if-eq v2, v13, :L6
    if-ne v2, v5, :L5
    goto :L6
  :L5
    const/4 v15, 1
    goto :L7
  :L6
    const/4 v15, 2
  :L7
    sub-int v15, v10, v15
    invoke-static { v0, v4, v15, v2, v6 }, Lcom/innioasis/ipp/Meta;->decode([BIIILjava/nio/charset/Charset;)Ljava/lang/String;
    move-result-object v4
  .line 628
    if-nez v4, :L8
    const-string v4, ""
  :L8
  .line 629
    invoke-virtual { v4, v12 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v12
    if-nez v12, :L9
    invoke-virtual { v4, v11 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v11
    if-eqz v11, :L10
  :L9
    const/4 v9, 1
  :L10
  .line 630
    invoke-virtual { v7, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 631
    invoke-static { v0, v10 }, Lcom/innioasis/ipp/Meta;->be32([BI)J
    move-result-wide v10
    invoke-static { v10, v11 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v4
    invoke-virtual { v8, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 632
    nop
  .line 633
    move v4, v14
    goto :L3
  :L11
  .line 634
    invoke-virtual { v7 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L12
    return-object v3
  :L12
  .line 635
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 636
    nop
  .line 637
    nop
  .line 638
    const-wide/16 v4, 0
    const/4 v2, 0
  :L13
    invoke-virtual { v7 }, Ljava/util/ArrayList;->size()I
    move-result v6
    const/16 v10, 10
    if-ge v2, v6, :L19
  .line 639
    invoke-virtual { v7, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
  .line 640
    invoke-virtual { v8, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v14
    check-cast v14, Ljava/lang/Long;
    invoke-virtual { v14 }, Ljava/lang/Long;->longValue()J
    move-result-wide v14
  .line 641
    if-eqz v9, :L15
    if-eqz v3, :L15
    invoke-virtual { v6, v12 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v16
    if-nez v16, :L15
    invoke-virtual { v6, v11 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v16
    if-eqz v16, :L14
    goto :L15
  :L14
    const/16 v16, 0
    goto :L16
  :L15
    const/16 v16, 1
  :L16
  .line 642
    if-eqz v16, :L18
  .line 643
    if-eqz v3, :L17
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/Lrc;->stamp(J)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v10 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L17
  .line 644
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
  .line 645
    move-wide v4, v14
  :L18
  .line 647
    const/16 v14, 13
    const/16 v15, 32
    invoke-virtual { v6, v14, v15 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6, v10, v15 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 638
    add-int/lit8 v2, v2, 1
    goto :L13
  :L19
  .line 649
    if-eqz v3, :L20
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/Lrc;->stamp(J)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v10 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L20
  .line 650
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private static syncsafe([BI)J
  .registers 9
  .line 736
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
  .line 216
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->blind(Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L1
  .line 217
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Meta;->own(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object p0
  .line 218
    if-eqz p0, :L0
    iget-boolean v0, p0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    if-eqz v0, :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Meta$Info;->art:[B
  :L0
    return-object v1
  :L1
  .line 220
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L2
    return-object v1
  :L2
  .line 221
    new-instance v0, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 222
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Meta;->id3(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;Z)Z
  .line 223
    iget-object p0, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
    return-object p0
.end method

.method private static text([B)Ljava/lang/String;
  .catchall { :L10 .. :L11 } :L12
  .registers 10
  .line 560
    const/4 v0, 0
    aget-byte v1, p0, v0
    const/16 v2, 255
    and-int/2addr v1, v2
  .line 561
    nop
  .line 562
    array-length v3, p0
    const/4 v4, 1
    sub-int/2addr v3, v4
  .line 564
    const-string v5, "UTF-16BE"
    const/4 v6, 3
    const/4 v7, 2
    if-ne v1, v4, :L2
  .line 566
    const/16 v1, 254
    if-lt v3, v7, :L0
    aget-byte v8, p0, v4
    and-int/2addr v8, v2
    if-ne v8, v2, :L0
    aget-byte v8, p0, v7
    and-int/2addr v8, v2
    if-ne v8, v1, :L0
  .line 567
    nop
  .line 568
    nop
  .line 569
    add-int/lit8 v3, v3, -2
    const-string v5, "UTF-16LE"
    const/4 v4, 3
    goto :L5
  :L0
  .line 570
    if-lt v3, v7, :L1
    aget-byte v8, p0, v4
    and-int/2addr v8, v2
    if-ne v8, v1, :L1
    aget-byte v1, p0, v7
    and-int/2addr v1, v2
    if-ne v1, v2, :L1
  .line 571
    nop
  .line 572
    nop
  .line 573
    add-int/lit8 v3, v3, -2
    const/4 v4, 3
    goto :L5
  :L1
  .line 575
    goto :L5
  :L2
  .line 577
    if-ne v1, v7, :L3
  .line 578
    goto :L5
  :L3
  .line 579
    if-ne v1, v6, :L4
  .line 580
    const-string v5, "UTF-8"
    goto :L5
  :L4
  .line 582
    const-string v5, "ISO-8859-1"
  :L5
  .line 584
    const-string v1, "UTF-16"
    invoke-virtual { v5, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
  .line 585
    nop
  .line 586
    if-eqz v1, :L8
  :L6
  .line 587
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
  .line 589
    if-ge v0, v3, :L9
    add-int v1, v4, v0
    aget-byte v1, p0, v1
    if-eqz v1, :L9
    add-int/lit8 v0, v0, 1
    goto :L8
  :L9
  .line 591
    const/4 v1, 0
    if-gtz v0, :L10
    return-object v1
  :L10
  .line 593
    new-instance v2, Ljava/lang/String;
    invoke-direct { v2, p0, v4, v0, v5 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    invoke-virtual { v2 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  :L11
    return-object p0
  :L12
  .line 594
    move-exception p0
  .line 595
    return-object v1
.end method

.method private static uslt([B)Ljava/lang/String;
  .registers 5
  .line 601
    array-length v0, p0
    const/4 v1, 5
    const/4 v2, 0
    if-ge v0, v1, :L0
    return-object v2
  :L0
  .line 602
    const/4 v0, 0
    aget-byte v0, p0, v0
    and-int/lit16 v0, v0, 255
  .line 603
    const/4 v1, 4
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/Meta;->past([BII)I
    move-result v1
  .line 604
    if-ltz v1, :L2
    array-length v3, p0
    if-lt v1, v3, :L1
    goto :L2
  :L1
  .line 605
    array-length v2, p0
    sub-int/2addr v2, v1
    invoke-static { p0, v1, v2, v0 }, Lcom/innioasis/ipp/Meta;->charsetOf([BIII)Ljava/nio/charset/Charset;
    move-result-object v2
  .line 606
    array-length v3, p0
    invoke-static { p0, v1, v3, v0, v2 }, Lcom/innioasis/ipp/Meta;->decode([BIIILjava/nio/charset/Charset;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 604
    return-object v2
.end method

.method private static wanted(Ljava/lang/String;)Z
  .registers 2
  .line 483
    const-string v0, "TIT2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TT2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 484
    const-string v0, "TPE1"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TP1"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 485
    const-string v0, "TPE2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TP2"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 486
    const-string v0, "TALB"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TAL"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 487
    const-string v0, "TCON"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TCO"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 488
    const-string v0, "TRCK"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TRK"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 489
    const-string v0, "TPOS"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TPA"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 490
    const-string v0, "TYER"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "TYE"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 491
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
  .line 483
    return p0
.end method

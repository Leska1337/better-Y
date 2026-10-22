.class public final Lcom/innioasis/ipp/Schema;
.super Ljava/lang/Object;
.source "Schema.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Schema$M67;,
    Lcom/innioasis/ipp/Schema$M78;
  }
.end annotation

.field private final static BATCH:I = 100

.field private final static FIRST:I = 18

.field private static byPath:Ljava/util/HashMap;

.field private static gen:I

.field private static indexed:Ljava/util/List;

.field private final static staged:Ljava/util/ArrayList;

.field private final static written:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 273
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Schema;->staged:Ljava/util/ArrayList;
  .line 275
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Schema;->written:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 33
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static backfill()V
  .registers 4
  .line 235
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 236
    if-nez v0, :L0
    return-void
  :L0
  .line 237
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v1
  .line 238
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v2
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Schema;->fillList(Lcom/innioasis/y1/database/SongDao;Ljava/util/List;)I
    move-result v2
    const/4 v3, 1
    invoke-virtual { v0, v3 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Schema;->fillList(Lcom/innioasis/y1/database/SongDao;Ljava/util/List;)I
    move-result v0
    add-int/2addr v2, v0
  .line 239
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->drop()V
  .line 240
    invoke-static { }, Lcom/innioasis/ipp/Schema;->dropFiles()V
  .line 241
    if-lez v2, :L1
  .line 242
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "schema: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " row(s) filled from the tag table"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 243
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L1
  .line 245
    return-void
.end method

.method public static bind(Landroidx/sqlite/db/SupportSQLiteStatement;Lcom/innioasis/y1/database/Song;)V
  .registers 4
  .line 110
    const/16 v0, 18
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 111
    const/16 v0, 19
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 112
    const/16 v0, 20
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 113
    const/16 v0, 21
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 114
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getLyrics()I
    move-result p1
    int-to-long v0, p1
    const/16 p1, 22
    invoke-interface { p0, p1, v0, v1 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V
  .line 115
    return-void
.end method

.method private static carry()V
  .registers 4
  .line 300
    sget-object v0, Lcom/innioasis/ipp/Schema;->written:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L0
  .line 301
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L3
  .line 302
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/util/Map$Entry;
  .line 303
    sget-object v2, Lcom/innioasis/ipp/Schema;->byPath:Ljava/util/HashMap;
    invoke-interface { v1 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 304
    invoke-interface { v1 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/database/Song;
  .line 305
    if-eqz v2, :L2
    if-eq v2, v1, :L2
    invoke-static { v2 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v3
    if-nez v3, :L1
    goto :L2
  :L1
  .line 309
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Schema;->copy(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)V
  .line 310
    goto :L0
  :L2
  .line 306
    if-eq v2, v1, :L0
    invoke-interface { v0 }, Ljava/util/Iterator;->remove()V
    goto :L0
  :L3
  .line 311
    return-void
.end method

.method private static clearList(Lcom/innioasis/y1/database/SongDao;Ljava/util/List;)I
  .registers 7
  .line 192
    const/4 v0, 0
    if-nez p1, :L0
    return v0
  :L0
  .line 193
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 194
    nop
  .line 195
    const/4 v2, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L4
  .line 196
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 197
    invoke-static { v3 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v4
    if-eqz v4, :L2
    goto :L3
  :L2
  .line 198
    const/4 v4, 0
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/database/Song;->setAlbumArtist(Ljava/lang/String;)V
  .line 199
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/database/Song;->setTrack(Ljava/lang/String;)V
  .line 200
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/database/Song;->setDisc(Ljava/lang/String;)V
  .line 201
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/database/Song;->setYear(Ljava/lang/String;)V
  .line 202
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 203
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    const/16 v4, 100
    if-lt v3, v4, :L3
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Schema;->flush(Lcom/innioasis/y1/database/SongDao;Ljava/util/ArrayList;)I
    move-result v3
    add-int/2addr v2, v3
  :L3
  .line 195
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 205
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Schema;->flush(Lcom/innioasis/y1/database/SongDao;Ljava/util/ArrayList;)I
    move-result p0
    add-int/2addr v2, p0
    return v2
.end method

.method static clearTags()V
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 4
  .line 181
    const-class v0, Lcom/innioasis/ipp/Schema;
    monitor-enter v0
  :L0
  .line 182
    sget-object v1, Lcom/innioasis/ipp/Schema;->written:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 183
    monitor-exit v0
  :L1
  .line 184
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 185
    if-nez v0, :L2
    return-void
  :L2
  .line 186
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v1
  .line 187
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v2
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Schema;->clearList(Lcom/innioasis/y1/database/SongDao;Ljava/util/List;)I
    move-result v2
    const/4 v3, 1
    invoke-virtual { v0, v3 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Schema;->clearList(Lcom/innioasis/y1/database/SongDao;Ljava/util/List;)I
    move-result v0
    add-int/2addr v2, v0
  .line 188
    if-lez v2, :L3
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L3
  .line 189
    return-void
  :L4
  .line 183
    move-exception v1
  :L5
    monitor-exit v0
  :L6
    throw v1
.end method

.method public static columns(Ljava/util/HashMap;)V
  .registers 16
  .line 102
    new-instance v7, Landroidx/room/util/TableInfo$Column;
    const-string v1, "albumArtist"
    const-string v2, "TEXT"
    const/4 v3, 0
    const/4 v4, 0
    const/4 v5, 0
    const/4 v6, 1
    move-object v0, v7
    invoke-direct/range { v0 .. v6 }, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V
    const-string v0, "albumArtist"
    invoke-virtual { p0, v0, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 103
    new-instance v0, Landroidx/room/util/TableInfo$Column;
    const-string v9, "track"
    const-string v10, "TEXT"
    const/4 v11, 0
    const/4 v12, 0
    const/4 v13, 0
    const/4 v14, 1
    move-object v8, v0
    invoke-direct/range { v8 .. v14 }, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V
    const-string v1, "track"
    invoke-virtual { p0, v1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 104
    new-instance v0, Landroidx/room/util/TableInfo$Column;
    const-string v3, "disc"
    const-string v4, "TEXT"
    const/4 v5, 0
    const/4 v6, 0
    const/4 v7, 0
    const/4 v8, 1
    move-object v2, v0
    invoke-direct/range { v2 .. v8 }, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V
    const-string v1, "disc"
    invoke-virtual { p0, v1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 105
    new-instance v0, Landroidx/room/util/TableInfo$Column;
    const-string v3, "year"
    const-string v4, "TEXT"
    move-object v2, v0
    invoke-direct/range { v2 .. v8 }, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V
    const-string v1, "year"
    invoke-virtual { p0, v1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 106
    new-instance v0, Landroidx/room/util/TableInfo$Column;
    const-string v3, "lyrics"
    const-string v4, "INTEGER"
    const/4 v5, 1
    move-object v2, v0
    invoke-direct/range { v2 .. v8 }, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V
    const-string v1, "lyrics"
    invoke-virtual { p0, v1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 107
    return-void
.end method

.method private static copy(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)V
  .registers 3
  .line 314
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setAlbumArtist(Ljava/lang/String;)V
  .line 315
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setTrack(Ljava/lang/String;)V
  .line 316
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setDisc(Ljava/lang/String;)V
  .line 317
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setYear(Ljava/lang/String;)V
  .line 318
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getLyrics()I
    move-result p0
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/database/Song;->setLyrics(I)V
  .line 319
    return-void
.end method

.method private static dropFiles()V
  .catchall { :L0 .. :L5 } :L7
  .registers 6
  :L0
  .line 211
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 212
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L2
  .line 213
    if-nez v0, :L3
    return-void
  :L3
  .line 214
    const/4 v1, 4
    new-array v2, v1, [Ljava/lang/String;
    const-string v3, "ipp_tracks.txt"
    const/4 v4, 0
    aput-object v3, v2, v4
    const-string v3, "ipp_discs.txt"
    const/4 v5, 1
    aput-object v3, v2, v5
    const-string v3, "ipp_years.txt"
    const/4 v5, 2
    aput-object v3, v2, v5
    const-string v3, "ipp_albumartist.txt"
    const/4 v5, 3
    aput-object v3, v2, v5
  .line 216
    nop
  :L4
    if-ge v4, v1, :L6
    new-instance v3, Ljava/io/File;
    aget-object v5, v2, v4
    invoke-direct { v3, v0, v5 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  :L5
    add-int/lit8 v4, v4, 1
    goto :L4
  :L6
  .line 218
    goto :L8
  :L7
  .line 217
    move-exception v0
  :L8
  .line 219
    return-void
.end method

.method public static fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .registers 3
  .line 128
    iget-object v0, p1, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Schema;->seen(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setAlbumArtist(Ljava/lang/String;)V
  .line 129
    iget-object v0, p1, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Schema;->seen(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setTrack(Ljava/lang/String;)V
  .line 130
    iget-object v0, p1, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Schema;->seen(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setDisc(Ljava/lang/String;)V
  .line 131
    iget-object v0, p1, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 132
    if-nez v0, :L0
    iget-object p1, p1, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
    invoke-static { p1 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L0
  .line 133
    invoke-static { v0 }, Lcom/innioasis/ipp/Schema;->seen(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Song;->setYear(Ljava/lang/String;)V
  .line 134
    return-void
.end method

.method private static fillList(Lcom/innioasis/y1/database/SongDao;Ljava/util/List;)I
  .registers 7
  .line 248
    const/4 v0, 0
    if-nez p1, :L0
    return v0
  :L0
  .line 249
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 250
    nop
  .line 251
    const/4 v2, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L5
  .line 252
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 253
    invoke-static { v3 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v4
    if-nez v4, :L2
    goto :L4
  :L2
  .line 254
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/MetaCache;->get(Ljava/lang/String;)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v4
  .line 255
    if-nez v4, :L3
    goto :L4
  :L3
  .line 256
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .line 257
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 258
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    const/16 v4, 100
    if-lt v3, v4, :L4
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Schema;->flush(Lcom/innioasis/y1/database/SongDao;Ljava/util/ArrayList;)I
    move-result v3
    add-int/2addr v2, v3
  :L4
  .line 251
    add-int/lit8 v0, v0, 1
    goto :L1
  :L5
  .line 260
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Schema;->flush(Lcom/innioasis/y1/database/SongDao;Ljava/util/ArrayList;)I
    move-result p0
    add-int/2addr v2, p0
    return v2
.end method

.method private static flush(Lcom/innioasis/y1/database/SongDao;Ljava/util/ArrayList;)I
  .registers 4
  .line 264
    invoke-virtual { p1 }, Ljava/util/ArrayList;->size()I
    move-result v0
  .line 265
    if-nez v0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 266
    new-array v1, v0, [Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1, v1 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Lcom/innioasis/y1/database/Song;
    invoke-interface { p0, v1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 267
    invoke-virtual { p1 }, Ljava/util/ArrayList;->clear()V
  .line 268
    return v0
.end method

.method static declared-synchronized gen()I
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/Schema;
    monitor-enter v0
  :L0
  .line 335
    sget v1, Lcom/innioasis/ipp/Schema;->gen:I
  :L1
    monitor-exit v0
    return v1
  :L2
  .line 335
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method static info(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/ipp/Meta$Info;
  .registers 3
  .line 142
    new-instance v0, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 143
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 144
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
  .line 145
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v1
    iput-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
  .line 146
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object p0
    iput-object p0, v0, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
  .line 147
    const/4 p0, 1
    iput-boolean p0, v0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  .line 148
    return-object v0
.end method

.method public static migrations(Landroidx/room/RoomDatabase$Builder;)Landroidx/room/RoomDatabase$Builder;
  .registers 4
  .line 97
    const/4 v0, 2
    new-array v0, v0, [Landroidx/room/migration/Migration;
    new-instance v1, Lcom/innioasis/ipp/Schema$M67;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Schema$M67;-><init>()V
    const/4 v2, 0
    aput-object v1, v0, v2
    new-instance v1, Lcom/innioasis/ipp/Schema$M78;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Schema$M78;-><init>()V
    const/4 v2, 1
    aput-object v1, v0, v2
    invoke-virtual { p0, v0 }, Landroidx/room/RoomDatabase$Builder;->addMigrations([Landroidx/room/migration/Migration;)Landroidx/room/RoomDatabase$Builder;
    move-result-object p0
    return-object p0
.end method

.method static pathOf(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 88
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/lang/String;
    const/4 v2, 0
    invoke-static { p0, v2 }, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
    move-result-object p0
    const-string v2, "UTF-8"
    invoke-direct { v1, p0, v2 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
  .line 89
    const-string p0, "/"
    invoke-virtual { v1, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L1
    sget-object p0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/objects/Constant;->normalizeAudioBookPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L1
    return-object v0
  :L2
  .line 90
    move-exception p0
  .line 91
    return-object v0
.end method

.method public static read(Landroid/database/Cursor;Lcom/innioasis/y1/database/Song;)V
  .registers 3
  .line 370
    const-string v0, "albumArtist"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 371
    if-ltz v0, :L0
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setAlbumArtist(Ljava/lang/String;)V
  :L0
  .line 372
    const-string v0, "track"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 373
    if-ltz v0, :L1
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setTrack(Ljava/lang/String;)V
  :L1
  .line 374
    const-string v0, "disc"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 375
    if-ltz v0, :L2
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setDisc(Ljava/lang/String;)V
  :L2
  .line 376
    const-string v0, "year"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 377
    if-ltz v0, :L3
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setYear(Ljava/lang/String;)V
  :L3
  .line 378
    const-string v0, "lyrics"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 379
    if-ltz v0, :L4
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getInt(I)I
    move-result p0
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/database/Song;->setLyrics(I)V
  :L4
  .line 380
    return-void
.end method

.method static declared-synchronized row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L8 } :L10
  .registers 8
    const-class v0, Lcom/innioasis/ipp/Schema;
    monitor-enter v0
  .line 283
    const/4 v1, 0
    if-nez p0, :L0
    monitor-exit v0
    return-object v1
  :L0
  .line 284
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loaded()Ljava/util/List;
    move-result-object v2
  .line 285
    if-nez v2, :L1
    sget-object v3, Lcom/innioasis/ipp/Schema;->byPath:Ljava/util/HashMap;
    if-nez v3, :L1
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v2
  :L1
  .line 286
    if-eqz v2, :L5
    sget-object v3, Lcom/innioasis/ipp/Schema;->indexed:Ljava/util/List;
    if-eq v2, v3, :L5
  .line 287
    new-instance v3, Ljava/util/HashMap;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v4
    mul-int/lit8 v4, v4, 2
    invoke-direct { v3, v4 }, Ljava/util/HashMap;-><init>(I)V
  .line 288
    const/4 v4, 0
  :L2
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 289
    invoke-interface { v2, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 290
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L3
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v3, v6, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 288
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 292
    sput-object v3, Lcom/innioasis/ipp/Schema;->byPath:Ljava/util/HashMap;
  .line 293
    sput-object v2, Lcom/innioasis/ipp/Schema;->indexed:Ljava/util/List;
  .line 294
    invoke-static { }, Lcom/innioasis/ipp/Schema;->carry()V
  :L5
  .line 296
    sget-object v2, Lcom/innioasis/ipp/Schema;->byPath:Ljava/util/HashMap;
    if-nez v2, :L7
  :L6
    goto :L9
  :L7
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/database/Song;
  :L8
    goto :L6
  :L9
    monitor-exit v0
    return-object v1
  :L10
  .line 282
    move-exception p0
    monitor-exit v0
    goto :L12
  :L11
    throw p0
  :L12
    goto :L11
.end method

.method private static seen(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 137
    if-nez p0, :L0
    const-string p0, ""
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method static stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  .catchall { :L2 .. :L4 } :L3
  .registers 3
  .line 323
    if-eqz p1, :L5
    iget-boolean v0, p1, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    if-nez v0, :L0
    goto :L5
  :L0
  .line 324
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 325
    if-nez p0, :L1
    return-void
  :L1
  .line 326
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .line 327
    sget-object p1, Lcom/innioasis/ipp/Schema;->staged:Ljava/util/ArrayList;
    monitor-enter p1
  :L2
  .line 328
    invoke-virtual { p1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 329
    monitor-exit p1
  .line 330
    return-void
  :L3
  .line 329
    move-exception p0
    monitor-exit p1
  :L4
    throw p0
  :L5
  .line 323
    return-void
.end method

.method static tagBytes()J
  .catchall { :L0 .. :L3 } :L5
  .registers 7
  .line 153
    nop
  .line 155
    const-wide/16 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v2
  .line 156
    if-nez v2, :L1
    return-wide v0
  :L1
  .line 157
    const/4 v3, 0
  :L2
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L4
  .line 158
    invoke-interface { v2, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 159
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Schema;->utf8(Ljava/lang/String;)I
    move-result v5
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Schema;->utf8(Ljava/lang/String;)I
    move-result v6
    add-int/2addr v5, v6
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Schema;->utf8(Ljava/lang/String;)I
    move-result v6
    add-int/2addr v5, v6
  .line 160
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Schema;->utf8(Ljava/lang/String;)I
    move-result v4
  :L3
    add-int/2addr v5, v4
    int-to-long v4, v5
    add-long/2addr v0, v4
  .line 157
    add-int/lit8 v3, v3, 1
    goto :L2
  :L4
  .line 163
    goto :L6
  :L5
  .line 162
    move-exception v2
  :L6
  .line 164
    return-wide v0
.end method

.method private static text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .registers 3
  .line 118
    if-nez p2, :L0
    invoke-interface { p0, p1 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V
    goto :L1
  :L0
  .line 119
    invoke-interface { p0, p1, p2 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V
  :L1
  .line 120
    return-void
.end method

.method static unread(Lcom/innioasis/y1/database/Song;)Z
  .registers 2
  .line 223
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
  .line 224
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object p0
    if-nez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
  .line 223
    return p0
.end method

.method private static utf8(Ljava/lang/String;)I
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 168
    if-nez p0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 170
    const-string v0, "UTF-8"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    array-length p0, v0
  :L1
    return p0
  :L2
  .line 171
    move-exception v0
  .line 172
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    return p0
.end method

.method static write()V
  .catchall { :L0 .. :L2 } :L17
  .catchall { :L3 .. :L9 } :L14
  .catchall { :L9 .. :L11 } :L12
  .catchall { :L15 .. :L16 } :L14
  .catchall { :L18 .. :L19 } :L17
  .registers 6
  .line 345
    sget-object v0, Lcom/innioasis/ipp/Schema;->staged:Ljava/util/ArrayList;
    monitor-enter v0
  :L0
  .line 346
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 347
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    new-array v1, v1, [Lcom/innioasis/y1/database/Song;
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Lcom/innioasis/y1/database/Song;
  .line 348
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 349
    monitor-exit v0
  :L2
  .line 350
    const-class v2, Lcom/innioasis/ipp/Schema;
    monitor-enter v2
  :L3
  .line 351
    sget v0, Lcom/innioasis/ipp/Schema;->gen:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Schema;->gen:I
  .line 352
    const/4 v0, 0
  :L4
    array-length v3, v1
    if-ge v0, v3, :L8
  .line 353
    aget-object v3, v1, v0
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  .line 354
    sget-object v4, Lcom/innioasis/ipp/Schema;->written:Ljava/util/HashMap;
    aget-object v5, v1, v0
    invoke-virtual { v4, v3, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 355
    sget-object v4, Lcom/innioasis/ipp/Schema;->byPath:Ljava/util/HashMap;
    if-nez v4, :L5
    const/4 v3, 0
    goto :L6
  :L5
    invoke-virtual { v4, v3 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  :L6
  .line 356
    if-eqz v3, :L7
    aget-object v4, v1, v0
    if-eq v3, v4, :L7
    invoke-static { v3 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v4
    if-eqz v4, :L7
    aget-object v4, v1, v0
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Schema;->copy(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)V
  :L7
  .line 352
    add-int/lit8 v0, v0, 1
    goto :L4
  :L8
  .line 358
    monitor-exit v2
  :L9
  .line 360
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 361
    if-nez v0, :L10
    return-void
  :L10
  .line 362
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v0
    invoke-interface { v0, v1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  :L11
  .line 365
    goto :L13
  :L12
  .line 363
    move-exception v0
  .line 364
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "schema: "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    array-length v1, v1
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " row(s) not written: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L13
  .line 366
    return-void
  :L14
  .line 358
    move-exception v0
  :L15
    monitor-exit v2
  :L16
    throw v0
  :L17
  .line 349
    move-exception v1
  :L18
    monitor-exit v0
  :L19
    goto :L21
  :L20
    throw v1
  :L21
    goto :L20
.end method

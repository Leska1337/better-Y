.class public final Lcom/innioasis/ipp/Schema;
.super Ljava/lang/Object;
.source "Schema.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Schema$M67;
  }
.end annotation

.field private final static BATCH:I = 100

.field private final static FIRST:I = 18

.field private static byPath:Ljava/util/HashMap;

.field private static gen:I

.field private static indexed:Ljava/util/List;

.field private final static staged:Ljava/util/ArrayList;

.method static constructor <clinit>()V
  .registers 1
  .line 142
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Schema;->staged:Ljava/util/ArrayList;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 29
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static backfill()V
  .registers 4
  .line 106
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 107
    if-nez v0, :L0
    return-void
  :L0
  .line 108
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v1
  .line 109
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
  .line 110
    if-lez v2, :L1
  .line 111
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
  .line 112
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L1
  .line 114
    return-void
.end method

.method public static bind(Landroidx/sqlite/db/SupportSQLiteStatement;Lcom/innioasis/y1/database/Song;)V
  .registers 4
  .line 62
    const/16 v0, 18
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 63
    const/16 v0, 19
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 64
    const/16 v0, 20
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 65
    const/16 v0, 21
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 66
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getLyrics()I
    move-result p1
    int-to-long v0, p1
    const/16 p1, 22
    invoke-interface { p0, p1, v0, v1 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V
  .line 67
    return-void
.end method

.method public static columns(Ljava/util/HashMap;)V
  .registers 16
  .line 54
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
  .line 55
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
  .line 56
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
  .line 57
    new-instance v0, Landroidx/room/util/TableInfo$Column;
    const-string v3, "year"
    const-string v4, "TEXT"
    move-object v2, v0
    invoke-direct/range { v2 .. v8 }, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V
    const-string v1, "year"
    invoke-virtual { p0, v1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 58
    new-instance v0, Landroidx/room/util/TableInfo$Column;
    const-string v3, "lyrics"
    const-string v4, "INTEGER"
    const/4 v5, 1
    move-object v2, v0
    invoke-direct/range { v2 .. v8 }, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V
    const-string v1, "lyrics"
    invoke-virtual { p0, v1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 59
    return-void
.end method

.method public static fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .registers 3
  .line 80
    iget-object v0, p1, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Schema;->seen(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setAlbumArtist(Ljava/lang/String;)V
  .line 81
    iget-object v0, p1, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Schema;->seen(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setTrack(Ljava/lang/String;)V
  .line 82
    iget-object v0, p1, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/Schema;->seen(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/database/Song;->setDisc(Ljava/lang/String;)V
  .line 83
    iget-object v0, p1, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 84
    if-nez v0, :L0
    iget-object p1, p1, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
    invoke-static { p1 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L0
  .line 85
    invoke-static { v0 }, Lcom/innioasis/ipp/Schema;->seen(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Song;->setYear(Ljava/lang/String;)V
  .line 86
    return-void
.end method

.method private static fillList(Lcom/innioasis/y1/database/SongDao;Ljava/util/List;)I
  .registers 7
  .line 117
    const/4 v0, 0
    if-nez p1, :L0
    return v0
  :L0
  .line 118
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 119
    nop
  .line 120
    const/4 v2, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v0, v3, :L5
  .line 121
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 122
    invoke-static { v3 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v4
    if-nez v4, :L2
    goto :L4
  :L2
  .line 123
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/MetaCache;->get(Ljava/lang/String;)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v4
  .line 124
    if-nez v4, :L3
    goto :L4
  :L3
  .line 125
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .line 126
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 127
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    const/16 v4, 100
    if-lt v3, v4, :L4
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Schema;->flush(Lcom/innioasis/y1/database/SongDao;Ljava/util/ArrayList;)I
    move-result v3
    add-int/2addr v2, v3
  :L4
  .line 120
    add-int/lit8 v0, v0, 1
    goto :L1
  :L5
  .line 129
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Schema;->flush(Lcom/innioasis/y1/database/SongDao;Ljava/util/ArrayList;)I
    move-result p0
    add-int/2addr v2, p0
    return v2
.end method

.method private static flush(Lcom/innioasis/y1/database/SongDao;Ljava/util/ArrayList;)I
  .registers 4
  .line 133
    invoke-virtual { p1 }, Ljava/util/ArrayList;->size()I
    move-result v0
  .line 134
    if-nez v0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 135
    new-array v1, v0, [Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1, v1 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Lcom/innioasis/y1/database/Song;
    invoke-interface { p0, v1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 136
    invoke-virtual { p1 }, Ljava/util/ArrayList;->clear()V
  .line 137
    return v0
.end method

.method static declared-synchronized gen()I
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/Schema;
    monitor-enter v0
  :L0
  .line 178
    sget v1, Lcom/innioasis/ipp/Schema;->gen:I
  :L1
    monitor-exit v0
    return v1
  :L2
  .line 178
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static migrations(Landroidx/room/RoomDatabase$Builder;)Landroidx/room/RoomDatabase$Builder;
  .registers 4
  .line 49
    const/4 v0, 1
    new-array v0, v0, [Landroidx/room/migration/Migration;
    new-instance v1, Lcom/innioasis/ipp/Schema$M67;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Schema$M67;-><init>()V
    const/4 v2, 0
    aput-object v1, v0, v2
    invoke-virtual { p0, v0 }, Landroidx/room/RoomDatabase$Builder;->addMigrations([Landroidx/room/migration/Migration;)Landroidx/room/RoomDatabase$Builder;
    move-result-object p0
    return-object p0
.end method

.method public static read(Landroid/database/Cursor;Lcom/innioasis/y1/database/Song;)V
  .registers 3
  .line 204
    const-string v0, "albumArtist"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 205
    if-ltz v0, :L0
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setAlbumArtist(Ljava/lang/String;)V
  :L0
  .line 206
    const-string v0, "track"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 207
    if-ltz v0, :L1
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setTrack(Ljava/lang/String;)V
  :L1
  .line 208
    const-string v0, "disc"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 209
    if-ltz v0, :L2
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setDisc(Ljava/lang/String;)V
  :L2
  .line 210
    const-string v0, "year"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 211
    if-ltz v0, :L3
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setYear(Ljava/lang/String;)V
  :L3
  .line 212
    const-string v0, "lyrics"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 213
    if-ltz v0, :L4
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getInt(I)I
    move-result p0
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/database/Song;->setLyrics(I)V
  :L4
  .line 214
    return-void
.end method

.method static declared-synchronized row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L8 } :L10
  .registers 8
    const-class v0, Lcom/innioasis/ipp/Schema;
    monitor-enter v0
  .line 149
    const/4 v1, 0
    if-nez p0, :L0
    monitor-exit v0
    return-object v1
  :L0
  .line 150
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loaded()Ljava/util/List;
    move-result-object v2
  .line 151
    if-nez v2, :L1
    sget-object v3, Lcom/innioasis/ipp/Schema;->byPath:Ljava/util/HashMap;
    if-nez v3, :L1
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v2
  :L1
  .line 152
    if-eqz v2, :L5
    sget-object v3, Lcom/innioasis/ipp/Schema;->indexed:Ljava/util/List;
    if-eq v2, v3, :L5
  .line 153
    new-instance v3, Ljava/util/HashMap;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v4
    mul-int/lit8 v4, v4, 2
    invoke-direct { v3, v4 }, Ljava/util/HashMap;-><init>(I)V
  .line 154
    const/4 v4, 0
  :L2
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
  .line 155
    invoke-interface { v2, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 156
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    if-eqz v6, :L3
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v3, v6, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 154
    add-int/lit8 v4, v4, 1
    goto :L2
  :L4
  .line 158
    sput-object v3, Lcom/innioasis/ipp/Schema;->byPath:Ljava/util/HashMap;
  .line 159
    sput-object v2, Lcom/innioasis/ipp/Schema;->indexed:Ljava/util/List;
  :L5
  .line 161
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
  .line 148
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
  .line 89
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
  .line 166
    if-eqz p1, :L5
    iget-boolean v0, p1, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    if-nez v0, :L0
    goto :L5
  :L0
  .line 167
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 168
    if-nez p0, :L1
    return-void
  :L1
  .line 169
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Schema;->fill(Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Meta$Info;)V
  .line 170
    sget-object p1, Lcom/innioasis/ipp/Schema;->staged:Ljava/util/ArrayList;
    monitor-enter p1
  :L2
  .line 171
    invoke-virtual { p1, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 172
    monitor-exit p1
  .line 173
    return-void
  :L3
  .line 172
    move-exception p0
    monitor-exit p1
  :L4
    throw p0
  :L5
  .line 166
    return-void
.end method

.method private static text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .registers 3
  .line 70
    if-nez p2, :L0
    invoke-interface { p0, p1 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V
    goto :L1
  :L0
  .line 71
    invoke-interface { p0, p1, p2 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V
  :L1
  .line 72
    return-void
.end method

.method static unread(Lcom/innioasis/y1/database/Song;)Z
  .registers 2
  .line 94
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
  .line 95
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object p0
    if-nez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
  .line 94
    return p0
.end method

.method static write()V
  .catchall { :L0 .. :L2 } :L12
  .catchall { :L3 .. :L4 } :L9
  .catchall { :L4 .. :L6 } :L7
  .catchall { :L10 .. :L11 } :L9
  .catchall { :L13 .. :L14 } :L12
  .registers 4
  .line 184
    sget-object v0, Lcom/innioasis/ipp/Schema;->staged:Ljava/util/ArrayList;
    monitor-enter v0
  :L0
  .line 185
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 186
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    new-array v1, v1, [Lcom/innioasis/y1/database/Song;
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Lcom/innioasis/y1/database/Song;
  .line 187
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 188
    monitor-exit v0
  :L2
  .line 189
    const-class v2, Lcom/innioasis/ipp/Schema;
    monitor-enter v2
  :L3
  .line 190
    sget v0, Lcom/innioasis/ipp/Schema;->gen:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Schema;->gen:I
  .line 191
    monitor-exit v2
  :L4
  .line 193
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 194
    if-nez v0, :L5
    return-void
  :L5
  .line 195
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v0
    invoke-interface { v0, v1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 196
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L6
  .line 199
    goto :L8
  :L7
  .line 197
    move-exception v0
  .line 198
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
  :L8
  .line 200
    return-void
  :L9
  .line 191
    move-exception v0
  :L10
    monitor-exit v2
  :L11
    throw v0
  :L12
  .line 188
    move-exception v1
  :L13
    monitor-exit v0
  :L14
    throw v1
.end method

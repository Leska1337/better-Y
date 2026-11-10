.class final Lcom/innioasis/ipp/Moved;
.super Ljava/lang/Object;
.source "Moved.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Moved$Row;,
    Lcom/innioasis/ipp/Moved$Requeue;
  }
.end annotation

.field final static COLS:Ljava/lang/String; = ", songId, name, fileDate, songName, artist, album, date, isAudiobook, lowerName, pinyinName"

.field private final static TWICE:Ljava/lang/Object;

.field private final gone:Ljava/util/ArrayList;

.field private final loose:Ljava/util/HashMap;

.field private final strict:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 34
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Moved;->TWICE:Ljava/lang/Object;
    return-void
.end method

.method constructor <init>()V
  .registers 2
  .line 29
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 36
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Moved;->strict:Ljava/util/HashMap;
  .line 37
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Moved;->loose:Ljava/util/HashMap;
  .line 38
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Moved;->gone:Ljava/util/ArrayList;
    return-void
.end method

.method private static prefs(Ljava/util/HashMap;)V
  .registers 10
  .line 150
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v0
  .line 151
    if-nez v0, :L0
    return-void
  :L0
  .line 152
    invoke-interface { v0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v1
  .line 153
    nop
  .line 154
    invoke-virtual { p0 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
    const/4 v3, 0
    const/4 v4, 0
  :L1
  .line 155
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v5
    const/4 v6, 1
    if-eqz v5, :L3
  .line 156
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/Map$Entry;
  .line 157
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/String;
    invoke-static { v7 }, Lcom/innioasis/ipp/Likes;->key(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
  .line 158
    invoke-interface { v0, v7 }, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    move-result v8
    if-nez v8, :L2
    goto :L1
  :L2
  .line 159
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/Moved$Row;
    iget-object v4, v4, Lcom/innioasis/ipp/Moved$Row;->path:Ljava/lang/String;
    invoke-static { v4 }, Lcom/innioasis/ipp/Likes;->key(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-interface { v0, v7, v3 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v5
    invoke-interface { v1, v4, v5 }, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
  .line 160
    invoke-interface { v1, v7 }, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 161
    nop
  .line 162
    const/4 v4, 1
    goto :L1
  :L3
  .line 163
    invoke-interface { v0 }, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Map;->entrySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L4
  .line 164
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L8
  .line 165
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
  .line 166
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 167
    const-string v5, "thumb\u0001"
    invoke-virtual { v3, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :L4
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v7
    instance-of v7, v7, Ljava/lang/String;
    if-nez v7, :L5
    goto :L4
  :L5
  .line 168
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { p0, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/Moved$Row;
  .line 169
    if-nez v2, :L6
    goto :L4
  :L6
  .line 171
    invoke-virtual { v5 }, Ljava/lang/String;->length()I
    move-result v4
    invoke-virtual { v3, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v4
  .line 172
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->isEnc(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :L7
  .line 173
    new-instance v7, Lcom/innioasis/y1/database/Song;
    invoke-direct { v7 }, Lcom/innioasis/y1/database/Song;-><init>()V
  .line 174
    iget-object v8, v2, Lcom/innioasis/ipp/Moved$Row;->path:Ljava/lang/String;
    invoke-virtual { v7, v8 }, Lcom/innioasis/y1/database/Song;->setPath(Ljava/lang/String;)V
  .line 175
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v7, v4 }, Lcom/innioasis/y1/database/Song;->setAlbum(Ljava/lang/String;)V
  .line 176
    invoke-interface { v1, v3 }, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 177
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static { v7 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
  :L7
  .line 179
    iget-object v2, v2, Lcom/innioasis/ipp/Moved$Row;->path:Ljava/lang/String;
    invoke-interface { v1, v3, v2 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
  .line 180
    nop
  .line 181
    const/4 v4, 1
    goto :L4
  :L8
  .line 182
    if-eqz v4, :L9
    invoke-interface { v1 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L9
  .line 183
    return-void
.end method

.method private static put(Ljava/util/HashMap;Ljava/lang/String;Lcom/innioasis/ipp/Moved$Row;)V
  .registers 4
  .line 71
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    sget-object p2, Lcom/innioasis/ipp/Moved;->TWICE:Ljava/lang/Object;
  :L0
    invoke-virtual { p0, p1, p2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 72
    return-void
.end method

.method private static row(Landroid/database/Cursor;Ljava/lang/String;)Lcom/innioasis/ipp/Moved$Row;
  .registers 6
  .line 48
    new-instance v0, Lcom/innioasis/ipp/Moved$Row;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Moved$Row;-><init>()V
  .line 49
    iput-object p1, v0, Lcom/innioasis/ipp/Moved$Row;->path:Ljava/lang/String;
  .line 50
    const/4 p1, 2
    invoke-interface { p0, p1 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object p1
    iput-object p1, v0, Lcom/innioasis/ipp/Moved$Row;->id:Ljava/lang/String;
  .line 51
    const/4 p1, 3
    invoke-interface { p0, p1 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object p1
    iput-object p1, v0, Lcom/innioasis/ipp/Moved$Row;->name:Ljava/lang/String;
  .line 52
    const/16 p1, 8
    invoke-interface { p0, p1 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v1
    iput-wide v1, v0, Lcom/innioasis/ipp/Moved$Row;->date:J
  .line 53
    const/16 p1, 10
    invoke-interface { p0, p1 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object p1
    iput-object p1, v0, Lcom/innioasis/ipp/Moved$Row;->lower:Ljava/lang/String;
  .line 54
    const/16 p1, 11
    invoke-interface { p0, p1 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object p1
    iput-object p1, v0, Lcom/innioasis/ipp/Moved$Row;->pinyin:Ljava/lang/String;
  .line 55
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v1, 4
    invoke-interface { p0, v1 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v1
    invoke-virtual { p1, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v1, "\u0000"
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const/4 v2, 5
    invoke-interface { p0, v2 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const/4 v3, 6
    invoke-interface { p0, v3 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const/4 v3, 7
    invoke-interface { p0, v3 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
  .line 56
    const/16 v1, 9
    invoke-interface { p0, v1 }, Landroid/database/Cursor;->getInt(I)I
    move-result v1
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    iput-object p1, v0, Lcom/innioasis/ipp/Moved$Row;->tags:Ljava/lang/String;
  .line 58
    invoke-interface { p0, v2 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object p0
  .line 59
    if-eqz p0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p1
    if-lez p1, :L0
    const-string p1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    iput-boolean p0, v0, Lcom/innioasis/ipp/Moved$Row;->titled:Z
  .line 60
    return-object v0
.end method

.method private static tables(Landroidx/room/RoomDatabase;Ljava/util/List;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 11
  .line 121
    invoke-virtual { p0 }, Landroidx/room/RoomDatabase;->beginTransaction()V
  :L0
  .line 123
    invoke-virtual { p0 }, Landroidx/room/RoomDatabase;->getOpenHelper()Landroidx/sqlite/db/SupportSQLiteOpenHelper;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/sqlite/db/SupportSQLiteOpenHelper;->getWritableDatabase()Landroidx/sqlite/db/SupportSQLiteDatabase;
    move-result-object v0
  .line 124
    const-string v1, "create temp table if not exists ipp_moved (old text primary key, new text not null, date integer not null)"
    invoke-interface { v0, v1 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 125
    const-string v1, "delete from ipp_moved"
    invoke-interface { v0, v1 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 126
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L2
  .line 127
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, [Ljava/lang/Object;
  .line 128
    aget-object v4, v3, v1
    check-cast v4, Lcom/innioasis/ipp/Moved$Row;
  .line 129
    const/4 v5, 1
    aget-object v3, v3, v5
    check-cast v3, Lcom/innioasis/ipp/Moved$Row;
  .line 130
    const-string v6, "insert or replace into ipp_moved (old, new, date) values (?, ?, ?)"
    const/4 v7, 3
    new-array v7, v7, [Ljava/lang/Object;
    iget-object v8, v4, Lcom/innioasis/ipp/Moved$Row;->id:Ljava/lang/String;
    aput-object v8, v7, v1
    iget-object v3, v3, Lcom/innioasis/ipp/Moved$Row;->id:Ljava/lang/String;
    aput-object v3, v7, v5
    iget-wide v3, v4, Lcom/innioasis/ipp/Moved$Row;->date:J
  .line 131
    invoke-static { v3, v4 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v3
    const/4 v4, 2
    aput-object v3, v7, v4
  .line 130
    invoke-interface { v0, v6, v7 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
  .line 126
    add-int/lit8 v2, v2, 1
    goto :L1
  :L2
  .line 133
    const-string p1, "create index if not exists ipp_moved_new on ipp_moved (new)"
    invoke-interface { v0, p1 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 134
    const-string p1, " where songId in (select old from ipp_moved)"
  .line 135
    const-string v1, " set songId = (select new from ipp_moved where old = songId)"
  .line 136
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "update SongCatPlaylist"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-interface { v0, v2 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 137
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "update Bookmark"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-interface { v0, v2 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 138
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "update or replace Progress"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-interface { v0, p1 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 139
    const-string p1, "update Song set date = (select date from ipp_moved where new = songId) where songId in (select new from ipp_moved)"
    invoke-interface { v0, p1 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 141
    const-string p1, "drop table ipp_moved"
    invoke-interface { v0, p1 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 142
    invoke-virtual { p0 }, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
  :L3
  .line 144
    invoke-virtual { p0 }, Landroidx/room/RoomDatabase;->endTransaction()V
  .line 145
    nop
  .line 146
    return-void
  :L4
  .line 144
    move-exception p1
    invoke-virtual { p0 }, Landroidx/room/RoomDatabase;->endTransaction()V
  .line 145
    goto :L6
  :L5
    throw p1
  :L6
    goto :L5
.end method

.method fresh(Landroid/database/Cursor;Ljava/lang/String;)V
  .registers 5
  .line 65
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Moved;->row(Landroid/database/Cursor;Ljava/lang/String;)Lcom/innioasis/ipp/Moved$Row;
    move-result-object p1
  .line 66
    iget-object p2, p0, Lcom/innioasis/ipp/Moved;->strict:Ljava/util/HashMap;
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v1, p1, Lcom/innioasis/ipp/Moved$Row;->name:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "\u0000"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-object v1, p1, Lcom/innioasis/ipp/Moved$Row;->tags:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { p2, v0, p1 }, Lcom/innioasis/ipp/Moved;->put(Ljava/util/HashMap;Ljava/lang/String;Lcom/innioasis/ipp/Moved$Row;)V
  .line 67
    iget-boolean p2, p1, Lcom/innioasis/ipp/Moved$Row;->titled:Z
    if-eqz p2, :L0
    iget-object p2, p0, Lcom/innioasis/ipp/Moved;->loose:Ljava/util/HashMap;
    iget-object v0, p1, Lcom/innioasis/ipp/Moved$Row;->tags:Ljava/lang/String;
    invoke-static { p2, v0, p1 }, Lcom/innioasis/ipp/Moved;->put(Ljava/util/HashMap;Ljava/lang/String;Lcom/innioasis/ipp/Moved$Row;)V
  :L0
  .line 68
    return-void
.end method

.method old(Landroid/database/Cursor;Ljava/lang/String;)V
  .registers 4
  .line 76
    iget-object v0, p0, Lcom/innioasis/ipp/Moved;->gone:Ljava/util/ArrayList;
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Moved;->row(Landroid/database/Cursor;Ljava/lang/String;)Lcom/innioasis/ipp/Moved$Row;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 77
    return-void
.end method

.method relink(Landroidx/room/RoomDatabase;)I
  .catchall { :L11 .. :L12 } :L13
  .catchall { :L14 .. :L15 } :L16
  .registers 11
  .line 84
    iget-object v0, p0, Lcom/innioasis/ipp/Moved;->strict:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->isEmpty()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L19
    iget-object v0, p0, Lcom/innioasis/ipp/Moved;->gone:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L19
  :L0
  .line 85
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 86
    const/4 v2, 0
  :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Moved;->gone:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    const/4 v4, 1
    if-ge v2, v3, :L5
  .line 87
    iget-object v3, p0, Lcom/innioasis/ipp/Moved;->gone:Ljava/util/ArrayList;
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Moved$Row;
  .line 88
    iget-object v5, p0, Lcom/innioasis/ipp/Moved;->strict:Ljava/util/HashMap;
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v7, v3, Lcom/innioasis/ipp/Moved$Row;->name:Ljava/lang/String;
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, "\u0000"
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    iget-object v7, v3, Lcom/innioasis/ipp/Moved$Row;->tags:Ljava/lang/String;
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5, v6 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
  .line 89
    if-nez v5, :L2
    iget-boolean v6, v3, Lcom/innioasis/ipp/Moved$Row;->titled:Z
    if-eqz v6, :L2
    iget-object v5, p0, Lcom/innioasis/ipp/Moved;->loose:Ljava/util/HashMap;
    iget-object v6, v3, Lcom/innioasis/ipp/Moved$Row;->tags:Ljava/lang/String;
    invoke-virtual { v5, v6 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
  :L2
  .line 90
    instance-of v6, v5, Lcom/innioasis/ipp/Moved$Row;
    if-nez v6, :L3
    goto :L4
  :L3
  .line 91
    move-object v6, v5
    check-cast v6, Lcom/innioasis/ipp/Moved$Row;
    iget v7, v6, Lcom/innioasis/ipp/Moved$Row;->claims:I
    add-int/2addr v7, v4
    iput v7, v6, Lcom/innioasis/ipp/Moved$Row;->claims:I
  .line 92
    const/4 v6, 2
    new-array v6, v6, [Ljava/lang/Object;
    aput-object v3, v6, v1
    aput-object v5, v6, v4
    invoke-virtual { v0, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 86
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 94
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
  .line 95
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 96
    const/4 v5, 0
  :L6
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v6
    if-ge v5, v6, :L9
  .line 97
    invoke-virtual { v0, v5 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, [Ljava/lang/Object;
  .line 98
    aget-object v7, v6, v4
    check-cast v7, Lcom/innioasis/ipp/Moved$Row;
  .line 99
    iget v8, v7, Lcom/innioasis/ipp/Moved$Row;->claims:I
    if-eq v8, v4, :L7
    goto :L8
  :L7
  .line 100
    invoke-virtual { v3, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 101
    aget-object v6, v6, v1
    check-cast v6, Lcom/innioasis/ipp/Moved$Row;
    iget-object v6, v6, Lcom/innioasis/ipp/Moved$Row;->path:Ljava/lang/String;
    invoke-virtual { v2, v6, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L8
  .line 96
    add-int/lit8 v5, v5, 1
    goto :L6
  :L9
  .line 103
    invoke-virtual { v3 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L10
    return v1
  :L10
  .line 104
    nop
  :L11
  .line 106
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/Moved;->tables(Landroidx/room/RoomDatabase;Ljava/util/List;)V
  :L12
  .line 107
    nop
  .line 110
    goto :L14
  :L13
  .line 108
    move-exception p1
  .line 109
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "library scan: moved files not relinked in the database: "
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
    const/4 v4, 0
  :L14
  .line 112
    invoke-static { v2 }, Lcom/innioasis/ipp/Moved;->prefs(Ljava/util/HashMap;)V
  :L15
  .line 114
    goto :L17
  :L16
  .line 113
    move-exception p1
  :L17
  .line 115
    new-instance p1, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-direct { p1, v0 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v0, Lcom/innioasis/ipp/Moved$Requeue;
    invoke-direct { v0, v2 }, Lcom/innioasis/ipp/Moved$Requeue;-><init>(Ljava/util/HashMap;)V
    invoke-virtual { p1, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 116
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v0, "library scan: "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v0
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, " moved file(s) keep their links"
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 117
    if-eqz v4, :L18
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v1
  :L18
    return v1
  :L19
  .line 84
    return v1
.end method

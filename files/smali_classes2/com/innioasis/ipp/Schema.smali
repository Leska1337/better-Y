.class public final Lcom/innioasis/ipp/Schema;
.super Ljava/lang/Object;
.source "Schema.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Schema$M67;
  }
.end annotation

.field private final static FIRST:I = 18

.method private constructor <init>()V
  .registers 1
  .line 24
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static bind(Landroidx/sqlite/db/SupportSQLiteStatement;Lcom/innioasis/y1/database/Song;)V
  .registers 4
  .line 57
    const/16 v0, 18
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 58
    const/16 v0, 19
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 59
    const/16 v0, 20
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 60
    const/16 v0, 21
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Schema;->text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .line 61
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getLyrics()I
    move-result p1
    int-to-long v0, p1
    const/16 p1, 22
    invoke-interface { p0, p1, v0, v1 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V
  .line 62
    return-void
.end method

.method public static columns(Ljava/util/HashMap;)V
  .registers 16
  .line 49
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
  .line 50
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
  .line 51
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
  .line 52
    new-instance v0, Landroidx/room/util/TableInfo$Column;
    const-string v3, "year"
    const-string v4, "TEXT"
    move-object v2, v0
    invoke-direct/range { v2 .. v8 }, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V
    const-string v1, "year"
    invoke-virtual { p0, v1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 53
    new-instance v0, Landroidx/room/util/TableInfo$Column;
    const-string v3, "lyrics"
    const-string v4, "INTEGER"
    const/4 v5, 1
    move-object v2, v0
    invoke-direct/range { v2 .. v8 }, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V
    const-string v1, "lyrics"
    invoke-virtual { p0, v1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 54
    return-void
.end method

.method public static migrations(Landroidx/room/RoomDatabase$Builder;)Landroidx/room/RoomDatabase$Builder;
  .registers 4
  .line 44
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
  .line 71
    const-string v0, "albumArtist"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 72
    if-ltz v0, :L0
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setAlbumArtist(Ljava/lang/String;)V
  :L0
  .line 73
    const-string v0, "track"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 74
    if-ltz v0, :L1
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setTrack(Ljava/lang/String;)V
  :L1
  .line 75
    const-string v0, "disc"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 76
    if-ltz v0, :L2
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setDisc(Ljava/lang/String;)V
  :L2
  .line 77
    const-string v0, "year"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 78
    if-ltz v0, :L3
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/database/Song;->setYear(Ljava/lang/String;)V
  :L3
  .line 79
    const-string v0, "lyrics"
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v0
  .line 80
    if-ltz v0, :L4
    invoke-interface { p0, v0 }, Landroid/database/Cursor;->getInt(I)I
    move-result p0
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/database/Song;->setLyrics(I)V
  :L4
  .line 81
    return-void
.end method

.method private static text(Landroidx/sqlite/db/SupportSQLiteStatement;ILjava/lang/String;)V
  .registers 3
  .line 65
    if-nez p2, :L0
    invoke-interface { p0, p1 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V
    goto :L1
  :L0
  .line 66
    invoke-interface { p0, p1, p2 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V
  :L1
  .line 67
    return-void
.end method

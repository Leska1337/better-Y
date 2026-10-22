.class final Lcom/innioasis/ipp/Schema$M78;
.super Landroidx/room/migration/Migration;
.source "Schema.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Schema;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "M78"
.end annotation

.method constructor <init>()V
  .registers 3
  .line 58
    const/4 v0, 7
    const/16 v1, 8
    invoke-direct { p0, v0, v1 }, Landroidx/room/migration/Migration;-><init>(II)V
    return-void
.end method

.method private static refs(Landroidx/sqlite/db/SupportSQLiteDatabase;Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L6
  .registers 9
  .line 69
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 70
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "SELECT DISTINCT `songId` FROM `"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "` WHERE substr(`songId`, 1, 1) <> '/'"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-interface { p0, v1 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->query(Ljava/lang/String;)Landroid/database/Cursor;
    move-result-object v1
  :L0
  .line 72
    invoke-interface { v1 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v2
    const/4 v3, 0
    if-eqz v2, :L2
    invoke-interface { v1, v3 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
    goto :L0
  :L2
  .line 74
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  .line 75
    nop
  .line 76
    const/4 v1, 0
  :L3
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v1, v2, :L5
  .line 77
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Schema;->pathOf(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 79
    if-eqz v4, :L4
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "UPDATE OR REPLACE `"
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v6, "` SET `songId` = ? WHERE `songId` = ?"
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    const/4 v6, 2
    new-array v6, v6, [Ljava/lang/Object;
    aput-object v4, v6, v3
    const/4 v4, 1
    aput-object v2, v6, v4
    invoke-interface { p0, v5, v6 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
  :L4
  .line 76
    add-int/lit8 v1, v1, 1
    goto :L3
  :L5
  .line 82
    return-void
  :L6
  .line 74
    move-exception p0
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  .line 75
    goto :L8
  :L7
    throw p0
  :L8
    goto :L7
.end method

.method public migrate(Landroidx/sqlite/db/SupportSQLiteDatabase;)V
  .registers 3
  .line 62
    const-string v0, "UPDATE OR IGNORE `Song` SET `songId` = `path` WHERE `songId` <> `path`"
    invoke-interface { p1, v0 }, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V
  .line 63
    const-string v0, "SongCatPlaylist"
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Schema$M78;->refs(Landroidx/sqlite/db/SupportSQLiteDatabase;Ljava/lang/String;)V
  .line 64
    const-string v0, "Progress"
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Schema$M78;->refs(Landroidx/sqlite/db/SupportSQLiteDatabase;Ljava/lang/String;)V
  .line 65
    const-string v0, "Bookmark"
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Schema$M78;->refs(Landroidx/sqlite/db/SupportSQLiteDatabase;Ljava/lang/String;)V
  .line 66
    return-void
.end method

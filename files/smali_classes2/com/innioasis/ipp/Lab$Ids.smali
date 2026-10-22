.class final Lcom/innioasis/ipp/Lab$Ids;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Lab.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lab;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Ids"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 153
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static decode(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 218
    new-instance v0, Ljava/lang/String;
    const/4 v1, 0
    invoke-static { p0, v1 }, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
    move-result-object p0
    const-string v1, "UTF-8"
    invoke-direct { v0, p0, v1 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
  :L1
    return-object v0
  :L2
  .line 219
    move-exception p0
  .line 220
    const/4 p0, 0
    return-object p0
.end method

.method private static refs(Landroidx/room/RoomDatabase;Ljava/lang/String;)V
  .registers 12
  .line 197
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "select count(*) from "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const/4 v1, 0
    invoke-virtual { p0, v0, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v0
  .line 198
    invoke-interface { v0 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v2
    const/4 v3, 0
    if-eqz v2, :L0
    invoke-interface { v0, v3 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v4
    goto :L1
  :L0
    const-wide/16 v4, -1
  :L1
  .line 199
    invoke-interface { v0 }, Landroid/database/Cursor;->close()V
  .line 200
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "select songId from "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " where songId not in (select songId from song)"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object p0
  .line 201
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L2
  .line 202
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v6
    const-string v7, "ids "
    const-string v8, "ipplab"
    if-eqz v6, :L5
  .line 203
    add-int/lit8 v0, v0, 1
  .line 204
    invoke-interface { p0, v3 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Lab$Ids;->decode(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 205
    if-eqz v6, :L3
    const-string v9, "/storage/"
    invoke-virtual { v6, v9 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v9
    if-eqz v9, :L3
  .line 206
    add-int/lit8 v1, v1, 1
  .line 207
    new-instance v9, Ljava/io/File;
    invoke-direct { v9, v6 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v9 }, Ljava/io/File;->exists()Z
    move-result v9
    if-eqz v9, :L3
    add-int/lit8 v2, v2, 1
  :L3
  .line 209
    const/4 v9, 3
    if-gt v0, v9, :L4
    new-instance v9, Ljava/lang/StringBuilder;
    invoke-direct { v9 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v9, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v9, " orphan decodes to "
    invoke-virtual { v7, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, " ("
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-interface { p0, v3 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, ")"
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-static { v8, v6 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L4
  .line 210
    goto :L2
  :L5
  .line 211
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 212
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p0, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, ": "
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, " rows, "
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, " not in song, "
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, " decode to a path, "
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, " of those exist"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { v8, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 214
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L13 } :L14
  .registers 23
  .line 156
    const-string v1, "ipplab"
  :L0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v0
  .line 157
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
  .line 158
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 159
    nop
  .line 160
    nop
  .line 161
    const-string v5, "select songId, path from song"
    const/4 v6, 0
    invoke-virtual { v0, v5, v6 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v5
    const-wide/16 v7, 0
    move-wide v10, v7
    const/4 v6, 0
    const/4 v12, 0
    const/4 v13, 0
    const/4 v14, 0
    const/4 v15, 0
    const/16 v16, 0
    const/16 v17, 0
  :L1
  .line 162
    invoke-interface { v5 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v18
    if-eqz v18, :L11
  .line 163
    move-object/from16 v19, v0
    const/4 v9, 0
    invoke-interface { v5, v9 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
    const/4 v9, 1
    invoke-interface { v5, v9 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v9
  .line 164
    add-int/lit8 v12, v12, 1
  .line 165
    move/from16 v18, v12
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v12
    move-wide/from16 v20, v3
    int-to-long v3, v12
    add-long/2addr v7, v3
  .line 166
    invoke-virtual { v9 }, Ljava/lang/String;->length()I
    move-result v3
    int-to-long v3, v3
    add-long/2addr v10, v3
  .line 167
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v3
    if-le v3, v13, :L2
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v13
  :L2
  .line 168
    const/16 v3, 10
    invoke-virtual { v0, v3 }, Ljava/lang/String;->indexOf(I)I
    move-result v3
    if-ltz v3, :L3
    add-int/lit8 v14, v14, 1
  :L3
  .line 169
    invoke-virtual { v0, v9 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L4
  .line 170
    add-int/lit8 v15, v15, 1
    goto/16 :L10
  :L4
  .line 171
    invoke-virtual { v2, v9 }, Lcom/innioasis/music/util/Other;->toBase64(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
  .line 172
    add-int/lit8 v6, v6, 1
    goto :L10
  :L5
  .line 173
    const-string v3, "/storage/sdcard0/audiobooks"
    invoke-virtual { v9, v3 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L7
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "/storage/sdcard0/Audiobooks"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
  .line 174
    const/16 v4, 27
    invoke-virtual { v9, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Lcom/innioasis/music/util/Other;->toBase64(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L6
  .line 175
    move/from16 v3, v16
    add-int/lit8 v16, v3, 1
    goto :L10
  :L6
  .line 174
    move/from16 v3, v16
    goto :L8
  :L7
  .line 173
    move/from16 v3, v16
  :L8
  .line 177
    move/from16 v4, v17
    add-int/lit8 v17, v4, 1
    const/4 v12, 5
    if-ge v4, v12, :L9
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v12, "id bad: path "
    invoke-virtual { v4, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v9, " id decodes to "
    invoke-virtual { v4, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab$Ids;->decode(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L9
  .line 179
    move/from16 v16, v3
  :L10
    move/from16 v12, v18
    move-object/from16 v0, v19
    move-wide/from16 v3, v20
    goto/16 :L1
  :L11
  .line 180
    move-object/from16 v19, v0
    move-wide/from16 v20, v3
    move/from16 v3, v16
    move/from16 v4, v17
    invoke-interface { v5 }, Landroid/database/Cursor;->close()V
  .line 181
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "ids song: "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v12 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " rows, path "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v15 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, ", base64 "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, ", Audiobooks "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, ", other "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, ", with newline "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v14 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, ", id chars "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " (max "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v13 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, "), path chars "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, ", "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 183
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sub-long v2, v2, v20
    invoke-virtual { v0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " ms"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 181
    invoke-static { v1, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 184
    const-string v0, "select count(*), count(distinct path), count(distinct lower(path)) from song"
    move-object/from16 v2, v19
    const/4 v3, 0
    invoke-virtual { v2, v0, v3 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v0
  .line 185
    invoke-interface { v0 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v3
    if-eqz v3, :L12
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "ids paths: "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/4 v4, 0
    invoke-interface { v0, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v4
    invoke-virtual { v3, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " rows, "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/4 v4, 1
    invoke-interface { v0, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v4
    invoke-virtual { v3, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " distinct, "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
  .line 186
    const/4 v4, 2
    invoke-interface { v0, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v4
    invoke-virtual { v3, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " distinct ignoring case"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
  .line 185
    invoke-static { v1, v3 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L12
  .line 187
    invoke-interface { v0 }, Landroid/database/Cursor;->close()V
  .line 188
    const-string v0, "songCatPlaylist"
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/Lab$Ids;->refs(Landroidx/room/RoomDatabase;Ljava/lang/String;)V
  .line 189
    const-string v0, "Progress"
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/Lab$Ids;->refs(Landroidx/room/RoomDatabase;Ljava/lang/String;)V
  .line 190
    const-string v0, "Bookmark"
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/Lab$Ids;->refs(Landroidx/room/RoomDatabase;Ljava/lang/String;)V
  :L13
  .line 193
    goto :L15
  :L14
  .line 191
    move-exception v0
  .line 192
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "ids failed "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L15
  .line 194
    return-void
.end method

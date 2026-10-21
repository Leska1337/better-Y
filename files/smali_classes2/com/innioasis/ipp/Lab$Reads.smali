.class final Lcom/innioasis/ipp/Lab$Reads;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Lab.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lab;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Reads"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 93
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static check(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
  .registers 18
  .line 106
    move-object/from16 v0, p0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 107
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Albums;->ordered(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v3
  .line 108
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 109
    sget-object v6, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v6 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v6
    invoke-virtual { v6, v0 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsList(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Albums;->shared(Ljava/util/List;)Ljava/util/List;
    move-result-object v6
  .line 110
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
  .line 111
    const-string v9, "check "
    const-string v10, "ipplab"
    const/4 v11, 0
    if-eqz v3, :L4
    if-nez v6, :L0
    goto/16 :L4
  :L0
  .line 115
    nop
  .line 116
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v12
    invoke-interface { v6 }, Ljava/util/List;->size()I
    move-result v13
    invoke-static { v12, v13 }, Ljava/lang/Math;->min(II)I
    move-result v12
  .line 117
    const/4 v13, -1
    const/4 v13, 0
    const/4 v14, -1
  :L1
    if-ge v11, v12, :L3
  .line 118
    invoke-interface { v3, v11 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v15
    move/from16 v16, v12
    invoke-interface { v6, v11 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v12
    if-eq v15, v12, :L2
  .line 119
    add-int/lit8 v13, v13, 1
  .line 120
    if-gez v14, :L2
    move v14, v11
  :L2
  .line 117
    add-int/lit8 v11, v11, 1
    move/from16 v12, v16
    goto :L1
  :L3
  .line 123
    new-instance v11, Ljava/lang/StringBuilder;
    invoke-direct { v11 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v11, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    invoke-virtual { v9, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v9, ": "
    invoke-virtual { v0, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, "/"
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-interface { v6 }, Ljava/util/List;->size()I
    move-result v3
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, " rows, "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v13 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, " positions differ (first "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v14 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, "), ordered "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sub-long v1, v4, v1
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms, full "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sub-long/2addr v7, v4
    invoke-virtual { v0, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v10, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 125
    return-void
  :L4
  .line 112
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ": ordered "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const/4 v1, 1
    if-eqz v3, :L5
    const/4 v2, 1
    goto :L6
  :L5
    const/4 v2, 0
  :L6
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " full "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    if-eqz v6, :L7
    const/4 v11, 1
  :L7
    invoke-virtual { v0, v11 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v10, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 113
    return-void
.end method

.method private static chunks(I)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L1 .. :L5 } :L9
  .registers 15
  .line 157
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 158
    nop
  .line 159
    const-wide/16 v2, -1
    const/4 v4, 0
    const/4 v5, 0
    const/4 v6, 0
  :L0
  .line 161
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v7
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct { v8 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v9, "select rowid, * from song where rowid > "
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v8
    const-string v9, " order by rowid limit "
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v8
    const/4 v9, 0
    invoke-virtual { v7, v8, v9 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v7
  .line 163
    nop
  :L1
  .line 165
    invoke-interface { v7 }, Landroid/database/Cursor;->getColumnCount()I
    move-result v8
    const/4 v9, 0
  :L2
  .line 166
    invoke-interface { v7 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v10
    const/4 v11, 1
    if-eqz v10, :L7
  .line 167
    invoke-interface { v7, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v2
  .line 168
    const/4 v10, 1
  :L3
    if-ge v10, v8, :L6
  .line 169
    invoke-interface { v7, v10 }, Landroid/database/Cursor;->getType(I)I
    move-result v12
  .line 170
    const/4 v13, 3
    if-ne v12, v13, :L4
    invoke-interface { v7, v10 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    goto :L5
  :L4
  .line 171
    if-ne v12, v11, :L5
    invoke-interface { v7, v10 }, Landroid/database/Cursor;->getLong(I)J
  :L5
  .line 168
    add-int/lit8 v10, v10, 1
    goto :L3
  :L6
  .line 173
    add-int/lit8 v9, v9, 1
    goto :L2
  :L7
  .line 176
    invoke-interface { v7 }, Landroid/database/Cursor;->close()V
  .line 177
    nop
  .line 178
    add-int/2addr v6, v11
  .line 179
    add-int/2addr v5, v9
  .line 180
    if-ge v9, p0, :L8
  .line 182
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "chunks of "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, ": "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, " rows in "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, " parts, "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 183
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sub-long/2addr v2, v0
    invoke-virtual { p0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " ms"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  .line 182
    const-string v0, "ipplab"
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 184
    return-void
  :L8
  .line 181
    goto/16 :L0
  :L9
  .line 176
    move-exception p0
    invoke-interface { v7 }, Landroid/database/Cursor;->close()V
  .line 177
    goto :L11
  :L10
    throw p0
  :L11
    goto :L10
.end method

.method private static order(Ljava/lang/String;)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L0 .. :L1 } :L7
  .catchall { :L3 .. :L4 } :L6
  .registers 11
  .line 129
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 130
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v2
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "select rowid from song where isAudiobook = 0 order by "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const/4 v4, 0
    invoke-virtual { v2, v3, v4 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v2
  .line 131
    const/4 v3, 0
    const/4 v5, 0
  :L0
  .line 133
    invoke-interface { v2 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v6
    if-eqz v6, :L2
  .line 134
    invoke-interface { v2, v3 }, Landroid/database/Cursor;->getLong(I)J
  :L1
  .line 135
    add-int/lit8 v5, v5, 1
    goto :L0
  :L2
  .line 138
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  .line 139
    nop
  .line 140
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
  .line 141
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v2
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct { v8 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v9, "select path from song where isAudiobook = 0 order by "
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v2, v8, v4 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v2
  .line 142
    const/4 v4, 0
  :L3
  .line 144
    invoke-interface { v2 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v8
    if-eqz v8, :L5
  .line 145
    invoke-interface { v2, v3 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
  :L4
  .line 146
    add-int/lit8 v4, v4, 1
    goto :L3
  :L5
  .line 149
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  .line 150
    nop
  .line 151
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "order "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, ": rowid "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, " rows "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sub-long v0, v6, v0
    invoke-virtual { p0, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " ms, path "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 152
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sub-long/2addr v0, v6
    invoke-virtual { p0, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " ms"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  .line 151
    const-string v0, "ipplab"
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 153
    return-void
  :L6
  .line 149
    move-exception p0
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  .line 150
    throw p0
  :L7
  .line 138
    move-exception p0
    invoke-interface { v2 }, Landroid/database/Cursor;->close()V
  .line 139
    goto :L9
  :L8
    throw p0
  :L9
    goto :L8
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 96
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab$Reads;->check(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
  .line 97
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Time_Desc:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab$Reads;->check(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
  .line 98
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab$Reads;->check(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
  :L1
  .line 101
    goto :L3
  :L2
  .line 99
    move-exception v0
  .line 100
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "reads failed "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "ipplab"
    invoke-static { v1, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L3
  .line 102
    return-void
.end method

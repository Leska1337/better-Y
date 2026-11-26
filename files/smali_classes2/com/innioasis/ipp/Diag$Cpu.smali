.class final Lcom/innioasis/ipp/Diag$Cpu;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Diag.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Diag;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Cpu"
.end annotation

.field private static volatile running:Z

.field private final why:Ljava/lang/String;

.method private constructor <init>(Ljava/lang/String;)V
  .registers 2
  .line 130
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Diag$Cpu;->why:Ljava/lang/String;
    return-void
.end method

.method private static playing()Ljava/lang/String;
  .catchall { :L0 .. :L7 } :L8
  .registers 3
  .line 227
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 228
    if-nez v1, :L1
    move-object v1, v0
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L2
  .line 229
    if-nez v1, :L3
    move-object v1, v0
    goto :L4
  :L3
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L4
  .line 230
    if-nez v1, :L5
    return-object v0
  :L5
  .line 231
    const/16 v2, 46
    invoke-virtual { v1, v2 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v2
  .line 232
    if-gez v2, :L6
    goto :L7
  :L6
    invoke-virtual { v1, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v1
  :L7
    return-object v1
  :L8
  .line 233
    move-exception v1
  .line 234
    return-object v0
.end method

.method private static read(Ljava/lang/String;)Ljava/lang/String;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .catchall { :L0 .. :L2 } :L4
  .registers 6
  .line 215
    new-instance v0, Ljava/io/FileInputStream;
    invoke-direct { v0, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
  .line 217
    const/16 p0, 1024
  :L0
    new-array p0, p0, [B
  .line 218
    invoke-virtual { v0, p0 }, Ljava/io/FileInputStream;->read([B)I
    move-result v1
  .line 219
    if-gtz v1, :L1
    const-string p0, ""
    goto :L3
  :L1
    new-instance v2, Ljava/lang/String;
    const-string v3, "US-ASCII"
    const/4 v4, 0
    invoke-direct { v2, p0, v4, v1, v3 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
  :L2
    move-object p0, v2
  :L3
  .line 221
    invoke-virtual { v0 }, Ljava/io/FileInputStream;->close()V
  .line 219
    return-object p0
  :L4
  .line 221
    move-exception p0
    invoke-virtual { v0 }, Ljava/io/FileInputStream;->close()V
  .line 222
    throw p0
.end method

.method static request(Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 3
  .line 133
    sget-boolean v0, Lcom/innioasis/ipp/Diag$Cpu;->running:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 134
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Diag$Cpu;->running:Z
  :L1
  .line 136
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Diag$Cpu;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Diag$Cpu;-><init>(Ljava/lang/String;)V
    const-string p0, "ipp-cpu"
    invoke-direct { v0, v1, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 137
    const/16 p0, 10
    invoke-virtual { v0, p0 }, Ljava/lang/Thread;->setPriority(I)V
  .line 138
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  :L2
  .line 141
    goto :L4
  :L3
  .line 139
    move-exception p0
  .line 140
    const/4 p0, 0
    sput-boolean p0, Lcom/innioasis/ipp/Diag$Cpu;->running:Z
  :L4
  .line 142
    return-void
.end method

.method private static threads()Ljava/util/HashMap;
  .catchall { :L2 .. :L3 } :L4
  .registers 12
  .line 198
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  .line 199
    new-instance v1, Ljava/io/File;
    const-string v2, "/proc/self/task"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->list()[Ljava/lang/String;
    move-result-object v1
  .line 200
    if-nez v1, :L0
    return-object v0
  :L0
  .line 201
    const/4 v2, 0
    const/4 v3, 0
  :L1
    array-length v4, v1
    if-ge v3, v4, :L6
  :L2
  .line 203
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "/proc/self/task/"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    aget-object v5, v1, v3
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, "/stat"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Diag$Cpu;->read(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 204
    const/16 v5, 40
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
    const/16 v6, 41
    invoke-virtual { v4, v6 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v6
  .line 205
    add-int/lit8 v7, v6, 2
    invoke-virtual { v4, v7 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v7
    const-string v8, " "
    invoke-virtual { v7, v8 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v7
  .line 206
    const/16 v8, 11
    aget-object v8, v7, v8
    invoke-static { v8 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v8
    const/16 v10, 12
    aget-object v7, v7, v10
    invoke-static { v7 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v10
    add-long/2addr v8, v10
  .line 207
    aget-object v7, v1, v3
    const/4 v10, 2
    new-array v10, v10, [Ljava/lang/Object;
    const/4 v11, 1
    add-int/2addr v5, v11
    invoke-virtual { v4, v5, v6 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
    aput-object v4, v10, v2
    invoke-static { v8, v9 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v4
    aput-object v4, v10, v11
    invoke-virtual { v0, v7, v10 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 209
    goto :L5
  :L4
  .line 208
    move-exception v4
  :L5
  .line 201
    add-int/lit8 v3, v3, 1
    goto :L1
  :L6
  .line 211
    return-object v0
.end method

.method private static total()[J
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 11
  .line 184
    const-string v0, "/proc/stat"
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag$Cpu;->read(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 185
    const/16 v1, 10
    invoke-virtual { v0, v1 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
  .line 186
    const/4 v2, 0
    if-lez v1, :L0
    invoke-virtual { v0, v2, v1 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
  :L0
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    const-string v1, "\\s+"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 187
    nop
  .line 188
    const-wide/16 v3, 0
    const/4 v1, 1
    move-wide v5, v3
    const/4 v7, 1
  :L1
    array-length v8, v0
    if-ge v7, v8, :L4
  .line 189
    aget-object v8, v0, v7
    invoke-static { v8 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v8
  .line 190
    add-long/2addr v3, v8
  .line 191
    const/4 v10, 4
    if-eq v7, v10, :L2
    const/4 v10, 5
    if-ne v7, v10, :L3
  :L2
    add-long/2addr v5, v8
  :L3
  .line 188
    add-int/lit8 v7, v7, 1
    goto :L1
  :L4
  .line 193
    const/4 v0, 2
    new-array v0, v0, [J
    aput-wide v3, v0, v2
    sub-long/2addr v3, v5
    aput-wide v3, v0, v1
    return-object v0
.end method

.method public run()V
  .catchall { :L0 .. :L6 } :L15
  .catchall { :L7 .. :L13 } :L14
  .registers 21
  .line 146
    const/4 v1, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Diag$Cpu;->total()[J
    move-result-object v0
  .line 147
    invoke-static { }, Lcom/innioasis/ipp/Diag$Cpu;->threads()Ljava/util/HashMap;
    move-result-object v2
  .line 148
    const-wide/16 v3, 300
    invoke-static { v3, v4 }, Ljava/lang/Thread;->sleep(J)V
  .line 149
    invoke-static { }, Lcom/innioasis/ipp/Diag$Cpu;->total()[J
    move-result-object v3
  .line 150
    invoke-static { }, Lcom/innioasis/ipp/Diag$Cpu;->threads()Ljava/util/HashMap;
    move-result-object v4
  .line 151
    aget-wide v5, v3, v1
    aget-wide v7, v0, v1
    sub-long/2addr v5, v7
    const/4 v7, 1
    aget-wide v8, v3, v7
    aget-wide v10, v0, v7
    sub-long/2addr v8, v10
  .line 152
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 153
    nop
  .line 154
    invoke-virtual { v4 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
    const-wide/16 v10, 0
    move-wide v12, v10
  :L1
  .line 155
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L5
  .line 156
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 157
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v14
    check-cast v14, [Ljava/lang/Object;
  .line 158
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v15
    invoke-virtual { v2, v15 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, [Ljava/lang/Object;
  .line 159
    aget-object v16, v14, v7
    check-cast v16, Ljava/lang/Long;
    invoke-virtual/range { v16 .. v16 }, Ljava/lang/Long;->longValue()J
    move-result-wide v16
    if-nez v15, :L2
    move-wide/from16 v18, v10
    goto :L3
  :L2
    aget-object v15, v15, v7
    check-cast v15, Ljava/lang/Long;
    invoke-virtual { v15 }, Ljava/lang/Long;->longValue()J
    move-result-wide v18
  :L3
    sub-long v16, v16, v18
  .line 160
    cmp-long v15, v16, v10
    if-gtz v15, :L4
    goto :L1
  :L4
  .line 161
    add-long v12, v12, v16
  .line 162
    const/4 v15, 2
    new-array v15, v15, [Ljava/lang/Object;
    new-instance v10, Ljava/lang/StringBuilder;
    invoke-direct { v10 }, Ljava/lang/StringBuilder;-><init>()V
    aget-object v11, v14, v1
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v10
    const-string v11, " "
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v10, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    aput-object v4, v15, v1
    invoke-static/range { v16 .. v17 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v4
    aput-object v4, v15, v7
    invoke-virtual { v0, v15 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 163
    const-wide/16 v10, 0
    goto :L1
  :L5
  .line 164
    new-instance v2, Lcom/innioasis/ipp/Diag$ByTicks;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Diag$ByTicks;-><init>()V
    invoke-static { v0, v2 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 165
    new-instance v2, Ljava/lang/StringBuilder;
    const-string v3, "cpu "
    invoke-direct { v2, v3 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
  :L6
    move-object/from16 v3, p0
  :L7
    iget-object v4, v3, Lcom/innioasis/ipp/Diag$Cpu;->why:Ljava/lang/String;
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, ": busy "
  .line 166
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-wide/16 v10, 0
    cmp-long v4, v5, v10
    if-lez v4, :L8
    const-wide/16 v10, 100
    mul-long v10, v10, v8
    div-long/2addr v10, v5
    goto :L9
  :L8
    const-wide/16 v10, 0
  :L9
    invoke-virtual { v2, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v4, 37
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, ", ours "
  .line 167
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-wide/16 v10, 10
    mul-long v14, v12, v10
    invoke-virtual { v2, v14, v15 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, " ms, others "
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sub-long/2addr v8, v12
  .line 168
    const-wide/16 v12, 0
    invoke-static { v12, v13, v8, v9 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide v8
    mul-long v8, v8, v10
    invoke-virtual { v2, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, " ms of "
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    mul-long v5, v5, v10
    invoke-virtual { v2, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, " ms;"
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 169
    const/4 v4, 0
  :L10
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v5
    if-ge v4, v5, :L11
    const/4 v5, 6
    if-ge v4, v5, :L11
  .line 170
    invoke-virtual { v0, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, [Ljava/lang/Object;
  .line 171
    const/16 v6, 32
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v8
    aget-object v9, v5, v1
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v6
    aget-object v5, v5, v7
    check-cast v5, Ljava/lang/Long;
    invoke-virtual { v5 }, Ljava/lang/Long;->longValue()J
    move-result-wide v8
    mul-long v8, v8, v10
    invoke-virtual { v6, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
  .line 169
    add-int/lit8 v4, v4, 1
    goto :L10
  :L11
  .line 173
    invoke-static { }, Lcom/innioasis/ipp/Diag$Cpu;->playing()Ljava/lang/String;
    move-result-object v0
  .line 174
    if-eqz v0, :L12
    const-string v4, "; playing "
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L12
  .line 175
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L13
    goto :L16
  :L14
  .line 176
    move-exception v0
    goto :L16
  :L15
    move-exception v0
    move-object/from16 v3, p0
  :L16
  .line 178
    sput-boolean v1, Lcom/innioasis/ipp/Diag$Cpu;->running:Z
  .line 179
    nop
  .line 180
    return-void
.end method

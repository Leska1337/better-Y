.class public final Lcom/innioasis/ipp/Scan;
.super Ljava/lang/Object;
.source "Scan.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Scan$Builder;
  }
.end annotation

.field private final static GAP_MS:J = 5000L

.field private final static IDLE_MS:J = 5000L

.field private final static LOCK:Ljava/lang/Object;

.field private final static LOOK:I = 4

.field private final static MARKER:Lcom/innioasis/y1/database/Song;

.field private final static WAIT_MS:J = 20000L

.field private static asked:J

.field private final static building:Ljava/util/HashSet;

.field private static dir:Ljava/lang/String;

.field private static files:[Ljava/io/File;

.field private static live:I

.field private static next:I

.field private static volatile paths:Ljava/util/HashSet;

.field private final static ready:Ljava/util/HashMap;

.field private static repo:Lcom/innioasis/y1/database/Y1Repository;

.method static constructor <clinit>()V
  .registers 1
  .line 77
    new-instance v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { v0 }, Lcom/innioasis/y1/database/Song;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
  .line 146
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
  .line 154
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 155
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 53
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/lang/Object;
  .registers 1
  .line 51
    sget-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    return-object v0
.end method

.method static synthetic access$110()I
  .registers 2
  .line 51
    sget v0, Lcom/innioasis/ipp/Scan;->live:I
    add-int/lit8 v1, v0, -1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
    return v0
.end method

.method static synthetic access$200()Ljava/lang/String;
  .registers 1
  .line 51
    sget-object v0, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$300()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 51
    sget-object v0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    return-object v0
.end method

.method static synthetic access$400()Ljava/util/HashSet;
  .registers 1
  .line 51
    sget-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    return-object v0
.end method

.method static synthetic access$500()Ljava/util/HashMap;
  .registers 1
  .line 51
    sget-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    return-object v0
.end method

.method static synthetic access$600()[Ljava/io/File;
  .registers 1
  .line 51
    sget-object v0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
    return-object v0
.end method

.method static synthetic access$700()I
  .registers 1
  .line 51
    sget v0, Lcom/innioasis/ipp/Scan;->next:I
    return v0
.end method

.method static synthetic access$708()I
  .registers 2
  .line 51
    sget v0, Lcom/innioasis/ipp/Scan;->next:I
    add-int/lit8 v1, v0, 1
    sput v1, Lcom/innioasis/ipp/Scan;->next:I
    return v0
.end method

.method private static audio(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)[Ljava/io/File;
  .catchall { :L2 .. :L3 } :L8
  .catchall { :L4 .. :L5 } :L6
  .registers 8
  .line 249
    invoke-virtual { p1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p1
  .line 250
    const/4 v0, 0
    if-nez p1, :L0
    new-array p0, v0, [Ljava/io/File;
    return-object p0
  :L0
  .line 251
    array-length v1, p1
    new-array v1, v1, [Ljava/io/File;
  .line 252
    nop
  .line 253
    const/4 v2, 0
    const/4 v3, 0
  :L1
    array-length v4, p1
    if-ge v2, v4, :L10
  :L2
  .line 255
    aget-object v4, p1, v2
    invoke-virtual { v4 }, Ljava/io/File;->isFile()Z
    move-result v4
    if-eqz v4, :L7
    aget-object v4, p1, v2
    invoke-virtual { p0, v4 }, Lcom/innioasis/y1/database/Y1Repository;->endIsMusic(Ljava/io/File;)Z
    move-result v4
  :L3
    if-eqz v4, :L7
    add-int/lit8 v4, v3, 1
  :L4
    aget-object v5, p1, v2
    aput-object v5, v1, v3
  :L5
    move v3, v4
    goto :L7
  :L6
  .line 256
    move-exception v3
    move v3, v4
    goto :L9
  :L7
  .line 258
    goto :L9
  :L8
  .line 256
    move-exception v4
  :L9
  .line 253
    add-int/lit8 v2, v2, 1
    goto :L1
  :L10
  .line 260
    new-array p0, v3, [Ljava/io/File;
  .line 261
    invoke-static { v1, v0, p0, v0, v3 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 262
    return-object p0
.end method

.method private static fill(Ljava/util/HashSet;Ljava/util/List;)V
  .registers 5
  .line 128
    if-nez p1, :L0
    return-void
  :L0
  .line 129
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L4
  .line 130
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 131
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-nez v2, :L2
    goto :L3
  :L2
  .line 132
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 133
    if-eqz v1, :L3
    invoke-virtual { p0, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L3
  .line 129
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 135
    return-void
.end method

.method static inDb(Ljava/lang/String;)Z
  .registers 3
  .line 94
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 95
    invoke-static { }, Lcom/innioasis/ipp/Scan;->table()Ljava/util/HashSet;
    move-result-object v1
  .line 96
    if-nez v1, :L1
    return v0
  :L1
  .line 97
    sget-object v0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/objects/Constant;->normalizeAudioBookPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method private static indexAfter(Ljava/lang/String;)I
  .registers 4
  .line 224
    sget-object v0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 225
    nop
  :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
    array-length v2, v0
    if-ge v1, v2, :L3
  .line 226
    aget-object v0, v0, v1
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    add-int/lit8 v1, v1, 1
    return v1
  :L2
  .line 225
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 228
    sget p0, Lcom/innioasis/ipp/Scan;->next:I
    return p0
.end method

.method public static known(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
  .registers 1
  .line 73
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->inDb(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L0
    sget-object p0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return-object p0
.end method

.method private static load()Ljava/util/HashSet;
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 113
    invoke-static { }, Lcom/innioasis/ipp/Artists;->ensureExceptions()V
  .line 114
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 115
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
  :L1
  .line 116
    new-instance v1, Ljava/util/HashSet;
    invoke-direct { v1 }, Ljava/util/HashSet;-><init>()V
  .line 117
    const/4 v2, 0
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v2
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Scan;->fill(Ljava/util/HashSet;Ljava/util/List;)V
  .line 118
    const/4 v2, 1
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scan;->fill(Ljava/util/HashSet;Ljava/util/List;)V
  .line 119
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "library scan: "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v1 }, Ljava/util/HashSet;->size()I
    move-result v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " path(s) already known"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 120
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  :L2
  .line 121
    return-object v1
  :L3
  .line 122
    move-exception v0
  .line 123
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
.end method

.method private static pool()I
  .registers 2
  .line 241
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 242
    const/4 v1, 1
    if-ge v0, v1, :L0
    const/4 v0, 1
  :L0
  .line 243
    const/4 v1, 3
    if-le v0, v1, :L1
    const/4 v0, 3
  :L1
  .line 244
    return v0
.end method

.method public static song(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 162
    nop
  :L0
  .line 164
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scan;->take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L1
  .line 167
    goto :L3
  :L2
  .line 165
    move-exception v0
  .line 166
    const/4 v0, 0
  :L3
  .line 168
    if-eqz v0, :L4
    goto :L5
  :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L5
    return-object v0
.end method

.method private static start()V
  .registers 3
  .line 233
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pool()I
    move-result v0
  :L0
  .line 234
    sget v1, Lcom/innioasis/ipp/Scan;->live:I
    if-ge v1, v0, :L1
  .line 235
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
  .line 236
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Scan$Builder;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Scan$Builder;-><init>()V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
    goto :L0
  :L1
  .line 238
    return-void
.end method

.method private static declared-synchronized table()Ljava/util/HashSet;
  .catchall { :L0 .. :L3 } :L4
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 101
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 102
    sget-object v3, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 103
    if-eqz v3, :L1
    sget-wide v4, Lcom/innioasis/ipp/Scan;->asked:J
    sub-long v4, v1, v4
    const-wide/16 v6, 5000
    cmp-long v8, v4, v6
    if-lez v8, :L2
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Scan;->load()Ljava/util/HashSet;
    move-result-object v3
  :L2
  .line 104
    sput-wide v1, Lcom/innioasis/ipp/Scan;->asked:J
  :L3
  .line 105
    monitor-exit v0
    return-object v3
  :L4
  .line 100
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L6 } :L11
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L10 .. :L12 } :L11
  .registers 11
  .line 176
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 177
    invoke-virtual { p1 }, Ljava/io/File;->getParent()Ljava/lang/String;
    move-result-object p1
  .line 178
    const/4 v1, 0
    if-eqz v0, :L13
    if-nez p1, :L0
    goto/16 :L13
  :L0
  .line 180
    sget-object v2, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  :L1
  .line 181
    sput-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 182
    sget-object v3, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
    invoke-virtual { p1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
  .line 184
    sput-object p1, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
  .line 185
    new-instance v3, Ljava/io/File;
    invoke-direct { v3, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Scan;->audio(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)[Ljava/io/File;
    move-result-object p0
    sput-object p0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
  .line 186
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->indexAfter(Ljava/lang/String;)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
  .line 187
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0 }, Ljava/util/HashMap;->clear()V
  .line 188
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0 }, Ljava/util/HashSet;->clear()V
  .line 189
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 190
    monitor-exit v2
    return-object v1
  :L2
  .line 192
    sget p0, Lcom/innioasis/ipp/Scan;->next:I
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->indexAfter(Ljava/lang/String;)I
    move-result v3
    invoke-static { p0, v3 }, Ljava/lang/Math;->max(II)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
  .line 194
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, v0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 195
    if-eqz p0, :L3
  .line 196
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 197
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 198
    monitor-exit v2
    return-object p0
  :L3
  .line 200
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L4
  .line 201
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 202
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 203
    monitor-exit v2
    return-object v1
  :L4
  .line 206
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    const-wide/16 v5, 20000
    add-long/2addr v3, v5
  :L5
  .line 207
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L10
    sget-object p0, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L10
  .line 208
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
  :L6
    sub-long v5, v3, v5
  .line 209
    const-wide/16 v7, 0
    cmp-long p0, v5, v7
    if-gtz p0, :L7
    goto :L10
  :L7
  .line 211
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0, v5, v6 }, Ljava/lang/Object;->wait(J)V
  :L8
  .line 214
    nop
  .line 215
    goto :L5
  :L9
  .line 212
    move-exception p0
  .line 213
    nop
  :L10
  .line 216
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, v0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 217
    sget-object p1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p1 }, Ljava/lang/Object;->notifyAll()V
  .line 218
    monitor-exit v2
    return-object p0
  :L11
  .line 219
    move-exception p0
    monitor-exit v2
  :L12
    throw p0
  :L13
  .line 178
    return-object v1
.end method

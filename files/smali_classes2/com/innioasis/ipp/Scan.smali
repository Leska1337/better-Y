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
  .line 103
    new-instance v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { v0 }, Lcom/innioasis/y1/database/Song;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
  .line 179
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
  .line 187
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 188
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
  .line 282
    invoke-virtual { p1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p1
  .line 283
    const/4 v0, 0
    if-nez p1, :L0
    new-array p0, v0, [Ljava/io/File;
    return-object p0
  :L0
  .line 284
    array-length v1, p1
    new-array v1, v1, [Ljava/io/File;
  .line 285
    nop
  .line 286
    const/4 v2, 0
    const/4 v3, 0
  :L1
    array-length v4, p1
    if-ge v2, v4, :L10
  :L2
  .line 288
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
  .line 289
    move-exception v3
    move v3, v4
    goto :L9
  :L7
  .line 291
    goto :L9
  :L8
  .line 289
    move-exception v4
  :L9
  .line 286
    add-int/lit8 v2, v2, 1
    goto :L1
  :L10
  .line 293
    new-array p0, v3, [Ljava/io/File;
  .line 294
    invoke-static { v1, v0, p0, v0, v3 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 295
    return-object p0
.end method

.method private static fill(Ljava/util/HashSet;Ljava/util/List;)V
  .registers 5
  .line 161
    if-nez p1, :L0
    return-void
  :L0
  .line 162
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L4
  .line 163
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 164
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-nez v2, :L2
    goto :L3
  :L2
  .line 165
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 166
    if-eqz v1, :L3
    invoke-virtual { p0, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L3
  .line 162
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 168
    return-void
.end method

.method static inDb(Ljava/lang/String;)Z
  .registers 3
  .line 120
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 121
    invoke-static { }, Lcom/innioasis/ipp/Scan;->table()Ljava/util/HashSet;
    move-result-object v1
  .line 122
    if-nez v1, :L1
    return v0
  :L1
  .line 123
    sget-object v0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/objects/Constant;->normalizeAudioBookPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method private static indexAfter(Ljava/lang/String;)I
  .registers 4
  .line 257
    sget-object v0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 258
    nop
  :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
    array-length v2, v0
    if-ge v1, v2, :L3
  .line 259
    aget-object v0, v0, v1
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    add-int/lit8 v1, v1, 1
    return v1
  :L2
  .line 258
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 261
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
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 139
    invoke-static { }, Lcom/innioasis/ipp/Artists;->ensureExceptions()V
  .line 140
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 141
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
  :L1
  .line 142
    new-instance v1, Ljava/util/HashSet;
    invoke-direct { v1 }, Ljava/util/HashSet;-><init>()V
  .line 143
    const/4 v2, 0
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v2
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Scan;->fill(Ljava/util/HashSet;Ljava/util/List;)V
  .line 144
    const/4 v2, 1
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scan;->fill(Ljava/util/HashSet;Ljava/util/List;)V
  .line 145
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
  .line 152
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v0
    if-eqz v0, :L2
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->noteLibraryRead(Landroid/content/Context;)V
  :L2
  .line 153
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  :L3
  .line 154
    return-object v1
  :L4
  .line 155
    move-exception v0
  .line 156
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
.end method

.method private static ours(Ljava/lang/String;)Z
  .registers 4
  .line 96
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 97
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v1
  .line 98
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
  .line 99
    invoke-virtual { p0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "/"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L2
  :L1
    const/4 v0, 1
  :L2
    return v0
.end method

.method private static pool()I
  .registers 2
  .line 274
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 275
    const/4 v1, 1
    if-ge v0, v1, :L0
    const/4 v0, 1
  :L0
  .line 276
    const/4 v1, 3
    if-le v0, v1, :L1
    const/4 v0, 3
  :L1
  .line 277
    return v0
.end method

.method public static skip(ZLjava/lang/String;)Z
  .registers 2
  .line 82
    if-nez p0, :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Scan;->ours(Ljava/lang/String;)Z
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

.method public static song(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 195
    nop
  :L0
  .line 197
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scan;->take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L1
  .line 200
    goto :L3
  :L2
  .line 198
    move-exception v0
  .line 199
    const/4 v0, 0
  :L3
  .line 201
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
  .line 266
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pool()I
    move-result v0
  :L0
  .line 267
    sget v1, Lcom/innioasis/ipp/Scan;->live:I
    if-ge v1, v0, :L1
  .line 268
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
  .line 269
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Scan$Builder;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Scan$Builder;-><init>()V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
    goto :L0
  :L1
  .line 271
    return-void
.end method

.method public static stays(ZLcom/innioasis/y1/database/Song;)Z
  .registers 2
  .line 91
    if-eqz p0, :L1
    if-eqz p1, :L0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->ours(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L1
  :L0
    const/4 p0, 1
    goto :L2
  :L1
    const/4 p0, 0
  :L2
    return p0
.end method

.method private static declared-synchronized table()Ljava/util/HashSet;
  .catchall { :L0 .. :L3 } :L4
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 127
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 128
    sget-object v3, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 129
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
  .line 130
    sput-wide v1, Lcom/innioasis/ipp/Scan;->asked:J
  :L3
  .line 131
    monitor-exit v0
    return-object v3
  :L4
  .line 126
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L6 } :L11
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L10 .. :L12 } :L11
  .registers 11
  .line 209
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 210
    invoke-virtual { p1 }, Ljava/io/File;->getParent()Ljava/lang/String;
    move-result-object p1
  .line 211
    const/4 v1, 0
    if-eqz v0, :L13
    if-nez p1, :L0
    goto/16 :L13
  :L0
  .line 213
    sget-object v2, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  :L1
  .line 214
    sput-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 215
    sget-object v3, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
    invoke-virtual { p1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
  .line 217
    sput-object p1, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
  .line 218
    new-instance v3, Ljava/io/File;
    invoke-direct { v3, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Scan;->audio(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)[Ljava/io/File;
    move-result-object p0
    sput-object p0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
  .line 219
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->indexAfter(Ljava/lang/String;)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
  .line 220
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0 }, Ljava/util/HashMap;->clear()V
  .line 221
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0 }, Ljava/util/HashSet;->clear()V
  .line 222
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 223
    monitor-exit v2
    return-object v1
  :L2
  .line 225
    sget p0, Lcom/innioasis/ipp/Scan;->next:I
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->indexAfter(Ljava/lang/String;)I
    move-result v3
    invoke-static { p0, v3 }, Ljava/lang/Math;->max(II)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
  .line 227
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, v0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 228
    if-eqz p0, :L3
  .line 229
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 230
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 231
    monitor-exit v2
    return-object p0
  :L3
  .line 233
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L4
  .line 234
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 235
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 236
    monitor-exit v2
    return-object v1
  :L4
  .line 239
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    const-wide/16 v5, 20000
    add-long/2addr v3, v5
  :L5
  .line 240
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L10
    sget-object p0, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L10
  .line 241
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
  :L6
    sub-long v5, v3, v5
  .line 242
    const-wide/16 v7, 0
    cmp-long p0, v5, v7
    if-gtz p0, :L7
    goto :L10
  :L7
  .line 244
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0, v5, v6 }, Ljava/lang/Object;->wait(J)V
  :L8
  .line 247
    nop
  .line 248
    goto :L5
  :L9
  .line 245
    move-exception p0
  .line 246
    nop
  :L10
  .line 249
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, v0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 250
    sget-object p1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p1 }, Ljava/lang/Object;->notifyAll()V
  .line 251
    monitor-exit v2
    return-object p0
  :L11
  .line 252
    move-exception p0
    monitor-exit v2
  :L12
    throw p0
  :L13
  .line 211
    return-object v1
.end method

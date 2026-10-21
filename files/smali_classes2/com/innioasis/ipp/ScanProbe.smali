.class public final Lcom/innioasis/ipp/ScanProbe;
.super Ljava/lang/Object;
.source "ScanProbe.java"

.field private final static FIELD:[Ljava/lang/String;

.field private final static HOW:[Ljava/lang/String;

.field private final static STAGE:[Ljava/lang/String;

.field private final static T:Ljava/lang/ThreadLocal;

.field private final static TOP:I = 12

.field private final static WSEG:[Ljava/lang/String;

.field private static askedN:J

.field private static before:Ljava/util/HashMap;

.field private static cpu0:[J

.field private static cpuThread0:J

.field private final static extOpen:Ljava/util/HashMap;

.field private final static extOwn:Ljava/util/HashMap;

.field private final static fileNs:[J

.field private final static files:[J

.field private static flushNs:J

.field public static volatile force:Z

.field static how:I

.field private final static howN:[J

.field private final static howNs:[J

.field private static insAt:J

.field private static insN:J

.field private static insNs:J

.field private static insRows:J

.field private static io0:J

.field private static knownN:J

.field private static knownNs:J

.field private static lcAt:J

.field private static lcN:J

.field private static lcNs:J

.field private static listAt:J

.field private static listN:J

.field private static listNs:J

.field private static proc0:J

.field private static pyBody:J

.field private static pyCount:J

.field private static pyWait:J

.field private static volatile scanThread:Ljava/lang/Thread;

.field private static seenN:J

.field private static sleptN:J

.field private final static stage:[[J

.field private static t0:J

.field private static tClean:J

.field private static tFinal:J

.field private static tLoaded:J

.field private static tPreLoad:J

.field private static tWalk:J

.field private final static topNs:[J

.field private final static topPath:[Ljava/lang/String;

.field private static uptime0:J

.field private static wLast:J

.field private static wMusic:Z

.field private static wNodes:J

.field private final static wNs:[J

.field private static wrN:J

.field private static wrNs:J

.method static constructor <clinit>()V
  .registers 15
  .line 28
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/ScanProbe;->force:Z
  .line 38
    const/4 v1, 7
    new-array v2, v1, [Ljava/lang/String;
    const-string v3, "pre"
    const/4 v4, 0
    aput-object v3, v2, v4
    const-string v3, "open"
    aput-object v3, v2, v0
    const-string v3, "extract"
    const/4 v5, 2
    aput-object v3, v2, v5
    const-string v3, "metaScanned"
    const/4 v6, 3
    aput-object v3, v2, v6
    const-string v3, "log"
    const/4 v7, 4
    aput-object v3, v2, v7
    const-string v3, "fixSong"
    const/4 v8, 5
    aput-object v3, v2, v8
    const-string v3, "ownReader"
    const/4 v9, 6
    aput-object v3, v2, v9
    sput-object v2, Lcom/innioasis/ipp/ScanProbe;->STAGE:[Ljava/lang/String;
  .line 39
    filled-new-array { v5, v1 }, [I
    move-result-object v2
    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;
    invoke-static { v3, v2 }, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [[J
    sput-object v2, Lcom/innioasis/ipp/ScanProbe;->stage:[[J
  .line 40
    new-array v2, v5, [J
    sput-object v2, Lcom/innioasis/ipp/ScanProbe;->files:[J
  .line 41
    new-array v2, v5, [J
    sput-object v2, Lcom/innioasis/ipp/ScanProbe;->fileNs:[J
  .line 43
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
    sput-object v2, Lcom/innioasis/ipp/ScanProbe;->extOpen:Ljava/util/HashMap;
  .line 44
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
    sput-object v2, Lcom/innioasis/ipp/ScanProbe;->extOwn:Ljava/util/HashMap;
  .line 46
    const/16 v2, 12
    new-array v3, v2, [J
    sput-object v3, Lcom/innioasis/ipp/ScanProbe;->topNs:[J
  .line 47
    new-array v3, v2, [Ljava/lang/String;
    sput-object v3, Lcom/innioasis/ipp/ScanProbe;->topPath:[Ljava/lang/String;
  .line 49
    new-instance v3, Ljava/lang/ThreadLocal;
    invoke-direct { v3 }, Ljava/lang/ThreadLocal;-><init>()V
    sput-object v3, Lcom/innioasis/ipp/ScanProbe;->T:Ljava/lang/ThreadLocal;
  .line 54
    new-array v3, v7, [Ljava/lang/String;
    const-string v10, "ready"
    aput-object v10, v3, v4
    const-string v10, "waited"
    aput-object v10, v3, v0
    const-string v10, "notQueued"
    aput-object v10, v3, v5
    const-string v10, "nobodyOnIt"
    aput-object v10, v3, v6
    sput-object v3, Lcom/innioasis/ipp/ScanProbe;->HOW:[Ljava/lang/String;
  .line 55
    new-array v3, v7, [J
    sput-object v3, Lcom/innioasis/ipp/ScanProbe;->howN:[J
  .line 56
    new-array v3, v7, [J
    sput-object v3, Lcom/innioasis/ipp/ScanProbe;->howNs:[J
  .line 78
    const/16 v3, 13
    new-array v3, v3, [Ljava/lang/String;
    const-string v10, "songName"
    aput-object v10, v3, v4
    const-string v10, "pinyinSongName"
    aput-object v10, v3, v0
    const-string v10, "album"
    aput-object v10, v3, v5
    const-string v10, "lowAlbum"
    aput-object v10, v3, v6
    const-string v10, "pinyinAlbum"
    aput-object v10, v3, v7
    const-string v10, "artist"
    aput-object v10, v3, v8
    const-string v10, "pinyinArtist"
    aput-object v10, v3, v9
    const-string v10, "genre"
    aput-object v10, v3, v1
    const-string v10, "pinyinGenre"
    const/16 v11, 8
    aput-object v10, v3, v11
    const-string v10, "albumArtist"
    const/16 v12, 9
    aput-object v10, v3, v12
    const-string v10, "track"
    const/16 v13, 10
    aput-object v10, v3, v13
    const/16 v10, 11
    const-string v14, "disc"
    aput-object v14, v3, v10
    const-string v10, "year"
    aput-object v10, v3, v2
    sput-object v3, Lcom/innioasis/ipp/ScanProbe;->FIELD:[Ljava/lang/String;
  .line 198
    new-array v2, v13, [Ljava/lang/String;
    const-string v3, "tail: isHidden+listFiles+addAll (listFiles below)"
    aput-object v3, v2, v4
    const-string v3, "loop head: size, scanLock, get, Timber line"
    aput-object v3, v2, v0
    const-string v0, "queue remove(0)"
    aput-object v0, v2, v5
    const-string v0, "exists"
    aput-object v0, v2, v6
    const-string v0, "pathInThemes + Scan.skip"
    aput-object v0, v2, v7
    const-string v0, "book/music checks + pathInAudiobook"
    aput-object v0, v2, v8
    const-string v0, "lambda + repeatTry (Scan.known below)"
    aput-object v0, v2, v9
    const-string v0, "video check"
    aput-object v0, v2, v1
    const-string v0, "video lambda"
    aput-object v0, v2, v11
    const-string v0, "dir check"
    aput-object v0, v2, v12
    sput-object v2, Lcom/innioasis/ipp/ScanProbe;->WSEG:[Ljava/lang/String;
  .line 202
    array-length v0, v2
    new-array v0, v0, [J
    sput-object v0, Lcom/innioasis/ipp/ScanProbe;->wNs:[J
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 26
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static begin()V
  .catchall { :L0 .. :L12 } :L11
  .registers 7
  .line 154
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->table()Ljava/util/HashMap;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/ScanProbe;->before:Ljava/util/HashMap;
  .line 155
    const-class v0, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter v0
  :L0
  .line 156
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/ScanProbe;->scanThread:Ljava/lang/Thread;
  .line 157
    const/4 v1, 0
    const/4 v2, 0
  :L1
    const/4 v3, 2
    const-wide/16 v4, 0
    if-ge v2, v3, :L4
  .line 158
    sget-object v3, Lcom/innioasis/ipp/ScanProbe;->files:[J
    aput-wide v4, v3, v2
  .line 159
    sget-object v3, Lcom/innioasis/ipp/ScanProbe;->fileNs:[J
    aput-wide v4, v3, v2
  .line 160
    const/4 v3, 0
  :L2
    const/4 v6, 7
    if-ge v3, v6, :L3
    sget-object v6, Lcom/innioasis/ipp/ScanProbe;->stage:[[J
    aget-object v6, v6, v2
    aput-wide v4, v6, v3
    add-int/lit8 v3, v3, 1
    goto :L2
  :L3
  .line 157
    add-int/lit8 v2, v2, 1
    goto :L1
  :L4
  .line 162
    sget-object v2, Lcom/innioasis/ipp/ScanProbe;->extOpen:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->clear()V
  .line 163
    sget-object v2, Lcom/innioasis/ipp/ScanProbe;->extOwn:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->clear()V
  .line 164
    const/4 v2, 0
  :L5
    const/16 v3, 12
    if-ge v2, v3, :L6
  .line 165
    sget-object v3, Lcom/innioasis/ipp/ScanProbe;->topNs:[J
    aput-wide v4, v3, v2
  .line 166
    sget-object v3, Lcom/innioasis/ipp/ScanProbe;->topPath:[Ljava/lang/String;
    const/4 v6, 0
    aput-object v6, v3, v2
  .line 164
    add-int/lit8 v2, v2, 1
    goto :L5
  :L6
  .line 168
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->pyBody:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->pyWait:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->pyCount:J
  .line 169
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->knownNs:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->knownN:J
  .line 170
    const/4 v2, 0
  :L7
    const/4 v3, 4
    if-ge v2, v3, :L8
  .line 171
    sget-object v3, Lcom/innioasis/ipp/ScanProbe;->howN:[J
    aput-wide v4, v3, v2
  .line 172
    sget-object v3, Lcom/innioasis/ipp/ScanProbe;->howNs:[J
    aput-wide v4, v3, v2
  .line 170
    add-int/lit8 v2, v2, 1
    goto :L7
  :L8
  .line 174
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->askedN:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->seenN:J
  .line 175
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->flushNs:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->wrNs:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->wrN:J
  .line 176
    const/4 v2, 0
  :L9
    sget-object v3, Lcom/innioasis/ipp/ScanProbe;->wNs:[J
    array-length v6, v3
    if-ge v2, v6, :L10
    aput-wide v4, v3, v2
    add-int/lit8 v2, v2, 1
    goto :L9
  :L10
  .line 177
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->wLast:J
  .line 178
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->wNodes:J
  .line 179
    sput-boolean v1, Lcom/innioasis/ipp/ScanProbe;->wMusic:Z
  .line 180
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->sleptN:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->listNs:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->listN:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->lcNs:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->lcN:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->insRows:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->insNs:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->insN:J
  .line 181
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->tLoaded:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->tPreLoad:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->tClean:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->tFinal:J
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->tWalk:J
  .line 182
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/ScanProbe;->uptime0:J
  .line 183
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->cpuStat()[J
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/ScanProbe;->cpu0:[J
  .line 184
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->procCpu()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/ScanProbe;->proc0:J
  .line 185
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->readBytes()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/ScanProbe;->io0:J
  .line 186
    invoke-static { }, Landroid/os/SystemClock;->currentThreadTimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/ScanProbe;->cpuThread0:J
  .line 187
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/ScanProbe;->t0:J
  .line 188
    monitor-exit v0
  .line 189
    return-void
  :L11
  .line 188
    move-exception v1
    monitor-exit v0
  :L12
    goto :L14
  :L13
    throw v1
  :L14
    goto :L13
.end method

.method public static cleaned()V
  .registers 2
  .line 193
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->tClean:J
    return-void
.end method

.method private static compare(Ljava/lang/StringBuilder;)V
  .registers 21
  .line 107
    move-object/from16 v0, p0
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->table()Ljava/util/HashMap;
    move-result-object v1
  .line 108
    sget-object v2, Lcom/innioasis/ipp/ScanProbe;->FIELD:[Ljava/lang/String;
    array-length v3, v2
    new-array v3, v3, [I
  .line 109
    array-length v2, v2
    new-array v2, v2, [I
  .line 110
    new-instance v4, Ljava/util/HashMap;
    invoke-direct { v4 }, Ljava/util/HashMap;-><init>()V
  .line 111
    nop
  .line 112
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
  .line 113
    sget-object v6, Lcom/innioasis/ipp/ScanProbe;->before:Ljava/util/HashMap;
    invoke-virtual { v6 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v6
    invoke-interface { v6 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v6
    const/4 v8, 0
    const/4 v9, 0
    const/4 v10, 0
  :L0
  .line 114
    invoke-interface { v6 }, Ljava/util/Iterator;->hasNext()Z
    move-result v11
    const-string v12, "  "
    if-eqz v11, :L15
  .line 115
    invoke-interface { v6 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v11
    check-cast v11, Ljava/util/Map$Entry;
  .line 116
    invoke-interface { v11 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v14
    check-cast v14, Ljava/lang/String;
  .line 117
    invoke-interface { v11 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v11
    check-cast v11, [Ljava/lang/String;
  .line 118
    invoke-virtual { v1, v14 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, [Ljava/lang/String;
  .line 119
    if-nez v15, :L1
  .line 120
    add-int/lit8 v10, v10, 1
  .line 121
    goto :L0
  :L1
  .line 123
    add-int/lit8 v8, v8, 1
  .line 124
    nop
  .line 125
    const/4 v7, 0
    const/16 v16, 0
  :L2
    sget-object v13, Lcom/innioasis/ipp/ScanProbe;->FIELD:[Ljava/lang/String;
    move-object/from16 v17, v6
    array-length v6, v13
    const/16 v18, 1
    if-ge v7, v6, :L9
  .line 126
    aget-object v6, v11, v7
    if-nez v6, :L4
    aget-object v6, v15, v7
    move/from16 v19, v8
    if-nez v6, :L3
    const/4 v6, 1
    goto :L5
  :L3
    const/4 v6, 0
    goto :L5
  :L4
    move/from16 v19, v8
    aget-object v8, v15, v7
    invoke-virtual { v6, v8 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
  :L5
  .line 127
    if-eqz v6, :L6
    goto :L8
  :L6
  .line 128
    nop
  .line 129
    aget v6, v3, v7
    add-int/lit8 v6, v6, 1
    aput v6, v3, v7
  .line 130
    aget v6, v2, v7
    add-int/lit8 v8, v6, 1
    aput v8, v2, v7
    const/4 v8, 4
    if-ge v6, v8, :L7
  .line 131
    invoke-virtual { v5, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    aget-object v8, v13, v7
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v8, ": ["
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    aget-object v8, v11, v7
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v8, "] -> ["
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    aget-object v8, v15, v7
  .line 132
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v8, "] "
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v14 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const/16 v8, 10
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L7
  .line 125
    const/16 v16, 1
  :L8
    add-int/lit8 v7, v7, 1
    move-object/from16 v6, v17
    move/from16 v8, v19
    goto :L2
  :L9
  .line 135
    move/from16 v19, v8
    if-eqz v16, :L14
  .line 136
    add-int/lit8 v9, v9, 1
  .line 137
    const/16 v6, 46
    invoke-virtual { v14, v6 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v6
  .line 138
    if-gez v6, :L10
    const-string v6, "?"
    goto :L11
  :L10
    add-int/lit8 v6, v6, 1
    invoke-virtual { v14, v6 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v6
  :L11
  .line 139
    invoke-virtual { v4, v6 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Integer;
  .line 140
    if-nez v7, :L12
    goto :L13
  :L12
    invoke-virtual { v7 }, Ljava/lang/Integer;->intValue()I
    move-result v7
    add-int/lit8 v18, v7, 1
  :L13
    invoke-static/range { v18 .. v18 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v7
    invoke-virtual { v4, v6, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L14
  .line 142
    move-object/from16 v6, v17
    move/from16 v8, v19
    goto/16 :L0
  :L15
  .line 143
    const-string v2, "\nCOMPARED WITH THE PREVIOUS SCAN'S ROWS (old -> new)\n"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 144
    const-string v2, "  rows "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v8 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v6, ", differing "
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v9 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 145
    const-string v6, ", gone "
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v10 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v6, ", new "
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v1 }, Ljava/util/HashMap;->size()I
    move-result v1
    sub-int/2addr v1, v8
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const/16 v2, 10
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 146
    const/4 v7, 0
  :L16
    sget-object v1, Lcom/innioasis/ipp/ScanProbe;->FIELD:[Ljava/lang/String;
    array-length v2, v1
    if-ge v7, v2, :L18
  .line 147
    aget v2, v3, v7
    if-lez v2, :L17
    invoke-virtual { v0, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v1, v1, v7
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, ": "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    aget v2, v3, v7
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const/16 v2, 10
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L17
  .line 146
    add-int/lit8 v7, v7, 1
    goto :L16
  :L18
  .line 149
    const-string v1, "  by extension: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v1
    const/16 v2, 10
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 150
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
  .line 151
    return-void
.end method

.method private static cpuStat()[J
  .registers 7
  .line 484
    const-string v0, "/proc/stat"
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->first(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 485
    if-nez v0, :L0
    const/4 v0, 0
    return-object v0
  :L0
  .line 486
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    const-string v1, "\\s+"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 487
    const/4 v1, 7
    new-array v2, v1, [J
  .line 488
    const/4 v3, 0
  :L1
    if-ge v3, v1, :L2
    add-int/lit8 v4, v3, 1
    array-length v5, v0
    if-ge v4, v5, :L2
    aget-object v5, v0, v4
    invoke-static { v5 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v5
    aput-wide v5, v2, v3
    move v3, v4
    goto :L1
  :L2
  .line 489
    return-object v2
.end method

.method public static end()V
  .catchall { :L0 .. :L3 } :L46
  .catchall { :L4 .. :L9 } :L45
  .catchall { :L11 .. :L38 } :L45
  .catchall { :L39 .. :L41 } :L44
  .catchall { :L41 .. :L42 } :L43
  .catchall { :L42 .. :L44 } :L44
  .registers 29
  .line 359
    const-string v0, " ms\n"
    const-string v1, "\n"
    const-string v2, "IPPSCAN"
  :L0
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v3
  .line 360
    sget-wide v5, Lcom/innioasis/ipp/ScanProbe;->tPreLoad:J
    const-wide/16 v7, 0
    cmp-long v9, v5, v7
    if-nez v9, :L1
    move-wide v5, v7
    goto :L2
  :L1
    move-wide v5, v3
  :L2
    sput-wide v5, Lcom/innioasis/ipp/ScanProbe;->tLoaded:J
  .line 361
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->cpuStat()[J
    move-result-object v5
  .line 362
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->procCpu()J
    move-result-wide v9
  .line 363
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->readBytes()J
    move-result-wide v11
  .line 364
    invoke-static { }, Landroid/os/SystemClock;->currentThreadTimeMillis()J
    move-result-wide v13
    sget-wide v15, Lcom/innioasis/ipp/ScanProbe;->cpuThread0:J
    sub-long/2addr v13, v15
  .line 365
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
  .line 366
    sget-wide v15, Lcom/innioasis/ipp/ScanProbe;->t0:J
    sub-long v15, v3, v15
    invoke-static/range { v15 .. v16 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v7
  .line 367
    const-string v15, "better-Y scan probe, force="
    invoke-virtual { v6, v15 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v15
  :L3
    move-object/from16 v21, v2
  :L4
    sget-boolean v2, Lcom/innioasis/ipp/ScanProbe;->force:Z
    invoke-virtual { v15, v2 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v15, ", uptime at start "
  .line 368
    invoke-virtual { v2, v15 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-wide v15, Lcom/innioasis/ipp/ScanProbe;->uptime0:J
    const-wide/16 v22, 1000
    move-wide/from16 v24, v11
    div-long v11, v15, v22
    invoke-virtual { v2, v11, v12 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v11, " s"
    invoke-virtual { v2, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v11, ", cores "
  .line 369
    invoke-virtual { v2, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v11
    invoke-virtual { v11 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v11
    invoke-virtual { v2, v11 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v11, 10
    invoke-virtual { v2, v11 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 370
    const-string v2, "TOTAL "
    invoke-virtual { v6, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v12, " ms\n\n"
    invoke-virtual { v2, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 372
    const-string v2, "PHASES (scan thread wall)\n"
    invoke-virtual { v6, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 373
    const-string v16, "walk+read (to end of BFS)"
    sget-wide v17, Lcom/innioasis/ipp/ScanProbe;->tWalk:J
    sget-wide v19, Lcom/innioasis/ipp/ScanProbe;->t0:J
    sub-long v17, v17, v19
    invoke-static/range { v17 .. v18 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v7
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 374
    const-string v16, "final insert"
    sget-wide v17, Lcom/innioasis/ipp/ScanProbe;->tFinal:J
    sget-wide v19, Lcom/innioasis/ipp/ScanProbe;->tWalk:J
    sub-long v17, v17, v19
    invoke-static/range { v17 .. v18 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v7
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 375
    const-string v16, "cleanup (exists per row)"
    sget-wide v17, Lcom/innioasis/ipp/ScanProbe;->tClean:J
    sget-wide v19, Lcom/innioasis/ipp/ScanProbe;->tFinal:J
    sub-long v17, v17, v19
    invoke-static/range { v17 .. v18 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v7
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 376
    const-string v2, "    rows met by the walk "
    invoke-virtual { v6, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-wide v11, Lcom/innioasis/ipp/ScanProbe;->seenN:J
    invoke-virtual { v2, v11, v12 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v11, ", asked the card "
    invoke-virtual { v2, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-wide v11, Lcom/innioasis/ipp/ScanProbe;->askedN:J
    invoke-virtual { v2, v11, v12 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 377
    const-string v16, "video delete + misc"
    sget-wide v11, Lcom/innioasis/ipp/ScanProbe;->tPreLoad:J
    sget-wide v17, Lcom/innioasis/ipp/ScanProbe;->tClean:J
    sub-long v11, v11, v17
    invoke-static { v11, v12 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v7
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 378
    const-string v16, "Albums.loadNow"
    sget-wide v11, Lcom/innioasis/ipp/ScanProbe;->tPreLoad:J
    sub-long/2addr v3, v11
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v7
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 380
    sget-wide v2, Lcom/innioasis/ipp/ScanProbe;->tWalk:J
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->t0:J
    sub-long/2addr v2, v7
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v2
  .line 381
    const-string v4, "\nINSIDE THE WALK (scan thread)\n"
    invoke-virtual { v6, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 382
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "Scan.known x"
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->knownN:J
    invoke-virtual { v4, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v16
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->knownNs:J
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v2
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 383
    const/4 v7, 0
  :L5
    const/4 v8, 4
    if-ge v7, v8, :L6
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct { v8 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v11, "Scan.song "
    invoke-virtual { v8, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    sget-object v11, Lcom/innioasis/ipp/ScanProbe;->HOW:[Ljava/lang/String;
    aget-object v11, v11, v7
    invoke-virtual { v8, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    const-string v11, " x"
    invoke-virtual { v8, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    sget-object v11, Lcom/innioasis/ipp/ScanProbe;->howN:[J
    move-object v12, v5
    aget-wide v4, v11, v7
    invoke-virtual { v8, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v16
    sget-object v4, Lcom/innioasis/ipp/ScanProbe;->howNs:[J
    aget-wide v17, v4, v7
    invoke-static/range { v17 .. v18 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v2
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
    add-int/lit8 v7, v7, 1
    move-object v5, v12
    goto :L5
  :L6
  .line 384
    move-object v12, v5
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "songDao.insert x"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    move-wide/from16 v26, v9
    sget-wide v8, Lcom/innioasis/ipp/ScanProbe;->insN:J
    invoke-virtual { v4, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v16
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->insNs:J
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v2
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 385
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "Ipp.libraryChanged x"
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->lcN:J
    invoke-virtual { v4, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v16
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->lcNs:J
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v2
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 386
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "  writer thread: inserts x"
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->wrN:J
    invoke-virtual { v4, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v16
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->wrNs:J
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v2
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 387
    const-string v16, "  tail waited for the writer"
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->flushNs:J
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v2
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 388
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "listFiles x"
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->listN:J
    invoke-virtual { v4, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v16
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->listNs:J
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v2
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 389
    sget-wide v7, Lcom/innioasis/ipp/ScanProbe;->knownNs:J
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v7
    sub-long v7, v2, v7
    sget-object v4, Lcom/innioasis/ipp/ScanProbe;->howNs:[J
    const/4 v9, 0
    aget-wide v10, v4, v9
    const/4 v9, 1
    aget-wide v15, v4, v9
    add-long/2addr v10, v15
    const/4 v15, 2
    aget-wide v16, v4, v15
    add-long v10, v10, v16
    const/16 v28, 3
    aget-wide v16, v4, v28
    add-long v10, v10, v16
    invoke-static { v10, v11 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v10
    sub-long/2addr v7, v10
    sget-wide v10, Lcom/innioasis/ipp/ScanProbe;->insNs:J
  .line 390
    invoke-static { v10, v11 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v10
    sub-long/2addr v7, v10
    sget-wide v10, Lcom/innioasis/ipp/ScanProbe;->lcNs:J
    invoke-static { v10, v11 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v10
    sub-long/2addr v7, v10
    sget-wide v10, Lcom/innioasis/ipp/ScanProbe;->listNs:J
    invoke-static { v10, v11 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v10
    sub-long v17, v7, v10
  .line 391
    const-string v16, "rest of the walk (checks, lambdas, logging)"
    const/4 v4, 2
    move-object v15, v6
    move-wide/from16 v19, v2
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .line 392
    const-string v7, "scanLock sleeps (100 ms each): "
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    sget-wide v10, Lcom/innioasis/ipp/ScanProbe;->sleptN:J
    invoke-virtual { v7, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v7
    const/16 v8, 10
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 393
    const-string v7, "WALK LOOP BY SEGMENT, "
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    sget-wide v10, Lcom/innioasis/ipp/ScanProbe;->wNodes:J
    invoke-virtual { v7, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v8, " nodes\n"
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 394
    const/4 v7, 0
  :L7
    sget-object v8, Lcom/innioasis/ipp/ScanProbe;->wNs:[J
    array-length v10, v8
    if-ge v7, v10, :L8
    sget-object v10, Lcom/innioasis/ipp/ScanProbe;->WSEG:[Ljava/lang/String;
    aget-object v16, v10, v7
    aget-wide v10, v8, v7
    invoke-static { v10, v11 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    move-object v15, v6
    move-wide/from16 v19, v2
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
    add-int/lit8 v7, v7, 1
    goto :L7
  :L8
  .line 396
    const-string v2, "\nfileToSong, summed per thread group\n"
    invoke-virtual { v6, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 397
    new-array v2, v4, [Ljava/lang/String;
    const-string v3, "scan thread"
    const/4 v7, 0
    aput-object v3, v2, v7
    const-string v3, "workers"
    aput-object v3, v2, v9
  :L9
  .line 398
    const/4 v3, 0
  :L10
    const-string v7, " us\n"
    const-string v8, " ms, avg "
    const-string v10, " files, "
    const-string v11, ": "
    const-string v15, "  "
    if-ge v3, v4, :L16
  :L11
  .line 399
    aget-object v5, v2, v3
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    sget-object v11, Lcom/innioasis/ipp/ScanProbe;->files:[J
    move-object/from16 v16, v10
    aget-wide v9, v11, v3
    invoke-virtual { v5, v9, v10 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v5
    move-object/from16 v9, v16
    invoke-virtual { v5, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    sget-object v9, Lcom/innioasis/ipp/ScanProbe;->fileNs:[J
    aget-wide v16, v9, v3
  .line 400
    move-object/from16 v18, v5
    invoke-static/range { v16 .. v17 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v4
    move-object/from16 v10, v18
    invoke-virtual { v10, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
  .line 401
    aget-wide v10, v11, v3
    const-wide/16 v16, 0
    cmp-long v5, v10, v16
    if-nez v5, :L12
    const-wide/16 v8, 0
    goto :L13
  :L12
    aget-wide v8, v9, v3
    div-long/2addr v8, v10
    div-long v8, v8, v22
  :L13
    invoke-virtual { v4, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 402
    const/4 v4, 0
  :L14
    const/4 v5, 7
    if-ge v4, v5, :L15
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v5, v15 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    sget-object v7, Lcom/innioasis/ipp/ScanProbe;->STAGE:[Ljava/lang/String;
    aget-object v7, v7, v4
    invoke-virtual { v5, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v16
    sget-object v5, Lcom/innioasis/ipp/ScanProbe;->stage:[[J
    aget-object v5, v5, v3
    aget-wide v7, v5, v4
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v17
    sget-object v5, Lcom/innioasis/ipp/ScanProbe;->fileNs:[J
    aget-wide v7, v5, v3
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v19
    move-object v5, v15
    move-object v15, v6
    invoke-static/range { v15 .. v20 }, Lcom/innioasis/ipp/ScanProbe;->line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
    add-int/lit8 v4, v4, 1
    move-object v15, v5
    goto :L14
  :L15
  .line 398
    add-int/lit8 v3, v3, 1
    const/4 v4, 2
    const/4 v9, 1
    goto/16 :L10
  :L16
  .line 404
    move-object v9, v10
    move-object v5, v15
    const-string v2, "pinyin getString x"
    invoke-virtual { v6, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-wide v3, Lcom/innioasis/ipp/ScanProbe;->pyCount:J
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ": body "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-wide v3, Lcom/innioasis/ipp/ScanProbe;->pyBody:J
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v3
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " ms, waiting for the lock "
  .line 405
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-wide v3, Lcom/innioasis/ipp/ScanProbe;->pyWait:J
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v3
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 407
    const-string v2, "\nOPEN (MMR new + setDataSource) BY EXTENSION\n"
    invoke-virtual { v6, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 408
    sget-object v2, Lcom/innioasis/ipp/ScanProbe;->extOpen:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L17
  .line 409
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L20
  .line 410
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 411
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, [J
  .line 412
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    invoke-virtual { v10, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    move-object v15, v1
    move-object/from16 v16, v2
    const/4 v10, 0
    aget-wide v1, v4, v10
    invoke-virtual { v3, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const/4 v2, 1
    aget-wide v17, v4, v2
  .line 413
    invoke-static/range { v17 .. v18 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v2
    invoke-virtual { v1, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const/4 v2, 0
    aget-wide v17, v4, v2
    const-wide/16 v2, 0
    cmp-long v10, v17, v2
    if-nez v10, :L18
    const-wide/16 v2, 0
    goto :L19
  :L18
    const/4 v2, 1
    aget-wide v3, v4, v2
    div-long v3, v3, v17
    div-long v2, v3, v22
  :L19
    invoke-virtual { v1, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 414
    invoke-virtual { v1, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 415
    move-object v1, v15
    move-object/from16 v2, v16
    goto :L17
  :L20
  .line 417
    move-object v15, v1
    const-string v1, "\nOUR READER BY EXTENSION (Meta.scanOwn; \"blind\" = via fixSong)\n"
    invoke-virtual { v6, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 418
    sget-object v1, Lcom/innioasis/ipp/ScanProbe;->extOwn:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L21
  .line 419
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L24
  .line 420
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
  .line 421
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, [J
  .line 422
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    move-object/from16 v16, v11
    const/4 v4, 0
    aget-wide v10, v3, v4
    invoke-virtual { v2, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/4 v4, 2
    aget-wide v10, v3, v4
  .line 423
    invoke-virtual { v2, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v10, " answered, "
    invoke-virtual { v2, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/4 v10, 1
    aget-wide v17, v3, v10
    invoke-static/range { v17 .. v18 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v10
    invoke-virtual { v2, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 424
    const/4 v10, 0
    aget-wide v17, v3, v10
    const-wide/16 v10, 0
    cmp-long v19, v17, v10
    if-nez v19, :L22
    const-wide/16 v10, 0
    goto :L23
  :L22
    const/4 v10, 1
    aget-wide v19, v3, v10
    div-long v19, v19, v17
    div-long v17, v19, v22
    move-wide/from16 v10, v17
  :L23
    invoke-virtual { v2, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 425
    move-object/from16 v11, v16
    goto :L21
  :L24
  .line 427
    const-string v1, "\nSLOWEST FILES (fileToSong wall)\n"
    invoke-virtual { v6, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 428
    const/4 v9, 0
  :L25
    const/4 v1, 0
    const/16 v2, 12
    if-ge v9, v2, :L31
  .line 429
    nop
  .line 430
    const/4 v3, -1
    const/4 v4, 0
  :L26
    if-ge v4, v2, :L29
  .line 431
    sget-object v7, Lcom/innioasis/ipp/ScanProbe;->topPath:[Ljava/lang/String;
    aget-object v7, v7, v4
    if-eqz v7, :L28
    if-ltz v3, :L27
    sget-object v7, Lcom/innioasis/ipp/ScanProbe;->topNs:[J
    aget-wide v10, v7, v4
    aget-wide v16, v7, v3
    cmp-long v7, v10, v16
    if-lez v7, :L28
  :L27
    move v3, v4
  :L28
  .line 430
    add-int/lit8 v4, v4, 1
    goto :L26
  :L29
  .line 433
    if-gez v3, :L30
    goto :L31
  :L30
  .line 434
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-object v4, Lcom/innioasis/ipp/ScanProbe;->topNs:[J
    aget-wide v7, v4, v3
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/ScanProbe;->ms(J)J
    move-result-wide v7
    invoke-virtual { v2, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, " ms "
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-object v4, Lcom/innioasis/ipp/ScanProbe;->topPath:[Ljava/lang/String;
    aget-object v7, v4, v3
    invoke-virtual { v2, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v7, 10
    invoke-virtual { v2, v7 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 435
    aput-object v1, v4, v3
  .line 428
    add-int/lit8 v9, v9, 1
    goto :L25
  :L31
  .line 438
    const-string v2, "\nCPU\n"
    invoke-virtual { v6, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 439
    sget-object v2, Lcom/innioasis/ipp/ScanProbe;->cpu0:[J
    if-eqz v2, :L34
    if-eqz v12, :L34
  .line 440
    nop
  .line 441
    const/4 v9, 0
    const-wide/16 v16, 0
  :L32
    array-length v2, v12
    if-ge v9, v2, :L33
    aget-wide v2, v12, v9
    sget-object v4, Lcom/innioasis/ipp/ScanProbe;->cpu0:[J
    aget-wide v7, v4, v9
    sub-long/2addr v2, v7
    add-long v16, v16, v2
    add-int/lit8 v9, v9, 1
    goto :L32
  :L33
  .line 442
    const-wide/16 v2, 0
    cmp-long v4, v16, v2
    if-lez v4, :L34
  .line 443
    const-string v2, "  system: busy "
    invoke-virtual { v6, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-wide v3, v12, v28
    sget-object v5, Lcom/innioasis/ipp/ScanProbe;->cpu0:[J
    aget-wide v7, v5, v28
    sub-long/2addr v3, v7
    sub-long v3, v16, v3
    const/4 v7, 4
    aget-wide v8, v12, v7
    aget-wide v10, v5, v7
    sub-long/2addr v8, v10
    sub-long/2addr v3, v8
    const-wide/16 v7, 100
    mul-long v3, v3, v7
    div-long v3, v3, v16
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "%, idle "
  .line 444
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-wide v3, v12, v28
    sget-object v9, Lcom/innioasis/ipp/ScanProbe;->cpu0:[J
    aget-wide v10, v9, v28
    sub-long/2addr v3, v10
    mul-long v3, v3, v7
    div-long v3, v3, v16
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "%, iowait "
  .line 445
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/4 v3, 4
    aget-wide v4, v12, v3
    sget-object v9, Lcom/innioasis/ipp/ScanProbe;->cpu0:[J
    aget-wide v10, v9, v3
    sub-long/2addr v4, v10
    mul-long v4, v4, v7
    div-long v4, v4, v16
    invoke-virtual { v2, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "% (all cores)\n"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L34
  .line 448
    const-string v2, "  app process CPU "
    invoke-virtual { v6, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-wide v3, Lcom/innioasis/ipp/ScanProbe;->proc0:J
    sub-long v9, v26, v3
    const-wide/16 v3, 10
    mul-long v9, v9, v3
    invoke-virtual { v2, v9, v10 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " ms, scan thread CPU "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 449
    invoke-virtual { v2, v13, v14 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 450
    sget-wide v2, Lcom/innioasis/ipp/ScanProbe;->io0:J
    const-wide/16 v4, 0
    cmp-long v0, v2, v4
    if-ltz v0, :L35
    cmp-long v0, v24, v4
    if-ltz v0, :L35
  .line 451
    const-string v0, "  app read from storage "
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-wide v2, Lcom/innioasis/ipp/ScanProbe;->io0:J
    sub-long v11, v24, v2
    const-wide/16 v2, 1024
    div-long/2addr v11, v2
    invoke-virtual { v0, v11, v12 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " KB\n"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L35
  .line 454
    sget-object v0, Lcom/innioasis/ipp/ScanProbe;->before:Ljava/util/HashMap;
    if-eqz v0, :L36
    invoke-static { v6 }, Lcom/innioasis/ipp/ScanProbe;->compare(Ljava/lang/StringBuilder;)V
  :L36
  .line 455
    sput-object v1, Lcom/innioasis/ipp/ScanProbe;->before:Ljava/util/HashMap;
  .line 456
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/ScanProbe;->force:Z
  .line 457
    invoke-virtual { v6 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 458
    invoke-virtual { v1, v15 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v2
  .line 459
    const/4 v4, 0
  :L37
    array-length v0, v2
    if-ge v4, v0, :L40
    aget-object v0, v2, v4
  :L38
    move-object/from16 v3, v21
  :L39
    invoke-static { v3, v0 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    add-int/lit8 v4, v4, 1
    move-object/from16 v21, v3
    goto :L37
  :L40
  .line 460
    move-object/from16 v3, v21
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object v2
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "scan_"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-static { }, Lcom/innioasis/ipp/Panel;->stamp()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, ".txt"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-direct { v0, v2, v4 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 461
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L41
  .line 463
    const-string v0, "UTF-8"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  :L42
  .line 465
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 466
    nop
  .line 469
    goto :L48
  :L43
  .line 465
    move-exception v0
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 466
    throw v0
  :L44
  .line 467
    move-exception v0
    goto :L47
  :L45
    move-exception v0
    move-object/from16 v3, v21
    goto :L47
  :L46
    move-exception v0
    move-object v3, v2
  :L47
  .line 468
    const-string v1, "report failed"
    invoke-static { v3, v1, v0 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
  :L48
  .line 470
    return-void
.end method

.method static declared-synchronized exists(Z)V
  .catchall { :L0 .. :L2 } :L3
  .registers 6
    const-class v0, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter v0
  .line 247
    const-wide/16 v1, 1
    if-eqz p0, :L1
  :L0
    sget-wide v3, Lcom/innioasis/ipp/ScanProbe;->seenN:J
    add-long/2addr v3, v1
    sput-wide v3, Lcom/innioasis/ipp/ScanProbe;->seenN:J
    goto :L2
  :L1
  .line 248
    sget-wide v3, Lcom/innioasis/ipp/ScanProbe;->askedN:J
    add-long/2addr v3, v1
    sput-wide v3, Lcom/innioasis/ipp/ScanProbe;->askedN:J
  :L2
  .line 249
    monitor-exit v0
    return-void
  :L3
  .line 246
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static fBegin()V
  .registers 4
  .line 265
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->slot()[J
    move-result-object v0
  .line 266
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
  .line 267
    const/4 v3, 0
    aput-wide v1, v0, v3
  .line 268
    const/4 v3, 1
    aput-wide v1, v0, v3
  .line 269
    return-void
.end method

.method public static fEnd(Lcom/innioasis/y1/database/Song;)V
  .catchall { :L2 .. :L8 } :L7
  .registers 11
  .line 324
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  :L1
  .line 325
    const/4 v0, 5
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->mark(I)V
  .line 326
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->slot()[J
    move-result-object v0
  .line 327
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
    const/4 v3, 1
    aget-wide v4, v0, v3
    sub-long/2addr v1, v4
  .line 328
    const-class v0, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter v0
  :L2
  .line 329
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->who()I
    move-result v4
  .line 330
    sget-object v5, Lcom/innioasis/ipp/ScanProbe;->files:[J
    aget-wide v6, v5, v4
    const-wide/16 v8, 1
    add-long/2addr v6, v8
    aput-wide v6, v5, v4
  .line 331
    sget-object v5, Lcom/innioasis/ipp/ScanProbe;->fileNs:[J
    aget-wide v6, v5, v4
    add-long/2addr v6, v1
    aput-wide v6, v5, v4
  .line 332
    nop
  .line 333
    const/4 v4, 0
  :L3
    const/16 v5, 12
    if-ge v3, v5, :L5
    sget-object v5, Lcom/innioasis/ipp/ScanProbe;->topNs:[J
    aget-wide v6, v5, v3
    aget-wide v8, v5, v4
    cmp-long v5, v6, v8
    if-gez v5, :L4
    move v4, v3
  :L4
    add-int/lit8 v3, v3, 1
    goto :L3
  :L5
  .line 334
    sget-object v3, Lcom/innioasis/ipp/ScanProbe;->topNs:[J
    aget-wide v5, v3, v4
    cmp-long v7, v1, v5
    if-lez v7, :L6
  .line 335
    aput-wide v1, v3, v4
  .line 336
    sget-object v1, Lcom/innioasis/ipp/ScanProbe;->topPath:[Ljava/lang/String;
    aput-object p0, v1, v4
  :L6
  .line 338
    monitor-exit v0
  .line 339
    return-void
  :L7
  .line 338
    move-exception p0
    monitor-exit v0
  :L8
    goto :L10
  :L9
    throw p0
  :L10
    goto :L9
.end method

.method public static fExtracted()V
  .registers 1
  .line 319
    const/4 v0, 2
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->mark(I)V
    return-void
.end method

.method public static fLogged()V
  .registers 1
  .line 321
    const/4 v0, 4
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->mark(I)V
    return-void
.end method

.method public static fOpened(Ljava/lang/String;)V
  .catchall { :L1 .. :L4 } :L3
  .registers 10
  .line 284
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->slot()[J
    move-result-object v0
  .line 285
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
    const/4 v3, 0
    aget-wide v4, v0, v3
    sub-long/2addr v1, v4
  .line 286
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->mark(I)V
  .line 287
    const-string v4, "?"
  .line 288
    if-eqz p0, :L0
  .line 289
    const/16 v5, 46
    invoke-virtual { p0, v5 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v5
  .line 290
    if-ltz v5, :L0
    add-int/2addr v5, v0
    invoke-virtual { p0, v5 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v4
  :L0
  .line 292
    const-class p0, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter p0
  :L1
  .line 293
    sget-object v5, Lcom/innioasis/ipp/ScanProbe;->extOpen:Ljava/util/HashMap;
    invoke-virtual { v5, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, [J
  .line 294
    if-nez v6, :L2
  .line 295
    const/4 v6, 2
    new-array v6, v6, [J
  .line 296
    invoke-virtual { v5, v4, v6 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 298
    aget-wide v4, v6, v3
    const-wide/16 v7, 1
    add-long/2addr v4, v7
    aput-wide v4, v6, v3
  .line 299
    aget-wide v3, v6, v0
    add-long/2addr v3, v1
    aput-wide v3, v6, v0
  .line 300
    monitor-exit p0
  .line 301
    return-void
  :L3
  .line 300
    move-exception v0
    monitor-exit p0
  :L4
    throw v0
.end method

.method public static fPreMmr()V
  .registers 1
  .line 281
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->mark(I)V
    return-void
.end method

.method public static fScanned()V
  .registers 1
  .line 320
    const/4 v0, 3
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->mark(I)V
    return-void
.end method

.method private static fields(Lcom/innioasis/y1/database/Song;)[Ljava/lang/String;
  .registers 4
  .line 83
    const/16 v0, 13
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
    const/4 v1, 1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPinyinSongName()Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
    const/4 v1, 2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
    const/4 v1, 3
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getLowAlbum()Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
  .line 84
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPinyinAlbum()Ljava/lang/String;
    move-result-object v1
    const/4 v2, 4
    aput-object v1, v0, v2
    const/4 v1, 5
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
    const/4 v1, 6
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPinyinArtist()Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
    const/4 v1, 7
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
    const/16 v1, 8
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPinyinGenre()Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
  .line 85
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v1
    const/16 v2, 9
    aput-object v1, v0, v2
    const/16 v1, 10
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
    const/16 v1, 11
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getDisc()Ljava/lang/String;
    move-result-object v2
    aput-object v2, v0, v1
    const/16 v1, 12
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object p0
    aput-object p0, v0, v1
  .line 83
    return-object v0
.end method

.method public static finalInserted()V
  .registers 2
  .line 192
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->tFinal:J
    return-void
.end method

.method private static first(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L7
  .catchall { :L1 .. :L2 } :L6
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L9 .. :L10 } :L11
  .registers 4
  .line 518
    nop
  .line 520
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/BufferedReader;
    new-instance v2, Ljava/io/FileReader;
    invoke-direct { v2, p0 }, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    invoke-direct { v1, v2 }, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
  :L1
  .line 521
    invoke-virtual { v1 }, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object p0
  :L2
  .line 526
    invoke-virtual { v1 }, Ljava/io/BufferedReader;->close()V
  :L3
  .line 528
    goto :L5
  :L4
  .line 527
    move-exception v0
  :L5
  .line 521
    return-object p0
  :L6
  .line 522
    move-exception p0
    goto :L8
  :L7
    move-exception p0
    move-object v1, v0
  :L8
  .line 523
    nop
  .line 526
    if-eqz v1, :L12
  :L9
    invoke-virtual { v1 }, Ljava/io/BufferedReader;->close()V
  :L10
    goto :L12
  :L11
  .line 527
    move-exception p0
    goto :L13
  :L12
  .line 528
    nop
  :L13
  .line 523
    return-object v0
.end method

.method public static declared-synchronized flushed(J)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
    const-class v0, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter v0
  :L0
  .line 236
    sget-wide v1, Lcom/innioasis/ipp/ScanProbe;->flushNs:J
    add-long/2addr v1, p0
    sput-wide v1, Lcom/innioasis/ipp/ScanProbe;->flushNs:J
  :L1
    monitor-exit v0
    return-void
  :L2
  .line 236
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static ins0()V
  .registers 2
  .line 229
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->insAt:J
    return-void
.end method

.method public static ins1()V
  .registers 6
  .line 231
    sget-wide v0, Lcom/innioasis/ipp/ScanProbe;->insN:J
    const-wide/16 v2, 1
    add-long/2addr v0, v2
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->insN:J
  .line 232
    sget-wide v0, Lcom/innioasis/ipp/ScanProbe;->insNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
    sget-wide v4, Lcom/innioasis/ipp/ScanProbe;->insAt:J
    sub-long/2addr v2, v4
    add-long/2addr v0, v2
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->insNs:J
  .line 233
    return-void
.end method

.method static declared-synchronized known(J)V
  .catchall { :L0 .. :L1 } :L2
  .registers 7
    const-class v0, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter v0
  :L0
  .line 252
    sget-wide v1, Lcom/innioasis/ipp/ScanProbe;->knownN:J
    const-wide/16 v3, 1
    add-long/2addr v1, v3
    sput-wide v1, Lcom/innioasis/ipp/ScanProbe;->knownN:J
  .line 253
    sget-wide v1, Lcom/innioasis/ipp/ScanProbe;->knownNs:J
    add-long/2addr v1, p0
    sput-wide v1, Lcom/innioasis/ipp/ScanProbe;->knownNs:J
  :L1
  .line 254
    monitor-exit v0
    return-void
  :L2
  .line 251
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static lc0()V
  .registers 2
  .line 238
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->lcAt:J
    return-void
.end method

.method public static lc1()V
  .registers 6
  .line 240
    sget-wide v0, Lcom/innioasis/ipp/ScanProbe;->lcN:J
    const-wide/16 v2, 1
    add-long/2addr v0, v2
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->lcN:J
  .line 241
    sget-wide v0, Lcom/innioasis/ipp/ScanProbe;->lcNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
    sget-wide v4, Lcom/innioasis/ipp/ScanProbe;->lcAt:J
    sub-long/2addr v2, v4
    add-long/2addr v0, v2
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->lcNs:J
  .line 242
    return-void
.end method

.method private static line(Ljava/lang/StringBuilder;Ljava/lang/String;JJ)V
  .registers 8
  .line 473
    const-string v0, "  "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, ": "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p2, p3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, " ms"
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 474
    const-wide/16 v0, 0
    cmp-long p1, p4, v0
    if-lez p1, :L0
    const-string p1, " ("
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const-wide/16 v0, 100
    mul-long p2, p2, v0
    div-long/2addr p2, p4
    invoke-virtual { p1, p2, p3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string p2, "%)"
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L0
  .line 475
    const/16 p1, 10
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 476
    return-void
.end method

.method public static list0()V
  .registers 2
  .line 223
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->listAt:J
    return-void
.end method

.method public static list1()V
  .registers 6
  .line 225
    sget-wide v0, Lcom/innioasis/ipp/ScanProbe;->listN:J
    const-wide/16 v2, 1
    add-long/2addr v0, v2
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->listN:J
  .line 226
    sget-wide v0, Lcom/innioasis/ipp/ScanProbe;->listNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
    sget-wide v4, Lcom/innioasis/ipp/ScanProbe;->listAt:J
    sub-long/2addr v2, v4
    add-long/2addr v0, v2
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->listNs:J
  .line 227
    return-void
.end method

.method private static mark(I)V
  .catchall { :L0 .. :L2 } :L1
  .registers 7
  .line 272
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->slot()[J
    move-result-object v0
  .line 273
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
  .line 274
    const/4 v3, 0
    aget-wide v4, v0, v3
    sub-long v4, v1, v4
  .line 275
    aput-wide v1, v0, v3
  .line 276
    const-class v0, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter v0
  :L0
  .line 277
    sget-object v1, Lcom/innioasis/ipp/ScanProbe;->stage:[[J
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->who()I
    move-result v2
    aget-object v1, v1, v2
    aget-wide v2, v1, p0
    add-long/2addr v2, v4
    aput-wide v2, v1, p0
  .line 278
    monitor-exit v0
  .line 279
    return-void
  :L1
  .line 278
    move-exception p0
    monitor-exit v0
  :L2
    throw p0
.end method

.method private static ms(J)J
  .registers 4
  .line 479
    const-wide/32 v0, 1000000
    div-long/2addr p0, v0
    return-wide p0
.end method

.method static own(Ljava/lang/String;JZ)V
  .catchall { :L2 .. :L6 } :L5
  .registers 11
  .line 305
    if-nez p0, :L0
    const-string p0, "?"
  :L0
  .line 306
    const-string v0, "blind "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const/4 v0, 6
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->mark(I)V
  :L1
  .line 307
    const-class v0, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter v0
  :L2
  .line 308
    sget-object v1, Lcom/innioasis/ipp/ScanProbe;->extOwn:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [J
  .line 309
    if-nez v2, :L3
  .line 310
    const/4 v2, 3
    new-array v2, v2, [J
  .line 311
    invoke-virtual { v1, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 313
    const/4 p0, 0
    aget-wide v3, v2, p0
    const-wide/16 v5, 1
    add-long/2addr v3, v5
    aput-wide v3, v2, p0
  .line 314
    const/4 p0, 1
    aget-wide v3, v2, p0
    add-long/2addr v3, p1
    aput-wide v3, v2, p0
  .line 315
    if-eqz p3, :L4
    const/4 p0, 2
    aget-wide p1, v2, p0
    add-long/2addr p1, v5
    aput-wide p1, v2, p0
  :L4
  .line 316
    monitor-exit v0
  .line 317
    return-void
  :L5
  .line 316
    move-exception p0
    monitor-exit v0
  :L6
    throw p0
.end method

.method public static preLoad()V
  .registers 2
  .line 194
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->tPreLoad:J
    return-void
.end method

.method private static procCpu()J
  .registers 5
  .line 493
    const-string v0, "/proc/self/stat"
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->first(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 494
    if-nez v0, :L0
    const-wide/16 v0, 0
    return-wide v0
  :L0
  .line 495
    const/16 v1, 41
    invoke-virtual { v0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
    add-int/lit8 v1, v1, 2
    invoke-virtual { v0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v0
    const-string v1, " "
    invoke-virtual { v0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 496
    const/16 v1, 11
    aget-object v1, v0, v1
    invoke-static { v1 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v1
    const/16 v3, 12
    aget-object v0, v0, v3
    invoke-static { v0 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v3
    add-long/2addr v1, v3
    return-wide v1
.end method

.method public static pyIn()V
  .registers 4
  .line 343
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->slot()[J
    move-result-object v0
    const/4 v1, 2
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
    aput-wide v2, v0, v1
    return-void
.end method

.method public static pyLocked()V
  .registers 4
  .line 344
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->slot()[J
    move-result-object v0
    const/4 v1, 3
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
    aput-wide v2, v0, v1
    return-void
.end method

.method public static pyOut()V
  .catchall { :L0 .. :L2 } :L1
  .registers 10
  .line 346
    invoke-static { }, Lcom/innioasis/ipp/ScanProbe;->slot()[J
    move-result-object v0
  .line 347
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
  .line 348
    const-class v3, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter v3
  :L0
  .line 349
    sget-wide v4, Lcom/innioasis/ipp/ScanProbe;->pyCount:J
    const-wide/16 v6, 1
    add-long/2addr v4, v6
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->pyCount:J
  .line 350
    sget-wide v4, Lcom/innioasis/ipp/ScanProbe;->pyWait:J
    const/4 v6, 3
    aget-wide v6, v0, v6
    const/4 v8, 2
    aget-wide v8, v0, v8
    sub-long v8, v6, v8
    add-long/2addr v4, v8
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->pyWait:J
  .line 351
    sget-wide v4, Lcom/innioasis/ipp/ScanProbe;->pyBody:J
    sub-long/2addr v1, v6
    add-long/2addr v4, v1
    sput-wide v4, Lcom/innioasis/ipp/ScanProbe;->pyBody:J
  .line 352
    monitor-exit v3
  .line 353
    return-void
  :L1
  .line 352
    move-exception v0
    monitor-exit v3
  :L2
    throw v0
.end method

.method private static readBytes()J
  .catchall { :L0 .. :L1 } :L8
  .catchall { :L1 .. :L2 } :L7
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L6 .. :L10 } :L11
  .registers 4
  .line 500
    nop
  .line 502
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/BufferedReader;
    new-instance v2, Ljava/io/FileReader;
    const-string v3, "/proc/self/io"
    invoke-direct { v2, v3 }, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    invoke-direct { v1, v2 }, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
  :L1
  .line 504
    invoke-virtual { v1 }, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :L6
  .line 505
    const-string v2, "read_bytes:"
    invoke-virtual { v0, v2 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L1
    const/16 v2, 11
    invoke-virtual { v0, v2 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide v2
  :L2
  .line 510
    invoke-virtual { v1 }, Ljava/io/BufferedReader;->close()V
  :L3
  .line 512
    goto :L5
  :L4
  .line 511
    move-exception v0
  :L5
  .line 505
    return-wide v2
  :L6
  .line 510
    invoke-virtual { v1 }, Ljava/io/BufferedReader;->close()V
    goto :L12
  :L7
  .line 507
    move-exception v0
    move-object v0, v1
    goto :L9
  :L8
    move-exception v1
  :L9
  .line 510
    if-eqz v0, :L12
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->close()V
  :L10
    goto :L12
  :L11
  .line 511
    move-exception v0
  .line 513
    goto :L13
  :L12
  .line 512
    nop
  :L13
  .line 514
    const-wide/16 v0, -1
    return-wide v0
.end method

.method public static slept()V
  .registers 4
  .line 195
    sget-wide v0, Lcom/innioasis/ipp/ScanProbe;->sleptN:J
    const-wide/16 v2, 1
    add-long/2addr v0, v2
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->sleptN:J
    return-void
.end method

.method private static slot()[J
  .registers 2
  .line 62
    sget-object v0, Lcom/innioasis/ipp/ScanProbe;->T:Ljava/lang/ThreadLocal;
    invoke-virtual { v0 }, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [J
  .line 63
    if-nez v1, :L0
  .line 64
    const/4 v1, 4
    new-array v1, v1, [J
  .line 65
    invoke-virtual { v0, v1 }, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
  :L0
  .line 67
    return-object v1
.end method

.method static declared-synchronized song(IJ)V
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L2 .. :L3 } :L4
  .registers 9
    const-class v0, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter v0
  :L0
  .line 257
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sget-object v2, Lcom/innioasis/ipp/ScanProbe;->scanThread:Ljava/lang/Thread;
  :L1
    if-eq v1, v2, :L2
    monitor-exit v0
    return-void
  :L2
  .line 258
    sget-object v1, Lcom/innioasis/ipp/ScanProbe;->howN:[J
    aget-wide v2, v1, p0
    const-wide/16 v4, 1
    add-long/2addr v2, v4
    aput-wide v2, v1, p0
  .line 259
    sget-object v1, Lcom/innioasis/ipp/ScanProbe;->howNs:[J
    aget-wide v2, v1, p0
    add-long/2addr v2, p1
    aput-wide v2, v1, p0
  :L3
  .line 260
    monitor-exit v0
    return-void
  :L4
  .line 256
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static table()Ljava/util/HashMap;
  .catchall { :L0 .. :L4 } :L7
  .registers 8
  .line 89
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
  :L0
  .line 91
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 92
    const/4 v2, 0
    const/4 v3, 0
  :L1
    const/4 v4, 2
    if-ge v3, v4, :L6
  .line 93
    invoke-virtual { v1, v3 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v4
  .line 94
    if-nez v4, :L2
    goto :L5
  :L2
  .line 95
    const/4 v5, 0
  :L3
    invoke-interface { v4 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v5, v6, :L5
  .line 96
    invoke-interface { v4, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 97
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    if-eqz v7, :L4
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v6 }, Lcom/innioasis/ipp/ScanProbe;->fields(Lcom/innioasis/y1/database/Song;)[Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v0, v7, v6 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 95
    add-int/lit8 v5, v5, 1
    goto :L3
  :L5
  .line 92
    add-int/lit8 v3, v3, 1
    goto :L1
  :L6
  .line 102
    goto :L8
  :L7
  .line 100
    move-exception v1
  .line 101
    const-string v2, "IPPSCAN"
    const-string v3, "table read failed"
    invoke-static { v2, v3, v1 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
  :L8
  .line 103
    return-object v0
.end method

.method private static w(I)V
  .registers 8
  .line 207
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 208
    sget-wide v2, Lcom/innioasis/ipp/ScanProbe;->wLast:J
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-eqz v6, :L0
    sget-object v4, Lcom/innioasis/ipp/ScanProbe;->wNs:[J
    aget-wide v5, v4, p0
    sub-long v2, v0, v2
    add-long/2addr v5, v2
    aput-wide v5, v4, p0
  :L0
  .line 209
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->wLast:J
  .line 210
    return-void
.end method

.method public static wDir()V
  .registers 1
  .line 221
    const/16 v0, 9
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->w(I)V
    return-void
.end method

.method public static wExists()V
  .registers 1
  .line 215
    const/4 v0, 3
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->w(I)V
    return-void
.end method

.method public static wHead()V
  .registers 4
  .line 212
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->w(I)V
    sget-wide v0, Lcom/innioasis/ipp/ScanProbe;->wNodes:J
    const-wide/16 v2, 1
    add-long/2addr v0, v2
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->wNodes:J
    return-void
.end method

.method public static wLogged()V
  .registers 1
  .line 213
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->w(I)V
    return-void
.end method

.method public static wMusic()V
  .registers 1
  .line 217
    const/4 v0, 5
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->w(I)V
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/ScanProbe;->wMusic:Z
    return-void
.end method

.method public static wPost()V
  .registers 1
  .line 218
    sget-boolean v0, Lcom/innioasis/ipp/ScanProbe;->wMusic:Z
    if-eqz v0, :L0
    const/4 v0, 6
    goto :L1
  :L0
    const/4 v0, 5
  :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->w(I)V
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/ScanProbe;->wMusic:Z
    return-void
.end method

.method public static wRemoved()V
  .registers 1
  .line 214
    const/4 v0, 2
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->w(I)V
    return-void
.end method

.method public static wSkip()V
  .registers 1
  .line 216
    const/4 v0, 4
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->w(I)V
    return-void
.end method

.method public static wVideo()V
  .registers 1
  .line 219
    const/4 v0, 7
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->w(I)V
    return-void
.end method

.method public static wVideoDone()V
  .registers 1
  .line 220
    const/16 v0, 8
    invoke-static { v0 }, Lcom/innioasis/ipp/ScanProbe;->w(I)V
    return-void
.end method

.method public static walked()V
  .registers 2
  .line 191
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/ScanProbe;->tWalk:J
    return-void
.end method

.method private static who()I
  .registers 2
  .line 71
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/ScanProbe;->scanThread:Ljava/lang/Thread;
    if-ne v0, v1, :L0
    const/4 v0, 0
    goto :L1
  :L0
    const/4 v0, 1
  :L1
    return v0
.end method

.method public static declared-synchronized wrote(J)V
  .catchall { :L0 .. :L1 } :L2
  .registers 7
    const-class v0, Lcom/innioasis/ipp/ScanProbe;
    monitor-enter v0
  :L0
  .line 235
    sget-wide v1, Lcom/innioasis/ipp/ScanProbe;->wrN:J
    const-wide/16 v3, 1
    add-long/2addr v1, v3
    sput-wide v1, Lcom/innioasis/ipp/ScanProbe;->wrN:J
    sget-wide v1, Lcom/innioasis/ipp/ScanProbe;->wrNs:J
    add-long/2addr v1, p0
    sput-wide v1, Lcom/innioasis/ipp/ScanProbe;->wrNs:J
  :L1
    monitor-exit v0
    return-void
  :L2
  .line 235
    move-exception p0
    monitor-exit v0
    throw p0
.end method

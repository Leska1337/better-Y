.class final Lcom/innioasis/ipp/Lab$Stacks;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Lab.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lab;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Stacks"
.end annotation

.field private final binder:Ljava/util/HashMap;

.field private binders:[Ljava/lang/Thread;

.field private busySince:J

.field private lastDump:J

.field private lastEnum:J

.field private samples:J

.field private final streakBinder:Ljava/util/HashMap;

.field private final streakMain:Ljava/util/HashMap;

.method constructor <init>()V
  .registers 2
  .line 185
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 186
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Lab$Stacks;->binder:Ljava/util/HashMap;
  .line 187
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Lab$Stacks;->streakMain:Ljava/util/HashMap;
  .line 188
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Lab$Stacks;->streakBinder:Ljava/util/HashMap;
  .line 189
    const/4 v0, 0
    new-array v0, v0, [Ljava/lang/Thread;
    iput-object v0, p0, Lcom/innioasis/ipp/Lab$Stacks;->binders:[Ljava/lang/Thread;
    return-void
.end method

.method static synthetic access$000(Ljava/util/HashMap;I)Ljava/lang/String;
  .registers 2
  .line 185
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Lab$Stacks;->sorted(Ljava/util/HashMap;I)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static binderThreads()[Ljava/lang/Thread;
  .registers 6
  .line 242
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Thread;->getThreadGroup()Ljava/lang/ThreadGroup;
    move-result-object v0
  :L0
  .line 243
    invoke-virtual { v0 }, Ljava/lang/ThreadGroup;->getParent()Ljava/lang/ThreadGroup;
    move-result-object v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Ljava/lang/ThreadGroup;->getParent()Ljava/lang/ThreadGroup;
    move-result-object v0
    goto :L0
  :L1
  .line 244
    invoke-virtual { v0 }, Ljava/lang/ThreadGroup;->activeCount()I
    move-result v1
    add-int/lit8 v1, v1, 16
    new-array v1, v1, [Ljava/lang/Thread;
  .line 245
    const/4 v2, 1
    invoke-virtual { v0, v1, v2 }, Ljava/lang/ThreadGroup;->enumerate([Ljava/lang/Thread;Z)I
    move-result v0
  .line 246
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 247
    const/4 v3, 0
  :L2
    if-ge v3, v0, :L4
  .line 248
    aget-object v4, v1, v3
    if-eqz v4, :L3
    invoke-virtual { v4 }, Ljava/lang/Thread;->getName()Ljava/lang/String;
    move-result-object v4
    const-string v5, "Binder"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L3
    aget-object v4, v1, v3
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 247
    add-int/lit8 v3, v3, 1
    goto :L2
  :L4
  .line 250
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v0
    new-array v0, v0, [Ljava/lang/Thread;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [Ljava/lang/Thread;
    return-object v0
.end method

.method private static count(Ljava/util/HashMap;Ljava/lang/String;)V
  .registers 4
  .line 275
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [I
  .line 276
    const/4 v1, 1
    if-nez v0, :L0
    filled-new-array { v1 }, [I
    move-result-object v0
    invoke-virtual { p0, p1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L1
  :L0
  .line 277
    const/4 p0, 0
    aget p1, v0, p0
    add-int/2addr p1, v1
    aput p1, v0, p0
  :L1
  .line 278
    return-void
.end method

.method private static sorted(Ljava/util/HashMap;I)Ljava/lang/String;
  .registers 8
  .line 281
    new-instance v0, Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object p0
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 282
    new-instance p0, Lcom/innioasis/ipp/Lab$ByCount;
    invoke-direct { p0 }, Lcom/innioasis/ipp/Lab$ByCount;-><init>()V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 283
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 284
    const/4 v1, 0
    const/4 v2, 0
  :L0
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L1
    if-ge v2, p1, :L1
  .line 285
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 286
    const-string v4, " ["
    invoke-virtual { p0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, [I
    aget v5, v5, v1
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, "x] "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
  .line 284
    add-int/lit8 v2, v2, 1
    goto :L0
  :L1
  .line 288
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static top([Ljava/lang/StackTraceElement;II)Ljava/lang/String;
  .registers 8
  .line 265
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 266
    move v1, p1
  :L0
    array-length v2, p0
    if-ge v1, v2, :L2
    add-int v2, p1, p2
    if-ge v1, v2, :L2
  .line 267
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->length()I
    move-result v2
    if-lez v2, :L1
    const-string v2, " < "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L1
  .line 268
    aget-object v2, p0, v1
    invoke-virtual { v2 }, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;
    move-result-object v2
    const-string v3, "com.innioasis."
    const-string v4, ""
    invoke-virtual { v2, v3, v4 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v3, 46
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, p0, v1
  .line 269
    invoke-virtual { v3 }, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v3, 58
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/lang/StackTraceElement;->getLineNumber()I
    move-result v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
  .line 266
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 271
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static transact([Ljava/lang/StackTraceElement;)Ljava/lang/String;
  .registers 5
  .line 255
    const/4 v0, 0
    const/4 v1, 0
  :L0
    array-length v2, p0
    if-ge v1, v2, :L4
  .line 256
    aget-object v2, p0, v1
    invoke-virtual { v2 }, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;
    move-result-object v2
    const-string v3, "execTransact"
    invoke-virtual { v3, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
  .line 257
    if-lez v1, :L1
    add-int/lit8 v2, v1, -1
    aget-object v2, p0, v2
    invoke-virtual { v2 }, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;
    move-result-object v2
    goto :L2
  :L1
    const-string v2, "?"
  :L2
  .line 258
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " { "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    add-int/lit8 v1, v1, -1
    const/4 v3, 4
    invoke-static { v1, v3 }, Ljava/lang/Math;->min(II)I
    move-result v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Lab$Stacks;->top([Ljava/lang/StackTraceElement;II)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " }"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L3
  .line 255
    add-int/lit8 v1, v1, 1
    goto :L0
  :L4
  .line 261
    const/4 p0, 0
    return-object p0
.end method

.method public run()V
  .catch Ljava/lang/InterruptedException; { :L1 .. :L2 } :L15
  .registers 12
  .line 193
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/os/Looper;->getThread()Ljava/lang/Thread;
    move-result-object v0
  .line 194
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    iput-wide v1, p0, Lcom/innioasis/ipp/Lab$Stacks;->lastDump:J
  :L0
  .line 197
    const-wide/16 v1, 15
  :L1
    invoke-static { v1, v2 }, Ljava/lang/Thread;->sleep(J)V
  :L2
  .line 200
    nop
  .line 201
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 202
    iget-wide v3, p0, Lcom/innioasis/ipp/Lab$Stacks;->lastEnum:J
    sub-long v3, v1, v3
    const-wide/16 v5, 2000
    cmp-long v7, v3, v5
    if-lez v7, :L3
  .line 203
    invoke-static { }, Lcom/innioasis/ipp/Lab$Stacks;->binderThreads()[Ljava/lang/Thread;
    move-result-object v3
    iput-object v3, p0, Lcom/innioasis/ipp/Lab$Stacks;->binders:[Ljava/lang/Thread;
  .line 204
    iput-wide v1, p0, Lcom/innioasis/ipp/Lab$Stacks;->lastEnum:J
  :L3
  .line 206
    iget-wide v3, p0, Lcom/innioasis/ipp/Lab$Stacks;->samples:J
    const-wide/16 v5, 1
    add-long/2addr v3, v5
    iput-wide v3, p0, Lcom/innioasis/ipp/Lab$Stacks;->samples:J
  .line 207
    const/4 v3, 0
    const/4 v4, 0
  :L4
    iget-object v5, p0, Lcom/innioasis/ipp/Lab$Stacks;->binders:[Ljava/lang/Thread;
    array-length v6, v5
    const-wide/16 v7, 0
    if-ge v4, v6, :L7
  .line 208
    aget-object v5, v5, v4
    invoke-virtual { v5 }, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Lab$Stacks;->transact([Ljava/lang/StackTraceElement;)Ljava/lang/String;
    move-result-object v5
  .line 209
    if-nez v5, :L5
    goto :L6
  :L5
  .line 210
    iget-object v6, p0, Lcom/innioasis/ipp/Lab$Stacks;->binder:Ljava/util/HashMap;
    invoke-static { v6, v5 }, Lcom/innioasis/ipp/Lab$Stacks;->count(Ljava/util/HashMap;Ljava/lang/String;)V
  .line 211
    iget-wide v9, p0, Lcom/innioasis/ipp/Lab$Stacks;->busySince:J
    cmp-long v6, v9, v7
    if-eqz v6, :L6
    iget-object v6, p0, Lcom/innioasis/ipp/Lab$Stacks;->streakBinder:Ljava/util/HashMap;
    invoke-static { v6, v5 }, Lcom/innioasis/ipp/Lab$Stacks;->count(Ljava/util/HashMap;Ljava/lang/String;)V
  :L6
  .line 207
    add-int/lit8 v4, v4, 1
    goto :L4
  :L7
  .line 213
    invoke-virtual { v0 }, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;
    move-result-object v4
  .line 214
    array-length v5, v4
    if-eqz v5, :L9
    aget-object v5, v4, v3
  .line 215
    invoke-virtual { v5 }, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;
    move-result-object v5
    const-string v6, "nativePollOnce"
    invoke-virtual { v6, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L8
    goto :L9
  :L8
    const/4 v5, 0
    goto :L10
  :L9
    const/4 v5, 1
  :L10
  .line 216
    const-string v6, "ipplab"
    if-nez v5, :L12
  .line 217
    iget-wide v9, p0, Lcom/innioasis/ipp/Lab$Stacks;->busySince:J
    cmp-long v5, v9, v7
    if-nez v5, :L11
  .line 218
    iput-wide v1, p0, Lcom/innioasis/ipp/Lab$Stacks;->busySince:J
  .line 219
    iget-object v5, p0, Lcom/innioasis/ipp/Lab$Stacks;->streakMain:Ljava/util/HashMap;
    invoke-virtual { v5 }, Ljava/util/HashMap;->clear()V
  .line 220
    iget-object v5, p0, Lcom/innioasis/ipp/Lab$Stacks;->streakBinder:Ljava/util/HashMap;
    invoke-virtual { v5 }, Ljava/util/HashMap;->clear()V
  :L11
  .line 222
    iget-object v5, p0, Lcom/innioasis/ipp/Lab$Stacks;->streakMain:Ljava/util/HashMap;
    const/4 v9, 6
    invoke-static { v4, v3, v9 }, Lcom/innioasis/ipp/Lab$Stacks;->top([Ljava/lang/StackTraceElement;II)Ljava/lang/String;
    move-result-object v3
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Lab$Stacks;->count(Ljava/util/HashMap;Ljava/lang/String;)V
    goto :L13
  :L12
  .line 223
    iget-wide v3, p0, Lcom/innioasis/ipp/Lab$Stacks;->busySince:J
    cmp-long v5, v3, v7
    if-eqz v5, :L13
  .line 224
    sub-long v3, v1, v3
  .line 225
    iput-wide v7, p0, Lcom/innioasis/ipp/Lab$Stacks;->busySince:J
  .line 226
    const-wide/16 v9, 250
    cmp-long v5, v3, v9
    if-ltz v5, :L13
  .line 227
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v9, "stall "
    invoke-virtual { v5, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " ms main: "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    iget-object v4, p0, Lcom/innioasis/ipp/Lab$Stacks;->streakMain:Ljava/util/HashMap;
    const/4 v5, 4
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/Lab$Stacks;->sorted(Ljava/util/HashMap;I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " || binder: "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    iget-object v4, p0, Lcom/innioasis/ipp/Lab$Stacks;->streakBinder:Ljava/util/HashMap;
  .line 228
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/Lab$Stacks;->sorted(Ljava/util/HashMap;I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
  .line 227
    invoke-static { v6, v3 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L13
  .line 231
    iget-wide v3, p0, Lcom/innioasis/ipp/Lab$Stacks;->lastDump:J
    sub-long v3, v1, v3
    const-wide/16 v9, 30000
    cmp-long v5, v3, v9
    if-lez v5, :L14
  .line 232
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "binder in "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    iget-wide v4, p0, Lcom/innioasis/ipp/Lab$Stacks;->lastDump:J
    sub-long v4, v1, v4
    const-wide/16 v9, 1000
    div-long/2addr v4, v9
    invoke-virtual { v3, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " s, "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    iget-wide v4, p0, Lcom/innioasis/ipp/Lab$Stacks;->samples:J
    invoke-virtual { v3, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " samples: "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    iget-object v4, p0, Lcom/innioasis/ipp/Lab$Stacks;->binder:Ljava/util/HashMap;
  .line 233
    const/16 v5, 8
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/Lab$Stacks;->sorted(Ljava/util/HashMap;I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
  .line 232
    invoke-static { v6, v3 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 234
    iget-object v3, p0, Lcom/innioasis/ipp/Lab$Stacks;->binder:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->clear()V
  .line 235
    iput-wide v7, p0, Lcom/innioasis/ipp/Lab$Stacks;->samples:J
  .line 236
    iput-wide v1, p0, Lcom/innioasis/ipp/Lab$Stacks;->lastDump:J
  :L14
  .line 238
    goto/16 :L0
  :L15
  .line 198
    move-exception v0
  .line 199
    return-void
.end method

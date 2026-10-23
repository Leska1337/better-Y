.class final Lcom/innioasis/ipp/Lab$Allocs;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Lab.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lab;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Allocs"
.end annotation

.field private final bytes:Ljava/util/HashMap;

.field private total:J

.method constructor <init>()V
  .registers 2
  .line 217
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 218
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    return-void
.end method

.method private static names(Ljava/nio/ByteBuffer;I)[Ljava/lang/String;
  .registers 9
  .line 295
    new-array v0, p1, [Ljava/lang/String;
  .line 296
    const/4 v1, 0
    const/4 v2, 0
  :L0
    if-ge v2, p1, :L5
  .line 297
    invoke-virtual { p0 }, Ljava/nio/ByteBuffer;->getInt()I
    move-result v3
  .line 298
    new-array v4, v3, [C
  .line 299
    const/4 v5, 0
  :L1
    if-ge v5, v3, :L2
    invoke-virtual { p0 }, Ljava/nio/ByteBuffer;->getChar()C
    move-result v6
    aput-char v6, v4, v5
    add-int/lit8 v5, v5, 1
    goto :L1
  :L2
  .line 300
    if-lez v3, :L3
    aget-char v5, v4, v1
    const/16 v6, 76
    if-ne v5, v6, :L3
    new-instance v5, Ljava/lang/String;
    add-int/lit8 v3, v3, -2
    const/4 v6, 1
    invoke-direct { v5, v4, v6, v3 }, Ljava/lang/String;-><init>([CII)V
    const/16 v3, 47
    const/16 v4, 46
    invoke-virtual { v5, v3, v4 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object v3
    goto :L4
  :L3
    new-instance v3, Ljava/lang/String;
    invoke-direct { v3, v4 }, Ljava/lang/String;-><init>([C)V
  :L4
    aput-object v3, v0, v2
  .line 296
    add-int/lit8 v2, v2, 1
    goto :L0
  :L5
  .line 302
    return-object v0
.end method

.method private parse([B)V
  .registers 24
  .line 255
    move-object/from16 v0, p0
    invoke-static/range { p1 .. p1 }, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;
    move-result-object v1
  .line 256
    const/4 v2, 0
    invoke-virtual { v1, v2 }, Ljava/nio/ByteBuffer;->get(I)B
    move-result v3
    and-int/lit16 v3, v3, 255
    const/4 v4, 1
    invoke-virtual { v1, v4 }, Ljava/nio/ByteBuffer;->get(I)B
    move-result v5
    and-int/lit16 v5, v5, 255
    const/4 v6, 2
    invoke-virtual { v1, v6 }, Ljava/nio/ByteBuffer;->get(I)B
    move-result v6
    and-int/lit16 v6, v6, 255
  .line 257
    const/4 v7, 3
    invoke-virtual { v1, v7 }, Ljava/nio/ByteBuffer;->getShort(I)S
    move-result v7
    const v8, 65535
    and-int/2addr v7, v8
    const/4 v9, 5
    invoke-virtual { v1, v9 }, Ljava/nio/ByteBuffer;->getInt(I)I
    move-result v9
  .line 258
    const/16 v10, 9
    invoke-virtual { v1, v10 }, Ljava/nio/ByteBuffer;->getShort(I)S
    move-result v10
    and-int/2addr v10, v8
    const/16 v11, 11
    invoke-virtual { v1, v11 }, Ljava/nio/ByteBuffer;->getShort(I)S
    move-result v11
    and-int/2addr v11, v8
  .line 259
    invoke-virtual { v1, v9 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 260
    invoke-static { v1, v10 }, Lcom/innioasis/ipp/Lab$Allocs;->names(Ljava/nio/ByteBuffer;I)[Ljava/lang/String;
    move-result-object v9
    invoke-static { v1, v11 }, Lcom/innioasis/ipp/Lab$Allocs;->names(Ljava/nio/ByteBuffer;I)[Ljava/lang/String;
    move-result-object v10
  .line 261
    invoke-virtual { v1, v3 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 262
    const/4 v3, 0
  :L0
    if-ge v3, v7, :L9
  .line 263
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->position()I
    move-result v11
  .line 264
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getInt()I
    move-result v12
  .line 265
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
  .line 266
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
    move-result v13
    and-int/2addr v13, v8
  .line 267
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->get()B
    move-result v14
    and-int/lit16 v14, v14, 255
  .line 268
    add-int/2addr v11, v5
    invoke-virtual { v1, v11 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 269
    nop
  .line 270
    new-instance v11, Ljava/lang/StringBuilder;
    invoke-direct { v11 }, Ljava/lang/StringBuilder;-><init>()V
  .line 271
    const-string v15, "?"
    move-object/from16 v16, v15
  :L1
    if-ge v2, v14, :L4
  .line 272
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->position()I
    move-result v17
  .line 273
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
    move-result v18
    and-int v18, v18, v8
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
    move-result v19
    and-int v19, v19, v8
  .line 274
    add-int v8, v17, v6
    invoke-virtual { v1, v8 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 275
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct { v8 }, Ljava/lang/StringBuilder;-><init>()V
    aget-object v4, v9, v18
    invoke-virtual { v8, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v8, "."
    invoke-virtual { v4, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    aget-object v8, v10, v19
    invoke-virtual { v4, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
  .line 276
    const-string v8, " < "
    invoke-virtual { v11, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    move-object/from16 v19, v1
    const/16 v1, 46
    invoke-virtual { v4, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v20
    move/from16 v21, v5
    const/16 v17, 1
    add-int/lit8 v5, v20, -1
    invoke-virtual { v4, v1, v5 }, Ljava/lang/String;->lastIndexOf(II)I
    move-result v1
    add-int/lit8 v1, v1, 1
    invoke-virtual { v4, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v8, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 277
    move-object/from16 v1, v16
    invoke-virtual { v15, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L2
    aget-object v5, v9, v18
    invoke-static { v5 }, Lcom/innioasis/ipp/Lab$Allocs;->platform(Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :L2
    move-object/from16 v16, v4
    goto :L3
  :L2
  .line 271
    move-object/from16 v16, v1
  :L3
    add-int/lit8 v2, v2, 1
    move-object/from16 v1, v19
    move/from16 v5, v21
    const/4 v4, 1
    const v8, 65535
    goto :L1
  :L4
  .line 280
    move-object/from16 v19, v1
    move/from16 v21, v5
    move-object/from16 v1, v16
    const/16 v17, 1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    aget-object v4, v9, v13
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, " @ "
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v15, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L5
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v15 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    goto :L6
  :L5
    const-string v4, "com.innioasis."
    const-string v5, ""
    invoke-virtual { v1, v4, v5 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v1
  :L6
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 281
    iget-object v2, v0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    invoke-virtual { v2, v1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [I
  .line 282
    if-nez v2, :L7
    iget-object v2, v0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    filled-new-array { v12 }, [I
    move-result-object v4
    invoke-virtual { v2, v1, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const/4 v1, 0
    goto :L8
  :L7
  .line 283
    const/4 v1, 0
    aget v4, v2, v1
    add-int/2addr v4, v12
    aput v4, v2, v1
  :L8
  .line 284
    iget-wide v4, v0, Lcom/innioasis/ipp/Lab$Allocs;->total:J
    int-to-long v11, v12
    add-long/2addr v4, v11
    iput-wide v4, v0, Lcom/innioasis/ipp/Lab$Allocs;->total:J
  .line 262
    add-int/lit8 v3, v3, 1
    move-object/from16 v1, v19
    move/from16 v5, v21
    const/4 v2, 0
    const/4 v4, 1
    const v8, 65535
    goto/16 :L0
  :L9
  .line 286
    return-void
.end method

.method private static platform(Ljava/lang/String;)Z
  .registers 2
  .line 289
    const-string v0, "java."
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "android."
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "dalvik."
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
  .line 290
    const-string v0, "libcore."
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "com.android."
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "androidx."
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
  .line 291
    const-string v0, "kotlin"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
  .line 289
    return p0
.end method

.method public run()V
  .catchall { :L0 .. :L4 } :L6
  .registers 15
  .line 223
    const-string v0, "ipplab"
  :L0
    const-string v1, "org.apache.harmony.dalvik.ddmc.DdmVmInternal"
    invoke-static { v1 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v1
  .line 224
    const-string v2, "enableRecentAllocations"
    const/4 v3, 1
    new-array v4, v3, [Ljava/lang/Class;
    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;
    const/4 v6, 0
    aput-object v5, v4, v6
    invoke-virtual { v1, v2, v4 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v2
  .line 225
    const-string v4, "getRecentAllocations"
    new-array v5, v6, [Ljava/lang/Class;
    invoke-virtual { v1, v4, v5 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v1
  .line 226
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L1
  .line 229
    new-array v7, v3, [Ljava/lang/Object;
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    aput-object v8, v7, v6
    const/4 v8, 0
    invoke-virtual { v2, v8, v7 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  .line 230
    const-wide/16 v9, 150
    invoke-static { v9, v10 }, Ljava/lang/Thread;->sleep(J)V
  .line 231
    new-array v7, v6, [Ljava/lang/Object;
    invoke-virtual { v1, v8, v7 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, [B
  .line 232
    new-array v9, v3, [Ljava/lang/Object;
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    aput-object v10, v9, v6
    invoke-virtual { v2, v8, v9 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  .line 233
    invoke-direct { p0, v7 }, Lcom/innioasis/ipp/Lab$Allocs;->parse([B)V
  .line 234
    const-wide/16 v7, 850
    invoke-static { v7, v8 }, Ljava/lang/Thread;->sleep(J)V
  .line 235
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
  .line 236
    sub-long v9, v7, v4
    const-wide/16 v11, 20000
    cmp-long v13, v9, v11
    if-ltz v13, :L5
  .line 237
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "allocs "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    iget-wide v9, p0, Lcom/innioasis/ipp/Lab$Allocs;->total:J
    const/16 v5, 10
    shr-long/2addr v9, v5
    invoke-virtual { v4, v9, v10 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " KB"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static { v0, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 238
    new-instance v4, Ljava/util/ArrayList;
    iget-object v5, p0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    invoke-virtual { v5 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v5
    invoke-direct { v4, v5 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 239
    new-instance v5, Lcom/innioasis/ipp/Lab$ByCount;
    invoke-direct { v5 }, Lcom/innioasis/ipp/Lab$ByCount;-><init>()V
    invoke-static { v4, v5 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 240
    const/4 v5, 0
  :L2
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v9
    if-ge v5, v9, :L3
    const/16 v9, 20
    if-ge v5, v9, :L3
  .line 241
    invoke-virtual { v4, v5 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Ljava/util/Map$Entry;
  .line 242
    new-instance v10, Ljava/lang/StringBuilder;
    invoke-direct { v10 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v11, "alloc "
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-interface { v9 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v11
    check-cast v11, [I
    aget v11, v11, v6
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v10
    const-string v11, " "
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-interface { v9 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v9
    invoke-virtual { v10, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v9
    invoke-virtual { v9 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v9
    invoke-static { v0, v9 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 240
    add-int/lit8 v5, v5, 1
    goto :L2
  :L3
  .line 244
    iget-object v4, p0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    invoke-virtual { v4 }, Ljava/util/HashMap;->clear()V
  .line 245
    const-wide/16 v4, 0
    iput-wide v4, p0, Lcom/innioasis/ipp/Lab$Allocs;->total:J
  :L4
  .line 246
    move-wide v4, v7
  :L5
  .line 248
    goto/16 :L1
  :L6
  .line 249
    move-exception v1
  .line 250
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "allocs failed: "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 252
    return-void
.end method

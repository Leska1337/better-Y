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
  .line 239
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 240
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    return-void
.end method

.method private static names(Ljava/nio/ByteBuffer;I)[Ljava/lang/String;
  .registers 9
  .line 321
    new-array v0, p1, [Ljava/lang/String;
  .line 322
    const/4 v1, 0
    const/4 v2, 0
  :L0
    if-ge v2, p1, :L5
  .line 323
    invoke-virtual { p0 }, Ljava/nio/ByteBuffer;->getInt()I
    move-result v3
  .line 324
    new-array v4, v3, [C
  .line 325
    const/4 v5, 0
  :L1
    if-ge v5, v3, :L2
    invoke-virtual { p0 }, Ljava/nio/ByteBuffer;->getChar()C
    move-result v6
    aput-char v6, v4, v5
    add-int/lit8 v5, v5, 1
    goto :L1
  :L2
  .line 326
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
  .line 322
    add-int/lit8 v2, v2, 1
    goto :L0
  :L5
  .line 328
    return-object v0
.end method

.method private parse([B)V
  .registers 29
  .line 277
    move-object/from16 v0, p0
    invoke-static/range { p1 .. p1 }, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;
    move-result-object v1
  .line 278
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
  .line 279
    const/4 v7, 3
    invoke-virtual { v1, v7 }, Ljava/nio/ByteBuffer;->getShort(I)S
    move-result v8
    const v9, 65535
    and-int/2addr v8, v9
    const/4 v10, 5
    invoke-virtual { v1, v10 }, Ljava/nio/ByteBuffer;->getInt(I)I
    move-result v10
  .line 280
    const/16 v11, 9
    invoke-virtual { v1, v11 }, Ljava/nio/ByteBuffer;->getShort(I)S
    move-result v11
    and-int/2addr v11, v9
    const/16 v12, 11
    invoke-virtual { v1, v12 }, Ljava/nio/ByteBuffer;->getShort(I)S
    move-result v12
    and-int/2addr v12, v9
  .line 281
    invoke-virtual { v1, v10 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 282
    invoke-static { v1, v11 }, Lcom/innioasis/ipp/Lab$Allocs;->names(Ljava/nio/ByteBuffer;I)[Ljava/lang/String;
    move-result-object v10
    invoke-static { v1, v12 }, Lcom/innioasis/ipp/Lab$Allocs;->names(Ljava/nio/ByteBuffer;I)[Ljava/lang/String;
    move-result-object v11
  .line 283
    invoke-virtual { v1, v3 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 284
    const/4 v3, 0
  :L0
    if-ge v3, v8, :L13
  .line 285
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->position()I
    move-result v12
  .line 286
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getInt()I
    move-result v13
  .line 287
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
  .line 288
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
    move-result v14
    and-int/2addr v14, v9
  .line 289
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->get()B
    move-result v15
    and-int/lit16 v15, v15, 255
  .line 290
    add-int/2addr v12, v5
    invoke-virtual { v1, v12 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 291
    nop
  .line 292
    nop
  .line 293
    new-instance v12, Ljava/lang/StringBuilder;
    invoke-direct { v12 }, Ljava/lang/StringBuilder;-><init>()V
  .line 294
    const-string v2, "?"
    move-object/from16 v16, v2
    const/4 v7, 0
    const/16 v17, 0
  :L1
    const-string v4, ""
    const-string v9, "com.innioasis."
    if-ge v7, v15, :L8
  .line 295
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->position()I
    move-result v20
  .line 296
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
    move-result v21
    const v19, 65535
    and-int v21, v21, v19
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
    move-result v22
    and-int v22, v22, v19
  .line 297
    move/from16 v23, v5
    add-int v5, v20, v6
    invoke-virtual { v1, v5 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 298
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    move-object/from16 v20, v1
    aget-object v1, v10, v21
    invoke-virtual { v5, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v5, "."
    invoke-virtual { v1, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    aget-object v5, v11, v22
    invoke-virtual { v1, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 299
    const-string v5, " < "
    move/from16 v22, v6
    invoke-virtual { v12, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    move/from16 v24, v8
    const/16 v8, 46
    invoke-virtual { v1, v8 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v25
    move-object/from16 v26, v11
    const/16 v18, 1
    add-int/lit8 v11, v25, -1
    invoke-virtual { v1, v8, v11 }, Ljava/lang/String;->lastIndexOf(II)I
    move-result v8
    add-int/lit8 v8, v8, 1
    invoke-virtual { v1, v8 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 300
    aget-object v6, v10, v21
    invoke-static { v6 }, Lcom/innioasis/ipp/Lab$Allocs;->platform(Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :L5
    move/from16 v6, v17
    const/4 v8, 3
    if-lt v6, v8, :L2
    move-object/from16 v8, v16
    goto :L6
  :L2
  .line 302
    if-nez v6, :L3
    goto :L4
  :L3
    new-instance v11, Ljava/lang/StringBuilder;
    invoke-direct { v11 }, Ljava/lang/StringBuilder;-><init>()V
    move-object/from16 v8, v16
    invoke-virtual { v11, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v1, v9, v4 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v5, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  :L4
    move-object/from16 v16, v1
  .line 303
    add-int/lit8 v17, v6, 1
    goto :L7
  :L5
  .line 300
    move-object/from16 v8, v16
    move/from16 v6, v17
  :L6
  .line 294
    move/from16 v17, v6
    move-object/from16 v16, v8
  :L7
    add-int/lit8 v7, v7, 1
    move-object/from16 v1, v20
    move/from16 v6, v22
    move/from16 v5, v23
    move/from16 v8, v24
    move-object/from16 v11, v26
    const/4 v4, 1
    const v9, 65535
    goto/16 :L1
  :L8
  .line 306
    move-object/from16 v20, v1
    move/from16 v23, v5
    move/from16 v22, v6
    move/from16 v24, v8
    move-object/from16 v26, v11
    move-object/from16 v8, v16
    const/16 v18, 1
    const v19, 65535
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    aget-object v5, v10, v14
    invoke-virtual { v1, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v5, " @ "
    invoke-virtual { v1, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v2, v8 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L9
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    goto :L10
  :L9
    invoke-virtual { v8, v9, v4 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v2
  :L10
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 307
    iget-object v2, v0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    invoke-virtual { v2, v1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [I
  .line 308
    if-nez v2, :L11
    iget-object v2, v0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    filled-new-array { v13 }, [I
    move-result-object v4
    invoke-virtual { v2, v1, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const/4 v1, 0
    goto :L12
  :L11
  .line 309
    const/4 v1, 0
    aget v4, v2, v1
    add-int/2addr v4, v13
    aput v4, v2, v1
  :L12
  .line 310
    iget-wide v4, v0, Lcom/innioasis/ipp/Lab$Allocs;->total:J
    int-to-long v6, v13
    add-long/2addr v4, v6
    iput-wide v4, v0, Lcom/innioasis/ipp/Lab$Allocs;->total:J
  .line 284
    add-int/lit8 v3, v3, 1
    move-object/from16 v1, v20
    move/from16 v6, v22
    move/from16 v5, v23
    move/from16 v8, v24
    move-object/from16 v11, v26
    const/4 v2, 0
    const/4 v4, 1
    const/4 v7, 3
    const v9, 65535
    goto/16 :L0
  :L13
  .line 312
    return-void
.end method

.method private static platform(Ljava/lang/String;)Z
  .registers 2
  .line 315
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
  .line 316
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
  .line 317
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
  .line 315
    return p0
.end method

.method public run()V
  .catchall { :L0 .. :L4 } :L6
  .registers 15
  .line 245
    const-string v0, "ipplab"
  :L0
    const-string v1, "org.apache.harmony.dalvik.ddmc.DdmVmInternal"
    invoke-static { v1 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v1
  .line 246
    const-string v2, "enableRecentAllocations"
    const/4 v3, 1
    new-array v4, v3, [Ljava/lang/Class;
    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;
    const/4 v6, 0
    aput-object v5, v4, v6
    invoke-virtual { v1, v2, v4 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v2
  .line 247
    const-string v4, "getRecentAllocations"
    new-array v5, v6, [Ljava/lang/Class;
    invoke-virtual { v1, v4, v5 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v1
  .line 248
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L1
  .line 251
    new-array v7, v3, [Ljava/lang/Object;
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    aput-object v8, v7, v6
    const/4 v8, 0
    invoke-virtual { v2, v8, v7 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  .line 252
    const-wide/16 v9, 150
    invoke-static { v9, v10 }, Ljava/lang/Thread;->sleep(J)V
  .line 253
    new-array v7, v6, [Ljava/lang/Object;
    invoke-virtual { v1, v8, v7 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, [B
  .line 254
    new-array v9, v3, [Ljava/lang/Object;
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    aput-object v10, v9, v6
    invoke-virtual { v2, v8, v9 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  .line 255
    invoke-direct { p0, v7 }, Lcom/innioasis/ipp/Lab$Allocs;->parse([B)V
  .line 256
    const-wide/16 v7, 850
    invoke-static { v7, v8 }, Ljava/lang/Thread;->sleep(J)V
  .line 257
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
  .line 258
    sub-long v9, v7, v4
    const-wide/16 v11, 20000
    cmp-long v13, v9, v11
    if-ltz v13, :L5
  .line 259
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
  .line 260
    new-instance v4, Ljava/util/ArrayList;
    iget-object v5, p0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    invoke-virtual { v5 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v5
    invoke-direct { v4, v5 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 261
    new-instance v5, Lcom/innioasis/ipp/Lab$ByCount;
    invoke-direct { v5 }, Lcom/innioasis/ipp/Lab$ByCount;-><init>()V
    invoke-static { v4, v5 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 262
    const/4 v5, 0
  :L2
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v9
    if-ge v5, v9, :L3
    const/16 v9, 20
    if-ge v5, v9, :L3
  .line 263
    invoke-virtual { v4, v5 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Ljava/util/Map$Entry;
  .line 264
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
  .line 262
    add-int/lit8 v5, v5, 1
    goto :L2
  :L3
  .line 266
    iget-object v4, p0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    invoke-virtual { v4 }, Ljava/util/HashMap;->clear()V
  .line 267
    const-wide/16 v4, 0
    iput-wide v4, p0, Lcom/innioasis/ipp/Lab$Allocs;->total:J
  :L4
  .line 268
    move-wide v4, v7
  :L5
  .line 270
    goto/16 :L1
  :L6
  .line 271
    move-exception v1
  .line 272
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
  .line 274
    return-void
.end method

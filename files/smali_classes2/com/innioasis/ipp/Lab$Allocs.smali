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
  .line 80
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 81
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    return-void
.end method

.method private static names(Ljava/nio/ByteBuffer;I)[Ljava/lang/String;
  .registers 9
  .line 151
    new-array v0, p1, [Ljava/lang/String;
  .line 152
    const/4 v1, 0
    const/4 v2, 0
  :L0
    if-ge v2, p1, :L5
  .line 153
    invoke-virtual { p0 }, Ljava/nio/ByteBuffer;->getInt()I
    move-result v3
  .line 154
    new-array v4, v3, [C
  .line 155
    const/4 v5, 0
  :L1
    if-ge v5, v3, :L2
    invoke-virtual { p0 }, Ljava/nio/ByteBuffer;->getChar()C
    move-result v6
    aput-char v6, v4, v5
    add-int/lit8 v5, v5, 1
    goto :L1
  :L2
  .line 156
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
  .line 152
    add-int/lit8 v2, v2, 1
    goto :L0
  :L5
  .line 158
    return-object v0
.end method

.method private parse([B)V
  .registers 21
  .line 112
    move-object/from16 v0, p0
    invoke-static/range { p1 .. p1 }, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;
    move-result-object v1
  .line 113
    const/4 v2, 0
    invoke-virtual { v1, v2 }, Ljava/nio/ByteBuffer;->get(I)B
    move-result v3
    and-int/lit16 v3, v3, 255
    const/4 v4, 1
    invoke-virtual { v1, v4 }, Ljava/nio/ByteBuffer;->get(I)B
    move-result v4
    and-int/lit16 v4, v4, 255
    const/4 v5, 2
    invoke-virtual { v1, v5 }, Ljava/nio/ByteBuffer;->get(I)B
    move-result v5
    and-int/lit16 v5, v5, 255
  .line 114
    const/4 v6, 3
    invoke-virtual { v1, v6 }, Ljava/nio/ByteBuffer;->getShort(I)S
    move-result v6
    const v7, 65535
    and-int/2addr v6, v7
    const/4 v8, 5
    invoke-virtual { v1, v8 }, Ljava/nio/ByteBuffer;->getInt(I)I
    move-result v8
  .line 115
    const/16 v9, 9
    invoke-virtual { v1, v9 }, Ljava/nio/ByteBuffer;->getShort(I)S
    move-result v9
    and-int/2addr v9, v7
    const/16 v10, 11
    invoke-virtual { v1, v10 }, Ljava/nio/ByteBuffer;->getShort(I)S
    move-result v10
    and-int/2addr v10, v7
  .line 116
    invoke-virtual { v1, v8 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 117
    invoke-static { v1, v9 }, Lcom/innioasis/ipp/Lab$Allocs;->names(Ljava/nio/ByteBuffer;I)[Ljava/lang/String;
    move-result-object v8
    invoke-static { v1, v10 }, Lcom/innioasis/ipp/Lab$Allocs;->names(Ljava/nio/ByteBuffer;I)[Ljava/lang/String;
    move-result-object v9
  .line 118
    invoke-virtual { v1, v3 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 119
    const/4 v3, 0
  :L0
    if-ge v3, v6, :L8
  .line 120
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->position()I
    move-result v10
  .line 121
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getInt()I
    move-result v11
  .line 122
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
  .line 123
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
    move-result v12
    and-int/2addr v12, v7
  .line 124
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->get()B
    move-result v13
    and-int/lit16 v13, v13, 255
  .line 125
    add-int/2addr v10, v4
    invoke-virtual { v1, v10 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 126
    nop
  .line 127
    const-string v10, "?"
    const/4 v14, 0
    move-object v2, v10
    const/4 v15, 0
  :L1
    if-ge v15, v13, :L4
  .line 128
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->position()I
    move-result v16
  .line 129
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
    move-result v17
    and-int v17, v17, v7
    invoke-virtual { v1 }, Ljava/nio/ByteBuffer;->getShort()S
    move-result v18
    and-int v18, v18, v7
  .line 130
    add-int v7, v16, v5
    invoke-virtual { v1, v7 }, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
  .line 131
    new-instance v7, Ljava/lang/StringBuilder;
    invoke-direct { v7 }, Ljava/lang/StringBuilder;-><init>()V
    move-object/from16 v16, v1
    aget-object v1, v8, v17
    invoke-virtual { v7, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v7, "."
    invoke-virtual { v1, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    aget-object v7, v9, v18
    invoke-virtual { v1, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 132
    if-nez v14, :L2
    move-object v14, v1
  :L2
  .line 133
    invoke-virtual { v10, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :L3
    aget-object v7, v8, v17
    invoke-static { v7 }, Lcom/innioasis/ipp/Lab$Allocs;->platform(Ljava/lang/String;)Z
    move-result v7
    if-nez v7, :L3
    move-object v2, v1
  :L3
  .line 127
    add-int/lit8 v15, v15, 1
    move-object/from16 v1, v16
    const v7, 65535
    goto :L1
  :L4
  .line 135
    move-object/from16 v16, v1
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    aget-object v7, v8, v12
    invoke-virtual { v1, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v7, " @ "
    invoke-virtual { v1, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v7, "com.innioasis."
    const-string v12, ""
    invoke-virtual { v2, v7, v12 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v1, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 136
    invoke-virtual { v10, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L5
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, " top "
    invoke-virtual { v2, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v14 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v12
  :L5
    invoke-virtual { v1, v12 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 137
    iget-object v2, v0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    invoke-virtual { v2, v1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [I
  .line 138
    if-nez v2, :L6
    iget-object v2, v0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    filled-new-array { v11 }, [I
    move-result-object v7
    invoke-virtual { v2, v1, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const/4 v1, 0
    goto :L7
  :L6
  .line 139
    const/4 v1, 0
    aget v7, v2, v1
    add-int/2addr v7, v11
    aput v7, v2, v1
  :L7
  .line 140
    iget-wide v12, v0, Lcom/innioasis/ipp/Lab$Allocs;->total:J
    int-to-long v10, v11
    add-long/2addr v12, v10
    iput-wide v12, v0, Lcom/innioasis/ipp/Lab$Allocs;->total:J
  .line 119
    add-int/lit8 v3, v3, 1
    move-object/from16 v1, v16
    const/4 v2, 0
    const v7, 65535
    goto/16 :L0
  :L8
  .line 142
    return-void
.end method

.method private static platform(Ljava/lang/String;)Z
  .registers 2
  .line 145
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
  .line 146
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
  .line 147
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
  .line 145
    return p0
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L4
  .registers 15
  .line 86
    const-string v0, "ipplab"
  :L0
    const-string v1, "org.apache.harmony.dalvik.ddmc.DdmVmInternal"
    invoke-static { v1 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v1
  .line 87
    const-string v2, "enableRecentAllocations"
    const/4 v3, 1
    new-array v4, v3, [Ljava/lang/Class;
    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;
    const/4 v6, 0
    aput-object v5, v4, v6
    invoke-virtual { v1, v2, v4 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v2
  .line 88
    const-string v4, "getRecentAllocations"
    new-array v5, v6, [Ljava/lang/Class;
    invoke-virtual { v1, v4, v5 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v1
  .line 89
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L1
  .line 92
    new-array v7, v3, [Ljava/lang/Object;
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    aput-object v8, v7, v6
    const/4 v8, 0
    invoke-virtual { v2, v8, v7 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  .line 93
    const-wide/16 v9, 150
    invoke-static { v9, v10 }, Ljava/lang/Thread;->sleep(J)V
  .line 94
    new-array v7, v6, [Ljava/lang/Object;
    invoke-virtual { v1, v8, v7 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, [B
  .line 95
    new-array v9, v3, [Ljava/lang/Object;
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    aput-object v10, v9, v6
    invoke-virtual { v2, v8, v9 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  .line 96
    invoke-direct { p0, v7 }, Lcom/innioasis/ipp/Lab$Allocs;->parse([B)V
  .line 97
    const-wide/16 v7, 850
    invoke-static { v7, v8 }, Ljava/lang/Thread;->sleep(J)V
  .line 98
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
  .line 99
    sub-long v9, v7, v4
    const-wide/16 v11, 20000
    cmp-long v13, v9, v11
    if-ltz v13, :L3
  .line 100
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
    const-string v5, " KB: "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    iget-object v5, p0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    const/16 v9, 15
    invoke-static { v5, v9 }, Lcom/innioasis/ipp/Lab$Stacks;->access$000(Ljava/util/HashMap;I)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static { v0, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 101
    iget-object v4, p0, Lcom/innioasis/ipp/Lab$Allocs;->bytes:Ljava/util/HashMap;
    invoke-virtual { v4 }, Ljava/util/HashMap;->clear()V
  .line 102
    const-wide/16 v4, 0
    iput-wide v4, p0, Lcom/innioasis/ipp/Lab$Allocs;->total:J
  :L2
  .line 103
    move-wide v4, v7
  :L3
  .line 105
    goto :L1
  :L4
  .line 106
    move-exception v1
  .line 107
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
  .line 109
    return-void
.end method

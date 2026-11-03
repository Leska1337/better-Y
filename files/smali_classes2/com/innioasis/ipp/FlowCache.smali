.class public final Lcom/innioasis/ipp/FlowCache;
.super Ljava/lang/Object;
.source "FlowCache.java"

.field private final static QUALITY:I = 90

.field private final static SUFFIX:Ljava/lang/String; = "-180.jpg"

.field private static byFolder:Ljava/util/HashMap;

.field private static holder:Ljava/lang/Thread;

.method private constructor <init>()V
  .registers 1
  .line 19
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static beginForget()V
  .catchall { :L0 .. :L8 } :L9
  .registers 6
  :L0
  .line 108
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object v0
  .line 109
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Ljava/io/File;->list()[Ljava/lang/String;
    move-result-object v0
  :L2
  .line 110
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 111
    const/4 v2, 0
    const/4 v3, 0
  :L3
    if-eqz v0, :L7
    array-length v4, v0
    if-ge v3, v4, :L7
  .line 112
    aget-object v4, v0, v3
    const/16 v5, 45
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 113
    if-gtz v4, :L4
    goto :L6
  :L4
  .line 114
    aget-object v5, v0, v3
    invoke-virtual { v5, v2, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
  .line 115
    invoke-virtual { v1, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/ArrayList;
  .line 116
    if-nez v5, :L5
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
    invoke-virtual { v1, v4, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 117
    aget-object v4, v0, v3
    invoke-virtual { v5, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 111
    add-int/lit8 v3, v3, 1
    goto :L3
  :L7
  .line 119
    sput-object v1, Lcom/innioasis/ipp/FlowCache;->byFolder:Ljava/util/HashMap;
  .line 120
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/FlowCache;->holder:Ljava/lang/Thread;
  :L8
  .line 122
    goto :L10
  :L9
  .line 121
    move-exception v0
  :L10
  .line 123
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L5 } :L7
  .registers 3
  :L0
  .line 133
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object v0
  .line 134
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  :L2
  .line 135
    if-nez v0, :L3
    return-void
  :L3
  .line 136
    const/4 v1, 0
  :L4
    array-length v2, v0
    if-ge v1, v2, :L6
    aget-object v2, v0, v1
    invoke-virtual { v2 }, Ljava/io/File;->delete()Z
  :L5
    add-int/lit8 v1, v1, 1
    goto :L4
  :L6
  .line 138
    goto :L8
  :L7
  .line 137
    move-exception v0
  :L8
  .line 139
    return-void
.end method

.method static dir()Ljava/io/File;
  .registers 3
  .line 30
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 31
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L1
  .line 32
    if-nez v0, :L2
    return-object v1
  :L2
  .line 33
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_flow"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 34
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L3
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L3
  .line 35
    return-object v1
.end method

.method public static endForget()V
  .registers 2
  .line 126
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/FlowCache;->holder:Ljava/lang/Thread;
    if-eq v0, v1, :L0
    return-void
  :L0
  .line 127
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/FlowCache;->holder:Ljava/lang/Thread;
  .line 128
    sput-object v0, Lcom/innioasis/ipp/FlowCache;->byFolder:Ljava/util/HashMap;
  .line 129
    return-void
.end method

.method public static file(Ljava/lang/String;)Ljava/io/File;
  .registers 4
  .line 40
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object v1
  :L1
  .line 41
    if-nez v1, :L2
    return-object v0
  :L2
  .line 42
    new-instance v0, Ljava/io/File;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/FlowCache;->name(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-direct { v0, v1, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method public static forget(Ljava/lang/String;)V
  .catchall { :L0 .. :L10 } :L12
  .registers 7
  .line 79
    const-string v0, "-"
    if-nez p0, :L0
    return-void
  :L0
  .line 81
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object v1
  .line 82
    if-nez v1, :L1
    return-void
  :L1
  .line 83
    new-instance v2, Ljava/io/File;
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/FlowCache;->hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, "-180.jpg"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-direct { v2, v1, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v2 }, Ljava/io/File;->delete()Z
  .line 84
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 85
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v2
    sget-object v3, Lcom/innioasis/ipp/FlowCache;->holder:Ljava/lang/Thread;
    if-ne v2, v3, :L2
    sget-object v2, Lcom/innioasis/ipp/FlowCache;->byFolder:Ljava/util/HashMap;
    goto :L3
  :L2
    const/4 v2, 0
  :L3
  .line 86
    const/4 v3, 0
    if-eqz v2, :L7
  .line 87
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/util/ArrayList;
  .line 88
    if-nez p0, :L4
    return-void
  :L4
  .line 89
    nop
  :L5
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    if-ge v3, v0, :L6
    new-instance v0, Ljava/io/File;
    invoke-virtual { p0, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
    add-int/lit8 v3, v3, 1
    goto :L5
  :L6
  .line 90
    return-void
  :L7
  .line 92
    invoke-virtual { v1 }, Ljava/io/File;->list()[Ljava/lang/String;
    move-result-object v2
  .line 93
    if-nez v2, :L8
    return-void
  :L8
  .line 94
    nop
  :L9
    array-length v4, v2
    if-ge v3, v4, :L11
  .line 95
    aget-object v4, v2, v3
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v5, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L10
    new-instance v4, Ljava/io/File;
    aget-object v5, v2, v3
    invoke-direct { v4, v1, v5 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L10
  .line 94
    add-int/lit8 v3, v3, 1
    goto :L9
  :L11
  .line 98
    goto :L13
  :L12
  .line 97
    move-exception p0
  :L13
  .line 99
    return-void
.end method

.method private static hex(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 26
    invoke-virtual { p0 }, Ljava/lang/String;->hashCode()I
    move-result p0
    invoke-static { p0 }, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static name(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 47
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, "-"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowCache;->hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, "-180.jpg"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static prune(Lcom/innioasis/ipp/Stale$Keys;Z)J
  .registers 5
  .line 52
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object v0
    const-string v1, "-180.jpg"
    const/4 v2, 1
    invoke-static { v0, p0, v1, v2, p1 }, Lcom/innioasis/ipp/Stale;->files(Ljava/io/File;Lcom/innioasis/ipp/Stale$Keys;Ljava/lang/String;ZZ)J
    move-result-wide p0
    return-wide p0
.end method

.method static write(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
  .catchall { :L1 .. :L2 } :L12
  .catchall { :L2 .. :L3 } :L11
  .catchall { :L4 .. :L5 } :L12
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L13 .. :L14 } :L19
  .catchall { :L15 .. :L16 } :L17
  .catchall { :L20 .. :L21 } :L22
  .registers 7
  .line 57
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 58
    const/4 v0, 0
    if-eqz p0, :L24
    if-nez p1, :L0
    goto :L24
  :L0
  .line 59
    nop
  .line 61
    const/4 v1, 0
  :L1
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L2
  .line 62
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    const/16 v4, 90
    invoke-virtual { p1, v3, v4, v2 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    move-result p1
    if-nez p1, :L6
  .line 63
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  :L3
  .line 64
    nop
  :L4
  .line 65
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L5
  .line 66
    nop
  .line 73
    nop
  .line 66
    return v0
  :L6
  .line 68
    nop
  :L7
  .line 73
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  :L8
    goto :L10
  :L9
    move-exception p0
  :L10
  .line 68
    const/4 p0, 1
    return p0
  :L11
  .line 69
    move-exception p1
    move-object v1, v2
    goto :L13
  :L12
    move-exception p1
  :L13
  .line 70
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L14
  .line 71
    nop
  .line 73
    if-eqz v1, :L18
  :L15
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L16
    goto :L18
  :L17
    move-exception p0
  :L18
  .line 71
    return v0
  :L19
  .line 73
    move-exception p0
    if-eqz v1, :L23
  :L20
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L21
    goto :L23
  :L22
    move-exception p1
  :L23
  .line 74
    throw p0
  :L24
  .line 58
    return v0
.end method

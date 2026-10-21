.class public final Lcom/innioasis/ipp/FlowCache;
.super Ljava/lang/Object;
.source "FlowCache.java"

.field private final static QUALITY:I = 90

.field private final static SUFFIX:Ljava/lang/String; = "-180.jpg"

.method private constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L5 } :L7
  .registers 3
  :L0
  .line 100
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object v0
  .line 101
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  :L2
  .line 102
    if-nez v0, :L3
    return-void
  :L3
  .line 103
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
  .line 105
    goto :L8
  :L7
  .line 104
    move-exception v0
  :L8
  .line 106
    return-void
.end method

.method static dir()Ljava/io/File;
  .registers 3
  .line 33
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 34
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L1
  .line 35
    if-nez v0, :L2
    return-object v1
  :L2
  .line 36
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_flow"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 37
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L3
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L3
  .line 38
    return-object v1
.end method

.method public static file(Ljava/lang/String;)Ljava/io/File;
  .registers 5
  .line 43
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object v1
  :L1
  .line 44
    if-nez v1, :L2
    return-object v0
  :L2
  .line 45
    new-instance v0, Ljava/io/File;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/FlowCache;->hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "-"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, "-180.jpg"
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-direct { v0, v1, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method public static forget(Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 6
  .line 83
    const-string v0, "-"
    if-nez p0, :L0
    return-void
  :L0
  .line 85
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object v1
  .line 86
    if-nez v1, :L1
    return-void
  :L1
  .line 87
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
  .line 88
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  .line 89
    invoke-virtual { v1 }, Ljava/io/File;->list()[Ljava/lang/String;
    move-result-object v0
  .line 90
    if-nez v0, :L2
    return-void
  :L2
  .line 91
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L5
  .line 92
    aget-object v3, v0, v2
    invoke-virtual { v3, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L4
    new-instance v3, Ljava/io/File;
    aget-object v4, v0, v2
    invoke-direct { v3, v1, v4 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  :L4
  .line 91
    add-int/lit8 v2, v2, 1
    goto :L3
  :L5
  .line 95
    goto :L7
  :L6
  .line 94
    move-exception p0
  :L7
  .line 96
    return-void
.end method

.method private static hex(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 29
    invoke-virtual { p0 }, Ljava/lang/String;->hashCode()I
    move-result p0
    invoke-static { p0 }, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static prune(Ljava/util/Set;Z)J
  .registers 6
  .line 50
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 51
    invoke-interface { p0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L0
  .line 52
    invoke-interface { p0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L1
  .line 53
    invoke-interface { p0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 54
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/FlowCache;->hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "-"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-static { v1 }, Lcom/innioasis/ipp/FlowCache;->hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "-180.jpg"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 55
    goto :L0
  :L1
  .line 56
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object p0
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Stale;->files(Ljava/io/File;Ljava/util/Set;Z)J
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
  .line 61
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 62
    const/4 v0, 0
    if-eqz p0, :L24
    if-nez p1, :L0
    goto :L24
  :L0
  .line 63
    nop
  .line 65
    const/4 v1, 0
  :L1
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L2
  .line 66
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    const/16 v4, 90
    invoke-virtual { p1, v3, v4, v2 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    move-result p1
    if-nez p1, :L6
  .line 67
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  :L3
  .line 68
    nop
  :L4
  .line 69
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L5
  .line 70
    nop
  .line 77
    nop
  .line 70
    return v0
  :L6
  .line 72
    nop
  :L7
  .line 77
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  :L8
    goto :L10
  :L9
    move-exception p0
  :L10
  .line 72
    const/4 p0, 1
    return p0
  :L11
  .line 73
    move-exception p1
    move-object v1, v2
    goto :L13
  :L12
    move-exception p1
  :L13
  .line 74
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L14
  .line 75
    nop
  .line 77
    if-eqz v1, :L18
  :L15
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L16
    goto :L18
  :L17
    move-exception p0
  :L18
  .line 75
    return v0
  :L19
  .line 77
    move-exception p0
    if-eqz v1, :L23
  :L20
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L21
    goto :L23
  :L22
    move-exception p1
  :L23
  .line 78
    throw p0
  :L24
  .line 62
    return v0
.end method

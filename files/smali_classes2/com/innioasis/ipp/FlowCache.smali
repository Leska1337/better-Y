.class public final Lcom/innioasis/ipp/FlowCache;
.super Ljava/lang/Object;
.source "FlowCache.java"

.field private final static QUALITY:I = 90

.field private final static SUFFIX:Ljava/lang/String; = "-180.jpg"

.method private constructor <init>()V
  .registers 1
  .line 19
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L5 } :L7
  .registers 3
  :L0
  .line 83
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object v0
  .line 84
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  :L2
  .line 85
    if-nez v0, :L3
    return-void
  :L3
  .line 86
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
  .line 88
    goto :L8
  :L7
  .line 87
    move-exception v0
  :L8
  .line 89
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

.method public static file(Ljava/lang/String;)Ljava/io/File;
  .registers 5
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
  .line 66
    const-string v0, "-"
    if-nez p0, :L0
    return-void
  :L0
  .line 68
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->dir()Ljava/io/File;
    move-result-object v1
  .line 69
    if-nez v1, :L1
    return-void
  :L1
  .line 70
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
  .line 71
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
  .line 72
    invoke-virtual { v1 }, Ljava/io/File;->list()[Ljava/lang/String;
    move-result-object v0
  .line 73
    if-nez v0, :L2
    return-void
  :L2
  .line 74
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L5
  .line 75
    aget-object v3, v0, v2
    invoke-virtual { v3, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L4
    new-instance v3, Ljava/io/File;
    aget-object v4, v0, v2
    invoke-direct { v3, v1, v4 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  :L4
  .line 74
    add-int/lit8 v2, v2, 1
    goto :L3
  :L5
  .line 78
    goto :L7
  :L6
  .line 77
    move-exception p0
  :L7
  .line 79
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

.method static write(Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .catchall { :L1 .. :L2 } :L11
  .catchall { :L2 .. :L3 } :L10
  .catchall { :L4 .. :L5 } :L11
  .catchall { :L8 .. :L9 } :L16
  .catchall { :L12 .. :L13 } :L18
  .catchall { :L14 .. :L15 } :L16
  .catchall { :L19 .. :L20 } :L21
  .registers 6
  .line 47
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 48
    if-eqz p0, :L23
    if-nez p1, :L0
    goto :L23
  :L0
  .line 49
    nop
  .line 51
    const/4 v0, 0
  :L1
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L2
  .line 52
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    const/16 v3, 90
    invoke-virtual { p1, v2, v3, v1 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    move-result p1
    if-nez p1, :L6
  .line 53
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L3
  .line 54
    nop
  :L4
  .line 55
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L5
    goto :L7
  :L6
  .line 52
    move-object v0, v1
  :L7
  .line 60
    if-eqz v0, :L17
  :L8
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L9
    goto :L17
  :L10
  .line 57
    move-exception p1
    move-object v0, v1
    goto :L12
  :L11
    move-exception p1
  :L12
  .line 58
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L13
  .line 60
    if-eqz v0, :L17
  :L14
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L15
    goto :L17
  :L16
    move-exception p0
  .line 61
    nop
  :L17
  .line 62
    return-void
  :L18
  .line 60
    move-exception p0
    if-eqz v0, :L22
  :L19
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L20
    goto :L22
  :L21
    move-exception p1
  :L22
  .line 61
    throw p0
  :L23
  .line 48
    return-void
.end method

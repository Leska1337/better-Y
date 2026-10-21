.class public final Lcom/innioasis/ipp/CoverCache;
.super Ljava/lang/Object;
.source "CoverCache.java"

.field private final static mem:Ljava/util/Hashtable;

.field private final static miss:Ljava/util/Hashtable;

.field private static swept:Z

.method static constructor <clinit>()V
  .registers 1
  .line 24
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
  .line 25
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 188
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 189
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  :L0
  .line 191
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->dir()Ljava/io/File;
    move-result-object v0
  .line 192
    if-eqz v0, :L3
  .line 193
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 194
    if-eqz v1, :L3
  .line 195
    const/4 v2, 0
  :L1
    array-length v3, v1
    if-ge v2, v3, :L2
  .line 196
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  .line 195
    add-int/lit8 v2, v2, 1
    goto :L1
  :L2
  .line 198
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L3
  .line 202
    goto :L5
  :L4
  .line 201
    move-exception v0
  :L5
  .line 203
    return-void
.end method

.method public static clearMiss()V
  .registers 1
  .line 184
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 185
    return-void
.end method

.method private static dir()Ljava/io/File;
  .catchall { :L3 .. :L5 } :L7
  .registers 5
  .line 37
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 38
    const/4 v1, 0
    if-nez v0, :L0
  .line 39
    return-object v1
  :L0
  .line 41
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 42
    if-nez v0, :L1
  .line 43
    return-object v1
  :L1
  .line 45
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_covers"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 46
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L2
  .line 47
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L2
  .line 49
    sget-boolean v0, Lcom/innioasis/ipp/CoverCache;->swept:Z
    if-nez v0, :L8
  .line 50
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/CoverCache;->swept:Z
  :L3
  .line 52
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 53
    if-eqz v0, :L6
  .line 54
    const/4 v2, 0
  :L4
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 55
    aget-object v3, v0, v2
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    const-string v4, "-50q.jpg"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L5
  .line 56
    aget-object v3, v0, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  :L5
  .line 54
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 61
    goto :L8
  :L7
  .line 60
    move-exception v0
  :L8
  .line 63
    return-object v1
.end method

.method private static file(Ljava/lang/String;)Ljava/io/File;
  .registers 3
  .line 68
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->dir()Ljava/io/File;
    move-result-object v0
  .line 69
    if-nez v0, :L0
  .line 70
    const/4 p0, 0
    return-object p0
  :L0
  .line 72
    new-instance v1, Ljava/io/File;
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->name(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-direct { v1, v0, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method public static forget(Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 2
  .line 168
    if-nez p0, :L0
  .line 169
    return-void
  :L0
  .line 171
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 172
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 174
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 175
    if-eqz p0, :L2
  .line 176
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L2
  .line 179
    goto :L4
  :L3
  .line 178
    move-exception p0
  :L4
  .line 180
    return-void
.end method

.method public static get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L4 .. :L7 } :L8
  .registers 5
  .line 128
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 129
    const/4 v0, 0
    if-nez p0, :L0
  .line 130
    return-object v0
  :L0
  .line 132
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 133
    if-eqz v1, :L1
  .line 134
    return-object v1
  :L1
  .line 136
    sget-object v2, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v2, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
  .line 137
    return-object v0
  :L2
  .line 139
    if-nez p1, :L3
  .line 140
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/CoverCache;->remember(Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .line 141
    return-object v0
  :L3
  .line 145
    const/16 v0, 50
  :L4
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Art;->thumb(Ljava/lang/String;Ljava/lang/String;I)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 146
    if-eqz p1, :L7
  .line 147
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 148
    if-nez v0, :L5
  .line 149
    move-object v1, p1
    goto :L6
  :L5
  .line 148
    move-object v1, v0
  :L6
  .line 151
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p1
  .line 152
    if-eqz p1, :L7
  .line 153
    new-instance v0, Ljava/io/FileOutputStream;
    invoke-direct { v0, p1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 156
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    const/16 v2, 85
    invoke-virtual { v1, p1, v2, v0 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
  .line 157
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L7
  .line 161
    goto :L9
  :L8
  .line 160
    move-exception p1
  :L9
  .line 162
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/CoverCache;->remember(Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .line 163
    return-object v1
.end method

.method static memBytes()J
  .registers 2
  .line 29
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
    invoke-virtual { v1 }, Ljava/util/Hashtable;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->bitmapBytes(Ljava/util/Collection;)J
    move-result-wide v0
    return-wide v0
.end method

.method private static name(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 76
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p0 }, Ljava/lang/String;->hashCode()I
    move-result v1
    invoke-static { v1 }, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "-"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, "-50q.jpg"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  .line 100
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 101
    const/4 v0, 0
    if-nez p0, :L0
  .line 102
    return-object v0
  :L0
  .line 104
    sget-object v1, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/graphics/Bitmap;
  .line 105
    if-eqz v1, :L1
  .line 106
    return-object v1
  :L1
  .line 108
    sget-object v1, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
  .line 109
    return-object v0
  :L2
  .line 111
    nop
  :L3
  .line 113
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 114
    if-eqz v1, :L4
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 115
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L4
  .line 119
    goto :L6
  :L5
  .line 117
    move-exception v1
  .line 118
    nop
  :L6
  .line 120
    if-eqz v0, :L7
  .line 121
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/CoverCache;->remember(Ljava/lang/String;Landroid/graphics/Bitmap;)V
  :L7
  .line 123
    return-object v0
.end method

.method static prune(Ljava/util/Set;Z)J
  .registers 4
  .line 81
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 82
    invoke-interface { p0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L0
  .line 83
    invoke-interface { p0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L1
    invoke-interface { p0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
    invoke-static { v1 }, Lcom/innioasis/ipp/CoverCache;->name(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    goto :L0
  :L1
  .line 84
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->dir()Ljava/io/File;
    move-result-object p0
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Stale;->files(Ljava/io/File;Ljava/util/Set;Z)J
    move-result-wide p0
    return-wide p0
.end method

.method private static remember(Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .registers 3
  .line 88
    if-nez p1, :L0
  .line 89
    sget-object p1, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { p1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L1
  :L0
  .line 91
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0, p0, p1 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 93
    return-void
.end method

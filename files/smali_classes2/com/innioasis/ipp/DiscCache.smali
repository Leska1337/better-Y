.class public final Lcom/innioasis/ipp/DiscCache;
.super Ljava/lang/Object;
.source "DiscCache.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/DiscCache$Tags;
  }
.end annotation

.field private final static NO_TRACK:Ljava/lang/String; = "2147483647"

.field private final static SEP:C = '\t'

.field private final static VER:Ljava/lang/String; = "#v2"

.field private static dirty:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 39
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/DiscCache;->map:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 37
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 246
    sget-object v0, Lcom/innioasis/ipp/DiscCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 247
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/DiscCache;->loaded:Z
  .line 248
    sput-boolean v0, Lcom/innioasis/ipp/DiscCache;->dirty:Z
  :L0
  .line 250
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->file()Ljava/io/File;
    move-result-object v0
  .line 251
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 254
    goto :L3
  :L2
  .line 252
    move-exception v0
  :L3
  .line 255
    return-void
.end method

.method public static commit(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .registers 3
  .line 175
    if-eqz p0, :L4
    if-eqz p1, :L4
    iget-boolean v0, p1, Lcom/innioasis/ipp/DiscCache$Tags;->wanted:Z
    if-nez v0, :L0
    goto :L4
  :L0
  .line 176
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->load()V
  .line 179
    iget-object v0, p1, Lcom/innioasis/ipp/DiscCache$Tags;->track:Ljava/lang/String;
    if-eqz v0, :L1
    iget-object v0, p1, Lcom/innioasis/ipp/DiscCache$Tags;->track:Ljava/lang/String;
    goto :L2
  :L1
    const-string v0, "2147483647"
  :L2
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/TrackCache;->put(Ljava/lang/String;Ljava/lang/String;)V
  .line 180
    iget v0, p1, Lcom/innioasis/ipp/DiscCache$Tags;->disc:I
  .line 181
    if-nez v0, :L3
    iget-object p1, p1, Lcom/innioasis/ipp/DiscCache$Tags;->track:Ljava/lang/String;
    invoke-static { p1 }, Lcom/innioasis/ipp/DiscCache;->sideOf(Ljava/lang/String;)I
    move-result v0
  :L3
  .line 182
    sget-object p1, Lcom/innioasis/ipp/DiscCache;->map:Ljava/util/HashMap;
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    invoke-virtual { p1, p0, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 183
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/DiscCache;->dirty:Z
  .line 184
    return-void
  :L4
  .line 175
    return-void
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 54
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 55
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 56
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 57
    if-nez v0, :L1
    goto :L2
  :L1
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_discs.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
.end method

.method public static flush()V
  .registers 0
  .line 235
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->save()V
  .line 236
    return-void
.end method

.method public static forget(Ljava/lang/String;)V
  .registers 2
  .line 240
    if-nez p0, :L0
    return-void
  :L0
  .line 241
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->load()V
  .line 242
    sget-object v0, Lcom/innioasis/ipp/DiscCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-eqz p0, :L1
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/DiscCache;->dirty:Z
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->save()V
  :L1
  .line 243
    return-void
.end method

.method public static get(Ljava/lang/String;)I
  .registers 3
  .line 122
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 123
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->load()V
  .line 124
    sget-object v1, Lcom/innioasis/ipp/DiscCache;->map:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 125
    if-nez p0, :L1
    goto :L2
  :L1
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  :L2
    return v0
.end method

.method public static known(Ljava/lang/String;)Z
  .registers 2
  .line 115
    if-nez p0, :L0
    const/4 p0, 1
    return p0
  :L0
  .line 116
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->load()V
  .line 117
    sget-object v0, Lcom/innioasis/ipp/DiscCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method private static load()V
  .catchall { :L1 .. :L7 } :L16
  .catchall { :L9 .. :L11 } :L12
  .registers 8
  .line 61
    sget-boolean v0, Lcom/innioasis/ipp/DiscCache;->loaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 62
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/DiscCache;->loaded:Z
  :L1
  .line 64
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->file()Ljava/io/File;
    move-result-object v1
  .line 65
    if-eqz v1, :L15
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L2
    goto/16 :L15
  :L2
  .line 66
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 67
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 68
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 69
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 70
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v1, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 71
    array-length v2, v1
    const/4 v3, 0
    if-lez v2, :L3
    const-string v2, "#v2"
    aget-object v4, v1, v3
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
    const/4 v2, 1
    goto :L4
  :L3
    const/4 v2, 0
  :L4
  .line 72
    if-nez v2, :L5
    sput-boolean v0, Lcom/innioasis/ipp/DiscCache;->dirty:Z
  :L5
  .line 73
    const/4 v0, 0
  :L6
    array-length v4, v1
    if-ge v0, v4, :L14
  .line 74
    aget-object v4, v1, v0
  .line 75
    const/16 v5, 9
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
  :L7
  .line 76
    if-gtz v5, :L8
    goto :L13
  :L8
  .line 78
    add-int/lit8 v6, v5, 1
  :L9
    invoke-virtual { v4, v6 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v6
  .line 79
    if-nez v2, :L10
    if-nez v6, :L10
    goto :L13
  :L10
  .line 80
    sget-object v7, Lcom/innioasis/ipp/DiscCache;->map:Ljava/util/HashMap;
    invoke-virtual { v4, v3, v5 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
    invoke-static { v6 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v7, v4, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L11
  .line 83
    goto :L13
  :L12
  .line 81
    move-exception v4
  :L13
  .line 73
    add-int/lit8 v0, v0, 1
    goto :L6
  :L14
  .line 87
    goto :L17
  :L15
  .line 65
    return-void
  :L16
  .line 85
    move-exception v0
  :L17
  .line 88
    return-void
.end method

.method private static parse(Ljava/lang/String;)I
  .registers 7
  .line 222
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 223
    nop
  .line 224
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 0
  :L1
  .line 225
    const/16 v3, 57
    const/16 v4, 48
    if-ge v2, v1, :L3
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    if-lt v5, v4, :L2
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    if-le v5, v3, :L3
  :L2
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 226
    nop
  :L4
  .line 227
    if-ge v2, v1, :L5
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    if-lt v5, v4, :L5
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    if-gt v5, v3, :L5
  .line 228
    mul-int/lit8 v0, v0, 10
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
    sub-int/2addr v5, v4
    add-int/2addr v0, v5
  .line 229
    add-int/lit8 v2, v2, 1
    goto :L4
  :L5
  .line 231
    return v0
.end method

.method public static read(Ljava/lang/String;ZZ)Lcom/innioasis/ipp/DiscCache$Tags;
  .registers 4
  .line 161
    new-instance v0, Lcom/innioasis/ipp/DiscCache$Tags;
    invoke-direct { v0 }, Lcom/innioasis/ipp/DiscCache$Tags;-><init>()V
  .line 162
    iput-boolean p1, v0, Lcom/innioasis/ipp/DiscCache$Tags;->wanted:Z
  .line 163
    if-nez p0, :L0
    return-object v0
  :L0
  .line 164
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object p0
  .line 165
    if-eqz p1, :L1
  .line 166
    iget-object p1, p0, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
    invoke-static { p1 }, Lcom/innioasis/ipp/DiscCache;->parse(Ljava/lang/String;)I
    move-result p1
    iput p1, v0, Lcom/innioasis/ipp/DiscCache$Tags;->disc:I
  .line 167
    iget-object p1, p0, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    iput-object p1, v0, Lcom/innioasis/ipp/DiscCache$Tags;->track:Ljava/lang/String;
  :L1
  .line 169
    iget-object p0, p0, Lcom/innioasis/ipp/Meta$Info;->art:[B
    iput-object p0, v0, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
  .line 170
    return-object v0
.end method

.method private static save()V
  .catchall { :L0 .. :L5 } :L6
  .registers 8
  .line 91
    sget-boolean v0, Lcom/innioasis/ipp/DiscCache;->dirty:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 93
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->file()Ljava/io/File;
    move-result-object v0
  .line 94
    if-nez v0, :L1
    return-void
  :L1
  .line 95
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 96
    const-string v2, "#v2"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v3, 10
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 97
    sget-object v2, Lcom/innioasis/ipp/DiscCache;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 98
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L4
  .line 99
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 100
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 101
    if-eqz v5, :L2
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-ltz v7, :L3
    goto :L2
  :L3
  .line 102
    invoke-virtual { v1, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    invoke-virtual { v5, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 103
    goto :L2
  :L4
  .line 104
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 105
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "UTF-8"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 106
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 107
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/DiscCache;->dirty:Z
  :L5
  .line 110
    goto :L7
  :L6
  .line 108
    move-exception v0
  :L7
  .line 111
    return-void
.end method

.method private static sideOf(Ljava/lang/String;)I
  .registers 6
  .line 198
    const/4 v0, 0
    if-eqz p0, :L6
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 2
    if-ge v1, v2, :L0
    goto :L6
  :L0
  .line 199
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v1
  .line 200
    const/16 v2, 97
    if-lt v1, v2, :L1
    const/16 v2, 122
    if-gt v1, v2, :L1
    add-int/lit8 v1, v1, -32
    int-to-char v1, v1
  :L1
  .line 201
    const/16 v2, 65
    if-lt v1, v2, :L5
    const/16 v3, 90
    if-le v1, v3, :L2
    goto :L5
  :L2
  .line 202
    const/4 v3, 1
    invoke-virtual { p0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result p0
  .line 203
    const/16 v4, 48
    if-lt p0, v4, :L4
    const/16 v4, 57
    if-le p0, v4, :L3
    goto :L4
  :L3
  .line 204
    sub-int/2addr v1, v2
    add-int/2addr v1, v3
    add-int/lit16 v1, v1, 1000
    return v1
  :L4
  .line 203
    return v0
  :L5
  .line 201
    return v0
  :L6
  .line 198
    return v0
.end method

.method public static warm()V
  .registers 0
  .line 213
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->load()V
  .line 214
    return-void
.end method

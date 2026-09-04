.class public final Lcom/innioasis/ipp/Del;
.super Ljava/lang/Object;
.source "Del.java"

.field private final static MAX_DEPTH:I = 8

.field private final static RAW:Ljava/lang/ThreadLocal;

.method static constructor <clinit>()V
  .registers 1
  .line 62
    new-instance v0, Ljava/lang/ThreadLocal;
    invoke-direct { v0 }, Ljava/lang/ThreadLocal;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Del;->RAW:Ljava/lang/ThreadLocal;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 43
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static cardRoot(Ljava/lang/String;)Z
  .registers 2
  .line 170
    const-string v0, "/storage/sdcard0"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "/storage/sdcard1"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
  .line 171
    const-string v0, "/storage"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "/mnt"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "/"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
  .line 170
    return p0
.end method

.method public static folder(Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  .line 95
    if-eqz p0, :L8
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-eqz v0, :L8
    invoke-static { }, Lcom/innioasis/ipp/Del;->raw()Z
    move-result v0
    if-eqz v0, :L1
    goto :L8
  :L1
  .line 96
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 97
    invoke-static { v0 }, Lcom/innioasis/ipp/Del;->on(Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :L2
    return-void
  :L2
  .line 103
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
  :L3
  .line 104
    if-eqz p0, :L5
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Del;->removable(Ljava/io/File;)Z
    move-result v0
    if-eqz v0, :L5
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Del;->spent(Ljava/io/File;I)Z
    move-result v0
    if-eqz v0, :L5
  .line 105
    invoke-virtual { p0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object v0
  .line 106
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "deleting spent folder "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 107
    invoke-static { p0 }, Lcom/innioasis/ipp/Del;->wipe(Ljava/io/File;)V
  :L4
  .line 108
    nop
  .line 109
    move-object p0, v0
    goto :L3
  :L5
  .line 112
    goto :L7
  :L6
  .line 110
    move-exception p0
  :L7
  .line 113
    return-void
  :L8
  .line 95
    return-void
.end method

.method private static leftover(Ljava/lang/String;)Z
  .registers 4
  .line 148
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 149
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
  .line 150
    const-string v1, ".lrc"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v1
    const/4 v2, 1
    if-eqz v1, :L1
    return v2
  :L1
  .line 151
    const/16 v1, 46
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 152
    if-lez v1, :L2
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  :L2
  .line 153
    const-string v1, "cover"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L3
    const-string v1, "folder"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L4
  :L3
    const/4 v0, 1
  :L4
    return v0
.end method

.method public static msg(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L6 } :L1
  .registers 4
  .line 189
    if-eqz p2, :L2
  :L0
    invoke-virtual { p2 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L2
    return-object p2
  :L1
  .line 194
    move-exception p0
    goto :L7
  :L2
  .line 190
    if-eqz p0, :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/Del;->on(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :L8
    if-nez p1, :L3
    goto :L8
  :L3
  .line 191
    invoke-static { p0 }, Lcom/innioasis/ipp/Del;->songScreen(Landroid/app/Activity;)Z
    move-result v0
    if-nez v0, :L4
    return-object p2
  :L4
  .line 192
    const v0, 2131820738
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L5
    return-object p2
  :L5
  .line 193
    const p1, 2131821090
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p0
  :L6
    return-object p0
  :L7
  .line 195
    return-object p2
  :L8
  .line 190
    return-object p2
.end method

.method private static on(Landroid/content/Context;)Z
  .registers 2
  .line 46
    const-string v0, "delete_folder"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method public static raw(Z)V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  :L0
  .line 67
    sget-object v0, Lcom/innioasis/ipp/Del;->RAW:Ljava/lang/ThreadLocal;
    invoke-virtual { v0 }, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [I
  .line 68
    const/4 v2, 1
    if-nez v1, :L1
  .line 69
    new-array v1, v2, [I
  .line 70
    invoke-virtual { v0, v1 }, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
  :L1
  .line 72
    const/4 v0, 0
    aget v3, v1, v0
    if-eqz p0, :L2
    goto :L3
  :L2
    const/4 v2, -1
  :L3
    add-int/2addr v3, v2
    aput v3, v1, v0
  .line 73
    if-gez v3, :L4
    aput v0, v1, v0
  :L4
  .line 76
    goto :L6
  :L5
  .line 74
    move-exception p0
  :L6
  .line 77
    return-void
.end method

.method private static raw()Z
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  .line 81
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/Del;->RAW:Ljava/lang/ThreadLocal;
    invoke-virtual { v1 }, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [I
  .line 82
    if-eqz v1, :L2
    aget v1, v1, v0
  :L1
    if-lez v1, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 83
    move-exception v1
  .line 84
    return v0
.end method

.method private static removable(Ljava/io/File;)Z
  .registers 4
  .line 162
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v0
  .line 163
    sget-object v1, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/objects/Constant;->pathIsAudiobook(Ljava/lang/String;)Z
    move-result v1
    const/4 v2, 0
    if-eqz v1, :L0
    return v2
  :L0
  .line 164
    invoke-virtual { p0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
  .line 165
    if-nez p0, :L1
    return v2
  :L1
  .line 166
    invoke-static { v0 }, Lcom/innioasis/ipp/Del;->cardRoot(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L2
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Del;->cardRoot(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L2
    const/4 v2, 1
  :L2
    return v2
.end method

.method private static songScreen(Landroid/app/Activity;)Z
  .registers 2
  .line 201
    instance-of v0, p0, Lcom/innioasis/music/SongListActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/AlbumsActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/ArtistsActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/GenresActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/music/SearchActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-nez v0, :L1
    instance-of p0, p0, Lcom/innioasis/y1/activity/PlayerActivity;
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method private static spent(Ljava/io/File;I)Z
  .registers 7
  .line 120
    const/16 v0, 8
    const/4 v1, 0
    if-le p1, v0, :L0
    return v1
  :L0
  .line 121
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  .line 122
    if-nez p0, :L1
    return v1
  :L1
  .line 123
    const/4 v0, 0
  :L2
    array-length v2, p0
    const/4 v3, 1
    if-ge v0, v2, :L5
  .line 124
    aget-object v2, p0, v0
  .line 125
    invoke-virtual { v2 }, Ljava/io/File;->isDirectory()Z
    move-result v4
    if-eqz v4, :L3
  .line 126
    add-int/2addr v3, p1
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Del;->spent(Ljava/io/File;I)Z
    move-result v2
    if-nez v2, :L4
    return v1
  :L3
  .line 127
    invoke-virtual { v2 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Del;->leftover(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L4
  .line 128
    return v1
  :L4
  .line 123
    add-int/lit8 v0, v0, 1
    goto :L2
  :L5
  .line 131
    return v3
.end method

.method private static wipe(Ljava/io/File;)V
  .registers 4
  .line 136
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 137
    if-eqz v0, :L3
  .line 138
    const/4 v1, 0
  :L0
    array-length v2, v0
    if-ge v1, v2, :L3
  .line 139
    aget-object v2, v0, v1
    invoke-virtual { v2 }, Ljava/io/File;->isDirectory()Z
    move-result v2
    if-eqz v2, :L1
    aget-object v2, v0, v1
    invoke-static { v2 }, Lcom/innioasis/ipp/Del;->wipe(Ljava/io/File;)V
    goto :L2
  :L1
  .line 140
    aget-object v2, v0, v1
    invoke-virtual { v2 }, Ljava/io/File;->delete()Z
  :L2
  .line 138
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 143
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  .line 144
    return-void
.end method

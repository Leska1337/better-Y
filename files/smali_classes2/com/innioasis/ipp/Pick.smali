.class public final Lcom/innioasis/ipp/Pick;
.super Ljava/lang/Object;
.source "Pick.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Pick$DoClear;,
    Lcom/innioasis/ipp/Pick$Noop;,
    Lcom/innioasis/ipp/Pick$ClearTask;,
    Lcom/innioasis/ipp/Pick$AsyncClear;,
    Lcom/innioasis/ipp/Pick$Done;
  }
.end annotation

.field public final static CACHE_ALL:I = 11

.field public final static COVERS:I = 1

.field public final static FLOW:I = 8

.field public final static SYSTEM:I = 4

.field public final static TAGS:I = 2

.method private constructor <init>()V
  .registers 1
  .line 27
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/SettingActivity;I)V
  .registers 2
  .line 25
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Pick;->clearWithDialog(Lcom/innioasis/y1/activity/SettingActivity;I)V
    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;)V
  .registers 1
  .line 25
    invoke-static { p0 }, Lcom/innioasis/ipp/Pick;->ownCache(Landroid/content/Context;)V
    return-void
.end method

.method public static askCache(Landroid/app/Activity;Lcom/innioasis/ipp/PickDialog$Go;)V
  .registers 12
  .line 260
    if-nez p0, :L0
    return-void
  :L0
  .line 261
    const/16 v0, 8
    const/4 v1, 2
    const/4 v2, 1
    filled-new-array { v2, v0, v1 }, [I
    move-result-object v7
  .line 262
    new-instance v0, Lcom/innioasis/ipp/PickDialog;
    const v1, 2131821072
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v5
  .line 263
    const v1, 2131821085
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v6
    const/4 v8, 0
    move-object v3, v0
    move-object v4, p0
    move-object v9, p1
    invoke-direct/range { v3 .. v9 }, Lcom/innioasis/ipp/PickDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[IZLcom/innioasis/ipp/PickDialog$Go;)V
    invoke-virtual { v0 }, Lcom/innioasis/ipp/PickDialog;->show()V
  .line 264
    return-void
.end method

.method public static askClear(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 12
  .line 49
    if-nez p0, :L0
    return-void
  :L0
  .line 50
    const/4 v0, 2
    const/4 v1, 4
    const/4 v2, 1
    const/16 v3, 8
    filled-new-array { v2, v3, v0, v1 }, [I
    move-result-object v8
  .line 51
    new-instance v0, Lcom/innioasis/ipp/PickDialog;
    const v1, 2131820574
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v6
  .line 52
    const v1, 2131821086
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v7
    const/4 v9, 1
    new-instance v10, Lcom/innioasis/ipp/Pick$DoClear;
    invoke-direct { v10, p0 }, Lcom/innioasis/ipp/Pick$DoClear;-><init>(Lcom/innioasis/y1/activity/SettingActivity;)V
    move-object v4, v0
    move-object v5, p0
    invoke-direct/range { v4 .. v10 }, Lcom/innioasis/ipp/PickDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[IZLcom/innioasis/ipp/PickDialog$Go;)V
    invoke-virtual { v0 }, Lcom/innioasis/ipp/PickDialog;->show()V
  .line 53
    return-void
.end method

.method public static clear(I)V
  .registers 2
  .line 163
    and-int/lit8 v0, p0, 1
    if-eqz v0, :L0
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->clear()V
  .line 165
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->clear()V
  .line 167
    invoke-static { }, Lcom/innioasis/ipp/Art;->clearStamps()V
  .line 169
    or-int/lit8 p0, p0, 8
  :L0
  .line 171
    and-int/lit8 v0, p0, 8
    if-eqz v0, :L1
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->clear()V
  :L1
  .line 172
    and-int/lit8 v0, p0, 2
    if-eqz v0, :L2
  .line 173
    invoke-static { }, Lcom/innioasis/ipp/Schema;->clearTags()V
  .line 174
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->clear()V
  .line 175
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->clear()V
  :L2
  .line 178
    and-int/lit8 p0, p0, 11
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->cacheCleared(I)V
  .line 179
    return-void
.end method

.method public static clearAsync(I)V
  .registers 3
  .line 142
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Pick$AsyncClear;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Pick$AsyncClear;-><init>(I)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 143
    return-void
.end method

.method private static clearWithDialog(Lcom/innioasis/y1/activity/SettingActivity;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 9
  .line 74
    nop
  :L0
  .line 76
    new-instance v6, Lcom/innioasis/y1/utils/LoadingDialog;
    const v0, 2131820576
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    const-string v3, ""
    const v4, 2131886360
    new-instance v5, Lcom/innioasis/ipp/Pick$Noop;
    invoke-direct { v5 }, Lcom/innioasis/ipp/Pick$Noop;-><init>()V
    move-object v0, v6
    move-object v1, p0
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/utils/LoadingDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILkotlin/jvm/functions/Function0;)V
  .line 78
    invoke-virtual { v6 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L1
  .line 81
    goto :L3
  :L2
  .line 79
    move-exception v0
  .line 80
    const/4 v6, 0
  :L3
  .line 82
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Pick$ClearTask;
    invoke-direct { v1, p0, p1, v6 }, Lcom/innioasis/ipp/Pick$ClearTask;-><init>(Lcom/innioasis/y1/activity/SettingActivity;ILcom/innioasis/y1/utils/LoadingDialog;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 83
    return-void
.end method

.method private static delete(Ljava/io/File;)V
  .registers 4
  .line 217
    if-nez p0, :L0
    return-void
  :L0
  .line 218
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :L2
  .line 219
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 220
    if-eqz v0, :L2
  .line 221
    const/4 v1, 0
  :L1
    array-length v2, v0
    if-ge v1, v2, :L2
    aget-object v2, v0, v1
    invoke-static { v2 }, Lcom/innioasis/ipp/Pick;->delete(Ljava/io/File;)V
    add-int/lit8 v1, v1, 1
    goto :L1
  :L2
  .line 224
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  .line 225
    return-void
.end method

.method public static label(I)I
  .registers 2
  .line 41
    const/4 v0, 1
    if-ne p0, v0, :L0
    const p0, 2131821082
    return p0
  :L0
  .line 42
    const/4 v0, 2
    if-ne p0, v0, :L1
    const p0, 2131821083
    return p0
  :L1
  .line 43
    const/16 v0, 8
    if-ne p0, v0, :L2
    const p0, 2131821168
    return p0
  :L2
  .line 44
    const p0, 2131821084
    return p0
.end method

.method private static ownCache(Landroid/content/Context;)V
  .catchall { :L0 .. :L7 } :L9
  .registers 4
  .line 205
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object p0
  :L1
  .line 206
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  :L3
  .line 207
    if-nez v0, :L4
    return-void
  :L4
  .line 208
    const/4 p0, 0
  :L5
    array-length v1, v0
    if-ge p0, v1, :L8
  .line 209
    aget-object v1, v0, p0
    invoke-virtual { v1 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v1
    const-string v2, "ipp_"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L6
    goto :L7
  :L6
  .line 210
    aget-object v1, v0, p0
    invoke-static { v1 }, Lcom/innioasis/ipp/Pick;->delete(Ljava/io/File;)V
  :L7
  .line 208
    add-int/lit8 p0, p0, 1
    goto :L5
  :L8
  .line 213
    goto :L10
  :L9
  .line 212
    move-exception p0
  :L10
  .line 214
    return-void
.end method

.method public static packages(Ljava/util/List;I)Ljava/util/List;
  .registers 6
  .line 186
    if-nez p0, :L0
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L0
  .line 187
    const/16 v0, 11
    and-int/2addr p1, v0
    if-ne p1, v0, :L1
    return-object p0
  :L1
  .line 188
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1 }, Ljava/util/ArrayList;-><init>()V
  .line 189
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 190
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v0
  :L3
  .line 191
    const/4 v1, 0
  :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L8
  .line 192
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 193
    instance-of v3, v2, Landroid/content/pm/PackageInfo;
    if-nez v3, :L5
    goto :L7
  :L5
  .line 194
    check-cast v2, Landroid/content/pm/PackageInfo;
  .line 195
    if-eqz v0, :L6
    iget-object v3, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L6
    goto :L7
  :L6
  .line 196
    invoke-virtual { p1, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 191
    add-int/lit8 v1, v1, 1
    goto :L4
  :L8
  .line 199
    invoke-virtual { p1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L9
    goto :L10
  :L9
    move-object p0, p1
  :L10
    return-object p0
.end method

.method public static size(I)J
  .catchall { :L0 .. :L7 } :L10
  .registers 11
  .line 230
    const-wide/16 v0, 0
  :L0
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
  .line 231
    if-nez v2, :L1
    const/4 v3, 0
    goto :L2
  :L1
    invoke-virtual { v2 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v3
  :L2
  .line 232
    if-nez v3, :L3
    return-wide v0
  :L3
  .line 233
    const/4 v4, 1
    if-ne p0, v4, :L4
  .line 234
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_covers"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v4
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_big"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 235
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_bigcover.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 236
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_art.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 237
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v0
    add-long/2addr v4, v0
  .line 234
    return-wide v4
  :L4
  .line 239
    const/16 v5, 8
    if-ne p0, v5, :L5
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_flow"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v0
    return-wide v0
  :L5
  .line 241
    const/4 v6, 2
    if-ne p0, v6, :L6
    invoke-static { v3 }, Lcom/innioasis/ipp/Pick;->tagFiles(Ljava/io/File;)J
    move-result-wide v2
    invoke-static { }, Lcom/innioasis/ipp/Schema;->tagBytes()J
    move-result-wide v0
    add-long/2addr v2, v0
    return-wide v2
  :L6
  .line 242
    invoke-static { v2 }, Lcom/innioasis/ipp/CacheSize;->total(Landroid/content/Context;)J
    move-result-wide v6
    invoke-static { v4 }, Lcom/innioasis/ipp/Pick;->size(I)J
    move-result-wide v8
    sub-long/2addr v6, v8
    invoke-static { v3 }, Lcom/innioasis/ipp/Pick;->tagFiles(Ljava/io/File;)J
    move-result-wide v2
    sub-long/2addr v6, v2
    invoke-static { v5 }, Lcom/innioasis/ipp/Pick;->size(I)J
    move-result-wide v2
  :L7
    sub-long/2addr v6, v2
  .line 243
    cmp-long p0, v6, v0
    if-gez p0, :L8
    goto :L9
  :L8
    move-wide v0, v6
  :L9
    return-wide v0
  :L10
  .line 244
    move-exception p0
  .line 245
    return-wide v0
.end method

.method public static sizeText(J)Ljava/lang/String;
  .registers 2
  .line 255
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static tagFiles(Ljava/io/File;)J
  .registers 5
  .line 250
    new-instance v0, Ljava/io/File;
    const-string v1, "ipp_albums.txt"
    invoke-direct { v0, p0, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v0
    new-instance v2, Ljava/io/File;
    const-string v3, "ipp_genres.txt"
    invoke-direct { v2, p0, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 251
    invoke-static { v2 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v2
    add-long/2addr v0, v2
  .line 250
    return-wide v0
.end method

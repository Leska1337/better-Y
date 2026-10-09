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

.field public final static CACHE_ALL:I = 3

.field public final static COVERS:I = 1

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
  .registers 11
  .line 253
    if-nez p0, :L0
    return-void
  :L0
  .line 254
    const/4 v0, 1
    const/4 v1, 2
    filled-new-array { v0, v1 }, [I
    move-result-object v6
  .line 255
    new-instance v0, Lcom/innioasis/ipp/PickDialog;
    const v1, 2131821072
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v4
  .line 256
    const v1, 2131821085
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v5
    const/4 v7, 0
    move-object v2, v0
    move-object v3, p0
    move-object v8, p1
    invoke-direct/range { v2 .. v8 }, Lcom/innioasis/ipp/PickDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[IZLcom/innioasis/ipp/PickDialog$Go;)V
    invoke-virtual { v0 }, Lcom/innioasis/ipp/PickDialog;->show()V
  .line 257
    return-void
.end method

.method public static askClear(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 11
  .line 46
    if-nez p0, :L0
    return-void
  :L0
  .line 47
    const/4 v0, 2
    const/4 v1, 4
    const/4 v2, 1
    filled-new-array { v2, v0, v1 }, [I
    move-result-object v7
  .line 48
    new-instance v0, Lcom/innioasis/ipp/PickDialog;
    const v1, 2131820574
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v5
  .line 49
    const v1, 2131821086
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v6
    const/4 v8, 1
    new-instance v9, Lcom/innioasis/ipp/Pick$DoClear;
    invoke-direct { v9, p0 }, Lcom/innioasis/ipp/Pick$DoClear;-><init>(Lcom/innioasis/y1/activity/SettingActivity;)V
    move-object v3, v0
    move-object v4, p0
    invoke-direct/range { v3 .. v9 }, Lcom/innioasis/ipp/PickDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[IZLcom/innioasis/ipp/PickDialog$Go;)V
    invoke-virtual { v0 }, Lcom/innioasis/ipp/PickDialog;->show()V
  .line 50
    return-void
.end method

.method public static clear(I)V
  .registers 2
  .line 154
    and-int/lit8 v0, p0, 1
    if-eqz v0, :L0
  .line 155
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->clear()V
  .line 156
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->clear()V
  :L0
  .line 158
    and-int/lit8 v0, p0, 2
    if-eqz v0, :L1
  .line 160
    invoke-static { }, Lcom/innioasis/ipp/Art;->clearStamps()V
  .line 161
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->clear()V
  .line 162
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->clear()V
  .line 163
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->clear()V
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->clear()V
  .line 165
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->clear()V
  .line 166
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->clear()V
  .line 167
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->clear()V
  :L1
  .line 170
    and-int/lit8 p0, p0, 3
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->cacheCleared(I)V
  .line 171
    return-void
.end method

.method public static clearAsync(I)V
  .registers 3
  .line 133
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Pick$AsyncClear;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Pick$AsyncClear;-><init>(I)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 134
    return-void
.end method

.method private static clearWithDialog(Lcom/innioasis/y1/activity/SettingActivity;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 9
  .line 71
    nop
  :L0
  .line 73
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
  .line 75
    invoke-virtual { v6 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L1
  .line 78
    goto :L3
  :L2
  .line 76
    move-exception v0
  .line 77
    const/4 v6, 0
  :L3
  .line 79
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Pick$ClearTask;
    invoke-direct { v1, p0, p1, v6 }, Lcom/innioasis/ipp/Pick$ClearTask;-><init>(Lcom/innioasis/y1/activity/SettingActivity;ILcom/innioasis/y1/utils/LoadingDialog;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 80
    return-void
.end method

.method private static delete(Ljava/io/File;)V
  .registers 4
  .line 209
    if-nez p0, :L0
    return-void
  :L0
  .line 210
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :L2
  .line 211
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 212
    if-eqz v0, :L2
  .line 213
    const/4 v1, 0
  :L1
    array-length v2, v0
    if-ge v1, v2, :L2
    aget-object v2, v0, v1
    invoke-static { v2 }, Lcom/innioasis/ipp/Pick;->delete(Ljava/io/File;)V
    add-int/lit8 v1, v1, 1
    goto :L1
  :L2
  .line 216
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  .line 217
    return-void
.end method

.method public static label(I)I
  .registers 2
  .line 39
    const/4 v0, 1
    if-ne p0, v0, :L0
    const p0, 2131821082
    return p0
  :L0
  .line 40
    const/4 v0, 2
    if-ne p0, v0, :L1
    const p0, 2131821083
    return p0
  :L1
  .line 41
    const p0, 2131821084
    return p0
.end method

.method private static ownCache(Landroid/content/Context;)V
  .catchall { :L0 .. :L7 } :L9
  .registers 4
  .line 197
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object p0
  :L1
  .line 198
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  :L3
  .line 199
    if-nez v0, :L4
    return-void
  :L4
  .line 200
    const/4 p0, 0
  :L5
    array-length v1, v0
    if-ge p0, v1, :L8
  .line 201
    aget-object v1, v0, p0
    invoke-virtual { v1 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v1
    const-string v2, "ipp_"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L6
    goto :L7
  :L6
  .line 202
    aget-object v1, v0, p0
    invoke-static { v1 }, Lcom/innioasis/ipp/Pick;->delete(Ljava/io/File;)V
  :L7
  .line 200
    add-int/lit8 p0, p0, 1
    goto :L5
  :L8
  .line 205
    goto :L10
  :L9
  .line 204
    move-exception p0
  :L10
  .line 206
    return-void
.end method

.method public static packages(Ljava/util/List;I)Ljava/util/List;
  .registers 6
  .line 178
    if-nez p0, :L0
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L0
  .line 179
    const/4 v0, 3
    and-int/2addr p1, v0
    if-ne p1, v0, :L1
    return-object p0
  :L1
  .line 180
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1 }, Ljava/util/ArrayList;-><init>()V
  .line 181
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 182
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v0
  :L3
  .line 183
    const/4 v1, 0
  :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L8
  .line 184
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 185
    instance-of v3, v2, Landroid/content/pm/PackageInfo;
    if-nez v3, :L5
    goto :L7
  :L5
  .line 186
    check-cast v2, Landroid/content/pm/PackageInfo;
  .line 187
    if-eqz v0, :L6
    iget-object v3, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L6
    goto :L7
  :L6
  .line 188
    invoke-virtual { p1, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 183
    add-int/lit8 v1, v1, 1
    goto :L4
  :L8
  .line 191
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
  .catchall { :L0 .. :L6 } :L9
  .registers 9
  .line 222
    const-wide/16 v0, 0
  :L0
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
  .line 223
    if-nez v2, :L1
    const/4 v3, 0
    goto :L2
  :L1
    invoke-virtual { v2 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v3
  :L2
  .line 224
    if-nez v3, :L3
    return-wide v0
  :L3
  .line 225
    const/4 v4, 1
    if-ne p0, v4, :L4
  .line 226
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_covers"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v4
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_big"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 227
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_bigcover.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 228
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v0
    add-long/2addr v4, v0
  .line 226
    return-wide v4
  :L4
  .line 230
    const/4 v5, 2
    if-ne p0, v5, :L5
  .line 231
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_art.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v4
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_years.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 232
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_tracks.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 233
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_albums.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 234
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_albumartist.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 235
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_discs.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 236
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_meta.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 237
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_genres.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 238
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v0
    add-long/2addr v4, v0
  .line 231
    return-wide v4
  :L5
  .line 240
    invoke-static { v2 }, Lcom/innioasis/ipp/CacheSize;->total(Landroid/content/Context;)J
    move-result-wide v2
    invoke-static { v4 }, Lcom/innioasis/ipp/Pick;->size(I)J
    move-result-wide v6
    sub-long/2addr v2, v6
    invoke-static { v5 }, Lcom/innioasis/ipp/Pick;->size(I)J
    move-result-wide v4
  :L6
    sub-long/2addr v2, v4
  .line 241
    cmp-long p0, v2, v0
    if-gez p0, :L7
    goto :L8
  :L7
    move-wide v0, v2
  :L8
    return-wide v0
  :L9
  .line 242
    move-exception p0
  .line 243
    return-wide v0
.end method

.method public static sizeText(J)Ljava/lang/String;
  .registers 2
  .line 248
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

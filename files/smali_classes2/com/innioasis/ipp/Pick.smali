.class public final Lcom/innioasis/ipp/Pick;
.super Ljava/lang/Object;
.source "Pick.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Pick$DoClear;,
    Lcom/innioasis/ipp/Pick$Noop;,
    Lcom/innioasis/ipp/Pick$Done;,
    Lcom/innioasis/ipp/Pick$Tick;,
    Lcom/innioasis/ipp/Pick$AsyncClear;
  }
.end annotation

.field public final static CACHE_ALL:I = 11

.field public final static COVERS:I = 1

.field public final static FLOW:I = 8

.field public final static LOCK:Ljava/lang/Object;

.field private final static PACKAGES_PCT:I = 20

.field private final static RUN:Ljava/lang/Object;

.field public final static STALE:I = 16

.field private final static STEPS:I = 5

.field public final static SYSTEM:I = 4

.field public final static TAGS:I = 2

.field private static runDialog:Lcom/innioasis/y1/utils/LoadingDialog;

.field private static runFinished:Z

.field private static runHost:Lcom/innioasis/y1/activity/SettingActivity;

.field private static runOwnDone:Z

.field private static runPackages:I

.field private static runRemoved:I

.field private static runShown:I

.field private static runSteps:I

.method static constructor <clinit>()V
  .registers 1
  .line 100
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Pick;->RUN:Ljava/lang/Object;
  .line 255
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Pick;->LOCK:Ljava/lang/Object;
    return-void
.end method

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

.method static synthetic access$200()V
  .registers 0
  .line 25
    invoke-static { }, Lcom/innioasis/ipp/Pick;->ownDone()V
    return-void
.end method

.method private static advance()V
  .catchall { :L0 .. :L14 } :L21
  .catchall { :L15 .. :L17 } :L18
  .catchall { :L20 .. :L22 } :L21
  .registers 10
  .line 161
    sget-object v0, Lcom/innioasis/ipp/Pick;->RUN:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 162
    sget-object v1, Lcom/innioasis/ipp/Pick;->runHost:Lcom/innioasis/y1/activity/SettingActivity;
  .line 163
    sget-object v2, Lcom/innioasis/ipp/Pick;->runDialog:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 164
    if-eqz v1, :L20
    sget-boolean v3, Lcom/innioasis/ipp/Pick;->runFinished:Z
    if-eqz v3, :L1
    goto/16 :L20
  :L1
  .line 165
    sget v3, Lcom/innioasis/ipp/Pick;->runPackages:I
    const/4 v4, 1
    const/4 v5, 0
    if-ltz v3, :L2
    sget v6, Lcom/innioasis/ipp/Pick;->runRemoved:I
    if-lt v6, v3, :L2
    const/4 v6, 1
    goto :L3
  :L2
    const/4 v6, 0
  :L3
  .line 166
    if-gez v3, :L4
    const/4 v7, 0
    goto :L7
  :L4
    const/16 v7, 20
    if-eqz v6, :L6
  :L5
    goto :L7
  :L6
    sget v8, Lcom/innioasis/ipp/Pick;->runRemoved:I
    mul-int/lit8 v8, v8, 20
    div-int v7, v8, v3
    goto :L5
  :L7
  .line 167
    sget-boolean v3, Lcom/innioasis/ipp/Pick;->runOwnDone:Z
    const/16 v8, 80
    if-eqz v3, :L9
  :L8
    goto :L10
  :L9
    sget v3, Lcom/innioasis/ipp/Pick;->runSteps:I
    const/4 v9, 5
    invoke-static { v3, v9 }, Ljava/lang/Math;->min(II)I
    move-result v3
    mul-int/lit8 v3, v3, 80
    div-int/lit8 v8, v3, 5
    goto :L8
  :L10
  .line 168
    add-int/2addr v7, v8
  .line 169
    if-eqz v6, :L11
    sget-boolean v3, Lcom/innioasis/ipp/Pick;->runOwnDone:Z
    if-eqz v3, :L11
    const/4 v5, 1
  :L11
  .line 170
    if-eqz v5, :L12
  .line 171
    sput-boolean v4, Lcom/innioasis/ipp/Pick;->runFinished:Z
  .line 172
    const/4 v3, 0
    sput-object v3, Lcom/innioasis/ipp/Pick;->runHost:Lcom/innioasis/y1/activity/SettingActivity;
  .line 173
    sput-object v3, Lcom/innioasis/ipp/Pick;->runDialog:Lcom/innioasis/y1/utils/LoadingDialog;
    goto :L13
  :L12
  .line 174
    sget v3, Lcom/innioasis/ipp/Pick;->runShown:I
    if-gt v7, v3, :L13
  .line 175
    monitor-exit v0
    return-void
  :L13
  .line 177
    sput v7, Lcom/innioasis/ipp/Pick;->runShown:I
  .line 178
    monitor-exit v0
  :L14
  .line 180
    if-eqz v5, :L16
  :L15
    new-instance v0, Lcom/innioasis/ipp/Pick$Done;
    invoke-direct { v0, v1, v2 }, Lcom/innioasis/ipp/Pick$Done;-><init>(Lcom/innioasis/y1/activity/SettingActivity;Lcom/innioasis/y1/utils/LoadingDialog;)V
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    goto :L17
  :L16
  .line 181
    new-instance v0, Lcom/innioasis/ipp/Pick$Tick;
    const v3, 2131820576
    invoke-virtual { v1, v3 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, v7 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v3
    invoke-direct { v0, v2, v3 }, Lcom/innioasis/ipp/Pick$Tick;-><init>(Lcom/innioasis/y1/utils/LoadingDialog;Ljava/lang/String;)V
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L17
  .line 183
    goto :L19
  :L18
  .line 182
    move-exception v0
  :L19
  .line 184
    return-void
  :L20
  .line 164
    monitor-exit v0
    return-void
  :L21
  .line 178
    move-exception v1
    monitor-exit v0
  :L22
    goto :L24
  :L23
    throw v1
  :L24
    goto :L23
.end method

.method public static askCache(Landroid/app/Activity;Lcom/innioasis/ipp/PickDialog$Go;)V
  .registers 12
  .line 371
    if-nez p0, :L0
    return-void
  :L0
  .line 372
    const/16 v0, 8
    const/4 v1, 2
    const/4 v2, 1
    filled-new-array { v2, v0, v1 }, [I
    move-result-object v7
  .line 373
    new-instance v0, Lcom/innioasis/ipp/PickDialog;
    const v1, 2131821072
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v5
  .line 374
    const v1, 2131821085
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v6
    const/4 v8, 0
    move-object v3, v0
    move-object v4, p0
    move-object v9, p1
    invoke-direct/range { v3 .. v9 }, Lcom/innioasis/ipp/PickDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[IZLcom/innioasis/ipp/PickDialog$Go;)V
    invoke-virtual { v0 }, Lcom/innioasis/ipp/PickDialog;->show()V
  .line 375
    return-void
.end method

.method public static askClear(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 14
  .line 57
    if-nez p0, :L0
    return-void
  :L0
  .line 58
    const/4 v0, 2
    const/4 v1, 4
    const/16 v2, 16
    const/4 v3, 1
    const/16 v4, 8
    filled-new-array { v2, v3, v4, v0, v1 }, [I
    move-result-object v9
  .line 59
    new-instance v0, Lcom/innioasis/ipp/PickDialog;
    const v1, 2131820574
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v7
  .line 60
    const v1, 2131821086
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v8
    const/4 v10, 1
    const/4 v11, 0
    new-instance v12, Lcom/innioasis/ipp/Pick$DoClear;
    invoke-direct { v12, p0 }, Lcom/innioasis/ipp/Pick$DoClear;-><init>(Lcom/innioasis/y1/activity/SettingActivity;)V
    move-object v5, v0
    move-object v6, p0
    invoke-direct/range { v5 .. v12 }, Lcom/innioasis/ipp/PickDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[IZILcom/innioasis/ipp/PickDialog$Go;)V
    invoke-virtual { v0 }, Lcom/innioasis/ipp/PickDialog;->show()V
  .line 61
    return-void
.end method

.method public static begin(Lcom/innioasis/y1/activity/SettingActivity;Lcom/innioasis/y1/utils/LoadingDialog;)V
  .catchall { :L0 .. :L1 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 4
  .line 112
    sget-object v0, Lcom/innioasis/ipp/Pick;->RUN:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 113
    sput-object p0, Lcom/innioasis/ipp/Pick;->runHost:Lcom/innioasis/y1/activity/SettingActivity;
  .line 114
    sput-object p1, Lcom/innioasis/ipp/Pick;->runDialog:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 115
    const/4 v1, -1
    sput v1, Lcom/innioasis/ipp/Pick;->runPackages:I
  .line 116
    const/4 v1, 0
    sput v1, Lcom/innioasis/ipp/Pick;->runRemoved:I
  .line 117
    sput v1, Lcom/innioasis/ipp/Pick;->runSteps:I
  .line 118
    sput v1, Lcom/innioasis/ipp/Pick;->runShown:I
  .line 119
    sput-boolean v1, Lcom/innioasis/ipp/Pick;->runOwnDone:Z
  .line 120
    sput-boolean v1, Lcom/innioasis/ipp/Pick;->runFinished:Z
  .line 121
    monitor-exit v0
  :L1
  .line 122
    if-eqz p0, :L2
    const v0, 2131820576
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object p0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Loading;->show(Lcom/innioasis/y1/utils/LoadingDialog;Ljava/lang/String;)V
  :L2
  .line 123
    return-void
  :L3
  .line 121
    move-exception p0
  :L4
    monitor-exit v0
  :L5
    throw p0
.end method

.method public static clear(I)V
  .catchall { :L2 .. :L4 } :L3
  .registers 2
  .line 260
    and-int/lit8 v0, p0, 1
    if-eqz v0, :L0
    or-int/lit8 v0, p0, 8
    and-int/lit8 v0, v0, 11
    goto :L1
  :L0
    and-int/lit8 v0, p0, 11
  :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->cacheCleared(I)V
  .line 261
    sget-object v0, Lcom/innioasis/ipp/Pick;->LOCK:Ljava/lang/Object;
    monitor-enter v0
  :L2
  .line 262
    invoke-static { p0 }, Lcom/innioasis/ipp/Pick;->clearLocked(I)V
  .line 263
    monitor-exit v0
  .line 264
    return-void
  :L3
  .line 263
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
.end method

.method public static clearAsync(I)V
  .registers 3
  .line 234
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Pick$AsyncClear;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Pick$AsyncClear;-><init>(I)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 235
    return-void
.end method

.method private static clearLocked(I)V
  .registers 2
  .line 267
    and-int/lit8 v0, p0, 16
    if-eqz v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Stale;->clear()V
  :L0
  .line 268
    invoke-static { }, Lcom/innioasis/ipp/Pick;->step()V
  .line 269
    and-int/lit8 v0, p0, 1
    if-eqz v0, :L1
  .line 270
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->clear()V
  .line 271
    invoke-static { }, Lcom/innioasis/ipp/Pick;->step()V
  .line 272
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->clear()V
  .line 274
    invoke-static { }, Lcom/innioasis/ipp/Art;->clearStamps()V
  .line 276
    or-int/lit8 p0, p0, 8
    goto :L2
  :L1
  .line 278
    invoke-static { }, Lcom/innioasis/ipp/Pick;->step()V
  :L2
  .line 280
    invoke-static { }, Lcom/innioasis/ipp/Pick;->step()V
  .line 281
    and-int/lit8 v0, p0, 8
    if-eqz v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->clear()V
  :L3
  .line 282
    invoke-static { }, Lcom/innioasis/ipp/Pick;->step()V
  .line 283
    and-int/lit8 p0, p0, 2
    if-eqz p0, :L4
  .line 284
    invoke-static { }, Lcom/innioasis/ipp/Schema;->clearTags()V
  .line 285
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->clear()V
  .line 286
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->clear()V
  :L4
  .line 288
    invoke-static { }, Lcom/innioasis/ipp/Pick;->step()V
  .line 289
    return-void
.end method

.method private static clearWithDialog(Lcom/innioasis/y1/activity/SettingActivity;I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 9
  .line 82
    nop
  :L0
  .line 84
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
  .line 86
    invoke-static { v6 }, Lcom/innioasis/ipp/Loading;->counter(Landroid/app/Dialog;)V
  .line 87
    invoke-virtual { v6 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L1
  .line 90
    goto :L3
  :L2
  .line 88
    move-exception v0
  .line 89
    const/4 v6, 0
  :L3
  .line 91
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/Pick;->begin(Lcom/innioasis/y1/activity/SettingActivity;Lcom/innioasis/y1/utils/LoadingDialog;)V
  .line 92
    const/4 p0, 0
    invoke-static { p0 }, Lcom/innioasis/ipp/Pick;->expect(I)V
  .line 93
    invoke-static { p1 }, Lcom/innioasis/ipp/Pick;->clearAsync(I)V
  .line 94
    return-void
.end method

.method private static delete(Ljava/io/File;)V
  .registers 4
  .line 327
    if-nez p0, :L0
    return-void
  :L0
  .line 328
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :L2
  .line 329
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 330
    if-eqz v0, :L2
  .line 331
    const/4 v1, 0
  :L1
    array-length v2, v0
    if-ge v1, v2, :L2
    aget-object v2, v0, v1
    invoke-static { v2 }, Lcom/innioasis/ipp/Pick;->delete(Ljava/io/File;)V
    add-int/lit8 v1, v1, 1
    goto :L1
  :L2
  .line 334
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  .line 335
    return-void
.end method

.method public static expect(I)V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 2
  .line 127
    sget-object v0, Lcom/innioasis/ipp/Pick;->RUN:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 128
    sput p0, Lcom/innioasis/ipp/Pick;->runPackages:I
  .line 129
    monitor-exit v0
  :L1
  .line 130
    invoke-static { }, Lcom/innioasis/ipp/Pick;->advance()V
  .line 131
    return-void
  :L2
  .line 129
    move-exception p0
  :L3
    monitor-exit v0
  :L4
    throw p0
.end method

.method static inTotal(I)Z
  .registers 2
  .line 52
    const/16 v0, 16
    if-eq p0, v0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static label(I)I
  .registers 2
  .line 43
    const/4 v0, 1
    if-ne p0, v0, :L0
    const p0, 2131821082
    return p0
  :L0
  .line 44
    const/4 v0, 2
    if-ne p0, v0, :L1
    const p0, 2131821083
    return p0
  :L1
  .line 45
    const/16 v0, 8
    if-ne p0, v0, :L2
    const p0, 2131821168
    return p0
  :L2
  .line 46
    const/16 v0, 16
    if-ne p0, v0, :L3
    const p0, 2131821173
    return p0
  :L3
  .line 47
    const p0, 2131821084
    return p0
.end method

.method private static ownCache(Landroid/content/Context;)V
  .catchall { :L0 .. :L7 } :L9
  .registers 4
  .line 315
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object p0
  :L1
  .line 316
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  :L3
  .line 317
    if-nez v0, :L4
    return-void
  :L4
  .line 318
    const/4 p0, 0
  :L5
    array-length v1, v0
    if-ge p0, v1, :L8
  .line 319
    aget-object v1, v0, p0
    invoke-virtual { v1 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v1
    const-string v2, "ipp_"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L6
    goto :L7
  :L6
  .line 320
    aget-object v1, v0, p0
    invoke-static { v1 }, Lcom/innioasis/ipp/Pick;->delete(Ljava/io/File;)V
  :L7
  .line 318
    add-int/lit8 p0, p0, 1
    goto :L5
  :L8
  .line 323
    goto :L10
  :L9
  .line 322
    move-exception p0
  :L10
  .line 324
    return-void
.end method

.method private static ownDone()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 2
  .line 150
    sget-object v0, Lcom/innioasis/ipp/Pick;->RUN:Ljava/lang/Object;
    monitor-enter v0
  .line 151
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/Pick;->runOwnDone:Z
  .line 152
    monitor-exit v0
  :L1
  .line 153
    invoke-static { }, Lcom/innioasis/ipp/Pick;->advance()V
  .line 154
    return-void
  :L2
  .line 152
    move-exception v1
  :L3
    monitor-exit v0
  :L4
    throw v1
.end method

.method public static packages(Ljava/util/List;I)Ljava/util/List;
  .registers 6
  .line 296
    if-nez p0, :L0
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
  :L0
  .line 297
    const/16 v0, 11
    and-int/2addr p1, v0
    if-ne p1, v0, :L1
    return-object p0
  :L1
  .line 298
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1 }, Ljava/util/ArrayList;-><init>()V
  .line 299
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 300
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v0
  :L3
  .line 301
    const/4 v1, 0
  :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L8
  .line 302
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 303
    instance-of v3, v2, Landroid/content/pm/PackageInfo;
    if-nez v3, :L5
    goto :L7
  :L5
  .line 304
    check-cast v2, Landroid/content/pm/PackageInfo;
  .line 305
    if-eqz v0, :L6
    iget-object v3, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L6
    goto :L7
  :L6
  .line 306
    invoke-virtual { p1, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 301
    add-int/lit8 v1, v1, 1
    goto :L4
  :L8
  .line 309
    invoke-virtual { p1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L9
    goto :L10
  :L9
    move-object p0, p1
  :L10
    return-object p0
.end method

.method public static removedOne(Lcom/innioasis/y1/activity/SettingActivity;)V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 2
  .line 135
    sget-object p0, Lcom/innioasis/ipp/Pick;->RUN:Ljava/lang/Object;
    monitor-enter p0
  :L0
  .line 136
    sget v0, Lcom/innioasis/ipp/Pick;->runRemoved:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Pick;->runRemoved:I
  .line 137
    monitor-exit p0
  :L1
  .line 138
    invoke-static { }, Lcom/innioasis/ipp/Pick;->advance()V
  .line 139
    return-void
  :L2
  .line 137
    move-exception v0
  :L3
    monitor-exit p0
  :L4
    throw v0
.end method

.method public static size(I)J
  .catchall { :L0 .. :L8 } :L11
  .registers 11
  .line 340
    const-wide/16 v0, 0
  :L0
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
  .line 341
    if-nez v2, :L1
    const/4 v3, 0
    goto :L2
  :L1
    invoke-virtual { v2 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v3
  :L2
  .line 342
    if-nez v3, :L3
    return-wide v0
  :L3
  .line 343
    const/4 v4, 1
    if-ne p0, v4, :L4
  .line 344
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_covers"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v4
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_big"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 345
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_bigcover.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 346
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_covers_none.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 347
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v6
    add-long/2addr v4, v6
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_art.txt"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 348
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v0
    add-long/2addr v4, v0
  .line 344
    return-wide v4
  :L4
  .line 350
    const/16 v5, 8
    if-ne p0, v5, :L5
    new-instance p0, Ljava/io/File;
    const-string v2, "ipp_flow"
    invoke-direct { p0, v3, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v0
    return-wide v0
  :L5
  .line 351
    const/16 v6, 16
    if-ne p0, v6, :L6
    invoke-static { }, Lcom/innioasis/ipp/Stale;->size()J
    move-result-wide v0
    return-wide v0
  :L6
  .line 353
    const/4 v6, 2
    if-ne p0, v6, :L7
    invoke-static { v3 }, Lcom/innioasis/ipp/Pick;->tagFiles(Ljava/io/File;)J
    move-result-wide v2
    invoke-static { }, Lcom/innioasis/ipp/Schema;->tagBytes()J
    move-result-wide v0
    add-long/2addr v2, v0
    return-wide v2
  :L7
  .line 354
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
  :L8
    sub-long/2addr v6, v2
  .line 355
    cmp-long p0, v6, v0
    if-gez p0, :L9
    goto :L10
  :L9
    move-wide v0, v6
  :L10
    return-wide v0
  :L11
  .line 356
    move-exception p0
  .line 357
    return-wide v0
.end method

.method public static sizeText(J)Ljava/lang/String;
  .registers 2
  .line 366
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static step()V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 2
  .line 142
    sget-object v0, Lcom/innioasis/ipp/Pick;->RUN:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 143
    sget-object v1, Lcom/innioasis/ipp/Pick;->runHost:Lcom/innioasis/y1/activity/SettingActivity;
    if-nez v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 144
    sget v1, Lcom/innioasis/ipp/Pick;->runSteps:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Pick;->runSteps:I
  .line 145
    monitor-exit v0
  :L2
  .line 146
    invoke-static { }, Lcom/innioasis/ipp/Pick;->advance()V
  .line 147
    return-void
  :L3
  .line 145
    move-exception v1
  :L4
    monitor-exit v0
  :L5
    throw v1
.end method

.method private static tagFiles(Ljava/io/File;)J
  .registers 3
  .line 362
    new-instance v0, Ljava/io/File;
    const-string v1, "ipp_genres.txt"
    invoke-direct { v0, p0, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v0
    return-wide v0
.end method

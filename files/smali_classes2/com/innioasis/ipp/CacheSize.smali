.class public final Lcom/innioasis/ipp/CacheSize;
.super Ljava/lang/Object;
.source "CacheSize.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/CacheSize$Measure;,
    Lcom/innioasis/ipp/CacheSize$Apply;
  }
.end annotation

.field private final static TTL_MS:J = 2000L

.field private static measuredAt:J

.field private static running:Z

.field private static stale:Z

.field private static value:Ljava/lang/String;

.method static constructor <clinit>()V
  .registers 1
  .line 29
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/CacheSize;->stale:Z
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 19
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$002(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 17
    sput-object p0, Lcom/innioasis/ipp/CacheSize;->value:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$102(J)J
  .registers 2
  .line 17
    sput-wide p0, Lcom/innioasis/ipp/CacheSize;->measuredAt:J
    return-wide p0
.end method

.method static synthetic access$202(Z)Z
  .registers 1
  .line 17
    sput-boolean p0, Lcom/innioasis/ipp/CacheSize;->running:Z
    return p0
.end method

.method static dirSize(Ljava/io/File;)J
  .registers 6
  .line 104
    const-wide/16 v0, 0
    if-eqz p0, :L5
    invoke-virtual { p0 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L0
    goto :L5
  :L0
  .line 105
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v2
    if-eqz v2, :L1
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v0
    return-wide v0
  :L1
  .line 106
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  .line 107
    if-nez p0, :L2
    return-wide v0
  :L2
  .line 108
    nop
  .line 109
    const/4 v2, 0
  :L3
    array-length v3, p0
    if-ge v2, v3, :L4
    aget-object v3, p0, v2
    invoke-static { v3 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v3
    add-long/2addr v0, v3
    add-int/lit8 v2, v2, 1
    goto :L3
  :L4
  .line 110
    return-wide v0
  :L5
  .line 104
    return-wide v0
.end method

.method static format(J)Ljava/lang/String;
  .registers 10
  .line 115
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 116
    const-wide/16 v1, 1024
    cmp-long v3, p0, v1
    if-gez v3, :L0
    invoke-virtual { v0, p0, p1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, " B"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 119
    const-wide/32 v3, 1048576
    const-wide/16 v5, 10
    cmp-long v7, p0, v3
    if-gez v7, :L1
  .line 120
    mul-long p0, p0, v5
    div-long/2addr p0, v1
  .line 121
    const-string v1, " KB"
    goto :L2
  :L1
  .line 123
    mul-long p0, p0, v5
    div-long/2addr p0, v3
  .line 124
    const-string v1, " MB"
  :L2
  .line 126
    div-long v2, p0, v5
    invoke-virtual { v0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const/16 v2, 46
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v0
    rem-long/2addr p0, v5
    invoke-virtual { v0, p0, p1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static refresh(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 2
  .line 40
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/CacheSize;->stale:Z
  .line 41
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->start(Lcom/innioasis/y1/activity/SettingActivity;)V
  .line 42
    return-void
.end method

.method private static start(Lcom/innioasis/y1/activity/SettingActivity;)V
  .registers 3
  .line 45
    sget-boolean v0, Lcom/innioasis/ipp/CacheSize;->running:Z
    if-nez v0, :L1
    if-nez p0, :L0
    goto :L1
  :L0
  .line 46
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/CacheSize;->running:Z
  .line 47
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/CacheSize;->stale:Z
  .line 48
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/CacheSize$Measure;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/CacheSize$Measure;-><init>(Lcom/innioasis/y1/activity/SettingActivity;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 49
    return-void
  :L1
  .line 45
    return-void
.end method

.method public static text(Lcom/innioasis/y1/activity/SettingActivity;)Ljava/lang/String;
  .registers 6
  .line 34
    sget-boolean v0, Lcom/innioasis/ipp/CacheSize;->stale:Z
    if-nez v0, :L0
    sget-object v0, Lcom/innioasis/ipp/CacheSize;->value:Ljava/lang/String;
    if-eqz v0, :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sget-wide v2, Lcom/innioasis/ipp/CacheSize;->measuredAt:J
    sub-long/2addr v0, v2
    const-wide/16 v2, 2000
    cmp-long v4, v0, v2
    if-lez v4, :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/CacheSize;->start(Lcom/innioasis/y1/activity/SettingActivity;)V
  :L1
  .line 35
    sget-object p0, Lcom/innioasis/ipp/CacheSize;->value:Ljava/lang/String;
    if-nez p0, :L2
    const-string p0, "\u2026"
  :L2
    return-object p0
.end method

.method static total(Landroid/content/Context;)J
  .registers 8
  .line 91
    nop
  .line 92
    new-instance v0, Ljava/io/File;
    const-string v1, "/data/data"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 93
    const-wide/16 v1, 0
    if-eqz v0, :L1
  .line 94
    const/4 v3, 0
  :L0
    array-length v4, v0
    if-ge v3, v4, :L1
    new-instance v4, Ljava/io/File;
    aget-object v5, v0, v3
    const-string v6, "cache"
    invoke-direct { v4, v5, v6 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-static { v4 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v4
    add-long/2addr v1, v4
    add-int/lit8 v3, v3, 1
    goto :L0
  :L1
  .line 97
    if-eqz p0, :L2
  .line 98
    new-instance v0, Ljava/io/File;
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "Android/data/"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { p0 }, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v3, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v3, "/cache"
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    const-string v3, "/storage/sdcard0"
    invoke-direct { v0, v3, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v3
    add-long/2addr v1, v3
  :L2
  .line 100
    return-wide v1
.end method

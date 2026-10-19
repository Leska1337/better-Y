.class public final Lcom/innioasis/ipp/Diag;
.super Ljava/lang/Object;
.source "Diag.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Diag$Gc;,
    Lcom/innioasis/ipp/Diag$Heap;,
    Lcom/innioasis/ipp/Diag$Crash;,
    Lcom/innioasis/ipp/Diag$NameCmp;,
    Lcom/innioasis/ipp/Diag$Save;,
    Lcom/innioasis/ipp/Diag$Note;
  }
.end annotation

.field private final static CAP:I = 262144

.field private final static CRASH:Ljava/lang/String; = "crash_"

.field private final static FILE_CAP:I = 65536

.field private final static GAP_MS:J = 2000L

.field private final static MAIN_CAP:I = 1048576

.field final static MARK:Ljava/lang/String; = "/storage/sdcard0/better-Y/debug_log"

.field private final static RING:I = 2000

.field private final static SLOW_MS:J = 200L

.field private final static STALE_MS:J = 172800000L

.field private final static TAPS:I = 5

.field private static armed:Z

.field private static lastTap:J

.field private static markAt:J

.field private static markWhat:Ljava/lang/String;

.field private static prev:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private final static ringMsg:[Ljava/lang/String;

.field private static ringN:I

.field private final static ringPri:[I

.field private final static ringTag:[Ljava/lang/String;

.field private final static ringWhen:[J

.field private static taps:I

.method static constructor <clinit>()V
  .registers 2
  .line 77
    const/16 v0, 2000
    new-array v1, v0, [J
    sput-object v1, Lcom/innioasis/ipp/Diag;->ringWhen:[J
  .line 78
    new-array v1, v0, [I
    sput-object v1, Lcom/innioasis/ipp/Diag;->ringPri:[I
  .line 79
    new-array v1, v0, [Ljava/lang/String;
    sput-object v1, Lcom/innioasis/ipp/Diag;->ringTag:[Ljava/lang/String;
  .line 80
    new-array v0, v0, [Ljava/lang/String;
    sput-object v0, Lcom/innioasis/ipp/Diag;->ringMsg:[Ljava/lang/String;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 37
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static about(Landroid/app/Activity;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 9
  :L0
  .line 341
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 342
    sget-wide v2, Lcom/innioasis/ipp/Diag;->lastTap:J
    sub-long v2, v0, v2
    const-wide/16 v4, 2000
    const/4 v6, 0
    cmp-long v7, v2, v4
    if-lez v7, :L1
    sput v6, Lcom/innioasis/ipp/Diag;->taps:I
  :L1
  .line 343
    sput-wide v0, Lcom/innioasis/ipp/Diag;->lastTap:J
  .line 344
    sget v0, Lcom/innioasis/ipp/Diag;->taps:I
    const/4 v1, 1
    add-int/2addr v0, v1
    sput v0, Lcom/innioasis/ipp/Diag;->taps:I
    const/4 v2, 5
    if-ge v0, v2, :L2
    return-void
  :L2
  .line 345
    sput v6, Lcom/innioasis/ipp/Diag;->taps:I
  .line 346
    invoke-static { }, Lcom/innioasis/ipp/Diag;->on()Z
    move-result v0
    if-nez v0, :L3
    const/4 v6, 1
  :L3
  .line 347
    invoke-static { v6 }, Lcom/innioasis/ipp/Diag;->set(Z)Z
    move-result v0
    if-nez v0, :L4
    return-void
  :L4
  .line 348
    if-eqz v6, :L5
    const v0, 2131821115
    goto :L6
  :L5
    const v0, 2131821116
  :L6
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Diag;->toast(Landroid/content/Context;I)V
  :L7
  .line 350
    goto :L9
  :L8
  .line 349
    move-exception p0
  :L9
  .line 351
    return-void
.end method

.method static synthetic access$000()Ljava/lang/Thread$UncaughtExceptionHandler;
  .registers 1
  .line 35
    sget-object v0, Lcom/innioasis/ipp/Diag;->prev:Ljava/lang/Thread$UncaughtExceptionHandler;
    return-object v0
.end method

.method static synthetic access$100(Landroid/content/Context;I)V
  .registers 2
  .line 35
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Diag;->toast(Landroid/content/Context;I)V
    return-void
.end method

.method static synthetic access$200(Landroid/content/Context;Ljava/lang/String;)V
  .registers 2
  .line 35
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Diag;->toast(Landroid/content/Context;Ljava/lang/String;)V
    return-void
.end method

.method private static anr(Ljava/lang/StringBuilder;)V
  .registers 7
  .line 683
    const-string v0, "\n--- /data/anr/traces.txt (tail) ---\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 684
    new-instance v0, Ljava/io/File;
    const-string v1, "/data/anr/traces.txt"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 685
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v1
    if-nez v1, :L0
  .line 686
    const-string v0, "(none)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 687
    return-void
  :L0
  .line 689
    const-string v1, "written "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    new-instance v2, Ljava/text/SimpleDateFormat;
    const-string v3, "yyyy-MM-dd HH:mm:ss"
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v2, v3, v4 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v3, Ljava/util/Date;
  .line 690
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v4
    invoke-direct { v3, v4, v5 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { v2, v3 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v2
  .line 689
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 690
    const/16 v2, 10
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 691
    const/high16 v1, 0x00010000
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->tail(Ljava/io/File;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 692
    return-void
.end method

.method private static arm()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 262
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Diag;->armed:Z
  :L0
  .line 264
    invoke-static { }, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Diag;->prev:Ljava/lang/Thread$UncaughtExceptionHandler;
  .line 265
    new-instance v0, Lcom/innioasis/ipp/Diag$Crash;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Diag$Crash;-><init>()V
    invoke-static { v0 }, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V
  :L1
  .line 267
    goto :L3
  :L2
  .line 266
    move-exception v0
  :L3
  .line 268
    return-void
.end method

.method static bitmapBytes(Ljava/util/Collection;)J
  .registers 9
  .line 502
    nop
  .line 503
    new-instance v0, Ljava/util/IdentityHashMap;
    invoke-direct { v0 }, Ljava/util/IdentityHashMap;-><init>()V
  .line 504
    invoke-interface { p0 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object p0
    const-wide/16 v1, 0
  :L0
  .line 505
    invoke-interface { p0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L5
  .line 506
    invoke-interface { p0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
  .line 507
    instance-of v4, v3, [Ljava/lang/Object;
    if-eqz v4, :L3
  .line 508
    move-object v4, v3
    check-cast v4, [Ljava/lang/Object;
  .line 509
    const/4 v5, 0
  :L1
    array-length v6, v4
    if-ge v5, v6, :L3
    aget-object v6, v4, v5
    instance-of v7, v6, Landroid/graphics/Bitmap;
    if-eqz v7, :L2
    move-object v3, v6
  :L2
    add-int/lit8 v5, v5, 1
    goto :L1
  :L3
  .line 511
    instance-of v4, v3, Landroid/graphics/Bitmap;
    if-eqz v4, :L4
    invoke-virtual { v0, v3, v3 }, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    if-nez v4, :L4
  .line 512
    check-cast v3, Landroid/graphics/Bitmap;
  .line 513
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getRowBytes()I
    move-result v4
    int-to-long v4, v4
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    int-to-long v6, v3
    mul-long v4, v4, v6
    add-long/2addr v1, v4
  :L4
  .line 515
    goto :L0
  :L5
  .line 516
    return-wide v1
.end method

.method private static crashes(Ljava/lang/StringBuilder;)V
  .registers 11
  .line 640
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object v0
    const-string v1, "crash_"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->newest(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 641
    const-string v1, "\n--- last crash log the app saved before dying ---\n"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 642
    const/high16 v1, 0x00010000
    const/16 v2, 10
    const-string v3, "yyyy-MM-dd HH:mm:ss"
    const-string v4, ", "
    if-nez v0, :L0
  .line 643
    const-string v0, "(none since the card was last cleared)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L1
  :L0
  .line 645
    invoke-virtual { v0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { p0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    new-instance v6, Ljava/text/SimpleDateFormat;
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v6, v3, v7 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v7, Ljava/util/Date;
  .line 646
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v8
    invoke-direct { v7, v8, v9 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { v6, v7 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v6
  .line 645
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
  .line 647
    invoke-virtual { v5, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->tail(Ljava/io/File;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v5, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L1
  .line 649
    const-string v0, "\n--- last xCrash tombstone ---\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 650
    invoke-static { }, Lcom/innioasis/ipp/Diag;->tombstones()Ljava/io/File;
    move-result-object v0
    const/4 v5, 0
    invoke-static { v0, v5 }, Lcom/innioasis/ipp/Diag;->newest(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 651
    if-nez v0, :L2
  .line 652
    const-string v0, "(none)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L4
  :L2
  .line 654
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v5
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v7
    sub-long/2addr v5, v7
  .line 655
    invoke-virtual { v0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { p0, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    new-instance v7, Ljava/text/SimpleDateFormat;
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v7, v3, v8 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v3, Ljava/util/Date;
  .line 656
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v8
    invoke-direct { v3, v8, v9 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { v7, v3 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v3
  .line 655
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
  .line 656
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 657
    const-wide/32 v2, 172800000
    cmp-long v4, v5, v2
    if-lez v4, :L3
  .line 658
    const-string v0, "(older than "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-wide/16 v0, 48
    invoke-virtual { p0, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 659
    const-string v0, " h, not included -- ask for the file itself if it matters)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L4
  :L3
  .line 661
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->tail(Ljava/io/File;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L4
  .line 664
    return-void
.end method

.method private static head(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .registers 6
  .line 458
    const-string v0, "better-Y "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-static { p0 }, Lcom/innioasis/ipp/Panel;->version(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 v0, 10
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 459
    const-string p0, "when     "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    new-instance v1, Ljava/text/SimpleDateFormat;
    const-string v2, "yyyy-MM-dd HH:mm:ss"
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v1, v2, v3 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v2, Ljava/util/Date;
    invoke-direct { v2 }, Ljava/util/Date;-><init>()V
  .line 460
    invoke-virtual { v1, v2 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v1
  .line 459
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 460
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 461
    const-string p0, "uptime   "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v1
    invoke-virtual { p0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " ms\n"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 462
    const-string p0, "device   "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " / android "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 463
    const-string v1, " sdk "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 464
    const-string p0, "build    "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " / "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 465
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 466
    const-string p0, "locale   "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Ljava/util/Locale;->getDefault()Ljava/util/Locale;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 467
    const-string p0, "debug    "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Lcom/innioasis/ipp/Diag;->on()Z
    move-result v1
    if-eqz v1, :L0
    const-string v1, "on"
    goto :L1
  :L0
    const-string v1, "off"
  :L1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " ("
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, "/storage/sdcard0/better-Y/debug_log"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, ")\n"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 468
    const-string p0, "usb      "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Lcom/innioasis/ipp/Panel;->usb()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 469
    const-string p0, "card     "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, "/storage/sdcard0"
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->space(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 470
    const-string p0, "internal "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, "/storage/sdcard1"
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->space(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 471
    const-string p0, "data     "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, "/data"
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->space(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 472
    invoke-static { p1 }, Lcom/innioasis/ipp/Diag;->memory(Ljava/lang/StringBuilder;)V
  .line 473
    return-void
.end method

.method static keepNewest(Ljava/io/File;Ljava/lang/String;I)V
  .catchall { :L0 .. :L6 } :L9
  .registers 7
  :L0
  .line 319
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  .line 320
    if-eqz p0, :L8
    array-length v0, p0
    if-gt v0, p2, :L1
    goto :L8
  :L1
  .line 321
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 322
    const/4 v1, 0
    const/4 v2, 0
  :L2
    array-length v3, p0
    if-ge v2, v3, :L4
  .line 323
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L3
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3, p1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L3
    aget-object v3, p0, v2
    invoke-interface { v0, v3 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L3
  .line 322
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 325
    new-instance p0, Lcom/innioasis/ipp/Diag$NameCmp;
    invoke-direct { p0 }, Lcom/innioasis/ipp/Diag$NameCmp;-><init>()V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 326
    nop
  :L5
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result p0
    sub-int/2addr p0, p2
    if-ge v1, p0, :L7
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/io/File;
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L6
    add-int/lit8 v1, v1, 1
    goto :L5
  :L7
  .line 328
    goto :L10
  :L8
  .line 320
    return-void
  :L9
  .line 327
    move-exception p0
  :L10
  .line 329
    return-void
.end method

.method public static lap()V
  .registers 3
  .line 217
    sget-object v0, Lcom/innioasis/ipp/Diag;->markWhat:Ljava/lang/String;
  .line 218
    if-nez v0, :L0
    return-void
  :L0
  .line 219
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Diag;->markWhat:Ljava/lang/String;
  .line 220
    sget-wide v1, Lcom/innioasis/ipp/Diag;->markAt:J
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 221
    return-void
.end method

.method private static library(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .catchall { :L0 .. :L14 } :L15
  .catchall { :L17 .. :L24 } :L25
  .catchall { :L26 .. :L32 } :L33
  .registers 18
  .line 572
    move-object/from16 v1, p1
    const-string v0, " (raw tags)\n"
    const-string v2, ")\n"
    const-string v3, "\n--- library ---\n"
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 574
    const/4 v3, 0
    const/4 v4, 0
    const/16 v5, 10
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v6
  .line 575
    if-nez v6, :L1
  .line 576
    const-string v0, "songs    (unavailable)\n"
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto/16 :L9
  :L1
  .line 578
    new-instance v7, Ljava/util/HashSet;
    invoke-direct { v7 }, Ljava/util/HashSet;-><init>()V
  .line 579
    new-instance v8, Ljava/util/HashSet;
    invoke-direct { v8 }, Ljava/util/HashSet;-><init>()V
  .line 580
    new-instance v9, Ljava/util/HashSet;
    invoke-direct { v9 }, Ljava/util/HashSet;-><init>()V
  .line 581
    nop
  .line 582
    const/4 v10, 0
    const/4 v11, 0
  :L2
    invoke-interface { v6 }, Ljava/util/List;->size()I
    move-result v12
    if-ge v10, v12, :L8
  .line 583
    invoke-interface { v6, v10 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Lcom/innioasis/y1/database/Song;
  .line 584
    if-nez v12, :L3
    goto :L7
  :L3
  .line 585
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v13
  .line 586
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v14
  .line 587
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v15
  .line 588
    if-eqz v13, :L4
    invoke-virtual { v13 }, Ljava/lang/String;->length()I
    move-result v13
    if-lez v13, :L4
    invoke-static { v12 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v12
    invoke-virtual { v7, v12 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    goto :L5
  :L4
    add-int/lit8 v11, v11, 1
  :L5
  .line 589
    if-eqz v14, :L6
    invoke-virtual { v14 }, Ljava/lang/String;->length()I
    move-result v12
    if-lez v12, :L6
    invoke-virtual { v8, v14 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L6
  .line 590
    if-eqz v15, :L7
    invoke-virtual { v15 }, Ljava/lang/String;->length()I
    move-result v12
    if-lez v12, :L7
    invoke-virtual { v9, v15 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L7
  .line 582
    add-int/lit8 v10, v10, 1
    goto :L2
  :L8
  .line 592
    const-string v10, "songs    "
    invoke-virtual { v1, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-interface { v6 }, Ljava/util/List;->size()I
    move-result v6
    invoke-virtual { v10, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 593
    const-string v6, "albums   "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v7 }, Ljava/util/HashSet;->size()I
    move-result v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, " (raw tags, before splitting)\n"
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 594
    const-string v6, "artists  "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v8 }, Ljava/util/HashSet;->size()I
    move-result v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 595
    const-string v6, "genres   "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v9 }, Ljava/util/HashSet;->size()I
    move-result v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 596
    const-string v0, "no album "
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v11 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L9
  .line 598
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 599
    if-nez v0, :L10
    move-object v0, v4
    goto :L11
  :L10
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  :L11
  .line 600
    const-string v6, "playlists "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    if-nez v0, :L12
    const-string v0, "(unavailable)"
    goto :L13
  :L12
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    invoke-static { v0 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v0
  :L13
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 601
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L14
  .line 604
    goto :L16
  :L15
  .line 602
    move-exception v0
  .line 603
    const-string v6, "(failed: "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L16
  .line 607
    if-nez p0, :L17
    move-object v0, v4
    goto :L18
  :L17
    invoke-virtual/range { p0 .. p0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L18
  .line 608
    const-string v6, "cache    covers "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
  .line 609
    if-nez v0, :L19
    move-object v7, v4
    goto :L20
  :L19
    new-instance v7, Ljava/io/File;
    const-string v8, "ipp_covers"
    invoke-direct { v7, v0, v8 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L20
  .line 608
    invoke-static { v7 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v7
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 610
    const-string v6, ", big "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
  .line 611
    if-nez v0, :L22
  :L21
    goto :L23
  :L22
    new-instance v4, Ljava/io/File;
    const-string v7, "ipp_big"
    invoke-direct { v4, v0, v7 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    goto :L21
  :L23
  .line 610
    invoke-static { v4 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v7
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 612
    const-string v0, ", all "
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/CacheSize;->total(Landroid/content/Context;)J
    move-result-wide v6
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L24
  .line 615
    goto :L26
  :L25
  .line 613
    move-exception v0
  .line 614
    const-string v4, "cache    (failed: "
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L26
  .line 617
    const-string v0, "theme    "
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v4 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 618
    new-instance v0, Ljava/io/File;
    const-string v4, "/storage/sdcard0"
    const-string v6, "Themes"
    invoke-direct { v0, v4, v6 }, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 619
    const-string v4, "installed"
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 620
    if-nez v0, :L27
  .line 621
    const-string v0, " (none)"
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L31
  :L27
  .line 623
    nop
  :L28
    array-length v4, v0
    if-ge v3, v4, :L31
  .line 624
    if-nez v3, :L29
    const-string v4, " "
    goto :L30
  :L29
    const-string v4, ", "
  :L30
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    aget-object v6, v0, v3
    invoke-virtual { v6 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v4, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 623
    add-int/lit8 v3, v3, 1
    goto :L28
  :L31
  .line 627
    invoke-virtual { v1, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L32
  .line 630
    goto :L34
  :L33
  .line 628
    move-exception v0
  .line 629
    const-string v3, "theme    (failed: "
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L34
  .line 631
    return-void
.end method

.method public static mark(Ljava/lang/String;)V
  .registers 3
  .line 212
    sput-object p0, Lcom/innioasis/ipp/Diag;->markWhat:Ljava/lang/String;
  .line 213
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Diag;->markAt:J
  .line 214
    return-void
.end method

.method private static mask(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 565
    if-eqz p0, :L3
    const-string v0, "bt_name:"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L0
    goto :L3
  :L0
  .line 566
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    add-int/lit8 v1, v1, -5
  .line 567
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-gt v1, v0, :L1
    goto :L2
  :L1
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "bt_name:\u2026:"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 565
    return-object p0
.end method

.method private static mb(J)Ljava/lang/String;
  .registers 4
  .line 497
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;
    const/4 v1, 1
    new-array v1, v1, [Ljava/lang/Object;
    long-to-float p0, p0
    const/high16 p1, 0x49800000
    div-float/2addr p0, p1
    invoke-static { p0 }, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
    move-result-object p0
    const/4 p1, 0
    aput-object p0, v1, p1
    const-string p0, "%.1f MB"
    invoke-static { v0, p0, v1 }, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static memory(Ljava/lang/StringBuilder;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  :L0
  .line 481
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
  .line 483
    invoke-static { }, Ljava/lang/System;->gc()V
  .line 484
    invoke-static { }, Ljava/lang/System;->runFinalization()V
  .line 485
    invoke-static { }, Ljava/lang/System;->gc()V
  .line 486
    invoke-virtual { v0 }, Ljava/lang/Runtime;->totalMemory()J
    move-result-wide v1
    invoke-virtual { v0 }, Ljava/lang/Runtime;->freeMemory()J
    move-result-wide v3
    sub-long/2addr v1, v3
  .line 487
    const-string v3, "heap     "
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Diag;->mb(J)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " live of "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v0 }, Ljava/lang/Runtime;->totalMemory()J
    move-result-wide v2
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Diag;->mb(J)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " (max "
  .line 488
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v0 }, Ljava/lang/Runtime;->maxMemory()J
    move-result-wide v2
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Diag;->mb(J)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ")\n"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 489
    const-string v0, "pictures big covers "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->memBytes()J
    move-result-wide v0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->mb(J)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, ", thumbnails "
  .line 490
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->memBytes()J
    move-result-wide v0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->mb(J)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, ", playlist covers "
  .line 491
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->memBytes()J
    move-result-wide v0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->mb(J)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 v0, 10
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L1
  .line 493
    goto :L3
  :L2
  .line 492
    move-exception p0
  :L3
  .line 494
    return-void
.end method

.method private static newest(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
  .catchall { :L0 .. :L7 } :L9
  .registers 10
  .line 696
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  :L1
  .line 697
    if-nez p0, :L2
    return-object v0
  :L2
  .line 698
    nop
  .line 699
    const/4 v1, 0
    move-object v2, v0
  :L3
    array-length v3, p0
    if-ge v1, v3, :L8
  .line 700
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-nez v3, :L4
    goto :L7
  :L4
  .line 701
    if-eqz p1, :L5
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3, p1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L5
    goto :L7
  :L5
  .line 702
    if-eqz v2, :L6
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/io/File;->lastModified()J
    move-result-wide v3
    invoke-virtual { v2 }, Ljava/io/File;->lastModified()J
    move-result-wide v5
    cmp-long v7, v3, v5
    if-lez v7, :L7
  :L6
    aget-object v2, p0, v1
  :L7
  .line 699
    add-int/lit8 v1, v1, 1
    goto :L3
  :L8
  .line 704
    return-object v2
  :L9
  .line 705
    move-exception p0
  .line 706
    return-object v0
.end method

.method public static note(Ljava/lang/String;)V
  .registers 4
  .line 103
    const-string v0, "ipp"
    const/4 v1, 0
    const/4 v2, 4
    invoke-static { v2, v0, p0, v1 }, Lcom/innioasis/ipp/Diag;->ring(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
  .line 104
    if-eqz p0, :L0
    const-string v0, "slow:"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
  .line 105
    invoke-static { }, Lcom/innioasis/ipp/Diag$Gc;->request()V
  .line 106
    const-string v0, "slow: frames"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Diag$Heap;->once()V
  :L0
  .line 108
    return-void
.end method

.method static on()Z
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 64
    new-instance v0, Ljava/io/File;
    const-string v1, "/storage/sdcard0/better-Y/debug_log"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v0
  :L1
    return v0
  :L2
  .line 65
    move-exception v0
  .line 66
    const/4 v0, 0
    return v0
.end method

.method private static pri(I)C
  .registers 1
  .line 243
    packed-switch p0, :L6
  .line 250
    const/16 p0, 63
    return p0
  :L0
  .line 249
    const/16 p0, 65
    return p0
  :L1
  .line 248
    const/16 p0, 69
    return p0
  :L2
  .line 247
    const/16 p0, 87
    return p0
  :L3
  .line 246
    const/16 p0, 73
    return p0
  :L4
  .line 245
    const/16 p0, 68
    return p0
  :L5
  .line 244
    const/16 p0, 86
    return p0
  :L6
  .packed-switch 2
    :L5
    :L4
    :L3
    :L2
    :L1
    :L0
  .end packed-switch
.end method

.method public static report(Landroid/content/Context;)Ljava/io/File;
  .catchall { :L0 .. :L1 } :L12
  .catchall { :L2 .. :L5 } :L12
  .catchall { :L5 .. :L6 } :L11
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L14 .. :L15 } :L16
  .registers 21
  .line 416
    move-object/from16 v0, p0
  :L0
  .line 418
    new-instance v2, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object v3
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "log_"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-static { }, Lcom/innioasis/ipp/Panel;->stamp()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, ".log"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-direct { v2, v3, v4 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 419
    new-instance v3, Ljava/lang/StringBuilder;
    const/16 v4, 8192
    invoke-direct { v3, v4 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 420
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Diag;->head(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .line 421
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Diag;->settings(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .line 422
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Diag;->library(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .line 423
    invoke-static { v3 }, Lcom/innioasis/ipp/Diag;->ringDump(Ljava/lang/StringBuilder;)V
  .line 424
    invoke-static { v3 }, Lcom/innioasis/ipp/Diag;->crashes(Ljava/lang/StringBuilder;)V
  .line 425
    invoke-static { v3 }, Lcom/innioasis/ipp/Diag;->anr(Ljava/lang/StringBuilder;)V
  .line 426
    invoke-static { }, Lcom/innioasis/ipp/Diag;->on()Z
    move-result v0
  :L1
    const/16 v4, 8
    const/4 v5, 7
    const/high16 v6, 0x00100000
    const-string v7, "main"
    const-string v8, "time"
    const/4 v9, 5
    const-string v10, "-v"
    const/4 v11, 4
    const/4 v12, 3
    const-string v13, "-b"
    const/4 v14, 2
    const-string v15, "-d"
    const/16 v16, 1
    const-string v17, "/system/bin/logcat"
    const/16 v18, 0
    const/4 v1, 6
    if-eqz v0, :L3
  :L2
  .line 427
    const-string v0, "\n--- logcat -b main -v time (whole buffer) ---\n"
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 428
    new-array v0, v1, [Ljava/lang/String;
    aput-object v17, v0, v18
    aput-object v15, v0, v16
    aput-object v13, v0, v14
    aput-object v7, v0, v12
    aput-object v10, v0, v11
    aput-object v8, v0, v9
    invoke-static { v0, v6 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L4
  :L3
  .line 433
    const-string v0, "\n--- logcat -b main -v time (whole buffer, audio output lines left out) ---\n"
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 434
    const/16 v0, 11
    new-array v0, v0, [Ljava/lang/String;
    aput-object v17, v0, v18
    aput-object v15, v0, v16
    aput-object v13, v0, v14
    aput-object v7, v0, v12
    aput-object v10, v0, v11
    aput-object v8, v0, v9
    const-string v7, "AudioFlinger:S"
    aput-object v7, v0, v1
    const-string v7, "AudioMTKStreamOut:S"
    aput-object v7, v0, v5
    const-string v7, "AudioTrack:S"
    aput-object v7, v0, v4
    const-string v7, "AudioMTKPolicyManager:S"
    const/16 v19, 9
    aput-object v7, v0, v19
    const-string v7, "*:V"
    const/16 v19, 10
    aput-object v7, v0, v19
    invoke-static { v0, v6 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L4
  .line 438
    const-string v0, "\n--- logcat -b system -v time (tail 300) ---\n"
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 439
    new-array v0, v4, [Ljava/lang/String;
    aput-object v17, v0, v18
    aput-object v15, v0, v16
    aput-object v13, v0, v14
    const-string v4, "system"
    aput-object v4, v0, v12
    aput-object v10, v0, v11
    aput-object v8, v0, v9
    const-string v4, "-t"
    aput-object v4, v0, v1
    const-string v1, "300"
    aput-object v1, v0, v5
    const/high16 v1, 0x00040000
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 442
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, v2 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L5
  .line 443
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v3, "UTF-8"
    invoke-virtual { v0, v3 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 444
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->flush()V
  .line 445
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/FileDescriptor;->sync()V
  :L6
  .line 446
    nop
  :L7
  .line 451
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L8
  .line 453
    goto :L10
  :L9
  .line 452
    move-exception v0
  :L10
  .line 446
    return-object v2
  :L11
  .line 447
    move-exception v0
    goto :L13
  :L12
    move-exception v0
    const/4 v1, 0
  :L13
  .line 448
    nop
  .line 451
    if-eqz v1, :L17
  :L14
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L15
    goto :L17
  :L16
  .line 452
    move-exception v0
    goto :L18
  :L17
  .line 453
    nop
  :L18
  .line 448
    const/4 v1, 0
    return-object v1
.end method

.method public static declared-synchronized ring(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Diag;
    monitor-enter v0
  :L0
  .line 88
    sget-boolean v1, Lcom/innioasis/ipp/Diag;->armed:Z
    if-nez v1, :L1
    invoke-static { }, Lcom/innioasis/ipp/Diag;->arm()V
  :L1
  .line 89
    sget v1, Lcom/innioasis/ipp/Diag;->ringN:I
    rem-int/lit16 v1, v1, 2000
  .line 90
    sget-object v2, Lcom/innioasis/ipp/Diag;->ringWhen:[J
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v3
    aput-wide v3, v2, v1
  .line 91
    sget-object v2, Lcom/innioasis/ipp/Diag;->ringPri:[I
    aput p0, v2, v1
  .line 92
    sget-object p0, Lcom/innioasis/ipp/Diag;->ringTag:[Ljava/lang/String;
    aput-object p1, p0, v1
  .line 94
    sget-object p0, Lcom/innioasis/ipp/Diag;->ringMsg:[Ljava/lang/String;
    if-nez p3, :L2
    goto :L3
  :L2
  .line 95
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const/16 p2, 10
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-static { p3 }, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p2
  :L3
    aput-object p2, p0, v1
  .line 96
    sget p0, Lcom/innioasis/ipp/Diag;->ringN:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Diag;->ringN:I
  :L4
  .line 98
    goto :L6
  :L5
  .line 97
    move-exception p0
  :L6
  .line 99
    monitor-exit v0
    return-void
.end method

.method private static declared-synchronized ringDump(Ljava/lang/StringBuilder;)V
  .catchall { :L0 .. :L3 } :L10
  .catchall { :L4 .. :L8 } :L10
  .registers 12
    const-class v0, Lcom/innioasis/ipp/Diag;
    monitor-enter v0
  :L0
  .line 225
    sget v1, Lcom/innioasis/ipp/Diag;->ringN:I
    const/16 v2, 2000
    if-ge v1, v2, :L1
    goto :L2
  :L1
    const/16 v1, 2000
  :L2
  .line 226
    const-string v3, "\n--- app log (last "
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " of "
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    sget v4, Lcom/innioasis/ipp/Diag;->ringN:I
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " since start) ---\n"
  .line 227
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 228
    if-gtz v1, :L4
  .line 229
    const-string v1, "(empty)\n"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L3
  .line 230
    monitor-exit v0
    return-void
  :L4
  .line 232
    new-instance v3, Ljava/text/SimpleDateFormat;
    const-string v4, "MM-dd HH:mm:ss.SSS"
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v3, v4, v5 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
  .line 233
    sget v4, Lcom/innioasis/ipp/Diag;->ringN:I
    const/4 v5, 0
    if-ge v4, v2, :L5
    const/4 v4, 0
    goto :L6
  :L5
    rem-int/2addr v4, v2
  :L6
  .line 234
    nop
  :L7
    if-ge v5, v1, :L9
  .line 235
    add-int v6, v4, v5
    rem-int/2addr v6, v2
  .line 236
    new-instance v7, Ljava/util/Date;
    sget-object v8, Lcom/innioasis/ipp/Diag;->ringWhen:[J
    aget-wide v9, v8, v6
    invoke-direct { v7, v9, v10 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { v3, v7 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { p0, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    const/16 v8, 32
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v7
    sget-object v8, Lcom/innioasis/ipp/Diag;->ringPri:[I
    aget v8, v8, v6
    invoke-static { v8 }, Lcom/innioasis/ipp/Diag;->pri(I)C
    move-result v8
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v7
  .line 237
    const/16 v8, 47
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v7
    sget-object v8, Lcom/innioasis/ipp/Diag;->ringTag:[Ljava/lang/String;
    aget-object v8, v8, v6
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v8, ": "
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    sget-object v8, Lcom/innioasis/ipp/Diag;->ringMsg:[Ljava/lang/String;
    aget-object v6, v8, v6
    invoke-virtual { v7, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const/16 v7, 10
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L8
  .line 234
    add-int/lit8 v5, v5, 1
    goto :L7
  :L9
  .line 239
    monitor-exit v0
    return-void
  :L10
  .line 224
    move-exception p0
    monitor-exit v0
    goto :L12
  :L11
    throw p0
  :L12
    goto :L11
.end method

.method public static save(Landroid/app/Activity;)V
  .registers 3
  .line 368
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Diag$Save;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Diag$Save;-><init>(Landroid/app/Activity;)V
    const-string p0, "ipp-diag"
    invoke-direct { v0, v1, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 369
    const/4 p0, 1
    invoke-virtual { v0, p0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 370
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 371
    return-void
.end method

.method private static set(Z)Z
  .catchall { :L0 .. :L5 } :L8
  .registers 5
  .line 356
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/File;
    const-string v2, "/storage/sdcard0/better-Y/debug_log"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 357
    const/4 v2, 1
    if-nez p0, :L3
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L1
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
    move-result p0
    if-eqz p0, :L2
  :L1
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 358
    invoke-virtual { v1 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
  .line 359
    if-eqz p0, :L4
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v3
    if-nez v3, :L4
    invoke-virtual { p0 }, Ljava/io/File;->mkdirs()Z
  :L4
  .line 360
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result p0
    if-nez p0, :L6
    invoke-virtual { v1 }, Ljava/io/File;->createNewFile()Z
    move-result p0
  :L5
    if-eqz p0, :L7
  :L6
    const/4 v0, 1
  :L7
    return v0
  :L8
  .line 361
    move-exception p0
  .line 362
    return v0
.end method

.method private static settings(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 10
  .line 536
    const-string v0, ")\n"
    const-string v1, "\n--- better-Y settings ---\n"
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L0
  .line 538
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->all(Landroid/content/Context;)Ljava/util/Map;
    move-result-object p0
  .line 539
    if-eqz p0, :L7
    invoke-interface { p0 }, Ljava/util/Map;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto/16 :L7
  :L1
  .line 543
    new-instance v1, Ljava/util/ArrayList;
    invoke-interface { p0 }, Ljava/util/Map;->keySet()Ljava/util/Set;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 544
    invoke-static { v1 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
  .line 545
    nop
  .line 546
    invoke-interface { v1 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v1
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L6
  .line 547
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 548
    if-nez v4, :L3
    goto :L2
  :L3
  .line 549
    const-string v5, "like:"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L4
  .line 550
    add-int/lit8 v3, v3, 1
  .line 551
    goto :L2
  :L4
  .line 553
    invoke-interface { p0, v4 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    invoke-static { v5 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v5
  .line 554
    invoke-virtual { v5 }, Ljava/lang/String;->length()I
    move-result v6
    const/16 v7, 120
    if-le v6, v7, :L5
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v5, v2, v7 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v6, "\u2026"
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
  :L5
  .line 555
    invoke-static { v4 }, Lcom/innioasis/ipp/Diag;->mask(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { p1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v6, " = "
    invoke-virtual { v4, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const/16 v5, 10
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 556
    goto :L2
  :L6
  .line 557
    const-string p0, "(liked songs: "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 560
    goto :L10
  :L7
  .line 540
    const-string p0, "(none)\n"
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L8
  .line 541
    return-void
  :L9
  .line 558
    move-exception p0
  .line 559
    const-string v1, "(failed: "
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L10
  .line 561
    return-void
.end method

.method public static slow(Ljava/lang/String;J)V
  .registers 6
  .line 203
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sub-long/2addr v0, p1
  .line 204
    const-wide/16 p1, 200
    cmp-long v2, v0, p1
    if-ltz v2, :L0
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string p2, "slow: "
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 p1, 32
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, " ms"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L0
  .line 205
    return-void
.end method

.method private static space(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L2 } :L3
  .registers 8
  :L0
  .line 522
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 523
    invoke-virtual { v0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-nez v0, :L1
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " \u2014 missing"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 524
    new-instance v0, Landroid/os/StatFs;
    invoke-direct { v0, p0 }, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V
  .line 525
    invoke-virtual { v0 }, Landroid/os/StatFs;->getBlockSize()I
    move-result v1
    int-to-long v1, v1
  .line 526
    invoke-virtual { v0 }, Landroid/os/StatFs;->getAvailableBlocks()I
    move-result v3
    int-to-long v3, v3
    mul-long v3, v3, v1
  .line 527
    invoke-virtual { v0 }, Landroid/os/StatFs;->getBlockCount()I
    move-result v0
    int-to-long v5, v0
    mul-long v1, v1, v5
  .line 528
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v5, " free "
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, " of "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 529
    move-exception v0
  .line 530
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " \u2014 unreadable"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static spill(Ljava/lang/String;Ljava/lang/Throwable;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 9
  .line 283
    const-string v0, "crash_"
  :L0
    new-instance v1, Ljava/lang/StringBuilder;
    const/16 v2, 8192
    invoke-direct { v1, v2 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 284
    const-string v2, "better-Y "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-object v3, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v3 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Panel;->version(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 285
    const/16 v3, 10
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 286
    const-string v2, "when     "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    new-instance v4, Ljava/text/SimpleDateFormat;
    const-string v5, "yyyy-MM-dd HH:mm:ss"
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v4, v5, v6 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v5, Ljava/util/Date;
    invoke-direct { v5 }, Ljava/util/Date;-><init>()V
  .line 287
    invoke-virtual { v4, v5 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v4
  .line 286
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 287
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 288
    const-string v2, "reason   "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 289
    if-eqz p1, :L1
  .line 290
    const-string p0, "\n--- stack ---\n"
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { p1 }, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 291
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L1
  .line 293
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->ringDump(Ljava/lang/StringBuilder;)V
  .line 294
    new-instance p0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object p1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-static { }, Lcom/innioasis/ipp/Panel;->stamp()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ".log"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-direct { p0, p1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Diag;->write(Ljava/io/File;Ljava/lang/String;)V
  .line 295
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object p0
    const/4 p1, 5
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Diag;->keepNewest(Ljava/io/File;Ljava/lang/String;I)V
  :L2
  .line 297
    goto :L4
  :L3
  .line 296
    move-exception p0
  :L4
  .line 298
    return-void
.end method

.method private static tail(Ljava/io/File;I)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L15
  .catchall { :L1 .. :L4 } :L14
  .catchall { :L4 .. :L5 } :L6
  .catchall { :L9 .. :L10 } :L14
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L16 .. :L17 } :L23
  .catchall { :L18 .. :L19 } :L20
  .catchall { :L24 .. :L25 } :L26
  .registers 8
  .line 712
    nop
  .line 714
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/RandomAccessFile;
    const-string v2, "r"
    invoke-direct { v1, p0, v2 }, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L1
  .line 715
    invoke-virtual { v1 }, Ljava/io/RandomAccessFile;->length()J
    move-result-wide v2
  .line 716
    int-to-long p0, p1
    const-wide/16 v4, 0
    cmp-long v0, v2, p0
    if-lez v0, :L2
    sub-long p0, v2, p0
    goto :L3
  :L2
    move-wide p0, v4
  :L3
  .line 717
    invoke-virtual { v1, p0, p1 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 718
    sub-long/2addr v2, p0
    long-to-int v0, v2
    new-array v0, v0, [B
  .line 719
    invoke-virtual { v1, v0 }, Ljava/io/RandomAccessFile;->readFully([B)V
  .line 720
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v0, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
  .line 721
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L8
    const-string p0, "(empty)\n"
  :L4
  .line 727
    invoke-virtual { v1 }, Ljava/io/RandomAccessFile;->close()V
  :L5
  .line 729
    goto :L7
  :L6
  .line 728
    move-exception p1
  :L7
  .line 721
    return-object p0
  :L8
  .line 722
    cmp-long v0, p0, v4
    if-lez v0, :L10
  :L9
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "(\u2026 "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0, p1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, " earlier bytes skipped)\n"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  :L10
  .line 727
    invoke-virtual { v1 }, Ljava/io/RandomAccessFile;->close()V
  :L11
  .line 729
    goto :L13
  :L12
  .line 728
    move-exception p0
  :L13
  .line 722
    return-object v2
  :L14
  .line 723
    move-exception p0
    move-object v0, v1
    goto :L16
  :L15
    move-exception p0
  :L16
  .line 724
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "(unreadable: "
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, ")\n"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L17
  .line 727
    if-eqz v0, :L21
  :L18
    invoke-virtual { v0 }, Ljava/io/RandomAccessFile;->close()V
  :L19
    goto :L21
  :L20
  .line 728
    move-exception p1
    goto :L22
  :L21
  .line 729
    nop
  :L22
  .line 724
    return-object p0
  :L23
  .line 726
    move-exception p0
  .line 727
    if-eqz v0, :L27
  :L24
    invoke-virtual { v0 }, Ljava/io/RandomAccessFile;->close()V
  :L25
    goto :L27
  :L26
  .line 728
    move-exception p1
    goto :L28
  :L27
  .line 729
    nop
  :L28
  .line 730
    throw p0
.end method

.method private static toast(Landroid/content/Context;I)V
  .registers 2
  .line 734
    if-nez p0, :L0
    return-void
  :L0
  .line 735
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Diag;->toast(Landroid/content/Context;Ljava/lang/String;)V
  .line 736
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 3
  .line 741
    if-eqz p0, :L8
    if-nez p1, :L0
    goto :L8
  :L0
  .line 742
    const/4 v0, 1
  :L1
    invoke-static { p0, p1, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
  .line 743
    invoke-virtual { p0 }, Landroid/widget/Toast;->getView()Landroid/view/View;
    move-result-object p1
  .line 744
    if-nez p1, :L2
    const/4 p1, 0
    goto :L3
  :L2
    const v0, 16908299
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  :L3
  .line 745
    instance-of v0, p1, Landroid/widget/TextView;
    if-eqz v0, :L4
  .line 746
    check-cast p1, Landroid/widget/TextView;
    const/16 v0, 17
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setGravity(I)V
  :L4
  .line 748
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L5
  .line 750
    goto :L7
  :L6
  .line 749
    move-exception p0
  :L7
  .line 751
    return-void
  :L8
  .line 741
    return-void
.end method

.method private static tombstones()Ljava/io/File;
  .catchall { :L0 .. :L1 } :L3
  .catchall { :L5 .. :L7 } :L9
  .registers 4
  :L0
  .line 669
    invoke-static { }, Lxcrash/XCrash;->getLogDir()Ljava/lang/String;
    move-result-object v0
  .line 670
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L2
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, v0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  :L1
    return-object v1
  :L2
  .line 672
    goto :L4
  :L3
  .line 671
    move-exception v0
  :L4
  .line 674
    const/4 v0, 0
  :L5
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 675
    if-nez v1, :L6
    goto :L8
  :L6
    new-instance v2, Ljava/io/File;
    invoke-virtual { v1 }, Landroid/content/Context;->getFilesDir()Ljava/io/File;
    move-result-object v1
    const-string v3, "tombstones"
    invoke-direct { v2, v1, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L7
    move-object v0, v2
  :L8
    return-object v0
  :L9
  .line 676
    move-exception v1
  .line 677
    return-object v0
.end method

.method private static write(Ljava/io/File;Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L1 .. :L2 } :L3
  .catchall { :L2 .. :L6 } :L7
  .registers 4
  .line 301
    nop
  .line 303
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L1
  .line 304
    const-string p0, "UTF-8"
    invoke-virtual { p1, p0 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 305
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->flush()V
  .line 306
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/io/FileDescriptor;->sync()V
  :L2
  .line 310
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
    goto :L8
  :L3
  .line 307
    move-exception p0
    move-object v0, v1
    goto :L5
  :L4
    move-exception p0
  :L5
  .line 310
    if-eqz v0, :L8
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L6
    goto :L8
  :L7
  .line 311
    move-exception p0
  .line 313
    goto :L9
  :L8
  .line 312
    nop
  :L9
  .line 314
    return-void
.end method

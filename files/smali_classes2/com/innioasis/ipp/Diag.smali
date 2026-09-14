.class public final Lcom/innioasis/ipp/Diag;
.super Ljava/lang/Object;
.source "Diag.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
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

.field final static MARK:Ljava/lang/String; = "/storage/sdcard0/better-Y/debug_log"

.field private final static RING:I = 2000

.field private final static STALE_MS:J = 172800000L

.field private final static TAPS:I = 5

.field private static armed:Z

.field private static lastTap:J

.field private static prev:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private final static ringMsg:[Ljava/lang/String;

.field private static ringN:I

.field private final static ringPri:[I

.field private final static ringTag:[Ljava/lang/String;

.field private final static ringWhen:[J

.field private static taps:I

.method static constructor <clinit>()V
  .registers 2
  .line 124
    const/16 v0, 2000
    new-array v1, v0, [J
    sput-object v1, Lcom/innioasis/ipp/Diag;->ringWhen:[J
  .line 125
    new-array v1, v0, [I
    sput-object v1, Lcom/innioasis/ipp/Diag;->ringPri:[I
  .line 126
    new-array v1, v0, [Ljava/lang/String;
    sput-object v1, Lcom/innioasis/ipp/Diag;->ringTag:[Ljava/lang/String;
  .line 127
    new-array v0, v0, [Ljava/lang/String;
    sput-object v0, Lcom/innioasis/ipp/Diag;->ringMsg:[Ljava/lang/String;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 56
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static about(Landroid/app/Activity;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 9
  :L0
  .line 313
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 314
    sget-wide v2, Lcom/innioasis/ipp/Diag;->lastTap:J
    sub-long v2, v0, v2
    const-wide/16 v4, 2000
    const/4 v6, 0
    cmp-long v7, v2, v4
    if-lez v7, :L1
    sput v6, Lcom/innioasis/ipp/Diag;->taps:I
  :L1
  .line 315
    sput-wide v0, Lcom/innioasis/ipp/Diag;->lastTap:J
  .line 316
    sget v0, Lcom/innioasis/ipp/Diag;->taps:I
    const/4 v1, 1
    add-int/2addr v0, v1
    sput v0, Lcom/innioasis/ipp/Diag;->taps:I
    const/4 v2, 5
    if-ge v0, v2, :L2
    return-void
  :L2
  .line 317
    sput v6, Lcom/innioasis/ipp/Diag;->taps:I
  .line 318
    invoke-static { }, Lcom/innioasis/ipp/Diag;->on()Z
    move-result v0
    if-nez v0, :L3
    const/4 v6, 1
  :L3
  .line 319
    invoke-static { v6 }, Lcom/innioasis/ipp/Diag;->set(Z)Z
    move-result v0
    if-nez v0, :L4
    return-void
  :L4
  .line 320
    if-eqz v6, :L5
    const v0, 2131821115
    goto :L6
  :L5
    const v0, 2131821116
  :L6
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Diag;->toast(Landroid/content/Context;I)V
  :L7
  .line 323
    goto :L9
  :L8
  .line 321
    move-exception p0
  :L9
  .line 324
    return-void
.end method

.method static synthetic access$000()Ljava/lang/Thread$UncaughtExceptionHandler;
  .registers 1
  .line 54
    sget-object v0, Lcom/innioasis/ipp/Diag;->prev:Ljava/lang/Thread$UncaughtExceptionHandler;
    return-object v0
.end method

.method static synthetic access$100(Landroid/content/Context;I)V
  .registers 2
  .line 54
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Diag;->toast(Landroid/content/Context;I)V
    return-void
.end method

.method static synthetic access$200(Landroid/content/Context;Ljava/lang/String;)V
  .registers 2
  .line 54
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Diag;->toast(Landroid/content/Context;Ljava/lang/String;)V
    return-void
.end method

.method private static anr(Ljava/lang/StringBuilder;)V
  .registers 7
  .line 642
    const-string v0, "\n--- /data/anr/traces.txt (tail) ---\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 643
    new-instance v0, Ljava/io/File;
    const-string v1, "/data/anr/traces.txt"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 644
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v1
    if-nez v1, :L0
  .line 645
    const-string v0, "(none)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 646
    return-void
  :L0
  .line 648
    const-string v1, "written "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    new-instance v2, Ljava/text/SimpleDateFormat;
    const-string v3, "yyyy-MM-dd HH:mm:ss"
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v2, v3, v4 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v3, Ljava/util/Date;
  .line 649
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v4
    invoke-direct { v3, v4, v5 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { v2, v3 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v2
  .line 648
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 649
    const/16 v2, 10
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 650
    const/high16 v1, 0x00010000
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->tail(Ljava/io/File;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 651
    return-void
.end method

.method private static arm()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 215
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Diag;->armed:Z
  :L0
  .line 217
    invoke-static { }, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Diag;->prev:Ljava/lang/Thread$UncaughtExceptionHandler;
  .line 218
    new-instance v0, Lcom/innioasis/ipp/Diag$Crash;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Diag$Crash;-><init>()V
    invoke-static { v0 }, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V
  :L1
  .line 221
    goto :L3
  :L2
  .line 219
    move-exception v0
  :L3
  .line 222
    return-void
.end method

.method private static crashes(Ljava/lang/StringBuilder;)V
  .registers 11
  .line 590
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object v0
    const-string v1, "crash_"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->newest(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 591
    const-string v1, "\n--- last crash log the app saved before dying ---\n"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 592
    const/high16 v1, 0x00010000
    const/16 v2, 10
    const-string v3, "yyyy-MM-dd HH:mm:ss"
    const-string v4, ", "
    if-nez v0, :L0
  .line 593
    const-string v0, "(none since the card was last cleared)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L1
  :L0
  .line 595
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
  .line 596
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v8
    invoke-direct { v7, v8, v9 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { v6, v7 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v6
  .line 595
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
  .line 597
    invoke-virtual { v5, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->tail(Ljava/io/File;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v5, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L1
  .line 599
    const-string v0, "\n--- last xCrash tombstone ---\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 600
    invoke-static { }, Lcom/innioasis/ipp/Diag;->tombstones()Ljava/io/File;
    move-result-object v0
    const/4 v5, 0
    invoke-static { v0, v5 }, Lcom/innioasis/ipp/Diag;->newest(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 601
    if-nez v0, :L2
  .line 602
    const-string v0, "(none)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L4
  :L2
  .line 604
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v5
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v7
    sub-long/2addr v5, v7
  .line 605
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
  .line 606
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v8
    invoke-direct { v3, v8, v9 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { v7, v3 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v3
  .line 605
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
  .line 606
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 611
    const-wide/32 v2, 172800000
    cmp-long v4, v5, v2
    if-lez v4, :L3
  .line 612
    const-string v0, "(older than "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-wide/16 v0, 48
    invoke-virtual { p0, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 613
    const-string v0, " h, not included -- ask for the file itself if it matters)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L4
  :L3
  .line 615
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->tail(Ljava/io/File;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L4
  .line 618
    return-void
.end method

.method private static head(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .registers 6
  .line 425
    const-string v0, "better-Y "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-static { p0 }, Lcom/innioasis/ipp/Panel;->version(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 v0, 10
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 426
    const-string p0, "when     "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    new-instance v1, Ljava/text/SimpleDateFormat;
    const-string v2, "yyyy-MM-dd HH:mm:ss"
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v1, v2, v3 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v2, Ljava/util/Date;
    invoke-direct { v2 }, Ljava/util/Date;-><init>()V
  .line 427
    invoke-virtual { v1, v2 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v1
  .line 426
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 427
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 428
    const-string p0, "uptime   "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v1
    invoke-virtual { p0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " ms\n"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 429
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
  .line 430
    const-string v1, " sdk "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 431
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
  .line 432
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 433
    const-string p0, "locale   "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Ljava/util/Locale;->getDefault()Ljava/util/Locale;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 434
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
  .line 435
    const-string p0, "usb      "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Lcom/innioasis/ipp/Panel;->usb()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 436
    const-string p0, "card     "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, "/storage/sdcard0"
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->space(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 437
    const-string p0, "internal "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, "/storage/sdcard1"
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->space(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 438
    const-string p0, "data     "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, "/data"
    invoke-static { p1 }, Lcom/innioasis/ipp/Diag;->space(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 439
    return-void
.end method

.method static keepNewest(Ljava/io/File;Ljava/lang/String;I)V
  .catchall { :L0 .. :L6 } :L9
  .registers 7
  :L0
  .line 284
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  .line 285
    if-eqz p0, :L8
    array-length v0, p0
    if-gt v0, p2, :L1
    goto :L8
  :L1
  .line 286
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 287
    const/4 v1, 0
    const/4 v2, 0
  :L2
    array-length v3, p0
    if-ge v2, v3, :L4
  .line 288
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
  .line 287
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 291
    new-instance p0, Lcom/innioasis/ipp/Diag$NameCmp;
    invoke-direct { p0 }, Lcom/innioasis/ipp/Diag$NameCmp;-><init>()V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 292
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
  .line 295
    goto :L10
  :L8
  .line 285
    return-void
  :L9
  .line 293
    move-exception p0
  :L10
  .line 296
    return-void
.end method

.method private static library(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .catchall { :L0 .. :L14 } :L15
  .catchall { :L17 .. :L24 } :L25
  .catchall { :L26 .. :L32 } :L33
  .registers 18
  .line 508
    move-object/from16 v1, p1
    const-string v0, " (raw tags)\n"
    const-string v2, ")\n"
    const-string v3, "\n--- library ---\n"
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 510
    const/4 v3, 0
    const/4 v4, 0
    const/16 v5, 10
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v6
  .line 511
    if-nez v6, :L1
  .line 512
    const-string v0, "songs    (unavailable)\n"
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto/16 :L9
  :L1
  .line 514
    new-instance v7, Ljava/util/HashSet;
    invoke-direct { v7 }, Ljava/util/HashSet;-><init>()V
  .line 515
    new-instance v8, Ljava/util/HashSet;
    invoke-direct { v8 }, Ljava/util/HashSet;-><init>()V
  .line 516
    new-instance v9, Ljava/util/HashSet;
    invoke-direct { v9 }, Ljava/util/HashSet;-><init>()V
  .line 517
    nop
  .line 518
    const/4 v10, 0
    const/4 v11, 0
  :L2
    invoke-interface { v6 }, Ljava/util/List;->size()I
    move-result v12
    if-ge v10, v12, :L8
  .line 519
    invoke-interface { v6, v10 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Lcom/innioasis/y1/database/Song;
  .line 520
    if-nez v12, :L3
    goto :L7
  :L3
  .line 521
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v13
  .line 522
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v14
  .line 523
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v15
  .line 524
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
  .line 525
    if-eqz v14, :L6
    invoke-virtual { v14 }, Ljava/lang/String;->length()I
    move-result v12
    if-lez v12, :L6
    invoke-virtual { v8, v14 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L6
  .line 526
    if-eqz v15, :L7
    invoke-virtual { v15 }, Ljava/lang/String;->length()I
    move-result v12
    if-lez v12, :L7
    invoke-virtual { v9, v15 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L7
  .line 518
    add-int/lit8 v10, v10, 1
    goto :L2
  :L8
  .line 528
    const-string v10, "songs    "
    invoke-virtual { v1, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-interface { v6 }, Ljava/util/List;->size()I
    move-result v6
    invoke-virtual { v10, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 529
    const-string v6, "albums   "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v7 }, Ljava/util/HashSet;->size()I
    move-result v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, " (raw tags, before splitting)\n"
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 530
    const-string v6, "artists  "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v8 }, Ljava/util/HashSet;->size()I
    move-result v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 531
    const-string v6, "genres   "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v9 }, Ljava/util/HashSet;->size()I
    move-result v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 532
    const-string v0, "no album "
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v11 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L9
  .line 534
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 535
    if-nez v0, :L10
    move-object v0, v4
    goto :L11
  :L10
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  :L11
  .line 536
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
  .line 537
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L14
  .line 540
    goto :L16
  :L15
  .line 538
    move-exception v0
  .line 539
    const-string v6, "(failed: "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L16
  .line 545
    if-nez p0, :L17
    move-object v0, v4
    goto :L18
  :L17
    invoke-virtual/range { p0 .. p0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L18
  .line 546
    const-string v6, "cache    covers "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
  .line 547
    if-nez v0, :L19
    move-object v7, v4
    goto :L20
  :L19
    new-instance v7, Ljava/io/File;
    const-string v8, "ipp_covers"
    invoke-direct { v7, v0, v8 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L20
  .line 546
    invoke-static { v7 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v7
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 548
    const-string v6, ", big "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
  .line 549
    if-nez v0, :L22
  :L21
    goto :L23
  :L22
    new-instance v4, Ljava/io/File;
    const-string v7, "ipp_big"
    invoke-direct { v4, v0, v7 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    goto :L21
  :L23
  .line 548
    invoke-static { v4 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v7
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 550
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
  .line 553
    goto :L26
  :L25
  .line 551
    move-exception v0
  .line 552
    const-string v4, "cache    (failed: "
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L26
  .line 555
    const-string v0, "theme    "
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v4 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 556
    new-instance v0, Ljava/io/File;
    const-string v4, "/storage/sdcard0"
    const-string v6, "Themes"
    invoke-direct { v0, v4, v6 }, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 557
    const-string v4, "installed"
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 558
    if-nez v0, :L27
  .line 559
    const-string v0, " (none)"
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L31
  :L27
  .line 561
    nop
  :L28
    array-length v4, v0
    if-ge v3, v4, :L31
  .line 562
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
  .line 561
    add-int/lit8 v3, v3, 1
    goto :L28
  :L31
  .line 565
    invoke-virtual { v1, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L32
  .line 568
    goto :L34
  :L33
  .line 566
    move-exception v0
  .line 567
    const-string v3, "theme    (failed: "
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L34
  .line 569
    return-void
.end method

.method private static mask(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 496
    if-eqz p0, :L3
    const-string v0, "bt_name:"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L0
    goto :L3
  :L0
  .line 497
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    add-int/lit8 v1, v1, -5
  .line 498
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
  .line 496
    return-object p0
.end method

.method private static newest(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
  .catchall { :L0 .. :L7 } :L9
  .registers 10
  .line 656
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  :L1
  .line 657
    if-nez p0, :L2
    return-object v0
  :L2
  .line 658
    nop
  .line 659
    const/4 v1, 0
    move-object v2, v0
  :L3
    array-length v3, p0
    if-ge v1, v3, :L8
  .line 660
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-nez v3, :L4
    goto :L7
  :L4
  .line 661
    if-eqz p1, :L5
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3, p1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L5
    goto :L7
  :L5
  .line 662
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
  .line 659
    add-int/lit8 v1, v1, 1
    goto :L3
  :L8
  .line 664
    return-object v2
  :L9
  .line 665
    move-exception p0
  .line 666
    return-object v0
.end method

.method public static note(Ljava/lang/String;)V
  .registers 4
  .line 163
    const-string v0, "ipp"
    const/4 v1, 0
    const/4 v2, 4
    invoke-static { v2, v0, p0, v1 }, Lcom/innioasis/ipp/Diag;->ring(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
  .line 164
    return-void
.end method

.method static on()Z
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 87
    new-instance v0, Ljava/io/File;
    const-string v1, "/storage/sdcard0/better-Y/debug_log"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v0
  :L1
    return v0
  :L2
  .line 88
    move-exception v0
  .line 89
    const/4 v0, 0
    return v0
.end method

.method private static pri(I)C
  .registers 1
  .line 186
    packed-switch p0, :L6
  .line 193
    const/16 p0, 63
    return p0
  :L0
  .line 192
    const/16 p0, 65
    return p0
  :L1
  .line 191
    const/16 p0, 69
    return p0
  :L2
  .line 190
    const/16 p0, 87
    return p0
  :L3
  .line 189
    const/16 p0, 73
    return p0
  :L4
  .line 188
    const/16 p0, 68
    return p0
  :L5
  .line 187
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
  .catchall { :L0 .. :L1 } :L8
  .catchall { :L1 .. :L2 } :L7
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L10 .. :L11 } :L12
  .registers 21
  .line 391
    move-object/from16 v0, p0
    const-string v1, "-t"
    const-string v2, "time"
    const-string v3, "-v"
    const-string v4, "-b"
    const-string v5, "-d"
    const-string v6, "/system/bin/logcat"
  :L0
  .line 393
    new-instance v8, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object v9
    new-instance v10, Ljava/lang/StringBuilder;
    invoke-direct { v10 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v11, "log_"
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-static { }, Lcom/innioasis/ipp/Panel;->stamp()Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    const-string v11, ".log"
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-virtual { v10 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v10
    invoke-direct { v8, v9, v10 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 394
    new-instance v9, Ljava/lang/StringBuilder;
    const/16 v10, 8192
    invoke-direct { v9, v10 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 395
    invoke-static { v0, v9 }, Lcom/innioasis/ipp/Diag;->head(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .line 396
    invoke-static { v0, v9 }, Lcom/innioasis/ipp/Diag;->settings(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .line 397
    invoke-static { v0, v9 }, Lcom/innioasis/ipp/Diag;->library(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .line 398
    invoke-static { v9 }, Lcom/innioasis/ipp/Diag;->ringDump(Ljava/lang/StringBuilder;)V
  .line 399
    invoke-static { v9 }, Lcom/innioasis/ipp/Diag;->crashes(Ljava/lang/StringBuilder;)V
  .line 400
    invoke-static { v9 }, Lcom/innioasis/ipp/Diag;->anr(Ljava/lang/StringBuilder;)V
  .line 401
    const-string v0, "\n--- logcat -b main -v time (tail 800) ---\n"
    invoke-virtual { v9, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 402
    const/16 v0, 8
    new-array v10, v0, [Ljava/lang/String;
    const/4 v11, 0
    aput-object v6, v10, v11
    const/4 v12, 1
    aput-object v5, v10, v12
    const/4 v13, 2
    aput-object v4, v10, v13
    const-string v14, "main"
    const/4 v15, 3
    aput-object v14, v10, v15
    const/4 v14, 4
    aput-object v3, v10, v14
    const/16 v16, 5
    aput-object v2, v10, v16
    const/16 v17, 6
    aput-object v1, v10, v17
    const-string v18, "800"
    const/16 v19, 7
    aput-object v18, v10, v19
    const/high16 v7, 0x00040000
    invoke-static { v10, v7 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v9, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 404
    const-string v10, "\n--- logcat -b system -v time (tail 300) ---\n"
    invoke-virtual { v9, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 405
    new-array v0, v0, [Ljava/lang/String;
    aput-object v6, v0, v11
    aput-object v5, v0, v12
    aput-object v4, v0, v13
    const-string v4, "system"
    aput-object v4, v0, v15
    aput-object v3, v0, v14
    aput-object v2, v0, v16
    aput-object v1, v0, v17
    const-string v1, "300"
    aput-object v1, v0, v19
    invoke-static { v0, v7 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v9, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 408
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, v8 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L1
  .line 409
    invoke-virtual { v9 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v2, "UTF-8"
    invoke-virtual { v0, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 410
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->flush()V
  .line 411
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/FileDescriptor;->sync()V
  :L2
  .line 412
    nop
  :L3
  .line 417
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L4
  .line 420
    goto :L6
  :L5
  .line 418
    move-exception v0
  :L6
  .line 412
    return-object v8
  :L7
  .line 413
    move-exception v0
    goto :L9
  :L8
    move-exception v0
    const/4 v1, 0
  :L9
  .line 414
    nop
  .line 417
    if-eqz v1, :L13
  :L10
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L11
    goto :L13
  :L12
  .line 418
    move-exception v0
    goto :L14
  :L13
  .line 420
    nop
  :L14
  .line 414
    const/4 v1, 0
    return-object v1
.end method

.method public static declared-synchronized ring(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Diag;
    monitor-enter v0
  :L0
  .line 139
    sget-boolean v1, Lcom/innioasis/ipp/Diag;->armed:Z
    if-nez v1, :L1
    invoke-static { }, Lcom/innioasis/ipp/Diag;->arm()V
  :L1
  .line 140
    sget v1, Lcom/innioasis/ipp/Diag;->ringN:I
    rem-int/lit16 v1, v1, 2000
  .line 141
    sget-object v2, Lcom/innioasis/ipp/Diag;->ringWhen:[J
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v3
    aput-wide v3, v2, v1
  .line 142
    sget-object v2, Lcom/innioasis/ipp/Diag;->ringPri:[I
    aput p0, v2, v1
  .line 143
    sget-object p0, Lcom/innioasis/ipp/Diag;->ringTag:[Ljava/lang/String;
    aput-object p1, p0, v1
  .line 147
    sget-object p0, Lcom/innioasis/ipp/Diag;->ringMsg:[Ljava/lang/String;
    if-nez p3, :L2
    goto :L3
  :L2
  .line 148
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
  .line 149
    sget p0, Lcom/innioasis/ipp/Diag;->ringN:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Diag;->ringN:I
  :L4
  .line 152
    goto :L6
  :L5
  .line 150
    move-exception p0
  :L6
  .line 153
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
  .line 168
    sget v1, Lcom/innioasis/ipp/Diag;->ringN:I
    const/16 v2, 2000
    if-ge v1, v2, :L1
    goto :L2
  :L1
    const/16 v1, 2000
  :L2
  .line 169
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
  .line 170
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 171
    if-gtz v1, :L4
  .line 172
    const-string v1, "(empty)\n"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L3
  .line 173
    monitor-exit v0
    return-void
  :L4
  .line 175
    new-instance v3, Ljava/text/SimpleDateFormat;
    const-string v4, "MM-dd HH:mm:ss.SSS"
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v3, v4, v5 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
  .line 176
    sget v4, Lcom/innioasis/ipp/Diag;->ringN:I
    const/4 v5, 0
    if-ge v4, v2, :L5
    const/4 v4, 0
    goto :L6
  :L5
    rem-int/2addr v4, v2
  :L6
  .line 177
    nop
  :L7
    if-ge v5, v1, :L9
  .line 178
    add-int v6, v4, v5
    rem-int/2addr v6, v2
  .line 179
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
  .line 180
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
  .line 177
    add-int/lit8 v5, v5, 1
    goto :L7
  :L9
  .line 182
    monitor-exit v0
    return-void
  :L10
  .line 167
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
  .line 343
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Diag$Save;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Diag$Save;-><init>(Landroid/app/Activity;)V
    const-string p0, "ipp-diag"
    invoke-direct { v0, v1, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 344
    const/4 p0, 1
    invoke-virtual { v0, p0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 345
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 346
    return-void
.end method

.method private static set(Z)Z
  .catchall { :L0 .. :L5 } :L8
  .registers 5
  .line 329
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/File;
    const-string v2, "/storage/sdcard0/better-Y/debug_log"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 330
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
  .line 331
    invoke-virtual { v1 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
  .line 332
    if-eqz p0, :L4
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v3
    if-nez v3, :L4
    invoke-virtual { p0 }, Ljava/io/File;->mkdirs()Z
  :L4
  .line 333
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
  .line 334
    move-exception p0
  .line 335
    return v0
.end method

.method private static settings(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 10
  .line 463
    const-string v0, ")\n"
    const-string v1, "\n--- better-Y settings ---\n"
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L0
  .line 465
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->all(Landroid/content/Context;)Ljava/util/Map;
    move-result-object p0
  .line 466
    if-eqz p0, :L7
    invoke-interface { p0 }, Ljava/util/Map;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto/16 :L7
  :L1
  .line 470
    new-instance v1, Ljava/util/ArrayList;
    invoke-interface { p0 }, Ljava/util/Map;->keySet()Ljava/util/Set;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 471
    invoke-static { v1 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
  .line 472
    nop
  .line 473
    invoke-interface { v1 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v1
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L6
  .line 474
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 475
    if-nez v4, :L3
    goto :L2
  :L3
  .line 476
    const-string v5, "like:"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L4
  .line 477
    add-int/lit8 v3, v3, 1
  .line 478
    goto :L2
  :L4
  .line 480
    invoke-interface { p0, v4 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    invoke-static { v5 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v5
  .line 481
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
  .line 482
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
  .line 483
    goto :L2
  :L6
  .line 484
    const-string p0, "(liked songs: "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 487
    goto :L10
  :L7
  .line 467
    const-string p0, "(none)\n"
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L8
  .line 468
    return-void
  :L9
  .line 485
    move-exception p0
  .line 486
    const-string v1, "(failed: "
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L10
  .line 488
    return-void
.end method

.method private static space(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L2 } :L3
  .registers 8
  :L0
  .line 444
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 445
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
  .line 446
    new-instance v0, Landroid/os/StatFs;
    invoke-direct { v0, p0 }, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V
  .line 447
    invoke-virtual { v0 }, Landroid/os/StatFs;->getBlockSize()I
    move-result v1
    int-to-long v1, v1
  .line 448
    invoke-virtual { v0 }, Landroid/os/StatFs;->getAvailableBlocks()I
    move-result v3
    int-to-long v3, v3
    mul-long v3, v3, v1
  .line 449
    invoke-virtual { v0 }, Landroid/os/StatFs;->getBlockCount()I
    move-result v0
    int-to-long v5, v0
    mul-long v1, v1, v5
  .line 450
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
  .line 451
    move-exception v0
  .line 452
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
  .line 244
    const-string v0, "crash_"
  :L0
    new-instance v1, Ljava/lang/StringBuilder;
    const/16 v2, 8192
    invoke-direct { v1, v2 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 245
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
  .line 246
    const/16 v3, 10
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 247
    const-string v2, "when     "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    new-instance v4, Ljava/text/SimpleDateFormat;
    const-string v5, "yyyy-MM-dd HH:mm:ss"
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v4, v5, v6 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v5, Ljava/util/Date;
    invoke-direct { v5 }, Ljava/util/Date;-><init>()V
  .line 248
    invoke-virtual { v4, v5 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v4
  .line 247
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 248
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 249
    const-string v2, "reason   "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 250
    if-eqz p1, :L1
  .line 251
    const-string p0, "\n--- stack ---\n"
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { p1 }, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 252
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L1
  .line 254
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->ringDump(Ljava/lang/StringBuilder;)V
  .line 255
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
  .line 256
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object p0
    const/4 p1, 5
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Diag;->keepNewest(Ljava/io/File;Ljava/lang/String;I)V
  :L2
  .line 259
    goto :L4
  :L3
  .line 257
    move-exception p0
  :L4
  .line 260
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
  .line 672
    nop
  .line 674
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/RandomAccessFile;
    const-string v2, "r"
    invoke-direct { v1, p0, v2 }, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L1
  .line 675
    invoke-virtual { v1 }, Ljava/io/RandomAccessFile;->length()J
    move-result-wide v2
  .line 676
    int-to-long p0, p1
    const-wide/16 v4, 0
    cmp-long v0, v2, p0
    if-lez v0, :L2
    sub-long p0, v2, p0
    goto :L3
  :L2
    move-wide p0, v4
  :L3
  .line 677
    invoke-virtual { v1, p0, p1 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 678
    sub-long/2addr v2, p0
    long-to-int v0, v2
    new-array v0, v0, [B
  .line 679
    invoke-virtual { v1, v0 }, Ljava/io/RandomAccessFile;->readFully([B)V
  .line 680
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v0, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
  .line 681
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L8
    const-string p0, "(empty)\n"
  :L4
  .line 687
    invoke-virtual { v1 }, Ljava/io/RandomAccessFile;->close()V
  :L5
  .line 690
    goto :L7
  :L6
  .line 688
    move-exception p1
  :L7
  .line 681
    return-object p0
  :L8
  .line 682
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
  .line 687
    invoke-virtual { v1 }, Ljava/io/RandomAccessFile;->close()V
  :L11
  .line 690
    goto :L13
  :L12
  .line 688
    move-exception p0
  :L13
  .line 682
    return-object v2
  :L14
  .line 683
    move-exception p0
    move-object v0, v1
    goto :L16
  :L15
    move-exception p0
  :L16
  .line 684
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
  .line 687
    if-eqz v0, :L21
  :L18
    invoke-virtual { v0 }, Ljava/io/RandomAccessFile;->close()V
  :L19
    goto :L21
  :L20
  .line 688
    move-exception p1
    goto :L22
  :L21
  .line 690
    nop
  :L22
  .line 684
    return-object p0
  :L23
  .line 686
    move-exception p0
  .line 687
    if-eqz v0, :L27
  :L24
    invoke-virtual { v0 }, Ljava/io/RandomAccessFile;->close()V
  :L25
    goto :L27
  :L26
  .line 688
    move-exception p1
    goto :L28
  :L27
  .line 690
    nop
  :L28
  .line 691
    throw p0
.end method

.method private static toast(Landroid/content/Context;I)V
  .registers 2
  .line 697
    if-nez p0, :L0
    return-void
  :L0
  .line 698
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Diag;->toast(Landroid/content/Context;Ljava/lang/String;)V
  .line 699
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 3
  .line 704
    if-eqz p0, :L8
    if-nez p1, :L0
    goto :L8
  :L0
  .line 705
    const/4 v0, 1
  :L1
    invoke-static { p0, p1, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
  .line 706
    invoke-virtual { p0 }, Landroid/widget/Toast;->getView()Landroid/view/View;
    move-result-object p1
  .line 707
    if-nez p1, :L2
    const/4 p1, 0
    goto :L3
  :L2
    const v0, 16908299
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  :L3
  .line 708
    instance-of v0, p1, Landroid/widget/TextView;
    if-eqz v0, :L4
  .line 709
    check-cast p1, Landroid/widget/TextView;
    const/16 v0, 17
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setGravity(I)V
  :L4
  .line 711
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L5
  .line 714
    goto :L7
  :L6
  .line 712
    move-exception p0
  :L7
  .line 715
    return-void
  :L8
  .line 704
    return-void
.end method

.method private static tombstones()Ljava/io/File;
  .catchall { :L0 .. :L1 } :L3
  .catchall { :L5 .. :L7 } :L9
  .registers 4
  :L0
  .line 623
    invoke-static { }, Lxcrash/XCrash;->getLogDir()Ljava/lang/String;
    move-result-object v0
  .line 624
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L2
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, v0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  :L1
    return-object v1
  :L2
  .line 627
    goto :L4
  :L3
  .line 625
    move-exception v0
  :L4
  .line 629
    const/4 v0, 0
  :L5
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 630
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
  .line 631
    move-exception v1
  .line 632
    return-object v0
.end method

.method private static write(Ljava/io/File;Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L1 .. :L2 } :L3
  .catchall { :L2 .. :L6 } :L7
  .registers 4
  .line 264
    nop
  .line 266
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L1
  .line 267
    const-string p0, "UTF-8"
    invoke-virtual { p1, p0 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 268
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->flush()V
  .line 269
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/io/FileDescriptor;->sync()V
  :L2
  .line 274
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
    goto :L8
  :L3
  .line 270
    move-exception p0
    move-object v0, v1
    goto :L5
  :L4
    move-exception p0
  :L5
  .line 274
    if-eqz v0, :L8
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L6
    goto :L8
  :L7
  .line 275
    move-exception p0
  .line 278
    goto :L9
  :L8
  .line 277
    nop
  :L9
  .line 279
    return-void
.end method

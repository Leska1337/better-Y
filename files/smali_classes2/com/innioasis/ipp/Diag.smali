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

.field private final static MAIN_CAP:I = 1048576

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
  .line 130
    const/16 v0, 2000
    new-array v1, v0, [J
    sput-object v1, Lcom/innioasis/ipp/Diag;->ringWhen:[J
  .line 131
    new-array v1, v0, [I
    sput-object v1, Lcom/innioasis/ipp/Diag;->ringPri:[I
  .line 132
    new-array v1, v0, [Ljava/lang/String;
    sput-object v1, Lcom/innioasis/ipp/Diag;->ringTag:[Ljava/lang/String;
  .line 133
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
  .line 319
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 320
    sget-wide v2, Lcom/innioasis/ipp/Diag;->lastTap:J
    sub-long v2, v0, v2
    const-wide/16 v4, 2000
    const/4 v6, 0
    cmp-long v7, v2, v4
    if-lez v7, :L1
    sput v6, Lcom/innioasis/ipp/Diag;->taps:I
  :L1
  .line 321
    sput-wide v0, Lcom/innioasis/ipp/Diag;->lastTap:J
  .line 322
    sget v0, Lcom/innioasis/ipp/Diag;->taps:I
    const/4 v1, 1
    add-int/2addr v0, v1
    sput v0, Lcom/innioasis/ipp/Diag;->taps:I
    const/4 v2, 5
    if-ge v0, v2, :L2
    return-void
  :L2
  .line 323
    sput v6, Lcom/innioasis/ipp/Diag;->taps:I
  .line 324
    invoke-static { }, Lcom/innioasis/ipp/Diag;->on()Z
    move-result v0
    if-nez v0, :L3
    const/4 v6, 1
  :L3
  .line 325
    invoke-static { v6 }, Lcom/innioasis/ipp/Diag;->set(Z)Z
    move-result v0
    if-nez v0, :L4
    return-void
  :L4
  .line 326
    if-eqz v6, :L5
    const v0, 2131821115
    goto :L6
  :L5
    const v0, 2131821116
  :L6
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Diag;->toast(Landroid/content/Context;I)V
  :L7
  .line 329
    goto :L9
  :L8
  .line 327
    move-exception p0
  :L9
  .line 330
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
  .line 654
    const-string v0, "\n--- /data/anr/traces.txt (tail) ---\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 655
    new-instance v0, Ljava/io/File;
    const-string v1, "/data/anr/traces.txt"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 656
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v1
    if-nez v1, :L0
  .line 657
    const-string v0, "(none)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 658
    return-void
  :L0
  .line 660
    const-string v1, "written "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    new-instance v2, Ljava/text/SimpleDateFormat;
    const-string v3, "yyyy-MM-dd HH:mm:ss"
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v2, v3, v4 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v3, Ljava/util/Date;
  .line 661
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v4
    invoke-direct { v3, v4, v5 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { v2, v3 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v2
  .line 660
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 661
    const/16 v2, 10
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 662
    const/high16 v1, 0x00010000
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->tail(Ljava/io/File;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 663
    return-void
.end method

.method private static arm()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 221
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Diag;->armed:Z
  :L0
  .line 223
    invoke-static { }, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Diag;->prev:Ljava/lang/Thread$UncaughtExceptionHandler;
  .line 224
    new-instance v0, Lcom/innioasis/ipp/Diag$Crash;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Diag$Crash;-><init>()V
    invoke-static { v0 }, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V
  :L1
  .line 227
    goto :L3
  :L2
  .line 225
    move-exception v0
  :L3
  .line 228
    return-void
.end method

.method private static crashes(Ljava/lang/StringBuilder;)V
  .registers 11
  .line 602
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object v0
    const-string v1, "crash_"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->newest(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 603
    const-string v1, "\n--- last crash log the app saved before dying ---\n"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 604
    const/high16 v1, 0x00010000
    const/16 v2, 10
    const-string v3, "yyyy-MM-dd HH:mm:ss"
    const-string v4, ", "
    if-nez v0, :L0
  .line 605
    const-string v0, "(none since the card was last cleared)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L1
  :L0
  .line 607
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
  .line 608
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v8
    invoke-direct { v7, v8, v9 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { v6, v7 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v6
  .line 607
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
  .line 609
    invoke-virtual { v5, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->tail(Ljava/io/File;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v5, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L1
  .line 611
    const-string v0, "\n--- last xCrash tombstone ---\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 612
    invoke-static { }, Lcom/innioasis/ipp/Diag;->tombstones()Ljava/io/File;
    move-result-object v0
    const/4 v5, 0
    invoke-static { v0, v5 }, Lcom/innioasis/ipp/Diag;->newest(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 613
    if-nez v0, :L2
  .line 614
    const-string v0, "(none)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L4
  :L2
  .line 616
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v5
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v7
    sub-long/2addr v5, v7
  .line 617
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
  .line 618
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v8
    invoke-direct { v3, v8, v9 }, Ljava/util/Date;-><init>(J)V
    invoke-virtual { v7, v3 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v3
  .line 617
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
  .line 618
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 623
    const-wide/32 v2, 172800000
    cmp-long v4, v5, v2
    if-lez v4, :L3
  .line 624
    const-string v0, "(older than "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-wide/16 v0, 48
    invoke-virtual { p0, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 625
    const-string v0, " h, not included -- ask for the file itself if it matters)\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L4
  :L3
  .line 627
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Diag;->tail(Ljava/io/File;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L4
  .line 630
    return-void
.end method

.method private static head(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .registers 6
  .line 437
    const-string v0, "better-Y "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-static { p0 }, Lcom/innioasis/ipp/Panel;->version(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const/16 v0, 10
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 438
    const-string p0, "when     "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    new-instance v1, Ljava/text/SimpleDateFormat;
    const-string v2, "yyyy-MM-dd HH:mm:ss"
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v1, v2, v3 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v2, Ljava/util/Date;
    invoke-direct { v2 }, Ljava/util/Date;-><init>()V
  .line 439
    invoke-virtual { v1, v2 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v1
  .line 438
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 439
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 440
    const-string p0, "uptime   "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v1
    invoke-virtual { p0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " ms\n"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 441
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
  .line 442
    const-string v1, " sdk "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 443
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
  .line 444
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 445
    const-string p0, "locale   "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Ljava/util/Locale;->getDefault()Ljava/util/Locale;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 446
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
  .line 447
    const-string p0, "usb      "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Lcom/innioasis/ipp/Panel;->usb()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 448
    const-string p0, "card     "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, "/storage/sdcard0"
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->space(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 449
    const-string p0, "internal "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, "/storage/sdcard1"
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->space(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 450
    const-string p0, "data     "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, "/data"
    invoke-static { p1 }, Lcom/innioasis/ipp/Diag;->space(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 451
    return-void
.end method

.method static keepNewest(Ljava/io/File;Ljava/lang/String;I)V
  .catchall { :L0 .. :L6 } :L9
  .registers 7
  :L0
  .line 290
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  .line 291
    if-eqz p0, :L8
    array-length v0, p0
    if-gt v0, p2, :L1
    goto :L8
  :L1
  .line 292
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 293
    const/4 v1, 0
    const/4 v2, 0
  :L2
    array-length v3, p0
    if-ge v2, v3, :L4
  .line 294
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
  .line 293
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 297
    new-instance p0, Lcom/innioasis/ipp/Diag$NameCmp;
    invoke-direct { p0 }, Lcom/innioasis/ipp/Diag$NameCmp;-><init>()V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 298
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
  .line 301
    goto :L10
  :L8
  .line 291
    return-void
  :L9
  .line 299
    move-exception p0
  :L10
  .line 302
    return-void
.end method

.method private static library(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .catchall { :L0 .. :L14 } :L15
  .catchall { :L17 .. :L24 } :L25
  .catchall { :L26 .. :L32 } :L33
  .registers 18
  .line 520
    move-object/from16 v1, p1
    const-string v0, " (raw tags)\n"
    const-string v2, ")\n"
    const-string v3, "\n--- library ---\n"
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 522
    const/4 v3, 0
    const/4 v4, 0
    const/16 v5, 10
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v6
  .line 523
    if-nez v6, :L1
  .line 524
    const-string v0, "songs    (unavailable)\n"
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto/16 :L9
  :L1
  .line 526
    new-instance v7, Ljava/util/HashSet;
    invoke-direct { v7 }, Ljava/util/HashSet;-><init>()V
  .line 527
    new-instance v8, Ljava/util/HashSet;
    invoke-direct { v8 }, Ljava/util/HashSet;-><init>()V
  .line 528
    new-instance v9, Ljava/util/HashSet;
    invoke-direct { v9 }, Ljava/util/HashSet;-><init>()V
  .line 529
    nop
  .line 530
    const/4 v10, 0
    const/4 v11, 0
  :L2
    invoke-interface { v6 }, Ljava/util/List;->size()I
    move-result v12
    if-ge v10, v12, :L8
  .line 531
    invoke-interface { v6, v10 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Lcom/innioasis/y1/database/Song;
  .line 532
    if-nez v12, :L3
    goto :L7
  :L3
  .line 533
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v13
  .line 534
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v14
  .line 535
    invoke-virtual { v12 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v15
  .line 536
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
  .line 537
    if-eqz v14, :L6
    invoke-virtual { v14 }, Ljava/lang/String;->length()I
    move-result v12
    if-lez v12, :L6
    invoke-virtual { v8, v14 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L6
  .line 538
    if-eqz v15, :L7
    invoke-virtual { v15 }, Ljava/lang/String;->length()I
    move-result v12
    if-lez v12, :L7
    invoke-virtual { v9, v15 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L7
  .line 530
    add-int/lit8 v10, v10, 1
    goto :L2
  :L8
  .line 540
    const-string v10, "songs    "
    invoke-virtual { v1, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-interface { v6 }, Ljava/util/List;->size()I
    move-result v6
    invoke-virtual { v10, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 541
    const-string v6, "albums   "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v7 }, Ljava/util/HashSet;->size()I
    move-result v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, " (raw tags, before splitting)\n"
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 542
    const-string v6, "artists  "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v8 }, Ljava/util/HashSet;->size()I
    move-result v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 543
    const-string v6, "genres   "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v9 }, Ljava/util/HashSet;->size()I
    move-result v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 544
    const-string v0, "no album "
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v11 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L9
  .line 546
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 547
    if-nez v0, :L10
    move-object v0, v4
    goto :L11
  :L10
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  :L11
  .line 548
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
  .line 549
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L14
  .line 552
    goto :L16
  :L15
  .line 550
    move-exception v0
  .line 551
    const-string v6, "(failed: "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L16
  .line 557
    if-nez p0, :L17
    move-object v0, v4
    goto :L18
  :L17
    invoke-virtual/range { p0 .. p0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L18
  .line 558
    const-string v6, "cache    covers "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
  .line 559
    if-nez v0, :L19
    move-object v7, v4
    goto :L20
  :L19
    new-instance v7, Ljava/io/File;
    const-string v8, "ipp_covers"
    invoke-direct { v7, v0, v8 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L20
  .line 558
    invoke-static { v7 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v7
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 560
    const-string v6, ", big "
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
  .line 561
    if-nez v0, :L22
  :L21
    goto :L23
  :L22
    new-instance v4, Ljava/io/File;
    const-string v7, "ipp_big"
    invoke-direct { v4, v0, v7 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    goto :L21
  :L23
  .line 560
    invoke-static { v4 }, Lcom/innioasis/ipp/CacheSize;->dirSize(Ljava/io/File;)J
    move-result-wide v7
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/CacheSize;->format(J)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v6, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 562
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
  .line 565
    goto :L26
  :L25
  .line 563
    move-exception v0
  .line 564
    const-string v4, "cache    (failed: "
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L26
  .line 567
    const-string v0, "theme    "
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v4 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 568
    new-instance v0, Ljava/io/File;
    const-string v4, "/storage/sdcard0"
    const-string v6, "Themes"
    invoke-direct { v0, v4, v6 }, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 569
    const-string v4, "installed"
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 570
    if-nez v0, :L27
  .line 571
    const-string v0, " (none)"
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L31
  :L27
  .line 573
    nop
  :L28
    array-length v4, v0
    if-ge v3, v4, :L31
  .line 574
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
  .line 573
    add-int/lit8 v3, v3, 1
    goto :L28
  :L31
  .line 577
    invoke-virtual { v1, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L32
  .line 580
    goto :L34
  :L33
  .line 578
    move-exception v0
  .line 579
    const-string v3, "theme    (failed: "
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L34
  .line 581
    return-void
.end method

.method private static mask(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 508
    if-eqz p0, :L3
    const-string v0, "bt_name:"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L0
    goto :L3
  :L0
  .line 509
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    add-int/lit8 v1, v1, -5
  .line 510
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
  .line 508
    return-object p0
.end method

.method private static newest(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
  .catchall { :L0 .. :L7 } :L9
  .registers 10
  .line 668
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  :L1
  .line 669
    if-nez p0, :L2
    return-object v0
  :L2
  .line 670
    nop
  .line 671
    const/4 v1, 0
    move-object v2, v0
  :L3
    array-length v3, p0
    if-ge v1, v3, :L8
  .line 672
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-nez v3, :L4
    goto :L7
  :L4
  .line 673
    if-eqz p1, :L5
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3, p1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L5
    goto :L7
  :L5
  .line 674
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
  .line 671
    add-int/lit8 v1, v1, 1
    goto :L3
  :L8
  .line 676
    return-object v2
  :L9
  .line 677
    move-exception p0
  .line 678
    return-object v0
.end method

.method public static note(Ljava/lang/String;)V
  .registers 4
  .line 169
    const-string v0, "ipp"
    const/4 v1, 0
    const/4 v2, 4
    invoke-static { v2, v0, p0, v1 }, Lcom/innioasis/ipp/Diag;->ring(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
  .line 170
    return-void
.end method

.method static on()Z
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 93
    new-instance v0, Ljava/io/File;
    const-string v1, "/storage/sdcard0/better-Y/debug_log"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v0
  :L1
    return v0
  :L2
  .line 94
    move-exception v0
  .line 95
    const/4 v0, 0
    return v0
.end method

.method private static pri(I)C
  .registers 1
  .line 192
    packed-switch p0, :L6
  .line 199
    const/16 p0, 63
    return p0
  :L0
  .line 198
    const/16 p0, 65
    return p0
  :L1
  .line 197
    const/16 p0, 69
    return p0
  :L2
  .line 196
    const/16 p0, 87
    return p0
  :L3
  .line 195
    const/16 p0, 73
    return p0
  :L4
  .line 194
    const/16 p0, 68
    return p0
  :L5
  .line 193
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
  .line 397
    move-object/from16 v0, p0
  :L0
  .line 399
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
  .line 400
    new-instance v3, Ljava/lang/StringBuilder;
    const/16 v4, 8192
    invoke-direct { v3, v4 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 401
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Diag;->head(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .line 402
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Diag;->settings(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .line 403
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Diag;->library(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .line 404
    invoke-static { v3 }, Lcom/innioasis/ipp/Diag;->ringDump(Ljava/lang/StringBuilder;)V
  .line 405
    invoke-static { v3 }, Lcom/innioasis/ipp/Diag;->crashes(Ljava/lang/StringBuilder;)V
  .line 406
    invoke-static { v3 }, Lcom/innioasis/ipp/Diag;->anr(Ljava/lang/StringBuilder;)V
  .line 407
    invoke-static { }, Lcom/innioasis/ipp/Diag;->on()Z
    move-result v0
  :L1
    const/high16 v4, 0x00040000
    const/4 v5, 7
    const-string v6, "-t"
    const-string v7, "main"
    const/16 v8, 8
    const-string v9, "time"
    const/4 v10, 5
    const-string v11, "-v"
    const/4 v12, 4
    const/4 v13, 3
    const-string v14, "-b"
    const/4 v15, 2
    const-string v16, "-d"
    const/16 v17, 1
    const-string v18, "/system/bin/logcat"
    const/16 v19, 0
    const/4 v1, 6
    if-eqz v0, :L3
  :L2
  .line 408
    const-string v0, "\n--- logcat -b main -v time (whole buffer) ---\n"
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 409
    new-array v0, v1, [Ljava/lang/String;
    aput-object v18, v0, v19
    aput-object v16, v0, v17
    aput-object v14, v0, v15
    aput-object v7, v0, v13
    aput-object v11, v0, v12
    aput-object v9, v0, v10
    const/high16 v7, 0x00100000
    invoke-static { v0, v7 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :L4
  :L3
  .line 412
    const-string v0, "\n--- logcat -b main -v time (tail 800) ---\n"
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 413
    new-array v0, v8, [Ljava/lang/String;
    aput-object v18, v0, v19
    aput-object v16, v0, v17
    aput-object v14, v0, v15
    aput-object v7, v0, v13
    aput-object v11, v0, v12
    aput-object v9, v0, v10
    aput-object v6, v0, v1
    const-string v7, "800"
    aput-object v7, v0, v5
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L4
  .line 416
    const-string v0, "\n--- logcat -b system -v time (tail 300) ---\n"
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 417
    new-array v0, v8, [Ljava/lang/String;
    aput-object v18, v0, v19
    aput-object v16, v0, v17
    aput-object v14, v0, v15
    const-string v7, "system"
    aput-object v7, v0, v13
    aput-object v11, v0, v12
    aput-object v9, v0, v10
    aput-object v6, v0, v1
    const-string v1, "300"
    aput-object v1, v0, v5
    invoke-static { v0, v4 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 420
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, v2 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L5
  .line 421
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v3, "UTF-8"
    invoke-virtual { v0, v3 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 422
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->flush()V
  .line 423
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/FileDescriptor;->sync()V
  :L6
  .line 424
    nop
  :L7
  .line 429
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L8
  .line 432
    goto :L10
  :L9
  .line 430
    move-exception v0
  :L10
  .line 424
    return-object v2
  :L11
  .line 425
    move-exception v0
    goto :L13
  :L12
    move-exception v0
    const/4 v1, 0
  :L13
  .line 426
    nop
  .line 429
    if-eqz v1, :L17
  :L14
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L15
    goto :L17
  :L16
  .line 430
    move-exception v0
    goto :L18
  :L17
  .line 432
    nop
  :L18
  .line 426
    const/4 v1, 0
    return-object v1
.end method

.method public static declared-synchronized ring(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Diag;
    monitor-enter v0
  :L0
  .line 145
    sget-boolean v1, Lcom/innioasis/ipp/Diag;->armed:Z
    if-nez v1, :L1
    invoke-static { }, Lcom/innioasis/ipp/Diag;->arm()V
  :L1
  .line 146
    sget v1, Lcom/innioasis/ipp/Diag;->ringN:I
    rem-int/lit16 v1, v1, 2000
  .line 147
    sget-object v2, Lcom/innioasis/ipp/Diag;->ringWhen:[J
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v3
    aput-wide v3, v2, v1
  .line 148
    sget-object v2, Lcom/innioasis/ipp/Diag;->ringPri:[I
    aput p0, v2, v1
  .line 149
    sget-object p0, Lcom/innioasis/ipp/Diag;->ringTag:[Ljava/lang/String;
    aput-object p1, p0, v1
  .line 153
    sget-object p0, Lcom/innioasis/ipp/Diag;->ringMsg:[Ljava/lang/String;
    if-nez p3, :L2
    goto :L3
  :L2
  .line 154
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
  .line 155
    sget p0, Lcom/innioasis/ipp/Diag;->ringN:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Diag;->ringN:I
  :L4
  .line 158
    goto :L6
  :L5
  .line 156
    move-exception p0
  :L6
  .line 159
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
  .line 174
    sget v1, Lcom/innioasis/ipp/Diag;->ringN:I
    const/16 v2, 2000
    if-ge v1, v2, :L1
    goto :L2
  :L1
    const/16 v1, 2000
  :L2
  .line 175
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
  .line 176
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 177
    if-gtz v1, :L4
  .line 178
    const-string v1, "(empty)\n"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L3
  .line 179
    monitor-exit v0
    return-void
  :L4
  .line 181
    new-instance v3, Ljava/text/SimpleDateFormat;
    const-string v4, "MM-dd HH:mm:ss.SSS"
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v3, v4, v5 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
  .line 182
    sget v4, Lcom/innioasis/ipp/Diag;->ringN:I
    const/4 v5, 0
    if-ge v4, v2, :L5
    const/4 v4, 0
    goto :L6
  :L5
    rem-int/2addr v4, v2
  :L6
  .line 183
    nop
  :L7
    if-ge v5, v1, :L9
  .line 184
    add-int v6, v4, v5
    rem-int/2addr v6, v2
  .line 185
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
  .line 186
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
  .line 183
    add-int/lit8 v5, v5, 1
    goto :L7
  :L9
  .line 188
    monitor-exit v0
    return-void
  :L10
  .line 173
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
  .line 349
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Diag$Save;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Diag$Save;-><init>(Landroid/app/Activity;)V
    const-string p0, "ipp-diag"
    invoke-direct { v0, v1, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 350
    const/4 p0, 1
    invoke-virtual { v0, p0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 351
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 352
    return-void
.end method

.method private static set(Z)Z
  .catchall { :L0 .. :L5 } :L8
  .registers 5
  .line 335
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/File;
    const-string v2, "/storage/sdcard0/better-Y/debug_log"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 336
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
  .line 337
    invoke-virtual { v1 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
  .line 338
    if-eqz p0, :L4
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v3
    if-nez v3, :L4
    invoke-virtual { p0 }, Ljava/io/File;->mkdirs()Z
  :L4
  .line 339
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
  .line 340
    move-exception p0
  .line 341
    return v0
.end method

.method private static settings(Landroid/content/Context;Ljava/lang/StringBuilder;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 10
  .line 475
    const-string v0, ")\n"
    const-string v1, "\n--- better-Y settings ---\n"
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L0
  .line 477
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->all(Landroid/content/Context;)Ljava/util/Map;
    move-result-object p0
  .line 478
    if-eqz p0, :L7
    invoke-interface { p0 }, Ljava/util/Map;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto/16 :L7
  :L1
  .line 482
    new-instance v1, Ljava/util/ArrayList;
    invoke-interface { p0 }, Ljava/util/Map;->keySet()Ljava/util/Set;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 483
    invoke-static { v1 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
  .line 484
    nop
  .line 485
    invoke-interface { v1 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v1
    const/4 v2, 0
    const/4 v3, 0
  :L2
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L6
  .line 486
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 487
    if-nez v4, :L3
    goto :L2
  :L3
  .line 488
    const-string v5, "like:"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L4
  .line 489
    add-int/lit8 v3, v3, 1
  .line 490
    goto :L2
  :L4
  .line 492
    invoke-interface { p0, v4 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    invoke-static { v5 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v5
  .line 493
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
  .line 494
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
  .line 495
    goto :L2
  :L6
  .line 496
    const-string p0, "(liked songs: "
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 499
    goto :L10
  :L7
  .line 479
    const-string p0, "(none)\n"
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L8
  .line 480
    return-void
  :L9
  .line 497
    move-exception p0
  .line 498
    const-string v1, "(failed: "
    invoke-virtual { p1, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L10
  .line 500
    return-void
.end method

.method private static space(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L2 } :L3
  .registers 8
  :L0
  .line 456
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 457
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
  .line 458
    new-instance v0, Landroid/os/StatFs;
    invoke-direct { v0, p0 }, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V
  .line 459
    invoke-virtual { v0 }, Landroid/os/StatFs;->getBlockSize()I
    move-result v1
    int-to-long v1, v1
  .line 460
    invoke-virtual { v0 }, Landroid/os/StatFs;->getAvailableBlocks()I
    move-result v3
    int-to-long v3, v3
    mul-long v3, v3, v1
  .line 461
    invoke-virtual { v0 }, Landroid/os/StatFs;->getBlockCount()I
    move-result v0
    int-to-long v5, v0
    mul-long v1, v1, v5
  .line 462
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
  .line 463
    move-exception v0
  .line 464
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
  .line 250
    const-string v0, "crash_"
  :L0
    new-instance v1, Ljava/lang/StringBuilder;
    const/16 v2, 8192
    invoke-direct { v1, v2 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 251
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
  .line 252
    const/16 v3, 10
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 253
    const-string v2, "when     "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    new-instance v4, Ljava/text/SimpleDateFormat;
    const-string v5, "yyyy-MM-dd HH:mm:ss"
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-direct { v4, v5, v6 }, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    new-instance v5, Ljava/util/Date;
    invoke-direct { v5 }, Ljava/util/Date;-><init>()V
  .line 254
    invoke-virtual { v4, v5 }, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v4
  .line 253
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 254
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 255
    const-string v2, "reason   "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 256
    if-eqz p1, :L1
  .line 257
    const-string p0, "\n--- stack ---\n"
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { p1 }, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 258
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L1
  .line 260
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->ringDump(Ljava/lang/StringBuilder;)V
  .line 261
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
  .line 262
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object p0
    const/4 p1, 5
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Diag;->keepNewest(Ljava/io/File;Ljava/lang/String;I)V
  :L2
  .line 265
    goto :L4
  :L3
  .line 263
    move-exception p0
  :L4
  .line 266
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
  .line 684
    nop
  .line 686
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/RandomAccessFile;
    const-string v2, "r"
    invoke-direct { v1, p0, v2 }, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L1
  .line 687
    invoke-virtual { v1 }, Ljava/io/RandomAccessFile;->length()J
    move-result-wide v2
  .line 688
    int-to-long p0, p1
    const-wide/16 v4, 0
    cmp-long v0, v2, p0
    if-lez v0, :L2
    sub-long p0, v2, p0
    goto :L3
  :L2
    move-wide p0, v4
  :L3
  .line 689
    invoke-virtual { v1, p0, p1 }, Ljava/io/RandomAccessFile;->seek(J)V
  .line 690
    sub-long/2addr v2, p0
    long-to-int v0, v2
    new-array v0, v0, [B
  .line 691
    invoke-virtual { v1, v0 }, Ljava/io/RandomAccessFile;->readFully([B)V
  .line 692
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v0, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
  .line 693
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L8
    const-string p0, "(empty)\n"
  :L4
  .line 699
    invoke-virtual { v1 }, Ljava/io/RandomAccessFile;->close()V
  :L5
  .line 702
    goto :L7
  :L6
  .line 700
    move-exception p1
  :L7
  .line 693
    return-object p0
  :L8
  .line 694
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
  .line 699
    invoke-virtual { v1 }, Ljava/io/RandomAccessFile;->close()V
  :L11
  .line 702
    goto :L13
  :L12
  .line 700
    move-exception p0
  :L13
  .line 694
    return-object v2
  :L14
  .line 695
    move-exception p0
    move-object v0, v1
    goto :L16
  :L15
    move-exception p0
  :L16
  .line 696
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
  .line 699
    if-eqz v0, :L21
  :L18
    invoke-virtual { v0 }, Ljava/io/RandomAccessFile;->close()V
  :L19
    goto :L21
  :L20
  .line 700
    move-exception p1
    goto :L22
  :L21
  .line 702
    nop
  :L22
  .line 696
    return-object p0
  :L23
  .line 698
    move-exception p0
  .line 699
    if-eqz v0, :L27
  :L24
    invoke-virtual { v0 }, Ljava/io/RandomAccessFile;->close()V
  :L25
    goto :L27
  :L26
  .line 700
    move-exception p1
    goto :L28
  :L27
  .line 702
    nop
  :L28
  .line 703
    throw p0
.end method

.method private static toast(Landroid/content/Context;I)V
  .registers 2
  .line 709
    if-nez p0, :L0
    return-void
  :L0
  .line 710
    invoke-virtual { p0, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Diag;->toast(Landroid/content/Context;Ljava/lang/String;)V
  .line 711
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 3
  .line 716
    if-eqz p0, :L8
    if-nez p1, :L0
    goto :L8
  :L0
  .line 717
    const/4 v0, 1
  :L1
    invoke-static { p0, p1, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
  .line 718
    invoke-virtual { p0 }, Landroid/widget/Toast;->getView()Landroid/view/View;
    move-result-object p1
  .line 719
    if-nez p1, :L2
    const/4 p1, 0
    goto :L3
  :L2
    const v0, 16908299
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  :L3
  .line 720
    instance-of v0, p1, Landroid/widget/TextView;
    if-eqz v0, :L4
  .line 721
    check-cast p1, Landroid/widget/TextView;
    const/16 v0, 17
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setGravity(I)V
  :L4
  .line 723
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L5
  .line 726
    goto :L7
  :L6
  .line 724
    move-exception p0
  :L7
  .line 727
    return-void
  :L8
  .line 716
    return-void
.end method

.method private static tombstones()Ljava/io/File;
  .catchall { :L0 .. :L1 } :L3
  .catchall { :L5 .. :L7 } :L9
  .registers 4
  :L0
  .line 635
    invoke-static { }, Lxcrash/XCrash;->getLogDir()Ljava/lang/String;
    move-result-object v0
  .line 636
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L2
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, v0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  :L1
    return-object v1
  :L2
  .line 639
    goto :L4
  :L3
  .line 637
    move-exception v0
  :L4
  .line 641
    const/4 v0, 0
  :L5
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 642
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
  .line 643
    move-exception v1
  .line 644
    return-object v0
.end method

.method private static write(Ljava/io/File;Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L1 .. :L2 } :L3
  .catchall { :L2 .. :L6 } :L7
  .registers 4
  .line 270
    nop
  .line 272
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L1
  .line 273
    const-string p0, "UTF-8"
    invoke-virtual { p1, p0 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 274
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->flush()V
  .line 275
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/io/FileDescriptor;->sync()V
  :L2
  .line 280
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
    goto :L8
  :L3
  .line 276
    move-exception p0
    move-object v0, v1
    goto :L5
  :L4
    move-exception p0
  :L5
  .line 280
    if-eqz v0, :L8
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L6
    goto :L8
  :L7
  .line 281
    move-exception p0
  .line 284
    goto :L9
  :L8
  .line 283
    nop
  :L9
  .line 285
    return-void
.end method

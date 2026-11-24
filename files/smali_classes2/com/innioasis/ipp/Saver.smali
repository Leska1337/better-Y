.class public final Lcom/innioasis/ipp/Saver;
.super Ljava/lang/Object;
.source "Saver.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Saver$Screen;,
    Lcom/innioasis/ipp/Saver$WallLoad;,
    Lcom/innioasis/ipp/Saver$Check;,
    Lcom/innioasis/ipp/Saver$WallShow;,
    Lcom/innioasis/ipp/Saver$Decide;,
    Lcom/innioasis/ipp/Saver$Dump;,
    Lcom/innioasis/ipp/Saver$Later;
  }
.end annotation

.field public final static BG_DARK:I = 1

.field public final static BG_LIGHT:I = 0

.field public final static BG_WALLPAPER:I = 2

.field public final static BRIGHTS:[I

.field public final static BRIGHT_DEFAULT:I = 30

.field private final static CHECK:Ljava/lang/Runnable;

.field public final static CLOCK:I = 0

.field public final static COLOR_DARK:I = 1

.field public final static COLOR_LIGHT:I = 0

.field public final static COLOR_THEME:I = 2

.field public final static DATE:I = 1

.field private final static DECODE_BUDGET:I = 2000000

.field public final static KEY_BG:Ljava/lang/String; = "ss_background"

.field public final static KEY_BRIGHT:Ljava/lang/String; = "ss_bright"

.field public final static KEY_CHARGING:Ljava/lang/String; = "ss_charging"

.field public final static KEY_CLOCK:Ljava/lang/String; = "ss_clock_color"

.field public final static KEY_IMAGE:Ljava/lang/String; = "ss_image"

.field public final static KEY_OFF:Ljava/lang/String; = "ss_off"

.field public final static KEY_ON:Ljava/lang/String; = "ss_on"

.field public final static KEY_STYLE:Ljava/lang/String; = "ss_style"

.field public final static KEY_TEXT:Ljava/lang/String; = "ss_text_color"

.field public final static KEY_TINT:Ljava/lang/String; = "ss_tint"

.field private final static LEAD_MS:I = 500

.field private final static NEVER_MS:J = 86400000L

.field public final static OFF_DEFAULT:I = 3

.field public final static OFF_MS:[I

.field private final static RETRY_MS:I = 15000

.field public final static SONG:I = 2

.field public final static STYLES:I = 9

.field public final static STYLE_DEFAULT:I = 1

.field public final static TINT_DARK:I = 2

.field public final static TINT_LIGHT:I = 1

.field public final static TINT_OFF:I = 0

.field public final static TINT_THEME:I = 3

.field final static WALL_H:I = 360

.field private final static WALL_ROW:I = 3

.field private final static WALL_TYPE:I = 3

.field final static WALL_W:I = 480

.field private static app:Landroid/content/Context;

.field private static dumping:Z

.field private static failedOnce:Z

.field private static main:Landroid/os/Handler;

.field private static registered:Z

.field private static showing:Z

.field private static usbBmp:Landroid/graphics/Bitmap;

.field private static usbKey:Ljava/lang/String;

.field private static wallBmp:Landroid/graphics/Bitmap;

.field private static wallKey:Ljava/lang/String;

.field private static wallLoading:Ljava/lang/String;

.method static constructor <clinit>()V
  .registers 3
  .line 56
    const/16 v0, 101
    new-array v0, v0, [I
    sput-object v0, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
  .line 60
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    array-length v2, v1
    if-ge v0, v2, :L1
    aput v0, v1, v0
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 64
    const/16 v0, 11
    new-array v0, v0, [I
    fill-array-data v0, :L2
    sput-object v0, Lcom/innioasis/ipp/Saver;->OFF_MS:[I
  .line 109
    new-instance v0, Lcom/innioasis/ipp/Saver$Check;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Saver$Check;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Saver;->CHECK:Ljava/lang/Runnable;
    return-void
  :L2
  .array-data 4
      15000
      30000
      45000
      60000
      120000
      180000
      240000
      300000
      600000
      900000
      0
  .end array-data
.end method

.method private constructor <init>()V
  .registers 1
  .line 41
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Landroid/os/Handler;
  .registers 1
  .line 39
    sget-object v0, Lcom/innioasis/ipp/Saver;->main:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/Runnable;
  .registers 1
  .line 39
    sget-object v0, Lcom/innioasis/ipp/Saver;->CHECK:Ljava/lang/Runnable;
    return-object v0
.end method

.method static synthetic access$1000()Z
  .registers 1
  .line 39
    invoke-static { }, Lcom/innioasis/ipp/Saver;->ours()Z
    move-result v0
    return v0
.end method

.method static synthetic access$1100()V
  .registers 0
  .line 39
    invoke-static { }, Lcom/innioasis/ipp/Saver;->show()V
    return-void
.end method

.method static synthetic access$200()J
  .registers 2
  .line 39
    invoke-static { }, Lcom/innioasis/ipp/Saver;->idleDelay()J
    move-result-wide v0
    return-wide v0
.end method

.method static synthetic access$300(J)V
  .registers 2
  .line 39
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Saver;->schedule(J)V
    return-void
.end method

.method static synthetic access$400()Z
  .registers 1
  .line 39
    sget-boolean v0, Lcom/innioasis/ipp/Saver;->showing:Z
    return v0
.end method

.method static synthetic access$500()Landroid/content/Context;
  .registers 1
  .line 39
    sget-object v0, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    return-object v0
.end method

.method static synthetic access$600()Z
  .registers 1
  .line 39
    sget-boolean v0, Lcom/innioasis/ipp/Saver;->dumping:Z
    return v0
.end method

.method static synthetic access$602(Z)Z
  .registers 1
  .line 39
    sput-boolean p0, Lcom/innioasis/ipp/Saver;->dumping:Z
    return p0
.end method

.method static synthetic access$700()[J
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 1
  .line 39
    invoke-static { }, Lcom/innioasis/ipp/Saver;->read()[J
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$800()Z
  .registers 1
  .line 39
    sget-boolean v0, Lcom/innioasis/ipp/Saver;->failedOnce:Z
    return v0
.end method

.method static synthetic access$802(Z)Z
  .registers 1
  .line 39
    sput-boolean p0, Lcom/innioasis/ipp/Saver;->failedOnce:Z
    return p0
.end method

.method static synthetic access$900()V
  .registers 0
  .line 39
    invoke-static { }, Lcom/innioasis/ipp/Saver;->poke()V
    return-void
.end method

.method public static closed()V
  .registers 2
  .line 136
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Saver;->showing:Z
  .line 137
    invoke-static { }, Lcom/innioasis/ipp/Saver;->idleDelay()J
    move-result-wide v0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Saver;->schedule(J)V
  .line 138
    return-void
.end method

.method private static crop(Landroid/graphics/Bitmap;IILandroid/graphics/Bitmap$Config;I)Landroid/graphics/Bitmap;
  .registers 16
  .line 604
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 605
    nop
  .line 606
    int-to-long v2, v0
    int-to-long v4, p2
    mul-long v2, v2, v4
    int-to-long v6, v1
    int-to-long v8, p1
    mul-long v6, v6, v8
    cmp-long v10, v2, v6
    if-lez v10, :L0
    div-long/2addr v6, v4
    long-to-int v2, v6
    move v9, v1
    move v8, v2
    goto :L1
  :L0
  .line 607
    div-long/2addr v2, v8
    long-to-int v3, v2
    move v8, v0
    move v9, v3
  :L1
  .line 608
    sub-int/2addr v0, v8
    div-int/lit8 v6, v0, 2
    sub-int/2addr v1, v9
    div-int/lit8 v7, v1, 2
  .line 609
    invoke-static { p1, p2, p3 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 610
    if-eqz p4, :L2
    invoke-virtual { p1, p4 }, Landroid/graphics/Bitmap;->eraseColor(I)V
  :L2
  .line 611
    move-object v4, p0
    move-object v5, p1
    invoke-static/range { v4 .. v9 }, Lcom/innioasis/ipp/Saver;->draw(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIII)V
  .line 612
    return-object p1
.end method

.method private static decode(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L10 } :L14
  .registers 21
  .line 563
    move-object/from16 v0, p1
    move/from16 v1, p2
    move/from16 v2, p3
    move/from16 v3, p4
    const/4 v4, 0
    if-nez v0, :L0
    return-object v4
  :L0
  .line 565
    sget-object v5, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v5 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getPresetMap()Ljava/util/Map;
    move-result-object v5
    invoke-interface { v5, v0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
  .line 566
    new-instance v6, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v6 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 567
    const/4 v7, 1
    iput-boolean v7, v6, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 568
    const/4 v8, 0
    iput-boolean v8, v6, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 569
    if-eqz v5, :L1
    invoke-virtual/range { p0 .. p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v9
    move-object v10, v5
    check-cast v10, Ljava/lang/Integer;
    invoke-virtual { v10 }, Ljava/lang/Integer;->intValue()I
    move-result v10
    invoke-static { v9, v10, v6 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    goto :L2
  :L1
  .line 570
    new-instance v9, Ljava/io/File;
    invoke-direct { v9, v0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v9 }, Ljava/io/File;->isFile()Z
    move-result v9
    if-eqz v9, :L13
    invoke-static { v0, v6 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  :L2
  .line 572
    iget v9, v6, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v9, :L12
    iget v9, v6, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v9, :L3
    goto/16 :L12
  :L3
  .line 575
    const-string v9, "image/jpeg"
    iget-object v10, v6, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;
    invoke-virtual { v9, v10 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v9
  .line 576
    const/4 v10, 1
  :L4
  .line 577
    iget v11, v6, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    div-int/2addr v11, v10
    iget v12, v6, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    div-int/2addr v12, v10
    invoke-static { v11, v12, v1, v2, v3 }, Lcom/innioasis/ipp/Saver;->halves(IIIIZ)Z
    move-result v11
    if-eqz v11, :L6
    if-nez v9, :L5
    iget v11, v6, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    div-int/2addr v11, v10
    int-to-long v11, v11
    iget v13, v6, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    div-int/2addr v13, v10
    int-to-long v13, v13
    mul-long v11, v11, v13
    const-wide/32 v13, 2000000
    cmp-long v15, v11, v13
    if-lez v15, :L6
  :L5
  .line 578
    mul-int/lit8 v10, v10, 2
    goto :L4
  :L6
  .line 579
    new-instance v6, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v6 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 580
    iput v10, v6, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 581
    iput-boolean v8, v6, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 582
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    iput-object v8, v6, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;
  .line 583
    if-eqz v5, :L7
    invoke-virtual/range { p0 .. p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    check-cast v5, Ljava/lang/Integer;
    invoke-virtual { v5 }, Ljava/lang/Integer;->intValue()I
    move-result v5
    invoke-static { v0, v5, v6 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v0
    goto :L8
  :L7
  .line 584
    invoke-static { v0, v6 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L8
  .line 585
    if-nez v0, :L9
    return-object v4
  :L9
  .line 586
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v5
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v6
    invoke-static { v5, v6, v1, v2, v3 }, Lcom/innioasis/ipp/Saver;->halves(IIIIZ)Z
    move-result v5
    if-eqz v5, :L11
  .line 587
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v5
    div-int/lit8 v5, v5, 2
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v6
    div-int/lit8 v6, v6, 2
    invoke-static { v0, v5, v6, v7 }, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 588
    if-eq v5, v0, :L10
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->recycle()V
  :L10
  .line 589
    nop
  .line 590
    move-object v0, v5
    goto :L9
  :L11
  .line 591
    return-object v0
  :L12
  .line 572
    return-object v4
  :L13
  .line 571
    return-object v4
  :L14
  .line 592
    move-exception v0
  .line 593
    return-object v4
.end method

.method private static dimOf(J)J
  .registers 4
  .line 160
    const-wide/16 v0, 5
    div-long/2addr p0, v0
    const-wide/16 v0, 7000
    invoke-static { v0, v1, p0, p1 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide p0
    return-wide p0
.end method

.method private static draw(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIII)V
  .registers 9
  .line 617
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 6
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
  .line 619
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, p1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    new-instance v2, Landroid/graphics/Rect;
    add-int/2addr p4, p2
    add-int/2addr p5, p3
    invoke-direct { v2, p2, p3, p4, p5 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance p2, Landroid/graphics/Rect;
  .line 620
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p3
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result p1
    const/4 p4, 0
    invoke-direct { p2, p4, p4, p3, p1 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 619
    invoke-virtual { v1, p0, v2, p2, v0 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 621
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->recycle()V
  .line 622
    return-void
.end method

.method public static fitted(Landroid/content/Context;Ljava/lang/String;II)Landroid/graphics/Bitmap;
  .registers 11
  .line 548
    const/4 v0, 1
    invoke-static { p0, p1, p2, p3, v0 }, Lcom/innioasis/ipp/Saver;->decode(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 549
    if-eqz v1, :L1
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p0
    if-gt p0, p2, :L0
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result p0
    if-gt p0, p3, :L0
    goto :L1
  :L0
  .line 550
    int-to-float p0, p2
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p1
    int-to-float p1, p1
    div-float/2addr p0, p1
    int-to-float p1, p3
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result p2
    int-to-float p2, p2
    div-float/2addr p1, p2
    invoke-static { p0, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p0
  .line 551
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p1
    int-to-float p1, p1
    mul-float p1, p1, p0
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result p2
    int-to-float p2, p2
    mul-float p2, p2, p0
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p0
    invoke-static { v0, p0 }, Ljava/lang/Math;->max(II)I
    move-result p0
  .line 552
    sget-object p2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p0, p2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 553
    const/4 v3, 0
    const/4 v4, 0
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v5
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v6
    move-object v2, p0
    invoke-static/range { v1 .. v6 }, Lcom/innioasis/ipp/Saver;->draw(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIII)V
  .line 554
    return-object p0
  :L1
  .line 549
    return-object v1
.end method

.method private static halves(IIIIZ)Z
  .registers 7
  .line 599
    const/4 v0, 1
    const/4 v1, 0
    div-int/lit8 p0, p0, 2
    if-eqz p4, :L1
    if-ge p0, p2, :L0
    div-int/lit8 p1, p1, 2
    if-lt p1, p3, :L2
  :L0
    goto :L3
  :L1
    if-lt p0, p2, :L2
    div-int/lit8 p1, p1, 2
    if-lt p1, p3, :L2
    goto :L0
  :L2
    const/4 v0, 0
  :L3
    return v0
.end method

.method private static idleDelay()J
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 149
    nop
  :L0
  .line 151
    sget-object v0, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    invoke-virtual { v0 }, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0
    const-string v1, "screen_off_timeout"
    const/16 v2, 30000
    invoke-static { v0, v1, v2 }, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    move-result v0
  :L1
    int-to-long v0, v0
  .line 153
    goto :L3
  :L2
  .line 152
    move-exception v0
    const-wide/16 v0, 30000
  :L3
  .line 154
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-lez v4, :L5
    const-wide/32 v2, 86400000
    cmp-long v4, v0, v2
    if-lez v4, :L4
    goto :L5
  :L4
  .line 155
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Saver;->dimOf(J)J
    move-result-wide v2
    sub-long/2addr v0, v2
    const-wide/16 v2, 500
    sub-long/2addr v0, v2
    return-wide v0
  :L5
  .line 154
    const-wide/32 v0, 60000
    return-wide v0
.end method

.method public static kind(I)I
  .registers 1
  .line 89
    div-int/lit8 p0, p0, 3
    return p0
.end method

.method public static loadWall(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L2 } :L11
  .catchall { :L6 .. :L10 } :L9
  .catchall { :L12 .. :L13 } :L11
  .registers 4
  .line 380
    const-class v0, Lcom/innioasis/ipp/Saver;
    monitor-enter v0
  :L0
  .line 381
    sget-object v1, Lcom/innioasis/ipp/Saver;->wallKey:Ljava/lang/String;
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    sget-object p0, Lcom/innioasis/ipp/Saver;->wallBmp:Landroid/graphics/Bitmap;
    monitor-exit v0
    return-object p0
  :L1
  .line 382
    monitor-exit v0
  :L2
  .line 383
    const/16 v0, 480
    const/16 v1, 360
    invoke-static { p0, p1, v0, v1 }, Lcom/innioasis/ipp/Saver;->picture(Landroid/content/Context;Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 385
    if-nez p0, :L4
    sget-object v0, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getPresetMap()Ljava/util/Map;
    move-result-object v0
    invoke-interface { v0, p1 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L4
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 386
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v0
    if-eqz v0, :L3
    goto :L4
  :L3
    const/4 v0, 0
    goto :L5
  :L4
    const/4 v0, 1
  :L5
  .line 387
    const-class v1, Lcom/innioasis/ipp/Saver;
    monitor-enter v1
  .line 388
    if-eqz v0, :L7
  :L6
  .line 389
    sput-object p1, Lcom/innioasis/ipp/Saver;->wallKey:Ljava/lang/String;
  .line 390
    sput-object p0, Lcom/innioasis/ipp/Saver;->wallBmp:Landroid/graphics/Bitmap;
  :L7
  .line 392
    sget-object v0, Lcom/innioasis/ipp/Saver;->wallLoading:Ljava/lang/String;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L8
    const/4 p1, 0
    sput-object p1, Lcom/innioasis/ipp/Saver;->wallLoading:Ljava/lang/String;
  :L8
  .line 393
    monitor-exit v1
  .line 394
    return-object p0
  :L9
  .line 393
    move-exception p0
    monitor-exit v1
  :L10
    throw p0
  :L11
  .line 382
    move-exception p0
  :L12
    monitor-exit v0
  :L13
    throw p0
.end method

.method static memBytes()J
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 3
  .line 442
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 443
    const-class v1, Lcom/innioasis/ipp/Saver;
    monitor-enter v1
  :L0
  .line 444
    sget-object v2, Lcom/innioasis/ipp/Saver;->wallBmp:Landroid/graphics/Bitmap;
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 445
    sget-object v2, Lcom/innioasis/ipp/Saver;->usbBmp:Landroid/graphics/Bitmap;
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 446
    monitor-exit v1
  :L1
  .line 447
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->bitmapBytes(Ljava/util/Collection;)J
    move-result-wide v0
    return-wide v0
  :L2
  .line 446
    move-exception v0
  :L3
    monitor-exit v1
  :L4
    throw v0
.end method

.method private static number(Ljava/lang/String;C)J
  .registers 4
  .line 660
    invoke-virtual { p0, p1 }, Ljava/lang/String;->indexOf(I)I
    move-result p1
    add-int/lit8 p1, p1, 1
  :L0
  .line 661
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-ge p1, v0, :L1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->charAt(I)C
    move-result v0
    invoke-static { v0 }, Ljava/lang/Character;->isDigit(C)Z
    move-result v0
    if-nez v0, :L1
    add-int/lit8 p1, p1, 1
    goto :L0
  :L1
  .line 662
    move v0, p1
  :L2
  .line 663
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-ge v0, v1, :L3
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    invoke-static { v1 }, Ljava/lang/Character;->isDigit(C)Z
    move-result v1
    if-eqz v1, :L3
    add-int/lit8 v0, v0, 1
    goto :L2
  :L3
  .line 664
    if-le v0, p1, :L4
    invoke-virtual { p0, p1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    move-result-wide p0
    goto :L5
  :L4
    const-wide/16 p0, -1
  :L5
    return-wide p0
.end method

.method public static opened()V
  .registers 2
  .line 131
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Saver;->showing:Z
  .line 132
    sget-object v0, Lcom/innioasis/ipp/Saver;->main:Landroid/os/Handler;
    if-eqz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Saver;->CHECK:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  :L0
  .line 133
    return-void
.end method

.method private static ours()Z
  .catchall { :L0 .. :L3 } :L8
  .registers 5
  .line 280
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    const-string v2, "activity"
    invoke-virtual { v1, v2 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/app/ActivityManager;
  .line 281
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;
    move-result-object v1
  .line 282
    if-eqz v1, :L7
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L1
    goto :L7
  :L1
  .line 283
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/app/ActivityManager$RunningTaskInfo;
    iget-object v1, v1, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;
  .line 284
    if-eqz v1, :L6
    sget-object v3, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    invoke-virtual { v3 }, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1 }, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
    goto :L6
  :L2
  .line 285
    invoke-virtual { v1 }, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;
    move-result-object v1
  .line 286
    const-string v3, ".IppUsbActivity"
    invoke-virtual { v1, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L4
    const-string v3, ".IppSaverActivity"
    invoke-virtual { v1, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L4
    const-string v3, ".VideoActivity"
  .line 287
    invoke-virtual { v1, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v1
  :L3
    if-nez v1, :L4
    const/4 v0, 1
    goto :L5
  :L4
    nop
  :L5
  .line 286
    return v0
  :L6
  .line 284
    return v0
  :L7
  .line 282
    return v0
  :L8
  .line 288
    move-exception v1
  .line 289
    return v0
.end method

.method public static picked(Landroid/app/Activity;Ljava/lang/String;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 338
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v0
    const-string v1, "type"
    const/4 v2, 0
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v0
    const/4 v1, 3
    if-ne v0, v1, :L1
  .line 339
    const-string v0, "ss_image"
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Prefs;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
  .line 340
    const-string p1, "ss_background"
    const/4 v0, 2
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L1
  .line 342
    const/4 p1, 0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Saver;->prefetchWall(Landroid/content/Context;Landroid/widget/ImageView;)V
  :L2
  .line 344
    goto :L4
  :L3
  .line 343
    move-exception p0
  :L4
  .line 345
    return-void
.end method

.method public static picture(Landroid/content/Context;Ljava/lang/String;II)Landroid/graphics/Bitmap;
  .registers 5
  .line 511
    const/4 v0, 0
    invoke-static { p0, p1, p2, p3, v0 }, Lcom/innioasis/ipp/Saver;->decode(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 512
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    sget-object p1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;
    invoke-static { p0, p2, p3, p1, v0 }, Lcom/innioasis/ipp/Saver;->crop(Landroid/graphics/Bitmap;IILandroid/graphics/Bitmap$Config;I)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
.end method

.method private static poke()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 259
    sget-object v0, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    const-string v1, "power"
    invoke-virtual { v0, v1 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/os/PowerManager;
  .line 260
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const/4 v3, 0
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/PowerManager;->userActivity(JZ)V
  :L1
  .line 262
    goto :L3
  :L2
  .line 261
    move-exception v0
  :L3
  .line 263
    return-void
.end method

.method public static prefetchWall(Landroid/content/Context;Landroid/widget/ImageView;)V
  .catchall { :L1 .. :L4 } :L8
  .catchall { :L7 .. :L9 } :L8
  .registers 6
  .line 363
    if-nez p0, :L0
    return-void
  :L0
  .line 364
    const-string v0, "ss_image"
    const/4 v1, 0
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 365
    const-class v2, Lcom/innioasis/ipp/Saver;
    monitor-enter v2
  :L1
  .line 367
    sget-object v3, Lcom/innioasis/ipp/Saver;->wallKey:Ljava/lang/String;
    if-eqz v3, :L2
    invoke-virtual { v3, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
  .line 368
    sput-object v1, Lcom/innioasis/ipp/Saver;->wallKey:Ljava/lang/String;
  .line 369
    sput-object v1, Lcom/innioasis/ipp/Saver;->wallBmp:Landroid/graphics/Bitmap;
  :L2
  .line 371
    if-eqz v0, :L7
    sget-object v1, Lcom/innioasis/ipp/Saver;->wallKey:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L7
    sget-object v1, Lcom/innioasis/ipp/Saver;->wallLoading:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
    goto :L7
  :L3
  .line 372
    sput-object v0, Lcom/innioasis/ipp/Saver;->wallLoading:Ljava/lang/String;
  .line 373
    monitor-exit v2
  :L4
  .line 374
    invoke-virtual { p0 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v1
  .line 375
    new-instance v2, Ljava/lang/Thread;
    new-instance v3, Lcom/innioasis/ipp/Saver$WallLoad;
    if-nez v1, :L5
    goto :L6
  :L5
    move-object p0, v1
  :L6
    invoke-direct { v3, p0, v0, p1 }, Lcom/innioasis/ipp/Saver$WallLoad;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
    const-string p0, "ipp-saver-wall"
    invoke-direct { v2, v3, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v2 }, Ljava/lang/Thread;->start()V
  .line 376
    return-void
  :L7
  .line 371
    monitor-exit v2
    return-void
  :L8
  .line 373
    move-exception p0
    monitor-exit v2
  :L9
    throw p0
.end method

.method private static read()[J
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L1 .. :L2 } :L15
  .catchall { :L3 .. :L8 } :L14
  .registers 20
  .line 626
    const-string v0, "android.os.ServiceManager"
    invoke-static { v0 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v0
    const/4 v1, 1
    new-array v2, v1, [Ljava/lang/Class;
    const-class v3, Ljava/lang/String;
    const/4 v4, 0
    aput-object v3, v2, v4
  .line 627
    const-string v3, "getService"
    invoke-virtual { v0, v3, v2 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
    new-array v2, v1, [Ljava/lang/Object;
    const-string v3, "power"
    aput-object v3, v2, v4
    const/4 v3, 0
    invoke-virtual { v0, v3, v2 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/os/IBinder;
  .line 628
    if-nez v0, :L0
    return-object v3
  :L0
  .line 629
    new-instance v2, Ljava/io/File;
    sget-object v5, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    invoke-virtual { v5 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v5
    const-string v6, "ipp_power.txt"
    invoke-direct { v2, v5, v6 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 630
    const/high16 v5, 0x2C000000
    invoke-static { v2, v5 }, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;
    move-result-object v5
  :L1
  .line 633
    invoke-virtual { v5 }, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;
    move-result-object v6
    new-array v7, v4, [Ljava/lang/String;
    invoke-interface { v0, v6, v7 }, Landroid/os/IBinder;->dump(Ljava/io/FileDescriptor;[Ljava/lang/String;)V
  :L2
  .line 635
    invoke-virtual { v5 }, Landroid/os/ParcelFileDescriptor;->close()V
  .line 636
    nop
  .line 637
    nop
  .line 638
    new-instance v5, Ljava/io/BufferedReader;
    new-instance v0, Ljava/io/FileReader;
    invoke-direct { v0, v2 }, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    invoke-direct { v5, v0 }, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    const-wide/16 v8, -1
    const-wide/16 v10, 0
    move-wide v12, v8
    move-wide v14, v12
    move-wide/from16 v16, v10
    const-wide/16 v18, 1
  :L3
  .line 641
    invoke-virtual { v5 }, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :L10
  .line 642
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
  .line 643
    const-string v6, "mLastUserActivityTime="
    invoke-virtual { v0, v6 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L4
    const/16 v6, 61
    invoke-static { v0, v6 }, Lcom/innioasis/ipp/Saver;->number(Ljava/lang/String;C)J
    move-result-wide v8
    goto :L3
  :L4
  .line 644
    const-string v6, "Screen off timeout:"
    invoke-virtual { v0, v6 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v6
    const/16 v7, 58
    if-eqz v6, :L5
    invoke-static { v0, v7 }, Lcom/innioasis/ipp/Saver;->number(Ljava/lang/String;C)J
    move-result-wide v12
    goto :L3
  :L5
  .line 645
    const-string v6, "Screen dim duration:"
    invoke-virtual { v0, v6 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L6
    invoke-static { v0, v7 }, Lcom/innioasis/ipp/Saver;->number(Ljava/lang/String;C)J
    move-result-wide v14
    goto :L3
  :L6
  .line 646
    const-string v6, "mWakeLockSummary=0x"
    invoke-virtual { v0, v6 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L7
    const/16 v6, 19
    invoke-virtual { v0, v6 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    const/16 v6, 16
    invoke-static { v0, v6 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J
    move-result-wide v16
    goto :L3
  :L7
  .line 647
    const-string v6, "mWakefulness="
    invoke-virtual { v0, v6 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L3
    const-string v6, "Awake"
    invoke-virtual { v0, v6 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v0
  :L8
    if-eqz v0, :L9
    const-wide/16 v18, 1
    goto :L3
  :L9
    move-wide/from16 v18, v10
    goto :L3
  :L10
  .line 650
    invoke-virtual { v5 }, Ljava/io/BufferedReader;->close()V
  .line 651
    nop
  .line 652
    invoke-virtual { v2 }, Ljava/io/File;->delete()Z
  .line 653
    cmp-long v0, v8, v10
    if-ltz v0, :L13
    cmp-long v0, v12, v10
    if-gez v0, :L11
    goto :L13
  :L11
  .line 654
    cmp-long v0, v14, v10
    if-gez v0, :L12
    invoke-static { v12, v13 }, Lcom/innioasis/ipp/Saver;->dimOf(J)J
    move-result-wide v14
  :L12
  .line 655
    const/4 v0, 5
    new-array v0, v0, [J
    aput-wide v8, v0, v4
    aput-wide v12, v0, v1
    const/4 v1, 2
    aput-wide v14, v0, v1
    const/4 v1, 3
    aput-wide v16, v0, v1
    const/4 v1, 4
    aput-wide v18, v0, v1
    return-object v0
  :L13
  .line 653
    return-object v3
  :L14
  .line 650
    move-exception v0
    invoke-virtual { v5 }, Ljava/io/BufferedReader;->close()V
  .line 651
    throw v0
  :L15
  .line 635
    move-exception v0
    invoke-virtual { v5 }, Landroid/os/ParcelFileDescriptor;->close()V
  .line 636
    goto :L17
  :L16
    throw v0
  :L17
    goto :L16
.end method

.method private static schedule(J)V
  .registers 6
  .line 141
    sget-object v0, Lcom/innioasis/ipp/Saver;->main:Landroid/os/Handler;
    if-nez v0, :L0
    return-void
  :L0
  .line 142
    sget-object v1, Lcom/innioasis/ipp/Saver;->CHECK:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 143
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v0
    if-eqz v0, :L2
    sget-boolean v0, Lcom/innioasis/ipp/Saver;->showing:Z
    if-eqz v0, :L1
    goto :L2
  :L1
  .line 144
    sget-object v0, Lcom/innioasis/ipp/Saver;->main:Landroid/os/Handler;
    const-wide/16 v2, 1000
    invoke-static { v2, v3, p0, p1 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide p0
    invoke-virtual { v0, v1, p0, p1 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 145
    return-void
  :L2
  .line 143
    return-void
.end method

.method private static show()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 267
    new-instance v0, Landroid/content/Intent;
    sget-object v1, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    const-class v2, Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-direct { v0, v1, v2 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 268
    const/high16 v1, 0x10000000
    invoke-virtual { v0, v1 }, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
  .line 269
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Saver;->showing:Z
  .line 270
    sget-object v1, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    invoke-virtual { v1, v0 }, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
  :L1
  .line 274
    goto :L3
  :L2
  .line 271
    move-exception v0
  .line 272
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Saver;->showing:Z
  .line 273
    const-wide/16 v0, 15000
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Saver;->schedule(J)V
  :L3
  .line 275
    return-void
.end method

.method public static side(I)I
  .registers 1
  .line 94
    rem-int/lit8 p0, p0, 3
    return p0
.end method

.method public static declared-synchronized themeChanged()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/Saver;
    monitor-enter v0
  .line 436
    const/4 v1, 0
  :L0
    sput-object v1, Lcom/innioasis/ipp/Saver;->usbKey:Ljava/lang/String;
  .line 437
    sput-object v1, Lcom/innioasis/ipp/Saver;->usbBmp:Landroid/graphics/Bitmap;
  :L1
  .line 438
    monitor-exit v0
    return-void
  :L2
  .line 435
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method static themeFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L5 } :L8
  .registers 7
  .line 488
    const/4 v0, 0
    if-eqz p0, :L10
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    goto/16 :L10
  :L1
  .line 489
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  .line 490
    if-nez p0, :L2
    return-object v0
  :L2
  .line 491
    const/4 v1, 0
  :L3
    array-length v2, p0
    if-ge v1, v2, :L7
  .line 492
    aget-object v2, p0, v1
    invoke-virtual { v2 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v2
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;
    invoke-virtual { v2, v3 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v2
  .line 493
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L6
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, ".png"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L4
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, ".jpg"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L4
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, ".jpeg"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
  .line 494
    invoke-virtual { v2, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L6
  :L4
  .line 495
    aget-object p0, p0, v1
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
  :L5
    return-object p0
  :L6
  .line 491
    add-int/lit8 v1, v1, 1
    goto :L3
  :L7
  .line 499
    goto :L9
  :L8
  .line 498
    move-exception p0
  :L9
  .line 500
    return-object v0
  :L10
  .line 488
    return-object v0
.end method

.method public static themePicture(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 452
    const-string v0, "screensaver"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Saver;->themeFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static themeUsb(Landroid/content/Context;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L4 } :L21
  .catchall { :L4 .. :L6 } :L18
  .catchall { :L7 .. :L8 } :L21
  .catchall { :L8 .. :L10 } :L15
  .catchall { :L11 .. :L12 } :L21
  .catchall { :L12 .. :L14 } :L13
  .catchall { :L14 .. :L15 } :L21
  .catchall { :L16 .. :L17 } :L15
  .catchall { :L17 .. :L18 } :L21
  .catchall { :L19 .. :L20 } :L18
  .catchall { :L20 .. :L21 } :L21
  .registers 5
  .line 461
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v1
  .line 462
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L1
    goto :L2
  :L1
  .line 463
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "/storage/sdcard0/Themes/"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "usb"
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Saver;->themeFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    goto :L3
  :L2
  .line 462
    move-object v1, v0
  :L3
  .line 464
    const-class v2, Lcom/innioasis/ipp/Saver;
    monitor-enter v2
  :L4
  .line 465
    sget-object v3, Lcom/innioasis/ipp/Saver;->usbKey:Ljava/lang/String;
    if-eqz v3, :L5
    invoke-virtual { v3, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L5
  .line 466
    sput-object v0, Lcom/innioasis/ipp/Saver;->usbKey:Ljava/lang/String;
  .line 467
    sput-object v0, Lcom/innioasis/ipp/Saver;->usbBmp:Landroid/graphics/Bitmap;
  :L5
  .line 469
    monitor-exit v2
  :L6
  .line 470
    if-nez v1, :L7
    return-object v0
  :L7
  .line 471
    const-class v2, Lcom/innioasis/ipp/Saver;
    monitor-enter v2
  :L8
  .line 472
    sget-object v3, Lcom/innioasis/ipp/Saver;->usbKey:Ljava/lang/String;
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L9
    sget-object p0, Lcom/innioasis/ipp/Saver;->usbBmp:Landroid/graphics/Bitmap;
    monitor-exit v2
    return-object p0
  :L9
  .line 473
    monitor-exit v2
  :L10
  .line 474
    const/16 v2, 480
    const/16 v3, 360
  :L11
    invoke-static { p0, v1, v2, v3 }, Lcom/innioasis/ipp/Saver;->picture(Landroid/content/Context;Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 475
    const-class v2, Lcom/innioasis/ipp/Saver;
    monitor-enter v2
  :L12
  .line 476
    sput-object v1, Lcom/innioasis/ipp/Saver;->usbKey:Ljava/lang/String;
  .line 477
    sput-object p0, Lcom/innioasis/ipp/Saver;->usbBmp:Landroid/graphics/Bitmap;
  .line 478
    monitor-exit v2
  .line 479
    return-object p0
  :L13
  .line 478
    move-exception p0
    monitor-exit v2
  :L14
    throw p0
  :L15
  .line 473
    move-exception p0
  :L16
    monitor-exit v2
  :L17
    throw p0
  :L18
  .line 469
    move-exception p0
  :L19
    monitor-exit v2
  :L20
    throw p0
  :L21
  .line 480
    move-exception p0
  .line 481
    return-object v0
.end method

.method public static wall(Landroid/content/Context;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L4 } :L1
  .registers 4
  .line 355
    const-string v0, "ss_image"
    const/4 v1, 0
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 356
    const-class v0, Lcom/innioasis/ipp/Saver;
    monitor-enter v0
  .line 357
    if-eqz p0, :L2
  :L0
    sget-object v2, Lcom/innioasis/ipp/Saver;->wallKey:Ljava/lang/String;
    invoke-virtual { p0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L2
    sget-object v1, Lcom/innioasis/ipp/Saver;->wallBmp:Landroid/graphics/Bitmap;
    goto :L2
  :L1
  .line 358
    move-exception p0
    goto :L3
  :L2
  .line 357
    monitor-exit v0
    return-object v1
  :L3
  .line 358
    monitor-exit v0
  :L4
    throw p0
.end method

.method public static wallpaperConfirm(Lcom/innioasis/y1/base/BaseActivity;)Z
  .registers 4
  .line 310
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v0
    const/4 v1, 3
    if-eq v0, v1, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 311
    new-instance v0, Landroid/content/Intent;
    const-class v2, Lcom/innioasis/y1/activity/WallpaperActivity;
    invoke-direct { v0, p0, v2 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 312
    const-string v2, "type"
    invoke-virtual { v0, v2, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
  .line 313
    const/4 v1, 4
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/base/BaseActivity;->startActivityForResult(Landroid/content/Intent;I)V
  .line 314
    const/4 p0, 1
    return p0
.end method

.method public static wallpaperFile(Ljava/io/File;)V
  .catchall { :L0 .. :L2 } :L5
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L3 .. :L5 } :L5
  .registers 6
  .line 525
    if-nez p0, :L0
    return-void
  :L0
  .line 526
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 527
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
    const/4 v2, 0
    const/16 v3, 360
    const/16 v4, 480
    invoke-static { v0, v1, v4, v3, v2 }, Lcom/innioasis/ipp/Saver;->decode(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 528
    if-nez v0, :L1
    return-void
  :L1
  .line 529
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/4 v2, -1
    invoke-static { v0, v4, v3, v1, v2 }, Lcom/innioasis/ipp/Saver;->crop(Landroid/graphics/Bitmap;IILandroid/graphics/Bitmap$Config;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 530
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L2
  .line 532
    sget-object p0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    const/16 v2, 95
    invoke-virtual { v0, p0, v2, v1 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
  .line 533
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->flush()V
  :L3
  .line 535
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 536
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->recycle()V
  .line 537
    nop
  .line 540
    goto :L6
  :L4
  .line 535
    move-exception p0
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 536
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->recycle()V
  .line 537
    throw p0
  :L5
  .line 538
    move-exception p0
  .line 539
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "Saver.wallpaperFile: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L6
  .line 541
    return-void
.end method

.method public static wallpaperPreview(Lcom/innioasis/y1/base/BaseActivity;)Z
  .catchall { :L1 .. :L4 } :L5
  .registers 3
  .line 319
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v0
    const/4 v1, 3
    if-eq v0, v1, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 321
    const v0, 2131362087
  :L1
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/ImageView;
  .line 322
    invoke-static { p0 }, Lcom/innioasis/ipp/Saver;->wall(Landroid/content/Context;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 324
    if-nez v1, :L2
  .line 325
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Saver;->prefetchWall(Landroid/content/Context;Landroid/widget/ImageView;)V
  .line 326
    sget-object p0, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmapPreview()Landroid/graphics/Bitmap;
    move-result-object v1
  :L2
  .line 328
    if-eqz v1, :L3
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    goto :L4
  :L3
  .line 329
    const p0, 2131230827
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setImageResource(I)V
  :L4
  .line 331
    goto :L6
  :L5
  .line 330
    move-exception p0
  :L6
  .line 332
    const/4 p0, 1
    return p0
.end method

.method public static wallpaperRow(Landroid/content/Context;Ljava/lang/Object;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 302
    const-string v0, "screensaver"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Help;->label(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 303
    check-cast p1, Lcom/chad/library/adapter/base/BaseQuickAdapter;
    if-nez p0, :L1
    const-string p0, "Screensaver"
  :L1
    invoke-virtual { p1, p0 }, Lcom/chad/library/adapter/base/BaseQuickAdapter;->addData(Ljava/lang/Object;)V
  :L2
  .line 305
    goto :L4
  :L3
  .line 304
    move-exception p0
  :L4
  .line 306
    return-void
.end method

.method public static watch(Landroid/content/Context;)V
  .catchall { :L1 .. :L3 } :L4
  .registers 3
  .line 113
    sget-boolean v0, Lcom/innioasis/ipp/Saver;->registered:Z
    if-nez v0, :L6
    if-nez p0, :L0
    goto :L6
  :L0
  .line 114
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Saver;->registered:Z
  :L1
  .line 116
    invoke-virtual { p0 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
  .line 117
    if-nez v0, :L2
    sput-object p0, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
  :L2
  .line 118
    new-instance p0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-direct { p0, v0 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object p0, Lcom/innioasis/ipp/Saver;->main:Landroid/os/Handler;
  .line 119
    sget-object p0, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    invoke-static { p0 }, Lcom/innioasis/ipp/Lit;->watch(Landroid/content/Context;)V
  .line 120
    new-instance p0, Landroid/content/IntentFilter;
    const-string v0, "android.intent.action.SCREEN_ON"
    invoke-direct { p0, v0 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
  .line 121
    const-string v0, "android.intent.action.SCREEN_OFF"
    invoke-virtual { p0, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 122
    sget-object v0, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    new-instance v1, Lcom/innioasis/ipp/Saver$Screen;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Saver$Screen;-><init>()V
    invoke-virtual { v0, v1, p0 }, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 123
    invoke-static { }, Lcom/innioasis/ipp/Saver;->idleDelay()J
    move-result-wide v0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Saver;->schedule(J)V
  .line 124
    sget-object p0, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    const-string v0, "ss_on"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L3
    sget-object p0, Lcom/innioasis/ipp/Saver;->app:Landroid/content/Context;
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Saver;->prefetchWall(Landroid/content/Context;Landroid/widget/ImageView;)V
  :L3
  .line 126
    goto :L5
  :L4
  .line 125
    move-exception p0
  :L5
  .line 127
    return-void
  :L6
  .line 113
    return-void
.end method

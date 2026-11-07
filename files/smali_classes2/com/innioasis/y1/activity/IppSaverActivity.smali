.class public final Lcom/innioasis/y1/activity/IppSaverActivity;
.super Landroid/app/Activity;
.source "IppSaverActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppSaverActivity$Sleep;,
    Lcom/innioasis/y1/activity/IppSaverActivity$Fade;,
    Lcom/innioasis/y1/activity/IppSaverActivity$Rx;,
    Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;,
    Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;,
    Lcom/innioasis/y1/activity/IppSaverActivity$ShowWall;,
    Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;,
    Lcom/innioasis/y1/activity/IppSaverActivity$Rearm;
  }
.end annotation

.field private final static COVER:I = 180

.field private final static COVER_CENTER:I = 170

.field private final static DARK:I = -15592942

.field private final static DATE_OVER:I = 70

.field public final static EXTRA_NAMES:Ljava/lang/String; = "names"

.field public final static EXTRA_PREVIEW:Ljava/lang/String; = "preview"

.field private final static FADE_STEPS:I = 25

.field private final static FADE_STEP_MS:I = 60

.field private final static LIGHT:I = -1

.field private final static LINES:I = 2

.field private final static MARGIN:I = 24

.field private final static MENU_BG:I = -7564110

.field private final static TEXT_EDGE:I = 8

.field private band:Landroid/widget/TextView;

.field private clock:Landroid/widget/TextView;

.field private content:Landroid/widget/FrameLayout;

.field private cover:Landroid/widget/ImageView;

.field private coverPath:Ljava/lang/String;

.field private date:Landroid/widget/TextView;

.field private dateOver:I

.field private down:I

.field private final fade:Ljava/lang/Runnable;

.field private from:F

.field private lastCover:Landroid/graphics/Bitmap;

.field private lastPath:Ljava/lang/String;

.field private names:[Ljava/lang/String;

.field private preview:Z

.field private rx:Lcom/innioasis/y1/activity/IppSaverActivity$Rx;

.field private final sleep:Ljava/lang/Runnable;

.field private step:I

.field private style:I

.field private target:F

.field private ui:Landroid/os/Handler;

.method public constructor <init>()V
  .registers 2
  .line 56
    invoke-direct { p0 }, Landroid/app/Activity;-><init>()V
  .line 90
    new-instance v0, Lcom/innioasis/y1/activity/IppSaverActivity$Sleep;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppSaverActivity$Sleep;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->sleep:Ljava/lang/Runnable;
  .line 91
    new-instance v0, Lcom/innioasis/y1/activity/IppSaverActivity$Fade;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppSaverActivity$Fade;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->fade:Ljava/lang/Runnable;
  .line 97
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->down:I
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppSaverActivity;)V
  .registers 1
  .line 56
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->fadeStep()V
    return-void
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppSaverActivity;)V
  .registers 1
  .line 56
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->goToSleep()V
    return-void
.end method

.method static synthetic access$200(Lcom/innioasis/y1/activity/IppSaverActivity;)Landroid/os/Handler;
  .registers 1
  .line 56
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    return-object p0
.end method

.method static synthetic access$300(Lcom/innioasis/y1/activity/IppSaverActivity;)V
  .registers 1
  .line 56
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->songChanged()V
    return-void
.end method

.method static synthetic access$400(Lcom/innioasis/y1/activity/IppSaverActivity;)V
  .registers 1
  .line 56
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->tick()V
    return-void
.end method

.method static synthetic access$500(Lcom/innioasis/y1/activity/IppSaverActivity;)V
  .registers 1
  .line 56
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->armOff()V
    return-void
.end method

.method static synthetic access$602(Lcom/innioasis/y1/activity/IppSaverActivity;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 56
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->lastPath:Ljava/lang/String;
    return-object p1
.end method

.method static synthetic access$702(Lcom/innioasis/y1/activity/IppSaverActivity;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 2
  .line 56
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->lastCover:Landroid/graphics/Bitmap;
    return-object p1
.end method

.method static synthetic access$800(Lcom/innioasis/y1/activity/IppSaverActivity;)Landroid/widget/ImageView;
  .registers 1
  .line 56
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    return-object p0
.end method

.method static synthetic access$900(Lcom/innioasis/y1/activity/IppSaverActivity;)Ljava/lang/String;
  .registers 1
  .line 56
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
    return-object p0
.end method

.method private static addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .registers 6
  .line 475
    invoke-virtual { p1, p2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 476
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v0, -1
    const/4 v1, -2
    invoke-direct { p2, v0, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 477
    iput p3, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
  .line 478
    invoke-virtual { p0, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 479
    return-void
.end method

.method private armOff()V
  .registers 6
  .line 530
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->sleep:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 531
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 532
    const-string v0, "ss_off"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 533
    if-ltz v0, :L1
    sget-object v1, Lcom/innioasis/ipp/Saver;->OFF_MS:[I
    array-length v1, v1
    if-lt v0, v1, :L2
  :L1
    const/4 v0, 3
  :L2
  .line 534
    sget-object v1, Lcom/innioasis/ipp/Saver;->OFF_MS:[I
    aget v0, v1, v0
  .line 535
    if-nez v0, :L3
    return-void
  :L3
  .line 536
    const-string v1, "ss_charging"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L4
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->charging()Z
    move-result v1
    if-eqz v1, :L4
    return-void
  :L4
  .line 537
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->sleep:Ljava/lang/Runnable;
    int-to-long v3, v0
    invoke-virtual { v1, v2, v3, v4 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 538
    return-void
.end method

.method private background(Landroid/widget/FrameLayout;)V
  .registers 5
  .line 207
    const-string v0, "ss_background"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 208
    const/4 v1, -1
    if-nez v0, :L0
  .line 209
    invoke-virtual { p1, v1 }, Landroid/widget/FrameLayout;->setBackgroundColor(I)V
  .line 210
    return-void
  :L0
  .line 212
    const/high16 v2, 0xFF000000
    invoke-virtual { p1, v2 }, Landroid/widget/FrameLayout;->setBackgroundColor(I)V
  .line 213
    const/4 v2, 2
    if-eq v0, v2, :L1
    return-void
  :L1
  .line 214
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct { v0, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 215
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 216
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v2, v1, v1 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p1, v0, v2 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 217
    const-string p1, "ss_image"
    const/4 v1, 0
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Prefs;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 218
    if-nez p1, :L2
    goto :L3
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Saver;->wall(Landroid/content/Context;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L3
  .line 219
    if-eqz v1, :L4
  .line 220
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    goto :L6
  :L4
  .line 221
    if-eqz p1, :L5
  .line 222
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;
    invoke-direct { v2, p0, v0, p1 }, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;Landroid/widget/ImageView;Ljava/lang/String;)V
    const-string p1, "ipp-saver-wall"
    invoke-direct { v1, v2, p1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
    goto :L6
  :L5
  .line 224
    sget-object p1, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { p1 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object p1
  .line 225
    if-eqz p1, :L6
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L6
  .line 227
    return-void
.end method

.method private brightness(F)V
  .registers 3
  .line 502
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v0
  .line 503
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F
  .line 504
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getWindow()Landroid/view/Window;
    move-result-object p1
    invoke-virtual { p1, v0 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  .line 505
    return-void
.end method

.method private centerCover(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)I
  .registers 6
  .line 460
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I
    add-int/lit8 v0, v0, -48
  .line 461
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I
  .line 462
    invoke-static { p1, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->tall(Landroid/widget/TextView;I)I
    move-result p1
    invoke-static { p2, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->tall(Landroid/widget/TextView;I)I
    move-result p2
    add-int/2addr p1, p2
    invoke-static { p3, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->tall(Landroid/widget/TextView;I)I
    move-result p2
    add-int/2addr p1, p2
    add-int/lit8 p1, p1, 14
    add-int/lit8 p1, p1, 6
    add-int/lit8 p1, p1, 4
  .line 463
    add-int/lit8 v1, v1, -24
    sub-int/2addr v1, p1
    const/16 p1, 170
    invoke-static { p1, v1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    const/16 p2, 80
    invoke-static { p2, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
    return p1
.end method

.method private charging()Z
  .catchall { :L0 .. :L1 } :L3
  .registers 4
  .line 542
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.BATTERY_CHANGED"
    invoke-direct { v1, v2 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
    const/4 v2, 0
    invoke-virtual { p0, v2, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    move-result-object v1
  .line 543
    if-eqz v1, :L2
    const-string v2, "plugged"
    invoke-virtual { v1, v2, v0 }, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v1
  :L1
    if-eqz v1, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 544
    move-exception v1
  .line 545
    return v0
.end method

.method private clockBlock(IZ)V
  .registers 10
  .line 320
    const/4 v0, 0
    const/4 v1, 1
    if-ne p1, v1, :L0
    const/16 v2, 70
    goto :L1
  :L0
    const/4 v2, 0
  :L1
    iput v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->dateOver:I
  .line 321
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 322
    invoke-virtual { v2, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 323
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->gravityOf(I)I
    move-result v3
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 324
    const-string v3, "ss_clock_color"
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppSaverActivity;->color(Ljava/lang/String;)I
    move-result v3
    invoke-direct { p0, v3, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->text(IZ)Landroid/widget/TextView;
    move-result-object v1
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
  .line 325
    const/16 v3, 320
    const/16 v4, 116
    const/high16 v5, 0x42DC0000
    const-string v6, "00:00"
    invoke-static { v1, v5, v6, v3, v4 }, Lcom/innioasis/y1/activity/IppSaverActivity;->fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .line 326
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -2
    invoke-direct { v3, v4, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v1, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 327
    if-eqz p2, :L2
  .line 328
    const-string p2, "ss_text_color"
    invoke-direct { p0, p2 }, Lcom/innioasis/y1/activity/IppSaverActivity;->color(Ljava/lang/String;)I
    move-result p2
    invoke-direct { p0, p2, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->text(IZ)Landroid/widget/TextView;
    move-result-object p2
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
  .line 329
    const-string v1, "Hg"
    const/16 v3, 30
    const/high16 v5, 0x41C00000
    invoke-static { p2, v5, v1, v0, v3 }, Lcom/innioasis/y1/activity/IppSaverActivity;->fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .line 330
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->gravityOf(I)I
    move-result v0
    invoke-virtual { p2, v0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 331
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v4, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 332
    const/16 v0, 8
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
  .line 333
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
    invoke-virtual { v2, v0, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L2
  .line 335
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { p2, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 336
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->gravityOf(I)I
    move-result p1
    or-int/lit8 p1, p1, 16
    iput p1, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 337
    const/16 p1, 24
    iput p1, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 338
    iput p1, p2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I
  .line 339
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->content:Landroid/widget/FrameLayout;
    invoke-virtual { p1, v2, p2 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 340
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->tick()V
  .line 341
    return-void
.end method

.method private color(Ljava/lang/String;)I
  .registers 3
  .line 256
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p1
  .line 257
    const/4 v0, 1
    if-ne p1, v0, :L0
    const p1, -15592942
    return p1
  :L0
  .line 258
    const/4 v0, 2
    if-ne p1, v0, :L2
  .line 259
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result p1
  .line 260
    if-nez p1, :L1
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeColor()I
    move-result p1
  :L1
  .line 261
    if-eqz p1, :L2
    const/high16 v0, 0xFF000000
    or-int/2addr p1, v0
    return p1
  :L2
  .line 263
    const/4 p1, -1
    return p1
.end method

.method private fadeStep()V
  .registers 5
  .line 508
    iget v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->step:I
    add-int/lit8 v0, v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->step:I
  .line 509
    int-to-float v0, v0
    const/high16 v1, 0x41C80000
    div-float/2addr v0, v1
    const/high16 v1, 0x3F800000
    invoke-static { v1, v0 }, Ljava/lang/Math;->min(FF)F
    move-result v0
  .line 510
    iget v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->from:F
    iget v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->target:F
    sub-float/2addr v2, v1
    mul-float v2, v2, v0
    add-float/2addr v1, v2
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->brightness(F)V
  .line 511
    iget v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->step:I
    const/16 v1, 25
    if-ge v0, v1, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->fade:Ljava/lang/Runnable;
    const-wide/16 v2, 60
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L0
  .line 512
    return-void
.end method

.method private static fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .registers 9
  .line 284
    new-instance v0, Landroid/text/TextPaint;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 285
    nop
  :L0
  .line 286
    const/high16 v1, 0x41000000
    cmpl-float v1, p1, v1
    if-lez v1, :L3
  .line 287
    invoke-virtual { v0, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 288
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;
    move-result-object v1
  .line 289
    if-lez p3, :L1
    invoke-virtual { v0, p2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    int-to-float v3, p3
    cmpg-float v2, v2, v3
    if-gtz v2, :L2
  :L1
    iget v2, v1, Landroid/graphics/Paint$FontMetrics;->descent:F
    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->ascent:F
    sub-float/2addr v2, v1
    int-to-float v1, p4
    cmpg-float v1, v2, v1
    if-gtz v1, :L2
    goto :L3
  :L2
  .line 286
    const/high16 v1, 0x3F800000
    sub-float/2addr p1, v1
    goto :L0
  :L3
  .line 291
    const/4 p2, 0
    invoke-virtual { p0, p2, p1 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 292
    return-void
.end method

.method private goToSleep()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 551
    const-string v0, "power"
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/os/PowerManager;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-virtual { v0, v1, v2 }, Landroid/os/PowerManager;->goToSleep(J)V
  :L1
  .line 555
    goto :L3
  :L2
  .line 552
    move-exception v0
  .line 554
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getWindow()Landroid/view/Window;
    move-result-object v0
    const/16 v1, 128
    invoke-virtual { v0, v1 }, Landroid/view/Window;->clearFlags(I)V
  :L3
  .line 556
    return-void
.end method

.method private static gravityOf(I)I
  .registers 2
  .line 295
    if-nez p0, :L0
    const/4 p0, 3
    goto :L2
  :L0
    const/4 v0, 2
    if-ne p0, v0, :L1
    const/4 p0, 5
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method private layout()V
  .registers 9
  .line 300
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->content:Landroid/widget/FrameLayout;
    invoke-virtual { v0 }, Landroid/widget/FrameLayout;->removeAllViews()V
  .line 301
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
  .line 302
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
  .line 303
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
  .line 304
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
  .line 305
    iget v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    invoke-static { v1 }, Lcom/innioasis/ipp/Saver;->kind(I)I
    move-result v1
  .line 306
    iget v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    invoke-static { v2 }, Lcom/innioasis/ipp/Saver;->side(I)I
    move-result v2
  .line 307
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->band:Landroid/widget/TextView;
    const/4 v4, 1
    if-eqz v3, :L2
  .line 308
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->names:[Ljava/lang/String;
    if-eqz v3, :L0
    iget v5, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    array-length v6, v3
    if-ge v5, v6, :L0
    aget-object v3, v3, v5
    goto :L1
  :L0
    iget v3, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    add-int/2addr v3, v4
    invoke-static { v3 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v3
  :L1
  .line 309
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->band:Landroid/widget/TextView;
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "\u2039  "
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v6, "  \u203a"
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v5, v3 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L2
  .line 311
    const/4 v3, 2
    if-ne v1, v3, :L3
    invoke-static { }, Lcom/innioasis/y1/activity/IppSaverActivity;->playing()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L3
  .line 312
    if-eqz v0, :L4
  .line 313
    invoke-direct { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppSaverActivity;->song(Lcom/innioasis/y1/database/Song;I)V
    goto :L7
  :L4
  .line 315
    if-ne v1, v4, :L5
    goto :L6
  :L5
    const/4 v4, 0
  :L6
    invoke-direct { p0, v2, v4 }, Lcom/innioasis/y1/activity/IppSaverActivity;->clockBlock(IZ)V
  :L7
  .line 317
    return-void
.end method

.method private line(Ljava/lang/String;IZFI)Landroid/widget/TextView;
  .registers 7
  .line 371
    invoke-direct { p0, p2, p3 }, Lcom/innioasis/y1/activity/IppSaverActivity;->text(IZ)Landroid/widget/TextView;
    move-result-object p2
  .line 372
    const-string p3, "Hg"
    const/4 v0, 0
    invoke-static { p2, p4, p3, v0, p5 }, Lcom/innioasis/y1/activity/IppSaverActivity;->fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .line 373
    const/4 p3, 2
    invoke-virtual { p2, p3 }, Landroid/widget/TextView;->setMaxLines(I)V
  .line 374
    sget-object p3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { p2, p3 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 375
    invoke-virtual { p2, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 376
    return-object p2
.end method

.method private static menuBackground()I
  .catchall { :L0 .. :L1 } :L3
  .registers 1
  :L0
  .line 244
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 245
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  :L1
    return v0
  :L2
  .line 247
    goto :L4
  :L3
  .line 246
    move-exception v0
  :L4
  .line 248
    const v0, -7564110
    return v0
.end method

.method private onPicture()Z
  .registers 3
  .line 252
    const-string v0, "ss_background"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    const/4 v1, 2
    if-ne v0, v1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static playing()Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L2 } :L3
  .registers 2
  .line 363
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 364
    if-nez v1, :L1
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 365
    move-exception v1
  .line 366
    return-object v0
.end method

.method private song(Lcom/innioasis/y1/database/Song;I)V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L9 .. :L10 } :L11
  .registers 14
  .line 380
    const-string v0, "ss_text_color"
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->color(Ljava/lang/String;)I
    move-result v0
  .line 381
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Ipp;->songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    const/4 v4, 1
    const/high16 v5, 0x41E00000
    const/16 v6, 34
    move-object v1, p0
    move v3, v0
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppSaverActivity;->line(Ljava/lang/String;IZFI)Landroid/widget/TextView;
    move-result-object v7
  .line 382
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v1
  :L0
  .line 384
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Feat;->artist(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v1
  :L1
  .line 386
    goto :L3
  :L2
  .line 385
    move-exception v2
  :L3
  .line 387
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    const-string v8, ""
    if-nez v1, :L4
    move-object v1, v8
  :L4
    invoke-virtual { v2, v1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    const/4 v4, 0
    const/high16 v5, 0x41B00000
    const/16 v6, 28
    move-object v1, p0
    move v3, v0
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppSaverActivity;->line(Ljava/lang/String;IZFI)Landroid/widget/TextView;
    move-result-object v9
  .line 388
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 389
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    if-nez v1, :L5
    goto :L6
  :L5
    move-object v8, v1
  :L6
    invoke-virtual { v2, v8 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    const/4 v4, 0
    const/high16 v5, 0x41A00000
    const/16 v6, 26
    move-object v1, p0
    move v3, v0
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppSaverActivity;->line(Ljava/lang/String;IZFI)Landroid/widget/TextView;
    move-result-object v0
  .line 391
    new-instance v1, Landroid/widget/ImageView;
    invoke-direct { v1, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
  .line 392
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 393
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
  .line 394
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->lastPath:Ljava/lang/String;
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L7
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->lastCover:Landroid/graphics/Bitmap;
    goto :L8
  :L7
    const/4 p1, 0
  :L8
  .line 395
    if-nez p1, :L12
  :L9
  .line 397
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L10
  .line 399
    goto :L12
  :L11
  .line 398
    move-exception v1
  :L12
  .line 401
    if-eqz p1, :L13
  .line 402
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    invoke-virtual { v1, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 403
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->lastPath:Ljava/lang/String;
  .line 404
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->lastCover:Landroid/graphics/Bitmap;
    goto :L15
  :L13
  .line 406
    invoke-static { }, Lcom/innioasis/ipp/Cover;->blankCover()Landroid/graphics/Bitmap;
    move-result-object p1
  .line 407
    if-eqz p1, :L14
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    invoke-virtual { v1, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L14
  .line 408
    new-instance p1, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
    invoke-direct { v1, p0, v2 }, Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;Ljava/lang/String;)V
    const-string v2, "ipp-saver-cover"
    invoke-direct { p1, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  :L15
  .line 411
    const/4 p1, -1
    const/4 v1, 6
    const/16 v2, 16
    const/4 v3, -2
    const/16 v4, 24
    const/4 v5, 1
    if-ne p2, v5, :L16
  .line 412
    new-instance p2, Landroid/widget/LinearLayout;
    invoke-direct { p2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 413
    invoke-virtual { p2, v5 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 414
    invoke-virtual { p2, v5 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 415
    invoke-direct { p0, v7, v9, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->centerCover(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)I
    move-result v6
  .line 416
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v6, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p2, v8, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 417
    const/16 v6, 14
    invoke-static { p2, v7, v5, v6 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 418
    invoke-static { p2, v9, v5, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 419
    const/4 v1, 4
    invoke-static { p2, v0, v5, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 420
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v0, p1, v3 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 421
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 422
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 423
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I
  .line 424
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->content:Landroid/widget/FrameLayout;
    invoke-virtual { p1, p2, v0 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 425
    return-void
  :L16
  .line 427
    const/4 v6, 0
    if-nez p2, :L17
    const/4 p2, 1
    goto :L18
  :L17
    const/4 p2, 0
  :L18
  .line 428
    new-instance v8, Landroid/widget/LinearLayout;
    invoke-direct { v8, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 429
    invoke-virtual { v8, v6 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 430
    invoke-virtual { v8, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 431
    new-instance v10, Landroid/widget/LinearLayout;
    invoke-direct { v10, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 432
    invoke-virtual { v10, v5 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 433
    if-eqz p2, :L19
    const/4 v5, 3
    goto :L20
  :L19
    const/4 v5, 5
  :L20
  .line 434
    invoke-static { v10, v7, v5, v6 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 435
    const/16 v7, 8
    invoke-static { v10, v9, v5, v7 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 436
    invoke-static { v10, v0, v5, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 437
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v1, 180
    invoke-direct { v0, v1, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 438
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v5, 0x3F800000
    invoke-direct { v1, v6, v3, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
  .line 439
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v5, p1, v3 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 440
    iput v2, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 442
    const/16 p1, 20
    if-eqz p2, :L21
  .line 443
    iput p1, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I
  .line 444
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    invoke-virtual { v8, p1, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 445
    invoke-virtual { v8, v10, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 446
    iput v4, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 447
    iput v7, v5, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I
    goto :L22
  :L21
  .line 449
    iput p1, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 450
    invoke-virtual { v8, v10, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 451
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    invoke-virtual { v8, p1, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 452
    iput v7, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 453
    iput v4, v5, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I
  :L22
  .line 455
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->content:Landroid/widget/FrameLayout;
    invoke-virtual { p1, v8, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 456
    return-void
.end method

.method private songChanged()V
  .registers 3
  .line 482
    iget v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    invoke-static { v0 }, Lcom/innioasis/ipp/Saver;->kind(I)I
    move-result v0
    const/4 v1, 2
    if-eq v0, v1, :L0
    return-void
  :L0
  .line 483
    invoke-static { }, Lcom/innioasis/y1/activity/IppSaverActivity;->playing()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 484
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 485
    if-eqz v0, :L3
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    return-void
  :L3
  .line 486
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->layout()V
  .line 487
    return-void
.end method

.method private systemBrightness()F
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 493
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0
    const-string v1, "screen_brightness"
    invoke-static { v0, v1 }, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    move-result v0
  .line 495
    int-to-float v0, v0
    const/high16 v1, 0x437F0000
    div-float/2addr v0, v1
    const/high16 v1, 0x3F800000
    invoke-static { v1, v0 }, Ljava/lang/Math;->min(FF)F
    move-result v0
    const v1, 1008981770
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(FF)F
    move-result v0
  :L1
    return v0
  :L2
  .line 496
    move-exception v0
  .line 497
    iget v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->target:F
    return v0
.end method

.method private static tall(Landroid/widget/TextView;I)I
  .registers 12
  .line 467
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 468
    new-instance v9, Landroid/text/StaticLayout;
    if-nez v0, :L0
    const-string v0, ""
  :L0
    move-object v2, v0
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;
    const/high16 v6, 0x3F800000
    const/4 v7, 0
    const/4 v8, 0
    move-object v1, v9
    move v4, p1
    invoke-direct/range { v1 .. v8 }, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V
  .line 470
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;
    move-result-object p0
  .line 471
    const/4 p1, 1
    invoke-virtual { v9 }, Landroid/text/StaticLayout;->getLineCount()I
    move-result v0
    invoke-static { p1, v0 }, Ljava/lang/Math;->max(II)I
    move-result p1
    const/4 v0, 2
    invoke-static { v0, p1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    iget v0, p0, Landroid/graphics/Paint$FontMetricsInt;->descent:I
    iget p0, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I
    sub-int/2addr v0, p0
    mul-int p1, p1, v0
    return p1
.end method

.method private text(IZ)Landroid/widget/TextView;
  .registers 6
  .line 267
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 268
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 269
    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v0, v1, p2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 270
    const/4 p2, 0
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 271
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->onPicture()Z
    move-result v1
    if-eqz v1, :L3
  .line 273
    shr-int/lit8 v1, p1, 16
    and-int/lit16 v1, v1, 255
    shr-int/lit8 v2, p1, 8
    and-int/lit16 v2, v2, 255
    invoke-static { v1, v2 }, Ljava/lang/Math;->max(II)I
    move-result v1
    and-int/lit16 p1, p1, 255
    invoke-static { v1, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
    const/16 v1, 128
    if-le p1, v1, :L0
    const/4 p2, 1
  :L0
  .line 274
    if-eqz p2, :L1
    const/high16 p1, 0xB3000000
    goto :L2
  :L1
    const p1, -1275068417
  :L2
    const/high16 p2, 0x40800000
    const/4 v1, 0
    const/high16 v2, 0x3F800000
    invoke-virtual { v0, p2, v1, v2, p1 }, Landroid/widget/TextView;->setShadowLayer(FFFI)V
  :L3
  .line 276
    return-object v0
.end method

.method private tick()V
  .registers 8
  .line 344
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
    if-nez v0, :L0
    return-void
  :L0
  .line 345
    new-instance v0, Ljava/util/Date;
    invoke-direct { v0 }, Ljava/util/Date;-><init>()V
  .line 346
    invoke-static { p0 }, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z
    move-result v1
  .line 347
    if-eqz v1, :L1
    const-string v1, "kk:mm"
    goto :L2
  :L1
    const-string v1, "h:mm"
  :L2
    invoke-static { v1, v0 }, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Date;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
  .line 348
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
    invoke-virtual { v2, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 349
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
    if-nez v2, :L3
    return-void
  :L3
  .line 350
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
    move-result-object v2
    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;
  .line 351
    const-string v3, "EEEE"
    invoke-static { v3, v0 }, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Date;)Ljava/lang/CharSequence;
    move-result-object v3
    invoke-interface { v3 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v3
  .line 352
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v4
    const/4 v5, 1
    if-lez v4, :L4
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v6, 0
    invoke-virtual { v3, v6, v5 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v6, v2 }, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v4, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v3, v5 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
  :L4
  .line 353
    invoke-static { v5, v2 }, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v0
  .line 355
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
    invoke-virtual { v2 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v2
    invoke-virtual { v2, v1 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v1
    float-to-double v1, v1
    invoke-static { v1, v2 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v1
    double-to-int v1, v1
    iget v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->dateOver:I
    add-int/2addr v1, v2
  .line 356
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, ", "
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  .line 357
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
    invoke-virtual { v4, v1 }, Landroid/widget/TextView;->setMaxWidth(I)V
  .line 358
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
    invoke-virtual { v4 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v5
    invoke-virtual { v5, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v5
    int-to-float v1, v1
    cmpg-float v1, v5, v1
    if-gtz v1, :L5
    goto :L6
  :L5
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "\n"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  :L6
    invoke-virtual { v4, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 359
    return-void
.end method

.method private tint(Landroid/widget/FrameLayout;)V
  .registers 5
  .line 231
    const-string v0, "ss_tint"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 233
    const/4 v1, 1
    if-ne v0, v1, :L0
    const v0, -2130706433
    goto :L2
  :L0
  .line 234
    const/4 v1, 2
    const/high16 v2, 0x80000000
    if-ne v0, v1, :L1
    const/high16 v0, 0x80000000
    goto :L2
  :L1
  .line 235
    const/4 v1, 3
    if-ne v0, v1, :L3
    invoke-static { }, Lcom/innioasis/y1/activity/IppSaverActivity;->menuBackground()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    or-int/2addr v0, v2
  :L2
  .line 237
    new-instance v1, Landroid/view/View;
    invoke-direct { v1, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 238
    invoke-virtual { v1, v0 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 239
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v2, -1
    invoke-direct { v0, v2, v2 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p1, v1, v0 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 240
    return-void
  :L3
  .line 236
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
  .registers 6
  .line 179
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v0
  .line 180
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result v1
    const/4 v2, -1
    const/4 v3, 1
    if-nez v1, :L5
  .line 181
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz v1, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Tone;->key(Landroid/view/KeyEvent;)V
  :L0
  .line 182
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result p1
    if-nez p1, :L1
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->down:I
  :L1
  .line 183
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz p1, :L4
    sget-object p1, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { p1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result p1
    if-eq v0, p1, :L2
    sget-object p1, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { p1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result p1
    if-ne v0, p1, :L4
  :L2
  .line 184
    sget-object p1, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { p1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result p1
    if-ne v0, p1, :L3
    const/4 v2, 1
  :L3
  .line 185
    iget p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    add-int/2addr p1, v2
    add-int/lit8 p1, p1, 9
    rem-int/lit8 p1, p1, 9
    iput p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
  .line 186
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->layout()V
  :L4
  .line 188
    return v3
  :L5
  .line 190
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result p1
    if-ne p1, v3, :L8
    iget p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->down:I
    if-ne v0, p1, :L8
  .line 191
    iput v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->down:I
  .line 192
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-nez p1, :L6
  .line 193
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->finish()V
    goto :L8
  :L6
  .line 194
    sget-object p1, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { p1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result p1
    if-ne v0, p1, :L7
  .line 195
    const-string p1, "ss_style"
    iget v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 196
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->finish()V
    goto :L8
  :L7
  .line 197
    sget-object p1, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { p1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result p1
    if-ne v0, p1, :L8
  .line 198
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->finish()V
  :L8
  .line 201
    return v3
.end method

.method protected onCreate(Landroid/os/Bundle;)V
  .catchall { :L8 .. :L9 } :L10
  .registers 8
  .line 101
    invoke-super { p0, p1 }, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
  .line 102
    const/4 p1, 1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->requestWindowFeature(I)Z
  .line 103
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getWindow()Landroid/view/Window;
    move-result-object v0
  .line 104
    const/16 v1, 1024
    invoke-virtual { v0, v1, v1 }, Landroid/view/Window;->setFlags(II)V
  .line 105
    const/16 v1, 128
    invoke-virtual { v0, v1 }, Landroid/view/Window;->addFlags(I)V
  .line 106
    new-instance v0, Landroid/os/Handler;
    invoke-direct { v0 }, Landroid/os/Handler;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
  .line 107
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getIntent()Landroid/content/Intent;
    move-result-object v0
    const-string v1, "preview"
    const/4 v2, 0
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
  .line 108
    const-string v0, "ss_bright"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 109
    if-ltz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    array-length v1, v1
    if-lt v0, v1, :L1
  :L0
    const/16 v0, 29
  :L1
  .line 110
    sget-object v1, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    aget v0, v1, v0
    int-to-float v0, v0
    const/high16 v1, 0x42C80000
    div-float/2addr v0, v1
    const v1, 1008981770
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(FF)F
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->target:F
  .line 112
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz v1, :L2
    goto :L3
  :L2
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->systemBrightness()F
    move-result v0
  :L3
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->from:F
  .line 113
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->brightness(F)V
  .line 114
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-nez v0, :L4
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->fade:Ljava/lang/Runnable;
    const-wide/16 v3, 60
    invoke-virtual { v0, v1, v3, v4 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L4
  .line 115
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getIntent()Landroid/content/Intent;
    move-result-object v0
    const-string v1, "names"
    invoke-virtual { v0, v1 }, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->names:[Ljava/lang/String;
  .line 116
    const-string v0, "ss_style"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
  .line 117
    if-ltz v0, :L5
    const/16 v1, 9
    if-lt v0, v1, :L6
  :L5
    iput p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
  :L6
  .line 119
    new-instance v0, Landroid/widget/FrameLayout;
    invoke-direct { v0, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
  .line 120
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->background(Landroid/widget/FrameLayout;)V
  .line 121
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->tint(Landroid/widget/FrameLayout;)V
  .line 122
    new-instance v1, Landroid/widget/FrameLayout;
    invoke-direct { v1, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->content:Landroid/widget/FrameLayout;
  .line 123
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v4, -1
    invoke-direct { v3, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v1, v3 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 124
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz v1, :L7
  .line 125
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->band:Landroid/widget/TextView;
  .line 126
    const/16 v3, 17
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setGravity(I)V
  .line 127
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->band:Landroid/widget/TextView;
    invoke-virtual { v1, v4 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 128
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->band:Landroid/widget/TextView;
    sget-object v3, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v1, v3, p1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 129
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->band:Landroid/widget/TextView;
    const-string v1, "Hg"
    const/16 v3, 28
    const/high16 v5, 0x41B00000
    invoke-static { p1, v5, v1, v2, v3 }, Lcom/innioasis/y1/activity/IppSaverActivity;->fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .line 130
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->band:Landroid/widget/TextView;
    const/high16 v1, 0xB3000000
    invoke-virtual { p1, v1 }, Landroid/widget/TextView;->setBackgroundColor(I)V
  .line 131
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v1, 44
    invoke-direct { p1, v4, v1 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 132
    const/16 v1, 80
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 133
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->band:Landroid/widget/TextView;
    invoke-virtual { v0, v1, p1 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L7
  .line 135
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->setContentView(Landroid/view/View;)V
  .line 136
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->layout()V
  .line 138
    new-instance p1, Lcom/innioasis/y1/activity/IppSaverActivity$Rx;
    invoke-direct { p1, p0 }, Lcom/innioasis/y1/activity/IppSaverActivity$Rx;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;)V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->rx:Lcom/innioasis/y1/activity/IppSaverActivity$Rx;
  .line 139
    new-instance p1, Landroid/content/IntentFilter;
    const-string v0, "android.intent.action.TIME_TICK"
    invoke-direct { p1, v0 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
  .line 140
    const-string v0, "android.intent.action.TIME_SET"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 141
    const-string v0, "android.intent.action.TIMEZONE_CHANGED"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 142
    const-string v0, "android.intent.action.SCREEN_OFF"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 143
    const-string v0, "android.intent.action.ACTION_POWER_CONNECTED"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 144
    const-string v0, "android.intent.action.ACTION_POWER_DISCONNECTED"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 145
    const-string v0, "android.intent.action.MY_PLAY_SONG"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 146
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->rx:Lcom/innioasis/y1/activity/IppSaverActivity$Rx;
    invoke-virtual { p0, v0, p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 148
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-nez p1, :L12
  .line 149
    invoke-static { }, Lcom/innioasis/ipp/Saver;->opened()V
  :L8
  .line 152
    const-string p1, "power"
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Landroid/os/PowerManager;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    invoke-virtual { p1, v0, v1, v2 }, Landroid/os/PowerManager;->userActivity(JZ)V
  :L9
  .line 154
    goto :L11
  :L10
  .line 153
    move-exception p1
  :L11
  .line 155
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->armOff()V
  :L12
  .line 157
    return-void
.end method

.method protected onDestroy()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 167
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->sleep:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 168
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->fade:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  :L0
  .line 170
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->rx:Lcom/innioasis/y1/activity/IppSaverActivity$Rx;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
  :L1
  .line 172
    goto :L3
  :L2
  .line 171
    move-exception v0
  :L3
  .line 173
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-nez v0, :L4
    invoke-static { }, Lcom/innioasis/ipp/Saver;->closed()V
  :L4
  .line 174
    invoke-super { p0 }, Landroid/app/Activity;->onDestroy()V
  .line 175
    return-void
.end method

.method protected onStop()V
  .registers 1
  .line 161
    invoke-super { p0 }, Landroid/app/Activity;->onStop()V
  .line 162
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->finish()V
  .line 163
    return-void
.end method

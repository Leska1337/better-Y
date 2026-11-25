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

.field private final static BRIGHT_STEP:I = 5

.field private final static CATS:[Ljava/lang/String;

.field private final static COUNTS:[I

.field private final static COVER:I = 180

.field private final static COVER_CENTER:I = 170

.field private final static DARK:I = -15592942

.field private final static DATE_OVER:I = 70

.field public final static EXTRA_PREVIEW:Ljava/lang/String; = "preview"

.field private final static FADE_STEPS:I = 25

.field private final static FADE_STEP_MS:I = 60

.field private final static LIGHT:I = -1

.field private final static LINES:I = 2

.field private final static MARGIN:I = 24

.field private final static MENU_BG:I = -7564110

.field private final static TEXT_EDGE:I = 8

.field private final static TIP:Ljava/lang/String; = "ss_tip"

.field private final static TIP_OFF:Ljava/lang/String; = "style_hint_off"

.field private back:Landroid/widget/FrameLayout;

.field private band:Landroid/widget/TextView;

.field private blankPic:Landroid/graphics/Bitmap;

.field private cat:I

.field private clock:Landroid/widget/TextView;

.field private content:Landroid/widget/FrameLayout;

.field private cover:Landroid/widget/ImageView;

.field private coverPath:Ljava/lang/String;

.field private date:Landroid/widget/TextView;

.field private dateOver:I

.field private down:I

.field private final fade:Ljava/lang/Runnable;

.field private from:F

.field private head:Landroid/widget/TextView;

.field private lastCover:Landroid/graphics/Bitmap;

.field private lastPath:Ljava/lang/String;

.field private preview:Z

.field private rx:Lcom/innioasis/y1/activity/IppSaverActivity$Rx;

.field private final sleep:Ljava/lang/Runnable;

.field private step:I

.field private style:I

.field private target:F

.field private tip:Lcom/innioasis/ipp/TipDialog;

.field private ui:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 9
  .line 65
    const/4 v0, 6
    new-array v1, v0, [Ljava/lang/String;
    const-string v2, "ss_style"
    const/4 v3, 0
    aput-object v2, v1, v3
    const-string v2, "ss_bright"
    const/4 v4, 1
    aput-object v2, v1, v4
    const-string v2, "ss_background"
    const/4 v5, 2
    aput-object v2, v1, v5
    const-string v2, "ss_tint"
    const/4 v6, 3
    aput-object v2, v1, v6
    const-string v2, "ss_clock_color"
    const/4 v7, 4
    aput-object v2, v1, v7
    const-string v2, "ss_text_color"
    const/4 v8, 5
    aput-object v2, v1, v8
    sput-object v1, Lcom/innioasis/y1/activity/IppSaverActivity;->CATS:[Ljava/lang/String;
  .line 67
    new-array v0, v0, [I
    const/16 v1, 9
    aput v1, v0, v3
    sget-object v1, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    array-length v1, v1
    aput v1, v0, v4
    aput v6, v0, v5
    aput v7, v0, v6
    aput v6, v0, v7
    aput v6, v0, v8
    sput-object v0, Lcom/innioasis/y1/activity/IppSaverActivity;->COUNTS:[I
    return-void
.end method

.method public constructor <init>()V
  .registers 2
  .line 56
    invoke-direct { p0 }, Landroid/app/Activity;-><init>()V
  .line 103
    new-instance v0, Lcom/innioasis/y1/activity/IppSaverActivity$Sleep;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppSaverActivity$Sleep;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->sleep:Ljava/lang/Runnable;
  .line 104
    new-instance v0, Lcom/innioasis/y1/activity/IppSaverActivity$Fade;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppSaverActivity$Fade;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->fade:Ljava/lang/Runnable;
  .line 110
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
  .line 576
    invoke-virtual { p1, p2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 577
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v0, -1
    const/4 v1, -2
    invoke-direct { p2, v0, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 578
    iput p3, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
  .line 579
    invoke-virtual { p0, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 580
    return-void
.end method

.method private armOff()V
  .registers 6
  .line 631
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->sleep:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 632
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 633
    const-string v0, "ss_off"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 634
    if-ltz v0, :L1
    sget-object v1, Lcom/innioasis/ipp/Saver;->OFF_MS:[I
    array-length v1, v1
    if-lt v0, v1, :L2
  :L1
    const/4 v0, 3
  :L2
  .line 635
    sget-object v1, Lcom/innioasis/ipp/Saver;->OFF_MS:[I
    aget v0, v1, v0
  .line 636
    if-nez v0, :L3
    return-void
  :L3
  .line 637
    const-string v1, "ss_charging"
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L4
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->charging()Z
    move-result v1
    if-eqz v1, :L4
    return-void
  :L4
  .line 638
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->sleep:Ljava/lang/Runnable;
    int-to-long v3, v0
    invoke-virtual { v1, v2, v3, v4 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 639
    return-void
.end method

.method private background(Landroid/widget/FrameLayout;)V
  .registers 5
  .line 286
    const-string v0, "ss_background"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 287
    const/4 v1, -1
    if-nez v0, :L0
  .line 288
    invoke-virtual { p1, v1 }, Landroid/widget/FrameLayout;->setBackgroundColor(I)V
  .line 289
    return-void
  :L0
  .line 291
    const/high16 v2, 0xFF000000
    invoke-virtual { p1, v2 }, Landroid/widget/FrameLayout;->setBackgroundColor(I)V
  .line 292
    const/4 v2, 2
    if-eq v0, v2, :L1
    return-void
  :L1
  .line 293
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct { v0, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 294
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 295
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v2, v1, v1 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p1, v0, v2 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 296
    const-string p1, "ss_image"
    const/4 v1, 0
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Prefs;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 297
    if-nez p1, :L2
    goto :L3
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Saver;->wall(Landroid/content/Context;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L3
  .line 298
    if-eqz v1, :L4
  .line 299
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    goto :L6
  :L4
  .line 300
    if-eqz p1, :L5
  .line 301
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;
    invoke-direct { v2, p0, v0, p1 }, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;Landroid/widget/ImageView;Ljava/lang/String;)V
    const-string p1, "ipp-saver-wall"
    invoke-direct { v1, v2, p1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
    goto :L6
  :L5
  .line 303
    sget-object p1, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { p1 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object p1
  .line 304
    if-eqz p1, :L6
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L6
  .line 306
    return-void
.end method

.method private band(Landroid/widget/FrameLayout;I)Landroid/widget/TextView;
  .registers 9
  .line 216
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 217
    const/16 v1, 17
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 218
    const/4 v1, -1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 219
    sget-object v2, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v3, 1
    invoke-virtual { v0, v2, v3 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 220
    const/4 v2, 0
    const/16 v3, 28
    const/high16 v4, 0x41B00000
    const-string v5, "Hg"
    invoke-static { v0, v4, v5, v2, v3 }, Lcom/innioasis/y1/activity/IppSaverActivity;->fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .line 221
    const/high16 v2, 0xB3000000
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setBackgroundColor(I)V
  .line 222
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;
    const/16 v3, 44
    invoke-direct { v2, v1, v3 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 223
    iput p2, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 224
    invoke-virtual { p1, v0, v2 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 225
    return-object v0
.end method

.method private bands()V
  .registers 7
  .line 264
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->head:Landroid/widget/TextView;
    if-nez v0, :L0
    return-void
  :L0
  .line 265
    sget-object v0, Lcom/innioasis/y1/activity/IppSaverActivity;->CATS:[Ljava/lang/String;
    iget v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cat:I
    aget-object v0, v0, v1
  .line 266
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Help;->row(Landroid/content/Context;Ljava/lang/String;)Lcom/innioasis/ipp/Help$Row;
    move-result-object v1
  .line 267
    if-eqz v1, :L1
    iget-object v2, v1, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    if-eqz v2, :L1
    iget-object v2, v1, Lcom/innioasis/ipp/Help$Row;->label:Ljava/lang/String;
    goto :L2
  :L1
    move-object v2, v0
  :L2
  .line 268
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->head:Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "\u2039  "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, "  \u203a"
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v3, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 269
    iget v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cat:I
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppSaverActivity;->current(I)I
    move-result v2
  .line 271
    const-string v3, "ss_bright"
    invoke-virtual { v3, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    sget-object v1, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    aget v1, v1, v2
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "%"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    goto :L5
  :L3
  .line 272
    if-eqz v1, :L4
    iget-object v0, v1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    if-eqz v0, :L4
    iget-object v0, v1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    array-length v0, v0
    if-ge v2, v0, :L4
    iget-object v0, v1, Lcom/innioasis/ipp/Help$Row;->values:[Ljava/lang/String;
    aget-object v0, v0, v2
    goto :L5
  :L4
  .line 273
    add-int/lit8 v2, v2, 1
    invoke-static { v2 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v0
  :L5
  .line 274
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->band:Landroid/widget/TextView;
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 275
    return-void
.end method

.method private blank()Landroid/graphics/Bitmap;
  .catchall { :L1 .. :L8 } :L9
  .registers 6
  .line 541
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->blankPic:Landroid/graphics/Bitmap;
  .line 542
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v1
    if-nez v1, :L0
    return-object v0
  :L0
  .line 544
    const/4 v0, 0
  :L1
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 545
    const/4 v2, 0
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131230831
    invoke-static { v2, v3, v1 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 547
    if-nez v1, :L2
    return-object v0
  :L2
  .line 548
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
  .line 549
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 550
    if-gt v2, v3, :L3
    move v4, v2
    goto :L4
  :L3
    move v4, v3
  :L4
  .line 551
    if-ne v4, v2, :L6
    if-ne v4, v3, :L6
  :L5
    goto :L7
  :L6
    sub-int/2addr v2, v4
    div-int/lit8 v2, v2, 2
    sub-int/2addr v3, v4
    div-int/lit8 v3, v3, 2
    invoke-static { v1, v2, v3, v4, v4 }, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;
    move-result-object v1
    goto :L5
  :L7
  .line 552
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->blankPic:Landroid/graphics/Bitmap;
  :L8
  .line 553
    return-object v1
  :L9
  .line 554
    move-exception v1
  .line 555
    return-object v0
.end method

.method private brightness(F)V
  .registers 3
  .line 603
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v0
  .line 604
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F
  .line 605
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getWindow()Landroid/view/Window;
    move-result-object p1
    invoke-virtual { p1, v0 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  .line 606
    return-void
.end method

.method private centerCover(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)I
  .registers 6
  .line 561
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I
    add-int/lit8 v0, v0, -48
  .line 562
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I
  .line 563
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
  .line 564
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

.method private change(I)V
  .registers 8
  .line 236
    sget-object v0, Lcom/innioasis/y1/activity/IppSaverActivity;->CATS:[Ljava/lang/String;
    iget v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cat:I
    aget-object v0, v0, v1
  .line 237
    sget-object v2, Lcom/innioasis/y1/activity/IppSaverActivity;->COUNTS:[I
    aget v1, v2, v1
  .line 239
    const-string v2, "ss_bright"
    invoke-virtual { v2, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L2
  .line 242
    sget-object v3, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    iget v4, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cat:I
    invoke-direct { p0, v4 }, Lcom/innioasis/y1/activity/IppSaverActivity;->current(I)I
    move-result v4
    aget v3, v3, v4
  .line 243
    if-lez p1, :L0
    div-int/lit8 v3, v3, 5
    add-int/lit8 v3, v3, 1
    mul-int/lit8 v3, v3, 5
    goto :L1
  :L0
  .line 244
    add-int/lit8 v3, v3, 5
    add-int/lit8 v3, v3, -1
    div-int/lit8 v3, v3, 5
    add-int/lit8 v3, v3, -1
    mul-int/lit8 v3, v3, 5
  :L1
  .line 245
    sget-object p1, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    const/4 v4, 0
    aget p1, p1, v4
    sget-object v5, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    add-int/lit8 v1, v1, -1
    aget v1, v5, v1
    invoke-static { v1, v3 }, Ljava/lang/Math;->min(II)I
    move-result v1
    invoke-static { p1, v1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 246
    sget-object v1, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    aget v1, v1, v4
    sub-int/2addr p1, v1
  .line 247
    goto :L3
  :L2
  .line 248
    iget v3, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cat:I
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppSaverActivity;->current(I)I
    move-result v3
    add-int/2addr v3, p1
    add-int/2addr v3, v1
    rem-int p1, v3, v1
  :L3
  .line 250
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 251
    const-string v1, "ss_style"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L4
  .line 252
    iput p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    goto :L7
  :L4
  .line 253
    invoke-virtual { v2, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L5
  .line 254
    sget-object v1, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    aget p1, v1, p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Backlight;->window(I)F
    move-result p1
    iput p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->target:F
  .line 255
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->brightness(F)V
    goto :L7
  :L5
  .line 256
    const-string p1, "ss_background"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L6
    const-string p1, "ss_tint"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L7
  :L6
  .line 257
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->paintBack()V
  :L7
  .line 259
    invoke-virtual { v2, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L8
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->layout()V
  :L8
  .line 260
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->bands()V
  .line 261
    return-void
.end method

.method private charging()Z
  .catchall { :L0 .. :L1 } :L3
  .registers 4
  .line 643
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.BATTERY_CHANGED"
    invoke-direct { v1, v2 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
    const/4 v2, 0
    invoke-virtual { p0, v2, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    move-result-object v1
  .line 644
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
  .line 645
    move-exception v1
  .line 646
    return v0
.end method

.method private clockBlock(IZ)V
  .registers 10
  .line 395
    const/4 v0, 0
    const/4 v1, 1
    if-ne p1, v1, :L0
    const/16 v2, 70
    goto :L1
  :L0
    const/4 v2, 0
  :L1
    iput v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->dateOver:I
  .line 396
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 397
    invoke-virtual { v2, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 398
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->gravityOf(I)I
    move-result v3
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 399
    const-string v3, "ss_clock_color"
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppSaverActivity;->color(Ljava/lang/String;)I
    move-result v3
    invoke-direct { p0, v3, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->text(IZ)Landroid/widget/TextView;
    move-result-object v1
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
  .line 400
    const/16 v3, 320
    const/16 v4, 116
    const/high16 v5, 0x42DC0000
    const-string v6, "00:00"
    invoke-static { v1, v5, v6, v3, v4 }, Lcom/innioasis/y1/activity/IppSaverActivity;->fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .line 401
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -2
    invoke-direct { v3, v4, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v1, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 402
    if-eqz p2, :L2
  .line 403
    const-string p2, "ss_text_color"
    invoke-direct { p0, p2 }, Lcom/innioasis/y1/activity/IppSaverActivity;->color(Ljava/lang/String;)I
    move-result p2
    invoke-direct { p0, p2, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->text(IZ)Landroid/widget/TextView;
    move-result-object p2
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
  .line 404
    const-string v1, "Hg"
    const/16 v3, 30
    const/high16 v5, 0x41C00000
    invoke-static { p2, v5, v1, v0, v3 }, Lcom/innioasis/y1/activity/IppSaverActivity;->fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .line 405
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->gravityOf(I)I
    move-result v0
    invoke-virtual { p2, v0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 406
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v4, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 407
    const/16 v0, 8
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
  .line 408
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
    invoke-virtual { v2, v0, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L2
  .line 410
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { p2, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 411
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->gravityOf(I)I
    move-result p1
    or-int/lit8 p1, p1, 16
    iput p1, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 412
    const/16 p1, 24
    iput p1, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 413
    iput p1, p2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I
  .line 414
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->content:Landroid/widget/FrameLayout;
    invoke-virtual { p1, v2, p2 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 415
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->tick()V
  .line 416
    return-void
.end method

.method private color(Ljava/lang/String;)I
  .registers 3
  .line 335
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p1
  .line 336
    const/4 v0, 1
    if-ne p1, v0, :L0
    const p1, -15592942
    return p1
  :L0
  .line 337
    const/4 v0, 2
    if-ne p1, v0, :L2
  .line 338
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result p1
  .line 339
    if-nez p1, :L1
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeColor()I
    move-result p1
  :L1
  .line 340
    if-eqz p1, :L2
    const/high16 v0, 0xFF000000
    or-int/2addr p1, v0
    return p1
  :L2
  .line 342
    const/4 p1, -1
    return p1
.end method

.method private current(I)I
  .registers 4
  .line 229
    if-nez p1, :L0
    iget p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    return p1
  :L0
  .line 230
    sget-object v0, Lcom/innioasis/y1/activity/IppSaverActivity;->CATS:[Ljava/lang/String;
    aget-object v0, v0, p1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 231
    if-ltz v0, :L1
    sget-object v1, Lcom/innioasis/y1/activity/IppSaverActivity;->COUNTS:[I
    aget p1, v1, p1
    if-lt v0, p1, :L2
  :L1
    const/4 v0, 0
  :L2
    return v0
.end method

.method private fadeStep()V
  .registers 5
  .line 609
    iget v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->step:I
    add-int/lit8 v0, v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->step:I
  .line 610
    int-to-float v0, v0
    const/high16 v1, 0x41C80000
    div-float/2addr v0, v1
    const/high16 v1, 0x3F800000
    invoke-static { v1, v0 }, Ljava/lang/Math;->min(FF)F
    move-result v0
  .line 611
    iget v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->from:F
    iget v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->target:F
    sub-float/2addr v2, v1
    mul-float v2, v2, v0
    add-float/2addr v1, v2
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->brightness(F)V
  .line 612
    iget v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->step:I
    const/16 v1, 25
    if-ge v0, v1, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->fade:Ljava/lang/Runnable;
    const-wide/16 v2, 60
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L0
  .line 613
    return-void
.end method

.method private static fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .registers 9
  .line 363
    new-instance v0, Landroid/text/TextPaint;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 364
    nop
  :L0
  .line 365
    const/high16 v1, 0x41000000
    cmpl-float v1, p1, v1
    if-lez v1, :L3
  .line 366
    invoke-virtual { v0, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 367
    invoke-virtual { v0 }, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;
    move-result-object v1
  .line 368
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
  .line 365
    const/high16 v1, 0x3F800000
    sub-float/2addr p1, v1
    goto :L0
  :L3
  .line 370
    const/4 p2, 0
    invoke-virtual { p0, p2, p1 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 371
    return-void
.end method

.method private goToSleep()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 652
    const-string v0, "power"
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/os/PowerManager;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-virtual { v0, v1, v2 }, Landroid/os/PowerManager;->goToSleep(J)V
  :L1
  .line 656
    goto :L3
  :L2
  .line 653
    move-exception v0
  .line 655
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getWindow()Landroid/view/Window;
    move-result-object v0
    const/16 v1, 128
    invoke-virtual { v0, v1 }, Landroid/view/Window;->clearFlags(I)V
  :L3
  .line 657
    return-void
.end method

.method private static gravityOf(I)I
  .registers 2
  .line 374
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
  .registers 5
  .line 379
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->content:Landroid/widget/FrameLayout;
    invoke-virtual { v0 }, Landroid/widget/FrameLayout;->removeAllViews()V
  .line 380
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
  .line 381
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
  .line 382
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
  .line 383
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
  .line 384
    iget v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    invoke-static { v1 }, Lcom/innioasis/ipp/Saver;->kind(I)I
    move-result v1
  .line 385
    iget v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    invoke-static { v2 }, Lcom/innioasis/ipp/Saver;->side(I)I
    move-result v2
  .line 386
    const/4 v3, 2
    if-ne v1, v3, :L0
    invoke-static { }, Lcom/innioasis/y1/activity/IppSaverActivity;->playing()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L0
  .line 387
    if-eqz v0, :L1
  .line 388
    invoke-direct { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppSaverActivity;->song(Lcom/innioasis/y1/database/Song;I)V
    goto :L4
  :L1
  .line 390
    const/4 v0, 1
    if-ne v1, v0, :L2
    goto :L3
  :L2
    const/4 v0, 0
  :L3
    invoke-direct { p0, v2, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->clockBlock(IZ)V
  :L4
  .line 392
    return-void
.end method

.method private line(Ljava/lang/String;IZFI)Landroid/widget/TextView;
  .registers 7
  .line 446
    invoke-direct { p0, p2, p3 }, Lcom/innioasis/y1/activity/IppSaverActivity;->text(IZ)Landroid/widget/TextView;
    move-result-object p2
  .line 447
    const-string p3, "Hg"
    const/4 v0, 0
    invoke-static { p2, p4, p3, v0, p5 }, Lcom/innioasis/y1/activity/IppSaverActivity;->fit(Landroid/widget/TextView;FLjava/lang/String;II)V
  .line 448
    const/4 p3, 2
    invoke-virtual { p2, p3 }, Landroid/widget/TextView;->setMaxLines(I)V
  .line 449
    sget-object p3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { p2, p3 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 450
    invoke-virtual { p2, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 451
    return-object p2
.end method

.method private static menuBackground()I
  .catchall { :L0 .. :L1 } :L3
  .registers 1
  :L0
  .line 323
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 324
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  :L1
    return v0
  :L2
  .line 326
    goto :L4
  :L3
  .line 325
    move-exception v0
  :L4
  .line 327
    const v0, -7564110
    return v0
.end method

.method private onPicture()Z
  .registers 3
  .line 331
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

.method private paintBack()V
  .registers 2
  .line 278
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->back:Landroid/widget/FrameLayout;
    invoke-virtual { v0 }, Landroid/widget/FrameLayout;->removeAllViews()V
  .line 279
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->back:Landroid/widget/FrameLayout;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->background(Landroid/widget/FrameLayout;)V
  .line 280
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->back:Landroid/widget/FrameLayout;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->tint(Landroid/widget/FrameLayout;)V
  .line 281
    return-void
.end method

.method private static playing()Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L2 } :L3
  .registers 2
  .line 438
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 439
    if-nez v1, :L1
    goto :L2
  :L1
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 440
    move-exception v1
  .line 441
    return-object v0
.end method

.method private song(Lcom/innioasis/y1/database/Song;I)V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L9 .. :L10 } :L11
  .registers 14
  .line 455
    const-string v0, "ss_text_color"
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->color(Ljava/lang/String;)I
    move-result v0
  .line 456
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
  .line 457
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v1
  :L0
  .line 459
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Feat;->artist(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v1
  :L1
  .line 461
    goto :L3
  :L2
  .line 460
    move-exception v2
  :L3
  .line 462
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
  .line 463
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 464
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
  .line 466
    new-instance v1, Landroid/widget/ImageView;
    invoke-direct { v1, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
  .line 467
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v1, v2 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 468
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
  .line 469
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->lastPath:Ljava/lang/String;
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L7
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->lastCover:Landroid/graphics/Bitmap;
    goto :L8
  :L7
    const/4 p1, 0
  :L8
  .line 470
    if-nez p1, :L12
  :L9
  .line 472
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L10
  .line 474
    goto :L12
  :L11
  .line 473
    move-exception v1
  :L12
  .line 476
    if-eqz p1, :L13
  .line 477
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    invoke-virtual { v1, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 478
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->lastPath:Ljava/lang/String;
  .line 479
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->lastCover:Landroid/graphics/Bitmap;
    goto :L15
  :L13
  .line 481
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->blank()Landroid/graphics/Bitmap;
    move-result-object p1
  .line 482
    if-eqz p1, :L14
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    invoke-virtual { v1, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L14
  .line 483
    new-instance p1, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
    invoke-direct { v1, p0, v2 }, Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;Ljava/lang/String;)V
    const-string v2, "ipp-saver-cover"
    invoke-direct { p1, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  :L15
  .line 486
    const/4 p1, -1
    const/4 v1, 6
    const/16 v2, 16
    const/4 v3, -2
    const/16 v4, 24
    const/4 v5, 1
    if-ne p2, v5, :L16
  .line 487
    new-instance p2, Landroid/widget/LinearLayout;
    invoke-direct { p2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 488
    invoke-virtual { p2, v5 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 489
    invoke-virtual { p2, v5 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 490
    invoke-direct { p0, v7, v9, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->centerCover(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)I
    move-result v6
  .line 491
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v6, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p2, v8, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 492
    const/16 v6, 14
    invoke-static { p2, v7, v5, v6 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 493
    invoke-static { p2, v9, v5, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 494
    const/4 v1, 4
    invoke-static { p2, v0, v5, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 495
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v0, p1, v3 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 496
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 497
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 498
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I
  .line 499
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->content:Landroid/widget/FrameLayout;
    invoke-virtual { p1, p2, v0 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 500
    return-void
  :L16
  .line 502
    const/4 v6, 0
    if-nez p2, :L17
    const/4 p2, 1
    goto :L18
  :L17
    const/4 p2, 0
  :L18
  .line 503
    new-instance v8, Landroid/widget/LinearLayout;
    invoke-direct { v8, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 504
    invoke-virtual { v8, v6 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 505
    invoke-virtual { v8, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 506
    new-instance v10, Landroid/widget/LinearLayout;
    invoke-direct { v10, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 507
    invoke-virtual { v10, v5 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 508
    if-eqz p2, :L19
    const/4 v5, 3
    goto :L20
  :L19
    const/4 v5, 5
  :L20
  .line 509
    invoke-static { v10, v7, v5, v6 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 510
    const/16 v7, 8
    invoke-static { v10, v9, v5, v7 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 511
    invoke-static { v10, v0, v5, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->addLine(Landroid/widget/LinearLayout;Landroid/widget/TextView;II)V
  .line 512
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v1, 180
    invoke-direct { v0, v1, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 513
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v5, 0x3F800000
    invoke-direct { v1, v6, v3, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
  .line 514
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v5, p1, v3 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 515
    iput v2, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 517
    const/16 p1, 20
    if-eqz p2, :L21
  .line 518
    iput p1, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I
  .line 519
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    invoke-virtual { v8, p1, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 520
    invoke-virtual { v8, v10, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 521
    iput v4, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 522
    iput v7, v5, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I
    goto :L22
  :L21
  .line 524
    iput p1, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 525
    invoke-virtual { v8, v10, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 526
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cover:Landroid/widget/ImageView;
    invoke-virtual { v8, p1, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 527
    iput v7, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 528
    iput v4, v5, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I
  :L22
  .line 530
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->content:Landroid/widget/FrameLayout;
    invoke-virtual { p1, v8, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 531
    return-void
.end method

.method private songChanged()V
  .registers 3
  .line 583
    iget v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
    invoke-static { v0 }, Lcom/innioasis/ipp/Saver;->kind(I)I
    move-result v0
    const/4 v1, 2
    if-eq v0, v1, :L0
    return-void
  :L0
  .line 584
    invoke-static { }, Lcom/innioasis/y1/activity/IppSaverActivity;->playing()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 585
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 586
    if-eqz v0, :L3
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->coverPath:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    return-void
  :L3
  .line 587
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->layout()V
  .line 588
    return-void
.end method

.method private systemBrightness()F
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 594
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0
    const-string v1, "screen_brightness"
    invoke-static { v0, v1 }, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    move-result v0
  .line 596
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
  .line 597
    move-exception v0
  .line 598
    iget v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->target:F
    return v0
.end method

.method private static tall(Landroid/widget/TextView;I)I
  .registers 12
  .line 568
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 569
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
  .line 571
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;
    move-result-object p0
  .line 572
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
  .line 346
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 347
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 348
    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v0, v1, p2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 349
    const/4 p2, 0
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 350
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->onPicture()Z
    move-result v1
    if-eqz v1, :L3
  .line 352
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
  .line 353
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
  .line 355
    return-object v0
.end method

.method private tick()V
  .registers 8
  .line 419
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
    if-nez v0, :L0
    return-void
  :L0
  .line 420
    new-instance v0, Ljava/util/Date;
    invoke-direct { v0 }, Ljava/util/Date;-><init>()V
  .line 421
    invoke-static { p0 }, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z
    move-result v1
  .line 422
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
  .line 423
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->clock:Landroid/widget/TextView;
    invoke-virtual { v2, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 424
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
    if-nez v2, :L3
    return-void
  :L3
  .line 425
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
    move-result-object v2
    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;
  .line 426
    const-string v3, "EEEE"
    invoke-static { v3, v0 }, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Date;)Ljava/lang/CharSequence;
    move-result-object v3
    invoke-interface { v3 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v3
  .line 427
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
  .line 428
    invoke-static { v5, v2 }, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v0
  .line 430
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
  .line 431
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
  .line 432
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->date:Landroid/widget/TextView;
    invoke-virtual { v4, v1 }, Landroid/widget/TextView;->setMaxWidth(I)V
  .line 433
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
  .line 434
    return-void
.end method

.method private tint(Landroid/widget/FrameLayout;)V
  .registers 5
  .line 310
    const-string v0, "ss_tint"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 312
    const/4 v1, 1
    if-ne v0, v1, :L0
    const v0, -2130706433
    goto :L2
  :L0
  .line 313
    const/4 v1, 2
    const/high16 v2, 0x80000000
    if-ne v0, v1, :L1
    const/high16 v0, 0x80000000
    goto :L2
  :L1
  .line 314
    const/4 v1, 3
    if-ne v0, v1, :L3
    invoke-static { }, Lcom/innioasis/y1/activity/IppSaverActivity;->menuBackground()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    or-int/2addr v0, v2
  :L2
  .line 316
    new-instance v1, Landroid/view/View;
    invoke-direct { v1, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 317
    invoke-virtual { v1, v0 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 318
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v2, -1
    invoke-direct { v0, v2, v2 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p1, v1, v0 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 319
    return-void
  :L3
  .line 315
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
  .registers 7
  .line 191
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v0
  .line 192
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result v1
    const/4 v2, -1
    const/4 v3, 1
    if-nez v1, :L8
  .line 193
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz v1, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Tone;->key(Landroid/view/KeyEvent;)V
  :L0
  .line 194
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result v1
    if-nez v1, :L1
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->down:I
  :L1
  .line 195
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz v1, :L7
  .line 196
    sget-object v1, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 197
    invoke-virtual { v1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v4
    if-eq v0, v4, :L5
    invoke-virtual { v1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v4
    if-ne v0, v4, :L2
    goto :L5
  :L2
  .line 199
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result p1
    if-nez p1, :L7
    invoke-virtual { v1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_LEFT()I
    move-result p1
    if-eq v0, p1, :L3
    invoke-virtual { v1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result p1
    if-ne v0, p1, :L7
  :L3
  .line 200
    iget p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cat:I
    invoke-virtual { v1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result v1
    if-ne v0, v1, :L4
    const/4 v2, 1
  :L4
    add-int/2addr p1, v2
    sget-object v0, Lcom/innioasis/y1/activity/IppSaverActivity;->CATS:[Ljava/lang/String;
    array-length v1, v0
    add-int/2addr p1, v1
    array-length v0, v0
    rem-int/2addr p1, v0
    iput p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->cat:I
  .line 201
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->bands()V
    goto :L7
  :L5
  .line 198
    invoke-virtual { v1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result p1
    if-ne v0, p1, :L6
    const/4 v2, 1
  :L6
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppSaverActivity;->change(I)V
  :L7
  .line 204
    return v3
  :L8
  .line 206
    invoke-virtual { p1 }, Landroid/view/KeyEvent;->getAction()I
    move-result p1
    if-ne p1, v3, :L10
    iget p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->down:I
    if-ne v0, p1, :L10
  .line 207
    iput v2, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->down:I
  .line 208
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz p1, :L9
    sget-object p1, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { p1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result p1
    if-ne v0, p1, :L10
  :L9
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->finish()V
  :L10
  .line 210
    return v3
.end method

.method protected onCreate(Landroid/os/Bundle;)V
  .catchall { :L9 .. :L10 } :L11
  .registers 7
  .line 114
    invoke-super { p0, p1 }, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
  .line 115
    const/4 p1, 1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->requestWindowFeature(I)Z
  .line 116
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getWindow()Landroid/view/Window;
    move-result-object v0
  .line 117
    const/16 v1, 1024
    invoke-virtual { v0, v1, v1 }, Landroid/view/Window;->setFlags(II)V
  .line 118
    const/16 v1, 128
    invoke-virtual { v0, v1 }, Landroid/view/Window;->addFlags(I)V
  .line 119
    new-instance v0, Landroid/os/Handler;
    invoke-direct { v0 }, Landroid/os/Handler;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
  .line 120
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getIntent()Landroid/content/Intent;
    move-result-object v0
    const-string v1, "preview"
    const/4 v2, 0
    invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
  .line 121
    const-string v0, "ss_bright"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 122
    if-ltz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    array-length v1, v1
    if-lt v0, v1, :L1
  :L0
    const/16 v0, 30
  :L1
  .line 123
    sget-object v1, Lcom/innioasis/ipp/Saver;->BRIGHTS:[I
    aget v0, v1, v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Backlight;->window(I)F
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->target:F
  .line 125
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz v1, :L2
    goto :L3
  :L2
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->systemBrightness()F
    move-result v0
  :L3
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->from:F
  .line 126
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->brightness(F)V
  .line 127
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-nez v0, :L4
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->fade:Ljava/lang/Runnable;
    const-wide/16 v3, 60
    invoke-virtual { v0, v1, v3, v4 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L4
  .line 128
    const-string v0, "ss_style"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
  .line 129
    if-ltz v0, :L5
    const/16 v1, 9
    if-lt v0, v1, :L6
  :L5
    iput p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->style:I
  :L6
  .line 131
    new-instance p1, Landroid/widget/FrameLayout;
    invoke-direct { p1, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
  .line 132
    new-instance v0, Landroid/widget/FrameLayout;
    invoke-direct { v0, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->back:Landroid/widget/FrameLayout;
  .line 133
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v3, -1
    invoke-direct { v1, v3, v3 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p1, v0, v1 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 134
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->paintBack()V
  .line 135
    new-instance v0, Landroid/widget/FrameLayout;
    invoke-direct { v0, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->content:Landroid/widget/FrameLayout;
  .line 136
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v1, v3, v3 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p1, v0, v1 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 137
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz v0, :L7
  .line 138
    const/16 v0, 48
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->band(Landroid/widget/FrameLayout;I)Landroid/widget/TextView;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->head:Landroid/widget/TextView;
  .line 139
    const/16 v0, 80
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->band(Landroid/widget/FrameLayout;I)Landroid/widget/TextView;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->band:Landroid/widget/TextView;
  :L7
  .line 141
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->setContentView(Landroid/view/View;)V
  .line 142
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->layout()V
  .line 143
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->bands()V
  .line 144
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-eqz p1, :L8
    const-string p1, "ss_tip"
    const-string v0, "style_hint_off"
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/TipDialog;->show(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Lcom/innioasis/ipp/TipDialog;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->tip:Lcom/innioasis/ipp/TipDialog;
  :L8
  .line 146
    new-instance p1, Lcom/innioasis/y1/activity/IppSaverActivity$Rx;
    invoke-direct { p1, p0 }, Lcom/innioasis/y1/activity/IppSaverActivity$Rx;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;)V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->rx:Lcom/innioasis/y1/activity/IppSaverActivity$Rx;
  .line 147
    new-instance p1, Landroid/content/IntentFilter;
    const-string v0, "android.intent.action.TIME_TICK"
    invoke-direct { p1, v0 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
  .line 148
    const-string v0, "android.intent.action.TIME_SET"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 149
    const-string v0, "android.intent.action.TIMEZONE_CHANGED"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 150
    const-string v0, "android.intent.action.SCREEN_OFF"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 151
    const-string v0, "android.intent.action.ACTION_POWER_CONNECTED"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 152
    const-string v0, "android.intent.action.ACTION_POWER_DISCONNECTED"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 153
    const-string v0, "android.intent.action.MY_PLAY_SONG"
    invoke-virtual { p1, v0 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 154
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->rx:Lcom/innioasis/y1/activity/IppSaverActivity$Rx;
    invoke-virtual { p0, v0, p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 156
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-nez p1, :L13
  .line 157
    invoke-static { }, Lcom/innioasis/ipp/Saver;->opened()V
  :L9
  .line 160
    const-string p1, "power"
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Landroid/os/PowerManager;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    invoke-virtual { p1, v0, v1, v2 }, Landroid/os/PowerManager;->userActivity(JZ)V
  :L10
  .line 162
    goto :L12
  :L11
  .line 161
    move-exception p1
  :L12
  .line 163
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->armOff()V
  :L13
  .line 165
    return-void
.end method

.method protected onDestroy()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L5
  .registers 3
  .line 175
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->sleep:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 176
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->fade:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  :L0
  .line 178
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->tip:Lcom/innioasis/ipp/TipDialog;
    if-eqz v0, :L1
    invoke-virtual { v0 }, Lcom/innioasis/ipp/TipDialog;->isShowing()Z
    move-result v0
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->tip:Lcom/innioasis/ipp/TipDialog;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/TipDialog;->dismiss()V
  :L1
  .line 180
    goto :L3
  :L2
  .line 179
    move-exception v0
  :L3
  .line 182
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->rx:Lcom/innioasis/y1/activity/IppSaverActivity$Rx;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
  :L4
  .line 184
    goto :L6
  :L5
  .line 183
    move-exception v0
  :L6
  .line 185
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity;->preview:Z
    if-nez v0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Saver;->closed()V
  :L7
  .line 186
    invoke-super { p0 }, Landroid/app/Activity;->onDestroy()V
  .line 187
    return-void
.end method

.method protected onStop()V
  .registers 1
  .line 169
    invoke-super { p0 }, Landroid/app/Activity;->onStop()V
  .line 170
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->finish()V
  .line 171
    return-void
.end method

.class public final Lcom/innioasis/ipp/MenuStyle;
.super Ljava/lang/Object;
.source "MenuStyle.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/MenuStyle$VideoLevel;,
    Lcom/innioasis/ipp/MenuStyle$Load;,
    Lcom/innioasis/ipp/MenuStyle$Drop;,
    Lcom/innioasis/ipp/MenuStyle$Show;
  }
.end annotation

.field private final static DROP:Ljava/lang/Runnable;

.field private final static FILTER:Landroid/graphics/Paint;

.field public final static KEY:Ljava/lang/String; = "menu_style"

.field private final static LOGO_SIDE:I = 360

.field private final static MAIN_PICS:[I

.field private final static MAIN_ROWS:[I

.field private final static PIC_RIGHT:I = 23

.field private final static PIC_TOP:I = 86

.field private final static PIC_W:I = 179

.field private final static PREVIEWS:Ljava/util/HashMap;

.field private final static PROBE:Ljava/lang/Object;

.field private final static SET_W:I = 227

.field private final static SIMPLE:I = 1

.field private final static SPLIT_W:I = 213

.field private static half:Landroid/graphics/Bitmap;

.field private static loader:Landroid/os/Handler;

.field private static logoBmp:Landroid/graphics/Bitmap;

.field private static logoTheme:Ljava/lang/String;

.field private static main:Landroid/os/Handler;

.field private static mainLoaded:Z

.field private static scratch:Landroid/graphics/Bitmap;

.field private static videoStack:Ljava/lang/reflect/Field;

.method static constructor <clinit>()V
  .registers 2
  .line 424
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
  .line 425
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
  .line 431
    const/16 v0, 12
    new-array v1, v0, [I
    fill-array-data v1, :L0
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->MAIN_ROWS:[I
  .line 436
    new-array v0, v0, [I
    fill-array-data v0, :L1
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->MAIN_PICS:[I
  .line 506
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->FILTER:Landroid/graphics/Paint;
  .line 571
    new-instance v0, Lcom/innioasis/ipp/MenuStyle$Drop;
    invoke-direct { v0 }, Lcom/innioasis/ipp/MenuStyle$Drop;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->DROP:Ljava/lang/Runnable;
    return-void
  :L0
  .array-data 4
      2131820769
      2131820770
      2131820768
      2131820762
      2131820764
      2131820765
      2131820766
      2131820767
      2131820772
      2131820771
      2131820763
      2131820773
  .end array-data
  :L1
  .array-data 4
      2131231079
      2131231080
      2131231078
      2131231069
      2131231072
      2131231073
      2131231074
      2131231075
      2131231081
      2131231082
      2131231071
      2131231083
  .end array-data
.end method

.method private constructor <init>()V
  .registers 1
  .line 55
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$002(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 1
  .line 53
    sput-object p0, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$102(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 1
  .line 53
    sput-object p0, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$200()Ljava/util/HashMap;
  .registers 1
  .line 53
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    return-object v0
.end method

.method static synthetic access$300(II)Ljava/lang/Long;
  .registers 2
  .line 53
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$400(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
  .registers 3
  .line 53
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->build(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$500()Landroid/os/Handler;
  .registers 1
  .line 53
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->main:Landroid/os/Handler;
    return-object v0
.end method

.method public static apply(Ljava/lang/Object;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 5
  .line 67
    instance-of v0, p0, Landroid/app/Activity;
    if-nez v0, :L0
    return-void
  :L0
  .line 69
    check-cast p0, Landroid/app/Activity;
  .line 70
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v0
  .line 71
    instance-of v1, p0, Lcom/innioasis/y1/activity/MainActivity;
    if-eqz v1, :L2
  .line 72
    const v1, 2131362308
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->pad(Landroid/view/View;)V
  .line 73
    const v1, 2131362147
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    move-result v1
    if-eqz v1, :L1
    if-nez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->mainPreview(Landroid/app/Activity;)V
  :L1
  .line 74
    if-nez v0, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->preloadMain(Landroid/app/Activity;)V
    goto/16 :L7
  :L2
  .line 75
    instance-of v1, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const v2, 2131362310
    if-eqz v1, :L3
  .line 76
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->pad(Landroid/view/View;)V
  .line 77
    const v1, 2131362326
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    move-result v1
    if-eqz v1, :L7
    if-nez v0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->paintPanel()V
    goto/16 :L7
  :L3
  .line 78
    instance-of v1, p0, Lcom/innioasis/y1/activity/EqActivity;
    const v3, 2131362085
    if-eqz v1, :L4
  .line 79
    const v1, 2131362312
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 80
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L7
  :L4
  .line 81
    instance-of v1, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v1, :L5
  .line 82
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 83
    const v1, 2131362087
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L7
  :L5
  .line 84
    instance-of v1, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v1, :L6
  .line 85
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 86
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L7
  :L6
  .line 87
    instance-of v1, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-eqz v1, :L7
  .line 88
    const v1, 2131361987
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 89
    const v1, 2131362373
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 90
    const v1, 2131362086
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 91
    const v2, 2131362371
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 92
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->dateIcon(Landroid/view/View;)V
  :L7
  .line 94
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->section(Landroid/app/Activity;)V
  .line 95
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->backdrop(Landroid/app/Activity;Z)V
  .line 96
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->apply(Landroid/app/Activity;)V
  .line 97
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->apply(Landroid/app/Activity;)V
  .line 98
    invoke-static { p0 }, Lcom/innioasis/ipp/Fill;->apply(Landroid/app/Activity;)V
  :L8
  .line 100
    goto :L10
  :L9
  .line 99
    move-exception p0
  :L10
  .line 101
    return-void
.end method

.method private static backdrop(Landroid/app/Activity;Z)V
  .catchall { :L0 .. :L6 } :L7
  .registers 4
  :L0
  .line 365
    instance-of v0, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const/4 v1, 0
    if-eqz v0, :L2
  .line 366
    check-cast p0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->back:Landroid/widget/ImageView;
  .line 367
    if-eqz p1, :L1
    const/4 v1, 4
  :L1
    invoke-virtual { p0, v1 }, Landroid/view/View;->setVisibility(I)V
  .line 368
    return-void
  :L2
  .line 370
    instance-of v0, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-nez v0, :L3
  .line 372
    return-void
  :L3
  .line 374
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getBackImageView()Landroid/widget/ImageView;
    move-result-object p0
  .line 375
    if-eqz p1, :L4
  .line 376
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 377
    return-void
  :L4
  .line 379
    const p1, 2131361890
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L5
  .line 380
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, p1, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 382
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 383
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
  :L5
  .line 385
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L6
  .line 387
    goto :L8
  :L7
  .line 386
    move-exception p0
  :L8
  .line 388
    return-void
.end method

.method private static build(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
  .catchall { :L12 .. :L15 } :L14
  .registers 13
  .line 509
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 510
    const/4 v1, 1
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 511
    invoke-static { p0, p1, v0 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 512
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I
  .line 513
    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I
  .line 514
    const/4 v3, 0
    if-lez v2, :L16
    if-gtz v0, :L0
    goto/16 :L16
  :L0
  .line 515
    sget-object v4, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    if-eqz v4, :L1
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v4
    if-ne v4, v2, :L1
    sget-object v4, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v4
    if-eq v4, v0, :L2
  :L1
  .line 516
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v2, v0, v4 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v4
    sput-object v4, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
  :L2
  .line 518
    new-instance v4, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v4 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 519
    const/4 v5, 0
    iput-boolean v5, v4, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 520
    iput-boolean v1, v4, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 521
    iput v1, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 522
    sget-object v6, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    iput-object v6, v4, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 523
    invoke-static { p0, p1, v4 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 524
    if-nez v4, :L3
    return-object v3
  :L3
  .line 526
    if-le v2, p2, :L8
  .line 527
    int-to-float v6, v0
    int-to-float v7, p2
    mul-float v6, v6, v7
    int-to-float v7, v2
    div-float/2addr v6, v7
    invoke-static { v6 }, Ljava/lang/Math;->round(F)I
    move-result v6
    invoke-static { v1, v6 }, Ljava/lang/Math;->max(II)I
    move-result v6
  .line 528
    nop
  .line 530
    mul-int/lit8 v7, p2, 2
    if-le v2, v7, :L6
  .line 531
    sget-object v8, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    if-eqz v8, :L4
    invoke-virtual { v8 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v8
    if-ne v8, v7, :L4
    sget-object v8, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    invoke-virtual { v8 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v8
    mul-int/lit8 v9, v6, 2
    if-eq v8, v9, :L5
  :L4
  .line 532
    mul-int/lit8 v8, v6, 2
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v7, v8, v9 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v8
    sput-object v8, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
  :L5
  .line 534
    sget-object v8, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    invoke-virtual { v8, v5 }, Landroid/graphics/Bitmap;->eraseColor(I)V
  .line 535
    new-instance v8, Landroid/graphics/Canvas;
    sget-object v9, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    invoke-direct { v8, v9 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    new-instance v9, Landroid/graphics/Rect;
    invoke-direct { v9, v5, v5, v2, v0 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v0, Landroid/graphics/Rect;
    mul-int/lit8 v2, v6, 2
    invoke-direct { v0, v5, v5, v7, v2 }, Landroid/graphics/Rect;-><init>(IIII)V
    sget-object v2, Lcom/innioasis/ipp/MenuStyle;->FILTER:Landroid/graphics/Paint;
    invoke-virtual { v8, v4, v9, v0, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 536
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    goto :L7
  :L6
  .line 530
    move-object v0, v4
  :L7
  .line 538
    invoke-static { v0, p2, v6, v1 }, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 539
    goto :L9
  :L8
  .line 540
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-virtual { v4, v0, v5 }, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;
    move-result-object v0
  :L9
  .line 542
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    if-eq v4, v1, :L10
    sput-object v3, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
  :L10
  .line 543
    if-nez v0, :L11
    return-object v3
  :L11
  .line 544
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-direct { v1, p0, v0 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
  .line 545
    sget-object p0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter p0
  :L12
  .line 546
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/graphics/drawable/Drawable;
  .line 547
    if-eqz v0, :L13
    monitor-exit p0
    return-object v0
  :L13
  .line 548
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object p1
    invoke-virtual { p0, p1, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 549
    monitor-exit p0
  .line 550
    return-object v1
  :L14
  .line 549
    move-exception p1
    monitor-exit p0
  :L15
    throw p1
  :L16
  .line 514
    return-object v3
.end method

.method private static dateIcon(Landroid/view/View;)V
  .registers 3
  .line 353
    instance-of v0, p0, Landroid/widget/ImageView;
    if-eqz v0, :L1
    const v0, 2131362086
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 354
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v0, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 355
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast p0, Landroid/widget/ImageView;
    const v1, 2131230954
    invoke-virtual { v0, p0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 356
    return-void
  :L1
  .line 353
    return-void
.end method

.method private static hide(Landroid/view/View;Z)Z
  .registers 4
  .line 402
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 403
    if-eqz p1, :L1
    const/16 p1, 8
    goto :L2
  :L1
    const/4 p1, 0
  :L2
  .line 404
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-ne v1, p1, :L3
    return v0
  :L3
  .line 405
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  .line 406
    const/4 p0, 1
    return p0
.end method

.method private static host(Landroid/view/View;)Landroid/content/Context;
  .registers 3
  .line 451
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 452
    const/4 v0, 0
  :L0
  .line 453
    const/4 v1, 4
    if-ge v0, v1, :L1
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    instance-of v1, p0, Landroid/content/ContextWrapper;
    if-eqz v1, :L1
  .line 454
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
  .line 453
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 456
    return-object p0
.end method

.method private static key(II)Ljava/lang/Long;
  .registers 4
  .line 486
    int-to-long v0, p0
    const/16 p0, 16
    shl-long/2addr v0, p0
    const p0, 65535
    and-int/2addr p0, p1
    int-to-long p0, p0
    or-long/2addr p0, v0
    invoke-static { p0, p1 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object p0
    return-object p0
.end method

.method private static loadLater(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  .catchall { :L1 .. :L4 } :L5
  .catchall { :L6 .. :L7 } :L5
  .registers 7
  .line 554
    if-gtz p2, :L0
    return-void
  :L0
  .line 556
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter v0
  .line 557
    if-nez p3, :L2
  :L1
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 558
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
    if-nez v1, :L3
  .line 559
    new-instance v1, Landroid/os/HandlerThread;
    const-string v2, "ipp-preview"
    invoke-direct { v1, v2 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 560
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->start()V
  .line 561
    new-instance v2, Landroid/os/Handler;
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v2, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v2, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
  .line 562
    new-instance v1, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct { v1, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->main:Landroid/os/Handler;
  :L3
  .line 564
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
  .line 565
    monitor-exit v0
  :L4
  .line 566
    new-instance v0, Lcom/innioasis/ipp/MenuStyle$Load;
    invoke-direct { v0, p0, p1, p2, p3 }, Lcom/innioasis/ipp/MenuStyle$Load;-><init>(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
    invoke-virtual { v1, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 567
    sget-object p0, Lcom/innioasis/ipp/MenuStyle;->DROP:Ljava/lang/Runnable;
    invoke-virtual { v1, p0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 568
    const-wide/16 p1, 3000
    invoke-virtual { v1, p0, p1, p2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 569
    return-void
  :L5
  .line 565
    move-exception p0
  :L6
    monitor-exit v0
  :L7
    throw p0
.end method

.method static logo(Landroid/content/Context;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L2 } :L15
  .catchall { :L2 .. :L4 } :L12
  .catchall { :L4 .. :L9 } :L15
  .catchall { :L9 .. :L11 } :L10
  .catchall { :L11 .. :L12 } :L15
  .catchall { :L13 .. :L14 } :L12
  .catchall { :L14 .. :L15 } :L15
  .registers 5
  .line 188
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v1
  .line 189
    if-nez v1, :L1
    const-string v1, ""
  :L1
  .line 190
    const-class v2, Lcom/innioasis/ipp/MenuStyle;
    monitor-enter v2
  :L2
  .line 191
    sget-object v3, Lcom/innioasis/ipp/MenuStyle;->logoTheme:Ljava/lang/String;
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L3
    sget-object p0, Lcom/innioasis/ipp/MenuStyle;->logoBmp:Landroid/graphics/Bitmap;
    monitor-exit v2
    return-object p0
  :L3
  .line 192
    monitor-exit v2
  :L4
  .line 193
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L5
    move-object v2, v0
    goto :L6
  :L5
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "/storage/sdcard0/Themes/"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    const-string v3, "better-y"
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Saver;->themeFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  :L6
  .line 194
    if-nez v2, :L7
    move-object p0, v0
    goto :L8
  :L7
    const/16 v3, 360
    invoke-static { p0, v2, v3, v3 }, Lcom/innioasis/ipp/Saver;->fitted(Landroid/content/Context;Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
  :L8
  .line 195
    const-class v2, Lcom/innioasis/ipp/MenuStyle;
    monitor-enter v2
  :L9
  .line 196
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->logoTheme:Ljava/lang/String;
  .line 197
    sput-object p0, Lcom/innioasis/ipp/MenuStyle;->logoBmp:Landroid/graphics/Bitmap;
  .line 198
    monitor-exit v2
  .line 199
    return-object p0
  :L10
  .line 198
    move-exception p0
    monitor-exit v2
  :L11
    throw p0
  :L12
  .line 192
    move-exception p0
  :L13
    monitor-exit v2
  :L14
    throw p0
  :L15
  .line 200
    move-exception p0
  .line 201
    return-object v0
.end method

.method static declared-synchronized logoRecheck()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/MenuStyle;
    monitor-enter v0
  .line 209
    const/4 v1, 0
  :L0
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->logoTheme:Ljava/lang/String;
  .line 210
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->logoBmp:Landroid/graphics/Bitmap;
  :L1
  .line 211
    monitor-exit v0
    return-void
  :L2
  .line 208
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static mainPreview(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 412
    const-class v0, Lcom/innioasis/y1/activity/MainActivity;
    const-string v1, "selItem"
    const/4 v2, 0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
  .line 413
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Method;->setAccessible(Z)V
  .line 414
    new-array v1, v2, [Ljava/lang/Object;
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 416
    goto :L3
  :L2
  .line 415
    move-exception p0
  :L3
  .line 417
    return-void
.end method

.method private static pad(Landroid/view/View;)V
  .registers 2
  .line 392
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Pad;->list(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 393
    return-void
.end method

.method private static panel(Landroid/widget/ImageView;)Z
  .registers 3
  .line 444
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getId()I
    move-result v0
  .line 445
    const v1, 2131362147
    if-eq v0, v1, :L1
    const v1, 2131362323
    if-eq v0, v1, :L1
    const v1, 2131362085
    if-ne v0, v1, :L0
  .line 446
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->host(Landroid/view/View;)Landroid/content/Context;
    move-result-object p0
    instance-of p0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
  .line 445
    return p0
.end method

.method private static parent(Landroid/view/View;)Landroid/view/View;
  .registers 3
  .line 396
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  :L1
  .line 397
    instance-of v1, p0, Landroid/view/View;
    if-eqz v1, :L2
    move-object v0, p0
    check-cast v0, Landroid/view/View;
  :L2
    return-object v0
.end method

.method private static preloadMain(Landroid/app/Activity;)V
  .registers 6
  .line 643
    sget-boolean v0, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 644
    const v0, 2131362147
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 645
    const v1, 2131362308
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 646
    if-eqz v0, :L7
    instance-of v2, v1, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v2, :L1
    goto :L7
  :L1
  .line 647
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
  .line 648
    instance-of v2, v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-nez v2, :L2
    return-void
  :L2
  .line 649
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->width(Landroid/view/View;)I
    move-result v0
  .line 650
    if-gtz v0, :L3
    return-void
  :L3
  .line 651
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
  .line 652
    check-cast v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object v1
  .line 653
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->probeView(Landroid/content/Context;I)Landroid/widget/ImageView;
    move-result-object v0
  .line 654
    const/4 v2, 0
  :L4
    sget-object v3, Lcom/innioasis/ipp/MenuStyle;->MAIN_ROWS:[I
    array-length v4, v3
    if-ge v2, v4, :L6
  .line 655
    aget v3, v3, v2
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-interface { v1, v3 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
  .line 656
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget-object v4, Lcom/innioasis/ipp/MenuStyle;->MAIN_PICS:[I
    aget v4, v4, v2
    invoke-virtual { v3, v0, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  :L5
  .line 654
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 661
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    new-instance v1, Landroid/widget/ImageView;
    invoke-direct { v1, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
  .line 662
    return-void
  :L7
  .line 646
    return-void
.end method

.method private static probeView(Landroid/content/Context;I)Landroid/widget/ImageView;
  .registers 4
  .line 627
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct { v0, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 628
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;
    const/4 v1, -2
    invoke-direct { p0, p1, v1 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 629
    const p0, 2131362323
    sget-object p1, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
    invoke-virtual { v0, p0, p1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 630
    return-object v0
.end method

.method private static px(Landroid/content/Context;I)I
  .registers 2
  .line 308
    int-to-float p1, p1
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F
    mul-float p1, p1, p0
    const/high16 p0, 0x3F000000
    add-float/2addr p1, p0
    float-to-int p0, p1
    return p0
.end method

.method public static res(Landroid/widget/ImageView;I)V
  .catchall { :L0 .. :L4 } :L13
  .catchall { :L4 .. :L5 } :L9
  .catchall { :L6 .. :L8 } :L13
  .catchall { :L10 .. :L11 } :L9
  .catchall { :L11 .. :L12 } :L13
  .registers 6
  .line 462
    const v0, 2131362323
  :L0
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
    const/4 v2, 0
    if-ne v0, v1, :L1
  .line 463
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v0, p1, v1, v2 }, Lcom/innioasis/ipp/MenuStyle;->loadLater(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  .line 464
    return-void
  :L1
  .line 466
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->panel(Landroid/widget/ImageView;)Z
    move-result v0
    if-eqz v0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->width(Landroid/view/View;)I
    move-result v0
    goto :L3
  :L2
    const/4 v0, 0
  :L3
  .line 467
    if-lez v0, :L12
  .line 469
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter v1
  :L4
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroid/graphics/drawable/Drawable;
    monitor-exit v1
  :L5
  .line 470
    const v1, 2131362147
    if-eqz v3, :L7
  :L6
  .line 471
    invoke-virtual { p0, v1, v2 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 472
    invoke-virtual { p0, v3 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 473
    return-void
  :L7
  .line 476
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { p0, v1, v2 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 477
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-static { v1, p1, v0, p0 }, Lcom/innioasis/ipp/MenuStyle;->loadLater(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  :L8
  .line 478
    return-void
  :L9
  .line 469
    move-exception v0
  :L10
    monitor-exit v1
  :L11
    throw v0
  :L12
  .line 481
    goto :L14
  :L13
  .line 480
    move-exception v0
  :L14
  .line 482
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 483
    return-void
.end method

.method public static section(Landroid/app/Activity;)V
  .catchall { :L0 .. :L8 } :L10
  .registers 6
  .line 120
    nop
  :L0
  .line 121
    instance-of v0, p0, Lcom/innioasis/music/MusicMainActivity;
    const v1, 2131362180
    const/4 v2, 1
    if-eqz v0, :L1
  .line 122
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 123
    const v1, 2131231078
    const/4 v1, 1
    const v3, 2131231078
    goto :L5
  :L1
  .line 124
    instance-of v0, p0, Lcom/innioasis/y1/activity/EbookActivity;
    if-eqz v0, :L2
  .line 125
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 126
    const v1, 2131231069
    const/4 v1, 1
    const v3, 2131231069
    goto :L5
  :L2
  .line 127
    instance-of v0, p0, Lcom/innioasis/y1_eBook/ui/main/MainActivity;
    if-eqz v0, :L3
  .line 128
    const v0, 2131362552
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 129
    nop
  .line 130
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result v1
    xor-int/2addr v1, v2
    const v3, 2131231072
    goto :L5
  :L3
  .line 131
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-eqz v0, :L4
  .line 132
    const v0, 2131362310
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 133
    nop
  .line 134
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->videoRoot(Landroid/app/Activity;)Z
    move-result v1
  .line 135
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->watchVideos(Landroid/app/Activity;Landroid/view/View;)V
    const v3, 2131231083
    goto :L5
  :L4
  .line 136
    instance-of v0, p0, Lcom/innioasis/y1/activity/IppActivity;
    if-eqz v0, :L9
  .line 137
    const v0, 2131362308
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 138
    nop
  .line 139
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppActivity;->atRoot()Z
    move-result v1
    const v3, 2131231141
  :L5
  .line 143
    instance-of v4, p0, Lcom/innioasis/y1/activity/IppActivity;
  .line 144
    if-eqz v1, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v1
    if-nez v1, :L6
    goto :L7
  :L6
    const/4 v2, 0
  :L7
  .line 145
    invoke-static { p0, v0, v3, v2, v4 }, Lcom/innioasis/ipp/MenuStyle;->split(Landroid/app/Activity;Landroid/view/View;IZZ)V
  .line 146
    invoke-static { p0, v2, v4 }, Lcom/innioasis/ipp/MenuStyle;->wallpaper(Landroid/app/Activity;ZZ)V
  :L8
  .line 148
    goto :L11
  :L9
  .line 141
    return-void
  :L10
  .line 147
    move-exception p0
  :L11
  .line 149
    return-void
.end method

.method private static sectionPic(Landroid/app/Activity;ZZ)Landroid/view/View;
  .registers 10
  .line 231
    const v0, 2131362153
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 232
    const/4 v1, 0
    if-nez v0, :L0
    move-object v2, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
  :L1
  .line 233
    instance-of v3, v2, Landroidx/constraintlayout/widget/ConstraintLayout;
    if-nez v3, :L2
    return-object v1
  :L2
  .line 234
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 235
    const v3, 2131362147
    invoke-virtual { v2, v3 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getTag(I)Ljava/lang/Object;
    move-result-object v4
  .line 236
    instance-of v5, v4, Landroid/view/View;
    if-eqz v5, :L3
    check-cast v4, Landroid/view/View;
    return-object v4
  :L3
  .line 237
    if-nez p1, :L4
    return-object v1
  :L4
  .line 240
    const/4 p1, 1
    const/4 v4, 0
    if-eqz p2, :L5
  .line 241
    invoke-static { p0 }, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;
    move-result-object p0
  .line 242
    const p2, 2131558463
    invoke-virtual { p0, p2, v2, v4 }, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/view/ViewGroup;
  .line 243
    const p2, 2131362326
    invoke-virtual { p0, p2 }, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v5
    check-cast v5, Landroid/view/View;
  .line 244
    invoke-virtual { v5 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v6
    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    invoke-static { v6 }, Lcom/innioasis/ipp/Pad;->copy(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    move-result-object v6
  .line 245
    invoke-virtual { p0, v5 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  .line 246
    invoke-virtual { v5, p2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/TextView;
  .line 247
    const p2, 2131821015
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setText(I)V
  .line 248
    invoke-virtual { p0, v4 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 249
    const p0, 2131362323
    invoke-virtual { v5, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 250
    const p0, 2131362097
    invoke-virtual { v5, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/TextView;
    const p2, 2131821014
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setText(I)V
  .line 251
    goto :L6
  :L5
  .line 252
    new-instance v5, Landroid/widget/ImageView;
    invoke-direct { v5, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 253
    invoke-virtual { v5, v3 }, Landroid/widget/ImageView;->setId(I)V
  .line 254
    invoke-virtual { v5, p1 }, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V
  .line 255
    nop
  .line 256
    new-instance v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    const/16 p2, 179
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p2
    const/4 v1, -2
    invoke-direct { v6, p2, v1 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V
  .line 257
    iput v4, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
  .line 258
    iput v4, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToRight:I
  .line 259
    const/16 p2, 86
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p2
    iput p2, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topMargin:I
  .line 260
    const/16 p2, 23
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result v1
    iput v1, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightMargin:I
  .line 261
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p0
    invoke-virtual { v6, p0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->setMarginEnd(I)V
  :L6
  .line 263
    invoke-virtual { v2, v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->indexOfChild(Landroid/view/View;)I
    move-result p0
    add-int/2addr p0, p1
    invoke-virtual { v2, v5, p0, v6 }, Landroidx/constraintlayout/widget/ConstraintLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 264
    invoke-virtual { v2, v3, v5 }, Landroidx/constraintlayout/widget/ConstraintLayout;->setTag(ILjava/lang/Object;)V
  .line 265
    return-object v5
.end method

.method static settingsLogo(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 3
  .line 215
    const v0, 2131821015
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    const/4 v0, 0
    if-nez p1, :L0
    return v0
  :L0
  .line 216
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->logo(Landroid/content/Context;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 217
    if-nez p1, :L1
    return v0
  :L1
  .line 218
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
  .line 219
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->rightImage:Landroid/widget/ImageView;
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 220
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->infoStateTv:Landroid/widget/TextView;
    const p1, 2131821014
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(I)V
  .line 221
    const/4 p0, 1
    return p0
.end method

.method public static simple(Landroid/content/Context;)Z
  .registers 2
  .line 62
    const-string v0, "menu_style"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
    const/4 v0, 1
    if-ne p0, v0, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static split(Landroid/app/Activity;Landroid/view/View;IZZ)V
  .registers 9
  .line 152
    if-nez p1, :L0
    return-void
  :L0
  .line 153
    invoke-virtual { p1 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 154
    if-nez v0, :L1
    return-void
  :L1
  .line 155
    const v1, 2131362153
    invoke-virtual { p1, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v2
  .line 156
    instance-of v3, v2, Ljava/lang/Integer;
    if-nez v3, :L2
  .line 157
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
  .line 158
    invoke-virtual { p1, v1, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L2
  .line 160
    if-eqz p3, :L5
    if-eqz p4, :L3
    const/16 v2, 227
    goto :L4
  :L3
    const/16 v2, 213
  :L4
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result v2
    goto :L6
  :L5
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  :L6
  .line 161
    iget v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-eq v3, v2, :L7
  .line 162
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 163
    invoke-virtual { p1, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L7
  .line 165
    invoke-static { p0, p3, p4 }, Lcom/innioasis/ipp/MenuStyle;->sectionPic(Landroid/app/Activity;ZZ)Landroid/view/View;
    move-result-object p1
  .line 166
    if-nez p1, :L8
    return-void
  :L8
  .line 167
    if-eqz p3, :L9
    const/4 p4, 0
    goto :L10
  :L9
    const/16 p4, 8
  :L10
    invoke-virtual { p1, p4 }, Landroid/view/View;->setVisibility(I)V
  .line 168
    if-nez p3, :L11
    return-void
  :L11
  .line 169
    instance-of p3, p1, Landroid/widget/ImageView;
    if-eqz p3, :L12
    move-object p3, p1
    goto :L13
  :L12
    const p3, 2131362323
    invoke-virtual { p1, p3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p3
  :L13
    check-cast p3, Landroid/widget/ImageView;
  .line 170
    const p4, 2131231141
    if-ne p2, p4, :L14
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->logo(Landroid/content/Context;)Landroid/graphics/Bitmap;
    move-result-object p4
    goto :L15
  :L14
    const/4 p4, 0
  :L15
  .line 171
    if-eqz p4, :L16
    move-object v0, p4
    goto :L17
  :L16
    invoke-static { p2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
  :L17
  .line 172
    invoke-virtual { p3, v1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L19
  .line 173
    invoke-virtual { p3, v1, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 174
    if-eqz p4, :L18
    invoke-virtual { p3, p4 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    goto :L19
  :L18
  .line 175
    sget-object p4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p4, p3, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  :L19
  .line 177
    const p2, 2131362097
    invoke-virtual { p1, p2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  .line 178
    instance-of p2, p1, Landroid/widget/TextView;
    if-eqz p2, :L20
    check-cast p1, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->fg(Landroid/content/Context;)I
    move-result p0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  :L20
  .line 179
    return-void
.end method

.method public static themeChanged()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 2
  .line 635
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter v0
  :L0
  .line 636
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 637
    monitor-exit v0
  :L1
  .line 638
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
  .line 639
    return-void
  :L2
  .line 637
    move-exception v1
  :L3
    monitor-exit v0
  :L4
    throw v1
.end method

.method private static videoRoot(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 5
  .line 316
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->videoStack:Ljava/lang/reflect/Field;
    const/4 v2, 1
    if-nez v1, :L1
  .line 317
    const-class v1, Lcom/innioasis/y1/activity/video/VideoListActivity;
    const-string v3, "browseHistoryStack"
    invoke-virtual { v1, v3 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 318
    invoke-virtual { v1, v2 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 319
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->videoStack:Ljava/lang/reflect/Field;
  :L1
  .line 321
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->videoStack:Ljava/lang/reflect/Field;
    invoke-virtual { v1, p0 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 322
    instance-of v1, p0, Ljava/util/Collection;
    if-eqz v1, :L3
    check-cast p0, Ljava/util/Collection;
    invoke-interface { p0 }, Ljava/util/Collection;->isEmpty()Z
    move-result p0
  :L2
    if-eqz p0, :L3
    const/4 v0, 1
  :L3
    return v0
  :L4
  .line 323
    move-exception p0
  .line 324
    return v0
.end method

.method private static wallpaper(Landroid/app/Activity;ZZ)V
  .registers 9
  .line 274
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L0
    return-void
  :L0
  .line 275
    const/4 v0, 0
    const v1, 2131361890
    if-nez p2, :L3
  .line 276
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v2
  .line 277
    sget-object v3, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v3 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getDesktopBitmap()Landroid/graphics/Bitmap;
    move-result-object v3
  .line 278
    invoke-virtual { v2, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v4
  .line 279
    if-eqz p1, :L1
    if-eqz v3, :L1
    if-eq v4, v3, :L1
  .line 280
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-direct { v4, v5, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { v2, v4 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 281
    invoke-virtual { v2, v1, v3 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
    goto :L3
  :L1
  .line 282
    if-nez p1, :L3
    if-eqz v4, :L3
  .line 283
    sget-object v3, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v3 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object v3
  .line 284
    if-eqz v3, :L2
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-direct { v4, v5, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { v2, v4 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L2
  .line 285
    invoke-virtual { v2, v1, v0 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L3
  .line 288
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getBackImageView()Landroid/widget/ImageView;
    move-result-object p0
  .line 289
    if-nez p0, :L4
    return-void
  :L4
  .line 290
    if-nez p1, :L5
  .line 291
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 292
    return-void
  :L5
  .line 294
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object p1
    if-nez p1, :L7
  .line 295
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v1, p1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 297
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 298
    if-eqz p2, :L6
  .line 299
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
    goto :L7
  :L6
  .line 301
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setDeskMask(Landroid/widget/ImageView;)V
  :L7
  .line 304
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 305
    return-void
.end method

.method private static watchVideos(Landroid/app/Activity;Landroid/view/View;)V
  .registers 5
  .line 330
    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L2
    const v0, 2131362147
    invoke-virtual { p1, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L0
    goto :L2
  :L0
  .line 331
    move-object v1, p1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
  .line 332
    if-nez v1, :L1
    return-void
  :L1
  .line 333
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p1, v0, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 334
    new-instance p1, Lcom/innioasis/ipp/MenuStyle$VideoLevel;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/MenuStyle$VideoLevel;-><init>(Landroid/app/Activity;)V
    invoke-virtual { v1, p1 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;)V
  .line 335
    return-void
  :L2
  .line 330
    return-void
.end method

.method private static widen(Landroid/view/View;Z)V
  .registers 6
  .line 666
    if-nez p0, :L0
    return-void
  :L0
  .line 667
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 668
    if-nez v0, :L1
    return-void
  :L1
  .line 669
    const v1, 2131362152
    invoke-virtual { p0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v2
  .line 670
    instance-of v3, v2, Ljava/lang/Integer;
    if-nez v3, :L2
  .line 671
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
  .line 672
    invoke-virtual { p0, v1, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L2
  .line 674
    if-eqz p1, :L3
    const/4 p1, -1
    goto :L4
  :L3
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  :L4
  .line 675
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-ne v1, p1, :L5
    return-void
  :L5
  .line 676
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 677
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 678
    return-void
.end method

.method private static width(Landroid/view/View;)I
  .registers 6
  .line 491
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result v0
    if-lez v0, :L0
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result p0
    return p0
  :L0
  .line 492
    const/4 v0, 0
    const/4 v1, 0
  :L1
    const/4 v2, 4
    if-ge v1, v2, :L7
    if-eqz p0, :L7
  .line 493
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
  .line 494
    if-eqz v2, :L6
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    const/4 v4, -2
    if-ne v3, v4, :L2
    goto :L6
  :L2
  .line 495
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-lez v3, :L3
    iget p0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    return p0
  :L3
  .line 496
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 497
    instance-of v2, p0, Landroid/view/View;
    if-eqz v2, :L4
    check-cast p0, Landroid/view/View;
    goto :L5
  :L4
    const/4 p0, 0
  :L5
  .line 492
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 494
    return v0
  :L7
  .line 499
    return v0
.end method

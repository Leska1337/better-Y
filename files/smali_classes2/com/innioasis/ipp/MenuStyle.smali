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

.field private static main:Landroid/os/Handler;

.field private static mainLoaded:Z

.field private static scratch:Landroid/graphics/Bitmap;

.field private static videoStack:Ljava/lang/reflect/Field;

.method static constructor <clinit>()V
  .registers 2
  .line 378
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
  .line 379
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
  .line 385
    const/16 v0, 12
    new-array v1, v0, [I
    fill-array-data v1, :L0
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->MAIN_ROWS:[I
  .line 390
    new-array v0, v0, [I
    fill-array-data v0, :L1
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->MAIN_PICS:[I
  .line 460
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->FILTER:Landroid/graphics/Paint;
  .line 525
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
  .line 319
    instance-of v0, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const/4 v1, 0
    if-eqz v0, :L2
  .line 320
    check-cast p0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->back:Landroid/widget/ImageView;
  .line 321
    if-eqz p1, :L1
    const/4 v1, 4
  :L1
    invoke-virtual { p0, v1 }, Landroid/view/View;->setVisibility(I)V
  .line 322
    return-void
  :L2
  .line 324
    instance-of v0, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-nez v0, :L3
  .line 326
    return-void
  :L3
  .line 328
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getBackImageView()Landroid/widget/ImageView;
    move-result-object p0
  .line 329
    if-eqz p1, :L4
  .line 330
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 331
    return-void
  :L4
  .line 333
    const p1, 2131361890
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L5
  .line 334
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, p1, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 336
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 337
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
  :L5
  .line 339
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L6
  .line 341
    goto :L8
  :L7
  .line 340
    move-exception p0
  :L8
  .line 342
    return-void
.end method

.method private static build(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
  .catchall { :L12 .. :L15 } :L14
  .registers 13
  .line 463
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 464
    const/4 v1, 1
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 465
    invoke-static { p0, p1, v0 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 466
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I
  .line 467
    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I
  .line 468
    const/4 v3, 0
    if-lez v2, :L16
    if-gtz v0, :L0
    goto/16 :L16
  :L0
  .line 469
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
  .line 470
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v2, v0, v4 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v4
    sput-object v4, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
  :L2
  .line 472
    new-instance v4, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v4 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 473
    const/4 v5, 0
    iput-boolean v5, v4, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 474
    iput-boolean v1, v4, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 475
    iput v1, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 476
    sget-object v6, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    iput-object v6, v4, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 477
    invoke-static { p0, p1, v4 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 478
    if-nez v4, :L3
    return-object v3
  :L3
  .line 480
    if-le v2, p2, :L8
  .line 481
    int-to-float v6, v0
    int-to-float v7, p2
    mul-float v6, v6, v7
    int-to-float v7, v2
    div-float/2addr v6, v7
    invoke-static { v6 }, Ljava/lang/Math;->round(F)I
    move-result v6
    invoke-static { v1, v6 }, Ljava/lang/Math;->max(II)I
    move-result v6
  .line 482
    nop
  .line 484
    mul-int/lit8 v7, p2, 2
    if-le v2, v7, :L6
  .line 485
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
  .line 486
    mul-int/lit8 v8, v6, 2
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v7, v8, v9 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v8
    sput-object v8, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
  :L5
  .line 488
    sget-object v8, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    invoke-virtual { v8, v5 }, Landroid/graphics/Bitmap;->eraseColor(I)V
  .line 489
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
  .line 490
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    goto :L7
  :L6
  .line 484
    move-object v0, v4
  :L7
  .line 492
    invoke-static { v0, p2, v6, v1 }, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 493
    goto :L9
  :L8
  .line 494
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-virtual { v4, v0, v5 }, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;
    move-result-object v0
  :L9
  .line 496
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    if-eq v4, v1, :L10
    sput-object v3, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
  :L10
  .line 497
    if-nez v0, :L11
    return-object v3
  :L11
  .line 498
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-direct { v1, p0, v0 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
  .line 499
    sget-object p0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter p0
  :L12
  .line 500
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/graphics/drawable/Drawable;
  .line 501
    if-eqz v0, :L13
    monitor-exit p0
    return-object v0
  :L13
  .line 502
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object p1
    invoke-virtual { p0, p1, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 503
    monitor-exit p0
  .line 504
    return-object v1
  :L14
  .line 503
    move-exception p1
    monitor-exit p0
  :L15
    throw p1
  :L16
  .line 468
    return-object v3
.end method

.method private static dateIcon(Landroid/view/View;)V
  .registers 3
  .line 307
    instance-of v0, p0, Landroid/widget/ImageView;
    if-eqz v0, :L1
    const v0, 2131362086
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 308
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v0, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 309
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast p0, Landroid/widget/ImageView;
    const v1, 2131230954
    invoke-virtual { v0, p0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 310
    return-void
  :L1
  .line 307
    return-void
.end method

.method private static hide(Landroid/view/View;Z)Z
  .registers 4
  .line 356
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 357
    if-eqz p1, :L1
    const/16 p1, 8
    goto :L2
  :L1
    const/4 p1, 0
  :L2
  .line 358
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-ne v1, p1, :L3
    return v0
  :L3
  .line 359
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  .line 360
    const/4 p0, 1
    return p0
.end method

.method private static host(Landroid/view/View;)Landroid/content/Context;
  .registers 3
  .line 405
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 406
    const/4 v0, 0
  :L0
  .line 407
    const/4 v1, 4
    if-ge v0, v1, :L1
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    instance-of v1, p0, Landroid/content/ContextWrapper;
    if-eqz v1, :L1
  .line 408
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
  .line 407
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 410
    return-object p0
.end method

.method private static key(II)Ljava/lang/Long;
  .registers 4
  .line 440
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
  .line 508
    if-gtz p2, :L0
    return-void
  :L0
  .line 510
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter v0
  .line 511
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
  .line 512
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
    if-nez v1, :L3
  .line 513
    new-instance v1, Landroid/os/HandlerThread;
    const-string v2, "ipp-preview"
    invoke-direct { v1, v2 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 514
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->start()V
  .line 515
    new-instance v2, Landroid/os/Handler;
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v2, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v2, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
  .line 516
    new-instance v1, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct { v1, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->main:Landroid/os/Handler;
  :L3
  .line 518
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
  .line 519
    monitor-exit v0
  :L4
  .line 520
    new-instance v0, Lcom/innioasis/ipp/MenuStyle$Load;
    invoke-direct { v0, p0, p1, p2, p3 }, Lcom/innioasis/ipp/MenuStyle$Load;-><init>(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
    invoke-virtual { v1, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 521
    sget-object p0, Lcom/innioasis/ipp/MenuStyle;->DROP:Ljava/lang/Runnable;
    invoke-virtual { v1, p0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 522
    const-wide/16 p1, 3000
    invoke-virtual { v1, p0, p1, p2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 523
    return-void
  :L5
  .line 519
    move-exception p0
  :L6
    monitor-exit v0
  :L7
    throw p0
.end method

.method private static mainPreview(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 366
    const-class v0, Lcom/innioasis/y1/activity/MainActivity;
    const-string v1, "selItem"
    const/4 v2, 0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
  .line 367
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Method;->setAccessible(Z)V
  .line 368
    new-array v1, v2, [Ljava/lang/Object;
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 370
    goto :L3
  :L2
  .line 369
    move-exception p0
  :L3
  .line 371
    return-void
.end method

.method private static pad(Landroid/view/View;)V
  .registers 2
  .line 346
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Pad;->list(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 347
    return-void
.end method

.method private static panel(Landroid/widget/ImageView;)Z
  .registers 3
  .line 398
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getId()I
    move-result v0
  .line 399
    const v1, 2131362147
    if-eq v0, v1, :L1
    const v1, 2131362323
    if-eq v0, v1, :L1
    const v1, 2131362085
    if-ne v0, v1, :L0
  .line 400
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
  .line 399
    return p0
.end method

.method private static parent(Landroid/view/View;)Landroid/view/View;
  .registers 3
  .line 350
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  :L1
  .line 351
    instance-of v1, p0, Landroid/view/View;
    if-eqz v1, :L2
    move-object v0, p0
    check-cast v0, Landroid/view/View;
  :L2
    return-object v0
.end method

.method private static preloadMain(Landroid/app/Activity;)V
  .registers 6
  .line 597
    sget-boolean v0, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 598
    const v0, 2131362147
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 599
    const v1, 2131362308
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 600
    if-eqz v0, :L7
    instance-of v2, v1, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v2, :L1
    goto :L7
  :L1
  .line 601
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
  .line 602
    instance-of v2, v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-nez v2, :L2
    return-void
  :L2
  .line 603
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->width(Landroid/view/View;)I
    move-result v0
  .line 604
    if-gtz v0, :L3
    return-void
  :L3
  .line 605
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
  .line 606
    check-cast v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object v1
  .line 607
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->probeView(Landroid/content/Context;I)Landroid/widget/ImageView;
    move-result-object v0
  .line 608
    const/4 v2, 0
  :L4
    sget-object v3, Lcom/innioasis/ipp/MenuStyle;->MAIN_ROWS:[I
    array-length v4, v3
    if-ge v2, v4, :L6
  .line 609
    aget v3, v3, v2
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-interface { v1, v3 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
  .line 610
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget-object v4, Lcom/innioasis/ipp/MenuStyle;->MAIN_PICS:[I
    aget v4, v4, v2
    invoke-virtual { v3, v0, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  :L5
  .line 608
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 615
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    new-instance v1, Landroid/widget/ImageView;
    invoke-direct { v1, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
  .line 616
    return-void
  :L7
  .line 600
    return-void
.end method

.method private static probeView(Landroid/content/Context;I)Landroid/widget/ImageView;
  .registers 4
  .line 581
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct { v0, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 582
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;
    const/4 v1, -2
    invoke-direct { p0, p1, v1 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 583
    const p0, 2131362323
    sget-object p1, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
    invoke-virtual { v0, p0, p1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 584
    return-object v0
.end method

.method private static px(Landroid/content/Context;I)I
  .registers 2
  .line 262
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
  .line 416
    const v0, 2131362323
  :L0
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
    const/4 v2, 0
    if-ne v0, v1, :L1
  .line 417
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v0, p1, v1, v2 }, Lcom/innioasis/ipp/MenuStyle;->loadLater(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  .line 418
    return-void
  :L1
  .line 420
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->panel(Landroid/widget/ImageView;)Z
    move-result v0
    if-eqz v0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->width(Landroid/view/View;)I
    move-result v0
    goto :L3
  :L2
    const/4 v0, 0
  :L3
  .line 421
    if-lez v0, :L12
  .line 423
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
  .line 424
    const v1, 2131362147
    if-eqz v3, :L7
  :L6
  .line 425
    invoke-virtual { p0, v1, v2 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 426
    invoke-virtual { p0, v3 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 427
    return-void
  :L7
  .line 430
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { p0, v1, v2 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 431
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-static { v1, p1, v0, p0 }, Lcom/innioasis/ipp/MenuStyle;->loadLater(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  :L8
  .line 432
    return-void
  :L9
  .line 423
    move-exception v0
  :L10
    monitor-exit v1
  :L11
    throw v0
  :L12
  .line 435
    goto :L14
  :L13
  .line 434
    move-exception v0
  :L14
  .line 436
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 437
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
  .line 185
    const v0, 2131362153
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 186
    const/4 v1, 0
    if-nez v0, :L0
    move-object v2, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
  :L1
  .line 187
    instance-of v3, v2, Landroidx/constraintlayout/widget/ConstraintLayout;
    if-nez v3, :L2
    return-object v1
  :L2
  .line 188
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 189
    const v3, 2131362147
    invoke-virtual { v2, v3 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getTag(I)Ljava/lang/Object;
    move-result-object v4
  .line 190
    instance-of v5, v4, Landroid/view/View;
    if-eqz v5, :L3
    check-cast v4, Landroid/view/View;
    return-object v4
  :L3
  .line 191
    if-nez p1, :L4
    return-object v1
  :L4
  .line 194
    const/4 p1, 1
    const/4 v4, 0
    if-eqz p2, :L5
  .line 195
    invoke-static { p0 }, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;
    move-result-object p0
  .line 196
    const p2, 2131558463
    invoke-virtual { p0, p2, v2, v4 }, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/view/ViewGroup;
  .line 197
    const p2, 2131362326
    invoke-virtual { p0, p2 }, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v5
    check-cast v5, Landroid/view/View;
  .line 198
    invoke-virtual { v5 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v6
    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    invoke-static { v6 }, Lcom/innioasis/ipp/Pad;->copy(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    move-result-object v6
  .line 199
    invoke-virtual { p0, v5 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  .line 200
    invoke-virtual { v5, p2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/TextView;
  .line 201
    const p2, 2131821015
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setText(I)V
  .line 202
    invoke-virtual { p0, v4 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 203
    const p0, 2131362323
    invoke-virtual { v5, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 204
    const p0, 2131362097
    invoke-virtual { v5, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/TextView;
    const p2, 2131821014
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setText(I)V
  .line 205
    goto :L6
  :L5
  .line 206
    new-instance v5, Landroid/widget/ImageView;
    invoke-direct { v5, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 207
    invoke-virtual { v5, v3 }, Landroid/widget/ImageView;->setId(I)V
  .line 208
    invoke-virtual { v5, p1 }, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V
  .line 209
    nop
  .line 210
    new-instance v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    const/16 p2, 179
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p2
    const/4 v1, -2
    invoke-direct { v6, p2, v1 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V
  .line 211
    iput v4, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
  .line 212
    iput v4, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToRight:I
  .line 213
    const/16 p2, 86
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p2
    iput p2, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topMargin:I
  .line 214
    const/16 p2, 23
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result v1
    iput v1, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightMargin:I
  .line 215
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p0
    invoke-virtual { v6, p0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->setMarginEnd(I)V
  :L6
  .line 217
    invoke-virtual { v2, v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->indexOfChild(Landroid/view/View;)I
    move-result p0
    add-int/2addr p0, p1
    invoke-virtual { v2, v5, p0, v6 }, Landroidx/constraintlayout/widget/ConstraintLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 218
    invoke-virtual { v2, v3, v5 }, Landroidx/constraintlayout/widget/ConstraintLayout;->setTag(ILjava/lang/Object;)V
  .line 219
    return-object v5
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
    invoke-static { p2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p4
    invoke-virtual { p3, v1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    invoke-virtual { p4, v0 }, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z
    move-result p4
    if-nez p4, :L14
  .line 171
    invoke-static { p2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p4
    invoke-virtual { p3, v1, p4 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 172
    sget-object p4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p4, p3, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  :L14
  .line 174
    const p2, 2131362097
    invoke-virtual { p1, p2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  .line 175
    instance-of p2, p1, Landroid/widget/TextView;
    if-eqz p2, :L15
    check-cast p1, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->fg(Landroid/content/Context;)I
    move-result p0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  :L15
  .line 176
    return-void
.end method

.method public static themeChanged()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 2
  .line 589
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter v0
  :L0
  .line 590
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 591
    monitor-exit v0
  :L1
  .line 592
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
  .line 593
    return-void
  :L2
  .line 591
    move-exception v1
  :L3
    monitor-exit v0
  :L4
    throw v1
.end method

.method private static videoRoot(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 5
  .line 270
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->videoStack:Ljava/lang/reflect/Field;
    const/4 v2, 1
    if-nez v1, :L1
  .line 271
    const-class v1, Lcom/innioasis/y1/activity/video/VideoListActivity;
    const-string v3, "browseHistoryStack"
    invoke-virtual { v1, v3 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 272
    invoke-virtual { v1, v2 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 273
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->videoStack:Ljava/lang/reflect/Field;
  :L1
  .line 275
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->videoStack:Ljava/lang/reflect/Field;
    invoke-virtual { v1, p0 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 276
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
  .line 277
    move-exception p0
  .line 278
    return v0
.end method

.method private static wallpaper(Landroid/app/Activity;ZZ)V
  .registers 9
  .line 228
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L0
    return-void
  :L0
  .line 229
    const/4 v0, 0
    const v1, 2131361890
    if-nez p2, :L3
  .line 230
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v2
  .line 231
    sget-object v3, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v3 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getDesktopBitmap()Landroid/graphics/Bitmap;
    move-result-object v3
  .line 232
    invoke-virtual { v2, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v4
  .line 233
    if-eqz p1, :L1
    if-eqz v3, :L1
    if-eq v4, v3, :L1
  .line 234
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-direct { v4, v5, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { v2, v4 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 235
    invoke-virtual { v2, v1, v3 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
    goto :L3
  :L1
  .line 236
    if-nez p1, :L3
    if-eqz v4, :L3
  .line 237
    sget-object v3, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v3 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object v3
  .line 238
    if-eqz v3, :L2
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-direct { v4, v5, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { v2, v4 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L2
  .line 239
    invoke-virtual { v2, v1, v0 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L3
  .line 242
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getBackImageView()Landroid/widget/ImageView;
    move-result-object p0
  .line 243
    if-nez p0, :L4
    return-void
  :L4
  .line 244
    if-nez p1, :L5
  .line 245
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 246
    return-void
  :L5
  .line 248
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object p1
    if-nez p1, :L7
  .line 249
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v1, p1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 251
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 252
    if-eqz p2, :L6
  .line 253
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
    goto :L7
  :L6
  .line 255
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setDeskMask(Landroid/widget/ImageView;)V
  :L7
  .line 258
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 259
    return-void
.end method

.method private static watchVideos(Landroid/app/Activity;Landroid/view/View;)V
  .registers 5
  .line 284
    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L2
    const v0, 2131362147
    invoke-virtual { p1, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L0
    goto :L2
  :L0
  .line 285
    move-object v1, p1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
  .line 286
    if-nez v1, :L1
    return-void
  :L1
  .line 287
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p1, v0, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 288
    new-instance p1, Lcom/innioasis/ipp/MenuStyle$VideoLevel;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/MenuStyle$VideoLevel;-><init>(Landroid/app/Activity;)V
    invoke-virtual { v1, p1 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;)V
  .line 289
    return-void
  :L2
  .line 284
    return-void
.end method

.method private static widen(Landroid/view/View;Z)V
  .registers 6
  .line 620
    if-nez p0, :L0
    return-void
  :L0
  .line 621
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 622
    if-nez v0, :L1
    return-void
  :L1
  .line 623
    const v1, 2131362152
    invoke-virtual { p0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v2
  .line 624
    instance-of v3, v2, Ljava/lang/Integer;
    if-nez v3, :L2
  .line 625
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
  .line 626
    invoke-virtual { p0, v1, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L2
  .line 628
    if-eqz p1, :L3
    const/4 p1, -1
    goto :L4
  :L3
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  :L4
  .line 629
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-ne v1, p1, :L5
    return-void
  :L5
  .line 630
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 631
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 632
    return-void
.end method

.method private static width(Landroid/view/View;)I
  .registers 6
  .line 445
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result v0
    if-lez v0, :L0
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result p0
    return p0
  :L0
  .line 446
    const/4 v0, 0
    const/4 v1, 0
  :L1
    const/4 v2, 4
    if-ge v1, v2, :L7
    if-eqz p0, :L7
  .line 447
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
  .line 448
    if-eqz v2, :L6
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    const/4 v4, -2
    if-ne v3, v4, :L2
    goto :L6
  :L2
  .line 449
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-lez v3, :L3
    iget p0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    return p0
  :L3
  .line 450
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 451
    instance-of v2, p0, Landroid/view/View;
    if-eqz v2, :L4
    check-cast p0, Landroid/view/View;
    goto :L5
  :L4
    const/4 p0, 0
  :L5
  .line 446
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 448
    return v0
  :L7
  .line 453
    return v0
.end method

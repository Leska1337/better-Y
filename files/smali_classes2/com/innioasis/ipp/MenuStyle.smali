.class public final Lcom/innioasis/ipp/MenuStyle;
.super Ljava/lang/Object;
.source "MenuStyle.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/MenuStyle$VideoLevel;,
    Lcom/innioasis/ipp/MenuStyle$Load;,
    Lcom/innioasis/ipp/MenuStyle$ListLead;,
    Lcom/innioasis/ipp/MenuStyle$RowLead;,
    Lcom/innioasis/ipp/MenuStyle$Drop;,
    Lcom/innioasis/ipp/MenuStyle$Show;
  }
.end annotation

.field private final static DROP:Ljava/lang/Runnable;

.field private final static EVEN:I = 2

.field private final static EVEN_RIGHT:I = 30

.field private final static FILTER:Landroid/graphics/Paint;

.field private final static HALF:I = 240

.field public final static KEY:Ljava/lang/String; = "menu_style"

.field private final static LEAD:I = 5

.field private final static LOGO_SIDE:I = 360

.field private final static MAIN_PICS:[I

.field private final static MAIN_ROWS:[I

.field private final static MAIN_TEXT:I = 4

.field private final static MARGIN:I = 9

.field private final static OWN:I = -100

.field private final static PIC_RIGHT:I = 23

.field private final static PIC_TOP:I = 86

.field private final static PIC_W:I = 179

.field private final static PREVIEWS:Ljava/util/HashMap;

.field private final static PROBE:Ljava/lang/Object;

.field private final static ROW_LEAD:Lcom/innioasis/ipp/MenuStyle$RowLead;

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
  .line 488
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
  .line 489
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
  .line 495
    const/16 v0, 12
    new-array v1, v0, [I
    fill-array-data v1, :L0
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->MAIN_ROWS:[I
  .line 500
    new-array v0, v0, [I
    fill-array-data v0, :L1
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->MAIN_PICS:[I
  .line 570
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->FILTER:Landroid/graphics/Paint;
  .line 635
    new-instance v0, Lcom/innioasis/ipp/MenuStyle$Drop;
    invoke-direct { v0 }, Lcom/innioasis/ipp/MenuStyle$Drop;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->DROP:Ljava/lang/Runnable;
  .line 803
    new-instance v0, Lcom/innioasis/ipp/MenuStyle$RowLead;
    invoke-direct { v0 }, Lcom/innioasis/ipp/MenuStyle$RowLead;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->ROW_LEAD:Lcom/innioasis/ipp/MenuStyle$RowLead;
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
  .line 57
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$002(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 1
  .line 55
    sput-object p0, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$102(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 1
  .line 55
    sput-object p0, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$200()Ljava/util/HashMap;
  .registers 1
  .line 55
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    return-object v0
.end method

.method static synthetic access$300(II)Ljava/lang/Long;
  .registers 2
  .line 55
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$400(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
  .registers 3
  .line 55
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->build(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$500()Landroid/os/Handler;
  .registers 1
  .line 55
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->main:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$600(Landroid/view/View;)V
  .registers 1
  .line 55
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->leadRow(Landroid/view/View;)V
    return-void
.end method

.method public static apply(Ljava/lang/Object;)V
  .catchall { :L0 .. :L12 } :L13
  .registers 8
  .line 81
    instance-of v0, p0, Landroid/app/Activity;
    if-nez v0, :L0
    return-void
  :L0
  .line 83
    check-cast p0, Landroid/app/Activity;
  .line 84
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v0
  .line 85
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->even(Landroid/content/Context;)Z
    move-result v1
  .line 86
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->stock(Landroid/content/Context;)Z
    move-result v2
  .line 87
    instance-of v3, p0, Lcom/innioasis/y1/activity/MainActivity;
    if-eqz v3, :L2
  .line 88
    const v1, 2131362308
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    const v3, 2131362147
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/MenuStyle;->page(Landroid/view/View;Landroid/view/View;)Z
    move-result v1
    if-eqz v1, :L1
    if-nez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->mainPreview(Landroid/app/Activity;)V
  :L1
  .line 89
    if-nez v0, :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->preloadMain(Landroid/app/Activity;)V
    goto/16 :L8
  :L2
  .line 90
    instance-of v3, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const v4, 2131362310
    if-eqz v3, :L3
  .line 91
    invoke-virtual { p0, v4 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    const v3, 2131362326
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/MenuStyle;->page(Landroid/view/View;Landroid/view/View;)Z
    move-result v1
    if-eqz v1, :L8
    if-nez v0, :L8
  .line 92
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->paintPanel()V
    goto/16 :L8
  :L3
  .line 94
    instance-of v3, p0, Lcom/innioasis/y1/activity/IppMenuActivity;
    if-eqz v3, :L4
  .line 95
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/activity/IppMenuActivity;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppMenuActivity;->restyle()V
    goto/16 :L8
  :L4
  .line 96
    instance-of v3, p0, Lcom/innioasis/y1/activity/EqActivity;
    const v5, 2131362085
    const/16 v6, -100
    if-eqz v3, :L5
  .line 97
    const v3, 2131362312
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3, v6, v0, v1, v2 }, Lcom/innioasis/ipp/MenuStyle;->size(Landroid/view/View;IZZZ)V
  .line 98
    invoke-virtual { p0, v5 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v3
  .line 99
    invoke-static { v3, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 100
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/MenuStyle;->side(Landroid/view/View;Z)V
  .line 101
    goto :L8
  :L5
    instance-of v3, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v3, :L6
  .line 102
    invoke-virtual { p0, v4 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3, v6, v0, v1, v2 }, Lcom/innioasis/ipp/MenuStyle;->size(Landroid/view/View;IZZZ)V
  .line 103
    const v1, 2131362087
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L8
  :L6
  .line 104
    instance-of v3, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v3, :L7
  .line 105
    invoke-virtual { p0, v4 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3, v6, v0, v1, v2 }, Lcom/innioasis/ipp/MenuStyle;->size(Landroid/view/View;IZZZ)V
  .line 106
    invoke-virtual { p0, v5 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L8
  :L7
  .line 107
    instance-of v3, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-eqz v3, :L8
  .line 108
    const v3, 2131361987
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3, v6, v0, v1, v2 }, Lcom/innioasis/ipp/MenuStyle;->size(Landroid/view/View;IZZZ)V
  .line 109
    const v3, 2131362373
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v4
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 110
    const v4, 2131362086
    invoke-virtual { p0, v4 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v5
    invoke-static { v5, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 111
    const v5, 2131362371
    invoke-virtual { p0, v5 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v5
    invoke-static { v5, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 112
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v3
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/MenuStyle;->side(Landroid/view/View;Z)V
  .line 113
    invoke-virtual { p0, v4 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->dateIcon(Landroid/view/View;)V
  :L8
  .line 115
    if-eqz v2, :L10
    instance-of v1, p0, Lcom/innioasis/y1/activity/MainActivity;
    if-nez v1, :L9
    instance-of v1, p0, Lcom/innioasis/y1/activity/SettingActivity;
    if-nez v1, :L9
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->sub(Landroid/app/Activity;)Z
    move-result v1
    if-nez v1, :L9
  .line 116
    const v1, 2131362153
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->rows(Landroid/view/View;)Z
    move-result v1
    if-nez v1, :L10
  :L9
    const/4 v1, 4
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result v1
    goto :L11
  :L10
    const/4 v1, 0
  :L11
  .line 115
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/TopBar;->indent(Landroid/app/Activity;I)V
  .line 117
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->section(Landroid/app/Activity;)V
  .line 118
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->backdrop(Landroid/app/Activity;Z)V
  .line 119
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->apply(Landroid/app/Activity;)V
  .line 120
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->apply(Landroid/app/Activity;)V
  .line 121
    invoke-static { p0 }, Lcom/innioasis/ipp/Fill;->apply(Landroid/app/Activity;)V
  :L12
  .line 123
    goto :L14
  :L13
  .line 122
    move-exception p0
  :L14
  .line 124
    return-void
.end method

.method private static backdrop(Landroid/app/Activity;Z)V
  .catchall { :L0 .. :L6 } :L7
  .registers 4
  :L0
  .line 437
    instance-of v0, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const/4 v1, 0
    if-eqz v0, :L2
  .line 438
    check-cast p0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->back:Landroid/widget/ImageView;
  .line 439
    if-eqz p1, :L1
    const/4 v1, 4
  :L1
    invoke-virtual { p0, v1 }, Landroid/view/View;->setVisibility(I)V
  .line 440
    return-void
  :L2
  .line 442
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->sub(Landroid/app/Activity;)Z
    move-result v0
    if-nez v0, :L3
    return-void
  :L3
  .line 443
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getBackImageView()Landroid/widget/ImageView;
    move-result-object p0
  .line 444
    if-eqz p1, :L4
  .line 445
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 446
    return-void
  :L4
  .line 448
    const p1, 2131361890
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L5
  .line 449
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, p1, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 451
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 452
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
  :L5
  .line 454
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L6
  .line 456
    goto :L8
  :L7
  .line 455
    move-exception p0
  :L8
  .line 457
    return-void
.end method

.method public static betterY(Landroid/widget/ImageView;)V
  .registers 3
  .line 229
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->logo(Landroid/content/Context;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 230
    if-eqz v0, :L0
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    goto :L1
  :L0
  .line 231
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v1, 2131231141
    invoke-virtual { v0, p0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  :L1
  .line 232
    return-void
.end method

.method private static build(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
  .catchall { :L12 .. :L15 } :L14
  .registers 13
  .line 573
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 574
    const/4 v1, 1
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 575
    invoke-static { p0, p1, v0 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 576
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I
  .line 577
    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I
  .line 578
    const/4 v3, 0
    if-lez v2, :L16
    if-gtz v0, :L0
    goto/16 :L16
  :L0
  .line 579
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
  .line 580
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v2, v0, v4 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v4
    sput-object v4, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
  :L2
  .line 582
    new-instance v4, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v4 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 583
    const/4 v5, 0
    iput-boolean v5, v4, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 584
    iput-boolean v1, v4, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 585
    iput v1, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 586
    sget-object v6, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    iput-object v6, v4, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 587
    invoke-static { p0, p1, v4 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 588
    if-nez v4, :L3
    return-object v3
  :L3
  .line 590
    if-le v2, p2, :L8
  .line 591
    int-to-float v6, v0
    int-to-float v7, p2
    mul-float v6, v6, v7
    int-to-float v7, v2
    div-float/2addr v6, v7
    invoke-static { v6 }, Ljava/lang/Math;->round(F)I
    move-result v6
    invoke-static { v1, v6 }, Ljava/lang/Math;->max(II)I
    move-result v6
  .line 592
    nop
  .line 594
    mul-int/lit8 v7, p2, 2
    if-le v2, v7, :L6
  .line 595
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
  .line 596
    mul-int/lit8 v8, v6, 2
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v7, v8, v9 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v8
    sput-object v8, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
  :L5
  .line 598
    sget-object v8, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    invoke-virtual { v8, v5 }, Landroid/graphics/Bitmap;->eraseColor(I)V
  .line 599
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
  .line 600
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    goto :L7
  :L6
  .line 594
    move-object v0, v4
  :L7
  .line 602
    invoke-static { v0, p2, v6, v1 }, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 603
    goto :L9
  :L8
  .line 604
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-virtual { v4, v0, v5 }, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;
    move-result-object v0
  :L9
  .line 606
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    if-eq v4, v1, :L10
    sput-object v3, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
  :L10
  .line 607
    if-nez v0, :L11
    return-object v3
  :L11
  .line 608
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-direct { v1, p0, v0 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
  .line 609
    sget-object p0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter p0
  :L12
  .line 610
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/graphics/drawable/Drawable;
  .line 611
    if-eqz v0, :L13
    monitor-exit p0
    return-object v0
  :L13
  .line 612
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object p1
    invoke-virtual { p0, p1, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 613
    monitor-exit p0
  .line 614
    return-object v1
  :L14
  .line 613
    move-exception p1
    monitor-exit p0
  :L15
    throw p1
  :L16
  .line 578
    return-object v3
.end method

.method private static dateIcon(Landroid/view/View;)V
  .registers 3
  .line 374
    instance-of v0, p0, Landroid/widget/ImageView;
    if-eqz v0, :L1
    const v0, 2131362086
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 375
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v0, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 376
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast p0, Landroid/widget/ImageView;
    const v1, 2131230954
    invoke-virtual { v0, p0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 377
    return-void
  :L1
  .line 374
    return-void
.end method

.method public static even(Landroid/content/Context;)Z
  .registers 2
  .line 71
    const-string v0, "menu_style"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
    const/4 v0, 2
    if-ne p0, v0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method static half(Landroid/app/Activity;)Landroid/view/View;
  .registers 5
  .line 406
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L0
    return-object v1
  :L0
  .line 407
    nop
  .line 408
    instance-of v0, p0, Lcom/innioasis/y1/activity/MainActivity;
    const v2, 2131362308
    if-eqz v0, :L1
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    goto/16 :L11
  :L1
  .line 409
    instance-of v0, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const v3, 2131362310
    if-nez v0, :L10
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-nez v0, :L10
    instance-of v0, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v0, :L2
    goto :L10
  :L2
  .line 411
    instance-of v0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz v0, :L3
    const v0, 2131362312
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    goto :L11
  :L3
  .line 412
    instance-of v0, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-eqz v0, :L4
    const v0, 2131361987
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    goto :L11
  :L4
  .line 413
    instance-of v0, p0, Lcom/innioasis/music/MusicMainActivity;
    if-nez v0, :L9
    instance-of v0, p0, Lcom/innioasis/y1/activity/EbookActivity;
    if-eqz v0, :L5
    goto :L9
  :L5
  .line 414
    instance-of v0, p0, Lcom/innioasis/y1_eBook/ui/main/MainActivity;
    if-eqz v0, :L6
  .line 415
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result v0
    if-nez v0, :L8
    const v0, 2131362552
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    goto :L11
  :L6
  .line 416
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-eqz v0, :L7
  .line 417
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->videoRoot(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :L8
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    goto :L11
  :L7
  .line 418
    instance-of v0, p0, Lcom/innioasis/y1/activity/IppActivity;
    if-eqz v0, :L8
  .line 419
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity;->atRoot()Z
    move-result v0
    if-eqz v0, :L8
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    goto :L11
  :L8
  .line 421
    move-object p0, v1
    goto :L11
  :L9
  .line 413
    const v0, 2131362180
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
    goto :L11
  :L10
  .line 410
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  :L11
  .line 421
    if-eqz p0, :L12
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-nez v0, :L12
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result v0
    if-lez v0, :L12
    move-object v1, p0
  :L12
    return-object v1
.end method

.method private static hide(Landroid/view/View;Z)Z
  .registers 4
  .line 466
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 467
    if-eqz p1, :L1
    const/16 p1, 8
    goto :L2
  :L1
    const/4 p1, 0
  :L2
  .line 468
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-ne v1, p1, :L3
    return v0
  :L3
  .line 469
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  .line 470
    const/4 p0, 1
    return p0
.end method

.method private static host(Landroid/view/View;)Landroid/content/Context;
  .registers 3
  .line 515
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 516
    const/4 v0, 0
  :L0
  .line 517
    const/4 v1, 4
    if-ge v0, v1, :L1
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    instance-of v1, p0, Landroid/content/ContextWrapper;
    if-eqz v1, :L1
  .line 518
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
  .line 517
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 520
    return-object p0
.end method

.method private static inset(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;I)V
  .registers 4
  .line 789
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout;
    if-eqz v0, :L1
  .line 790
    invoke-virtual { p0 }, Landroid/view/View;->getTranslationX()F
    move-result p1
    int-to-float p2, p2
    cmpl-float p1, p1, p2
    if-eqz p1, :L0
    invoke-virtual { p0, p2 }, Landroid/view/View;->setTranslationX(F)V
  :L0
  .line 791
    return-void
  :L1
  .line 793
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v0, :L2
    return-void
  :L2
  .line 794
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 795
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    if-ne v0, p2, :L3
    invoke-virtual { p1 }, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I
    move-result v0
    if-ne v0, p2, :L3
    return-void
  :L3
  .line 796
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 797
    invoke-virtual { p1, p2 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 798
    invoke-virtual { p0, p1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 799
    return-void
.end method

.method private static key(II)Ljava/lang/Long;
  .registers 4
  .line 550
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

.method private static lead(Landroid/view/View;I)V
  .registers 3
  .line 810
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-nez v0, :L0
    return-void
  :L0
  .line 811
    const v0, 2131362491
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { p0, v0, p1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 812
    instance-of p1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz p1, :L1
    const p1, 2131362459
    invoke-virtual { p0, p1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L1
  .line 813
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, p1, v0 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 814
    move-object p1, p0
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;
    new-instance v0, Lcom/innioasis/ipp/MenuStyle$ListLead;
    invoke-direct { v0 }, Lcom/innioasis/ipp/MenuStyle$ListLead;-><init>()V
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V
  :L1
  .line 816
    check-cast p0, Landroid/view/ViewGroup;
  .line 817
    const/4 p1, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-ge p1, v0, :L3
    invoke-virtual { p0, p1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->leadRow(Landroid/view/View;)V
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 818
    return-void
.end method

.method private static leadIn(Landroid/view/ViewGroup;I)V
  .registers 7
  .line 836
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getWidth()I
    move-result v0
    div-int/lit8 v0, v0, 2
  .line 837
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v2
    if-ge v1, v2, :L5
  .line 838
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 839
    instance-of v3, v2, Landroid/view/ViewGroup;
    const/4 v4, 0
    if-eqz v3, :L2
    if-lez v0, :L2
    invoke-virtual { v2 }, Landroid/view/View;->getWidth()I
    move-result v3
    if-le v3, v0, :L2
  .line 840
    invoke-virtual { v2 }, Landroid/view/View;->getTranslationX()F
    move-result v3
    cmpl-float v3, v3, v4
    if-eqz v3, :L1
    invoke-virtual { v2, v4 }, Landroid/view/View;->setTranslationX(F)V
  :L1
  .line 841
    check-cast v2, Landroid/view/ViewGroup;
    invoke-static { v2, p1 }, Lcom/innioasis/ipp/MenuStyle;->leadIn(Landroid/view/ViewGroup;I)V
  .line 842
    goto :L4
  :L2
  .line 844
    if-lez p1, :L3
    invoke-virtual { v2 }, Landroid/view/View;->getLeft()I
    move-result v3
    if-ge v3, v0, :L3
    neg-int v3, p1
    int-to-float v4, v3
  :L3
  .line 845
    invoke-virtual { v2 }, Landroid/view/View;->getTranslationX()F
    move-result v3
    cmpl-float v3, v3, v4
    if-eqz v3, :L4
    invoke-virtual { v2, v4 }, Landroid/view/View;->setTranslationX(F)V
  :L4
  .line 837
    add-int/lit8 v1, v1, 1
    goto :L0
  :L5
  .line 847
    return-void
.end method

.method private static leadRow(Landroid/view/View;)V
  .registers 3
  .line 822
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-nez v0, :L0
    return-void
  :L0
  .line 823
    const v0, 2131362459
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    if-nez v1, :L1
  .line 824
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v0, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 825
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->ROW_LEAD:Lcom/innioasis/ipp/MenuStyle$RowLead;
    invoke-virtual { p0, v0 }, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V
  :L1
  .line 827
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v0, v0, Landroid/view/View;
    if-eqz v0, :L2
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    check-cast v0, Landroid/view/View;
    const v1, 2131362491
    invoke-virtual { v0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    goto :L3
  :L2
    const/4 v0, 0
  :L3
  .line 828
    check-cast p0, Landroid/view/ViewGroup;
    instance-of v1, v0, Ljava/lang/Integer;
    if-eqz v1, :L4
    check-cast v0, Ljava/lang/Integer;
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
    goto :L5
  :L4
    const/4 v0, 0
  :L5
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->leadIn(Landroid/view/ViewGroup;I)V
  .line 829
    return-void
.end method

.method private static loadLater(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  .catchall { :L1 .. :L4 } :L5
  .catchall { :L6 .. :L7 } :L5
  .registers 7
  .line 618
    if-gtz p2, :L0
    return-void
  :L0
  .line 620
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter v0
  .line 621
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
  .line 622
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
    if-nez v1, :L3
  .line 623
    new-instance v1, Landroid/os/HandlerThread;
    const-string v2, "ipp-preview"
    invoke-direct { v1, v2 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 624
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->start()V
  .line 625
    new-instance v2, Landroid/os/Handler;
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v2, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v2, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
  .line 626
    new-instance v1, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct { v1, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->main:Landroid/os/Handler;
  :L3
  .line 628
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
  .line 629
    monitor-exit v0
  :L4
  .line 630
    new-instance v0, Lcom/innioasis/ipp/MenuStyle$Load;
    invoke-direct { v0, p0, p1, p2, p3 }, Lcom/innioasis/ipp/MenuStyle$Load;-><init>(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
    invoke-virtual { v1, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 631
    sget-object p0, Lcom/innioasis/ipp/MenuStyle;->DROP:Ljava/lang/Runnable;
    invoke-virtual { v1, p0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 632
    const-wide/16 p1, 3000
    invoke-virtual { v1, p0, p1, p2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 633
    return-void
  :L5
  .line 629
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
  .line 202
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v1
  .line 203
    if-nez v1, :L1
    const-string v1, ""
  :L1
  .line 204
    const-class v2, Lcom/innioasis/ipp/MenuStyle;
    monitor-enter v2
  :L2
  .line 205
    sget-object v3, Lcom/innioasis/ipp/MenuStyle;->logoTheme:Ljava/lang/String;
    invoke-virtual { v1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L3
    sget-object p0, Lcom/innioasis/ipp/MenuStyle;->logoBmp:Landroid/graphics/Bitmap;
    monitor-exit v2
    return-object p0
  :L3
  .line 206
    monitor-exit v2
  :L4
  .line 207
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
  .line 208
    if-nez v2, :L7
    move-object p0, v0
    goto :L8
  :L7
    const/16 v3, 360
    invoke-static { p0, v2, v3, v3 }, Lcom/innioasis/ipp/Saver;->fitted(Landroid/content/Context;Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
  :L8
  .line 209
    const-class v2, Lcom/innioasis/ipp/MenuStyle;
    monitor-enter v2
  :L9
  .line 210
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->logoTheme:Ljava/lang/String;
  .line 211
    sput-object p0, Lcom/innioasis/ipp/MenuStyle;->logoBmp:Landroid/graphics/Bitmap;
  .line 212
    monitor-exit v2
  .line 213
    return-object p0
  :L10
  .line 212
    move-exception p0
    monitor-exit v2
  :L11
    throw p0
  :L12
  .line 206
    move-exception p0
  :L13
    monitor-exit v2
  :L14
    throw p0
  :L15
  .line 214
    move-exception p0
  .line 215
    return-object v0
.end method

.method static declared-synchronized logoRecheck()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/MenuStyle;
    monitor-enter v0
  .line 223
    const/4 v1, 0
  :L0
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->logoTheme:Ljava/lang/String;
  .line 224
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->logoBmp:Landroid/graphics/Bitmap;
  :L1
  .line 225
    monitor-exit v0
    return-void
  :L2
  .line 222
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method static mainPreview(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 476
    const-class v0, Lcom/innioasis/y1/activity/MainActivity;
    const-string v1, "selItem"
    const/4 v2, 0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
  .line 477
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Method;->setAccessible(Z)V
  .line 478
    new-array v1, v2, [Ljava/lang/Object;
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 480
    goto :L3
  :L2
  .line 479
    move-exception p0
  :L3
  .line 481
    return-void
.end method

.method public static page(Landroid/view/View;Landroid/view/View;)Z
  .registers 3
  .line 744
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Pad;->list(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 745
    if-nez p1, :L1
    const/4 p0, 0
    return p0
  :L1
  .line 746
    invoke-virtual { p1 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 747
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->even(Landroid/content/Context;)Z
    move-result v0
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/MenuStyle;->side(Landroid/view/View;Z)V
  .line 748
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result p0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    move-result p0
    return p0
.end method

.method private static panel(Landroid/widget/ImageView;)Z
  .registers 3
  .line 508
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getId()I
    move-result v0
  .line 509
    const v1, 2131362147
    if-eq v0, v1, :L1
    const v1, 2131362323
    if-eq v0, v1, :L1
    const v1, 2131362085
    if-ne v0, v1, :L0
  .line 510
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
  .line 509
    return p0
.end method

.method private static parent(Landroid/view/View;)Landroid/view/View;
  .registers 3
  .line 460
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  :L1
  .line 461
    instance-of v1, p0, Landroid/view/View;
    if-eqz v1, :L2
    move-object v0, p0
    check-cast v0, Landroid/view/View;
  :L2
    return-object v0
.end method

.method private static preloadMain(Landroid/app/Activity;)V
  .registers 6
  .line 707
    sget-boolean v0, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 708
    const v0, 2131362147
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 709
    const v1, 2131362308
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 710
    if-eqz v0, :L7
    instance-of v2, v1, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v2, :L1
    goto :L7
  :L1
  .line 711
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
  .line 712
    instance-of v2, v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-nez v2, :L2
    return-void
  :L2
  .line 713
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->width(Landroid/view/View;)I
    move-result v0
  .line 714
    if-gtz v0, :L3
    return-void
  :L3
  .line 715
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
  .line 716
    check-cast v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object v1
  .line 717
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->probeView(Landroid/content/Context;I)Landroid/widget/ImageView;
    move-result-object v0
  .line 718
    const/4 v2, 0
  :L4
    sget-object v3, Lcom/innioasis/ipp/MenuStyle;->MAIN_ROWS:[I
    array-length v4, v3
    if-ge v2, v4, :L6
  .line 719
    aget v3, v3, v2
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-interface { v1, v3 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
  .line 720
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget-object v4, Lcom/innioasis/ipp/MenuStyle;->MAIN_PICS:[I
    aget v4, v4, v2
    invoke-virtual { v3, v0, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  :L5
  .line 718
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 725
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    new-instance v1, Landroid/widget/ImageView;
    invoke-direct { v1, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
  .line 726
    return-void
  :L7
  .line 710
    return-void
.end method

.method private static probeView(Landroid/content/Context;I)Landroid/widget/ImageView;
  .registers 4
  .line 691
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct { v0, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 692
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;
    const/4 v1, -2
    invoke-direct { p0, p1, v1 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 693
    const p0, 2131362323
    sget-object p1, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
    invoke-virtual { v0, p0, p1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 694
    return-object v0
.end method

.method private static px(Landroid/content/Context;I)I
  .registers 2
  .line 329
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
  .line 526
    const v0, 2131362323
  :L0
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
    const/4 v2, 0
    if-ne v0, v1, :L1
  .line 527
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v0, p1, v1, v2 }, Lcom/innioasis/ipp/MenuStyle;->loadLater(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  .line 528
    return-void
  :L1
  .line 530
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->panel(Landroid/widget/ImageView;)Z
    move-result v0
    if-eqz v0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->width(Landroid/view/View;)I
    move-result v0
    goto :L3
  :L2
    const/4 v0, 0
  :L3
  .line 531
    if-lez v0, :L12
  .line 533
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
  .line 534
    const v1, 2131362147
    if-eqz v3, :L7
  :L6
  .line 535
    invoke-virtual { p0, v1, v2 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 536
    invoke-virtual { p0, v3 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 537
    return-void
  :L7
  .line 540
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { p0, v1, v2 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 541
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-static { v1, p1, v0, p0 }, Lcom/innioasis/ipp/MenuStyle;->loadLater(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  :L8
  .line 542
    return-void
  :L9
  .line 533
    move-exception v0
  :L10
    monitor-exit v1
  :L11
    throw v0
  :L12
  .line 545
    goto :L14
  :L13
  .line 544
    move-exception v0
  :L14
  .line 546
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 547
    return-void
.end method

.method static rows(Landroid/view/View;)Z
  .registers 5
  .line 384
    const/4 v0, 0
    if-eqz p0, :L9
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-eqz v1, :L0
    goto :L9
  :L0
  .line 385
    instance-of v1, p0, Landroid/widget/AbsListView;
    const/4 v2, 1
    if-eqz v1, :L1
    instance-of p0, p0, Landroid/widget/GridView;
    xor-int/2addr p0, v2
    return p0
  :L1
  .line 386
    instance-of v1, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v1, :L5
  .line 387
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
  .line 389
    if-nez p0, :L2
    return v2
  :L2
  .line 390
    instance-of v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;
    if-eqz v1, :L3
    instance-of v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;
    if-nez v1, :L3
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;
  .line 392
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I
    move-result p0
    if-ne p0, v2, :L3
    const/4 v0, 1
    goto :L4
  :L3
    nop
  :L4
  .line 390
    return v0
  :L5
  .line 395
    instance-of v1, p0, Landroid/view/ViewGroup;
    if-eqz v1, :L8
  .line 396
    check-cast p0, Landroid/view/ViewGroup;
  .line 397
    const/4 v1, 0
  :L6
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v1, v3, :L8
  .line 398
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/MenuStyle;->rows(Landroid/view/View;)Z
    move-result v3
    if-eqz v3, :L7
    return v2
  :L7
  .line 397
    add-int/lit8 v1, v1, 1
    goto :L6
  :L8
  .line 401
    return v0
  :L9
  .line 384
    return v0
.end method

.method public static section(Landroid/app/Activity;)V
  .catchall { :L0 .. :L11 } :L13
  .registers 12
  .line 143
    nop
  :L0
  .line 144
    instance-of v0, p0, Lcom/innioasis/music/MusicMainActivity;
    const v1, 2131362180
    const/4 v2, 1
    if-eqz v0, :L1
  .line 145
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 146
    const v1, 2131231078
    move-object v5, v0
    const/4 v1, 1
    const v6, 2131231078
    goto :L5
  :L1
  .line 147
    instance-of v0, p0, Lcom/innioasis/y1/activity/EbookActivity;
    if-eqz v0, :L2
  .line 148
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 149
    const v1, 2131231069
    move-object v5, v0
    const/4 v1, 1
    const v6, 2131231069
    goto :L5
  :L2
  .line 150
    instance-of v0, p0, Lcom/innioasis/y1_eBook/ui/main/MainActivity;
    if-eqz v0, :L3
  .line 151
    const v0, 2131362552
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 152
    nop
  .line 153
    invoke-static { p0 }, Lcom/innioasis/ipp/Ebook;->library(Landroid/app/Activity;)Z
    move-result v1
    xor-int/2addr v1, v2
    const v3, 2131231072
    move-object v5, v0
    const v6, 2131231072
    goto :L5
  :L3
  .line 154
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity;
    if-eqz v0, :L4
  .line 155
    const v0, 2131362310
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 156
    nop
  .line 157
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->videoRoot(Landroid/app/Activity;)Z
    move-result v1
  .line 158
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->watchVideos(Landroid/app/Activity;Landroid/view/View;)V
    const v3, 2131231083
    move-object v5, v0
    const v6, 2131231083
    goto :L5
  :L4
  .line 159
    instance-of v0, p0, Lcom/innioasis/y1/activity/IppActivity;
    if-eqz v0, :L12
  .line 160
    const v0, 2131362308
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 161
    nop
  .line 162
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppActivity;->atRoot()Z
    move-result v1
    const v3, 2131231141
    move-object v5, v0
    const v6, 2131231141
  :L5
  .line 166
    instance-of v0, p0, Lcom/innioasis/y1/activity/IppActivity;
  .line 167
    const/4 v3, 0
    if-eqz v1, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v4
    if-nez v4, :L6
    const/4 v10, 1
    goto :L7
  :L6
    const/4 v10, 0
  :L7
  .line 168
    if-eqz v1, :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->stock(Landroid/content/Context;)Z
    move-result v4
    if-eqz v4, :L8
    const/4 v9, 1
    goto :L9
  :L8
    const/4 v9, 0
  :L9
    move-object v4, p0
    move v7, v10
    move v8, v0
    invoke-static/range { v4 .. v9 }, Lcom/innioasis/ipp/MenuStyle;->split(Landroid/app/Activity;Landroid/view/View;IZZZ)V
  .line 169
    if-eqz v1, :L10
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->stock(Landroid/content/Context;)Z
    move-result v1
    if-eqz v1, :L10
    const/4 v1, 4
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result v3
  :L10
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/TopBar;->indent(Landroid/app/Activity;I)V
  .line 170
    invoke-static { p0, v10, v0 }, Lcom/innioasis/ipp/MenuStyle;->wallpaper(Landroid/app/Activity;ZZ)V
  :L11
  .line 172
    goto :L14
  :L12
  .line 164
    return-void
  :L13
  .line 171
    move-exception p0
  :L14
  .line 173
    return-void
.end method

.method private static sectionPic(Landroid/app/Activity;ZZ)Landroid/view/View;
  .registers 10
  .line 252
    const v0, 2131362153
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 253
    const/4 v1, 0
    if-nez v0, :L0
    move-object v2, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
  :L1
  .line 254
    instance-of v3, v2, Landroidx/constraintlayout/widget/ConstraintLayout;
    if-nez v3, :L2
    return-object v1
  :L2
  .line 255
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 256
    const v3, 2131362147
    invoke-virtual { v2, v3 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getTag(I)Ljava/lang/Object;
    move-result-object v4
  .line 257
    instance-of v5, v4, Landroid/view/View;
    if-eqz v5, :L3
    check-cast v4, Landroid/view/View;
    return-object v4
  :L3
  .line 258
    if-nez p1, :L4
    return-object v1
  :L4
  .line 261
    const/4 p1, 1
    const/4 v4, 0
    if-eqz p2, :L5
  .line 262
    invoke-static { p0 }, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;
    move-result-object p0
  .line 263
    const p2, 2131558463
    invoke-virtual { p0, p2, v2, v4 }, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/view/ViewGroup;
  .line 264
    const p2, 2131362326
    invoke-virtual { p0, p2 }, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v5
    check-cast v5, Landroid/view/View;
  .line 265
    invoke-virtual { v5 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v6
    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    invoke-static { v6 }, Lcom/innioasis/ipp/Pad;->copy(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    move-result-object v6
  .line 266
    invoke-virtual { p0, v5 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  .line 267
    invoke-virtual { v5, p2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/TextView;
  .line 268
    const p2, 2131821015
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setText(I)V
  .line 269
    invoke-virtual { p0, v4 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 270
    const p0, 2131362323
    invoke-virtual { v5, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 271
    const p0, 2131362097
    invoke-virtual { v5, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    check-cast p0, Landroid/widget/TextView;
    const p2, 2131821014
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setText(I)V
  .line 272
    goto :L6
  :L5
  .line 273
    new-instance v5, Landroid/widget/ImageView;
    invoke-direct { v5, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 274
    invoke-virtual { v5, v3 }, Landroid/widget/ImageView;->setId(I)V
  .line 275
    invoke-virtual { v5, p1 }, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V
  .line 276
    nop
  .line 277
    new-instance v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    const/16 p2, 179
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p2
    const/4 v1, -2
    invoke-direct { v6, p2, v1 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V
  .line 278
    iput v4, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
  .line 279
    iput v4, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightToRight:I
  .line 280
    const/16 p2, 86
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p2
    iput p2, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topMargin:I
  .line 281
    const/16 p2, 23
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result v1
    iput v1, v6, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->rightMargin:I
  .line 282
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p0
    invoke-virtual { v6, p0 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->setMarginEnd(I)V
  :L6
  .line 284
    invoke-virtual { v2, v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->indexOfChild(Landroid/view/View;)I
    move-result p0
    add-int/2addr p0, p1
    invoke-virtual { v2, v5, p0, v6 }, Landroidx/constraintlayout/widget/ConstraintLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 285
    invoke-virtual { v2, v3, v5 }, Landroidx/constraintlayout/widget/ConstraintLayout;->setTag(ILjava/lang/Object;)V
  .line 286
    return-object v5
.end method

.method static settingsLogo(Lcom/innioasis/y1/activity/SettingActivity;Ljava/lang/String;)Z
  .registers 3
  .line 236
    const v0, 2131821015
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    const/4 v0, 0
    if-nez p1, :L0
    return v0
  :L0
  .line 237
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->logo(Landroid/content/Context;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 238
    if-nez p1, :L1
    return v0
  :L1
  .line 239
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
  .line 240
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->rightImage:Landroid/widget/ImageView;
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 241
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->infoStateTv:Landroid/widget/TextView;
    const p1, 2131821014
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(I)V
  .line 242
    const/4 p0, 1
    return p0
.end method

.method private static side(Landroid/view/View;Z)V
  .registers 6
  .line 868
    if-eqz p0, :L5
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v0, :L0
    goto :L5
  :L0
  .line 869
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 870
    const v1, 2131362152
    invoke-virtual { p0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v2
  .line 871
    instance-of v3, v2, Ljava/lang/Integer;
    if-nez v3, :L1
  .line 872
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
  .line 873
    invoke-virtual { p0, v1, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L1
  .line 875
    if-eqz p1, :L2
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p1
    const/16 v1, 30
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p1
    goto :L3
  :L2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  :L3
  .line 876
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    if-ne v1, p1, :L4
    invoke-virtual { v0 }, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I
    move-result v1
    if-ne v1, p1, :L4
    return-void
  :L4
  .line 877
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
  .line 878
    invoke-virtual { v0, p1 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V
  .line 879
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 880
    return-void
  :L5
  .line 868
    return-void
.end method

.method public static simple(Landroid/content/Context;)Z
  .registers 2
  .line 66
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

.method private static size(Landroid/view/View;IZZZ)V
  .registers 9
  .line 757
    if-nez p0, :L0
    return-void
  :L0
  .line 758
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 759
    if-nez v0, :L1
    return-void
  :L1
  .line 760
    const v1, 2131362152
    invoke-virtual { p0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v2
  .line 761
    instance-of v3, v2, Ljava/lang/Integer;
    if-nez v3, :L2
  .line 762
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
  .line 763
    invoke-virtual { p0, v1, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L2
  .line 765
    const/16 v1, -100
    if-ne p1, v1, :L3
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  :L3
  .line 766
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
  .line 767
    const/4 v2, 0
    if-eqz p4, :L4
    const/16 v3, 9
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result v3
    goto :L5
  :L4
    const/4 v3, 0
  :L5
  .line 769
    if-nez p2, :L8
    if-gez p1, :L6
    goto :L8
  :L6
  .line 772
    if-eqz p3, :L7
  .line 773
    const/16 p1, 240
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result p1
    sub-int/2addr p1, v3
    goto :L11
  :L7
  .line 775
    sub-int/2addr p1, v3
    goto :L11
  :L8
  .line 770
    if-nez v3, :L9
    const/4 p1, -1
    goto :L10
  :L9
  .line 771
    invoke-virtual { v1 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I
    sub-int/2addr p1, v3
  :L10
    nop
  :L11
  .line 777
    invoke-static { p0, v0, v3 }, Lcom/innioasis/ipp/MenuStyle;->inset(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;I)V
  .line 778
    if-eqz p4, :L12
    const/4 p2, 5
    invoke-static { v1, p2 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result v2
  :L12
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/MenuStyle;->lead(Landroid/view/View;I)V
  .line 779
    iget p2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-ne p2, p1, :L13
    return-void
  :L13
  .line 780
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 781
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 782
    return-void
.end method

.method private static split(Landroid/app/Activity;Landroid/view/View;IZZZ)V
  .registers 9
  .line 176
    if-nez p1, :L0
    return-void
  :L0
  .line 177
    if-eqz p3, :L3
    if-eqz p4, :L1
    const/16 v0, 227
    goto :L2
  :L1
    const/16 v0, 213
  :L2
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->px(Landroid/content/Context;I)I
    move-result v0
    goto :L4
  :L3
    const/16 v0, -100
  :L4
    xor-int/lit8 v1, p3, 1
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->even(Landroid/content/Context;)Z
    move-result v2
    invoke-static { p1, v0, v1, v2, p5 }, Lcom/innioasis/ipp/MenuStyle;->size(Landroid/view/View;IZZZ)V
  .line 178
    invoke-static { p0, p3, p4 }, Lcom/innioasis/ipp/MenuStyle;->sectionPic(Landroid/app/Activity;ZZ)Landroid/view/View;
    move-result-object p1
  .line 179
    if-nez p1, :L5
    return-void
  :L5
  .line 180
    if-eqz p3, :L6
    const/4 p4, 0
    goto :L7
  :L6
    const/16 p4, 8
  :L7
    invoke-virtual { p1, p4 }, Landroid/view/View;->setVisibility(I)V
  .line 181
    if-nez p3, :L8
    return-void
  :L8
  .line 182
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->even(Landroid/content/Context;)Z
    move-result p3
    invoke-static { p1, p3 }, Lcom/innioasis/ipp/MenuStyle;->side(Landroid/view/View;Z)V
  .line 183
    instance-of p3, p1, Landroid/widget/ImageView;
    if-eqz p3, :L9
    move-object p3, p1
    goto :L10
  :L9
    const p3, 2131362323
    invoke-virtual { p1, p3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p3
  :L10
    check-cast p3, Landroid/widget/ImageView;
  .line 184
    const p4, 2131231141
    if-ne p2, p4, :L11
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->logo(Landroid/content/Context;)Landroid/graphics/Bitmap;
    move-result-object p4
    goto :L12
  :L11
    const/4 p4, 0
  :L12
  .line 185
    if-eqz p4, :L13
    move-object p5, p4
    goto :L14
  :L13
    invoke-static { p2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p5
  :L14
  .line 186
    const v0, 2131362153
    invoke-virtual { p3, v0 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { p5, v1 }, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L16
  .line 187
    invoke-virtual { p3, v0, p5 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 188
    if-eqz p4, :L15
    invoke-virtual { p3, p4 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    goto :L16
  :L15
  .line 189
    sget-object p4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p4, p3, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  :L16
  .line 191
    const p2, 2131362097
    invoke-virtual { p1, p2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  .line 192
    instance-of p2, p1, Landroid/widget/TextView;
    if-eqz p2, :L17
    check-cast p1, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->fg(Landroid/content/Context;)I
    move-result p0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  :L17
  .line 193
    return-void
.end method

.method static stock(Landroid/content/Context;)Z
  .registers 2
  .line 76
    const-string v0, "fixed_menu_pad"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    xor-int/lit8 p0, p0, 1
    return p0
.end method

.method private static sub(Landroid/app/Activity;)Z
  .registers 2
  .line 426
    instance-of v0, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-nez v0, :L1
    instance-of v0, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-nez v0, :L1
    instance-of p0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method public static themeChanged()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 2
  .line 699
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter v0
  :L0
  .line 700
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 701
    monitor-exit v0
  :L1
  .line 702
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
  .line 703
    return-void
  :L2
  .line 701
    move-exception v1
  :L3
    monitor-exit v0
  :L4
    throw v1
.end method

.method private static videoRoot(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 5
  .line 337
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->videoStack:Ljava/lang/reflect/Field;
    const/4 v2, 1
    if-nez v1, :L1
  .line 338
    const-class v1, Lcom/innioasis/y1/activity/video/VideoListActivity;
    const-string v3, "browseHistoryStack"
    invoke-virtual { v1, v3 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 339
    invoke-virtual { v1, v2 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 340
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->videoStack:Ljava/lang/reflect/Field;
  :L1
  .line 342
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->videoStack:Ljava/lang/reflect/Field;
    invoke-virtual { v1, p0 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 343
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
  .line 344
    move-exception p0
  .line 345
    return v0
.end method

.method private static wallpaper(Landroid/app/Activity;ZZ)V
  .registers 9
  .line 295
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L0
    return-void
  :L0
  .line 296
    const/4 v0, 0
    const v1, 2131361890
    if-nez p2, :L3
  .line 297
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v2
  .line 298
    sget-object v3, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v3 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getDesktopBitmap()Landroid/graphics/Bitmap;
    move-result-object v3
  .line 299
    invoke-virtual { v2, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v4
  .line 300
    if-eqz p1, :L1
    if-eqz v3, :L1
    if-eq v4, v3, :L1
  .line 301
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-direct { v4, v5, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { v2, v4 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 302
    invoke-virtual { v2, v1, v3 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
    goto :L3
  :L1
  .line 303
    if-nez p1, :L3
    if-eqz v4, :L3
  .line 304
    sget-object v3, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v3 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object v3
  .line 305
    if-eqz v3, :L2
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-direct { v4, v5, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { v2, v4 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L2
  .line 306
    invoke-virtual { v2, v1, v0 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L3
  .line 309
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getBackImageView()Landroid/widget/ImageView;
    move-result-object p0
  .line 310
    if-nez p0, :L4
    return-void
  :L4
  .line 311
    if-nez p1, :L5
  .line 312
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 313
    return-void
  :L5
  .line 315
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object p1
    if-nez p1, :L7
  .line 316
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v1, p1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 318
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 319
    if-eqz p2, :L6
  .line 320
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
    goto :L7
  :L6
  .line 322
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setDeskMask(Landroid/widget/ImageView;)V
  :L7
  .line 325
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 326
    return-void
.end method

.method private static watchVideos(Landroid/app/Activity;Landroid/view/View;)V
  .registers 5
  .line 351
    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L2
    const v0, 2131362147
    invoke-virtual { p1, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L0
    goto :L2
  :L0
  .line 352
    move-object v1, p1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
  .line 353
    if-nez v1, :L1
    return-void
  :L1
  .line 354
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p1, v0, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 355
    new-instance p1, Lcom/innioasis/ipp/MenuStyle$VideoLevel;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/MenuStyle$VideoLevel;-><init>(Landroid/app/Activity;)V
    invoke-virtual { v1, p1 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;)V
  .line 356
    return-void
  :L2
  .line 351
    return-void
.end method

.method private static width(Landroid/view/View;)I
  .registers 6
  .line 555
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result v0
    if-lez v0, :L0
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result p0
    return p0
  :L0
  .line 556
    const/4 v0, 0
    const/4 v1, 0
  :L1
    const/4 v2, 4
    if-ge v1, v2, :L7
    if-eqz p0, :L7
  .line 557
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
  .line 558
    if-eqz v2, :L6
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    const/4 v4, -2
    if-ne v3, v4, :L2
    goto :L6
  :L2
  .line 559
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-lez v3, :L3
    iget p0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    return p0
  :L3
  .line 560
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 561
    instance-of v2, p0, Landroid/view/View;
    if-eqz v2, :L4
    check-cast p0, Landroid/view/View;
    goto :L5
  :L4
    const/4 p0, 0
  :L5
  .line 556
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 558
    return v0
  :L7
  .line 563
    return v0
.end method

.class public final Lcom/innioasis/ipp/MenuStyle;
.super Ljava/lang/Object;
.source "MenuStyle.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
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

.field private final static PREVIEWS:Ljava/util/HashMap;

.field private final static PROBE:Ljava/lang/Object;

.field private final static SIMPLE:I = 1

.field private static half:Landroid/graphics/Bitmap;

.field private static loader:Landroid/os/Handler;

.field private static main:Landroid/os/Handler;

.field private static mainLoaded:Z

.field private static scratch:Landroid/graphics/Bitmap;

.method static constructor <clinit>()V
  .registers 2
  .line 167
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
  .line 168
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
  .line 174
    const/16 v0, 12
    new-array v1, v0, [I
    fill-array-data v1, :L0
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->MAIN_ROWS:[I
  .line 179
    new-array v0, v0, [I
    fill-array-data v0, :L1
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->MAIN_PICS:[I
  .line 249
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    sput-object v0, Lcom/innioasis/ipp/MenuStyle;->FILTER:Landroid/graphics/Paint;
  .line 314
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
  .line 48
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$002(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 1
  .line 46
    sput-object p0, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$102(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 1
  .line 46
    sput-object p0, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    return-object p0
.end method

.method static synthetic access$200()Ljava/util/HashMap;
  .registers 1
  .line 46
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    return-object v0
.end method

.method static synthetic access$300(II)Ljava/lang/Long;
  .registers 2
  .line 46
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$400(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
  .registers 3
  .line 46
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->build(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$500()Landroid/os/Handler;
  .registers 1
  .line 46
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->main:Landroid/os/Handler;
    return-object v0
.end method

.method public static apply(Ljava/lang/Object;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 5
  .line 60
    instance-of v0, p0, Landroid/app/Activity;
    if-nez v0, :L0
    return-void
  :L0
  .line 62
    check-cast p0, Landroid/app/Activity;
  .line 63
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->simple(Landroid/content/Context;)Z
    move-result v0
  .line 64
    instance-of v1, p0, Lcom/innioasis/y1/activity/MainActivity;
    if-eqz v1, :L2
  .line 65
    const v1, 2131362308
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->pad(Landroid/view/View;)V
  .line 66
    const v1, 2131362147
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    move-result v1
    if-eqz v1, :L1
    if-nez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->mainPreview(Landroid/app/Activity;)V
  :L1
  .line 67
    if-nez v0, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->preloadMain(Landroid/app/Activity;)V
    goto/16 :L7
  :L2
  .line 68
    instance-of v1, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const v2, 2131362310
    if-eqz v1, :L3
  .line 69
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->pad(Landroid/view/View;)V
  .line 70
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
  .line 71
    instance-of v1, p0, Lcom/innioasis/y1/activity/EqActivity;
    const v3, 2131362085
    if-eqz v1, :L4
  .line 72
    const v1, 2131362312
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 73
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L7
  :L4
  .line 74
    instance-of v1, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-eqz v1, :L5
  .line 75
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 76
    const v1, 2131362087
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->parent(Landroid/view/View;)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L7
  :L5
  .line 77
    instance-of v1, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-eqz v1, :L6
  .line 78
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 79
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
    goto :L7
  :L6
  .line 80
    instance-of v1, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-eqz v1, :L7
  .line 81
    const v1, 2131361987
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->widen(Landroid/view/View;Z)V
  .line 82
    const v1, 2131362373
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 83
    const v1, 2131362086
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 84
    const v2, 2131362371
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/MenuStyle;->hide(Landroid/view/View;Z)Z
  .line 85
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/MenuStyle;->dateIcon(Landroid/view/View;)V
  :L7
  .line 87
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->backdrop(Landroid/app/Activity;Z)V
  .line 88
    invoke-static { p0 }, Lcom/innioasis/ipp/Preview;->apply(Landroid/app/Activity;)V
  .line 89
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->apply(Landroid/app/Activity;)V
  :L8
  .line 91
    goto :L10
  :L9
  .line 90
    move-exception p0
  :L10
  .line 92
    return-void
.end method

.method private static backdrop(Landroid/app/Activity;Z)V
  .catchall { :L0 .. :L6 } :L7
  .registers 4
  :L0
  .line 108
    instance-of v0, p0, Lcom/innioasis/y1/activity/SettingActivity;
    const/4 v1, 0
    if-eqz v0, :L2
  .line 109
    check-cast p0, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/SettingActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivitySettingBinding;->back:Landroid/widget/ImageView;
  .line 110
    if-eqz p1, :L1
    const/4 v1, 4
  :L1
    invoke-virtual { p0, v1 }, Landroid/view/View;->setVisibility(I)V
  .line 111
    return-void
  :L2
  .line 113
    instance-of v0, p0, Lcom/innioasis/y1/activity/LanguageActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/WallpaperListActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/DateOneLevelActivity;
    if-nez v0, :L3
    instance-of v0, p0, Lcom/innioasis/y1/activity/EqActivity;
    if-nez v0, :L3
  .line 115
    return-void
  :L3
  .line 117
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getBackImageView()Landroid/widget/ImageView;
    move-result-object p0
  .line 118
    if-eqz p1, :L4
  .line 119
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 120
    return-void
  :L4
  .line 122
    const p1, 2131361890
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L5
  .line 123
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, p1, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 125
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 126
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
  :L5
  .line 128
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L6
  .line 130
    goto :L8
  :L7
  .line 129
    move-exception p0
  :L8
  .line 131
    return-void
.end method

.method private static build(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
  .catchall { :L12 .. :L15 } :L14
  .registers 13
  .line 252
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 253
    const/4 v1, 1
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 254
    invoke-static { p0, p1, v0 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 255
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I
  .line 256
    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I
  .line 257
    const/4 v3, 0
    if-lez v2, :L16
    if-gtz v0, :L0
    goto/16 :L16
  :L0
  .line 258
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
  .line 259
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v2, v0, v4 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v4
    sput-object v4, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
  :L2
  .line 261
    new-instance v4, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v4 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 262
    const/4 v5, 0
    iput-boolean v5, v4, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 263
    iput-boolean v1, v4, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 264
    iput v1, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 265
    sget-object v6, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    iput-object v6, v4, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 266
    invoke-static { p0, p1, v4 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 267
    if-nez v4, :L3
    return-object v3
  :L3
  .line 269
    if-le v2, p2, :L8
  .line 270
    int-to-float v6, v0
    int-to-float v7, p2
    mul-float v6, v6, v7
    int-to-float v7, v2
    div-float/2addr v6, v7
    invoke-static { v6 }, Ljava/lang/Math;->round(F)I
    move-result v6
    invoke-static { v1, v6 }, Ljava/lang/Math;->max(II)I
    move-result v6
  .line 271
    nop
  .line 273
    mul-int/lit8 v7, p2, 2
    if-le v2, v7, :L6
  .line 274
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
  .line 275
    mul-int/lit8 v8, v6, 2
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v7, v8, v9 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v8
    sput-object v8, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
  :L5
  .line 277
    sget-object v8, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    invoke-virtual { v8, v5 }, Landroid/graphics/Bitmap;->eraseColor(I)V
  .line 278
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
  .line 279
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->half:Landroid/graphics/Bitmap;
    goto :L7
  :L6
  .line 273
    move-object v0, v4
  :L7
  .line 281
    invoke-static { v0, p2, v6, v1 }, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 282
    goto :L9
  :L8
  .line 283
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-virtual { v4, v0, v5 }, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;
    move-result-object v0
  :L9
  .line 285
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
    if-eq v4, v1, :L10
    sput-object v3, Lcom/innioasis/ipp/MenuStyle;->scratch:Landroid/graphics/Bitmap;
  :L10
  .line 286
    if-nez v0, :L11
    return-object v3
  :L11
  .line 287
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-direct { v1, p0, v0 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
  .line 288
    sget-object p0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter p0
  :L12
  .line 289
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/graphics/drawable/Drawable;
  .line 290
    if-eqz v0, :L13
    monitor-exit p0
    return-object v0
  :L13
  .line 291
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/MenuStyle;->key(II)Ljava/lang/Long;
    move-result-object p1
    invoke-virtual { p0, p1, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 292
    monitor-exit p0
  .line 293
    return-object v1
  :L14
  .line 292
    move-exception p1
    monitor-exit p0
  :L15
    throw p1
  :L16
  .line 257
    return-object v3
.end method

.method private static dateIcon(Landroid/view/View;)V
  .registers 3
  .line 96
    instance-of v0, p0, Landroid/widget/ImageView;
    if-eqz v0, :L1
    const v0, 2131362086
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 97
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p0, v0, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 98
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast p0, Landroid/widget/ImageView;
    const v1, 2131230954
    invoke-virtual { v0, p0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  .line 99
    return-void
  :L1
  .line 96
    return-void
.end method

.method private static hide(Landroid/view/View;Z)Z
  .registers 4
  .line 145
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 146
    if-eqz p1, :L1
    const/16 p1, 8
    goto :L2
  :L1
    const/4 p1, 0
  :L2
  .line 147
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-ne v1, p1, :L3
    return v0
  :L3
  .line 148
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  .line 149
    const/4 p0, 1
    return p0
.end method

.method private static host(Landroid/view/View;)Landroid/content/Context;
  .registers 3
  .line 194
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 195
    const/4 v0, 0
  :L0
  .line 196
    const/4 v1, 4
    if-ge v0, v1, :L1
    instance-of v1, p0, Landroid/app/Activity;
    if-nez v1, :L1
    instance-of v1, p0, Landroid/content/ContextWrapper;
    if-eqz v1, :L1
  .line 197
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual { p0 }, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p0
  .line 196
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 199
    return-object p0
.end method

.method private static key(II)Ljava/lang/Long;
  .registers 4
  .line 229
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
  .line 297
    if-gtz p2, :L0
    return-void
  :L0
  .line 299
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter v0
  .line 300
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
  .line 301
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
    if-nez v1, :L3
  .line 302
    new-instance v1, Landroid/os/HandlerThread;
    const-string v2, "ipp-preview"
    invoke-direct { v1, v2 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 303
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->start()V
  .line 304
    new-instance v2, Landroid/os/Handler;
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v2, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v2, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
  .line 305
    new-instance v1, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct { v1, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/MenuStyle;->main:Landroid/os/Handler;
  :L3
  .line 307
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->loader:Landroid/os/Handler;
  .line 308
    monitor-exit v0
  :L4
  .line 309
    new-instance v0, Lcom/innioasis/ipp/MenuStyle$Load;
    invoke-direct { v0, p0, p1, p2, p3 }, Lcom/innioasis/ipp/MenuStyle$Load;-><init>(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
    invoke-virtual { v1, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 310
    sget-object p0, Lcom/innioasis/ipp/MenuStyle;->DROP:Ljava/lang/Runnable;
    invoke-virtual { v1, p0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 311
    const-wide/16 p1, 3000
    invoke-virtual { v1, p0, p1, p2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 312
    return-void
  :L5
  .line 308
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
  .line 155
    const-class v0, Lcom/innioasis/y1/activity/MainActivity;
    const-string v1, "selItem"
    const/4 v2, 0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
  .line 156
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Method;->setAccessible(Z)V
  .line 157
    new-array v1, v2, [Ljava/lang/Object;
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 159
    goto :L3
  :L2
  .line 158
    move-exception p0
  :L3
  .line 160
    return-void
.end method

.method private static pad(Landroid/view/View;)V
  .registers 2
  .line 135
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Pad;->list(Landroidx/recyclerview/widget/RecyclerView;)V
  :L0
  .line 136
    return-void
.end method

.method private static panel(Landroid/widget/ImageView;)Z
  .registers 3
  .line 187
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getId()I
    move-result v0
  .line 188
    const v1, 2131362147
    if-eq v0, v1, :L1
    const v1, 2131362323
    if-eq v0, v1, :L1
    const v1, 2131362085
    if-ne v0, v1, :L0
  .line 189
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
  .line 188
    return p0
.end method

.method private static parent(Landroid/view/View;)Landroid/view/View;
  .registers 3
  .line 139
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  :L1
  .line 140
    instance-of v1, p0, Landroid/view/View;
    if-eqz v1, :L2
    move-object v0, p0
    check-cast v0, Landroid/view/View;
  :L2
    return-object v0
.end method

.method private static preloadMain(Landroid/app/Activity;)V
  .registers 6
  .line 386
    sget-boolean v0, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 387
    const v0, 2131362147
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 388
    const v1, 2131362308
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 389
    if-eqz v0, :L7
    instance-of v2, v1, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v2, :L1
    goto :L7
  :L1
  .line 390
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
  .line 391
    instance-of v2, v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-nez v2, :L2
    return-void
  :L2
  .line 392
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->width(Landroid/view/View;)I
    move-result v0
  .line 393
    if-gtz v0, :L3
    return-void
  :L3
  .line 394
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
  .line 395
    check-cast v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object v1
  .line 396
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/MenuStyle;->probeView(Landroid/content/Context;I)Landroid/widget/ImageView;
    move-result-object v0
  .line 397
    const/4 v2, 0
  :L4
    sget-object v3, Lcom/innioasis/ipp/MenuStyle;->MAIN_ROWS:[I
    array-length v4, v3
    if-ge v2, v4, :L6
  .line 398
    aget v3, v3, v2
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-interface { v1, v3 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
  .line 399
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget-object v4, Lcom/innioasis/ipp/MenuStyle;->MAIN_PICS:[I
    aget v4, v4, v2
    invoke-virtual { v3, v0, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->commonSetIcon(Landroid/widget/ImageView;I)V
  :L5
  .line 397
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 404
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    new-instance v1, Landroid/widget/ImageView;
    invoke-direct { v1, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->setSettingMask(Landroid/widget/ImageView;)V
  .line 405
    return-void
  :L7
  .line 389
    return-void
.end method

.method private static probeView(Landroid/content/Context;I)Landroid/widget/ImageView;
  .registers 4
  .line 370
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct { v0, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 371
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;
    const/4 v1, -2
    invoke-direct { p0, p1, v1 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 372
    const p0, 2131362323
    sget-object p1, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
    invoke-virtual { v0, p0, p1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 373
    return-object v0
.end method

.method public static res(Landroid/widget/ImageView;I)V
  .catchall { :L0 .. :L4 } :L13
  .catchall { :L4 .. :L5 } :L9
  .catchall { :L6 .. :L8 } :L13
  .catchall { :L10 .. :L11 } :L9
  .catchall { :L11 .. :L12 } :L13
  .registers 6
  .line 205
    const v0, 2131362323
  :L0
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v0
    sget-object v1, Lcom/innioasis/ipp/MenuStyle;->PROBE:Ljava/lang/Object;
    const/4 v2, 0
    if-ne v0, v1, :L1
  .line 206
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v0, p1, v1, v2 }, Lcom/innioasis/ipp/MenuStyle;->loadLater(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  .line 207
    return-void
  :L1
  .line 209
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->panel(Landroid/widget/ImageView;)Z
    move-result v0
    if-eqz v0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->width(Landroid/view/View;)I
    move-result v0
    goto :L3
  :L2
    const/4 v0, 0
  :L3
  .line 210
    if-lez v0, :L12
  .line 212
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
  .line 213
    const v1, 2131362147
    if-eqz v3, :L7
  :L6
  .line 214
    invoke-virtual { p0, v1, v2 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 215
    invoke-virtual { p0, v3 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 216
    return-void
  :L7
  .line 219
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { p0, v1, v2 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 220
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-static { v1, p1, v0, p0 }, Lcom/innioasis/ipp/MenuStyle;->loadLater(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  :L8
  .line 221
    return-void
  :L9
  .line 212
    move-exception v0
  :L10
    monitor-exit v1
  :L11
    throw v0
  :L12
  .line 224
    goto :L14
  :L13
  .line 223
    move-exception v0
  :L14
  .line 225
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 226
    return-void
.end method

.method public static simple(Landroid/content/Context;)Z
  .registers 2
  .line 55
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

.method public static themeChanged()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 2
  .line 378
    sget-object v0, Lcom/innioasis/ipp/MenuStyle;->PREVIEWS:Ljava/util/HashMap;
    monitor-enter v0
  :L0
  .line 379
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 380
    monitor-exit v0
  :L1
  .line 381
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/MenuStyle;->mainLoaded:Z
  .line 382
    return-void
  :L2
  .line 380
    move-exception v1
  :L3
    monitor-exit v0
  :L4
    throw v1
.end method

.method private static widen(Landroid/view/View;Z)V
  .registers 6
  .line 409
    if-nez p0, :L0
    return-void
  :L0
  .line 410
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 411
    if-nez v0, :L1
    return-void
  :L1
  .line 412
    const v1, 2131362152
    invoke-virtual { p0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v2
  .line 413
    instance-of v3, v2, Ljava/lang/Integer;
    if-nez v3, :L2
  .line 414
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
  .line 415
    invoke-virtual { p0, v1, v2 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  :L2
  .line 417
    if-eqz p1, :L3
    const/4 p1, -1
    goto :L4
  :L3
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  :L4
  .line 418
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-ne v1, p1, :L5
    return-void
  :L5
  .line 419
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 420
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 421
    return-void
.end method

.method private static width(Landroid/view/View;)I
  .registers 6
  .line 234
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result v0
    if-lez v0, :L0
    invoke-virtual { p0 }, Landroid/view/View;->getWidth()I
    move-result p0
    return p0
  :L0
  .line 235
    const/4 v0, 0
    const/4 v1, 0
  :L1
    const/4 v2, 4
    if-ge v1, v2, :L7
    if-eqz p0, :L7
  .line 236
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
  .line 237
    if-eqz v2, :L6
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    const/4 v4, -2
    if-ne v3, v4, :L2
    goto :L6
  :L2
  .line 238
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-lez v3, :L3
    iget p0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I
    return p0
  :L3
  .line 239
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 240
    instance-of v2, p0, Landroid/view/View;
    if-eqz v2, :L4
    check-cast p0, Landroid/view/View;
    goto :L5
  :L4
    const/4 p0, 0
  :L5
  .line 235
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 237
    return v0
  :L7
  .line 242
    return v0
.end method

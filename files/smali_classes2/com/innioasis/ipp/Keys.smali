.class public final Lcom/innioasis/ipp/Keys;
.super Ljava/lang/Object;
.source "Keys.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Keys$Shadowed;
  }
.end annotation

.field private final static BOX_DP:I = 36

.field private final static BOX_SP:F = 24.0F

.field private final static BOX_SP_MIN:F = 12.0F

.field private final static CAPS:I = 2

.field private final static CARET_PX:F = 8.0F

.field private final static CYR:I = 1

.field private final static CYRILLIC:Ljava/lang/String; = "\u0410\u0411\u0412\u0413\u0414\u0415\u0401\u0416\u0417\u0418\u0419\u041a\u041b\u041c\u041d\u041e\u041f\u0420\u0421\u0422\u0423\u0424\u0425\u0426\u0427\u0428\u0429\u042a\u042b\u042c\u042d\u042e\u042f"

.field private final static DOTS:Ljava/lang/String; = "..."

.field private final static KEY_LANG:Ljava/lang/String; = "kb_lang"

.field public final static KEY_SECOND:Ljava/lang/String; = "kb_lang2"

.field private final static LAT:I = 0

.field private final static LATIN:Ljava/lang/String; = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

.field private final static LOWER:I = 0

.field private final static NUM:I = 2

.field private final static RUSSIAN:I = 4

.field private final static SHADOW_DP:I = 3

.field private final static SHADOW_STEP:I = 402653184

.field private final static SHIFT:I = 1

.field private final static SYMBOLS:Ljava/lang/String; = ".,?!'\"-_()0123456789[]@#$%&*+=/:;"

.field private static actRef:Ljava/lang/ref/WeakReference;

.field private static adRef:Ljava/lang/ref/WeakReference;

.field private static arrow:Landroid/graphics/drawable/Drawable;

.field private static boxRef:Ljava/lang/ref/WeakReference;

.field private static lang:I

.field private static listRef:Ljava/lang/ref/WeakReference;

.field private static mode:I

.method static constructor <clinit>()V
  .registers 1
  .line 96
    const/4 v0, 1
    sput v0, Lcom/innioasis/ipp/Keys;->mode:I
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 65
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static adapter()Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .registers 3
  .line 547
    sget-object v0, Lcom/innioasis/ipp/Keys;->adRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 548
    instance-of v2, v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  :L2
    return-object v1
.end method

.method public static alphabet()V
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  .line 323
    sget v0, Lcom/innioasis/ipp/Keys;->lang:I
    const/4 v1, 2
    const/4 v2, 1
    if-nez v0, :L1
    invoke-static { }, Lcom/innioasis/ipp/Keys;->secondOn()Z
    move-result v0
    if-eqz v0, :L0
    const/4 v1, 1
  :L0
    sput v1, Lcom/innioasis/ipp/Keys;->lang:I
    goto :L3
  :L1
  .line 324
    if-ne v0, v2, :L2
    sput v1, Lcom/innioasis/ipp/Keys;->lang:I
    goto :L3
  :L2
  .line 325
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Keys;->lang:I
  :L3
  .line 327
    invoke-static { }, Lcom/innioasis/ipp/Keys;->ctx()Landroid/content/Context;
    move-result-object v0
    const-string v1, "kb_lang"
    sget v3, Lcom/innioasis/ipp/Keys;->lang:I
    invoke-static { v0, v1, v3 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L4
  .line 330
    goto :L6
  :L5
  .line 328
    move-exception v0
  :L6
  .line 333
    invoke-static { v2 }, Lcom/innioasis/ipp/Keys;->apply(Z)V
  .line 334
    sget-object v0, Lcom/innioasis/ipp/Keys;->actRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L7
    move-object v0, v1
    goto :L8
  :L7
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L8
  .line 335
    sget-object v2, Lcom/innioasis/ipp/Keys;->listRef:Ljava/lang/ref/WeakReference;
    if-nez v2, :L9
    goto :L10
  :L9
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L10
  .line 336
    instance-of v2, v0, Landroid/app/Activity;
    if-eqz v2, :L11
    instance-of v2, v1, Landroid/view/View;
    if-eqz v2, :L11
  .line 337
    check-cast v0, Landroid/app/Activity;
    check-cast v1, Landroid/view/View;
    invoke-static { }, Lcom/innioasis/ipp/Keys;->code()Ljava/lang/String;
    move-result-object v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Alpha;->flash(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;)V
  :L11
  .line 339
    return-void
.end method

.method private static apply()V
  .registers 1
  .line 461
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Keys;->apply(Z)V
  .line 462
    return-void
.end method

.method private static apply(Z)V
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  :L0
  .line 466
    invoke-static { }, Lcom/innioasis/ipp/Keys;->adapter()Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object v0
  .line 467
    if-nez v0, :L1
    return-void
  :L1
  .line 468
    invoke-static { }, Lcom/innioasis/ipp/Keys;->table()Ljava/util/List;
    move-result-object v1
  .line 469
    const/4 v2, 0
    if-eqz p0, :L2
    const/4 p0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p0
  :L3
  .line 470
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setItemList(Ljava/util/List;)V
  .line 471
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-lt p0, v3, :L4
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result p0
    add-int/lit8 p0, p0, -1
  :L4
  .line 472
    if-gez p0, :L5
    const/4 p0, 0
  :L5
  .line 473
    invoke-virtual { v0, p0, v2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setSelectPosition(IZ)V
  .line 474
    invoke-static { }, Lcom/innioasis/ipp/Keys;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
  .line 475
    if-eqz v1, :L6
    invoke-static { v1, p0, v0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L6
  .line 476
    invoke-static { }, Lcom/innioasis/ipp/Keys;->markCaps()V
  :L7
  .line 479
    goto :L9
  :L8
  .line 477
    move-exception p0
  :L9
  .line 480
    return-void
.end method

.method private static arrow(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
  .registers 9
  .line 496
    sget-object v0, Lcom/innioasis/ipp/Keys;->arrow:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 497
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 498
    const/high16 v1, 0x41800000
    mul-float v0, v0, v1
    const/high16 v1, 0x3F000000
    add-float/2addr v0, v1
    float-to-int v0, v0
  .line 499
    const/16 v2, 8
    if-ge v0, v2, :L1
    const/16 v0, 8
  :L1
  .line 500
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v0, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 501
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 502
    new-instance v4, Landroid/graphics/Paint;
    const/4 v5, 1
    invoke-direct { v4, v5 }, Landroid/graphics/Paint;-><init>(I)V
  .line 503
    const/high16 v5, 0xFF000000
    invoke-virtual { v4, v5 }, Landroid/graphics/Paint;->setColor(I)V
  .line 504
    int-to-float v0, v0
  .line 505
    nop
  .line 506
    new-instance v5, Landroid/graphics/Path;
    invoke-direct { v5 }, Landroid/graphics/Path;-><init>()V
  .line 507
    mul-float v1, v1, v0
    const v6, 1031127695
    mul-float v6, v6, v0
    invoke-virtual { v5, v1, v6 }, Landroid/graphics/Path;->moveTo(FF)V
  .line 508
    const v6, 1064682127
    mul-float v6, v6, v0
    invoke-virtual { v5, v6, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 509
    const v6, 1060320051
    mul-float v6, v6, v0
    invoke-virtual { v5, v6, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 510
    const v7, 1064346583
    mul-float v7, v7, v0
    invoke-virtual { v5, v6, v7 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 511
    const v6, 1050253722
    mul-float v6, v6, v0
    invoke-virtual { v5, v6, v7 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 512
    invoke-virtual { v5, v6, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 513
    const v6, 1025758986
    mul-float v0, v0, v6
    invoke-virtual { v5, v0, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 514
    invoke-virtual { v5 }, Landroid/graphics/Path;->close()V
  .line 515
    invoke-virtual { v3, v5, v4 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 516
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-direct { v0, p0, v2 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    sput-object v0, Lcom/innioasis/ipp/Keys;->arrow:Landroid/graphics/drawable/Drawable;
  .line 517
    return-object v0
.end method

.method public static attach(Landroid/app/Activity;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/EditText;Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 116
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Keys;->actRef:Ljava/lang/ref/WeakReference;
  .line 117
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Keys;->listRef:Ljava/lang/ref/WeakReference;
  .line 118
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Keys;->boxRef:Ljava/lang/ref/WeakReference;
  .line 119
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p3 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Keys;->adRef:Ljava/lang/ref/WeakReference;
  .line 120
    invoke-static { }, Lcom/innioasis/ipp/Keys;->ctx()Landroid/content/Context;
    move-result-object p0
    const-string p3, "kb_lang"
    const/4 v0, 0
    invoke-static { p0, p3, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Keys;->lang:I
  .line 121
    const/4 p3, 1
    if-ne p0, p3, :L1
    invoke-static { }, Lcom/innioasis/ipp/Keys;->secondOn()Z
    move-result p0
    if-nez p0, :L1
    sput v0, Lcom/innioasis/ipp/Keys;->lang:I
  :L1
  .line 122
    sput p3, Lcom/innioasis/ipp/Keys;->mode:I
  .line 123
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Keys;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/EditText;)V
  .line 124
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  :L2
  .line 127
    goto :L4
  :L3
  .line 125
    move-exception p0
  :L4
  .line 128
    return-void
.end method

.method public static caps()V
  .registers 2
  .line 313
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    const/4 v1, 2
    if-ne v0, v1, :L0
    const/4 v1, 0
  :L0
    sput v1, Lcom/innioasis/ipp/Keys;->mode:I
  .line 314
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  .line 315
    return-void
.end method

.method public static cell(Landroid/widget/TextView;Z)V
  .catchall { :L1 .. :L9 } :L10
  .registers 5
  .line 252
    if-nez p0, :L0
    return-void
  :L0
  .line 254
    const/4 v0, 0
    if-eqz p1, :L2
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Icons;->menuBackground()I
    move-result v1
    const/high16 v2, 0xFF000000
    or-int/2addr v1, v2
    goto :L3
  :L2
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->menuText(Z)I
    move-result v1
  :L3
    invoke-virtual { p0, v1 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 255
    if-eqz p1, :L4
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;
    goto :L5
  :L4
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;
  :L5
    invoke-virtual { p0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 256
    if-eqz p1, :L8
  .line 257
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { p1 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 258
    invoke-static { }, Lcom/innioasis/ipp/Theme;->menuSelectedColor()I
    move-result v1
  .line 259
    if-eqz v1, :L6
    goto :L7
  :L6
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->menuText(Z)I
    move-result v1
  :L7
    invoke-virtual { p1, v1 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 260
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
    const/high16 v1, 0x40A00000
    mul-float v0, v0, v1
    invoke-virtual { p1, v0 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 261
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 262
    goto :L9
  :L8
  .line 263
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L9
  .line 267
    goto :L11
  :L10
  .line 265
    move-exception p0
  :L11
  .line 268
    return-void
.end method

.method private static code()Ljava/lang/String;
  .registers 2
  .line 343
    sget v0, Lcom/innioasis/ipp/Keys;->lang:I
    const/4 v1, 1
    if-ne v0, v1, :L0
    const-string v0, "RU"
    return-object v0
  :L0
  .line 344
    const/4 v1, 2
    if-ne v0, v1, :L1
    const-string v0, "123"
    return-object v0
  :L1
  .line 345
    const-string v0, "EN"
    return-object v0
.end method

.method private static countFit(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 416
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    const/16 v1, 18
    if-gt v0, v1, :L0
    goto :L1
  :L0
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "..."
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    add-int/lit8 v1, v1, -16
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method private static ctx()Landroid/content/Context;
  .registers 1
  .line 557
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    return-object v0
.end method

.method public static defaultSecond()I
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 538
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getLanguage()I
    move-result v1
  :L1
    const/4 v2, 4
    if-ne v1, v2, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 539
    move-exception v1
  .line 540
    return v0
.end method

.method public static fit(Landroid/widget/EditText;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L12 } :L1
  .registers 10
  .line 383
    const-string v0, "..."
    if-nez p1, :L2
  :L0
    const-string p0, ""
    return-object p0
  :L1
  .line 405
    move-exception p0
    goto/16 :L13
  :L2
  .line 384
    if-nez p0, :L3
    invoke-static { p1 }, Lcom/innioasis/ipp/Keys;->countFit(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L3
  .line 385
    invoke-virtual { p0 }, Landroid/widget/EditText;->getWidth()I
    move-result v1
    invoke-virtual { p0 }, Landroid/widget/EditText;->getPaddingLeft()I
    move-result v2
    sub-int/2addr v1, v2
    invoke-virtual { p0 }, Landroid/widget/EditText;->getPaddingRight()I
    move-result v2
    sub-int/2addr v1, v2
    int-to-float v1, v1
    const/high16 v2, 0x41000000
    sub-float/2addr v1, v2
  .line 386
    invoke-virtual { p0 }, Landroid/widget/EditText;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    move-result-object v2
  .line 387
    if-eqz v2, :L4
    array-length v3, v2
    const/4 v4, 2
    if-le v3, v4, :L4
    aget-object v2, v2, v4
    if-eqz v2, :L4
  .line 388
    invoke-virtual { v2 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v2
    invoke-virtual { p0 }, Landroid/widget/EditText;->getCompoundDrawablePadding()I
    move-result v3
    add-int/2addr v2, v3
    int-to-float v2, v2
    sub-float/2addr v1, v2
  :L4
  .line 390
    const/4 v2, 0
    cmpg-float v2, v1, v2
    if-gtz v2, :L5
    invoke-static { p1 }, Lcom/innioasis/ipp/Keys;->countFit(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L5
  .line 391
    invoke-virtual { p0 }, Landroid/widget/EditText;->getPaint()Landroid/text/TextPaint;
    move-result-object p0
  .line 392
    if-nez p0, :L6
    invoke-static { p1 }, Lcom/innioasis/ipp/Keys;->countFit(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L6
  .line 393
    invoke-virtual { p0, p1 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v2
    cmpg-float v2, v2, v1
    if-gtz v2, :L7
    return-object p1
  :L7
  .line 395
    invoke-virtual { p0, v0 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v2
  .line 396
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v3
  .line 397
    nop
  .line 399
    const/4 v4, 0
    move v5, v3
  :L8
    const/4 v6, 1
    if-lez v5, :L10
  .line 400
    add-int/lit8 v7, v5, -1
    invoke-virtual { p0, p1, v7, v3 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F
    move-result v7
    add-float/2addr v7, v2
    cmpl-float v7, v7, v1
    if-lez v7, :L9
    goto :L10
  :L9
  .line 401
    sub-int v4, v3, v5
    add-int/2addr v4, v6
  .line 399
    add-int/lit8 v5, v5, -1
    goto :L8
  :L10
  .line 403
    if-ge v4, v6, :L11
    const/4 v4, 1
  :L11
  .line 404
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sub-int/2addr v3, v4
    invoke-virtual { p1, v3 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L12
    return-object p0
  :L13
  .line 406
    return-object p1
.end method

.method private static fitHeight(Landroid/widget/EditText;F)V
  .registers 8
  .line 206
    invoke-virtual { p0 }, Landroid/widget/EditText;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
  .line 207
    const/high16 v1, 0x42100000
    mul-float p1, p1, v1
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    const/4 v1, 2
    sub-int/2addr p1, v1
  .line 208
    new-instance v2, Landroid/text/TextPaint;
    invoke-virtual { p0 }, Landroid/widget/EditText;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    invoke-direct { v2, v3 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 209
    const/high16 v3, 0x41C00000
  :L0
  .line 210
    const/high16 v4, 0x41400000
    cmpl-float v4, v3, v4
    if-lez v4, :L2
  .line 211
    invoke-static { v1, v3, v0 }, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F
    move-result v4
    invoke-virtual { v2, v4 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 213
    invoke-virtual { v2 }, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;
    move-result-object v4
  .line 214
    iget v5, v4, Landroid/graphics/Paint$FontMetricsInt;->bottom:I
    iget v4, v4, Landroid/graphics/Paint$FontMetricsInt;->top:I
    sub-int/2addr v5, v4
    if-gt v5, p1, :L1
    goto :L2
  :L1
  .line 215
    const/high16 v4, 0x3F800000
    sub-float/2addr v3, v4
  .line 216
    goto :L0
  :L2
  .line 217
    invoke-virtual { p0, v1, v3 }, Landroid/widget/EditText;->setTextSize(IF)V
  .line 218
    return-void
.end method

.method public static frame(Landroid/app/Dialog;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 232
    if-nez p0, :L0
    return-void
  :L0
  .line 234
    invoke-virtual { p0 }, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object v0
  .line 235
    if-nez v0, :L1
    return-void
  :L1
  .line 236
    invoke-virtual { p0 }, Landroid/app/Dialog;->getContext()Landroid/content/Context;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F
    const/high16 v1, 0x40400000
    mul-float p0, p0, v1
    invoke-static { p0 }, Ljava/lang/Math;->round(F)I
    move-result p0
  .line 237
    invoke-virtual { v0 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v1
  .line 238
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I
    if-lez v2, :L2
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I
    mul-int/lit8 v3, p0, 2
    add-int/2addr v2, v3
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I
  :L2
  .line 239
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->y:I
    sub-int/2addr v2, p0
    const/4 p0, 0
    invoke-static { p0, v2 }, Ljava/lang/Math;->max(II)I
    move-result p0
    iput p0, v1, Landroid/view/WindowManager$LayoutParams;->y:I
  .line 240
    invoke-virtual { v0, v1 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  :L3
  .line 243
    goto :L5
  :L4
  .line 241
    move-exception p0
  :L5
  .line 244
    return-void
.end method

.method public static hold(I)I
  .catchall { :L0 .. :L1 } :L4
  .registers 3
  :L0
  .line 297
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 298
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v1
    if-eq p0, v1, :L3
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_PLAY()I
    move-result v0
  :L1
    if-ne p0, v0, :L2
    goto :L3
  :L2
  .line 301
    goto :L5
  :L3
  .line 298
    const/4 p0, 1
    return p0
  :L4
  .line 299
    move-exception p0
  :L5
  .line 302
    const/4 p0, 6
    return p0
.end method

.method private static list()Landroidx/recyclerview/widget/RecyclerView;
  .registers 3
  .line 552
    sget-object v0, Lcom/innioasis/ipp/Keys;->listRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 553
    instance-of v2, v0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  :L2
    return-object v1
.end method

.method private static markCaps()V
  .registers 4
  .line 489
    sget-object v0, Lcom/innioasis/ipp/Keys;->boxRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 490
    instance-of v2, v0, Landroid/widget/EditText;
    if-nez v2, :L2
    return-void
  :L2
  .line 491
    check-cast v0, Landroid/widget/EditText;
  .line 492
    sget v2, Lcom/innioasis/ipp/Keys;->mode:I
    const/4 v3, 2
    if-ne v2, v3, :L3
    invoke-static { v0 }, Lcom/innioasis/ipp/Keys;->arrow(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    move-result-object v2
    goto :L4
  :L3
    move-object v2, v1
  :L4
    invoke-virtual { v0, v1, v1, v2, v1 }, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
  .line 493
    return-void
.end method

.method public static next()V
  .registers 1
  .line 429
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Keys;->step(I)V
  .line 430
    return-void
.end method

.method private static paint(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/EditText;)V
  .registers 9
  .line 162
    invoke-virtual { p1 }, Landroid/widget/EditText;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 163
    const/high16 v1, 0x40400000
    mul-float v1, v1, v0
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
  .line 164
    invoke-virtual { p1 }, Landroid/widget/EditText;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    check-cast v2, Landroid/view/View;
  .line 165
    invoke-static { }, Lcom/innioasis/ipp/Icons;->menuBackground()I
    move-result v3
    const/high16 v4, 0x41000000
    mul-float v4, v4, v0
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    invoke-static { v3, v4, v1 }, Lcom/innioasis/ipp/Keys;->shadowed(III)Lcom/innioasis/ipp/Keys$Shadowed;
    move-result-object v3
    invoke-virtual { v2, v3 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 166
    invoke-virtual { v2, v1, v1, v1, v1 }, Landroid/view/View;->setPadding(IIII)V
  .line 167
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Keys;->fitHeight(Landroid/widget/EditText;F)V
  .line 169
    invoke-virtual { p1 }, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    instance-of v2, v2, Lcom/innioasis/ipp/Keys$Shadowed;
    if-eqz v2, :L0
    return-void
  :L0
  .line 170
    invoke-virtual { p1 }, Landroid/widget/EditText;->getPaddingLeft()I
    move-result v2
  .line 171
    invoke-virtual { p1 }, Landroid/widget/EditText;->getPaddingTop()I
    move-result v3
  .line 172
    invoke-virtual { p1 }, Landroid/widget/EditText;->getPaddingRight()I
    move-result v4
  .line 173
    invoke-virtual { p1 }, Landroid/widget/EditText;->getPaddingBottom()I
    move-result v5
  .line 174
    const/high16 v6, 0x40A00000
    mul-float v0, v0, v6
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
    const/4 v6, -1
    invoke-static { v6, v0, v1 }, Lcom/innioasis/ipp/Keys;->shadowed(III)Lcom/innioasis/ipp/Keys$Shadowed;
    move-result-object v0
    invoke-virtual { p1, v0 }, Landroid/widget/EditText;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 175
    add-int/2addr v2, v1
    add-int/2addr v3, v1
    add-int/2addr v4, v1
    add-int/2addr v5, v1
    invoke-virtual { p1, v2, v3, v4, v5 }, Landroid/widget/EditText;->setPadding(IIII)V
  .line 177
    invoke-virtual { p1 }, Landroid/widget/EditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 178
    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v2, :L2
  .line 179
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 180
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-lez v2, :L1
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    mul-int/lit8 v3, v1, 2
    add-int/2addr v2, v3
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
  :L1
  .line 181
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    sub-int/2addr v2, v1
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 182
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    sub-int/2addr v2, v1
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
  .line 183
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr v2, v1
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 184
    invoke-virtual { p1, v0 }, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L2
  .line 186
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
  .line 187
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v0, :L3
  .line 188
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 189
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr v0, v1
    const/4 v1, 0
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 190
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L3
  .line 192
    return-void
.end method

.method public static prev()V
  .registers 1
  .line 433
    const/4 v0, -1
    invoke-static { v0 }, Lcom/innioasis/ipp/Keys;->step(I)V
  .line 434
    return-void
.end method

.method public static secondOn()Z
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 525
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Keys;->ctx()Landroid/content/Context;
    move-result-object v1
    const-string v2, "kb_lang2"
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v1
  :L1
    const/4 v2, 1
    if-ne v1, v2, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 526
    move-exception v1
  .line 527
    return v0
.end method

.method private static shadowed(III)Lcom/innioasis/ipp/Keys$Shadowed;
  .registers 12
  .line 140
    add-int/lit8 v0, p2, 1
    new-array v0, v0, [Landroid/graphics/drawable/Drawable;
  .line 141
    const/4 v1, 0
    const/4 v2, 0
  :L0
    if-ge v2, p2, :L1
  .line 142
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v3 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 143
    const/high16 v4, 0x18000000
    invoke-virtual { v3, v4 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 144
    add-int v4, p1, p2
    sub-int/2addr v4, v2
    int-to-float v4, v4
    invoke-virtual { v3, v4 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 145
    aput-object v3, v0, v2
  .line 141
    add-int/lit8 v2, v2, 1
    goto :L0
  :L1
  .line 147
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v2 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 148
    invoke-virtual { v2, p0 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 149
    int-to-float p0, p1
    invoke-virtual { v2, p0 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 150
    aput-object v2, v0, p2
  .line 151
    new-instance p0, Lcom/innioasis/ipp/Keys$Shadowed;
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Keys$Shadowed;-><init>([Landroid/graphics/drawable/Drawable;)V
  .line 152
    nop
  :L2
    if-gt v1, p2, :L3
    move-object v3, p0
    move v4, v1
    move v5, v1
    move v6, v1
    move v7, v1
    move v8, v1
    invoke-virtual/range { v3 .. v8 }, Lcom/innioasis/ipp/Keys$Shadowed;->setLayerInset(IIIII)V
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 153
    return-object p0
.end method

.method public static shift()V
  .registers 1
  .line 307
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    if-nez v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    sput v0, Lcom/innioasis/ipp/Keys;->mode:I
  .line 308
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  .line 309
    return-void
.end method

.method private static step(I)V
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  :L0
  .line 438
    invoke-static { }, Lcom/innioasis/ipp/Keys;->adapter()Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object v0
  .line 439
    invoke-static { }, Lcom/innioasis/ipp/Keys;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
  .line 440
    if-eqz v0, :L6
    if-nez v1, :L1
    goto :L6
  :L1
  .line 441
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemCount()I
    move-result v2
  .line 442
    if-gtz v2, :L2
    return-void
  :L2
  .line 443
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result v3
    add-int/2addr v3, p0
  .line 444
    const/4 p0, 0
    if-gez v3, :L3
    const/4 v3, 0
  :L3
  .line 445
    if-lt v3, v2, :L4
    add-int/lit8 v3, v2, -1
  :L4
  .line 446
    invoke-virtual { v0, v3, p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setSelectPosition(IZ)V
  .line 447
    invoke-static { v1, v3, v0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L5
  .line 450
    goto :L8
  :L6
  .line 440
    return-void
  :L7
  .line 448
    move-exception p0
  :L8
  .line 451
    return-void
.end method

.method public static table()Ljava/util/List;
  .registers 5
  .line 276
    sget v0, Lcom/innioasis/ipp/Keys;->lang:I
    const/4 v1, 1
    if-ne v0, v1, :L0
    const-string v0, "\u0410\u0411\u0412\u0413\u0414\u0415\u0401\u0416\u0417\u0418\u0419\u041a\u041b\u041c\u041d\u041e\u041f\u0420\u0421\u0422\u0423\u0424\u0425\u0426\u0427\u0428\u0429\u042a\u042b\u042c\u042d\u042e\u042f"
    goto :L2
  :L0
    const/4 v2, 2
    if-ne v0, v2, :L1
    const-string v0, ".,?!'\"-_()0123456789[]@#$%&*+=/:;"
    goto :L2
  :L1
    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  :L2
  .line 277
    sget v2, Lcom/innioasis/ipp/Keys;->mode:I
    const/4 v3, 0
    if-eqz v2, :L3
    goto :L4
  :L3
    const/4 v1, 0
  :L4
  .line 278
    new-instance v2, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v4
    invoke-direct { v2, v4 }, Ljava/util/ArrayList;-><init>(I)V
  .line 279
    nop
  :L5
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v4
    if-ge v3, v4, :L8
  .line 280
    invoke-virtual { v0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result v4
  .line 281
    if-eqz v1, :L6
    goto :L7
  :L6
    invoke-static { v4 }, Ljava/lang/Character;->toLowerCase(C)C
    move-result v4
  :L7
    invoke-static { v4 }, Ljava/lang/String;->valueOf(C)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 279
    add-int/lit8 v3, v3, 1
    goto :L5
  :L8
  .line 283
    return-object v2
.end method

.method public static value(Ljava/lang/String;)V
  .registers 3
  .line 353
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    const/4 v1, 2
    if-ne v0, v1, :L0
    return-void
  :L0
  .line 354
    if-eqz p0, :L2
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    if-nez p0, :L1
    goto :L2
  :L1
    const/4 p0, 0
    goto :L3
  :L2
    const/4 p0, 1
  :L3
  .line 355
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    if-ne p0, v0, :L4
    return-void
  :L4
  .line 356
    sput p0, Lcom/innioasis/ipp/Keys;->mode:I
  .line 359
    sget p0, Lcom/innioasis/ipp/Keys;->lang:I
    if-eq p0, v1, :L5
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  :L5
  .line 360
    return-void
.end method

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

.field private final static SYMBOLS:Ljava/lang/String; = ".,?!'\"-_()0123456789[]@#$%&*+=/\\:;"

.field private static actRef:Ljava/lang/ref/WeakReference;

.field private static adRef:Ljava/lang/ref/WeakReference;

.field private static arrow:Landroid/graphics/drawable/Drawable;

.field private static boxRef:Ljava/lang/ref/WeakReference;

.field private static lang:I

.field private static listRef:Ljava/lang/ref/WeakReference;

.field private static mode:I

.method static constructor <clinit>()V
  .registers 1
  .line 70
    const/4 v0, 1
    sput v0, Lcom/innioasis/ipp/Keys;->mode:I
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 45
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static adapter()Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .registers 3
  .line 431
    sget-object v0, Lcom/innioasis/ipp/Keys;->adRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 432
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
  .line 260
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
  .line 261
    if-ne v0, v2, :L2
    sput v1, Lcom/innioasis/ipp/Keys;->lang:I
    goto :L3
  :L2
  .line 262
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Keys;->lang:I
  :L3
  .line 264
    invoke-static { }, Lcom/innioasis/ipp/Keys;->ctx()Landroid/content/Context;
    move-result-object v0
    const-string v1, "kb_lang"
    sget v3, Lcom/innioasis/ipp/Keys;->lang:I
    invoke-static { v0, v1, v3 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L4
  .line 266
    goto :L6
  :L5
  .line 265
    move-exception v0
  :L6
  .line 268
    invoke-static { v2 }, Lcom/innioasis/ipp/Keys;->apply(Z)V
  .line 269
    sget-object v0, Lcom/innioasis/ipp/Keys;->actRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L7
    move-object v0, v1
    goto :L8
  :L7
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L8
  .line 270
    sget-object v2, Lcom/innioasis/ipp/Keys;->listRef:Ljava/lang/ref/WeakReference;
    if-nez v2, :L9
    goto :L10
  :L9
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L10
  .line 271
    instance-of v2, v0, Landroid/app/Activity;
    if-eqz v2, :L11
    instance-of v2, v1, Landroid/view/View;
    if-eqz v2, :L11
  .line 272
    check-cast v0, Landroid/app/Activity;
    check-cast v1, Landroid/view/View;
    invoke-static { }, Lcom/innioasis/ipp/Keys;->code()Ljava/lang/String;
    move-result-object v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Alpha;->flash(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;)V
  :L11
  .line 274
    return-void
.end method

.method private static apply()V
  .registers 1
  .line 360
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Keys;->apply(Z)V
  .line 361
    return-void
.end method

.method private static apply(Z)V
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  :L0
  .line 365
    invoke-static { }, Lcom/innioasis/ipp/Keys;->adapter()Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object v0
  .line 366
    if-nez v0, :L1
    return-void
  :L1
  .line 367
    invoke-static { }, Lcom/innioasis/ipp/Keys;->table()Ljava/util/List;
    move-result-object v1
  .line 368
    const/4 v2, 0
    if-eqz p0, :L2
    const/4 p0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p0
  :L3
  .line 369
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setItemList(Ljava/util/List;)V
  .line 370
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-lt p0, v3, :L4
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result p0
    add-int/lit8 p0, p0, -1
  :L4
  .line 371
    if-gez p0, :L5
    const/4 p0, 0
  :L5
  .line 372
    invoke-virtual { v0, p0, v2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setSelectPosition(IZ)V
  .line 373
    invoke-static { }, Lcom/innioasis/ipp/Keys;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
  .line 374
    if-eqz v1, :L6
    invoke-static { v1, p0, v0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L6
  .line 375
    invoke-static { }, Lcom/innioasis/ipp/Keys;->markCaps()V
  :L7
  .line 377
    goto :L9
  :L8
  .line 376
    move-exception p0
  :L9
  .line 378
    return-void
.end method

.method private static arrow(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
  .registers 9
  .line 389
    sget-object v0, Lcom/innioasis/ipp/Keys;->arrow:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 390
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 391
    const/high16 v1, 0x41800000
    mul-float v0, v0, v1
    const/high16 v1, 0x3F000000
    add-float/2addr v0, v1
    float-to-int v0, v0
  .line 392
    const/16 v2, 8
    if-ge v0, v2, :L1
    const/16 v0, 8
  :L1
  .line 393
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v0, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 394
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 395
    new-instance v4, Landroid/graphics/Paint;
    const/4 v5, 1
    invoke-direct { v4, v5 }, Landroid/graphics/Paint;-><init>(I)V
  .line 396
    const/high16 v5, 0xFF000000
    invoke-virtual { v4, v5 }, Landroid/graphics/Paint;->setColor(I)V
  .line 397
    int-to-float v0, v0
  .line 398
    nop
  .line 399
    new-instance v5, Landroid/graphics/Path;
    invoke-direct { v5 }, Landroid/graphics/Path;-><init>()V
  .line 400
    mul-float v1, v1, v0
    const v6, 1031127695
    mul-float v6, v6, v0
    invoke-virtual { v5, v1, v6 }, Landroid/graphics/Path;->moveTo(FF)V
  .line 401
    const v6, 1064682127
    mul-float v6, v6, v0
    invoke-virtual { v5, v6, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 402
    const v6, 1060320051
    mul-float v6, v6, v0
    invoke-virtual { v5, v6, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 403
    const v7, 1064346583
    mul-float v7, v7, v0
    invoke-virtual { v5, v6, v7 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 404
    const v6, 1050253722
    mul-float v6, v6, v0
    invoke-virtual { v5, v6, v7 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 405
    invoke-virtual { v5, v6, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 406
    const v6, 1025758986
    mul-float v0, v0, v6
    invoke-virtual { v5, v0, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 407
    invoke-virtual { v5 }, Landroid/graphics/Path;->close()V
  .line 408
    invoke-virtual { v3, v5, v4 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 409
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-direct { v0, p0, v2 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    sput-object v0, Lcom/innioasis/ipp/Keys;->arrow:Landroid/graphics/drawable/Drawable;
  .line 410
    return-object v0
.end method

.method public static attach(Landroid/app/Activity;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/EditText;Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 86
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Keys;->actRef:Ljava/lang/ref/WeakReference;
  .line 87
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Keys;->listRef:Ljava/lang/ref/WeakReference;
  .line 88
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Keys;->boxRef:Ljava/lang/ref/WeakReference;
  .line 89
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p3 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Keys;->adRef:Ljava/lang/ref/WeakReference;
  .line 90
    invoke-static { }, Lcom/innioasis/ipp/Keys;->ctx()Landroid/content/Context;
    move-result-object p0
    const-string p3, "kb_lang"
    const/4 v0, 0
    invoke-static { p0, p3, v0 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Keys;->lang:I
  .line 91
    const/4 p3, 1
    if-ne p0, p3, :L1
    invoke-static { }, Lcom/innioasis/ipp/Keys;->secondOn()Z
    move-result p0
    if-nez p0, :L1
    sput v0, Lcom/innioasis/ipp/Keys;->lang:I
  :L1
  .line 92
    sput p3, Lcom/innioasis/ipp/Keys;->mode:I
  .line 93
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Keys;->paint(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/EditText;)V
  .line 94
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  :L2
  .line 96
    goto :L4
  :L3
  .line 95
    move-exception p0
  :L4
  .line 97
    return-void
.end method

.method public static caps()V
  .registers 2
  .line 255
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    const/4 v1, 2
    if-ne v0, v1, :L0
    const/4 v1, 0
  :L0
    sput v1, Lcom/innioasis/ipp/Keys;->mode:I
  .line 256
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  .line 257
    return-void
.end method

.method public static cell(Landroid/widget/TextView;Z)V
  .catchall { :L1 .. :L9 } :L10
  .registers 5
  .line 206
    if-nez p0, :L0
    return-void
  :L0
  .line 208
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
  .line 209
    if-eqz p1, :L4
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;
    goto :L5
  :L4
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;
  :L5
    invoke-virtual { p0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 210
    if-eqz p1, :L8
  .line 211
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { p1 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 212
    invoke-static { }, Lcom/innioasis/ipp/Theme;->menuSelectedColor()I
    move-result v1
  .line 213
    if-eqz v1, :L6
    goto :L7
  :L6
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->menuText(Z)I
    move-result v1
  :L7
    invoke-virtual { p1, v1 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 214
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
    const/high16 v1, 0x40A00000
    mul-float v0, v0, v1
    invoke-virtual { p1, v0 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 215
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 216
    goto :L9
  :L8
  .line 217
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L9
  .line 220
    goto :L11
  :L10
  .line 219
    move-exception p0
  :L11
  .line 221
    return-void
.end method

.method private static code()Ljava/lang/String;
  .registers 2
  .line 277
    sget v0, Lcom/innioasis/ipp/Keys;->lang:I
    const/4 v1, 1
    if-ne v0, v1, :L0
    const-string v0, "RU"
    return-object v0
  :L0
  .line 278
    const/4 v1, 2
    if-ne v0, v1, :L1
    const-string v0, "123"
    return-object v0
  :L1
  .line 279
    const-string v0, "EN"
    return-object v0
.end method

.method private static countFit(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 329
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
  .line 441
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    return-object v0
.end method

.method public static defaultSecond()I
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 424
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
  .line 425
    move-exception v1
  .line 426
    return v0
.end method

.method public static fit(Landroid/widget/EditText;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L12 } :L1
  .registers 10
  .line 298
    const-string v0, "..."
    if-nez p1, :L2
  :L0
    const-string p0, ""
    return-object p0
  :L1
  .line 319
    move-exception p0
    goto/16 :L13
  :L2
  .line 299
    if-nez p0, :L3
    invoke-static { p1 }, Lcom/innioasis/ipp/Keys;->countFit(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L3
  .line 300
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
  .line 301
    invoke-virtual { p0 }, Landroid/widget/EditText;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    move-result-object v2
  .line 302
    if-eqz v2, :L4
    array-length v3, v2
    const/4 v4, 2
    if-le v3, v4, :L4
    aget-object v2, v2, v4
    if-eqz v2, :L4
  .line 303
    invoke-virtual { v2 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v2
    invoke-virtual { p0 }, Landroid/widget/EditText;->getCompoundDrawablePadding()I
    move-result v3
    add-int/2addr v2, v3
    int-to-float v2, v2
    sub-float/2addr v1, v2
  :L4
  .line 305
    const/4 v2, 0
    cmpg-float v2, v1, v2
    if-gtz v2, :L5
    invoke-static { p1 }, Lcom/innioasis/ipp/Keys;->countFit(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L5
  .line 306
    invoke-virtual { p0 }, Landroid/widget/EditText;->getPaint()Landroid/text/TextPaint;
    move-result-object p0
  .line 307
    if-nez p0, :L6
    invoke-static { p1 }, Lcom/innioasis/ipp/Keys;->countFit(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L6
  .line 308
    invoke-virtual { p0, p1 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v2
    cmpg-float v2, v2, v1
    if-gtz v2, :L7
    return-object p1
  :L7
  .line 310
    invoke-virtual { p0, v0 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v2
  .line 311
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v3
  .line 312
    nop
  .line 313
    const/4 v4, 0
    move v5, v3
  :L8
    const/4 v6, 1
    if-lez v5, :L10
  .line 314
    add-int/lit8 v7, v5, -1
    invoke-virtual { p0, p1, v7, v3 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F
    move-result v7
    add-float/2addr v7, v2
    cmpl-float v7, v7, v1
    if-lez v7, :L9
    goto :L10
  :L9
  .line 315
    sub-int v4, v3, v5
    add-int/2addr v4, v6
  .line 313
    add-int/lit8 v5, v5, -1
    goto :L8
  :L10
  .line 317
    if-ge v4, v6, :L11
    const/4 v4, 1
  :L11
  .line 318
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
  .line 320
    return-object p1
.end method

.method private static fitHeight(Landroid/widget/EditText;F)V
  .registers 8
  .line 165
    invoke-virtual { p0 }, Landroid/widget/EditText;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
  .line 166
    const/high16 v1, 0x42100000
    mul-float p1, p1, v1
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
    const/4 v1, 2
    sub-int/2addr p1, v1
  .line 167
    new-instance v2, Landroid/text/TextPaint;
    invoke-virtual { p0 }, Landroid/widget/EditText;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    invoke-direct { v2, v3 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 168
    const/high16 v3, 0x41C00000
  :L0
  .line 169
    const/high16 v4, 0x41400000
    cmpl-float v4, v3, v4
    if-lez v4, :L2
  .line 170
    invoke-static { v1, v3, v0 }, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F
    move-result v4
    invoke-virtual { v2, v4 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 172
    invoke-virtual { v2 }, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;
    move-result-object v4
  .line 173
    iget v5, v4, Landroid/graphics/Paint$FontMetricsInt;->bottom:I
    iget v4, v4, Landroid/graphics/Paint$FontMetricsInt;->top:I
    sub-int/2addr v5, v4
    if-gt v5, p1, :L1
    goto :L2
  :L1
  .line 174
    const/high16 v4, 0x3F800000
    sub-float/2addr v3, v4
  .line 175
    goto :L0
  :L2
  .line 176
    invoke-virtual { p0, v1, v3 }, Landroid/widget/EditText;->setTextSize(IF)V
  .line 177
    return-void
.end method

.method public static frame(Landroid/app/Dialog;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 188
    if-nez p0, :L0
    return-void
  :L0
  .line 190
    invoke-virtual { p0 }, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object v0
  .line 191
    if-nez v0, :L1
    return-void
  :L1
  .line 192
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
  .line 193
    invoke-virtual { v0 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v1
  .line 194
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I
    if-lez v2, :L2
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I
    mul-int/lit8 v3, p0, 2
    add-int/2addr v2, v3
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I
  :L2
  .line 195
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->y:I
    sub-int/2addr v2, p0
    const/4 p0, 0
    invoke-static { p0, v2 }, Ljava/lang/Math;->max(II)I
    move-result p0
    iput p0, v1, Landroid/view/WindowManager$LayoutParams;->y:I
  .line 196
    invoke-virtual { v0, v1 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  :L3
  .line 198
    goto :L5
  :L4
  .line 197
    move-exception p0
  :L5
  .line 199
    return-void
.end method

.method public static hold(I)I
  .catchall { :L0 .. :L1 } :L4
  .registers 3
  :L0
  .line 241
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 242
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v1
    if-eq p0, v1, :L3
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_PLAY()I
    move-result v0
  :L1
    if-ne p0, v0, :L2
    goto :L3
  :L2
  .line 244
    goto :L5
  :L3
  .line 242
    const/4 p0, 1
    return p0
  :L4
  .line 243
    move-exception p0
  :L5
  .line 245
    const/4 p0, 6
    return p0
.end method

.method private static list()Landroidx/recyclerview/widget/RecyclerView;
  .registers 3
  .line 436
    sget-object v0, Lcom/innioasis/ipp/Keys;->listRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 437
    instance-of v2, v0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  :L2
    return-object v1
.end method

.method private static markCaps()V
  .registers 4
  .line 382
    sget-object v0, Lcom/innioasis/ipp/Keys;->boxRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 383
    instance-of v2, v0, Landroid/widget/EditText;
    if-nez v2, :L2
    return-void
  :L2
  .line 384
    check-cast v0, Landroid/widget/EditText;
  .line 385
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
  .line 386
    return-void
.end method

.method public static next()V
  .registers 1
  .line 334
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Keys;->step(I)V
  .line 335
    return-void
.end method

.method private static paint(Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/EditText;)V
  .registers 9
  .line 126
    invoke-virtual { p1 }, Landroid/widget/EditText;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 127
    const/high16 v1, 0x40400000
    mul-float v1, v1, v0
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v1
  .line 128
    invoke-virtual { p1 }, Landroid/widget/EditText;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    check-cast v2, Landroid/view/View;
  .line 129
    invoke-static { }, Lcom/innioasis/ipp/Icons;->menuBackground()I
    move-result v3
    const/high16 v4, 0x41000000
    mul-float v4, v4, v0
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result v4
    invoke-static { v3, v4, v1 }, Lcom/innioasis/ipp/Keys;->shadowed(III)Lcom/innioasis/ipp/Keys$Shadowed;
    move-result-object v3
    invoke-virtual { v2, v3 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 130
    invoke-virtual { v2, v1, v1, v1, v1 }, Landroid/view/View;->setPadding(IIII)V
  .line 131
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Keys;->fitHeight(Landroid/widget/EditText;F)V
  .line 133
    invoke-virtual { p1 }, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    instance-of v2, v2, Lcom/innioasis/ipp/Keys$Shadowed;
    if-eqz v2, :L0
    return-void
  :L0
  .line 134
    invoke-virtual { p1 }, Landroid/widget/EditText;->getPaddingLeft()I
    move-result v2
  .line 135
    invoke-virtual { p1 }, Landroid/widget/EditText;->getPaddingTop()I
    move-result v3
  .line 136
    invoke-virtual { p1 }, Landroid/widget/EditText;->getPaddingRight()I
    move-result v4
  .line 137
    invoke-virtual { p1 }, Landroid/widget/EditText;->getPaddingBottom()I
    move-result v5
  .line 138
    const/high16 v6, 0x40A00000
    mul-float v0, v0, v6
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
    const/4 v6, -1
    invoke-static { v6, v0, v1 }, Lcom/innioasis/ipp/Keys;->shadowed(III)Lcom/innioasis/ipp/Keys$Shadowed;
    move-result-object v0
    invoke-virtual { p1, v0 }, Landroid/widget/EditText;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 139
    add-int/2addr v2, v1
    add-int/2addr v3, v1
    add-int/2addr v4, v1
    add-int/2addr v5, v1
    invoke-virtual { p1, v2, v3, v4, v5 }, Landroid/widget/EditText;->setPadding(IIII)V
  .line 141
    invoke-virtual { p1 }, Landroid/widget/EditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 142
    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v2, :L2
  .line 143
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 144
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-lez v2, :L1
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    mul-int/lit8 v3, v1, 2
    add-int/2addr v2, v3
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
  :L1
  .line 145
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    sub-int/2addr v2, v1
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 146
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    sub-int/2addr v2, v1
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
  .line 147
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr v2, v1
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 148
    invoke-virtual { p1, v0 }, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L2
  .line 150
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
  .line 151
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v0, :L3
  .line 152
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 153
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr v0, v1
    const/4 v1, 0
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 154
    invoke-virtual { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L3
  .line 156
    return-void
.end method

.method public static prev()V
  .registers 1
  .line 338
    const/4 v0, -1
    invoke-static { v0 }, Lcom/innioasis/ipp/Keys;->step(I)V
  .line 339
    return-void
.end method

.method public static secondOn()Z
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 415
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
  .line 416
    move-exception v1
  .line 417
    return v0
.end method

.method private static shadowed(III)Lcom/innioasis/ipp/Keys$Shadowed;
  .registers 12
  .line 105
    add-int/lit8 v0, p2, 1
    new-array v0, v0, [Landroid/graphics/drawable/Drawable;
  .line 106
    const/4 v1, 0
    const/4 v2, 0
  :L0
    if-ge v2, p2, :L1
  .line 107
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v3 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 108
    const/high16 v4, 0x18000000
    invoke-virtual { v3, v4 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 109
    add-int v4, p1, p2
    sub-int/2addr v4, v2
    int-to-float v4, v4
    invoke-virtual { v3, v4 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 110
    aput-object v3, v0, v2
  .line 106
    add-int/lit8 v2, v2, 1
    goto :L0
  :L1
  .line 112
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v2 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 113
    invoke-virtual { v2, p0 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 114
    int-to-float p0, p1
    invoke-virtual { v2, p0 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 115
    aput-object v2, v0, p2
  .line 116
    new-instance p0, Lcom/innioasis/ipp/Keys$Shadowed;
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Keys$Shadowed;-><init>([Landroid/graphics/drawable/Drawable;)V
  .line 117
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
  .line 118
    return-object p0
.end method

.method public static shift()V
  .registers 1
  .line 250
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    if-nez v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    sput v0, Lcom/innioasis/ipp/Keys;->mode:I
  .line 251
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  .line 252
    return-void
.end method

.method private static step(I)V
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  :L0
  .line 343
    invoke-static { }, Lcom/innioasis/ipp/Keys;->adapter()Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object v0
  .line 344
    invoke-static { }, Lcom/innioasis/ipp/Keys;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
  .line 345
    if-eqz v0, :L6
    if-nez v1, :L1
    goto :L6
  :L1
  .line 346
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemCount()I
    move-result v2
  .line 347
    if-gtz v2, :L2
    return-void
  :L2
  .line 349
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result v3
    add-int/2addr v3, p0
  .line 350
    if-gez v3, :L3
    add-int/lit8 v3, v2, -1
  :L3
  .line 351
    const/4 p0, 0
    if-lt v3, v2, :L4
    const/4 v3, 0
  :L4
  .line 352
    invoke-virtual { v0, v3, p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setSelectPosition(IZ)V
  .line 353
    invoke-static { v1, v3, v0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L5
  .line 355
    goto :L8
  :L6
  .line 345
    return-void
  :L7
  .line 354
    move-exception p0
  :L8
  .line 356
    return-void
.end method

.method public static table()Ljava/util/List;
  .registers 5
  .line 225
    sget v0, Lcom/innioasis/ipp/Keys;->lang:I
    const/4 v1, 1
    if-ne v0, v1, :L0
    const-string v0, "\u0410\u0411\u0412\u0413\u0414\u0415\u0401\u0416\u0417\u0418\u0419\u041a\u041b\u041c\u041d\u041e\u041f\u0420\u0421\u0422\u0423\u0424\u0425\u0426\u0427\u0428\u0429\u042a\u042b\u042c\u042d\u042e\u042f"
    goto :L2
  :L0
    const/4 v2, 2
    if-ne v0, v2, :L1
    const-string v0, ".,?!'\"-_()0123456789[]@#$%&*+=/\\:;"
    goto :L2
  :L1
    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  :L2
  .line 226
    sget v2, Lcom/innioasis/ipp/Keys;->mode:I
    const/4 v3, 0
    if-eqz v2, :L3
    goto :L4
  :L3
    const/4 v1, 0
  :L4
  .line 227
    new-instance v2, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v4
    invoke-direct { v2, v4 }, Ljava/util/ArrayList;-><init>(I)V
  .line 228
    nop
  :L5
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v4
    if-ge v3, v4, :L8
  .line 229
    invoke-virtual { v0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result v4
  .line 230
    if-eqz v1, :L6
    goto :L7
  :L6
    invoke-static { v4 }, Ljava/lang/Character;->toLowerCase(C)C
    move-result v4
  :L7
    invoke-static { v4 }, Ljava/lang/String;->valueOf(C)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 228
    add-int/lit8 v3, v3, 1
    goto :L5
  :L8
  .line 232
    return-object v2
.end method

.method public static value(Ljava/lang/String;)V
  .registers 3
  .line 284
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    const/4 v1, 2
    if-ne v0, v1, :L0
    return-void
  :L0
  .line 285
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
  .line 286
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    if-ne p0, v0, :L4
    return-void
  :L4
  .line 287
    sput p0, Lcom/innioasis/ipp/Keys;->mode:I
  .line 288
    sget p0, Lcom/innioasis/ipp/Keys;->lang:I
    if-eq p0, v1, :L5
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  :L5
  .line 289
    return-void
.end method

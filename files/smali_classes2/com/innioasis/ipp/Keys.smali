.class public final Lcom/innioasis/ipp/Keys;
.super Ljava/lang/Object;
.source "Keys.java"

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
  .line 90
    const/4 v0, 1
    sput v0, Lcom/innioasis/ipp/Keys;->mode:I
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 59
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static adapter()Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .registers 3
  .line 400
    sget-object v0, Lcom/innioasis/ipp/Keys;->adRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 401
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
  .line 176
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
  .line 177
    if-ne v0, v2, :L2
    sput v1, Lcom/innioasis/ipp/Keys;->lang:I
    goto :L3
  :L2
  .line 178
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Keys;->lang:I
  :L3
  .line 180
    invoke-static { }, Lcom/innioasis/ipp/Keys;->ctx()Landroid/content/Context;
    move-result-object v0
    const-string v1, "kb_lang"
    sget v3, Lcom/innioasis/ipp/Keys;->lang:I
    invoke-static { v0, v1, v3 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  :L4
  .line 183
    goto :L6
  :L5
  .line 181
    move-exception v0
  :L6
  .line 186
    invoke-static { v2 }, Lcom/innioasis/ipp/Keys;->apply(Z)V
  .line 187
    sget-object v0, Lcom/innioasis/ipp/Keys;->actRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L7
    move-object v0, v1
    goto :L8
  :L7
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L8
  .line 188
    sget-object v2, Lcom/innioasis/ipp/Keys;->listRef:Ljava/lang/ref/WeakReference;
    if-nez v2, :L9
    goto :L10
  :L9
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L10
  .line 189
    instance-of v2, v0, Landroid/app/Activity;
    if-eqz v2, :L11
    instance-of v2, v1, Landroid/view/View;
    if-eqz v2, :L11
  .line 190
    check-cast v0, Landroid/app/Activity;
    check-cast v1, Landroid/view/View;
    invoke-static { }, Lcom/innioasis/ipp/Keys;->code()Ljava/lang/String;
    move-result-object v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Alpha;->flash(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;)V
  :L11
  .line 192
    return-void
.end method

.method private static apply()V
  .registers 1
  .line 314
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Keys;->apply(Z)V
  .line 315
    return-void
.end method

.method private static apply(Z)V
  .catchall { :L0 .. :L7 } :L8
  .registers 5
  :L0
  .line 319
    invoke-static { }, Lcom/innioasis/ipp/Keys;->adapter()Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object v0
  .line 320
    if-nez v0, :L1
    return-void
  :L1
  .line 321
    invoke-static { }, Lcom/innioasis/ipp/Keys;->table()Ljava/util/List;
    move-result-object v1
  .line 322
    const/4 v2, 0
    if-eqz p0, :L2
    const/4 p0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p0
  :L3
  .line 323
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setItemList(Ljava/util/List;)V
  .line 324
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-lt p0, v3, :L4
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result p0
    add-int/lit8 p0, p0, -1
  :L4
  .line 325
    if-gez p0, :L5
    const/4 p0, 0
  :L5
  .line 326
    invoke-virtual { v0, p0, v2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setSelectPosition(IZ)V
  .line 327
    invoke-static { }, Lcom/innioasis/ipp/Keys;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
  .line 328
    if-eqz v1, :L6
    invoke-static { v1, p0, v0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L6
  .line 329
    invoke-static { }, Lcom/innioasis/ipp/Keys;->markCaps()V
  :L7
  .line 332
    goto :L9
  :L8
  .line 330
    move-exception p0
  :L9
  .line 333
    return-void
.end method

.method private static arrow(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
  .registers 9
  .line 349
    sget-object v0, Lcom/innioasis/ipp/Keys;->arrow:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 350
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 351
    const/high16 v1, 0x41800000
    mul-float v0, v0, v1
    const/high16 v1, 0x3F000000
    add-float/2addr v0, v1
    float-to-int v0, v0
  .line 352
    const/16 v2, 8
    if-ge v0, v2, :L1
    const/16 v0, 8
  :L1
  .line 353
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v0, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 354
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 355
    new-instance v4, Landroid/graphics/Paint;
    const/4 v5, 1
    invoke-direct { v4, v5 }, Landroid/graphics/Paint;-><init>(I)V
  .line 356
    const/high16 v5, 0xFF000000
    invoke-virtual { v4, v5 }, Landroid/graphics/Paint;->setColor(I)V
  .line 357
    int-to-float v0, v0
  .line 358
    nop
  .line 359
    new-instance v5, Landroid/graphics/Path;
    invoke-direct { v5 }, Landroid/graphics/Path;-><init>()V
  .line 360
    mul-float v1, v1, v0
    const v6, 1031127695
    mul-float v6, v6, v0
    invoke-virtual { v5, v1, v6 }, Landroid/graphics/Path;->moveTo(FF)V
  .line 361
    const v6, 1064682127
    mul-float v6, v6, v0
    invoke-virtual { v5, v6, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 362
    const v6, 1060320051
    mul-float v6, v6, v0
    invoke-virtual { v5, v6, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 363
    const v7, 1064346583
    mul-float v7, v7, v0
    invoke-virtual { v5, v6, v7 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 364
    const v6, 1050253722
    mul-float v6, v6, v0
    invoke-virtual { v5, v6, v7 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 365
    invoke-virtual { v5, v6, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 366
    const v6, 1025758986
    mul-float v0, v0, v6
    invoke-virtual { v5, v0, v1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 367
    invoke-virtual { v5 }, Landroid/graphics/Path;->close()V
  .line 368
    invoke-virtual { v3, v5, v4 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 369
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-direct { v0, p0, v2 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    sput-object v0, Lcom/innioasis/ipp/Keys;->arrow:Landroid/graphics/drawable/Drawable;
  .line 370
    return-object v0
.end method

.method public static attach(Landroid/app/Activity;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/EditText;Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 110
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Keys;->actRef:Ljava/lang/ref/WeakReference;
  .line 111
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Keys;->listRef:Ljava/lang/ref/WeakReference;
  .line 112
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Keys;->boxRef:Ljava/lang/ref/WeakReference;
  .line 113
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, p3 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Keys;->adRef:Ljava/lang/ref/WeakReference;
  .line 114
    invoke-static { }, Lcom/innioasis/ipp/Keys;->ctx()Landroid/content/Context;
    move-result-object p0
    const-string p1, "kb_lang"
    const/4 p2, 0
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Keys;->lang:I
  .line 115
    const/4 p1, 1
    if-ne p0, p1, :L1
    invoke-static { }, Lcom/innioasis/ipp/Keys;->secondOn()Z
    move-result p0
    if-nez p0, :L1
    sput p2, Lcom/innioasis/ipp/Keys;->lang:I
  :L1
  .line 116
    sput p1, Lcom/innioasis/ipp/Keys;->mode:I
  .line 117
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  :L2
  .line 120
    goto :L4
  :L3
  .line 118
    move-exception p0
  :L4
  .line 121
    return-void
.end method

.method public static caps()V
  .registers 2
  .line 166
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    const/4 v1, 2
    if-ne v0, v1, :L0
    const/4 v1, 0
  :L0
    sput v1, Lcom/innioasis/ipp/Keys;->mode:I
  .line 167
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  .line 168
    return-void
.end method

.method private static code()Ljava/lang/String;
  .registers 2
  .line 196
    sget v0, Lcom/innioasis/ipp/Keys;->lang:I
    const/4 v1, 1
    if-ne v0, v1, :L0
    const-string v0, "RU"
    return-object v0
  :L0
  .line 197
    const/4 v1, 2
    if-ne v0, v1, :L1
    const-string v0, "123"
    return-object v0
  :L1
  .line 198
    const-string v0, "EN"
    return-object v0
.end method

.method private static countFit(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 269
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
  .line 410
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    return-object v0
.end method

.method public static defaultSecond()I
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 391
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
  .line 392
    move-exception v1
  .line 393
    return v0
.end method

.method public static fit(Landroid/widget/EditText;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L12 } :L1
  .registers 10
  .line 236
    const-string v0, "..."
    if-nez p1, :L2
  :L0
    const-string p0, ""
    return-object p0
  :L1
  .line 258
    move-exception p0
    goto/16 :L13
  :L2
  .line 237
    if-nez p0, :L3
    invoke-static { p1 }, Lcom/innioasis/ipp/Keys;->countFit(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L3
  .line 238
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
  .line 239
    invoke-virtual { p0 }, Landroid/widget/EditText;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    move-result-object v2
  .line 240
    if-eqz v2, :L4
    array-length v3, v2
    const/4 v4, 2
    if-le v3, v4, :L4
    aget-object v2, v2, v4
    if-eqz v2, :L4
  .line 241
    invoke-virtual { v2 }, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v2
    invoke-virtual { p0 }, Landroid/widget/EditText;->getCompoundDrawablePadding()I
    move-result v3
    add-int/2addr v2, v3
    int-to-float v2, v2
    sub-float/2addr v1, v2
  :L4
  .line 243
    const/4 v2, 0
    cmpg-float v2, v1, v2
    if-gtz v2, :L5
    invoke-static { p1 }, Lcom/innioasis/ipp/Keys;->countFit(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L5
  .line 244
    invoke-virtual { p0 }, Landroid/widget/EditText;->getPaint()Landroid/text/TextPaint;
    move-result-object p0
  .line 245
    if-nez p0, :L6
    invoke-static { p1 }, Lcom/innioasis/ipp/Keys;->countFit(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L6
  .line 246
    invoke-virtual { p0, p1 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v2
    cmpg-float v2, v2, v1
    if-gtz v2, :L7
    return-object p1
  :L7
  .line 248
    invoke-virtual { p0, v0 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v2
  .line 249
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v3
  .line 250
    nop
  .line 252
    const/4 v4, 0
    move v5, v3
  :L8
    const/4 v6, 1
    if-lez v5, :L10
  .line 253
    add-int/lit8 v7, v5, -1
    invoke-virtual { p0, p1, v7, v3 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F
    move-result v7
    add-float/2addr v7, v2
    cmpl-float v7, v7, v1
    if-lez v7, :L9
    goto :L10
  :L9
  .line 254
    sub-int v4, v3, v5
    add-int/2addr v4, v6
  .line 252
    add-int/lit8 v5, v5, -1
    goto :L8
  :L10
  .line 256
    if-ge v4, v6, :L11
    const/4 v4, 1
  :L11
  .line 257
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
  .line 259
    return-object p1
.end method

.method public static hold(I)I
  .catchall { :L0 .. :L1 } :L4
  .registers 3
  :L0
  .line 150
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 151
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v1
    if-eq p0, v1, :L3
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_PLAY()I
    move-result v0
  :L1
    if-ne p0, v0, :L2
    goto :L3
  :L2
  .line 154
    goto :L5
  :L3
  .line 151
    const/4 p0, 1
    return p0
  :L4
  .line 152
    move-exception p0
  :L5
  .line 155
    const/4 p0, 6
    return p0
.end method

.method private static list()Landroidx/recyclerview/widget/RecyclerView;
  .registers 3
  .line 405
    sget-object v0, Lcom/innioasis/ipp/Keys;->listRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 406
    instance-of v2, v0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  :L2
    return-object v1
.end method

.method private static markCaps()V
  .registers 4
  .line 342
    sget-object v0, Lcom/innioasis/ipp/Keys;->boxRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 343
    instance-of v2, v0, Landroid/widget/EditText;
    if-nez v2, :L2
    return-void
  :L2
  .line 344
    check-cast v0, Landroid/widget/EditText;
  .line 345
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
  .line 346
    return-void
.end method

.method public static next()V
  .registers 1
  .line 282
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Keys;->step(I)V
  .line 283
    return-void
.end method

.method public static prev()V
  .registers 1
  .line 286
    const/4 v0, -1
    invoke-static { v0 }, Lcom/innioasis/ipp/Keys;->step(I)V
  .line 287
    return-void
.end method

.method public static secondOn()Z
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 378
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
  .line 379
    move-exception v1
  .line 380
    return v0
.end method

.method public static shift()V
  .registers 1
  .line 160
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    if-nez v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    sput v0, Lcom/innioasis/ipp/Keys;->mode:I
  .line 161
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  .line 162
    return-void
.end method

.method private static step(I)V
  .catchall { :L0 .. :L5 } :L7
  .registers 5
  :L0
  .line 291
    invoke-static { }, Lcom/innioasis/ipp/Keys;->adapter()Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object v0
  .line 292
    invoke-static { }, Lcom/innioasis/ipp/Keys;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v1
  .line 293
    if-eqz v0, :L6
    if-nez v1, :L1
    goto :L6
  :L1
  .line 294
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemCount()I
    move-result v2
  .line 295
    if-gtz v2, :L2
    return-void
  :L2
  .line 296
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result v3
    add-int/2addr v3, p0
  .line 297
    const/4 p0, 0
    if-gez v3, :L3
    const/4 v3, 0
  :L3
  .line 298
    if-lt v3, v2, :L4
    add-int/lit8 v3, v2, -1
  :L4
  .line 299
    invoke-virtual { v0, v3, p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->setSelectPosition(IZ)V
  .line 300
    invoke-static { v1, v3, v0 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L5
  .line 303
    goto :L8
  :L6
  .line 293
    return-void
  :L7
  .line 301
    move-exception p0
  :L8
  .line 304
    return-void
.end method

.method public static table()Ljava/util/List;
  .registers 5
  .line 129
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
  .line 130
    sget v2, Lcom/innioasis/ipp/Keys;->mode:I
    const/4 v3, 0
    if-eqz v2, :L3
    goto :L4
  :L3
    const/4 v1, 0
  :L4
  .line 131
    new-instance v2, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v4
    invoke-direct { v2, v4 }, Ljava/util/ArrayList;-><init>(I)V
  .line 132
    nop
  :L5
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v4
    if-ge v3, v4, :L8
  .line 133
    invoke-virtual { v0, v3 }, Ljava/lang/String;->charAt(I)C
    move-result v4
  .line 134
    if-eqz v1, :L6
    goto :L7
  :L6
    invoke-static { v4 }, Ljava/lang/Character;->toLowerCase(C)C
    move-result v4
  :L7
    invoke-static { v4 }, Ljava/lang/String;->valueOf(C)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 132
    add-int/lit8 v3, v3, 1
    goto :L5
  :L8
  .line 136
    return-object v2
.end method

.method public static value(Ljava/lang/String;)V
  .registers 3
  .line 206
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    const/4 v1, 2
    if-ne v0, v1, :L0
    return-void
  :L0
  .line 207
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
  .line 208
    sget v0, Lcom/innioasis/ipp/Keys;->mode:I
    if-ne p0, v0, :L4
    return-void
  :L4
  .line 209
    sput p0, Lcom/innioasis/ipp/Keys;->mode:I
  .line 212
    sget p0, Lcom/innioasis/ipp/Keys;->lang:I
    if-eq p0, v1, :L5
    invoke-static { }, Lcom/innioasis/ipp/Keys;->apply()V
  :L5
  .line 213
    return-void
.end method

.class public final Lcom/innioasis/ipp/Icons;
.super Ljava/lang/Object;
.source "Icons.java"

.field private final static BOX_H:F = 52.0F

.field private final static BOX_W:F = 68.0F

.field private final static DARK:I = 1

.field private final static FULL_ALPHA:I = 255

.field private final static LIGHT:I = 0

.field private final static NO_COLOR:I = 0

.field private final static OFF_DARK:I = -9342607

.field private final static OFF_LIGHT:I = -3815995

.field private final static ON_DARK:I = -15592942

.field private final static ON_LIGHT:I = -1

.field private final static PROBE:I = 16707006

.field private final static SH:I = 8

.field private final static SW:I = 4

.field private final static THEME:I = 2

.field private final static WIN_B:F = 53.0F

.field private final static WIN_L:F = 20.0F

.field private final static WIN_R:F = 51.0F

.field private final static WIN_T:F = 28.0F

.field private static probe:Landroid/widget/TextView;

.field private final static stamps:Ljava/util/HashMap;

.field private static tlColor:I

.field private static tlKey:Ljava/lang/Object;

.method static constructor <clinit>()V
  .registers 1
  .line 189
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Icons;->stamps:Ljava/util/HashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 43
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static apply(Landroid/widget/ImageView;I)V
  .registers 3
  .line 161
    const/4 v0, 0
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Icons;->apply(Landroid/widget/ImageView;II)V
  .line 162
    return-void
.end method

.method public static apply(Landroid/widget/ImageView;II)V
  .registers 4
  .line 151
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 152
    invoke-static { p1 }, Lcom/innioasis/ipp/Icons;->isDimmed(I)Z
    move-result v0
  .line 153
    xor-int/lit8 v0, v0, 1
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 154
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/Icons;->stateColor(ZI)I
    move-result p1
  .line 155
    if-eqz v0, :L1
    const/4 p2, -1
    goto :L2
  :L1
    const p2, -3815995
  :L2
    if-ne p1, p2, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
    goto :L4
  :L3
  .line 156
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Icons;->paint(Landroid/widget/ImageView;I)V
  :L4
  .line 157
    return-void
  :L5
  .line 151
    return-void
.end method

.method private static drawn(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L4 } :L5
  .registers 8
  :L0
  .line 231
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "v|"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "|"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 232
    sget-object v1, Lcom/innioasis/ipp/Icons;->stamps:Ljava/util/HashMap;
    invoke-virtual { v1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 233
    instance-of v3, v2, Landroid/graphics/Bitmap;
    if-eqz v3, :L1
    check-cast v2, Landroid/graphics/Bitmap;
    return-object v2
  :L1
  .line 234
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v3, 72
    invoke-static { v3, v3, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 235
    new-instance v3, Landroid/graphics/Paint;
    const/4 v4, 1
    invoke-direct { v3, v4 }, Landroid/graphics/Paint;-><init>(I)V
  .line 236
    const/4 v5, -1
    invoke-virtual { v3, v5 }, Landroid/graphics/Paint;->setColor(I)V
  .line 237
    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v5, v4 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 239
    sget-object v4, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 240
    const/high16 v4, 0x42500000
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setTextSize(F)V
  .line 241
    if-nez p1, :L2
    move-object p1, p0
  :L2
    invoke-virtual { v3, p1 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result p1
  .line 242
    const/high16 v4, 0x42880000
    cmpl-float v4, p1, v4
    if-lez v4, :L3
    const/high16 v4, 0x455D0000
    div-float/2addr v4, p1
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setTextSize(F)V
  :L3
  .line 243
    invoke-virtual { v3 }, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;
    move-result-object p1
  .line 244
    new-instance v4, Landroid/graphics/Canvas;
    invoke-direct { v4, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    iget v5, p1, Landroid/graphics/Paint$FontMetrics;->ascent:F
    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->descent:F
    add-float/2addr v5, p1
    const/high16 p1, 0x40000000
    div-float/2addr v5, p1
    const/high16 p1, 0x42100000
    sub-float v5, p1, v5
    invoke-virtual { v4, p0, p1, v5, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 245
    invoke-virtual { v1, v0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 246
    return-object v2
  :L5
  .line 247
    move-exception p0
  .line 248
    const/4 p0, 0
    return-object p0
.end method

.method private static isDimmed(I)Z
  .registers 2
  .line 107
    const v0, 2131623987
    if-eq p0, v0, :L1
    const v0, 2131623992
    if-eq p0, v0, :L1
    const v0, 2131623975
    if-eq p0, v0, :L1
    const v0, 2131623974
    if-eq p0, v0, :L1
    const v0, 2131624015
    if-eq p0, v0, :L1
    const v0, 2131624017
    if-ne p0, v0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method public static label(Landroid/widget/ImageView;IILjava/lang/String;)V
  .registers 5
  .line 197
    if-eqz p0, :L9
    if-nez p1, :L0
    goto :L9
  :L0
  .line 198
    if-eqz p3, :L8
    invoke-virtual { p3 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L1
    goto :L8
  :L1
  .line 202
    invoke-static { p0, p1, p3 }, Lcom/innioasis/ipp/Icons;->stamped(Landroid/widget/ImageView;ILjava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p3
  .line 203
    if-nez p3, :L2
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
    goto :L3
  :L2
  .line 204
    invoke-virtual { p0, p3 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L3
  .line 205
    invoke-static { p1 }, Lcom/innioasis/ipp/Icons;->isDimmed(I)Z
    move-result p1
  .line 206
    xor-int/lit8 p1, p1, 1
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Icons;->stateColor(ZI)I
    move-result p2
  .line 207
    if-eqz p1, :L4
    const/4 p1, -1
    goto :L5
  :L4
    const p1, -3815995
  :L5
    if-ne p2, p1, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
    goto :L7
  :L6
  .line 208
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Icons;->paint(Landroid/widget/ImageView;I)V
  :L7
  .line 209
    return-void
  :L8
  .line 199
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Icons;->apply(Landroid/widget/ImageView;II)V
  .line 200
    return-void
  :L9
  .line 197
    return-void
.end method

.method public static menu(Landroid/widget/ImageView;I)V
  .registers 2
  .line 290
    if-nez p0, :L0
    return-void
  :L0
  .line 291
    if-nez p1, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
    goto :L2
  :L1
  .line 292
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Icons;->paint(Landroid/widget/ImageView;I)V
  :L2
  .line 293
    return-void
.end method

.method public static menuColor()I
  .registers 1
  .line 81
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->probeColor(Z)I
    move-result v0
    return v0
.end method

.method private static mode()I
  .registers 2
  .line 61
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 62
    const-string v1, "icon_tint"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    return v0
.end method

.method private static paint(Landroid/widget/ImageView;I)V
  .registers 3
  .line 296
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { p0, p1, v0 }, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  .line 297
    const/16 p1, 255
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageAlpha(I)V
  .line 298
    return-void
.end method

.method private static probeColor(Z)I
  .catchall { :L0 .. :L4 } :L7
  .registers 4
  .line 92
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 93
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 95
    sget-object v2, Lcom/innioasis/ipp/Icons;->probe:Landroid/widget/TextView;
    if-nez v2, :L1
    new-instance v2, Landroid/widget/TextView;
    invoke-direct { v2, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    sput-object v2, Lcom/innioasis/ipp/Icons;->probe:Landroid/widget/TextView;
  :L1
  .line 96
    const v0, 16707006
    if-eqz p0, :L2
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget-object v2, Lcom/innioasis/ipp/Icons;->probe:Landroid/widget/TextView;
    invoke-virtual { p0, v2, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
    goto :L3
  :L2
  .line 97
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget-object v2, Lcom/innioasis/ipp/Icons;->probe:Landroid/widget/TextView;
    invoke-virtual { p0, v2, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L3
  .line 98
    sget-object p0, Lcom/innioasis/ipp/Icons;->probe:Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
  :L4
  .line 99
    if-ne p0, v0, :L5
    goto :L6
  :L5
    move v1, p0
  :L6
    return v1
  :L7
  .line 100
    move-exception p0
  .line 101
    return v1
.end method

.method public static reset(Landroid/widget/ImageView;)V
  .registers 2
  .line 302
    if-nez p0, :L0
    return-void
  :L0
  .line 303
    invoke-virtual { p0 }, Landroid/widget/ImageView;->clearColorFilter()V
  .line 304
    const/16 v0, 255
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setImageAlpha(I)V
  .line 305
    return-void
.end method

.method private static sample(Landroid/graphics/drawable/Drawable;)I
  .catchall { :L0 .. :L1 } :L24
  .catchall { :L1 .. :L4 } :L23
  .catchall { :L9 .. :L10 } :L11
  .catchall { :L15 .. :L16 } :L22
  .catchall { :L17 .. :L18 } :L19
  .catchall { :L26 .. :L27 } :L28
  .registers 17
  .line 346
    move-object/from16 v1, p0
    invoke-virtual/range { p0 .. p0 }, Landroid/graphics/drawable/Drawable;->copyBounds()Landroid/graphics/Rect;
    move-result-object v2
  .line 347
    invoke-virtual/range { p0 .. p0 }, Landroid/graphics/drawable/Drawable;->getLevel()I
    move-result v3
  .line 348
    nop
  .line 350
    const/4 v4, 0
    const/4 v5, 0
  :L0
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/4 v6, 4
    const/16 v7, 8
    invoke-static { v6, v7, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v5
  :L1
  .line 351
    invoke-virtual { v1, v4, v4, v6, v7 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 352
    const/16 v0, 10000
    invoke-virtual { v1, v0 }, Landroid/graphics/drawable/Drawable;->setLevel(I)Z
  .line 353
    new-instance v0, Landroid/graphics/Canvas;
    invoke-direct { v0, v5 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    invoke-virtual { v1, v0 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 354
    nop
  .line 355
    nop
  .line 356
    const-wide/16 v8, 0
    move-wide v10, v8
    move-wide v12, v10
    const/4 v0, 0
    const/4 v14, 0
  :L2
    if-ge v0, v7, :L8
  .line 357
    const/4 v15, 0
  :L3
    if-ge v15, v6, :L7
  .line 358
    invoke-virtual { v5, v15, v0 }, Landroid/graphics/Bitmap;->getPixel(II)I
    move-result v6
  :L4
  .line 359
    ushr-int/lit8 v7, v6, 24
    and-int/lit16 v7, v7, 255
    const/16 v4, 128
    if-ge v7, v4, :L5
    move-object v7, v5
    goto :L6
  :L5
  .line 360
    shr-int/lit8 v4, v6, 16
    and-int/lit16 v4, v4, 255
    move-object v7, v5
    int-to-long v4, v4
    add-long/2addr v8, v4
  .line 361
    shr-int/lit8 v4, v6, 8
    and-int/lit16 v4, v4, 255
    int-to-long v4, v4
    add-long/2addr v10, v4
  .line 362
    and-int/lit16 v4, v6, 255
    int-to-long v4, v4
    add-long/2addr v12, v4
  .line 363
    add-int/lit8 v14, v14, 1
  :L6
  .line 357
    add-int/lit8 v15, v15, 1
    move-object v5, v7
    const/4 v4, 0
    const/4 v6, 4
    const/16 v7, 8
    goto :L3
  :L7
  .line 356
    move-object v7, v5
    add-int/lit8 v0, v0, 1
    const/4 v4, 0
    const/4 v6, 4
    const/16 v7, 8
    goto :L2
  :L8
  .line 366
    move-object v7, v5
    if-nez v14, :L14
  :L9
  .line 372
    invoke-virtual { v1, v3 }, Landroid/graphics/drawable/Drawable;->setLevel(I)Z
  .line 373
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
  :L10
  .line 376
    goto :L12
  :L11
  .line 374
    move-exception v0
  :L12
  .line 377
    if-eqz v7, :L13
    invoke-virtual { v7 }, Landroid/graphics/Bitmap;->recycle()V
  :L13
  .line 366
    const/4 v1, 0
    return v1
  :L14
  .line 367
    int-to-long v4, v14
  :L15
    div-long/2addr v8, v4
    long-to-int v0, v8
    shl-int/lit8 v0, v0, 16
    const/high16 v6, 0xFF000000
    or-int/2addr v0, v6
    div-long/2addr v10, v4
    long-to-int v6, v10
    const/16 v8, 8
    shl-int/2addr v6, v8
    or-int/2addr v0, v6
    div-long/2addr v12, v4
  :L16
    long-to-int v4, v12
    or-int/2addr v4, v0
  :L17
  .line 372
    invoke-virtual { v1, v3 }, Landroid/graphics/drawable/Drawable;->setLevel(I)Z
  .line 373
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
  :L18
  .line 376
    goto :L20
  :L19
  .line 374
    move-exception v0
  :L20
  .line 377
    if-eqz v7, :L21
    invoke-virtual { v7 }, Landroid/graphics/Bitmap;->recycle()V
  :L21
  .line 367
    return v4
  :L22
  .line 368
    move-exception v0
    move-object v5, v7
    goto :L25
  :L23
    move-exception v0
    move-object v7, v5
    goto :L25
  :L24
    move-exception v0
  :L25
  .line 369
    nop
  :L26
  .line 372
    invoke-virtual { v1, v3 }, Landroid/graphics/drawable/Drawable;->setLevel(I)Z
  .line 373
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
  :L27
  .line 376
    goto :L29
  :L28
  .line 374
    move-exception v0
  :L29
  .line 377
    if-eqz v5, :L30
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L30
  .line 369
    const/4 v1, 0
    return v1
.end method

.method private static stamped(Landroid/widget/ImageView;ILjava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L5 } :L6
  .registers 14
  .line 254
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "|"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 255
    sget-object v2, Lcom/innioasis/ipp/Icons;->stamps:Ljava/util/HashMap;
    invoke-virtual { v2, v1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  .line 256
    instance-of v4, v3, Landroid/graphics/Bitmap;
    if-eqz v4, :L1
    check-cast v3, Landroid/graphics/Bitmap;
    return-object v3
  :L1
  .line 257
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-static { p0, p1 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 258
    if-nez p0, :L2
    return-object v0
  :L2
  .line 259
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/4 v3, 1
    invoke-virtual { p0, p1, v3 }, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 260
    if-nez p0, :L3
    return-object v0
  :L3
  .line 261
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p1
    int-to-float p1, p1
    const/high16 v4, 0x42900000
    div-float/2addr p1, v4
  .line 262
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v5
    int-to-float v5, v5
    div-float/2addr v5, v4
  .line 263
    const/high16 v4, 0x41A00000
    mul-float v4, v4, p1
    const/high16 v6, 0x424C0000
    mul-float p1, p1, v6
    const/high16 v6, 0x41E00000
    mul-float v6, v6, v5
    const/high16 v7, 0x42540000
    mul-float v5, v5, v7
  .line 264
    new-instance v7, Landroid/graphics/Paint;
    invoke-direct { v7, v3 }, Landroid/graphics/Paint;-><init>(I)V
  .line 265
    const/4 v8, -1
    invoke-virtual { v7, v8 }, Landroid/graphics/Paint;->setColor(I)V
  .line 267
    sget-object v8, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v8, v3 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v3
    invoke-virtual { v7, v3 }, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 269
    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v7, v3 }, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 271
    sub-float v3, v5, v6
    invoke-virtual { v7, v3 }, Landroid/graphics/Paint;->setTextSize(F)V
  .line 272
    invoke-virtual { v7, p2 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v8
  .line 273
    sub-float v9, p1, v4
    cmpl-float v10, v8, v9
    if-lez v10, :L4
    mul-float v3, v3, v9
    div-float/2addr v3, v8
    invoke-virtual { v7, v3 }, Landroid/graphics/Paint;->setTextSize(F)V
  :L4
  .line 274
    invoke-virtual { v7 }, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;
    move-result-object v3
  .line 275
    new-instance v8, Landroid/graphics/Canvas;
    invoke-direct { v8, p0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    add-float/2addr v4, p1
    const/high16 p1, 0x40000000
    div-float/2addr v4, p1
    add-float/2addr v6, v5
    div-float/2addr v6, p1
    iget v5, v3, Landroid/graphics/Paint$FontMetrics;->ascent:F
    iget v3, v3, Landroid/graphics/Paint$FontMetrics;->descent:F
    add-float/2addr v5, v3
    div-float/2addr v5, p1
    sub-float/2addr v6, v5
    invoke-virtual { v8, p2, v4, v6, v7 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 276
    invoke-virtual { v2, v1, p0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 277
    return-object p0
  :L6
  .line 278
    move-exception p0
  .line 279
    return-object v0
.end method

.method public static stateColor(ZI)I
  .registers 4
  .line 126
    invoke-static { }, Lcom/innioasis/ipp/Icons;->mode()I
    move-result v0
  .line 127
    const/4 v1, 1
    if-ne v0, v1, :L2
    if-eqz p0, :L0
    const p0, -15592942
    goto :L1
  :L0
    const p0, -9342607
  :L1
    return p0
  :L2
  .line 128
    const/4 v1, 2
    if-ne v0, v1, :L4
    if-eqz p0, :L4
  .line 129
    if-nez p1, :L3
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeColor()I
    move-result p1
  :L3
  .line 130
    if-eqz p1, :L4
    return p1
  :L4
  .line 133
    if-eqz p0, :L5
    const/4 p0, -1
    goto :L6
  :L5
    const p0, -3815995
  :L6
    return p0
.end method

.method public static themeColor()I
  .registers 1
  .line 67
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->probeColor(Z)I
    move-result v0
    return v0
.end method

.method public static timelineColor(Landroid/app/Activity;)I
  .catchall { :L1 .. :L6 } :L7
  .registers 3
  .line 322
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 324
    const v1, 2131362288
  :L1
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 325
    instance-of v1, p0, Landroid/widget/ProgressBar;
    if-nez v1, :L2
    return v0
  :L2
  .line 326
    check-cast p0, Landroid/widget/ProgressBar;
    invoke-virtual { p0 }, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p0
  .line 327
    instance-of v1, p0, Landroid/graphics/drawable/LayerDrawable;
    if-nez v1, :L3
    return v0
  :L3
  .line 328
    check-cast p0, Landroid/graphics/drawable/LayerDrawable;
    const v1, 16908301
    invoke-virtual { p0, v1 }, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
    move-result-object p0
  .line 329
    if-nez p0, :L4
    return v0
  :L4
  .line 330
    sget-object v1, Lcom/innioasis/ipp/Icons;->tlKey:Ljava/lang/Object;
    if-ne p0, v1, :L5
    sget p0, Lcom/innioasis/ipp/Icons;->tlColor:I
    return p0
  :L5
  .line 331
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->sample(Landroid/graphics/drawable/Drawable;)I
    move-result v1
    sput v1, Lcom/innioasis/ipp/Icons;->tlColor:I
  .line 332
    sput-object p0, Lcom/innioasis/ipp/Icons;->tlKey:Ljava/lang/Object;
  :L6
  .line 333
    return v1
  :L7
  .line 334
    move-exception p0
  .line 335
    return v0
.end method

.method public static value(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;I)V
  .registers 5
  .line 221
    if-eqz p0, :L4
    if-eqz p1, :L4
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L4
  :L0
  .line 222
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Icons;->drawn(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 223
    if-eqz p1, :L1
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L1
  .line 224
    const/4 p1, 1
    invoke-static { p1, p3 }, Lcom/innioasis/ipp/Icons;->stateColor(ZI)I
    move-result p1
  .line 225
    const/4 p2, -1
    if-ne p1, p2, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
    goto :L3
  :L2
  .line 226
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Icons;->paint(Landroid/widget/ImageView;I)V
  :L3
  .line 227
    return-void
  :L4
  .line 221
    return-void
.end method

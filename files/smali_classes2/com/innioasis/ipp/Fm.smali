.class public final Lcom/innioasis/ipp/Fm;
.super Ljava/lang/Object;
.source "Fm.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Fm$Echo;
  }
.end annotation

.field private final static BACK:I = -7564110

.field private final static EDGE:F = 2.0F

.field private final static FAINT:I = -872415232

.field private final static NOW:I = -18944

.field private final static PLAIN:I = -1

.field private final static TEXT_EDGE:F = 1.0F

.field private static box:[I

.field private static foundBm:Landroid/graphics/Bitmap;

.field private static foundColor:I

.field private static foundEdge:I

.field private static keptBm:Landroid/graphics/Bitmap;

.field private static keptColor:I

.field private static keptEdge:I

.method private constructor <init>()V
  .registers 1
  .line 57
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static back()I
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  :L0
  .line 75
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 76
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  :L1
    const/high16 v1, 0xFF000000
    or-int/2addr v0, v1
    return v0
  :L2
  .line 79
    goto :L4
  :L3
  .line 77
    move-exception v0
  :L4
  .line 80
    const v0, -7564110
    return v0
.end method

.method public static diamond(Z)Landroid/graphics/Bitmap;
  .registers 5
  .line 141
    if-eqz p0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Fm;->now()I
    move-result v0
    goto :L1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Fm;->back()I
    move-result v0
  :L1
  .line 142
    invoke-static { }, Lcom/innioasis/ipp/Fm;->plain()I
    move-result v1
  .line 143
    if-eqz p0, :L2
    sget-object v2, Lcom/innioasis/ipp/Fm;->keptBm:Landroid/graphics/Bitmap;
    goto :L3
  :L2
    sget-object v2, Lcom/innioasis/ipp/Fm;->foundBm:Landroid/graphics/Bitmap;
  :L3
  .line 144
    if-eqz v2, :L8
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v3
    if-nez v3, :L8
  .line 145
    if-eqz p0, :L4
    sget v3, Lcom/innioasis/ipp/Fm;->keptColor:I
    goto :L5
  :L4
    sget v3, Lcom/innioasis/ipp/Fm;->foundColor:I
  :L5
    if-ne v3, v0, :L8
  .line 146
    if-eqz p0, :L6
    sget v3, Lcom/innioasis/ipp/Fm;->keptEdge:I
    goto :L7
  :L6
    sget v3, Lcom/innioasis/ipp/Fm;->foundEdge:I
  :L7
    if-ne v3, v1, :L8
    return-object v2
  :L8
  .line 147
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Fm;->draw(II)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 148
    if-nez v2, :L11
    if-eqz p0, :L9
    sget-object p0, Lcom/innioasis/ipp/Fm;->keptBm:Landroid/graphics/Bitmap;
    goto :L10
  :L9
    sget-object p0, Lcom/innioasis/ipp/Fm;->foundBm:Landroid/graphics/Bitmap;
  :L10
    return-object p0
  :L11
  .line 149
    if-eqz p0, :L12
    sput-object v2, Lcom/innioasis/ipp/Fm;->keptBm:Landroid/graphics/Bitmap;
    sput v0, Lcom/innioasis/ipp/Fm;->keptColor:I
    sput v1, Lcom/innioasis/ipp/Fm;->keptEdge:I
    goto :L13
  :L12
  .line 150
    sput-object v2, Lcom/innioasis/ipp/Fm;->foundBm:Landroid/graphics/Bitmap;
    sput v0, Lcom/innioasis/ipp/Fm;->foundColor:I
    sput v1, Lcom/innioasis/ipp/Fm;->foundEdge:I
  :L13
  .line 151
    return-object v2
.end method

.method private static draw(II)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L2 } :L3
  .registers 15
  .line 169
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Fm;->geometry()[I
    move-result-object v1
  .line 170
    if-nez v1, :L1
    return-object v0
  :L1
  .line 171
    const/4 v2, 0
    aget v2, v1, v2
    const/4 v3, 1
    aget v4, v1, v3
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v2, v4, v5 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 172
    new-instance v4, Landroid/graphics/Canvas;
    invoke-direct { v4, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 173
    const/4 v5, 2
    aget v5, v1, v5
    int-to-float v5, v5
    const/high16 v6, 0x3F000000
    sub-float/2addr v5, v6
    const/4 v7, 3
    aget v7, v1, v7
    int-to-float v7, v7
    sub-float/2addr v7, v6
  .line 174
    const/4 v6, 4
    aget v6, v1, v6
    int-to-float v6, v6
    const/high16 v8, 0x3FC00000
    add-float/2addr v6, v8
    const/4 v9, 5
    aget v1, v1, v9
    int-to-float v1, v1
    add-float/2addr v1, v8
  .line 175
    add-float v8, v5, v6
    const/high16 v9, 0x40000000
    div-float/2addr v8, v9
    add-float v10, v7, v1
    div-float/2addr v10, v9
  .line 176
    sub-float/2addr v6, v5
    div-float/2addr v6, v9
    sub-float/2addr v1, v7
    div-float/2addr v1, v9
  .line 178
    new-instance v5, Landroid/graphics/Paint;
    invoke-direct { v5 }, Landroid/graphics/Paint;-><init>()V
  .line 179
    invoke-virtual { v5, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 180
    invoke-virtual { v5, p0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 181
    sget-object p0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual { v5, p0 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 182
    invoke-static { v8, v10, v6, v1 }, Lcom/innioasis/ipp/Fm;->path(FFFF)Landroid/graphics/Path;
    move-result-object p0
    invoke-virtual { v4, p0, v5 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 188
    mul-float p0, v6, v6
    mul-float v3, v1, v1
    add-float/2addr p0, v3
    float-to-double v11, p0
    invoke-static { v11, v12 }, Ljava/lang/Math;->sqrt(D)D
    move-result-wide v11
    double-to-float p0, v11
    const/high16 v3, 0x3F800000
    mul-float p0, p0, v3
    mul-float v7, v6, v1
    div-float/2addr p0, v7
    sub-float/2addr v3, p0
  .line 189
    const/4 p0, 0
    cmpl-float p0, v3, p0
    if-lez p0, :L2
  .line 190
    invoke-virtual { v5, p1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 191
    sget-object p0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v5, p0 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 192
    invoke-virtual { v5, v9 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 193
    mul-float v6, v6, v3
    mul-float v1, v1, v3
    invoke-static { v8, v10, v6, v1 }, Lcom/innioasis/ipp/Fm;->path(FFFF)Landroid/graphics/Path;
    move-result-object p0
    invoke-virtual { v4, p0, v5 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  :L2
  .line 195
    return-object v2
  :L3
  .line 196
    move-exception p0
  .line 197
    return-object v0
.end method

.method public static faint(I)I
  .registers 2
  .line 106
    const v0, 16777215
    and-int/2addr p0, v0
    const/high16 v0, 0xCC000000
    or-int/2addr p0, v0
    return p0
.end method

.method private static geometry()[I
  .registers 13
  .line 213
    sget-object v0, Lcom/innioasis/ipp/Fm;->box:[I
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 214
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 215
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 216
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v2, 2131230929
    invoke-static { v0, v2 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 217
    if-nez v0, :L2
    return-object v1
  :L2
  .line 218
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 219
    nop
  .line 220
    const/4 v4, -1
    const/4 v5, 0
    move v8, v2
    move v9, v3
    const/4 v6, -1
    const/4 v7, 0
  :L3
    if-ge v7, v3, :L11
  .line 221
    const/4 v10, 0
  :L4
    if-ge v10, v2, :L10
  .line 223
    invoke-virtual { v0, v10, v7 }, Landroid/graphics/Bitmap;->getPixel(II)I
    move-result v11
    ushr-int/lit8 v11, v11, 24
    const/16 v12, 192
    if-ge v11, v12, :L5
    goto :L9
  :L5
  .line 224
    if-ge v10, v8, :L6
    move v8, v10
  :L6
  .line 225
    if-le v10, v4, :L7
    move v4, v10
  :L7
  .line 226
    if-ge v7, v9, :L8
    move v9, v7
  :L8
  .line 227
    if-le v7, v6, :L9
    move v6, v7
  :L9
  .line 221
    add-int/lit8 v10, v10, 1
    goto :L4
  :L10
  .line 220
    add-int/lit8 v7, v7, 1
    goto :L3
  :L11
  .line 230
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->recycle()V
  .line 231
    if-gez v4, :L12
    return-object v1
  :L12
  .line 232
    const/4 v0, 6
    new-array v0, v0, [I
    aput v2, v0, v5
    const/4 v1, 1
    aput v3, v0, v1
    const/4 v1, 2
    aput v8, v0, v1
    const/4 v1, 3
    aput v9, v0, v1
    const/4 v1, 4
    aput v4, v0, v1
    const/4 v1, 5
    aput v6, v0, v1
    sput-object v0, Lcom/innioasis/ipp/Fm;->box:[I
  .line 233
    return-object v0
.end method

.method public static ground(Landroid/graphics/Canvas;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 111
    if-nez p0, :L0
    return-void
  :L0
  .line 113
    invoke-static { }, Lcom/innioasis/ipp/Fm;->back()I
    move-result v0
    invoke-virtual { p0, v0 }, Landroid/graphics/Canvas;->drawColor(I)V
  :L1
  .line 116
    goto :L3
  :L2
  .line 114
    move-exception p0
  :L3
  .line 117
    return-void
.end method

.method public static now()I
  .registers 1
  .line 100
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result v0
  .line 101
    if-nez v0, :L0
    const/16 v0, -18944
  :L0
    return v0
.end method

.method private static outline(Landroid/widget/TextView;I)V
  .registers 8
  .line 323
    if-eqz p0, :L4
    if-nez p1, :L0
    goto/16 :L4
  :L0
  .line 324
    invoke-virtual { p0 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 325
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-nez v1, :L1
    return-void
  :L1
  .line 326
    check-cast v0, Landroid/view/ViewGroup;
  .line 328
    new-instance v1, Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-direct { v1, v2 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 329
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
  .line 330
    instance-of v3, v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    if-eqz v3, :L2
  .line 333
    new-instance v3, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    invoke-direct { v3, v2 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    goto :L3
  :L2
  .line 334
    if-eqz v2, :L3
  .line 335
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;
    invoke-direct { v3, v2 }, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L3
  .line 337
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;
    move-result-object v2
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 338
    const/4 v2, 0
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTextSize()F
    move-result v3
    invoke-virtual { v1, v2, v3 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 339
    invoke-virtual { p0 }, Landroid/widget/TextView;->getIncludeFontPadding()Z
    move-result v2
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 340
    invoke-virtual { p0 }, Landroid/widget/TextView;->getGravity()I
    move-result v2
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 341
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingLeft()I
    move-result v2
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingTop()I
    move-result v3
  .line 342
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingRight()I
    move-result v4
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingBottom()I
    move-result v5
  .line 341
    invoke-virtual { v1, v2, v3, v4, v5 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 343
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v2
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 344
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 345
    invoke-virtual { v1 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p1
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { p1, v2 }, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 346
    invoke-virtual { v1 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p1
    const/high16 v2, 0x40000000
    invoke-virtual { p1, v2 }, Landroid/text/TextPaint;->setStrokeWidth(F)V
  .line 347
    invoke-virtual { v1 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p1
    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;
    invoke-virtual { p1, v2 }, Landroid/text/TextPaint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V
  .line 348
    invoke-virtual { v0, p0 }, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result p1
    invoke-virtual { v0, v1, p1 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V
  .line 349
    new-instance p1, Lcom/innioasis/ipp/Fm$Echo;
    invoke-direct { p1, v1 }, Lcom/innioasis/ipp/Fm$Echo;-><init>(Landroid/widget/TextView;)V
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V
  .line 350
    return-void
  :L4
  .line 323
    return-void
.end method

.method private static path(FFFF)Landroid/graphics/Path;
  .registers 6
  .line 202
    new-instance v0, Landroid/graphics/Path;
    invoke-direct { v0 }, Landroid/graphics/Path;-><init>()V
  .line 203
    sub-float v1, p1, p3
    invoke-virtual { v0, p0, v1 }, Landroid/graphics/Path;->moveTo(FF)V
  .line 204
    add-float v1, p0, p2
    invoke-virtual { v0, v1, p1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 205
    add-float/2addr p3, p1
    invoke-virtual { v0, p0, p3 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 206
    sub-float/2addr p0, p2
    invoke-virtual { v0, p0, p1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 207
    invoke-virtual { v0 }, Landroid/graphics/Path;->close()V
  .line 208
    return-object v0
.end method

.method public static plain()I
  .registers 1
  .line 85
    invoke-static { }, Lcom/innioasis/ipp/Icons;->menuColor()I
    move-result v0
  .line 86
    if-nez v0, :L0
    const/4 v0, -1
  :L0
    return v0
.end method

.method public static ruler(Landroid/widget/HorizontalScrollView;Lcom/mediatek/view/FmView;F)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 404
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 406
    invoke-virtual { p0 }, Landroid/widget/HorizontalScrollView;->getWidth()I
    move-result v0
    if-gtz v0, :L1
    return-void
  :L1
  .line 407
    invoke-virtual { p1, p2 }, Lcom/mediatek/view/FmView;->setFrequency(F)I
    move-result p1
    const/4 p2, 0
    invoke-virtual { p0, p1, p2 }, Landroid/widget/HorizontalScrollView;->scrollTo(II)V
  :L2
  .line 410
    goto :L4
  :L3
  .line 408
    move-exception p0
  :L4
  .line 411
    return-void
  :L5
  .line 404
    return-void
.end method

.method public static screen(Lcom/mediatek/fm/databinding/ActivityFmmainBinding;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 241
    if-nez p0, :L0
    return-void
  :L0
  .line 246
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai:Landroid/widget/TextView;
    const/4 v2, -1
    const/4 v3, 0
    invoke-virtual { v0, v1, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 247
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai2:Landroid/widget/TextView;
    iget-object v2, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai:Landroid/widget/TextView;
  .line 248
    invoke-virtual { v2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
  .line 247
    invoke-virtual { v0, v1, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 250
    iget-object v0, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai:Landroid/widget/TextView;
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai2:Landroid/widget/TextView;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Fm;->unit(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .line 251
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeSelColor()I
    move-result v0
  .line 252
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai:Landroid/widget/TextView;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Fm;->outline(Landroid/widget/TextView;I)V
  .line 253
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai2:Landroid/widget/TextView;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Fm;->outline(Landroid/widget/TextView;I)V
  .line 258
    invoke-static { }, Lcom/innioasis/ipp/Fm;->back()I
    move-result v0
  .line 259
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->tuneFrequency:Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-virtual { v1, v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->setBackgroundColor(I)V
  .line 260
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->radioRuler:Landroid/widget/HorizontalScrollView;
    invoke-virtual { v1, v0 }, Landroid/widget/HorizontalScrollView;->setBackgroundColor(I)V
  .line 262
    iget-object p0, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainVolumeSeekbar:Landroid/widget/SeekBar;
    invoke-static { p0 }, Lcom/innioasis/ipp/Fm;->volume(Landroid/widget/SeekBar;)V
  :L1
  .line 265
    goto :L3
  :L2
  .line 263
    move-exception p0
  :L3
  .line 266
    return-void
.end method

.method public static small()I
  .registers 1
  .line 95
    invoke-static { }, Lcom/innioasis/ipp/Fm;->plain()I
    move-result v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Fm;->faint(I)I
    move-result v0
    return v0
.end method

.method private static unit(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .registers 8
  .line 282
    if-eqz p0, :L9
    if-nez p1, :L0
    goto/16 :L9
  :L0
  .line 283
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
    const-string v1, ""
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 284
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L3
    const-string v0, "0"
  :L3
  .line 285
    invoke-virtual { p1 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v2
    if-nez v2, :L4
    goto :L5
  :L4
    invoke-virtual { p1 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
  :L5
  .line 286
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L6
    return-void
  :L6
  .line 288
    new-instance v2, Landroid/graphics/Rect;
    invoke-direct { v2 }, Landroid/graphics/Rect;-><init>()V
  .line 289
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v3
    const/4 v4, 0
    invoke-virtual { p0, v0, v4, v3, v2 }, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V
  .line 290
    iget p0, v2, Landroid/graphics/Rect;->top:I
    neg-int p0, p0
    int-to-float p0, p0
    const/high16 v0, 0x40000000
    div-float/2addr p0, v0
  .line 291
    const/4 v0, 0
    cmpg-float v0, p0, v0
    if-gtz v0, :L7
    return-void
  :L7
  .line 295
    new-instance v0, Landroid/graphics/Paint;
    invoke-virtual { p1 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v2
    invoke-direct { v0, v2 }, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V
  .line 296
    const/high16 v2, 0x42C80000
    invoke-virtual { v0, v2 }, Landroid/graphics/Paint;->setTextSize(F)V
  .line 297
    new-instance v3, Landroid/graphics/Rect;
    invoke-direct { v3 }, Landroid/graphics/Rect;-><init>()V
  .line 298
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v5
    invoke-virtual { v0, v1, v4, v5, v3 }, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V
  .line 299
    iget v0, v3, Landroid/graphics/Rect;->top:I
    if-ltz v0, :L8
    return-void
  :L8
  .line 300
    mul-float p0, p0, v2
    iget v0, v3, Landroid/graphics/Rect;->top:I
    neg-int v0, v0
    int-to-float v0, v0
    div-float/2addr p0, v0
    invoke-virtual { p1, v4, p0 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 301
    return-void
  :L9
  .line 282
    return-void
.end method

.method private static volume(Landroid/widget/SeekBar;)V
  .registers 6
  .line 381
    if-nez p0, :L0
    return-void
  :L0
  .line 382
    invoke-virtual { p0 }, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 383
    instance-of v1, v0, Landroid/graphics/drawable/LayerDrawable;
    if-nez v1, :L1
    return-void
  :L1
  .line 384
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;
    move-result-object v0
    check-cast v0, Landroid/graphics/drawable/LayerDrawable;
  .line 385
    const/high16 v1, 0x01020000
    invoke-virtual { v0, v1 }, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 386
    const v2, 16908301
    invoke-virtual { v0, v2 }, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
    move-result-object v2
  .line 387
    if-eqz v1, :L2
    invoke-static { }, Lcom/innioasis/ipp/Fm;->back()I
    move-result v3
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { v1, v3, v4 }, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  :L2
  .line 388
    if-eqz v2, :L3
    invoke-static { }, Lcom/innioasis/ipp/Fm;->now()I
    move-result v1
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { v2, v1, v3 }, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  :L3
  .line 389
    invoke-virtual { p0, v0 }, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 390
    return-void
.end method

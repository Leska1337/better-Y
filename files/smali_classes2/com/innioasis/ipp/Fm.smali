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
  .line 44
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static back()I
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  :L0
  .line 57
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 58
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  :L1
    const/high16 v1, 0xFF000000
    or-int/2addr v0, v1
    return v0
  :L2
  .line 61
    goto :L4
  :L3
  .line 59
    move-exception v0
  :L4
  .line 62
    const v0, -7564110
    return v0
.end method

.method public static diamond(Z)Landroid/graphics/Bitmap;
  .registers 5
  .line 107
    if-eqz p0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Fm;->now()I
    move-result v0
    goto :L1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Fm;->back()I
    move-result v0
  :L1
  .line 108
    invoke-static { }, Lcom/innioasis/ipp/Fm;->plain()I
    move-result v1
  .line 109
    if-eqz p0, :L2
    sget-object v2, Lcom/innioasis/ipp/Fm;->keptBm:Landroid/graphics/Bitmap;
    goto :L3
  :L2
    sget-object v2, Lcom/innioasis/ipp/Fm;->foundBm:Landroid/graphics/Bitmap;
  :L3
  .line 110
    if-eqz v2, :L8
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v3
    if-nez v3, :L8
  .line 111
    if-eqz p0, :L4
    sget v3, Lcom/innioasis/ipp/Fm;->keptColor:I
    goto :L5
  :L4
    sget v3, Lcom/innioasis/ipp/Fm;->foundColor:I
  :L5
    if-ne v3, v0, :L8
  .line 112
    if-eqz p0, :L6
    sget v3, Lcom/innioasis/ipp/Fm;->keptEdge:I
    goto :L7
  :L6
    sget v3, Lcom/innioasis/ipp/Fm;->foundEdge:I
  :L7
    if-ne v3, v1, :L8
    return-object v2
  :L8
  .line 113
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Fm;->draw(II)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 114
    if-nez v2, :L11
    if-eqz p0, :L9
    sget-object p0, Lcom/innioasis/ipp/Fm;->keptBm:Landroid/graphics/Bitmap;
    goto :L10
  :L9
    sget-object p0, Lcom/innioasis/ipp/Fm;->foundBm:Landroid/graphics/Bitmap;
  :L10
    return-object p0
  :L11
  .line 115
    if-eqz p0, :L12
    sput-object v2, Lcom/innioasis/ipp/Fm;->keptBm:Landroid/graphics/Bitmap;
    sput v0, Lcom/innioasis/ipp/Fm;->keptColor:I
    sput v1, Lcom/innioasis/ipp/Fm;->keptEdge:I
    goto :L13
  :L12
  .line 116
    sput-object v2, Lcom/innioasis/ipp/Fm;->foundBm:Landroid/graphics/Bitmap;
    sput v0, Lcom/innioasis/ipp/Fm;->foundColor:I
    sput v1, Lcom/innioasis/ipp/Fm;->foundEdge:I
  :L13
  .line 117
    return-object v2
.end method

.method private static draw(II)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L2 } :L3
  .registers 15
  .line 135
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Fm;->geometry()[I
    move-result-object v1
  .line 136
    if-nez v1, :L1
    return-object v0
  :L1
  .line 137
    const/4 v2, 0
    aget v2, v1, v2
    const/4 v3, 1
    aget v4, v1, v3
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v2, v4, v5 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 138
    new-instance v4, Landroid/graphics/Canvas;
    invoke-direct { v4, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 139
    const/4 v5, 2
    aget v5, v1, v5
    int-to-float v5, v5
    const/high16 v6, 0x3F000000
    sub-float/2addr v5, v6
    const/4 v7, 3
    aget v7, v1, v7
    int-to-float v7, v7
    sub-float/2addr v7, v6
  .line 140
    const/4 v6, 4
    aget v6, v1, v6
    int-to-float v6, v6
    const/high16 v8, 0x3FC00000
    add-float/2addr v6, v8
    const/4 v9, 5
    aget v1, v1, v9
    int-to-float v1, v1
    add-float/2addr v1, v8
  .line 141
    add-float v8, v5, v6
    const/high16 v9, 0x40000000
    div-float/2addr v8, v9
    add-float v10, v7, v1
    div-float/2addr v10, v9
  .line 142
    sub-float/2addr v6, v5
    div-float/2addr v6, v9
    sub-float/2addr v1, v7
    div-float/2addr v1, v9
  .line 144
    new-instance v5, Landroid/graphics/Paint;
    invoke-direct { v5 }, Landroid/graphics/Paint;-><init>()V
  .line 145
    invoke-virtual { v5, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 146
    invoke-virtual { v5, p0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 147
    sget-object p0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual { v5, p0 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 148
    invoke-static { v8, v10, v6, v1 }, Lcom/innioasis/ipp/Fm;->path(FFFF)Landroid/graphics/Path;
    move-result-object p0
    invoke-virtual { v4, p0, v5 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 153
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
  .line 154
    const/4 p0, 0
    cmpl-float p0, v3, p0
    if-lez p0, :L2
  .line 155
    invoke-virtual { v5, p1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 156
    sget-object p0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v5, p0 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 157
    invoke-virtual { v5, v9 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 158
    mul-float v6, v6, v3
    mul-float v1, v1, v3
    invoke-static { v8, v10, v6, v1 }, Lcom/innioasis/ipp/Fm;->path(FFFF)Landroid/graphics/Path;
    move-result-object p0
    invoke-virtual { v4, p0, v5 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  :L2
  .line 160
    return-object v2
  :L3
  .line 161
    move-exception p0
  .line 162
    return-object v0
.end method

.method public static faint(I)I
  .registers 2
  .line 84
    const v0, 16777215
    and-int/2addr p0, v0
    const/high16 v0, 0xCC000000
    or-int/2addr p0, v0
    return p0
.end method

.method private static geometry()[I
  .registers 13
  .line 178
    sget-object v0, Lcom/innioasis/ipp/Fm;->box:[I
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 179
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 180
    const/4 v1, 0
    if-nez v0, :L1
    return-object v1
  :L1
  .line 181
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v2, 2131230929
    invoke-static { v0, v2 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 182
    if-nez v0, :L2
    return-object v1
  :L2
  .line 183
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 184
    nop
  .line 185
    const/4 v4, -1
    const/4 v5, 0
    move v8, v2
    move v9, v3
    const/4 v6, -1
    const/4 v7, 0
  :L3
    if-ge v7, v3, :L11
  .line 186
    const/4 v10, 0
  :L4
    if-ge v10, v2, :L10
  .line 188
    invoke-virtual { v0, v10, v7 }, Landroid/graphics/Bitmap;->getPixel(II)I
    move-result v11
    ushr-int/lit8 v11, v11, 24
    const/16 v12, 192
    if-ge v11, v12, :L5
    goto :L9
  :L5
  .line 189
    if-ge v10, v8, :L6
    move v8, v10
  :L6
  .line 190
    if-le v10, v4, :L7
    move v4, v10
  :L7
  .line 191
    if-ge v7, v9, :L8
    move v9, v7
  :L8
  .line 192
    if-le v7, v6, :L9
    move v6, v7
  :L9
  .line 186
    add-int/lit8 v10, v10, 1
    goto :L4
  :L10
  .line 185
    add-int/lit8 v7, v7, 1
    goto :L3
  :L11
  .line 195
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->recycle()V
  .line 196
    if-gez v4, :L12
    return-object v1
  :L12
  .line 197
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
  .line 198
    return-object v0
.end method

.method public static ground(Landroid/graphics/Canvas;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 89
    if-nez p0, :L0
    return-void
  :L0
  .line 91
    invoke-static { }, Lcom/innioasis/ipp/Fm;->back()I
    move-result v0
    invoke-virtual { p0, v0 }, Landroid/graphics/Canvas;->drawColor(I)V
  :L1
  .line 94
    goto :L3
  :L2
  .line 92
    move-exception p0
  :L3
  .line 95
    return-void
.end method

.method public static now()I
  .registers 1
  .line 78
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result v0
  .line 79
    if-nez v0, :L0
    const/16 v0, -18944
  :L0
    return v0
.end method

.method private static outline(Landroid/widget/TextView;I)V
  .registers 8
  .line 273
    if-eqz p0, :L4
    if-nez p1, :L0
    goto/16 :L4
  :L0
  .line 274
    invoke-virtual { p0 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 275
    instance-of v1, v0, Landroid/view/ViewGroup;
    if-nez v1, :L1
    return-void
  :L1
  .line 276
    check-cast v0, Landroid/view/ViewGroup;
  .line 278
    new-instance v1, Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-direct { v1, v2 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 279
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
  .line 280
    instance-of v3, v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    if-eqz v3, :L2
  .line 283
    new-instance v3, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    invoke-direct { v3, v2 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    goto :L3
  :L2
  .line 284
    if-eqz v2, :L3
  .line 285
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;
    invoke-direct { v3, v2 }, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L3
  .line 287
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;
    move-result-object v2
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 288
    const/4 v2, 0
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTextSize()F
    move-result v3
    invoke-virtual { v1, v2, v3 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 289
    invoke-virtual { p0 }, Landroid/widget/TextView;->getIncludeFontPadding()Z
    move-result v2
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 290
    invoke-virtual { p0 }, Landroid/widget/TextView;->getGravity()I
    move-result v2
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 291
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingLeft()I
    move-result v2
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingTop()I
    move-result v3
  .line 292
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingRight()I
    move-result v4
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingBottom()I
    move-result v5
  .line 291
    invoke-virtual { v1, v2, v3, v4, v5 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 293
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v2
    invoke-virtual { v1, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 294
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 295
    invoke-virtual { v1 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p1
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { p1, v2 }, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 296
    invoke-virtual { v1 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p1
    const/high16 v2, 0x40000000
    invoke-virtual { p1, v2 }, Landroid/text/TextPaint;->setStrokeWidth(F)V
  .line 297
    invoke-virtual { v1 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p1
    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;
    invoke-virtual { p1, v2 }, Landroid/text/TextPaint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V
  .line 298
    invoke-virtual { v0, p0 }, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result p1
    invoke-virtual { v0, v1, p1 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V
  .line 299
    new-instance p1, Lcom/innioasis/ipp/Fm$Echo;
    invoke-direct { p1, v1 }, Lcom/innioasis/ipp/Fm$Echo;-><init>(Landroid/widget/TextView;)V
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V
  .line 300
    return-void
  :L4
  .line 273
    return-void
.end method

.method private static path(FFFF)Landroid/graphics/Path;
  .registers 6
  .line 167
    new-instance v0, Landroid/graphics/Path;
    invoke-direct { v0 }, Landroid/graphics/Path;-><init>()V
  .line 168
    sub-float v1, p1, p3
    invoke-virtual { v0, p0, v1 }, Landroid/graphics/Path;->moveTo(FF)V
  .line 169
    add-float v1, p0, p2
    invoke-virtual { v0, v1, p1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 170
    add-float/2addr p3, p1
    invoke-virtual { v0, p0, p3 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 171
    sub-float/2addr p0, p2
    invoke-virtual { v0, p0, p1 }, Landroid/graphics/Path;->lineTo(FF)V
  .line 172
    invoke-virtual { v0 }, Landroid/graphics/Path;->close()V
  .line 173
    return-object v0
.end method

.method public static plain()I
  .registers 1
  .line 67
    invoke-static { }, Lcom/innioasis/ipp/Icons;->menuColor()I
    move-result v0
  .line 68
    if-nez v0, :L0
    const/4 v0, -1
  :L0
    return v0
.end method

.method public static ruler(Landroid/widget/HorizontalScrollView;Lcom/mediatek/view/FmView;F)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 349
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 351
    invoke-virtual { p0 }, Landroid/widget/HorizontalScrollView;->getWidth()I
    move-result v0
    if-gtz v0, :L1
    return-void
  :L1
  .line 352
    invoke-virtual { p1, p2 }, Lcom/mediatek/view/FmView;->setFrequency(F)I
    move-result p1
    const/4 p2, 0
    invoke-virtual { p0, p1, p2 }, Landroid/widget/HorizontalScrollView;->scrollTo(II)V
  :L2
  .line 355
    goto :L4
  :L3
  .line 353
    move-exception p0
  :L4
  .line 356
    return-void
  :L5
  .line 349
    return-void
.end method

.method public static screen(Lcom/mediatek/fm/databinding/ActivityFmmainBinding;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 206
    if-nez p0, :L0
    return-void
  :L0
  .line 211
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai:Landroid/widget/TextView;
    const/4 v2, -1
    const/4 v3, 0
    invoke-virtual { v0, v1, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 212
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai2:Landroid/widget/TextView;
    iget-object v2, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai:Landroid/widget/TextView;
  .line 213
    invoke-virtual { v2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
  .line 212
    invoke-virtual { v0, v1, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 215
    iget-object v0, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai:Landroid/widget/TextView;
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai2:Landroid/widget/TextView;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Fm;->unit(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .line 216
    invoke-static { }, Lcom/innioasis/ipp/Icons;->themeSelColor()I
    move-result v0
  .line 217
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai:Landroid/widget/TextView;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Fm;->outline(Landroid/widget/TextView;I)V
  .line 218
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainDiantai2:Landroid/widget/TextView;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Fm;->outline(Landroid/widget/TextView;I)V
  .line 223
    invoke-static { }, Lcom/innioasis/ipp/Fm;->back()I
    move-result v0
  .line 224
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->tuneFrequency:Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-virtual { v1, v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->setBackgroundColor(I)V
  .line 225
    iget-object v1, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->radioRuler:Landroid/widget/HorizontalScrollView;
    invoke-virtual { v1, v0 }, Landroid/widget/HorizontalScrollView;->setBackgroundColor(I)V
  .line 227
    iget-object p0, p0, Lcom/mediatek/fm/databinding/ActivityFmmainBinding;->mainVolumeSeekbar:Landroid/widget/SeekBar;
    invoke-static { p0 }, Lcom/innioasis/ipp/Fm;->volume(Landroid/widget/SeekBar;)V
  :L1
  .line 230
    goto :L3
  :L2
  .line 228
    move-exception p0
  :L3
  .line 231
    return-void
.end method

.method public static small()I
  .registers 1
  .line 73
    invoke-static { }, Lcom/innioasis/ipp/Fm;->plain()I
    move-result v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Fm;->faint(I)I
    move-result v0
    return v0
.end method

.method private static unit(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .registers 8
  .line 243
    if-eqz p0, :L9
    if-nez p1, :L0
    goto/16 :L9
  :L0
  .line 244
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
  .line 245
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L3
    const-string v0, "0"
  :L3
  .line 246
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
  .line 247
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L6
    return-void
  :L6
  .line 249
    new-instance v2, Landroid/graphics/Rect;
    invoke-direct { v2 }, Landroid/graphics/Rect;-><init>()V
  .line 250
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v3
    const/4 v4, 0
    invoke-virtual { p0, v0, v4, v3, v2 }, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V
  .line 251
    iget p0, v2, Landroid/graphics/Rect;->top:I
    neg-int p0, p0
    int-to-float p0, p0
    const/high16 v0, 0x40000000
    div-float/2addr p0, v0
  .line 252
    const/4 v0, 0
    cmpg-float v0, p0, v0
    if-gtz v0, :L7
    return-void
  :L7
  .line 255
    new-instance v0, Landroid/graphics/Paint;
    invoke-virtual { p1 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v2
    invoke-direct { v0, v2 }, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V
  .line 256
    const/high16 v2, 0x42C80000
    invoke-virtual { v0, v2 }, Landroid/graphics/Paint;->setTextSize(F)V
  .line 257
    new-instance v3, Landroid/graphics/Rect;
    invoke-direct { v3 }, Landroid/graphics/Rect;-><init>()V
  .line 258
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v5
    invoke-virtual { v0, v1, v4, v5, v3 }, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V
  .line 259
    iget v0, v3, Landroid/graphics/Rect;->top:I
    if-ltz v0, :L8
    return-void
  :L8
  .line 260
    mul-float p0, p0, v2
    iget v0, v3, Landroid/graphics/Rect;->top:I
    neg-int v0, v0
    int-to-float v0, v0
    div-float/2addr p0, v0
    invoke-virtual { p1, v4, p0 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 261
    return-void
  :L9
  .line 243
    return-void
.end method

.method private static volume(Landroid/widget/SeekBar;)V
  .registers 6
  .line 331
    if-nez p0, :L0
    return-void
  :L0
  .line 332
    invoke-virtual { p0 }, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 333
    instance-of v1, v0, Landroid/graphics/drawable/LayerDrawable;
    if-nez v1, :L1
    return-void
  :L1
  .line 334
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;
    move-result-object v0
    check-cast v0, Landroid/graphics/drawable/LayerDrawable;
  .line 335
    const/high16 v1, 0x01020000
    invoke-virtual { v0, v1 }, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 336
    const v2, 16908301
    invoke-virtual { v0, v2 }, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
    move-result-object v2
  .line 337
    if-eqz v1, :L2
    invoke-static { }, Lcom/innioasis/ipp/Fm;->back()I
    move-result v3
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { v1, v3, v4 }, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  :L2
  .line 338
    if-eqz v2, :L3
    invoke-static { }, Lcom/innioasis/ipp/Fm;->now()I
    move-result v1
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { v2, v1, v3 }, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  :L3
  .line 339
    invoke-virtual { p0, v0 }, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 340
    return-void
.end method

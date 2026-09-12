.class public final Lcom/innioasis/ipp/Photos;
.super Ljava/lang/Object;
.source "Photos.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Photos$Rule;,
    Lcom/innioasis/ipp/Photos$Repaint;,
    Lcom/innioasis/ipp/Photos$Ends;
  }
.end annotation

.field private final static MENU_BG:I = -7564110

.field private final static PAD:I = 6

.field private final static PLATE_IDLE:F = 0.8F

.field private final static RULE_PX:I = 2

.field private final static SEE_THROUGH:F = 0.9F

.field private final static WHITE:I = -1

.field private static folder:Landroid/graphics/Bitmap;

.field private static folderBg:I

.field private static folderFg:I

.field private static folderFocus:Landroid/graphics/Bitmap;

.method private constructor <init>()V
  .registers 1
  .line 46
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Photos;->paintBar(Landroidx/recyclerview/widget/RecyclerView;)V
    return-void
.end method

.method public static bar(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 162
    if-nez p0, :L0
    return-void
  :L0
  .line 164
    new-instance v0, Lcom/innioasis/ipp/Photos$Rule;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Photos$Rule;-><init>()V
  .line 165
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setTag(Ljava/lang/Object;)V
  .line 166
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 167
    invoke-static { p0 }, Lcom/innioasis/ipp/Photos;->paintBar(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 168
    new-instance v0, Lcom/innioasis/ipp/Photos$Repaint;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Photos$Repaint;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 169
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 170
    invoke-static { v0 }, Lcom/innioasis/ipp/Theme;->watchMenuRows(Ljava/lang/Runnable;)V
  :L1
  .line 173
    goto :L3
  :L2
  .line 171
    move-exception p0
  :L3
  .line 174
    return-void
.end method

.method private static barColor()I
  .registers 3
  .line 211
    invoke-static { }, Lcom/innioasis/ipp/Photos;->menuBg()I
    move-result v0
  .line 212
    invoke-static { }, Lcom/innioasis/ipp/Theme;->menuRowsPainted()Z
    move-result v1
    if-eqz v1, :L0
    return v0
  :L0
  .line 213
    invoke-static { v0 }, Landroid/graphics/Color;->alpha(I)I
    move-result v1
    int-to-float v1, v1
    const v2, 1063675494
    mul-float v1, v1, v2
    float-to-int v1, v1
    shl-int/lit8 v1, v1, 24
    const v2, 16777215
    and-int/2addr v0, v2
    or-int/2addr v0, v1
    return v0
.end method

.method private static fit(Ljava/lang/Object;Landroid/view/View;Landroid/widget/TextView;)V
  .registers 7
  .line 337
    instance-of v0, p0, Lcom/chad/library/adapter/base/BaseQuickAdapter;
    if-nez v0, :L0
    return-void
  :L0
  .line 338
    check-cast p0, Lcom/chad/library/adapter/base/BaseQuickAdapter;
    invoke-virtual { p0 }, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;
    move-result-object p0
  .line 339
    if-eqz p0, :L8
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L1
    goto :L8
  :L1
  .line 340
    nop
  .line 341
    const/4 v0, 0
    const/4 v1, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L5
  .line 342
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Photos;->textOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
  .line 343
    if-nez v2, :L3
    goto :L4
  :L3
  .line 344
    invoke-virtual { p2 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    invoke-virtual { v3, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    invoke-static { v0, v2 }, Ljava/lang/Math;->max(FF)F
    move-result v0
  :L4
  .line 341
    add-int/lit8 v1, v1, 1
    goto :L2
  :L5
  .line 346
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p2
    invoke-virtual { p2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p2
    iget p2, p2, Landroid/util/DisplayMetrics;->widthPixels:I
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
    div-int/2addr p2, p0
  .line 347
    float-to-double v0, v0
    invoke-static { v0, v1 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v0
    double-to-int p0, v0
    add-int/lit8 p0, p0, 12
    invoke-static { p2, p0 }, Ljava/lang/Math;->min(II)I
    move-result p0
  .line 348
    invoke-virtual { p1 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 349
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v1, :L6
    return-void
  :L6
  .line 350
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 351
    sub-int/2addr p2, p0
    div-int/lit8 p2, p2, 2
  .line 352
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-ne v1, p0, :L7
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    if-ne v1, p2, :L7
    return-void
  :L7
  .line 353
    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 354
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 355
    invoke-virtual { v0, p2 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 356
    invoke-virtual { p1, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 357
    return-void
  :L8
  .line 339
    return-void
.end method

.method public static folder(Landroid/widget/ImageView;)V
  .catchall { :L0 .. :L8 } :L10
  .registers 6
  .line 85
    if-nez p0, :L0
    return-void
  :L0
  .line 87
    invoke-static { }, Lcom/innioasis/ipp/Photos;->menuBg()I
    move-result v0
  .line 88
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result v1
  .line 89
    if-nez v1, :L1
    return-void
  :L1
  .line 90
    sget-object v2, Lcom/innioasis/ipp/Photos;->folder:Landroid/graphics/Bitmap;
    if-eqz v2, :L2
    sget v2, Lcom/innioasis/ipp/Photos;->folderBg:I
    if-ne v0, v2, :L2
    sget v2, Lcom/innioasis/ipp/Photos;->folderFg:I
    if-eq v1, v2, :L4
  :L2
  .line 91
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 1061997773
    invoke-static { v2, v0, v1, v3 }, Lcom/innioasis/ipp/Photos;->recolour(Landroid/content/res/Resources;IIF)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 92
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const/high16 v4, 0x3F800000
    invoke-static { v3, v0, v1, v4 }, Lcom/innioasis/ipp/Photos;->recolour(Landroid/content/res/Resources;IIF)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 93
    if-eqz v2, :L9
    if-nez v3, :L3
    goto :L9
  :L3
  .line 94
    sput-object v2, Lcom/innioasis/ipp/Photos;->folder:Landroid/graphics/Bitmap;
  .line 95
    sput-object v3, Lcom/innioasis/ipp/Photos;->folderFocus:Landroid/graphics/Bitmap;
  .line 96
    sput v0, Lcom/innioasis/ipp/Photos;->folderBg:I
  .line 97
    sput v1, Lcom/innioasis/ipp/Photos;->folderFg:I
  :L4
  .line 99
    nop
  .line 100
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 101
    instance-of v1, v0, Landroidx/cardview/widget/CardView;
    const/4 v2, 0
    if-eqz v1, :L5
  .line 102
    check-cast v0, Landroidx/cardview/widget/CardView;
    invoke-virtual { v0 }, Landroidx/cardview/widget/CardView;->getCardBackgroundColor()Landroid/content/res/ColorStateList;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/ColorStateList;->getDefaultColor()I
    move-result v0
    if-eqz v0, :L5
    const/4 v0, 1
    const/4 v2, 1
  :L5
  .line 104
    if-eqz v2, :L6
    sget-object v0, Lcom/innioasis/ipp/Photos;->folderFocus:Landroid/graphics/Bitmap;
    goto :L7
  :L6
    sget-object v0, Lcom/innioasis/ipp/Photos;->folder:Landroid/graphics/Bitmap;
  :L7
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L8
  .line 107
    goto :L11
  :L9
  .line 93
    return-void
  :L10
  .line 105
    move-exception p0
  :L11
  .line 108
    return-void
.end method

.method private static lum(I)I
  .registers 3
  .line 146
    shr-int/lit8 v0, p0, 16
    and-int/lit16 v0, v0, 255
    mul-int/lit16 v0, v0, 299
    shr-int/lit8 v1, p0, 8
    and-int/lit16 v1, v1, 255
    mul-int/lit16 v1, v1, 587
    add-int/2addr v0, v1
    and-int/lit16 p0, p0, 255
    mul-int/lit8 p0, p0, 114
    add-int/2addr v0, p0
    div-int/lit16 v0, v0, 1000
    return v0
.end method

.method private static menuBg()I
  .registers 1
  .line 57
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 58
    if-nez v0, :L0
    const v0, -7564110
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  :L1
    return v0
.end method

.method public static menuItem(Ljava/lang/Object;Landroid/widget/ImageView;Landroid/widget/TextView;Z)V
  .catchall { :L0 .. :L8 } :L9
  .registers 7
  .line 291
    if-eqz p1, :L11
    if-nez p2, :L0
    goto/16 :L11
  :L0
  .line 293
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { p2, v0 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 294
    invoke-virtual { p2 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
  .line 295
    if-eqz p3, :L1
    const v1, 2131100253
    goto :L2
  :L1
    const v1, 2131100267
  :L2
  .line 294
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 296
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1, p2, v0, p3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 297
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 299
    invoke-virtual { p2 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object p1
  .line 300
    instance-of v0, p1, Landroid/view/View;
    if-nez v0, :L3
    return-void
  :L3
  .line 301
    check-cast p1, Landroid/view/View;
  .line 302
    const-string v0, "ipp_flat"
    invoke-virtual { p1, v0 }, Landroid/view/View;->setTag(Ljava/lang/Object;)V
  .line 303
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 304
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 305
    const v1, 2131231051
    if-eqz p3, :L4
    const v2, 2131231051
    goto :L5
  :L4
    const/4 v2, 0
  :L5
  .line 304
    invoke-virtual { v0, p1, v2, p3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 306
    if-eqz p3, :L6
    invoke-virtual { p1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object p3
    if-nez p3, :L6
  .line 307
    invoke-virtual { p1, v1 }, Landroid/view/View;->setBackgroundResource(I)V
  :L6
  .line 309
    invoke-virtual { p1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object p3
  .line 310
    instance-of v0, p3, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :L7
  .line 311
    check-cast p3, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p3 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object p3
  .line 312
    if-eqz p3, :L7
    new-instance v0, Lcom/innioasis/ipp/Photos$Ends;
    invoke-direct { v0, p3 }, Lcom/innioasis/ipp/Photos$Ends;-><init>(Landroid/graphics/Bitmap;)V
    invoke-virtual { p1, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L7
  .line 314
    invoke-static { p1 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 315
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Photos;->fit(Ljava/lang/Object;Landroid/view/View;Landroid/widget/TextView;)V
  :L8
  .line 318
    goto :L10
  :L9
  .line 316
    move-exception p0
  :L10
  .line 319
    return-void
  :L11
  .line 291
    return-void
.end method

.method private static mix(IIF)I
  .registers 7
  .line 150
    shr-int/lit8 v0, p0, 16
    and-int/lit16 v0, v0, 255
    int-to-float v0, v0
    const/high16 v1, 0x3F800000
    sub-float/2addr v1, p2
    mul-float v0, v0, v1
    shr-int/lit8 v2, p1, 16
    and-int/lit16 v2, v2, 255
    int-to-float v2, v2
    mul-float v2, v2, p2
    add-float/2addr v0, v2
    float-to-int v0, v0
  .line 151
    shr-int/lit8 v2, p0, 8
    and-int/lit16 v2, v2, 255
    int-to-float v2, v2
    mul-float v2, v2, v1
    shr-int/lit8 v3, p1, 8
    and-int/lit16 v3, v3, 255
    int-to-float v3, v3
    mul-float v3, v3, p2
    add-float/2addr v2, v3
    float-to-int v2, v2
  .line 152
    and-int/lit16 p0, p0, 255
    int-to-float p0, p0
    mul-float p0, p0, v1
    and-int/lit16 p1, p1, 255
    int-to-float p1, p1
    mul-float p1, p1, p2
    add-float/2addr p0, p1
    float-to-int p0, p0
  .line 153
    shl-int/lit8 p1, v0, 16
    shl-int/lit8 p2, v2, 8
    or-int/2addr p1, p2
    or-int/2addr p0, p1
    return p0
.end method

.method public static name(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 63
    if-nez p0, :L0
    return-void
  :L0
  .line 65
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v1, -1
    const/4 v2, 0
    invoke-virtual { v0, p0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L1
  .line 68
    goto :L3
  :L2
  .line 66
    move-exception p0
  :L3
  .line 69
    return-void
.end method

.method private static paintBar(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 6
  .line 183
    invoke-static { }, Lcom/innioasis/ipp/Photos;->barColor()I
    move-result v0
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setBackgroundColor(I)V
  .line 184
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getTag()Ljava/lang/Object;
    move-result-object v0
  .line 185
    instance-of v1, v0, Lcom/innioasis/ipp/Photos$Rule;
    if-eqz v1, :L0
  .line 186
    new-instance v1, Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-direct { v1, v2 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 187
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v3, -1
    const/4 v4, 0
    invoke-virtual { v2, v1, v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 188
    check-cast v0, Lcom/innioasis/ipp/Photos$Rule;
    iget-object v0, v0, Lcom/innioasis/ipp/Photos$Rule;->paint:Landroid/graphics/Paint;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 189
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  :L0
  .line 191
    return-void
.end method

.method private static recolour(Landroid/content/res/Resources;IIF)Landroid/graphics/Bitmap;
  .registers 18
  .line 117
    const v0, 2131230932
    move-object v1, p0
    invoke-static { p0, v0 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 118
    const/4 v9, 0
    if-nez v0, :L0
    return-object v9
  :L0
  .line 119
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v10
  .line 120
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v11
  .line 121
    mul-int v12, v10, v11
    new-array v13, v12, [I
  .line 122
    const/4 v3, 0
    const/4 v5, 0
    const/4 v6, 0
    move-object v1, v0
    move-object v2, v13
    move v4, v10
    move v7, v10
    move v8, v11
    invoke-virtual/range { v1 .. v8 }, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V
  .line 123
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->recycle()V
  .line 124
    nop
  .line 125
    nop
  .line 126
    const/4 v0, 0
    const/16 v1, 255
    const/4 v2, 0
    const/4 v3, 0
  :L1
    if-ge v2, v12, :L5
  .line 127
    aget v4, v13, v2
    ushr-int/lit8 v5, v4, 24
    const/16 v6, 128
    if-ge v5, v6, :L2
    goto :L4
  :L2
  .line 128
    invoke-static { v4 }, Lcom/innioasis/ipp/Photos;->lum(I)I
    move-result v4
  .line 129
    if-ge v4, v1, :L3
    move v1, v4
  :L3
  .line 130
    if-le v4, v3, :L4
    move v3, v4
  :L4
  .line 126
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 132
    if-gt v3, v1, :L6
    return-object v9
  :L6
  .line 133
    nop
  :L7
    if-ge v0, v12, :L12
  .line 134
    aget v2, v13, v0
    ushr-int/lit8 v4, v2, 24
  .line 135
    if-nez v4, :L8
    move v5, p1
    move/from16 v6, p2
    goto :L11
  :L8
  .line 136
    invoke-static { v2 }, Lcom/innioasis/ipp/Photos;->lum(I)I
    move-result v2
    sub-int/2addr v2, v1
    int-to-float v2, v2
    sub-int v5, v3, v1
    int-to-float v5, v5
    div-float/2addr v2, v5
  .line 137
    const/4 v5, 0
    cmpg-float v6, v2, v5
    if-gez v6, :L9
    const/4 v2, 0
  :L9
  .line 138
    const/high16 v5, 0x3F800000
    cmpl-float v6, v2, v5
    if-lez v6, :L10
    const/high16 v2, 0x3F800000
  :L10
  .line 139
    int-to-float v4, v4
    sub-float v5, v5, p3
    mul-float v5, v5, v2
    add-float v5, p3, v5
    mul-float v4, v4, v5
    float-to-int v4, v4
  .line 140
    shl-int/lit8 v4, v4, 24
    move v5, p1
    move/from16 v6, p2
    invoke-static { p1, v6, v2 }, Lcom/innioasis/ipp/Photos;->mix(IIF)I
    move-result v2
    or-int/2addr v2, v4
    aput v2, v13, v0
  :L11
  .line 133
    add-int/lit8 v0, v0, 1
    goto :L7
  :L12
  .line 142
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v13, v10, v11, v0 }, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    return-object v0
.end method

.method private static textOf(Ljava/lang/Object;)Ljava/lang/String;
  .registers 2
  .line 331
    instance-of v0, p0, Lcom/innioasis/y1/utils/PhotosDialog$SubItem;
    if-eqz v0, :L0
    check-cast p0, Lcom/innioasis/y1/utils/PhotosDialog$SubItem;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/PhotosDialog$SubItem;->getText()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 332
    instance-of v0, p0, Lcom/innioasis/y1/view/ThemeOptionsDialog$SubItem;
    if-eqz v0, :L1
    check-cast p0, Lcom/innioasis/y1/view/ThemeOptionsDialog$SubItem;
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ThemeOptionsDialog$SubItem;->getText()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 333
    const/4 p0, 0
    return-object p0
.end method

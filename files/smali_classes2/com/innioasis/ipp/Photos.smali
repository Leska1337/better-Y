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

.field private final static HAIR_ALPHA:I = 520093696

.field private final static MENU_BG:I = -7564110

.field private final static PAD:I = 6

.field private final static PLATE_IDLE:F = 0.8F

.field private final static POPUP_ENTRY_DIP:I = 10

.field private final static POPUP_RADIUS_DIP:I = 10

.field private final static RULE_PX:I = 2

.field private final static SEE_THROUGH:F = 0.9F

.field private final static WHITE:I = -1

.field private static folder:Landroid/graphics/Bitmap;

.field private static folderBg:I

.field private static folderFg:I

.field private static folderFocus:Landroid/graphics/Bitmap;

.method private constructor <init>()V
  .registers 1
  .line 49
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 1
  .line 47
    invoke-static { p0 }, Lcom/innioasis/ipp/Photos;->paintBar(Landroidx/recyclerview/widget/RecyclerView;)V
    return-void
.end method

.method public static bar(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L1 } :L7
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L7
  .registers 3
  .line 165
    if-nez p0, :L0
    return-void
  :L0
  .line 167
    new-instance v0, Lcom/innioasis/ipp/Photos$Rule;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Photos$Rule;-><init>()V
  .line 168
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setTag(Ljava/lang/Object;)V
  .line 169
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  .line 170
    invoke-static { p0 }, Lcom/innioasis/ipp/Photos;->paintBar(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 171
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 172
    instance-of v1, v0, Landroid/view/View;
  :L1
    if-eqz v1, :L5
  :L2
  .line 174
    check-cast v0, Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Photos;->shapePopup(Landroid/view/View;)V
  :L3
  .line 177
    goto :L5
  :L4
  .line 175
    move-exception v0
  :L5
  .line 179
    new-instance v0, Lcom/innioasis/ipp/Photos$Repaint;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Photos$Repaint;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 180
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 181
    invoke-static { v0 }, Lcom/innioasis/ipp/Theme;->watchMenuRows(Ljava/lang/Runnable;)V
  :L6
  .line 184
    goto :L8
  :L7
  .line 182
    move-exception p0
  :L8
  .line 185
    return-void
.end method

.method private static barColor()I
  .registers 3
  .line 345
    invoke-static { }, Lcom/innioasis/ipp/Photos;->menuBg()I
    move-result v0
  .line 346
    invoke-static { }, Lcom/innioasis/ipp/Theme;->menuRowsPainted()Z
    move-result v1
    if-eqz v1, :L0
    return v0
  :L0
  .line 347
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

.method private static entryWidth(Landroid/widget/TextView;)I
  .registers 3
  .line 322
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 323
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v1
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v0
  :L1
  .line 324
    float-to-double v0, v0
    invoke-static { v0, v1 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v0
    double-to-int v0, v0
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingLeft()I
    move-result v1
    add-int/2addr v0, v1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingRight()I
    move-result p0
    add-int/2addr v0, p0
    return v0
.end method

.method private static fit(Ljava/lang/Object;Landroid/view/View;Landroid/widget/TextView;)V
  .registers 7
  .line 476
    instance-of v0, p0, Lcom/chad/library/adapter/base/BaseQuickAdapter;
    if-nez v0, :L0
    return-void
  :L0
  .line 477
    check-cast p0, Lcom/chad/library/adapter/base/BaseQuickAdapter;
    invoke-virtual { p0 }, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;
    move-result-object p0
  .line 478
    if-eqz p0, :L8
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L1
    goto :L8
  :L1
  .line 479
    nop
  .line 480
    const/4 v0, 0
    const/4 v1, 0
  :L2
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L5
  .line 481
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Photos;->textOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
  .line 482
    if-nez v2, :L3
    goto :L4
  :L3
  .line 483
    invoke-virtual { p2 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    invoke-virtual { v3, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    invoke-static { v0, v2 }, Ljava/lang/Math;->max(FF)F
    move-result v0
  :L4
  .line 480
    add-int/lit8 v1, v1, 1
    goto :L2
  :L5
  .line 485
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p2
    invoke-virtual { p2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p2
    iget p2, p2, Landroid/util/DisplayMetrics;->widthPixels:I
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
    div-int/2addr p2, p0
  .line 486
    float-to-double v0, v0
    invoke-static { v0, v1 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v0
    double-to-int p0, v0
    add-int/lit8 p0, p0, 12
    invoke-static { p2, p0 }, Ljava/lang/Math;->min(II)I
    move-result p0
  .line 487
    invoke-virtual { p1 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 488
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v1, :L6
    return-void
  :L6
  .line 489
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 490
    sub-int/2addr p2, p0
    div-int/lit8 p2, p2, 2
  .line 491
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-ne v1, p0, :L7
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    if-ne v1, p2, :L7
    return-void
  :L7
  .line 492
    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 493
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 494
    invoke-virtual { v0, p2 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 495
    invoke-virtual { p1, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 496
    return-void
  :L8
  .line 478
    return-void
.end method

.method public static folder(Landroid/widget/ImageView;)V
  .catchall { :L0 .. :L8 } :L10
  .registers 6
  .line 88
    if-nez p0, :L0
    return-void
  :L0
  .line 90
    invoke-static { }, Lcom/innioasis/ipp/Photos;->menuBg()I
    move-result v0
  .line 91
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result v1
  .line 92
    if-nez v1, :L1
    return-void
  :L1
  .line 93
    sget-object v2, Lcom/innioasis/ipp/Photos;->folder:Landroid/graphics/Bitmap;
    if-eqz v2, :L2
    sget v2, Lcom/innioasis/ipp/Photos;->folderBg:I
    if-ne v0, v2, :L2
    sget v2, Lcom/innioasis/ipp/Photos;->folderFg:I
    if-eq v1, v2, :L4
  :L2
  .line 94
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 1061997773
    invoke-static { v2, v0, v1, v3 }, Lcom/innioasis/ipp/Photos;->recolour(Landroid/content/res/Resources;IIF)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 95
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const/high16 v4, 0x3F800000
    invoke-static { v3, v0, v1, v4 }, Lcom/innioasis/ipp/Photos;->recolour(Landroid/content/res/Resources;IIF)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 96
    if-eqz v2, :L9
    if-nez v3, :L3
    goto :L9
  :L3
  .line 97
    sput-object v2, Lcom/innioasis/ipp/Photos;->folder:Landroid/graphics/Bitmap;
  .line 98
    sput-object v3, Lcom/innioasis/ipp/Photos;->folderFocus:Landroid/graphics/Bitmap;
  .line 99
    sput v0, Lcom/innioasis/ipp/Photos;->folderBg:I
  .line 100
    sput v1, Lcom/innioasis/ipp/Photos;->folderFg:I
  :L4
  .line 102
    nop
  .line 103
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  .line 104
    instance-of v1, v0, Landroidx/cardview/widget/CardView;
    const/4 v2, 0
    if-eqz v1, :L5
  .line 105
    check-cast v0, Landroidx/cardview/widget/CardView;
    invoke-virtual { v0 }, Landroidx/cardview/widget/CardView;->getCardBackgroundColor()Landroid/content/res/ColorStateList;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/ColorStateList;->getDefaultColor()I
    move-result v0
    if-eqz v0, :L5
    const/4 v0, 1
    const/4 v2, 1
  :L5
  .line 107
    if-eqz v2, :L6
    sget-object v0, Lcom/innioasis/ipp/Photos;->folderFocus:Landroid/graphics/Bitmap;
    goto :L7
  :L6
    sget-object v0, Lcom/innioasis/ipp/Photos;->folder:Landroid/graphics/Bitmap;
  :L7
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L8
  .line 110
    goto :L11
  :L9
  .line 96
    return-void
  :L10
  .line 108
    move-exception p0
  :L11
  .line 111
    return-void
.end method

.method private static highlight(Landroid/view/View;Z)V
  .registers 5
  .line 445
    const-string v0, "ipp_flat"
    invoke-virtual { p0, v0 }, Landroid/view/View;->setTag(Ljava/lang/Object;)V
  .line 446
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 447
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 448
    const v1, 2131231051
    if-eqz p1, :L0
    const v2, 2131231051
    goto :L1
  :L0
    const/4 v2, 0
  :L1
  .line 447
    invoke-virtual { v0, p0, v2, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 449
    if-eqz p1, :L2
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object p1
    if-nez p1, :L2
  .line 450
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundResource(I)V
  :L2
  .line 452
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object p1
  .line 453
    instance-of v0, p1, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :L3
  .line 454
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p1 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object p1
  .line 455
    if-eqz p1, :L3
    new-instance v0, Lcom/innioasis/ipp/Photos$Ends;
    invoke-direct { v0, p1 }, Lcom/innioasis/ipp/Photos$Ends;-><init>(Landroid/graphics/Bitmap;)V
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 457
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 458
    return-void
.end method

.method private static lum(I)I
  .registers 3
  .line 149
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
  .line 60
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 61
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
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 425
    if-eqz p1, :L7
    if-nez p2, :L0
    goto :L7
  :L0
  .line 427
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { p2, v0 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 428
    invoke-virtual { p2 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
  .line 429
    if-eqz p3, :L1
    const v1, 2131100253
    goto :L2
  :L1
    const v1, 2131100267
  :L2
  .line 428
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 430
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1, p2, v0, p3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 431
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 433
    invoke-virtual { p2 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object p1
  .line 434
    instance-of v0, p1, Landroid/view/View;
    if-nez v0, :L3
    return-void
  :L3
  .line 435
    check-cast p1, Landroid/view/View;
  .line 436
    invoke-static { p1, p3 }, Lcom/innioasis/ipp/Photos;->highlight(Landroid/view/View;Z)V
  .line 437
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Photos;->fit(Ljava/lang/Object;Landroid/view/View;Landroid/widget/TextView;)V
  :L4
  .line 440
    goto :L6
  :L5
  .line 438
    move-exception p0
  :L6
  .line 441
    return-void
  :L7
  .line 425
    return-void
.end method

.method private static mix(IIF)I
  .registers 7
  .line 153
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
  .line 154
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
  .line 155
    and-int/lit16 p0, p0, 255
    int-to-float p0, p0
    mul-float p0, p0, v1
    and-int/lit16 p1, p1, 255
    int-to-float p1, p1
    mul-float p1, p1, p2
    add-float/2addr p0, p1
    float-to-int p0, p0
  .line 156
    shl-int/lit8 p1, v0, 16
    shl-int/lit8 p2, v2, 8
    or-int/2addr p1, p2
    or-int/2addr p0, p1
    return p0
.end method

.method public static name(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 66
    if-nez p0, :L0
    return-void
  :L0
  .line 68
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v1, -1
    const/4 v2, 0
    invoke-virtual { v0, p0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L1
  .line 71
    goto :L3
  :L2
  .line 69
    move-exception p0
  :L3
  .line 72
    return-void
.end method

.method private static paintBar(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 194
    invoke-static { }, Lcom/innioasis/ipp/Photos;->barColor()I
    move-result v0
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setBackgroundColor(I)V
  .line 195
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getTag()Ljava/lang/Object;
    move-result-object v0
  .line 196
    instance-of v1, v0, Lcom/innioasis/ipp/Photos$Rule;
    if-eqz v1, :L0
  .line 197
    check-cast v0, Lcom/innioasis/ipp/Photos$Rule;
    iget-object v0, v0, Lcom/innioasis/ipp/Photos$Rule;->paint:Landroid/graphics/Paint;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Photos;->ruleColor(Landroid/content/Context;)I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 198
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V
  :L0
  .line 200
    return-void
.end method

.method private static popupEntry(Landroid/widget/TextView;Z)V
  .registers 4
  .line 314
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
  .line 315
    if-eqz p1, :L0
    const v1, 2131100253
    goto :L1
  :L0
    const v1, 2131100267
  :L1
  .line 314
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 316
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1, p0, v0, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 317
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Photos;->highlight(Landroid/view/View;Z)V
  .line 318
    return-void
.end method

.method private static recolour(Landroid/content/res/Resources;IIF)Landroid/graphics/Bitmap;
  .registers 18
  .line 120
    const v0, 2131230932
    move-object v1, p0
    invoke-static { p0, v0 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 121
    const/4 v9, 0
    if-nez v0, :L0
    return-object v9
  :L0
  .line 122
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v10
  .line 123
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v11
  .line 124
    mul-int v12, v10, v11
    new-array v13, v12, [I
  .line 125
    const/4 v3, 0
    const/4 v5, 0
    const/4 v6, 0
    move-object v1, v0
    move-object v2, v13
    move v4, v10
    move v7, v10
    move v8, v11
    invoke-virtual/range { v1 .. v8 }, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V
  .line 126
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->recycle()V
  .line 127
    nop
  .line 128
    nop
  .line 129
    const/4 v0, 0
    const/16 v1, 255
    const/4 v2, 0
    const/4 v3, 0
  :L1
    if-ge v2, v12, :L5
  .line 130
    aget v4, v13, v2
    ushr-int/lit8 v5, v4, 24
    const/16 v6, 128
    if-ge v5, v6, :L2
    goto :L4
  :L2
  .line 131
    invoke-static { v4 }, Lcom/innioasis/ipp/Photos;->lum(I)I
    move-result v4
  .line 132
    if-ge v4, v1, :L3
    move v1, v4
  :L3
  .line 133
    if-le v4, v3, :L4
    move v3, v4
  :L4
  .line 129
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 135
    if-gt v3, v1, :L6
    return-object v9
  :L6
  .line 136
    nop
  :L7
    if-ge v0, v12, :L12
  .line 137
    aget v2, v13, v0
    ushr-int/lit8 v4, v2, 24
  .line 138
    if-nez v4, :L8
    move v5, p1
    move/from16 v6, p2
    goto :L11
  :L8
  .line 139
    invoke-static { v2 }, Lcom/innioasis/ipp/Photos;->lum(I)I
    move-result v2
    sub-int/2addr v2, v1
    int-to-float v2, v2
    sub-int v5, v3, v1
    int-to-float v5, v5
    div-float/2addr v2, v5
  .line 140
    const/4 v5, 0
    cmpg-float v6, v2, v5
    if-gez v6, :L9
    const/4 v2, 0
  :L9
  .line 141
    const/high16 v5, 0x3F800000
    cmpl-float v6, v2, v5
    if-lez v6, :L10
    const/high16 v2, 0x3F800000
  :L10
  .line 142
    int-to-float v4, v4
    sub-float v5, v5, p3
    mul-float v5, v5, v2
    add-float v5, p3, v5
    mul-float v4, v4, v5
    float-to-int v4, v4
  .line 143
    shl-int/lit8 v4, v4, 24
    move v5, p1
    move/from16 v6, p2
    invoke-static { p1, v6, v2 }, Lcom/innioasis/ipp/Photos;->mix(IIF)I
    move-result v2
    or-int/2addr v2, v4
    aput v2, v13, v0
  :L11
  .line 136
    add-int/lit8 v0, v0, 1
    goto :L7
  :L12
  .line 145
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v13, v10, v11, v0 }, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    return-object v0
.end method

.method private static ruleColor(Landroid/content/Context;)I
  .registers 4
  .line 204
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 205
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v1, -1
    const/4 v2, 0
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 206
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    return p0
.end method

.method private static shapeEntry(Landroid/widget/TextView;I)V
  .registers 4
  .line 283
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 284
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v1, :L0
  .line 285
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 286
    const/4 v1, 0
    invoke-virtual { v0, v1, v1, v1, v1 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V
  .line 287
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 288
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V
  .line 289
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L0
  .line 291
    invoke-virtual { p0, p1, p1, p1, p1 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 292
    const/16 p1, 17
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 293
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 294
    return-void
.end method

.method private static shapePopup(Landroid/view/View;)V
  .registers 10
  .line 236
    const v0, 2131362364
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 237
    const v1, 2131362001
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 238
    const v2, 2131362063
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 239
    instance-of v2, v0, Landroidx/cardview/widget/CardView;
    if-eqz v2, :L5
    instance-of v2, v1, Landroid/widget/TextView;
    if-eqz v2, :L5
    instance-of v2, p0, Landroid/widget/TextView;
    if-nez v2, :L0
    goto/16 :L5
  :L0
  .line 240
    check-cast v0, Landroidx/cardview/widget/CardView;
  .line 241
    check-cast v1, Landroid/widget/TextView;
  .line 242
    check-cast p0, Landroid/widget/TextView;
  .line 243
    invoke-virtual { v0 }, Landroidx/cardview/widget/CardView;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
  .line 244
    const/high16 v3, 0x41200000
    mul-float v2, v2, v3
    float-to-int v3, v2
  .line 245
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Photos;->shapeEntry(Landroid/widget/TextView;I)V
  .line 246
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Photos;->shapeEntry(Landroid/widget/TextView;I)V
  .line 247
    invoke-static { v1 }, Lcom/innioasis/ipp/Photos;->entryWidth(Landroid/widget/TextView;)I
    move-result v3
    invoke-static { p0 }, Lcom/innioasis/ipp/Photos;->entryWidth(Landroid/widget/TextView;)I
    move-result v4
    invoke-static { v3, v4 }, Ljava/lang/Math;->max(II)I
    move-result v3
  .line 248
    invoke-virtual { v1, v3 }, Landroid/widget/TextView;->setMinWidth(I)V
  .line 249
    invoke-virtual { p0, v3 }, Landroid/widget/TextView;->setMinWidth(I)V
  .line 251
    invoke-virtual { v1 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 252
    instance-of v3, p0, Landroid/view/ViewGroup;
    const/4 v4, 0
    if-eqz v3, :L4
  .line 253
    check-cast p0, Landroid/view/ViewGroup;
  .line 254
    invoke-virtual { v0 }, Landroidx/cardview/widget/CardView;->getContext()Landroid/content/Context;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Photos;->ruleColor(Landroid/content/Context;)I
    move-result v3
  .line 255
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v5 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 256
    invoke-static { }, Lcom/innioasis/ipp/Photos;->barColor()I
    move-result v6
    invoke-virtual { v5, v6 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 257
    invoke-virtual { v5, v2 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 258
    const/4 v6, 2
    invoke-virtual { v5, v6, v3 }, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
  .line 259
    invoke-virtual { p0, v5 }, Landroid/view/ViewGroup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 260
    const v5, 1050253722
    mul-float v5, v5, v2
    float-to-double v7, v5
    invoke-static { v7, v8 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v7
    double-to-int v5, v7
    add-int/2addr v5, v6
  .line 261
    invoke-virtual { p0, v5, v5, v5, v5 }, Landroid/view/ViewGroup;->setPadding(IIII)V
  .line 262
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result v1
    const/4 v5, 1
    add-int/2addr v1, v5
  .line 263
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v6
    const/4 v7, 0
    if-ge v1, v6, :L1
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object p0
    goto :L2
  :L1
    move-object p0, v7
  :L2
  .line 264
    if-eqz p0, :L4
    instance-of v1, p0, Landroid/widget/TextView;
    if-nez v1, :L4
  .line 265
    const v1, 16777215
    and-int/2addr v1, v3
    const/high16 v3, 0x1F000000
    or-int/2addr v1, v3
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 266
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
  .line 267
    if-eqz v1, :L3
  .line 268
    iput v5, v1, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 269
    invoke-virtual { p0, v1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L3
  .line 271
    invoke-virtual { p0, v4, v7 }, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V
  :L4
  .line 274
    invoke-virtual { v0, v4 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 275
    const/4 p0, 0
    invoke-virtual { v0, p0 }, Landroidx/cardview/widget/CardView;->setCardElevation(F)V
  .line 276
    invoke-virtual { v0, p0 }, Landroidx/cardview/widget/CardView;->setMaxCardElevation(F)V
  .line 277
    invoke-virtual { v0, v4 }, Landroidx/cardview/widget/CardView;->setUseCompatPadding(Z)V
  .line 278
    invoke-virtual { v0, v4 }, Landroidx/cardview/widget/CardView;->setPreventCornerOverlap(Z)V
  .line 279
    invoke-virtual { v0, v2 }, Landroidx/cardview/widget/CardView;->setRadius(F)V
  .line 280
    return-void
  :L5
  .line 239
    return-void
.end method

.method private static textOf(Ljava/lang/Object;)Ljava/lang/String;
  .registers 2
  .line 470
    instance-of v0, p0, Lcom/innioasis/y1/utils/PhotosDialog$SubItem;
    if-eqz v0, :L0
    check-cast p0, Lcom/innioasis/y1/utils/PhotosDialog$SubItem;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/PhotosDialog$SubItem;->getText()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 471
    instance-of v0, p0, Lcom/innioasis/y1/view/ThemeOptionsDialog$SubItem;
    if-eqz v0, :L1
    check-cast p0, Lcom/innioasis/y1/view/ThemeOptionsDialog$SubItem;
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ThemeOptionsDialog$SubItem;->getText()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 472
    const/4 p0, 0
    return-object p0
.end method

.method public static wallpaperPopup(Landroidx/cardview/widget/CardView;Landroid/widget/TextView;Landroid/widget/TextView;I)V
  .catchall { :L2 .. :L5 } :L6
  .registers 6
  .line 303
    if-eqz p1, :L8
    if-nez p2, :L0
    goto :L8
  :L0
  .line 305
    const/4 p0, 1
    const/4 v0, 0
    if-nez p3, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Photos;->popupEntry(Landroid/widget/TextView;Z)V
  .line 306
    if-eqz p3, :L3
    goto :L4
  :L3
    const/4 p0, 0
  :L4
    invoke-static { p2, p0 }, Lcom/innioasis/ipp/Photos;->popupEntry(Landroid/widget/TextView;Z)V
  :L5
  .line 309
    goto :L7
  :L6
  .line 307
    move-exception p0
  :L7
  .line 310
    return-void
  :L8
  .line 303
    return-void
.end method

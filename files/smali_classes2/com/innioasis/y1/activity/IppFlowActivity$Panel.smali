.class final Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
.super Landroid/view/View;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Panel"
.end annotation

.field private final static GAP:Ljava/lang/String; = "     "

.field private final static HEAD:I = 54

.field private final static IDLE:I = 1000

.field private final static LEAD:I = 38

.field private final static ROW:I = 26

.field private final static STEP:I = 2

.field private final static TICK:I = 40

.field private artist:Ljava/lang/String;

.field private final bar:Landroid/graphics/Paint;

.field private final bg:Landroid/graphics/Paint;

.field private fg:I

.field private fgSel:I

.field private first:I

.field private final head:Landroid/text/TextPaint;

.field private final hl:Landroid/view/View;

.field private lead:I

.field private final line:Landroid/graphics/Paint;

.field private nameX:F

.field private names:[Ljava/lang/String;

.field private nums:[Ljava/lang/String;

.field private offset:I

.field private sel:I

.field private song:[I

.field songs:Ljava/util/List;

.field private final sub:Landroid/text/TextPaint;

.field private final text:Landroid/text/TextPaint;

.field private final tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;

.field private title:Ljava/lang/String;

.method constructor <init>(Landroid/content/Context;)V
  .registers 7
  .line 425
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 401
    new-instance v0, Landroid/text/TextPaint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
  .line 402
    new-instance v2, Landroid/text/TextPaint;
    invoke-direct { v2, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
  .line 403
    new-instance v3, Landroid/text/TextPaint;
    invoke-direct { v3, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
  .line 404
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
  .line 405
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
  .line 406
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
  .line 407
    const-string v4, ""
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
  .line 408
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
  .line 415
    const/high16 v4, 0x41000000
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
  .line 421
    const/4 v4, -1
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  .line 422
    const/high16 v4, 0xFF000000
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
  .line 525
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Tick;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity$Panel;)V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
  .line 426
    const/high16 v4, 0x41900000
    invoke-virtual { v0, v4 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 427
    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v4, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v0, v4 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 428
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setFakeBoldText(Z)V
  .line 429
    const/high16 v0, 0x41700000
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 430
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 431
    const/high16 v0, 0x41800000
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 432
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 433
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
  .line 434
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->colours()V
  .line 435
    return-void
.end method

.method private colours()V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  :L0
  .line 440
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 441
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 442
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131100267
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v3
    const/4 v4, 0
    invoke-virtual { v2, v1, v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 443
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    iput v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  .line 444
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 445
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v3, 2131100253
    invoke-virtual { v0, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 444
    const/4 v3, 1
    invoke-virtual { v2, v1, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 446
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
  :L1
  .line 449
    goto :L3
  :L2
  .line 447
    move-exception v0
  :L3
  .line 450
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
    invoke-static { }, Lcom/innioasis/ipp/Photos;->menuBg()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 451
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 452
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    const v2, 16777215
    and-int/2addr v1, v2
    const/high16 v3, 0xB0000000
    or-int/2addr v1, v3
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 453
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    and-int/2addr v1, v2
    const/high16 v2, 0x50000000
    or-int/2addr v1, v2
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 454
    invoke-static { }, Lcom/innioasis/ipp/Theme;->menuSelectedColor()I
    move-result v0
  .line 455
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
    if-eqz v0, :L4
    goto :L5
  :L4
    const v0, -16714241
  :L5
    invoke-virtual { v1, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 456
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->highlight()V
  .line 457
    return-void
.end method

.method private rows()I
  .registers 3
  .line 558
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getHeight()I
    move-result v0
    add-int/lit8 v0, v0, -54
    div-int/lit8 v0, v0, 26
    const/4 v1, 1
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
    return v0
.end method

.method highlight()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 462
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Photos;->highlight(Landroid/view/View;Z)V
  :L1
  .line 465
    goto :L3
  :L2
  .line 463
    move-exception v0
  :L3
  .line 466
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 467
    return-void
.end method

.method move(I)V
  .registers 5
  .line 502
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-eqz v0, :L9
    array-length v0, v0
    if-nez v0, :L0
    goto :L9
  :L0
  .line 503
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L1
  .line 505
    add-int/2addr v0, p1
  .line 506
    if-ltz v0, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v2, v1
    if-ge v0, v2, :L2
    aget v1, v1, v0
    if-ltz v1, :L1
  :L2
  .line 507
    if-ltz v0, :L8
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length p1, p1
    if-lt v0, p1, :L3
    goto :L8
  :L3
  .line 508
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 509
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 511
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-lez v0, :L4
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    add-int/lit8 v2, v0, -1
    aget v1, v1, v2
    if-gez v1, :L4
    add-int/lit8 v1, v0, -1
    goto :L5
  :L4
    move v1, v0
  :L5
  .line 512
    iget v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    if-ge v1, v2, :L6
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L6
  .line 513
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v1, p1
    if-lt v0, v1, :L7
    sub-int/2addr v0, p1
    add-int/lit8 v0, v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L7
  .line 514
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 515
    return-void
  :L8
  .line 507
    return-void
  :L9
  .line 502
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 21
  .line 563
    move-object/from16 v0, p0
    move-object/from16 v7, p1
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getWidth()I
    move-result v8
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getHeight()I
    move-result v9
  .line 564
    const/4 v2, 0
    const/4 v3, 0
    int-to-float v10, v8
    int-to-float v11, v9
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
    move-object/from16 v1, p1
    move v4, v10
    move v5, v11
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 565
    const/high16 v5, 0x3F800000
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 566
    const/4 v12, 1
    sub-int/2addr v9, v12
    int-to-float v3, v9
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move v5, v11
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 567
    const/4 v3, 0
    const/high16 v4, 0x3F800000
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 568
    add-int/lit8 v9, v8, -1
    int-to-float v13, v9
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move v2, v13
    move v4, v10
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 569
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    add-int/lit8 v3, v8, -16
    int-to-float v10, v3
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v1, v2, v10, v3 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    const/high16 v2, 0x41B00000
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    const/high16 v11, 0x41000000
    invoke-virtual { v7, v1, v11, v2, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 571
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v1, v2, v10, v3 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    const/high16 v2, 0x422C0000
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    invoke-virtual { v7, v1, v11, v2, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 573
    const/high16 v2, 0x40C00000
    const/high16 v3, 0x424C0000
    add-int/lit8 v1, v8, -6
    int-to-float v4, v1
    const/high16 v5, 0x42500000
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move-object/from16 v1, p1
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 574
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-nez v1, :L0
    return-void
  :L0
  .line 575
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result v14
  .line 576
    const/4 v6, 0
  :L1
    if-ge v6, v14, :L12
    iget v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int v2, v1, v6
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    array-length v3, v3
    if-ge v2, v3, :L12
  .line 577
    add-int v5, v1, v6
  .line 578
    mul-int/lit8 v1, v6, 26
    add-int/lit8 v4, v1, 54
  .line 579
    iget v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ne v5, v1, :L2
    const/16 v16, 1
    goto :L3
  :L2
    const/16 v16, 0
  :L3
  .line 580
    if-eqz v16, :L5
  .line 581
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 582
    if-eqz v1, :L4
  .line 583
    add-int/lit8 v2, v4, 26
    invoke-virtual { v1, v12, v4, v9, v2 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 584
    invoke-virtual { v1, v7 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    move v15, v4
    move/from16 v18, v5
    move/from16 v17, v6
    goto :L6
  :L4
  .line 586
    const/high16 v2, 0x3F800000
    int-to-float v3, v4
    add-int/lit8 v1, v4, 26
    int-to-float v1, v1
    iget-object v12, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
    move/from16 v17, v1
    move-object/from16 v1, p1
    move v15, v4
    move v4, v13
    move/from16 v18, v5
    move/from16 v5, v17
    move/from16 v17, v6
    move-object v6, v12
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
    goto :L6
  :L5
  .line 580
    move v15, v4
    move/from16 v18, v5
    move/from16 v17, v6
  :L6
  .line 589
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    aget-object v1, v1, v18
  .line 590
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    aget-object v2, v2, v18
    if-nez v2, :L7
  .line 592
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v1, v2, v10, v3 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    add-int/lit8 v4, v15, 19
    int-to-float v2, v4
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    invoke-virtual { v7, v1, v11, v2, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 594
    goto/16 :L11
  :L7
  .line 596
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    if-eqz v16, :L8
    iget v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
    goto :L9
  :L8
    iget v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  :L9
    invoke-virtual { v2, v3 }, Landroid/text/TextPaint;->setColor(I)V
  .line 597
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    aget-object v2, v2, v18
    iget v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget-object v4, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    const-string v5, " "
    invoke-virtual { v4, v5 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v4
    sub-float/2addr v3, v4
    iget-object v4, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    aget-object v5, v5, v18
    invoke-virtual { v4, v5 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v4
    sub-float/2addr v3, v4
    add-int/lit8 v4, v15, 19
    int-to-float v4, v4
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v2, v3, v4, v5 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 598
    add-int/lit8 v2, v8, -8
    int-to-float v2, v2
    iget v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    sub-float v3, v2, v3
  .line 599
    if-eqz v16, :L10
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v5, v1 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v5
    cmpl-float v5, v5, v3
    if-lez v5, :L10
  .line 601
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v5, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v6, "     "
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v3, v5 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v3
  .line 602
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->save()I
  .line 603
    iget v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    int-to-float v6, v15
    add-int/lit8 v12, v15, 26
    int-to-float v12, v12
    invoke-virtual { v7, v5, v6, v2, v12 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 604
    iget v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    int-to-float v5, v5
    sub-float/2addr v2, v5
    iget-object v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v1, v2, v4, v5 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 605
    iget v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget v5, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    int-to-float v5, v5
    sub-float/2addr v2, v5
    add-float/2addr v2, v3
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v1, v2, v4, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 606
    invoke-virtual/range { p1 .. p1 }, Landroid/graphics/Canvas;->restore()V
  .line 607
    goto :L11
  :L10
  .line 609
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v1, v2, v3, v5 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    iget v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v1, v2, v4, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  :L11
  .line 576
    add-int/lit8 v6, v17, 1
    const/4 v12, 1
    goto/16 :L1
  :L12
  .line 612
    return-void
.end method

.method restart()V
  .registers 4
  .line 529
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 530
    const/16 v0, 38
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
  .line 531
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 532
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 40
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 533
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 534
    return-void
.end method

.method setSongs(Lcom/innioasis/ipp/Flow$Back;)V
  .registers 6
  .line 480
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 481
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->nums:[Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
  .line 482
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Back;->texts:[Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
  .line 483
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Back;->song:[I
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
  .line 484
    nop
  .line 485
    const/4 p1, 0
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nums:[Ljava/lang/String;
    array-length v3, v2
    if-ge v1, v3, :L2
  .line 486
    aget-object v2, v2, v1
    if-eqz v2, :L1
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v3, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    invoke-static { p1, v2 }, Ljava/lang/Math;->max(FF)F
    move-result p1
  :L1
  .line 485
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 488
    const/high16 v1, 0x41000000
    add-float/2addr p1, v1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    const-string v2, " "
    invoke-virtual { v1, v2 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v1
    add-float/2addr p1, v1
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
  .line 489
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 490
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 491
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    array-length v1, p1
    if-lez v1, :L3
    aget v1, p1, v0
    if-gez v1, :L3
    const/4 v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L3
  .line 492
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    array-length p1, p1
    if-lt v1, p1, :L4
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  :L4
  .line 493
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->restart()V
  .line 494
    return-void
.end method

.method show(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 3
  .line 470
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Item;->name:Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
  .line 471
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
  .line 472
    const/4 p1, 0
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 473
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
  .line 474
    const/4 p1, 0
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 475
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 476
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 477
    return-void
.end method

.method tick()V
  .registers 5
  .line 537
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->isShown()Z
    move-result v0
    if-eqz v0, :L6
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-eqz v0, :L6
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    array-length v0, v0
    if-lt v1, v0, :L0
    goto :L6
  :L0
  .line 538
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v0
    if-nez v0, :L1
  .line 539
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 1000
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 540
    return-void
  :L1
  .line 542
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    aget-object v0, v0, v1
  .line 543
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v1, v0 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v1
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getWidth()I
    move-result v2
    add-int/lit8 v2, v2, -8
    int-to-float v2, v2
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->nameX:F
    sub-float/2addr v2, v3
    cmpg-float v1, v1, v2
    if-gtz v1, :L2
    return-void
  :L2
  .line 544
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
    if-lez v1, :L3
  .line 545
    add-int/lit8 v1, v1, -1
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
    goto :L5
  :L3
  .line 547
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
    add-int/lit8 v1, v1, 2
    iput v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 548
    int-to-float v1, v1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, "     "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v0
    cmpl-float v0, v1, v0
    if-ltz v0, :L4
  .line 549
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->offset:I
  .line 550
    const/16 v0, 38
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->lead:I
  :L4
  .line 552
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  :L5
  .line 554
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick:Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
    const-wide/16 v1, 40
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 555
    return-void
  :L6
  .line 537
    return-void
.end method

.method track()I
  .registers 4
  .line 498
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->song:[I
    if-eqz v0, :L1
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    array-length v2, v0
    if-lt v1, v2, :L0
    goto :L1
  :L0
    aget v0, v0, v1
    goto :L2
  :L1
    const/4 v0, -1
  :L2
    return v0
.end method

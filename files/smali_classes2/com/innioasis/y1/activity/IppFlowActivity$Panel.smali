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

.field private final static HEAD:I = 54

.field private final static ROW:I = 26

.field private artist:Ljava/lang/String;

.field private final bar:Landroid/graphics/Paint;

.field private final bg:Landroid/graphics/Paint;

.field private fg:I

.field private fgSel:I

.field private first:I

.field private final head:Landroid/text/TextPaint;

.field private final hl:Landroid/view/View;

.field private final line:Landroid/graphics/Paint;

.field names:[Ljava/lang/String;

.field sel:I

.field songs:Ljava/util/List;

.field private final sub:Landroid/text/TextPaint;

.field private final text:Landroid/text/TextPaint;

.field private title:Ljava/lang/String;

.method constructor <init>(Landroid/content/Context;)V
  .registers 7
  .line 399
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 380
    new-instance v0, Landroid/text/TextPaint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
  .line 381
    new-instance v2, Landroid/text/TextPaint;
    invoke-direct { v2, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
  .line 382
    new-instance v3, Landroid/text/TextPaint;
    invoke-direct { v3, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
  .line 383
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
  .line 384
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
  .line 385
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
  .line 386
    const-string v4, ""
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
  .line 387
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
  .line 395
    const/4 v4, -1
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  .line 396
    const/high16 v4, 0xFF000000
    iput v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
  .line 400
    const/high16 v4, 0x41900000
    invoke-virtual { v0, v4 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 401
    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v4, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v0, v4 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 402
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setFakeBoldText(Z)V
  .line 403
    const/high16 v0, 0x41700000
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 404
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 405
    const/high16 v0, 0x41800000
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 406
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v3, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 407
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
  .line 408
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->colours()V
  .line 409
    return-void
.end method

.method private colours()V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  :L0
  .line 414
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 415
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, v0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 416
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131100267
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v3
    const/4 v4, 0
    invoke-virtual { v2, v1, v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 417
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    iput v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  .line 418
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 419
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v3, 2131100253
    invoke-virtual { v0, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 418
    const/4 v3, 1
    invoke-virtual { v2, v1, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 420
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
  :L1
  .line 423
    goto :L3
  :L2
  .line 421
    move-exception v0
  :L3
  .line 424
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
    invoke-static { }, Lcom/innioasis/ipp/Photos;->menuBg()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 425
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->head:Landroid/text/TextPaint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 426
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sub:Landroid/text/TextPaint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    const v2, 16777215
    and-int/2addr v1, v2
    const/high16 v3, 0xB0000000
    or-int/2addr v1, v3
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 427
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
    and-int/2addr v1, v2
    const/high16 v2, 0x50000000
    or-int/2addr v1, v2
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 428
    invoke-static { }, Lcom/innioasis/ipp/Theme;->menuSelectedColor()I
    move-result v0
  .line 429
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
    if-eqz v0, :L4
    goto :L5
  :L4
    const v0, -16714241
  :L5
    invoke-virtual { v1, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 430
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->highlight()V
  .line 431
    return-void
.end method

.method private rows()I
  .registers 3
  .line 469
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
  .line 436
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Photos;->highlight(Landroid/view/View;Z)V
  :L1
  .line 439
    goto :L3
  :L2
  .line 437
    move-exception v0
  :L3
  .line 440
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 441
    return-void
.end method

.method move(I)V
  .registers 4
  .line 460
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-eqz v0, :L3
    array-length v1, v0
    if-nez v1, :L0
    goto :L3
  :L0
  .line 461
    array-length v0, v0
    add-int/lit8 v0, v0, -1
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    add-int/2addr v1, p1
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    const/4 v0, 0
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 462
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result p1
  .line 463
    iget v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    if-ge v0, v1, :L1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L1
  .line 464
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int/2addr v1, p1
    if-lt v0, v1, :L2
    sub-int/2addr v0, p1
    add-int/lit8 v0, v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  :L2
  .line 465
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 466
    return-void
  :L3
  .line 460
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 22
  .line 474
    move-object/from16 v0, p0
    move-object/from16 v7, p1
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getWidth()I
    move-result v8
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->getHeight()I
    move-result v9
  .line 475
    const/4 v2, 0
    const/4 v3, 0
    int-to-float v10, v8
    int-to-float v11, v9
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bg:Landroid/graphics/Paint;
    move-object/from16 v1, p1
    move v4, v10
    move v5, v11
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 476
    const/high16 v5, 0x3F800000
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 477
    const/4 v12, 1
    sub-int/2addr v9, v12
    int-to-float v3, v9
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move v5, v11
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 478
    const/4 v3, 0
    const/high16 v4, 0x3F800000
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 479
    add-int/lit8 v9, v8, -1
    int-to-float v13, v9
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move v2, v13
    move v4, v10
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 480
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
  .line 482
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
  .line 484
    const/high16 v2, 0x40C00000
    const/high16 v3, 0x424C0000
    add-int/lit8 v8, v8, -6
    int-to-float v4, v8
    const/high16 v5, 0x42500000
    iget-object v6, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->line:Landroid/graphics/Paint;
    move-object/from16 v1, p1
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 485
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    if-nez v1, :L0
    return-void
  :L0
  .line 486
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->rows()I
    move-result v8
  .line 487
    const/4 v14, 0
    const/4 v15, 0
  :L1
    if-ge v15, v8, :L9
    iget v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
    add-int v2, v1, v15
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    array-length v3, v3
    if-ge v2, v3, :L9
  .line 488
    add-int v6, v1, v15
  .line 489
    mul-int/lit8 v1, v15, 26
    add-int/lit8 v5, v1, 54
  .line 490
    iget v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
    if-ne v6, v1, :L2
    const/16 v16, 1
    goto :L3
  :L2
    const/16 v16, 0
  :L3
  .line 491
    if-eqz v16, :L5
  .line 492
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->hl:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 493
    if-eqz v1, :L4
  .line 494
    add-int/lit8 v2, v5, 26
    invoke-virtual { v1, v12, v5, v9, v2 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 495
    invoke-virtual { v1, v7 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    move/from16 v19, v5
    move/from16 v18, v6
    goto :L6
  :L4
  .line 497
    const/high16 v2, 0x3F800000
    int-to-float v3, v5
    add-int/lit8 v1, v5, 26
    int-to-float v4, v1
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->bar:Landroid/graphics/Paint;
    move-object/from16 v17, v1
    move-object/from16 v1, p1
    move/from16 v18, v4
    move v4, v13
    move/from16 v19, v5
    move/from16 v5, v18
    move/from16 v18, v6
    move-object/from16 v6, v17
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
    goto :L6
  :L5
  .line 491
    move/from16 v19, v5
    move/from16 v18, v6
  :L6
  .line 500
    iget-object v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    if-eqz v16, :L7
    iget v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fgSel:I
    goto :L8
  :L7
    iget v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->fg:I
  :L8
    invoke-virtual { v1, v2 }, Landroid/text/TextPaint;->setColor(I)V
  .line 501
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    add-int/lit8 v6, v18, 1
    invoke-virtual { v1, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, ". "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
    aget-object v2, v2, v18
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
  .line 502
    iget-object v2, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v1, v2, v10, v3 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    add-int/lit8 v5, v19, 19
    int-to-float v2, v5
    iget-object v3, v0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->text:Landroid/text/TextPaint;
    invoke-virtual { v7, v1, v11, v2, v3 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 487
    add-int/lit8 v15, v15, 1
    goto/16 :L1
  :L9
  .line 505
    return-void
.end method

.method setSongs(Ljava/util/List;[Ljava/lang/String;)V
  .registers 3
  .line 454
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 455
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
  .line 456
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 457
    return-void
.end method

.method show(Lcom/innioasis/ipp/Flow$Item;)V
  .registers 3
  .line 444
    iget-object v0, p1, Lcom/innioasis/ipp/Flow$Item;->name:Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->title:Ljava/lang/String;
  .line 445
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->artist:Ljava/lang/String;
  .line 446
    const/4 p1, 0
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->songs:Ljava/util/List;
  .line 447
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->names:[Ljava/lang/String;
  .line 448
    const/4 p1, 0
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->sel:I
  .line 449
    iput p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->first:I
  .line 450
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->invalidate()V
  .line 451
    return-void
.end method

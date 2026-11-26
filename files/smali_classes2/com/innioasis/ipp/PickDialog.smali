.class public final Lcom/innioasis/ipp/PickDialog;
.super Lcom/innioasis/y1/base/BaseDialog;
.source "PickDialog.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/PickDialog$Go;,
    Lcom/innioasis/ipp/PickDialog$Look;,
    Lcom/innioasis/ipp/PickDialog$Repaint;,
    Lcom/innioasis/ipp/PickDialog$Measure;,
    Lcom/innioasis/ipp/PickDialog$Apply;
  }
.end annotation

.field private final static BOX:I = -7564110

.field private final static CORNER:F = 10.0F

.field private static boxOff:Landroid/graphics/Bitmap;

.field private static boxOn:Landroid/graphics/Bitmap;

.field private final activity:Landroid/app/Activity;

.field private final cats:[I

.field private col:Lcom/innioasis/ipp/Column;

.field private final go:Lcom/innioasis/ipp/PickDialog$Go;

.field private labels:[Landroid/widget/TextView;

.field private final names:[Ljava/lang/String;

.field private final none:Z

.field private okRow:I

.field private final okText:Ljava/lang/String;

.field private on:[Z

.field private repainting:Z

.field private rows:[Landroid/view/View;

.field private size:[J

.field private final sizes:Z

.field private final start:I

.field private ticks:[Landroid/widget/ImageView;

.field private final title:Ljava/lang/String;

.field private values:[Landroid/widget/TextView;

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[IZILcom/innioasis/ipp/PickDialog$Go;)V
  .registers 9
  .line 71
    const v0, 2131886360
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/base/BaseDialog;-><init>(Landroid/content/Context;I)V
  .line 72
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
  .line 73
    iput-object p2, p0, Lcom/innioasis/ipp/PickDialog;->title:Ljava/lang/String;
  .line 74
    iput-object p3, p0, Lcom/innioasis/ipp/PickDialog;->okText:Ljava/lang/String;
  .line 75
    iput-object p4, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
  .line 76
    iput-boolean p5, p0, Lcom/innioasis/ipp/PickDialog;->sizes:Z
  .line 77
    iput-object p7, p0, Lcom/innioasis/ipp/PickDialog;->go:Lcom/innioasis/ipp/PickDialog$Go;
  .line 78
    const/4 p1, 0
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog;->names:[Ljava/lang/String;
  .line 79
    iput p6, p0, Lcom/innioasis/ipp/PickDialog;->start:I
  .line 80
    const/4 p1, 0
    iput-boolean p1, p0, Lcom/innioasis/ipp/PickDialog;->none:Z
  .line 81
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[IZLcom/innioasis/ipp/PickDialog$Go;)V
  .registers 15
  .line 65
    const/4 v6, -1
    move-object v0, p0
    move-object v1, p1
    move-object v2, p2
    move-object v3, p3
    move-object v4, p4
    move v5, p5
    move-object v7, p6
    invoke-direct/range { v0 .. v7 }, Lcom/innioasis/ipp/PickDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[IZILcom/innioasis/ipp/PickDialog$Go;)V
  .line 66
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[I[Ljava/lang/String;ILcom/innioasis/ipp/PickDialog$Go;)V
  .registers 9
  .line 86
    const v0, 2131886360
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/base/BaseDialog;-><init>(Landroid/content/Context;I)V
  .line 87
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
  .line 88
    iput-object p2, p0, Lcom/innioasis/ipp/PickDialog;->title:Ljava/lang/String;
  .line 89
    iput-object p3, p0, Lcom/innioasis/ipp/PickDialog;->okText:Ljava/lang/String;
  .line 90
    iput-object p4, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
  .line 91
    const/4 p1, 0
    iput-boolean p1, p0, Lcom/innioasis/ipp/PickDialog;->sizes:Z
  .line 92
    iput-object p7, p0, Lcom/innioasis/ipp/PickDialog;->go:Lcom/innioasis/ipp/PickDialog$Go;
  .line 93
    iput-object p5, p0, Lcom/innioasis/ipp/PickDialog;->names:[Ljava/lang/String;
  .line 94
    iput p6, p0, Lcom/innioasis/ipp/PickDialog;->start:I
  .line 95
    const/4 p1, 1
    iput-boolean p1, p0, Lcom/innioasis/ipp/PickDialog;->none:Z
  .line 96
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/ipp/PickDialog;)Z
  .registers 1
  .line 31
    iget-boolean p0, p0, Lcom/innioasis/ipp/PickDialog;->repainting:Z
    return p0
.end method

.method static synthetic access$002(Lcom/innioasis/ipp/PickDialog;Z)Z
  .registers 2
  .line 31
    iput-boolean p1, p0, Lcom/innioasis/ipp/PickDialog;->repainting:Z
    return p1
.end method

.method static synthetic access$100(Lcom/innioasis/ipp/PickDialog;)V
  .registers 1
  .line 31
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog;->paintAll()V
    return-void
.end method

.method static synthetic access$200(Lcom/innioasis/ipp/PickDialog;I)V
  .registers 2
  .line 31
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/PickDialog;->paint(I)V
    return-void
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/PickDialog;)[I
  .registers 1
  .line 31
    iget-object p0, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
    return-object p0
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/PickDialog;)Landroid/app/Activity;
  .registers 1
  .line 31
    iget-object p0, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    return-object p0
.end method

.method static synthetic access$500(Lcom/innioasis/ipp/PickDialog;)[J
  .registers 1
  .line 31
    iget-object p0, p0, Lcom/innioasis/ipp/PickDialog;->size:[J
    return-object p0
.end method

.method private allOn()Z
  .registers 5
  .line 397
    nop
  .line 398
    const/4 v0, 1
    const/4 v1, 1
  :L0
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    array-length v3, v2
    if-ge v0, v3, :L1
    aget-boolean v2, v2, v0
    and-int/2addr v1, v2
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 399
    return v1
.end method

.method public static box(Z)Landroid/graphics/Bitmap;
  .registers 9
  .line 324
    sget-object v0, Lcom/innioasis/ipp/PickDialog;->boxOff:Landroid/graphics/Bitmap;
    if-nez v0, :L0
  .line 325
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->frame()Landroid/graphics/Bitmap;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/PickDialog;->boxOff:Landroid/graphics/Bitmap;
  .line 326
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->frame()Landroid/graphics/Bitmap;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/PickDialog;->boxOn:Landroid/graphics/Bitmap;
  .line 327
    new-instance v0, Landroid/graphics/Canvas;
    sget-object v1, Lcom/innioasis/ipp/PickDialog;->boxOn:Landroid/graphics/Bitmap;
    invoke-direct { v0, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 328
    new-instance v7, Landroid/graphics/Paint;
    const/4 v1, 1
    invoke-direct { v7, v1 }, Landroid/graphics/Paint;-><init>(I)V
  .line 329
    const/4 v1, -1
    invoke-virtual { v7, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 330
    const/high16 v1, 0x40000000
    invoke-virtual { v7, v1 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 331
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v7, v1 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 332
    const/high16 v2, 0x40800000
    const/high16 v3, 0x41080000
    const/high16 v4, 0x40E00000
    const/high16 v5, 0x41380000
    move-object v1, v0
    move-object v6, v7
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
  .line 333
    const/high16 v2, 0x40E00000
    const/high16 v3, 0x41380000
    const/high16 v4, 0x41480000
    const/high16 v5, 0x40900000
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
  :L0
  .line 335
    if-eqz p0, :L1
    sget-object p0, Lcom/innioasis/ipp/PickDialog;->boxOn:Landroid/graphics/Bitmap;
    goto :L2
  :L1
    sget-object p0, Lcom/innioasis/ipp/PickDialog;->boxOff:Landroid/graphics/Bitmap;
  :L2
    return-object p0
.end method

.method private button(ILjava/lang/String;)Landroid/view/View;
  .registers 6
  .line 256
    new-instance v0, Landroid/widget/TextView;
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 257
    const-string v1, "ipp_flat"
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V
  .line 258
    const/high16 v1, 0x41700000
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 259
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->font()Landroid/graphics/Typeface;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 260
    const/16 v1, 17
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 261
    const/4 v1, 6
    const/4 v2, 4
    invoke-virtual { v0, v1, v2, v1, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 262
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 263
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 264
    iget-object p2, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aput-object v0, p2, p1
  .line 265
    iget-object p2, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aput-object v0, p2, p1
  .line 266
    return-object v0
.end method

.method private close()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 432
    invoke-virtual { p0 }, Lcom/innioasis/ipp/PickDialog;->getOnBack()Lkotlin/jvm/functions/Function0;
    move-result-object v0
  .line 433
    if-eqz v0, :L1
    invoke-interface { v0 }, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
  :L1
  .line 435
    goto :L3
  :L2
  .line 434
    move-exception v0
  :L3
  .line 436
    invoke-virtual { p0 }, Lcom/innioasis/ipp/PickDialog;->dismiss()V
  .line 437
    return-void
.end method

.method private enter()V
  .registers 6
  .line 384
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v0
    iget v1, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
    if-ne v0, v1, :L5
  .line 385
    nop
  .line 386
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
    array-length v3, v2
    if-ge v0, v3, :L2
  .line 387
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    add-int/lit8 v4, v0, 1
    aget-boolean v3, v3, v4
    if-eqz v3, :L1
    aget v0, v2, v0
    or-int/2addr v0, v1
    move v1, v0
  :L1
  .line 386
    move v0, v4
    goto :L0
  :L2
  .line 389
    invoke-virtual { p0 }, Lcom/innioasis/ipp/PickDialog;->dismiss()V
  .line 390
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->go:Lcom/innioasis/ipp/PickDialog$Go;
    if-eqz v0, :L4
    iget-boolean v2, p0, Lcom/innioasis/ipp/PickDialog;->none:Z
    if-nez v2, :L3
    if-eqz v1, :L4
  :L3
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/PickDialog$Go;->go(I)V
  :L4
  .line 391
    return-void
  :L5
  .line 393
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/PickDialog;->toggle(I)V
  .line 394
    return-void
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 202
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private static frame()Landroid/graphics/Bitmap;
  .registers 7
  .line 339
    const/16 v0, 16
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v0, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 340
    new-instance v6, Landroid/graphics/Paint;
    const/4 v1, 1
    invoke-direct { v6, v1 }, Landroid/graphics/Paint;-><init>(I)V
  .line 341
    const/4 v1, -1
    invoke-virtual { v6, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 342
    const/high16 v1, 0x3FC00000
    invoke-virtual { v6, v1 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 343
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v6, v1 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 344
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    const/high16 v2, 0x3F800000
    const/high16 v3, 0x3F800000
    const/high16 v4, 0x41700000
    const/high16 v5, 0x41700000
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 345
    return-object v0
.end method

.method private move(I)V
  .registers 4
  .line 376
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v0
  .line 377
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    array-length v1, v1
    invoke-static { v0, p1, v1 }, Lcom/innioasis/ipp/Loop;->step(III)I
    move-result p1
  .line 378
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 379
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v1, p1 }, Lcom/innioasis/ipp/Column;->move(I)V
  .line 380
    iget v1, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
    if-eq v0, v1, :L1
    if-ne p1, v1, :L2
  :L1
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/PickDialog;->paint(I)V
  :L2
  .line 381
    return-void
.end method

.method private paint(I)V
  .registers 8
  .line 275
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v0, v0, p1
    if-nez v0, :L0
    return-void
  :L0
  .line 276
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v0
    const/4 v1, 0
    if-ne p1, v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 277
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v2 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    if-eqz v0, :L3
  .line 278
    const v3, 2131100253
    goto :L4
  :L3
    const v3, 2131100267
  :L4
  .line 277
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 280
    iget v3, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
    if-ne p1, v3, :L9
  .line 282
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object v1, v1, p1
    const v2, 2131230870
    const v3, 2131230869
    if-eqz v0, :L5
    const v4, 2131230870
    goto :L6
  :L5
    const v4, 2131230869
  :L6
    invoke-virtual { v1, v4 }, Landroid/widget/TextView;->setBackgroundResource(I)V
  .line 283
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object v4, v4, p1
  .line 284
    if-eqz v0, :L7
    goto :L8
  :L7
    const v2, 2131230869
  :L8
  .line 283
    invoke-virtual { v1, v4, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->optionSetBackground(Landroid/widget/TextView;IZ)V
  .line 285
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object v2, v2, p1
    const/4 v3, -1
    invoke-virtual { v1, v2, v3, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->optionSetTextColor(Landroid/widget/TextView;IZ)V
  .line 286
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object p1, v0, p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 287
    return-void
  :L9
  .line 293
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/Column;->barred()Z
    move-result v3
    if-nez v3, :L12
  .line 294
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v3, v3, p1
    const/4 v4, 0
    invoke-virtual { v3, v4 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 295
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v4, v4, p1
  .line 296
    const v5, 2131231051
    if-eqz v0, :L10
    const v1, 2131231051
  :L10
  .line 295
    invoke-virtual { v3, v4, v1, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 297
    if-eqz v0, :L11
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v1, v1, p1
    invoke-virtual { v1 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
    if-nez v1, :L11
  .line 298
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v1, v1, p1
    invoke-virtual { v1, v5 }, Landroid/view/View;->setBackgroundResource(I)V
  :L11
  .line 301
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v1, v1, p1
    invoke-static { v1 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  :L12
  .line 303
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v1, v3, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 304
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->values:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v1, v3, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 306
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->ticks:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object v1, v1, p1
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 307
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->ticks:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    aget-boolean v1, v1, p1
    invoke-static { v1 }, Lcom/innioasis/ipp/PickDialog;->box(Z)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 308
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->values:[Landroid/widget/TextView;
    aget-object v0, v0, p1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/PickDialog;->sizeText(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 309
    return-void
.end method

.method private paintAll()V
  .registers 2
  .line 270
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->paintAll()V
  .line 271
    iget v0, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/PickDialog;->paint(I)V
  .line 272
    return-void
.end method

.method private row(ILjava/lang/String;)Landroid/view/View;
  .registers 11
  .line 214
    new-instance v0, Landroid/widget/LinearLayout;
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v1 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 215
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;
    const/4 v2, -1
    const/4 v3, -2
    invoke-direct { v1, v2, v3 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 216
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 217
    const/16 v2, 16
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 218
    const/4 v4, 5
    const/4 v5, 3
    invoke-virtual { v0, v4, v5, v4, v5 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 219
    const-string v4, "ipp_flat"
    invoke-virtual { v0, v4 }, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V
  .line 221
    new-instance v4, Landroid/widget/ImageView;
    iget-object v6, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v4, v6 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 222
    invoke-static { v1 }, Lcom/innioasis/ipp/PickDialog;->box(Z)Landroid/graphics/Bitmap;
    move-result-object v6
    invoke-virtual { v4, v6 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 223
    const/4 v6, 4
    if-nez p1, :L0
    invoke-virtual { v4, v6 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L0
  .line 224
    sget-object v7, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v4, v7 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 225
    const-string v7, "ipp_tick"
    invoke-virtual { v4, v7 }, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V
  .line 226
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v7, v2, v2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 227
    const/4 v2, 6
    iput v2, v7, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 228
    invoke-virtual { v0, v4, v7 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 230
    new-instance v2, Landroid/widget/TextView;
    iget-object v7, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v2, v7 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 231
    const/high16 v7, 0x41600000
    invoke-virtual { v2, v7 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 232
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->font()Landroid/graphics/Typeface;
    move-result-object v7
    invoke-virtual { v2, v7 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 233
    invoke-virtual { v2, v5 }, Landroid/widget/TextView;->setMaxLines(I)V
  .line 234
    const v5, 2131362459
    invoke-virtual { v2, v5 }, Landroid/widget/TextView;->setId(I)V
  .line 235
    invoke-virtual { v2, p2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 236
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v1, v3 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 237
    const/high16 v5, 0x3F800000
    iput v5, p2, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 238
    invoke-virtual { v0, v2, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 240
    new-instance p2, Landroid/widget/TextView;
    iget-object v5, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { p2, v5 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 241
    const/high16 v5, 0x41400000
    invoke-virtual { p2, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 242
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->font()Landroid/graphics/Typeface;
    move-result-object v5
    invoke-virtual { p2, v5 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 243
    const v5, 8388613
    invoke-virtual { p2, v5 }, Landroid/widget/TextView;->setGravity(I)V
  .line 244
    const/4 v5, 2
    invoke-virtual { p2, v6, v1, v5, v1 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 245
    const v1, 2131362437
    invoke-virtual { p2, v1 }, Landroid/widget/TextView;->setId(I)V
  .line 246
    invoke-virtual { v0, p2, v3, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 248
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aput-object v0, v1, p1
  .line 249
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aput-object v2, v1, p1
  .line 250
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->values:[Landroid/widget/TextView;
    aput-object p2, v1, p1
  .line 251
    iget-object p2, p0, Lcom/innioasis/ipp/PickDialog;->ticks:[Landroid/widget/ImageView;
    aput-object v4, p2, p1
  .line 252
    return-object v0
.end method

.method private sizeText(I)Ljava/lang/String;
  .registers 7
  .line 313
    iget-boolean v0, p0, Lcom/innioasis/ipp/PickDialog;->sizes:Z
    if-nez v0, :L0
    const-string p1, ""
    return-object p1
  :L0
  .line 314
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->size:[J
    aget-wide v1, v0, p1
  .line 315
    const-wide/16 v3, 0
    cmp-long p1, v1, v3
    if-gez p1, :L1
    const-string p1, "\u2026"
    goto :L2
  :L1
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Pick;->sizeText(J)Ljava/lang/String;
    move-result-object p1
  :L2
    return-object p1
.end method

.method private tie(I)V
  .registers 9
  .line 419
    iget-boolean v0, p0, Lcom/innioasis/ipp/PickDialog;->sizes:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 420
    nop
  .line 421
    const/4 v0, 0
    const/4 v1, -1
    const/4 v2, -1
    const/4 v3, 0
  :L1
    iget-object v4, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
    array-length v5, v4
    const/4 v6, 1
    if-ge v3, v5, :L4
  .line 422
    aget v4, v4, v3
    if-ne v4, v6, :L2
    add-int/lit8 v1, v3, 1
  :L2
  .line 423
    const/16 v5, 8
    if-ne v4, v5, :L3
    add-int/lit8 v2, v3, 1
  :L3
  .line 421
    add-int/lit8 v3, v3, 1
    goto :L1
  :L4
  .line 425
    if-lez v1, :L8
    if-gtz v2, :L5
    goto :L8
  :L5
  .line 426
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    aget-boolean v4, v3, v1
    if-eqz v4, :L6
    aput-boolean v6, v3, v2
    goto :L7
  :L6
  .line 427
    if-ne p1, v1, :L7
    aput-boolean v0, v3, v2
  :L7
  .line 428
    return-void
  :L8
  .line 425
    return-void
.end method

.method private toggle(I)V
  .registers 7
  .line 404
    const/4 v0, 1
    if-nez p1, :L2
  .line 405
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog;->allOn()Z
    move-result v1
  .line 406
    const/4 v2, 1
  :L0
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    array-length v4, v3
    if-ge v2, v4, :L1
    xor-int/lit8 v4, v1, 1
    aput-boolean v4, v3, v2
    add-int/lit8 v2, v2, 1
    goto :L0
  :L1
  .line 407
    goto :L3
  :L2
  .line 408
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    aget-boolean v2, v1, p1
    xor-int/2addr v0, v2
    aput-boolean v0, v1, p1
  :L3
  .line 410
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/PickDialog;->tie(I)V
  .line 411
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog;->paintAll()V
  .line 412
    return-void
.end method

.method public dismiss()V
  .registers 2
  .line 178
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 179
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseDialog;->dismiss()V
  .line 180
    return-void
.end method

.method public longDown(II)V
  .registers 4
  .line 365
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v0
    if-ne p1, v0, :L0
    const/4 p1, 3
    if-ne p2, p1, :L0
    iget-object p1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    instance-of p2, p1, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz p2, :L0
  .line 367
    check-cast p1, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/base/BaseActivity;->askShutdown()V
  :L0
  .line 369
    return-void
.end method

.method public longDownFinish(I)V
  .registers 2
  .line 373
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
  .registers 16
  .line 100
    invoke-super { p0, p1 }, Lcom/innioasis/y1/base/BaseDialog;->onCreate(Landroid/os/Bundle;)V
  .line 102
    iget-object p1, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
    array-length p1, p1
  .line 103
    add-int/lit8 v0, p1, 1
    new-array v1, v0, [Z
    iput-object v1, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
  .line 104
    new-array v1, v0, [J
    iput-object v1, p0, Lcom/innioasis/ipp/PickDialog;->size:[J
  .line 105
    const/4 v1, 0
    const/4 v2, 0
  :L0
    const/4 v3, 1
    if-gt v2, p1, :L3
  .line 106
    iget-object v4, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    if-eqz v2, :L2
    iget v5, p0, Lcom/innioasis/ipp/PickDialog;->start:I
    if-ltz v5, :L2
    iget-object v6, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
    add-int/lit8 v7, v2, -1
    aget v6, v6, v7
    and-int/2addr v5, v6
    if-eqz v5, :L1
    goto :L2
  :L1
    const/4 v3, 0
  :L2
    aput-boolean v3, v4, v2
  .line 107
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->size:[J
    const-wide/16 v4, -1
    aput-wide v4, v3, v2
  .line 105
    add-int/lit8 v2, v2, 1
    goto :L0
  :L3
  .line 109
    iput v0, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
  .line 111
    add-int/lit8 v0, p1, 2
    new-array v2, v0, [Landroid/view/View;
    iput-object v2, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
  .line 112
    new-array v2, v0, [Landroid/widget/TextView;
    iput-object v2, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
  .line 113
    new-array v2, v0, [Landroid/widget/TextView;
    iput-object v2, p0, Lcom/innioasis/ipp/PickDialog;->values:[Landroid/widget/TextView;
  .line 114
    new-array v0, v0, [Landroid/widget/ImageView;
    iput-object v0, p0, Lcom/innioasis/ipp/PickDialog;->ticks:[Landroid/widget/ImageView;
  .line 116
    new-instance v0, Landroid/widget/LinearLayout;
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v2 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 117
    invoke-virtual { v0, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 118
    const/16 v2, 8
    const/4 v3, 6
    invoke-virtual { v0, v2, v3, v2, v3 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 119
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v2
  .line 120
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v4 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 121
    const/high16 v5, 0x41200000
    invoke-virtual { v4, v5 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 122
    if-nez v2, :L4
    const v2, -7564110
    goto :L5
  :L4
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  :L5
    invoke-virtual { v4, v2 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 123
    invoke-virtual { v0, v4 }, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 125
    new-instance v2, Landroid/widget/TextView;
    iget-object v4, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v2, v4 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 126
    const/high16 v4, 0x41700000
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 127
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->font()Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 128
    const/16 v4, 17
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setGravity(I)V
  .line 129
    const/4 v5, 4
    const/4 v6, 2
    invoke-virtual { v2, v5, v6, v5, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 130
    iget-object v5, p0, Lcom/innioasis/ipp/PickDialog;->title:Ljava/lang/String;
    invoke-virtual { v2, v5 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 131
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
  .line 132
    invoke-virtual { v6 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v6
    const v7, 2131100267
    invoke-virtual { v6, v7 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v6
  .line 131
    invoke-virtual { v5, v2, v6, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 133
    const/4 v5, -1
    const/4 v6, -2
    invoke-virtual { v0, v2, v5, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 135
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    const v8, 2131821081
    invoke-virtual { v2, v8 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-direct { p0, v1, v2 }, Lcom/innioasis/ipp/PickDialog;->row(ILjava/lang/String;)Landroid/view/View;
  .line 136
    const/4 v2, 0
  :L6
    if-ge v2, p1, :L9
  .line 137
    iget-object v8, p0, Lcom/innioasis/ipp/PickDialog;->names:[Ljava/lang/String;
    if-eqz v8, :L7
    array-length v9, v8
    if-ge v2, v9, :L7
    aget-object v8, v8, v2
    goto :L8
  :L7
  .line 138
    iget-object v8, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    iget-object v9, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
    aget v9, v9, v2
    invoke-static { v9 }, Lcom/innioasis/ipp/Pick;->label(I)I
    move-result v9
    invoke-virtual { v8, v9 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v8
  :L8
  .line 139
    add-int/lit8 v2, v2, 1
    invoke-direct { p0, v2, v8 }, Lcom/innioasis/ipp/PickDialog;->row(ILjava/lang/String;)Landroid/view/View;
  .line 136
    goto :L6
  :L9
  .line 141
    iget p1, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
    new-array v2, p1, [Landroid/view/View;
  .line 142
    iget-object v8, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    invoke-static { v8, v1, v2, v1, p1 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 143
    new-instance p1, Lcom/innioasis/ipp/Column;
    iget-object v8, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    new-instance v9, Lcom/innioasis/ipp/PickDialog$Look;
    invoke-direct { v9, p0 }, Lcom/innioasis/ipp/PickDialog$Look;-><init>(Lcom/innioasis/ipp/PickDialog;)V
    invoke-direct { p1, v8, v2, v9 }, Lcom/innioasis/ipp/Column;-><init>(Landroid/content/Context;[Landroid/view/View;Lcom/innioasis/ipp/Column$Painter;)V
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
  .line 144
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p1, v5, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 145
    const/high16 v2, 0x3F800000
    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 146
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v2 }, Lcom/innioasis/ipp/Column;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v2
    invoke-virtual { v0, v2, p1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 147
    iget-object v8, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
    iget-object v9, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    const/4 v10, 1
    const v11, 2131231051
  .line 148
    invoke-virtual { v9 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    const v2, 2131100253
    invoke-virtual { p1, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v12
    iget-object p1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
  .line 149
    invoke-virtual { p1 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1, v7 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v13
  .line 147
    invoke-virtual/range { v8 .. v13 }, Lcom/innioasis/ipp/Column;->bar(Landroid/app/Activity;ZIII)V
  .line 151
    new-instance p1, Landroid/widget/LinearLayout;
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { p1, v2 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 152
    invoke-virtual { p1, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 153
    invoke-virtual { p1, v4 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 154
    invoke-virtual { p1, v1, v3, v1, v1 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 155
    iget v2, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->okText:Ljava/lang/String;
    invoke-direct { p0, v2, v3 }, Lcom/innioasis/ipp/PickDialog;->button(ILjava/lang/String;)Landroid/view/View;
    move-result-object v2
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v3, v6, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p1, v2, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 156
    invoke-virtual { v0, p1, v5, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 158
    invoke-virtual { p0, v0 }, Lcom/innioasis/ipp/PickDialog;->setContentView(Landroid/view/View;)V
  .line 160
    invoke-virtual { p0 }, Lcom/innioasis/ipp/PickDialog;->getWindow()Landroid/view/Window;
    move-result-object p1
  .line 161
    if-eqz p1, :L10
  .line 162
    invoke-virtual { p1 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v0
  .line 163
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v2 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131165784
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v2
    const v3, 1071225242
    mul-float v2, v2, v3
    float-to-int v2, v2
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->width:I
  .line 164
    iput v4, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I
  .line 165
    invoke-virtual { p1, v0 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  :L10
  .line 168
    iget-object p1, p0, Lcom/innioasis/ipp/PickDialog;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { p1, v1 }, Lcom/innioasis/ipp/Column;->set(I)V
  .line 169
    iget p1, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/PickDialog;->paint(I)V
  .line 172
    new-instance p1, Lcom/innioasis/ipp/PickDialog$Repaint;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/PickDialog$Repaint;-><init>(Lcom/innioasis/ipp/PickDialog;)V
    invoke-static { p1 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 173
    iget-boolean p1, p0, Lcom/innioasis/ipp/PickDialog;->sizes:Z
    if-eqz p1, :L11
    new-instance p1, Ljava/lang/Thread;
    new-instance v0, Lcom/innioasis/ipp/PickDialog$Measure;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/PickDialog$Measure;-><init>(Lcom/innioasis/ipp/PickDialog;)V
    invoke-direct { p1, v0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  :L11
  .line 174
    return-void
.end method

.method public shortUp(I)V
  .registers 4
  .line 350
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 351
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v1
    if-eq p1, v1, :L4
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_LEFT()I
    move-result v1
    if-ne p1, v1, :L0
    goto :L4
  :L0
  .line 353
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v1
    if-eq p1, v1, :L3
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result v1
    if-ne p1, v1, :L1
    goto :L3
  :L1
  .line 355
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v1
    if-ne p1, v1, :L2
  .line 356
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog;->enter()V
    goto :L5
  :L2
  .line 357
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v0
    if-ne p1, v0, :L5
  .line 358
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog;->close()V
    goto :L5
  :L3
  .line 354
    const/4 p1, 1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/PickDialog;->move(I)V
    goto :L5
  :L4
  .line 352
    const/4 p1, -1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/PickDialog;->move(I)V
  :L5
  .line 360
    return-void
.end method

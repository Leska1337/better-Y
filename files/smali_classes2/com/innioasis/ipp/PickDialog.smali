.class public final Lcom/innioasis/ipp/PickDialog;
.super Lcom/innioasis/y1/base/BaseDialog;
.source "PickDialog.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/PickDialog$Go;,
    Lcom/innioasis/ipp/PickDialog$Repaint;,
    Lcom/innioasis/ipp/PickDialog$Measure;,
    Lcom/innioasis/ipp/PickDialog$Apply;
  }
.end annotation

.field private final static BOX:I = -7564110

.field private final static CORNER:F = 10.0F

.field private static mark:Landroid/graphics/Bitmap;

.field private final activity:Landroid/app/Activity;

.field private final cats:[I

.field private final go:Lcom/innioasis/ipp/PickDialog$Go;

.field private labels:[Landroid/widget/TextView;

.field private final names:[Ljava/lang/String;

.field private final none:Z

.field private okRow:I

.field private final okText:Ljava/lang/String;

.field private on:[Z

.field private repainting:Z

.field private rows:[Landroid/view/View;

.field private sel:I

.field private size:[J

.field private final sizes:Z

.field private final start:I

.field private ticks:[Landroid/widget/ImageView;

.field private final title:Ljava/lang/String;

.field private values:[Landroid/widget/TextView;

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[IZLcom/innioasis/ipp/PickDialog$Go;)V
  .registers 8
  .line 64
    const v0, 2131886360
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/base/BaseDialog;-><init>(Landroid/content/Context;I)V
  .line 65
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
  .line 66
    iput-object p2, p0, Lcom/innioasis/ipp/PickDialog;->title:Ljava/lang/String;
  .line 67
    iput-object p3, p0, Lcom/innioasis/ipp/PickDialog;->okText:Ljava/lang/String;
  .line 68
    iput-object p4, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
  .line 69
    iput-boolean p5, p0, Lcom/innioasis/ipp/PickDialog;->sizes:Z
  .line 70
    iput-object p6, p0, Lcom/innioasis/ipp/PickDialog;->go:Lcom/innioasis/ipp/PickDialog$Go;
  .line 71
    const/4 p1, 0
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog;->names:[Ljava/lang/String;
  .line 72
    const/4 p1, -1
    iput p1, p0, Lcom/innioasis/ipp/PickDialog;->start:I
  .line 73
    const/4 p1, 0
    iput-boolean p1, p0, Lcom/innioasis/ipp/PickDialog;->none:Z
  .line 74
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[I[Ljava/lang/String;ILcom/innioasis/ipp/PickDialog$Go;)V
  .registers 9
  .line 79
    const v0, 2131886360
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/base/BaseDialog;-><init>(Landroid/content/Context;I)V
  .line 80
    iput-object p1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
  .line 81
    iput-object p2, p0, Lcom/innioasis/ipp/PickDialog;->title:Ljava/lang/String;
  .line 82
    iput-object p3, p0, Lcom/innioasis/ipp/PickDialog;->okText:Ljava/lang/String;
  .line 83
    iput-object p4, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
  .line 84
    const/4 p1, 0
    iput-boolean p1, p0, Lcom/innioasis/ipp/PickDialog;->sizes:Z
  .line 85
    iput-object p7, p0, Lcom/innioasis/ipp/PickDialog;->go:Lcom/innioasis/ipp/PickDialog$Go;
  .line 86
    iput-object p5, p0, Lcom/innioasis/ipp/PickDialog;->names:[Ljava/lang/String;
  .line 87
    iput p6, p0, Lcom/innioasis/ipp/PickDialog;->start:I
  .line 88
    const/4 p1, 1
    iput-boolean p1, p0, Lcom/innioasis/ipp/PickDialog;->none:Z
  .line 89
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

.method static synthetic access$200(Lcom/innioasis/ipp/PickDialog;)[I
  .registers 1
  .line 31
    iget-object p0, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
    return-object p0
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/PickDialog;)Landroid/app/Activity;
  .registers 1
  .line 31
    iget-object p0, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    return-object p0
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/PickDialog;)[J
  .registers 1
  .line 31
    iget-object p0, p0, Lcom/innioasis/ipp/PickDialog;->size:[J
    return-object p0
.end method

.method private button(ILjava/lang/String;)Landroid/view/View;
  .registers 6
  .line 228
    new-instance v0, Landroid/widget/TextView;
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 229
    const-string v1, "ipp_flat"
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V
  .line 230
    const/high16 v1, 0x41700000
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 231
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->font()Landroid/graphics/Typeface;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 232
    const/16 v1, 17
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 233
    const/4 v1, 6
    const/4 v2, 4
    invoke-virtual { v0, v1, v2, v1, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 234
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 235
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 236
    iget-object p2, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aput-object v0, p2, p1
  .line 237
    iget-object p2, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aput-object v0, p2, p1
  .line 238
    return-object v0
.end method

.method private close()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 367
    invoke-virtual { p0 }, Lcom/innioasis/ipp/PickDialog;->getOnBack()Lkotlin/jvm/functions/Function0;
    move-result-object v0
  .line 368
    if-eqz v0, :L1
    invoke-interface { v0 }, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
  :L1
  .line 370
    goto :L3
  :L2
  .line 369
    move-exception v0
  :L3
  .line 371
    invoke-virtual { p0 }, Lcom/innioasis/ipp/PickDialog;->dismiss()V
  .line 372
    return-void
.end method

.method private enter()V
  .registers 6
  .line 341
    iget v0, p0, Lcom/innioasis/ipp/PickDialog;->sel:I
    iget v1, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
    if-ne v0, v1, :L5
  .line 342
    nop
  .line 343
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
    array-length v3, v2
    if-ge v0, v3, :L2
  .line 344
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    add-int/lit8 v4, v0, 1
    aget-boolean v3, v3, v4
    if-eqz v3, :L1
    aget v0, v2, v0
    or-int/2addr v0, v1
    move v1, v0
  :L1
  .line 343
    move v0, v4
    goto :L0
  :L2
  .line 346
    invoke-virtual { p0 }, Lcom/innioasis/ipp/PickDialog;->dismiss()V
  .line 347
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->go:Lcom/innioasis/ipp/PickDialog$Go;
    if-eqz v0, :L4
    iget-boolean v2, p0, Lcom/innioasis/ipp/PickDialog;->none:Z
    if-nez v2, :L3
    if-eqz v1, :L4
  :L3
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/PickDialog$Go;->go(I)V
  :L4
  .line 348
    return-void
  :L5
  .line 350
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/PickDialog;->toggle(I)V
  .line 351
    return-void
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 186
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private move(I)V
  .registers 4
  .line 332
    iget v0, p0, Lcom/innioasis/ipp/PickDialog;->sel:I
  .line 333
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    array-length v1, v1
    invoke-static { v0, p1, v1 }, Lcom/innioasis/ipp/Loop;->step(III)I
    move-result p1
  .line 334
    iget v1, p0, Lcom/innioasis/ipp/PickDialog;->sel:I
    if-ne p1, v1, :L0
    return-void
  :L0
  .line 335
    iput p1, p0, Lcom/innioasis/ipp/PickDialog;->sel:I
  .line 336
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/PickDialog;->paint(I)V
  .line 337
    iget p1, p0, Lcom/innioasis/ipp/PickDialog;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/PickDialog;->paint(I)V
  .line 338
    return-void
.end method

.method private paint(I)V
  .registers 9
  .line 246
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v0, v0, p1
    if-nez v0, :L0
    return-void
  :L0
  .line 247
    iget v0, p0, Lcom/innioasis/ipp/PickDialog;->sel:I
    const/4 v1, 0
    if-ne p1, v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 248
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v2 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    if-eqz v0, :L3
  .line 249
    const v3, 2131100253
    goto :L4
  :L3
    const v3, 2131100267
  :L4
  .line 248
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 251
    iget v3, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
    if-ne p1, v3, :L9
  .line 253
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
  .line 254
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object v4, v4, p1
  .line 255
    if-eqz v0, :L7
    goto :L8
  :L7
    const v2, 2131230869
  :L8
  .line 254
    invoke-virtual { v1, v4, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->optionSetBackground(Landroid/widget/TextView;IZ)V
  .line 256
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object v2, v2, p1
    const/4 v3, -1
    invoke-virtual { v1, v2, v3, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->optionSetTextColor(Landroid/widget/TextView;IZ)V
  .line 257
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object p1, v0, p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 258
    return-void
  :L9
  .line 264
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v3, v3, p1
    const/4 v4, 0
    invoke-virtual { v3, v4 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 265
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v4, v4, p1
  .line 266
    const v5, 2131231051
    if-eqz v0, :L10
    const v6, 2131231051
    goto :L11
  :L10
    const/4 v6, 0
  :L11
  .line 265
    invoke-virtual { v3, v4, v6, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 267
    if-eqz v0, :L12
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v3, v3, p1
    invoke-virtual { v3 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v3
    if-nez v3, :L12
  .line 268
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v3, v3, p1
    invoke-virtual { v3, v5 }, Landroid/view/View;->setBackgroundResource(I)V
  :L12
  .line 271
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aget-object v3, v3, p1
    invoke-static { v3 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 272
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object v4, v4, p1
    invoke-virtual { v3, v4, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 273
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/ipp/PickDialog;->values:[Landroid/widget/TextView;
    aget-object v4, v4, p1
    invoke-virtual { v3, v4, v2, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 275
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->ticks:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aget-object v2, v2, p1
    invoke-virtual { v2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v2
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 276
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->ticks:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    if-lez p1, :L13
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    aget-boolean v2, v2, p1
    if-eqz v2, :L13
    goto :L14
  :L13
    const/4 v1, 4
  :L14
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 277
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->values:[Landroid/widget/TextView;
    aget-object v0, v0, p1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/PickDialog;->sizeText(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 278
    return-void
.end method

.method private paintAll()V
  .registers 3
  .line 242
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    array-length v1, v1
    if-ge v0, v1, :L1
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/PickDialog;->paint(I)V
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 243
    return-void
.end method

.method private row(ILjava/lang/String;)Landroid/view/View;
  .registers 10
  .line 190
    new-instance v0, Landroid/widget/LinearLayout;
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v1 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 191
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 192
    const/16 v2, 16
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 193
    const/4 v3, 5
    const/4 v4, 3
    invoke-virtual { v0, v3, v4, v3, v4 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 194
    const-string v3, "ipp_flat"
    invoke-virtual { v0, v3 }, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V
  .line 197
    new-instance v3, Landroid/widget/ImageView;
    iget-object v5, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v3, v5 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 198
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->tick()Landroid/graphics/Bitmap;
    move-result-object v5
    invoke-virtual { v3, v5 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 199
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v3, v5 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 200
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v5, v2, v2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 201
    const/4 v2, 6
    iput v2, v5, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 202
    invoke-virtual { v0, v3, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 204
    new-instance v2, Landroid/widget/TextView;
    iget-object v5, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v2, v5 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 205
    const/high16 v5, 0x41600000
    invoke-virtual { v2, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 206
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->font()Landroid/graphics/Typeface;
    move-result-object v5
    invoke-virtual { v2, v5 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 207
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setMaxLines(I)V
  .line 208
    invoke-virtual { v2, p2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 209
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -2
    invoke-direct { p2, v1, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 210
    const/high16 v5, 0x3F800000
    iput v5, p2, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 211
    invoke-virtual { v0, v2, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 213
    new-instance p2, Landroid/widget/TextView;
    iget-object v5, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { p2, v5 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 214
    const/high16 v5, 0x41400000
    invoke-virtual { p2, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 215
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->font()Landroid/graphics/Typeface;
    move-result-object v5
    invoke-virtual { p2, v5 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 216
    const v5, 8388613
    invoke-virtual { p2, v5 }, Landroid/widget/TextView;->setGravity(I)V
  .line 217
    const/4 v5, 4
    const/4 v6, 2
    invoke-virtual { p2, v5, v1, v6, v1 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 218
    invoke-virtual { v0, p2, v4, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 220
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
    aput-object v0, v1, p1
  .line 221
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
    aput-object v2, v1, p1
  .line 222
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->values:[Landroid/widget/TextView;
    aput-object p2, v1, p1
  .line 223
    iget-object p2, p0, Lcom/innioasis/ipp/PickDialog;->ticks:[Landroid/widget/ImageView;
    aput-object v3, p2, p1
  .line 224
    return-object v0
.end method

.method private sizeText(I)Ljava/lang/String;
  .registers 7
  .line 282
    iget-boolean v0, p0, Lcom/innioasis/ipp/PickDialog;->sizes:Z
    if-nez v0, :L0
    const-string p1, ""
    return-object p1
  :L0
  .line 283
    iget-object v0, p0, Lcom/innioasis/ipp/PickDialog;->size:[J
    aget-wide v1, v0, p1
  .line 284
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

.method public static tick()Landroid/graphics/Bitmap;
  .registers 9
  .line 291
    sget-object v0, Lcom/innioasis/ipp/PickDialog;->mark:Landroid/graphics/Bitmap;
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 292
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v1, 16
    invoke-static { v1, v1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 293
    new-instance v7, Landroid/graphics/Canvas;
    invoke-direct { v7, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 294
    new-instance v8, Landroid/graphics/Paint;
    const/4 v1, 1
    invoke-direct { v8, v1 }, Landroid/graphics/Paint;-><init>(I)V
  .line 295
    const/4 v1, -1
    invoke-virtual { v8, v1 }, Landroid/graphics/Paint;->setColor(I)V
  .line 296
    const v1, 1075419546
    invoke-virtual { v8, v1 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 297
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v8, v1 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 298
    const/high16 v2, 0x40200000
    const/high16 v3, 0x41080000
    const/high16 v4, 0x40D00000
    const/high16 v5, 0x41480000
    move-object v1, v7
    move-object v6, v8
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
  .line 299
    const/high16 v2, 0x40D00000
    const/high16 v3, 0x41480000
    const/high16 v4, 0x41580000
    const/high16 v5, 0x40600000
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
  .line 300
    sput-object v0, Lcom/innioasis/ipp/PickDialog;->mark:Landroid/graphics/Bitmap;
  .line 301
    return-object v0
.end method

.method private toggle(I)V
  .registers 6
  .line 355
    const/4 v0, 1
    if-nez p1, :L4
  .line 356
    nop
  .line 357
    const/4 p1, 1
    const/4 v1, 1
  :L0
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    array-length v3, v2
    if-ge p1, v3, :L1
    aget-boolean v2, v2, p1
    and-int/2addr v1, v2
    add-int/lit8 p1, p1, 1
    goto :L0
  :L1
  .line 358
    const/4 p1, 1
  :L2
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    array-length v3, v2
    if-ge p1, v3, :L3
    xor-int/lit8 v3, v1, 1
    aput-boolean v3, v2, p1
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 359
    goto :L5
  :L4
  .line 360
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
    aget-boolean v2, v1, p1
    xor-int/2addr v0, v2
    aput-boolean v0, v1, p1
  :L5
  .line 362
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog;->paintAll()V
  .line 363
    return-void
.end method

.method public dismiss()V
  .registers 2
  .line 162
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 163
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseDialog;->dismiss()V
  .line 164
    return-void
.end method

.method public longDown(II)V
  .registers 4
  .line 321
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v0
    if-ne p1, v0, :L0
    const/4 p1, 3
    if-ne p2, p1, :L0
    iget-object p1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    instance-of p2, p1, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz p2, :L0
  .line 323
    check-cast p1, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/base/BaseActivity;->askShutdown()V
  :L0
  .line 325
    return-void
.end method

.method public longDownFinish(I)V
  .registers 2
  .line 329
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
  .registers 11
  .line 93
    invoke-super { p0, p1 }, Lcom/innioasis/y1/base/BaseDialog;->onCreate(Landroid/os/Bundle;)V
  .line 95
    iget-object p1, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
    array-length p1, p1
  .line 96
    add-int/lit8 v0, p1, 1
    new-array v1, v0, [Z
    iput-object v1, p0, Lcom/innioasis/ipp/PickDialog;->on:[Z
  .line 97
    new-array v1, v0, [J
    iput-object v1, p0, Lcom/innioasis/ipp/PickDialog;->size:[J
  .line 98
    const/4 v1, 0
    const/4 v2, 0
  :L0
    const/4 v3, 1
    if-gt v2, p1, :L3
  .line 99
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
  .line 100
    iget-object v3, p0, Lcom/innioasis/ipp/PickDialog;->size:[J
    const-wide/16 v4, -1
    aput-wide v4, v3, v2
  .line 98
    add-int/lit8 v2, v2, 1
    goto :L0
  :L3
  .line 102
    iput v0, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
  .line 103
    iput v1, p0, Lcom/innioasis/ipp/PickDialog;->sel:I
  .line 105
    add-int/lit8 v0, p1, 2
    new-array v2, v0, [Landroid/view/View;
    iput-object v2, p0, Lcom/innioasis/ipp/PickDialog;->rows:[Landroid/view/View;
  .line 106
    new-array v2, v0, [Landroid/widget/TextView;
    iput-object v2, p0, Lcom/innioasis/ipp/PickDialog;->labels:[Landroid/widget/TextView;
  .line 107
    new-array v2, v0, [Landroid/widget/TextView;
    iput-object v2, p0, Lcom/innioasis/ipp/PickDialog;->values:[Landroid/widget/TextView;
  .line 108
    new-array v0, v0, [Landroid/widget/ImageView;
    iput-object v0, p0, Lcom/innioasis/ipp/PickDialog;->ticks:[Landroid/widget/ImageView;
  .line 110
    new-instance v0, Landroid/widget/LinearLayout;
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v0, v2 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 111
    invoke-virtual { v0, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 112
    const/16 v2, 8
    const/4 v3, 6
    invoke-virtual { v0, v2, v3, v2, v3 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 113
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v2
  .line 114
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v4 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 115
    const/high16 v5, 0x41200000
    invoke-virtual { v4, v5 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 116
    if-nez v2, :L4
    const v2, -7564110
    goto :L5
  :L4
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  :L5
    invoke-virtual { v4, v2 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 117
    invoke-virtual { v0, v4 }, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 119
    new-instance v2, Landroid/widget/TextView;
    iget-object v4, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { v2, v4 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 120
    const/high16 v4, 0x41700000
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 121
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->font()Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 122
    const/16 v4, 17
    invoke-virtual { v2, v4 }, Landroid/widget/TextView;->setGravity(I)V
  .line 123
    const/4 v5, 4
    const/4 v6, 2
    invoke-virtual { v2, v5, v6, v5, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 124
    iget-object v5, p0, Lcom/innioasis/ipp/PickDialog;->title:Ljava/lang/String;
    invoke-virtual { v2, v5 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 125
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
  .line 126
    invoke-virtual { v6 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v6
    const v7, 2131100267
    invoke-virtual { v6, v7 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v6
  .line 125
    invoke-virtual { v5, v2, v6, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 127
    const/4 v5, -1
    const/4 v6, -2
    invoke-virtual { v0, v2, v5, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 129
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    const v7, 2131821081
    invoke-virtual { v2, v7 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-direct { p0, v1, v2 }, Lcom/innioasis/ipp/PickDialog;->row(ILjava/lang/String;)Landroid/view/View;
    move-result-object v2
    invoke-virtual { v0, v2, v5, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 130
    const/4 v2, 0
  :L6
    if-ge v2, p1, :L9
  .line 131
    iget-object v7, p0, Lcom/innioasis/ipp/PickDialog;->names:[Ljava/lang/String;
    if-eqz v7, :L7
    array-length v8, v7
    if-ge v2, v8, :L7
    aget-object v7, v7, v2
    goto :L8
  :L7
  .line 132
    iget-object v7, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    iget-object v8, p0, Lcom/innioasis/ipp/PickDialog;->cats:[I
    aget v8, v8, v2
    invoke-static { v8 }, Lcom/innioasis/ipp/Pick;->label(I)I
    move-result v8
    invoke-virtual { v7, v8 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v7
  :L8
  .line 133
    add-int/lit8 v2, v2, 1
    invoke-direct { p0, v2, v7 }, Lcom/innioasis/ipp/PickDialog;->row(ILjava/lang/String;)Landroid/view/View;
    move-result-object v7
    invoke-virtual { v0, v7, v5, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 130
    goto :L6
  :L9
  .line 136
    new-instance p1, Landroid/widget/LinearLayout;
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-direct { p1, v2 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 137
    invoke-virtual { p1, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 138
    invoke-virtual { p1, v4 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 139
    invoke-virtual { p1, v1, v3, v1, v1 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 140
    iget v1, p0, Lcom/innioasis/ipp/PickDialog;->okRow:I
    iget-object v2, p0, Lcom/innioasis/ipp/PickDialog;->okText:Ljava/lang/String;
    invoke-direct { p0, v1, v2 }, Lcom/innioasis/ipp/PickDialog;->button(ILjava/lang/String;)Landroid/view/View;
    move-result-object v1
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v2, v6, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { p1, v1, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 141
    invoke-virtual { v0, p1, v5, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 143
    invoke-virtual { p0, v0 }, Lcom/innioasis/ipp/PickDialog;->setContentView(Landroid/view/View;)V
  .line 145
    invoke-virtual { p0 }, Lcom/innioasis/ipp/PickDialog;->getWindow()Landroid/view/Window;
    move-result-object p1
  .line 146
    if-eqz p1, :L10
  .line 147
    invoke-virtual { p1 }, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;
    move-result-object v0
  .line 148
    iget-object v1, p0, Lcom/innioasis/ipp/PickDialog;->activity:Landroid/app/Activity;
    invoke-virtual { v1 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v2, 2131165784
    invoke-virtual { v1, v2 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v1
    const v2, 1071225242
    mul-float v1, v1, v2
    float-to-int v1, v1
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I
  .line 149
    iput v4, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I
  .line 150
    invoke-virtual { p1, v0 }, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
  :L10
  .line 153
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog;->paintAll()V
  .line 156
    new-instance p1, Lcom/innioasis/ipp/PickDialog$Repaint;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/PickDialog$Repaint;-><init>(Lcom/innioasis/ipp/PickDialog;)V
    invoke-static { p1 }, Lcom/innioasis/ipp/Rows;->watchFlat(Ljava/lang/Runnable;)V
  .line 157
    iget-boolean p1, p0, Lcom/innioasis/ipp/PickDialog;->sizes:Z
    if-eqz p1, :L11
    new-instance p1, Ljava/lang/Thread;
    new-instance v0, Lcom/innioasis/ipp/PickDialog$Measure;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/PickDialog$Measure;-><init>(Lcom/innioasis/ipp/PickDialog;)V
    invoke-direct { p1, v0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  :L11
  .line 158
    return-void
.end method

.method public shortUp(I)V
  .registers 4
  .line 306
    sget-object v0, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
  .line 307
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_UP()I
    move-result v1
    if-eq p1, v1, :L4
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_LEFT()I
    move-result v1
    if-ne p1, v1, :L0
    goto :L4
  :L0
  .line 309
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_DOWN()I
    move-result v1
    if-eq p1, v1, :L3
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_RIGHT()I
    move-result v1
    if-ne p1, v1, :L1
    goto :L3
  :L1
  .line 311
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v1
    if-ne p1, v1, :L2
  .line 312
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog;->enter()V
    goto :L5
  :L2
  .line 313
    invoke-virtual { v0 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_MENU()I
    move-result v0
    if-ne p1, v0, :L5
  .line 314
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog;->close()V
    goto :L5
  :L3
  .line 310
    const/4 p1, 1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/PickDialog;->move(I)V
    goto :L5
  :L4
  .line 308
    const/4 p1, -1
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/PickDialog;->move(I)V
  :L5
  .line 316
    return-void
.end method

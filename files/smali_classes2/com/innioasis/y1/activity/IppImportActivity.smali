.class public final Lcom/innioasis/y1/activity/IppImportActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppImportActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppImportActivity$Begin;,
    Lcom/innioasis/y1/activity/IppImportActivity$ScrollLater;,
    Lcom/innioasis/y1/activity/IppImportActivity$Start;,
    Lcom/innioasis/y1/activity/IppImportActivity$Back;,
    Lcom/innioasis/y1/activity/IppImportActivity$Work;,
    Lcom/innioasis/y1/activity/IppImportActivity$Paint;,
    Lcom/innioasis/y1/activity/IppImportActivity$Ticker;,
    Lcom/innioasis/y1/activity/IppImportActivity$Done;
  }
.end annotation

.field private final static ACCENT:I = -12779554

.field private final static HAIR_ALPHA:I = 520093696

.field private final static HAIR_H:I = 1

.field private final static RULE_H:I = 2

.field private final static SMALL_SP:F = 13.0F

.field private final static TEXT_SP:F = 15.0F

.field private all:Ljava/util/List;

.field private bar:Landroid/widget/ProgressBar;

.field private boxes:[Landroid/view/View;

.field private container:Landroid/widget/LinearLayout;

.field private counts:Landroid/widget/TextView;

.field volatile current:I

.field volatile doneEntries:I

.field private finished:Z

.field private fitRows:I

.field private footer:Landroid/widget/LinearLayout;

.field private itemRgb:I

.field private labels:[Landroid/widget/TextView;

.field private lastHair:Landroid/view/View;

.field private listing:Z

.field private name:Landroid/widget/TextView;

.field private volatile paintPending:Z

.field private plans:Ljava/util/List;

.field private rows:[Landroid/view/View;

.field private running:Z

.field private scroller:Landroid/widget/ScrollView;

.field private sel:I

.field private step:I

.field private ticks:[Landroid/widget/ImageView;

.field private total:I

.field private values:[Landroid/widget/TextView;

.field private which:Landroid/widget/TextView;

.method public constructor <init>()V
  .registers 2
  .line 32
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 468
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb:I
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppImportActivity;)Z
  .registers 1
  .line 32
    iget-boolean p0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
    return p0
.end method

.method static synthetic access$100(Lcom/innioasis/y1/activity/IppImportActivity;)Z
  .registers 1
  .line 32
    iget-boolean p0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->finished:Z
    return p0
.end method

.method private static bold(Landroid/widget/TextView;)V
  .registers 3
  .line 439
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-virtual { p0, v0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 440
    return-void
.end method

.method private boxed(Landroid/view/View;I)Landroid/view/View;
  .registers 7
  .line 455
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct { v0, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 456
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 457
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -1
    invoke-direct { v2, v3, p2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, p1, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 458
    new-instance p1, Landroid/view/View;
    invoke-direct { p1, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 459
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb()I
    move-result p2
    const/high16 v2, 0x1F000000
    or-int/2addr p2, v2
    invoke-virtual { p1, p2 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 460
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v3, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 461
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->lastHair:Landroid/view/View;
  .line 462
    return-object v0
.end method

.method private caption(Ljava/lang/String;Z)Landroid/view/View;
  .registers 10
  .line 489
    const/high16 v0, 0x41500000
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object p1
  .line 490
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppImportActivity;->bold(Landroid/widget/TextView;)V
  .line 491
    const/16 v0, 16
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 492
    const/4 v0, 6
    const/4 v1, 4
    invoke-virtual { p1, v0, v1, v0, v1 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 493
    const/4 v0, 1
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 494
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { p1, v1 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 495
    invoke-virtual { p1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v1
    const v2, 16777215
    and-int/2addr v1, v2
  .line 497
    new-instance v3, Landroid/widget/TextView;
    invoke-direct { v3, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 498
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v5, -12779554
    invoke-virtual { v4, v3, v5, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 499
    invoke-virtual { v3 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v3
    and-int/2addr v2, v3
  .line 501
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 502
    invoke-virtual { v3, v0 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 503
    const/4 v0, 2
    const/high16 v4, 0x59000000
    const/4 v5, -1
    if-eqz p2, :L0
  .line 504
    new-instance p2, Landroid/view/View;
    invoke-direct { p2, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 505
    or-int v6, v1, v4
    invoke-virtual { p2, v6 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 506
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v6, v5, v0 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v3, p2, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L0
  .line 508
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, -2
    invoke-direct { p2, v5, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v3, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 509
    new-instance p1, Landroid/view/View;
    invoke-direct { p1, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 510
    or-int p2, v1, v4
    invoke-virtual { p1, p2 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 511
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v5, v0 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v3, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 512
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result p1
    or-int/2addr p1, v2
    invoke-virtual { v3, p1 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  .line 513
    return-object v3
.end method

.method private dropHair()V
  .registers 3
  .line 472
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->lastHair:Landroid/view/View;
    if-eqz v0, :L0
    const/16 v1, 8
    invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
  :L0
  .line 473
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->lastHair:Landroid/view/View;
  .line 474
    return-void
.end method

.method private fit(I)V
  .registers 6
  .line 192
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v0 }, Landroid/widget/ScrollView;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 193
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
  .line 194
    if-gtz v1, :L0
  .line 195
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I
  .line 196
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131165782
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v2
    float-to-int v2, v2
    sub-int/2addr v1, v2
  :L0
  .line 198
    int-to-float v2, v1
    int-to-float p1, p1
    div-float/2addr v2, p1
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result p1
    const/4 v2, 2
    invoke-static { v2, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 199
    div-int v2, v1, p1
    iput v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->step:I
  .line 200
    add-int/lit8 v3, p1, -1
    iput v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->fitRows:I
  .line 201
    mul-int v2, v2, p1
    sub-int/2addr v1, v2
    const/4 p1, 0
    invoke-virtual { v0, p1, v1, p1, p1 }, Landroid/view/View;->setPadding(IIII)V
  .line 202
    return-void
.end method

.method private go()V
  .registers 6
  .line 267
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 268
    const/4 v1, 0
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L2
  .line 269
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/M3u$Plan;
  .line 270
    iget-boolean v4, v3, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    if-eqz v4, :L1
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 268
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 272
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
    if-eqz v2, :L3
  .line 273
    const v0, 2131821157
    invoke-static { p0, v0, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;
    move-result-object v0
  .line 274
    invoke-virtual { v0 }, Landroid/widget/Toast;->show()V
  .line 275
    return-void
  :L3
  .line 277
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
  .line 278
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
  .line 279
    new-instance v0, Lcom/innioasis/ipp/M3u$Ask;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    new-instance v3, Lcom/innioasis/y1/activity/IppImportActivity$Start;
    invoke-direct { v3, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Start;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    new-instance v4, Lcom/innioasis/y1/activity/IppImportActivity$Back;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Back;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    invoke-direct { v0, v1, v2, v3, v4 }, Lcom/innioasis/ipp/M3u$Ask;-><init>(Landroid/app/Activity;Ljava/util/List;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Lcom/innioasis/ipp/M3u$Ask;->start()V
  .line 280
    return-void
.end method

.method private item(Landroid/widget/TextView;)Landroid/view/View;
  .registers 5
  .line 444
    const/4 v0, 1
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 445
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 446
    const/16 v0, 16
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 447
    const/16 v0, 8
    const/16 v1, 10
    const/4 v2, 0
    invoke-virtual { p1, v1, v2, v0, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 448
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0, p1, v2, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 449
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v1, -1
    invoke-virtual { v0, p1, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 450
    invoke-virtual { p1 }, Landroid/widget/TextView;->getTextSize()F
    move-result v0
    const v1, 1075419546
    mul-float v0, v0, v1
    float-to-int v0, v0
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->boxed(Landroid/view/View;I)Landroid/view/View;
    move-result-object p1
    return-object p1
.end method

.method private itemRgb()I
  .registers 5
  .line 478
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb:I
    if-gez v0, :L0
  .line 479
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 480
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 481
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 480
    const/4 v3, 0
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 482
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    iput v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb:I
  :L0
  .line 484
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb:I
    return v0
.end method

.method private label(I)Ljava/lang/String;
  .registers 3
  .line 205
    if-nez p1, :L0
    const p1, 2131820584
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L0
  .line 206
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, 1
    if-ne p1, v0, :L1
    const p1, 2131821156
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L1
  .line 207
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    add-int/lit8 p1, p1, -1
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/ipp/M3u$Plan;
    iget-object p1, p1, Lcom/innioasis/ipp/M3u$Plan;->file:Ljava/lang/String;
    return-object p1
.end method

.method private line(Ljava/lang/String;F)Landroid/widget/TextView;
  .registers 5
  .line 429
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 430
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 431
    sget-object p2, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 432
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 433
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 434
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p2
    const v1, 2131100252
    invoke-virtual { p2, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p2
  .line 433
    const/4 v1, 0
    invoke-virtual { p1, v0, p2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 435
    return-object v0
.end method

.method private moveSel(I)V
  .registers 4
  .line 227
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->sel:I
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
    array-length v1, v1
    invoke-static { v0, p1, v1 }, Lcom/innioasis/ipp/Loop;->step(III)I
    move-result p1
  .line 228
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->sel:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 229
    nop
  .line 230
    iput p1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->sel:I
  .line 231
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->paintRow(I)V
  .line 232
    iget p1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppImportActivity;->paintRow(I)V
  .line 233
    const/4 p1, 1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppImportActivity;->scrollToSel(Z)V
  .line 234
    return-void
.end method

.method private paintRow(I)V
  .registers 10
  .line 211
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->sel:I
    const/4 v1, 1
    const/4 v2, 0
    if-ne p1, v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 212
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
    aget-object v4, v4, p1
    if-eqz v0, :L2
    const v5, 2131231052
    goto :L3
  :L2
    const/4 v5, 0
  :L3
    invoke-virtual { v3, v4, v5, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 213
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->labels:[Landroid/widget/TextView;
    aget-object v4, v4, p1
    const v5, -12779554
    const/4 v6, -1
    if-eqz v0, :L4
    const v7, -12779554
    goto :L5
  :L4
    const/4 v7, -1
  :L5
    invoke-virtual { v3, v4, v7, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 214
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->values:[Landroid/widget/TextView;
    aget-object v4, v4, p1
    if-eqz v0, :L6
    goto :L7
  :L6
    const/4 v5, -1
  :L7
    invoke-virtual { v3, v4, v5, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 216
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->ticks:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v3 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v3
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 217
    if-lez p1, :L8
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-gt p1, v0, :L8
    const/4 v0, 1
    goto :L9
  :L8
    const/4 v0, 0
  :L9
  .line 218
    const/4 v3, 4
    if-eqz v0, :L12
  .line 219
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->ticks:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    sub-int/2addr p1, v1
    invoke-interface { v4, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/ipp/M3u$Plan;
    iget-boolean p1, p1, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    if-eqz p1, :L10
  .line 220
    goto :L11
  :L10
    const/4 v2, 4
  :L11
  .line 219
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
    goto :L13
  :L12
  .line 221
    if-nez p1, :L13
  .line 222
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->ticks:[Landroid/widget/ImageView;
    aget-object p1, v0, p1
    invoke-virtual { p1, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L13
  .line 224
    return-void
.end method

.method private press()V
  .registers 7
  .line 250
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
  .line 251
    iget v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->sel:I
    const/4 v2, 1
    if-nez v1, :L6
  .line 252
    nop
  .line 253
    const/4 v1, 0
    const/4 v3, 0
    const/4 v4, 1
  :L0
    if-ge v3, v0, :L1
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v5, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/ipp/M3u$Plan;
    iget-boolean v5, v5, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    and-int/2addr v4, v5
    add-int/lit8 v3, v3, 1
    goto :L0
  :L1
  .line 254
    nop
  :L2
    if-ge v1, v0, :L3
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v3, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/M3u$Plan;
    xor-int/lit8 v5, v4, 1
    iput-boolean v5, v3, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 255
    nop
  :L4
    if-gt v2, v0, :L5
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->paintRow(I)V
    add-int/lit8 v2, v2, 1
    goto :L4
  :L5
  .line 256
    goto :L8
  :L6
    if-gt v1, v0, :L7
  .line 257
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    sub-int/2addr v1, v2
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/M3u$Plan;
  .line 258
    iget-boolean v1, v0, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    xor-int/2addr v1, v2
    iput-boolean v1, v0, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
  .line 259
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->paintRow(I)V
  .line 260
    goto :L8
  :L7
  .line 261
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->go()V
  :L8
  .line 263
    return-void
.end method

.method private step()I
  .registers 3
  .line 517
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->scaledDensity:F
    const/high16 v1, 0x41500000
    mul-float v0, v0, v1
    const/high16 v1, 0x40200000
    mul-float v0, v0, v1
    float-to-int v0, v0
    return v0
.end method

.method public antiClockwise()V
  .registers 4
  .line 528
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
    if-eqz v0, :L0
    const/4 v0, -1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->moveSel(I)V
    goto :L1
  :L0
  .line 529
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->finished:Z
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->step()I
    move-result v1
    neg-int v1, v1
    const/4 v2, 0
    invoke-virtual { v0, v2, v1 }, Landroid/widget/ScrollView;->scrollBy(II)V
  :L1
  .line 530
    return-void
.end method

.method backToList()V
  .registers 6
  .line 287
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 288
    const/4 v1, 0
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L2
  .line 289
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/M3u$Plan;
  .line 290
    iget-boolean v4, v3, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    if-eqz v4, :L1
    iget-object v3, v3, Lcom/innioasis/ipp/M3u$Plan;->file:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L1
  .line 288
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 292
    invoke-static { }, Lcom/innioasis/ipp/M3u;->scan()Ljava/util/List;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
  .line 293
    nop
  :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 294
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/M3u$Plan;
  .line 295
    iget-object v3, v2, Lcom/innioasis/ipp/M3u$Plan;->file:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v3
    iput-boolean v3, v2, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
  .line 293
    add-int/lit8 v1, v1, 1
    goto :L3
  :L4
  .line 297
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L5
  .line 298
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->finish()V
  .line 299
    return-void
  :L5
  .line 301
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->buildList()V
  .line 302
    return-void
.end method

.method begin()V
  .registers 6
  .line 88
    invoke-static { }, Lcom/innioasis/ipp/M3u;->scan()Ljava/util/List;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
  .line 89
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
  .line 90
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->finished:Z
  .line 92
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v0 }, Landroid/widget/ScrollView;->setFillViewport(Z)V
  .line 93
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    const/16 v1, 17
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 94
    const v0, 2131821148
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    const/high16 v2, 0x41700000
    invoke-direct { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v0
  .line 95
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 96
    const/16 v1, 16
    const/4 v2, 0
    invoke-virtual { v0, v1, v2, v1, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 97
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -1
    const/4 v4, -2
    invoke-direct { v2, v3, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v0, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 98
    return-void
  :L0
  .line 100
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->buildList()V
  .line 101
    return-void
.end method

.method buildList()V
  .registers 12
  .line 116
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
  .line 117
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v1 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 118
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
    invoke-virtual { v1 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 119
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    add-int/lit8 v1, v1, 2
  .line 120
    new-array v2, v1, [Landroid/view/View;
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
  .line 121
    new-array v2, v1, [Landroid/widget/TextView;
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->labels:[Landroid/widget/TextView;
  .line 122
    new-array v2, v1, [Landroid/widget/TextView;
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->values:[Landroid/widget/TextView;
  .line 123
    new-array v2, v1, [Landroid/widget/ImageView;
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->ticks:[Landroid/widget/ImageView;
  .line 124
    new-array v2, v1, [Landroid/view/View;
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
  .line 125
    const/4 v2, 0
    const/4 v3, 0
  :L0
    if-ge v3, v1, :L9
  .line 126
    new-instance v4, Landroid/widget/LinearLayout;
    invoke-direct { v4, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 127
    invoke-virtual { v4, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 128
    const/16 v5, 16
    invoke-virtual { v4, v5 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 129
    const/16 v5, 10
    const/4 v6, 5
    invoke-virtual { v4, v5, v2, v6, v2 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 131
    new-instance v5, Landroid/widget/ImageView;
    invoke-direct { v5, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 132
    invoke-static { }, Lcom/innioasis/ipp/PickDialog;->tick()Landroid/graphics/Bitmap;
    move-result-object v6
    invoke-virtual { v5, v6 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 133
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v7, -2
    invoke-direct { v6, v7, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 134
    const/4 v8, 6
    iput v8, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 135
    invoke-virtual { v4, v5, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 137
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->label(I)Ljava/lang/String;
    move-result-object v6
    const/high16 v9, 0x41880000
    invoke-direct { p0, v6, v9 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v6
  .line 138
    invoke-virtual { v6, v0 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 139
    sget-object v9, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v6, v9 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 140
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v9, v2, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 141
    const/high16 v10, 0x3F800000
    iput v10, v9, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 142
    invoke-virtual { v4, v6, v9 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 144
    const-string v9, ""
    const/high16 v10, 0x41700000
    invoke-direct { p0, v9, v10 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v9
  .line 145
    const/4 v10, 4
    invoke-virtual { v9, v8, v2, v10, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 146
    if-lez v3, :L1
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v8 }, Ljava/util/List;->size()I
    move-result v8
    if-gt v3, v8, :L1
  .line 147
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    add-int/lit8 v10, v3, -1
    invoke-interface { v8, v10 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/ipp/M3u$Plan;
    iget-object v8, v8, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result v8
    invoke-static { v8 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v9, v8 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L1
  .line 149
    invoke-virtual { v4, v9, v7, v7 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 151
    add-int/lit8 v8, v1, -1
    if-ne v3, v8, :L2
  .line 153
    const/16 v10, 8
    invoke-virtual { v5, v10 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 154
    const/16 v10, 17
    invoke-virtual { v6, v10 }, Landroid/widget/TextView;->setGravity(I)V
  .line 155
    invoke-static { v6 }, Lcom/innioasis/y1/activity/IppImportActivity;->bold(Landroid/widget/TextView;)V
  :L2
  .line 157
    iget-object v10, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
    aput-object v4, v10, v3
  .line 158
    iget-object v10, p0, Lcom/innioasis/y1/activity/IppImportActivity;->labels:[Landroid/widget/TextView;
    aput-object v6, v10, v3
  .line 159
    iget-object v10, p0, Lcom/innioasis/y1/activity/IppImportActivity;->values:[Landroid/widget/TextView;
    aput-object v9, v10, v3
  .line 160
    iget-object v9, p0, Lcom/innioasis/y1/activity/IppImportActivity;->ticks:[Landroid/widget/ImageView;
    aput-object v5, v9, v3
  .line 161
    iget v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->step:I
    if-nez v5, :L3
    invoke-virtual { v6 }, Landroid/widget/TextView;->getTextSize()F
    move-result v5
    const v6, 1075419546
    mul-float v5, v5, v6
    float-to-int v5, v5
    add-int/2addr v5, v0
    invoke-direct { p0, v5 }, Lcom/innioasis/y1/activity/IppImportActivity;->fit(I)V
  :L3
  .line 162
    const/4 v5, -1
    if-ne v3, v8, :L7
  .line 164
    iget v6, p0, Lcom/innioasis/y1/activity/IppImportActivity;->fitRows:I
    if-lt v8, v6, :L4
    const/4 v6, 1
    goto :L5
  :L4
    const/4 v6, 0
  :L5
  .line 165
    iget v7, p0, Lcom/innioasis/y1/activity/IppImportActivity;->step:I
  .line 166
    if-nez v6, :L6
  .line 167
    new-instance v6, Landroid/view/View;
    invoke-direct { v6, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 168
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb()I
    move-result v8
    const/high16 v9, 0x1F000000
    or-int/2addr v8, v9
    invoke-virtual { v6, v8 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 169
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v9, v5, v0 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v8, v6, v9 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 170
    add-int/lit8 v7, v7, -1
  :L6
  .line 172
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v8, v5, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v6, v4, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 173
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
    aput-object v4, v5, v3
  .line 174
    goto :L8
  :L7
  .line 175
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
    iget v8, p0, Lcom/innioasis/y1/activity/IppImportActivity;->step:I
    sub-int/2addr v8, v0
    invoke-direct { p0, v4, v8 }, Lcom/innioasis/y1/activity/IppImportActivity;->boxed(Landroid/view/View;I)Landroid/view/View;
    move-result-object v4
    aput-object v4, v6, v3
  .line 176
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
    aget-object v6, v6, v3
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v8, v5, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v4, v6, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L8
  .line 125
    add-int/lit8 v3, v3, 1
    goto/16 :L0
  :L9
  .line 179
    iget v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->sel:I
    add-int/lit8 v4, v1, -1
    invoke-static { v3, v4 }, Ljava/lang/Math;->min(II)I
    move-result v3
    iput v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->sel:I
  .line 180
    nop
  :L10
    if-ge v2, v1, :L11
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->paintRow(I)V
    add-int/lit8 v2, v2, 1
    goto :L10
  :L11
  .line 181
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->scrollToSel(Z)V
  .line 182
    return-void
.end method

.method public clockwise()V
  .registers 4
  .line 522
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
    if-eqz v0, :L0
    const/4 v0, 1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->moveSel(I)V
    goto :L1
  :L0
  .line 523
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->finished:Z
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L1
    const/4 v1, 0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->step()I
    move-result v2
    invoke-virtual { v0, v1, v2 }, Landroid/widget/ScrollView;->scrollBy(II)V
  :L1
  .line 524
    return-void
.end method

.method public confirm()V
  .registers 2
  .line 534
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
    if-eqz v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->press()V
  :L0
  .line 535
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 544
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L0
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->running:Z
    if-nez p1, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->finish()V
  :L0
  .line 545
    return-void
.end method

.method done()V
  .registers 13
  .line 386
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->running:Z
  .line 387
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->finished:Z
  .line 388
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v2 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 390
    nop
  .line 391
    nop
  .line 392
    const/4 v2, 0
    const/4 v3, 0
    const/4 v4, 0
  :L0
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v5 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v2, v5, :L1
  .line 393
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v5, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/ipp/M3u$Plan;
  .line 394
    iget v6, v5, Lcom/innioasis/ipp/M3u$Plan;->found:I
    add-int/2addr v3, v6
  .line 395
    iget-object v6, v5, Lcom/innioasis/ipp/M3u$Plan;->missing:Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v6
    iget-object v5, v5, Lcom/innioasis/ipp/M3u$Plan;->dups:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v5
    add-int/2addr v6, v5
    add-int/2addr v4, v6
  .line 392
    add-int/lit8 v2, v2, 1
    goto :L0
  :L1
  .line 397
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "m3u import: "
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v5 }, Ljava/util/List;->size()I
    move-result v5
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v5, " file(s), "
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v5, " song(s) in, "
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v5, " not"
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 399
    const/4 v2, 0
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->lastHair:Landroid/view/View;
  .line 400
    const/4 v2, 2
    new-array v2, v2, [Ljava/lang/Object;
  .line 401
    invoke-static { v3 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v3
    aput-object v3, v2, v0
    invoke-static { v4 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v3
    aput-object v3, v2, v1
  .line 400
    const v3, 2131821151
    invoke-virtual { p0, v3, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
    const/high16 v3, 0x41700000
    invoke-direct { p0, v2, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v2
  .line 402
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->bold(Landroid/widget/TextView;)V
  .line 403
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->item(Landroid/widget/TextView;)Landroid/view/View;
    move-result-object v2
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -1
    const/4 v6, -2
    invoke-direct { v4, v5, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v3, v2, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 405
    nop
  .line 406
    const/4 v2, 0
    const/4 v3, 0
  :L2
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v4 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v2, v4, :L11
  .line 407
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v4, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/M3u$Plan;
  .line 408
    iget-boolean v7, v4, Lcom/innioasis/ipp/M3u$Plan;->fav:Z
    if-eqz v7, :L3
    const v7, 2131821035
    invoke-virtual { p0, v7 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I)Ljava/lang/String;
    move-result-object v7
    goto :L4
  :L3
    iget-object v7, v4, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
  :L4
  .line 409
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->dropHair()V
  .line 411
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    new-instance v9, Ljava/lang/StringBuilder;
    invoke-direct { v9 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v9, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v9, "  "
    invoke-virtual { v7, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    iget v9, v4, Lcom/innioasis/ipp/M3u$Plan;->found:I
    invoke-virtual { v7, v9 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v9, "/"
    invoke-virtual { v7, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    iget-object v9, v4, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v9 }, Ljava/util/ArrayList;->size()I
    move-result v9
    invoke-virtual { v7, v9 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7
    xor-int/2addr v3, v1
    invoke-direct { p0, v7, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->caption(Ljava/lang/String;Z)Landroid/view/View;
    move-result-object v3
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v7, v5, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v8, v3, v7 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 413
    iget-object v3, v4, Lcom/innioasis/ipp/M3u$Plan;->missing:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v3
    if-eqz v3, :L5
    iget-object v3, v4, Lcom/innioasis/ipp/M3u$Plan;->dups:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v3
    if-eqz v3, :L5
    const/4 v3, 1
    goto :L6
  :L5
    const/4 v3, 0
  :L6
  .line 414
    const/4 v7, 0
  :L7
    iget-object v8, v4, Lcom/innioasis/ipp/M3u$Plan;->missing:Ljava/util/ArrayList;
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result v8
    const/high16 v9, 0x41500000
    if-ge v7, v8, :L8
  .line 415
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    iget-object v10, v4, Lcom/innioasis/ipp/M3u$Plan;->missing:Ljava/util/ArrayList;
    invoke-virtual { v10, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Ljava/lang/String;
    invoke-direct { p0, v10, v9 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v9
    invoke-direct { p0, v9 }, Lcom/innioasis/y1/activity/IppImportActivity;->item(Landroid/widget/TextView;)Landroid/view/View;
    move-result-object v9
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v5, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v8, v9, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 414
    add-int/lit8 v7, v7, 1
    goto :L7
  :L8
  .line 418
    const/4 v7, 0
  :L9
    iget-object v8, v4, Lcom/innioasis/ipp/M3u$Plan;->dups:Ljava/util/ArrayList;
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result v8
    if-ge v7, v8, :L10
  .line 419
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    new-array v10, v1, [Ljava/lang/Object;
    iget-object v11, v4, Lcom/innioasis/ipp/M3u$Plan;->dups:Ljava/util/ArrayList;
  .line 420
    invoke-virtual { v11, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v11
    aput-object v11, v10, v0
  .line 419
    const v11, 2131821152
    invoke-virtual { p0, v11, v10 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v10
    invoke-direct { p0, v10, v9 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v10
    invoke-direct { p0, v10 }, Lcom/innioasis/y1/activity/IppImportActivity;->item(Landroid/widget/TextView;)Landroid/view/View;
    move-result-object v10
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v11, v5, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v8, v10, v11 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 418
    add-int/lit8 v7, v7, 1
    goto :L9
  :L10
  .line 406
    add-int/lit8 v2, v2, 1
    goto/16 :L2
  :L11
  .line 424
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v0, v0 }, Landroid/widget/ScrollView;->scrollTo(II)V
  .line 425
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 32
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 58
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 8
  .line 63
    const-string v0, "m3u_import"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Help;->label(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 64
    if-eqz v0, :L0
    goto :L1
  :L0
    const-string v0, ""
  :L1
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 66
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 67
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 68
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct { v1, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
  .line 69
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 70
    new-instance v1, Landroid/widget/ScrollView;
    invoke-direct { v1, p0 }, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
  .line 71
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    const/4 v4, -1
    const/4 v5, -2
    invoke-virtual { v1, v3, v4, v5 }, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V
  .line 73
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct { v1, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 74
    invoke-virtual { v1, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 75
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, 0
    invoke-direct { v3, v4, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 76
    const/high16 v6, 0x3F800000
    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 77
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v6, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 78
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
  .line 79
    invoke-virtual { v3, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 80
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v3, v4, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 81
    invoke-virtual { v0, v1, v4, v4 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 84
    new-instance v1, Lcom/innioasis/y1/activity/IppImportActivity$Begin;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Begin;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z
  .line 85
    return-void
.end method

.method public longConfirm()V
  .registers 1
  .line 539
    return-void
.end method

.method paint()V
  .registers 7
  .line 355
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->paintPending:Z
  .line 356
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->name:Landroid/widget/TextView;
    if-eqz v1, :L3
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    if-nez v1, :L0
    goto :L3
  :L0
  .line 357
    iget v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->current:I
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    const/4 v3, 1
    sub-int/2addr v2, v3
    invoke-static { v1, v2 }, Ljava/lang/Math;->min(II)I
    move-result v1
  .line 358
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/M3u$Plan;
  .line 359
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->name:Landroid/widget/TextView;
    iget-boolean v5, v2, Lcom/innioasis/ipp/M3u$Plan;->fav:Z
    if-eqz v5, :L1
    const v2, 2131821035
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    goto :L2
  :L1
    iget-object v2, v2, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
  :L2
    invoke-virtual { v4, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 360
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->which:Landroid/widget/TextView;
    const/4 v4, 2
    new-array v5, v4, [Ljava/lang/Object;
    add-int/2addr v1, v3
  .line 361
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    aput-object v1, v5, v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    aput-object v1, v5, v3
  .line 360
    const v1, 2131821149
    invoke-virtual { p0, v1, v5 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v2, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 362
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->counts:Landroid/widget/TextView;
    new-array v2, v4, [Ljava/lang/Object;
    iget v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->doneEntries:I
  .line 363
    invoke-static { v4 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    aput-object v4, v2, v0
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->total:I
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    aput-object v0, v2, v3
  .line 362
    const v0, 2131821150
    invoke-virtual { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 364
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
    iget v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->doneEntries:I
    invoke-virtual { v0, v1 }, Landroid/widget/ProgressBar;->setProgress(I)V
  .line 365
    return-void
  :L3
  .line 356
    return-void
.end method

.method public quit()V
  .registers 2
  .line 549
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->running:Z
    if-nez v0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->finish()V
  :L0
  .line 550
    return-void
.end method

.method scrollToSel(Z)V
  .registers 6
  .line 237
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    iget v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->sel:I
    aget-object v0, v0, v1
  :L1
  .line 238
    if-eqz v0, :L7
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v1, :L7
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    if-eq v1, v2, :L2
    goto :L7
  :L2
  .line 239
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
    if-gtz v1, :L4
  .line 240
    if-eqz p1, :L3
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    new-instance v0, Lcom/innioasis/y1/activity/IppImportActivity$ScrollLater;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$ScrollLater;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    invoke-virtual { p1, v0 }, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z
  :L3
  .line 241
    return-void
  :L4
  .line 243
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { p1 }, Landroid/widget/ScrollView;->getScrollY()I
    move-result p1
  .line 244
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v1
  .line 245
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v2
    const/4 v3, 0
    if-ge v2, p1, :L5
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v0
    invoke-virtual { p1, v3, v0 }, Landroid/widget/ScrollView;->scrollTo(II)V
    goto :L6
  :L5
  .line 246
    invoke-virtual { v0 }, Landroid/view/View;->getBottom()I
    move-result v2
    add-int/2addr p1, v1
    if-le v2, p1, :L6
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v0 }, Landroid/view/View;->getBottom()I
    move-result v0
    sub-int/2addr v0, v1
    invoke-virtual { p1, v3, v0 }, Landroid/widget/ScrollView;->scrollTo(II)V
  :L6
  .line 247
    return-void
  :L7
  .line 238
    return-void
.end method

.method start()V
  .catchall { :L3 .. :L4 } :L5
  .registers 10
  .line 305
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 306
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 307
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 308
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
  .line 309
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
  .line 310
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->running:Z
  .line 311
    const/4 v2, 0
    iput v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->total:I
  .line 312
    nop
  :L1
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L2
    iget v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->total:I
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v4, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/M3u$Plan;
    iget-object v4, v4, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v4
    add-int/2addr v3, v4
    iput v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->total:I
    add-int/lit8 v2, v2, 1
    goto :L1
  :L2
  .line 314
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 315
    invoke-virtual { v2, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 316
    const/16 v3, 14
    const/16 v4, 10
    invoke-virtual { v2, v4, v3, v4, v4 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 318
    const/high16 v3, 0x41700000
    const-string v4, ""
    invoke-direct { p0, v4, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v3
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->name:Landroid/widget/TextView;
  .line 319
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->bold(Landroid/widget/TextView;)V
  .line 320
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->name:Landroid/widget/TextView;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, -1
    const/4 v7, -2
    invoke-direct { v5, v6, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v3, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 321
    const/high16 v3, 0x41500000
    invoke-direct { p0, v4, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v5
    iput-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->which:Landroid/widget/TextView;
  .line 322
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v8, v6, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v5, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 325
    new-instance v5, Landroid/widget/ProgressBar;
    const v8, 16842872
    invoke-direct { v5, p0, v0, v8 }, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    iput-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
  :L3
  .line 327
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v5, 2131231130
    invoke-virtual { v0, v5 }, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 328
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
    invoke-virtual { v5, v0 }, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 329
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
    invoke-virtual { v0, v5 }, Lcom/innioasis/y1/theme/ThemeManager;->setCustomBackground(Landroid/widget/ProgressBar;)V
  :L4
  .line 331
    goto :L6
  :L5
  .line 330
    move-exception v0
  :L6
  .line 332
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
    iget v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->total:I
    invoke-static { v1, v5 }, Ljava/lang/Math;->max(II)I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/widget/ProgressBar;->setMax(I)V
  .line 333
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v1, 8
    invoke-direct { v0, v6, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 334
    const/16 v5, 12
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
  .line 335
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I
  .line 336
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
    invoke-virtual { v2, v1, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 338
    invoke-direct { p0, v4, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->counts:Landroid/widget/TextView;
  .line 339
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v6, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 340
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v6, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v2, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 342
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->paint()V
  .line 343
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppImportActivity$Work;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Work;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    const-string v2, "ipp-m3u-import"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 344
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 345
    return-void
.end method

.method tick()V
  .registers 3
  .line 349
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->paintPending:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 350
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->paintPending:Z
  .line 351
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    new-instance v1, Lcom/innioasis/y1/activity/IppImportActivity$Paint;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Paint;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z
  .line 352
    return-void
.end method

.method work()V
  .catchall { :L1 .. :L2 } :L3
  .registers 8
  .line 368
    new-instance v0, Lcom/innioasis/ipp/M3u$Resolver;
    invoke-direct { v0 }, Lcom/innioasis/ipp/M3u$Resolver;-><init>()V
  .line 369
    new-instance v1, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
  .line 370
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L5
  .line 371
    iput v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->current:I
  .line 372
    iget v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->doneEntries:I
    iput v3, v1, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;->base:I
  .line 373
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/M3u$Plan;
  :L1
  .line 375
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getApplicationContext()Landroid/content/Context;
    move-result-object v4
    invoke-static { v4, v3, v0, v1 }, Lcom/innioasis/ipp/M3u;->apply(Landroid/content/Context;Lcom/innioasis/ipp/M3u$Plan;Lcom/innioasis/ipp/M3u$Resolver;Lcom/innioasis/ipp/M3u$Tick;)V
  :L2
  .line 378
    goto :L4
  :L3
  .line 376
    move-exception v4
  .line 377
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "m3u import "
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    iget-object v6, v3, Lcom/innioasis/ipp/M3u$Plan;->file:Ljava/lang/String;
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v6, ": "
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L4
  .line 379
    iget v4, v1, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;->base:I
    iget-object v3, v3, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    add-int/2addr v4, v3
    iput v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->doneEntries:I
  .line 380
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->tick()V
  .line 370
    add-int/lit8 v2, v2, 1
    goto :L0
  :L5
  .line 382
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    new-instance v1, Lcom/innioasis/y1/activity/IppImportActivity$Done;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z
  .line 383
    return-void
.end method

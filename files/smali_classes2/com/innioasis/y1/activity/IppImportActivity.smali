.class public final Lcom/innioasis/y1/activity/IppImportActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppImportActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppImportActivity$Begin;,
    Lcom/innioasis/y1/activity/IppImportActivity$Look;,
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

.field private body:Landroid/widget/FrameLayout;

.field private boxes:[Landroid/view/View;

.field private col:Lcom/innioasis/ipp/Column;

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

.field private volatile learned:Ljava/lang/String;

.field private listing:Z

.field private final main:Landroid/os/Handler;

.field private name:Landroid/widget/TextView;

.field private volatile paintPending:Z

.field private plans:Ljava/util/List;

.field private rows:[Landroid/view/View;

.field private running:Z

.field private scroller:Landroid/widget/ScrollView;

.field private step:I

.field private ticks:[Landroid/widget/ImageView;

.field private total:I

.field private values:[Landroid/widget/TextView;

.field private which:Landroid/widget/TextView;

.method public constructor <init>()V
  .registers 3
  .line 35
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 380
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->main:Landroid/os/Handler;
  .line 508
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb:I
    return-void
.end method

.method static synthetic access$000(Lcom/innioasis/y1/activity/IppImportActivity;)Z
  .registers 1
  .line 35
    iget-boolean p0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->finished:Z
    return p0
.end method

.method private static bold(Landroid/widget/TextView;)V
  .registers 3
  .line 479
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-virtual { p0, v0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 480
    return-void
.end method

.method private boxed(Landroid/view/View;I)Landroid/view/View;
  .registers 7
  .line 495
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct { v0, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 496
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 497
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -1
    invoke-direct { v2, v3, p2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, p1, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 498
    new-instance p1, Landroid/view/View;
    invoke-direct { p1, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 499
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb()I
    move-result p2
    const/high16 v2, 0x1F000000
    or-int/2addr p2, v2
    invoke-virtual { p1, p2 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 500
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v3, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 501
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->lastHair:Landroid/view/View;
  .line 502
    return-object v0
.end method

.method private caption(Ljava/lang/String;Z)Landroid/view/View;
  .registers 10
  .line 529
    const/high16 v0, 0x41500000
    invoke-direct { p0, p1, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object p1
  .line 530
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppImportActivity;->bold(Landroid/widget/TextView;)V
  .line 531
    const/16 v0, 16
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 532
    const/4 v0, 6
    const/4 v1, 4
    invoke-virtual { p1, v0, v1, v0, v1 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 533
    const/4 v0, 1
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 534
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { p1, v1 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 535
    invoke-virtual { p1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v1
    const v2, 16777215
    and-int/2addr v1, v2
  .line 537
    new-instance v3, Landroid/widget/TextView;
    invoke-direct { v3, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 538
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v5, -12779554
    invoke-virtual { v4, v3, v5, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 539
    invoke-virtual { v3 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v3
    and-int/2addr v2, v3
  .line 541
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 542
    invoke-virtual { v3, v0 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 543
    const/4 v0, 2
    const/high16 v4, 0x59000000
    const/4 v5, -1
    if-eqz p2, :L0
  .line 544
    new-instance p2, Landroid/view/View;
    invoke-direct { p2, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 545
    or-int v6, v1, v4
    invoke-virtual { p2, v6 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 546
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v6, v5, v0 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v3, p2, v6 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L0
  .line 548
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, -2
    invoke-direct { p2, v5, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v3, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 549
    new-instance p1, Landroid/view/View;
    invoke-direct { p1, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 550
    or-int p2, v1, v4
    invoke-virtual { p1, p2 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 551
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v5, v0 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v3, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 552
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result p1
    or-int/2addr p1, v2
    invoke-virtual { v3, p1 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  .line 553
    return-object v3
.end method

.method private dropHair()V
  .registers 3
  .line 512
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->lastHair:Landroid/view/View;
    if-eqz v0, :L0
    const/16 v1, 8
    invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
  :L0
  .line 513
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->lastHair:Landroid/view/View;
  .line 514
    return-void
.end method

.method private dropList()V
  .registers 3
  .line 206
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
    if-eqz v0, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->body:Landroid/widget/FrameLayout;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v0
    invoke-virtual { v1, v0 }, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V
  :L0
  .line 207
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->setVisibility(I)V
  .line 208
    return-void
.end method

.method private every()Z
  .registers 4
  .line 275
    nop
  .line 276
    const/4 v0, 1
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/M3u$Plan;
    iget-boolean v2, v2, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    and-int/2addr v0, v2
    add-int/lit8 v1, v1, 1
    goto :L0
  :L1
  .line 277
    return v0
.end method

.method private fit(I)V
  .registers 6
  .line 232
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v0 }, Landroid/widget/ScrollView;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 233
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
  .line 234
    if-gtz v1, :L0
  .line 235
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I
  .line 236
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131165782
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v2
    float-to-int v2, v2
    sub-int/2addr v1, v2
  :L0
  .line 238
    int-to-float v2, v1
    int-to-float p1, p1
    div-float/2addr v2, p1
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result p1
    const/4 v2, 2
    invoke-static { v2, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 239
    div-int v2, v1, p1
    iput v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->step:I
  .line 240
    add-int/lit8 v3, p1, -1
    iput v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->fitRows:I
  .line 241
    mul-int v2, v2, p1
    sub-int/2addr v1, v2
    const/4 p1, 0
    invoke-virtual { v0, p1, v1, p1, p1 }, Landroid/view/View;->setPadding(IIII)V
  .line 242
    return-void
.end method

.method private go()V
  .registers 6
  .line 298
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 299
    const/4 v1, 0
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L2
  .line 300
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/M3u$Plan;
  .line 301
    iget-boolean v4, v3, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    if-eqz v4, :L1
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 299
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 303
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
    if-eqz v2, :L3
  .line 304
    const v0, 2131821157
    invoke-static { p0, v0, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;
    move-result-object v0
  .line 305
    invoke-virtual { v0 }, Landroid/widget/Toast;->show()V
  .line 306
    return-void
  :L3
  .line 308
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
  .line 309
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
  .line 310
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
  .line 311
    return-void
.end method

.method private item(Landroid/widget/TextView;)Landroid/view/View;
  .registers 5
  .line 484
    const/4 v0, 1
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 485
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 486
    const/16 v0, 16
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 487
    const/16 v0, 8
    const/16 v1, 10
    const/4 v2, 0
    invoke-virtual { p1, v1, v2, v0, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 488
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0, p1, v2, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 489
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v1, -1
    invoke-virtual { v0, p1, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 490
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
  .line 518
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb:I
    if-gez v0, :L0
  .line 519
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 520
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 521
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 520
    const/4 v3, 0
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 522
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    iput v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb:I
  :L0
  .line 524
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb:I
    return v0
.end method

.method private label(I)Ljava/lang/String;
  .registers 3
  .line 245
    if-nez p1, :L0
    const p1, 2131820584
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I)Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L0
  .line 246
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
  .line 247
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
  .line 469
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 470
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 471
    sget-object p2, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
  .line 472
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 473
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 474
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p2
    const v1, 2131100252
    invoke-virtual { p2, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p2
  .line 473
    const/4 v1, 0
    invoke-virtual { p1, v0, p2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 475
    return-object v0
.end method

.method private moveSel(I)V
  .registers 4
  .line 266
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v0
  .line 267
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
    array-length v1, v1
    invoke-static { v0, p1, v1 }, Lcom/innioasis/ipp/Loop;->step(III)I
    move-result p1
  .line 268
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 269
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v1, p1 }, Lcom/innioasis/ipp/Column;->move(I)V
  .line 270
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
    array-length v1, v1
    add-int/lit8 v1, v1, -1
  .line 271
    if-eq v0, v1, :L1
    if-ne p1, v1, :L2
  :L1
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppImportActivity;->paintRow(I)V
  :L2
  .line 272
    return-void
.end method

.method private press()V
  .registers 7
  .line 281
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
  .line 282
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v1
  .line 283
    if-nez v1, :L4
  .line 284
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->every()Z
    move-result v1
  .line 285
    const/4 v2, 0
    const/4 v3, 0
  :L0
    if-ge v3, v0, :L1
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v4, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/M3u$Plan;
    xor-int/lit8 v5, v1, 1
    iput-boolean v5, v4, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    add-int/lit8 v3, v3, 1
    goto :L0
  :L1
  .line 286
    nop
  :L2
    if-gt v2, v0, :L3
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->repaint(I)V
    add-int/lit8 v2, v2, 1
    goto :L2
  :L3
  .line 287
    goto :L6
  :L4
    if-gt v1, v0, :L5
  .line 288
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    add-int/lit8 v2, v1, -1
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/M3u$Plan;
  .line 289
    iget-boolean v2, v0, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    xor-int/lit8 v2, v2, 1
    iput-boolean v2, v0, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
  .line 290
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppImportActivity;->repaint(I)V
  .line 291
    goto :L6
  :L5
  .line 292
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->go()V
  :L6
  .line 294
    return-void
.end method

.method private repaint(I)V
  .registers 3
  .line 220
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
    array-length v0, v0
    add-int/lit8 v0, v0, -1
    if-ge p1, v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Column;->repaint(I)V
    goto :L1
  :L0
  .line 221
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/activity/IppImportActivity;->paintRow(I)V
  :L1
  .line 222
    return-void
.end method

.method private step()I
  .registers 3
  .line 557
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
  .line 568
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
    if-eqz v0, :L0
    const/4 v0, -1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->moveSel(I)V
    goto :L1
  :L0
  .line 569
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
  .line 570
    return-void
.end method

.method backToList()V
  .registers 6
  .line 318
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 319
    const/4 v1, 0
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L2
  .line 320
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/M3u$Plan;
  .line 321
    iget-boolean v4, v3, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    if-eqz v4, :L1
    iget-object v3, v3, Lcom/innioasis/ipp/M3u$Plan;->file:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L1
  .line 319
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 323
    invoke-static { }, Lcom/innioasis/ipp/M3u;->scan()Ljava/util/List;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
  .line 324
    nop
  :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 325
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/M3u$Plan;
  .line 326
    iget-object v3, v2, Lcom/innioasis/ipp/M3u$Plan;->file:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v3
    iput-boolean v3, v2, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
  .line 324
    add-int/lit8 v1, v1, 1
    goto :L3
  :L4
  .line 328
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L5
  .line 329
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->finish()V
  .line 330
    return-void
  :L5
  .line 332
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->buildList()V
  .line 333
    return-void
.end method

.method begin()V
  .registers 6
  .line 95
    invoke-static { }, Lcom/innioasis/ipp/M3u;->scan()Ljava/util/List;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
  .line 96
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
  .line 97
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->finished:Z
  .line 99
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v0 }, Landroid/widget/ScrollView;->setFillViewport(Z)V
  .line 100
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    const/16 v1, 17
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 101
    const v0, 2131821148
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    const/high16 v2, 0x41700000
    invoke-direct { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v0
  .line 102
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setGravity(I)V
  .line 103
    const/16 v1, 16
    const/4 v2, 0
    invoke-virtual { v0, v1, v2, v1, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 104
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -1
    const/4 v4, -2
    invoke-direct { v2, v3, v4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v0, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 105
    return-void
  :L0
  .line 107
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->buildList()V
  .line 108
    return-void
.end method

.method buildList()V
  .registers 16
  .line 124
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
  .line 125
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
    const/4 v2, 0
    if-nez v1, :L0
    const/4 v1, 0
    goto :L1
  :L0
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v1
  :L1
  .line 126
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->dropList()V
  .line 127
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v3 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 128
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
    invoke-virtual { v3 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 129
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    add-int/lit8 v3, v3, 2
  .line 130
    new-array v4, v3, [Landroid/view/View;
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
  .line 131
    new-array v4, v3, [Landroid/widget/TextView;
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->labels:[Landroid/widget/TextView;
  .line 132
    new-array v4, v3, [Landroid/widget/TextView;
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->values:[Landroid/widget/TextView;
  .line 133
    new-array v4, v3, [Landroid/widget/ImageView;
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->ticks:[Landroid/widget/ImageView;
  .line 134
    new-array v4, v3, [Landroid/view/View;
    iput-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
  .line 135
    const/4 v4, 0
  :L2
    const/16 v5, 8
    const/4 v6, -1
    if-ge v4, v3, :L12
  .line 136
    new-instance v7, Landroid/widget/LinearLayout;
    invoke-direct { v7, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 137
    invoke-virtual { v7, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 138
    const/16 v8, 16
    invoke-virtual { v7, v8 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 139
    const/16 v8, 10
    const/4 v9, 5
    invoke-virtual { v7, v8, v2, v9, v2 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 141
    new-instance v8, Landroid/widget/ImageView;
    invoke-direct { v8, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 142
    invoke-static { v2 }, Lcom/innioasis/ipp/PickDialog;->box(Z)Landroid/graphics/Bitmap;
    move-result-object v9
    invoke-virtual { v8, v9 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 143
    const/4 v9, 4
    if-nez v4, :L3
    invoke-virtual { v8, v9 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L3
  .line 144
    const-string v10, "ipp_tick"
    invoke-virtual { v8, v10 }, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V
  .line 145
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v11, -2
    invoke-direct { v10, v11, v11 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 146
    const/4 v12, 6
    iput v12, v10, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 147
    invoke-virtual { v7, v8, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 149
    invoke-direct { p0, v4 }, Lcom/innioasis/y1/activity/IppImportActivity;->label(I)Ljava/lang/String;
    move-result-object v10
    const/high16 v13, 0x41880000
    invoke-direct { p0, v10, v13 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v10
  .line 150
    invoke-virtual { v10, v0 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 151
    sget-object v13, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v10, v13 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 152
    const v13, 2131362459
    invoke-virtual { v10, v13 }, Landroid/widget/TextView;->setId(I)V
  .line 153
    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v13, v2, v11 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 154
    const/high16 v14, 0x3F800000
    iput v14, v13, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 155
    invoke-virtual { v7, v10, v13 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 157
    const-string v13, ""
    const/high16 v14, 0x41700000
    invoke-direct { p0, v13, v14 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v13
  .line 158
    invoke-virtual { v13, v12, v2, v9, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 159
    const v9, 2131362437
    invoke-virtual { v13, v9 }, Landroid/widget/TextView;->setId(I)V
  .line 160
    if-lez v4, :L4
    iget-object v9, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v9 }, Ljava/util/List;->size()I
    move-result v9
    if-gt v4, v9, :L4
  .line 161
    iget-object v9, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    add-int/lit8 v12, v4, -1
    invoke-interface { v9, v12 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Lcom/innioasis/ipp/M3u$Plan;
    iget-object v9, v9, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v9 }, Ljava/util/ArrayList;->size()I
    move-result v9
    invoke-static { v9 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v13, v9 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L4
  .line 163
    invoke-virtual { v7, v13, v11, v11 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 165
    add-int/lit8 v9, v3, -1
    if-ne v4, v9, :L5
  .line 167
    invoke-virtual { v8, v5 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 168
    const v5, 2131362353
    invoke-virtual { v7, v5 }, Landroid/widget/LinearLayout;->setId(I)V
  .line 169
    const/16 v5, 17
    invoke-virtual { v10, v5 }, Landroid/widget/TextView;->setGravity(I)V
  .line 170
    invoke-static { v10 }, Lcom/innioasis/y1/activity/IppImportActivity;->bold(Landroid/widget/TextView;)V
  :L5
  .line 172
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
    aput-object v7, v5, v4
  .line 173
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->labels:[Landroid/widget/TextView;
    aput-object v10, v5, v4
  .line 174
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->values:[Landroid/widget/TextView;
    aput-object v13, v5, v4
  .line 175
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->ticks:[Landroid/widget/ImageView;
    aput-object v8, v5, v4
  .line 176
    iget v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->step:I
    if-nez v5, :L6
    invoke-virtual { v10 }, Landroid/widget/TextView;->getTextSize()F
    move-result v5
    const v8, 1075419546
    mul-float v5, v5, v8
    float-to-int v5, v5
    add-int/2addr v5, v0
    invoke-direct { p0, v5 }, Lcom/innioasis/y1/activity/IppImportActivity;->fit(I)V
  :L6
  .line 177
    if-ne v4, v9, :L10
  .line 179
    iget v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->fitRows:I
    if-lt v9, v5, :L7
    const/4 v5, 1
    goto :L8
  :L7
    const/4 v5, 0
  :L8
  .line 180
    iget v8, p0, Lcom/innioasis/y1/activity/IppImportActivity;->step:I
  .line 181
    if-nez v5, :L9
  .line 182
    new-instance v5, Landroid/view/View;
    invoke-direct { v5, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 183
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->itemRgb()I
    move-result v9
    const/high16 v10, 0x1F000000
    or-int/2addr v9, v10
    invoke-virtual { v5, v9 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 184
    iget-object v9, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v6, v0 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v9, v5, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 185
    add-int/lit8 v8, v8, -1
  :L9
  .line 187
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v9, v6, v8 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v5, v7, v9 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 188
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
    aput-object v7, v5, v4
  .line 189
    goto :L11
  :L10
  .line 190
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
    iget v8, p0, Lcom/innioasis/y1/activity/IppImportActivity;->step:I
    sub-int/2addr v8, v0
    invoke-direct { p0, v7, v8 }, Lcom/innioasis/y1/activity/IppImportActivity;->boxed(Landroid/view/View;I)Landroid/view/View;
    move-result-object v7
    aput-object v7, v5, v4
  .line 191
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
    aget-object v5, v5, v4
    new-instance v7, Landroid/view/ViewGroup$LayoutParams;
    invoke-direct { v7, v6, v11 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v5, v7 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L11
  .line 135
    add-int/lit8 v4, v4, 1
    goto/16 :L2
  :L12
  .line 194
    sub-int/2addr v3, v0
    new-array v0, v3, [Landroid/view/View;
  .line 195
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
    invoke-static { v4, v2, v0, v2, v3 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 196
    new-instance v2, Lcom/innioasis/ipp/Column;
    new-instance v4, Lcom/innioasis/y1/activity/IppImportActivity$Look;
    invoke-direct { v4, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Look;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    invoke-direct { v2, p0, v0, v4 }, Lcom/innioasis/ipp/Column;-><init>(Landroid/content/Context;[Landroid/view/View;Lcom/innioasis/ipp/Column$Painter;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
  .line 197
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->body:Landroid/widget/FrameLayout;
    invoke-virtual { v2 }, Lcom/innioasis/ipp/Column;->list()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v2
    invoke-virtual { v0, v2, v6, v6 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V
  .line 198
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v0, v5 }, Landroid/widget/ScrollView;->setVisibility(I)V
  .line 199
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
    const/4 v8, 0
    const v9, 2131231052
    const v10, -12779554
    const/4 v11, -1
    const v12, 2131362353
    move-object v7, p0
    invoke-virtual/range { v6 .. v12 }, Lcom/innioasis/ipp/Column;->bar(Landroid/app/Activity;ZIIII)V
  .line 200
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
    invoke-static { v1, v3 }, Ljava/lang/Math;->min(II)I
    move-result v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/ipp/Column;->set(I)V
  .line 201
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->paintRow(I)V
  .line 202
    return-void
.end method

.method public clockwise()V
  .registers 4
  .line 562
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
    if-eqz v0, :L0
    const/4 v0, 1
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->moveSel(I)V
    goto :L1
  :L0
  .line 563
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->finished:Z
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L1
    const/4 v1, 0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->step()I
    move-result v2
    invoke-virtual { v0, v1, v2 }, Landroid/widget/ScrollView;->scrollBy(II)V
  :L1
  .line 564
    return-void
.end method

.method public confirm()V
  .registers 2
  .line 574
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->listing:Z
    if-eqz v0, :L0
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->press()V
  :L0
  .line 575
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 584
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L0
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->running:Z
    if-nez p1, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->finish()V
  :L0
  .line 585
    return-void
.end method

.method done()V
  .registers 13
  .line 425
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->running:Z
  .line 426
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->finished:Z
  .line 427
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v2 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 428
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->learned:Ljava/lang/String;
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/M3uBase;->offer(Landroid/app/Activity;Ljava/lang/String;)V
  .line 430
    nop
  .line 431
    nop
  .line 432
    const/4 v2, 0
    const/4 v3, 0
    const/4 v4, 0
  :L0
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v5 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v2, v5, :L1
  .line 433
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v5, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/ipp/M3u$Plan;
  .line 434
    iget v6, v5, Lcom/innioasis/ipp/M3u$Plan;->found:I
    add-int/2addr v3, v6
  .line 435
    iget-object v6, v5, Lcom/innioasis/ipp/M3u$Plan;->missing:Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v6
    iget-object v5, v5, Lcom/innioasis/ipp/M3u$Plan;->dups:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v5
    add-int/2addr v6, v5
    add-int/2addr v4, v6
  .line 432
    add-int/lit8 v2, v2, 1
    goto :L0
  :L1
  .line 437
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
  .line 439
    const/4 v2, 0
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->lastHair:Landroid/view/View;
  .line 440
    const/4 v2, 2
    new-array v2, v2, [Ljava/lang/Object;
  .line 441
    invoke-static { v3 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v3
    aput-object v3, v2, v0
    invoke-static { v4 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v3
    aput-object v3, v2, v1
  .line 440
    const v3, 2131821151
    invoke-virtual { p0, v3, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
    const/high16 v3, 0x41700000
    invoke-direct { p0, v2, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v2
  .line 442
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->bold(Landroid/widget/TextView;)V
  .line 443
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    invoke-direct { p0, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->item(Landroid/widget/TextView;)Landroid/view/View;
    move-result-object v2
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -1
    const/4 v6, -2
    invoke-direct { v4, v5, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v3, v2, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 445
    nop
  .line 446
    const/4 v2, 0
    const/4 v3, 0
  :L2
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v4 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v2, v4, :L11
  .line 447
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v4, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/M3u$Plan;
  .line 448
    iget-boolean v7, v4, Lcom/innioasis/ipp/M3u$Plan;->fav:Z
    if-eqz v7, :L3
    const v7, 2131821035
    invoke-virtual { p0, v7 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I)Ljava/lang/String;
    move-result-object v7
    goto :L4
  :L3
    iget-object v7, v4, Lcom/innioasis/ipp/M3u$Plan;->name:Ljava/lang/String;
  :L4
  .line 449
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->dropHair()V
  .line 451
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
  .line 453
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
  .line 454
    const/4 v7, 0
  :L7
    iget-object v8, v4, Lcom/innioasis/ipp/M3u$Plan;->missing:Ljava/util/ArrayList;
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result v8
    const/high16 v9, 0x41500000
    if-ge v7, v8, :L8
  .line 455
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
  .line 454
    add-int/lit8 v7, v7, 1
    goto :L7
  :L8
  .line 458
    const/4 v7, 0
  :L9
    iget-object v8, v4, Lcom/innioasis/ipp/M3u$Plan;->dups:Ljava/util/ArrayList;
    invoke-virtual { v8 }, Ljava/util/ArrayList;->size()I
    move-result v8
    if-ge v7, v8, :L10
  .line 459
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    new-array v10, v1, [Ljava/lang/Object;
    iget-object v11, v4, Lcom/innioasis/ipp/M3u$Plan;->dups:Ljava/util/ArrayList;
  .line 460
    invoke-virtual { v11, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v11
    aput-object v11, v10, v0
  .line 459
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
  .line 458
    add-int/lit8 v7, v7, 1
    goto :L9
  :L10
  .line 446
    add-int/lit8 v2, v2, 1
    goto/16 :L2
  :L11
  .line 464
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v0, v0 }, Landroid/widget/ScrollView;->scrollTo(II)V
  .line 465
    return-void
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 35
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 63
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 9
  .line 68
    const-string v0, "m3u_import"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Help;->label(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 69
    if-eqz v0, :L0
    goto :L1
  :L0
    const-string v0, ""
  :L1
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppImportActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 71
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 72
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 73
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct { v1, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
  .line 74
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 75
    new-instance v1, Landroid/widget/ScrollView;
    invoke-direct { v1, p0 }, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
  .line 76
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    const/4 v4, -1
    const/4 v5, -2
    invoke-virtual { v1, v3, v4, v5 }, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V
  .line 78
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct { v1, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 79
    invoke-virtual { v1, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 80
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, 0
    invoke-direct { v3, v4, v6 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 81
    const/high16 v6, 0x3F800000
    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 82
    new-instance v6, Landroid/widget/FrameLayout;
    invoke-direct { v6, p0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    iput-object v6, p0, Lcom/innioasis/y1/activity/IppImportActivity;->body:Landroid/widget/FrameLayout;
  .line 83
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppImportActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v6, v7, v4, v4 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V
  .line 84
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppImportActivity;->body:Landroid/widget/FrameLayout;
    invoke-virtual { v1, v6, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 85
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
  .line 86
    invoke-virtual { v3, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 87
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v3, v4, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v2, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 88
    invoke-virtual { v0, v1, v4, v4 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 91
    new-instance v1, Lcom/innioasis/y1/activity/IppImportActivity$Begin;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Begin;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z
  .line 92
    return-void
.end method

.method public longConfirm()V
  .registers 1
  .line 579
    return-void
.end method

.method paint()V
  .registers 7
  .line 390
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->paintPending:Z
  .line 391
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->name:Landroid/widget/TextView;
    if-eqz v1, :L3
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    if-nez v1, :L0
    goto :L3
  :L0
  .line 392
    iget v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->current:I
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    const/4 v3, 1
    sub-int/2addr v2, v3
    invoke-static { v1, v2 }, Ljava/lang/Math;->min(II)I
    move-result v1
  .line 393
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/M3u$Plan;
  .line 394
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
  .line 395
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->which:Landroid/widget/TextView;
    const/4 v4, 2
    new-array v5, v4, [Ljava/lang/Object;
    add-int/2addr v1, v3
  .line 396
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    aput-object v1, v5, v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    aput-object v1, v5, v3
  .line 395
    const v1, 2131821149
    invoke-virtual { p0, v1, v5 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v2, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 397
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->counts:Landroid/widget/TextView;
    new-array v2, v4, [Ljava/lang/Object;
    iget v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->doneEntries:I
  .line 398
    invoke-static { v4 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    aput-object v4, v2, v0
    iget v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->total:I
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    aput-object v0, v2, v3
  .line 397
    const v0, 2131821150
    invoke-virtual { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppImportActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 399
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
    iget v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->doneEntries:I
    invoke-virtual { v0, v1 }, Landroid/widget/ProgressBar;->setProgress(I)V
  .line 400
    return-void
  :L3
  .line 391
    return-void
.end method

.method paintRow(I)V
  .registers 10
  .line 251
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Column;->sel()I
    move-result v0
    const/4 v1, 1
    const/4 v2, 0
    if-ne p1, v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 252
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->col:Lcom/innioasis/ipp/Column;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/Column;->barred()Z
    move-result v3
    if-nez v3, :L4
  .line 253
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
  :L4
  .line 255
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->labels:[Landroid/widget/TextView;
    aget-object v4, v4, p1
    const v5, -12779554
    const/4 v6, -1
    if-eqz v0, :L5
    const v7, -12779554
    goto :L6
  :L5
    const/4 v7, -1
  :L6
    invoke-virtual { v3, v4, v7, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 256
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->values:[Landroid/widget/TextView;
    aget-object v4, v4, p1
    if-eqz v0, :L7
    goto :L8
  :L7
    const/4 v5, -1
  :L8
    invoke-virtual { v3, v4, v5, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 258
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->ticks:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->labels:[Landroid/widget/TextView;
    aget-object v3, v3, p1
    invoke-virtual { v3 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v3
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 259
    if-lez p1, :L9
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-gt p1, v0, :L9
    const/4 v2, 1
  :L9
  .line 260
    if-eqz v2, :L10
  .line 261
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->ticks:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->all:Ljava/util/List;
    sub-int/2addr p1, v1
    invoke-interface { v2, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/ipp/M3u$Plan;
    iget-boolean p1, p1, Lcom/innioasis/ipp/M3u$Plan;->picked:Z
    invoke-static { p1 }, Lcom/innioasis/ipp/PickDialog;->box(Z)Landroid/graphics/Bitmap;
    move-result-object p1
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L10
  .line 263
    return-void
.end method

.method public quit()V
  .registers 2
  .line 589
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->running:Z
    if-nez v0, :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->finish()V
  :L0
  .line 590
    return-void
.end method

.method start()V
  .catchall { :L3 .. :L4 } :L5
  .registers 10
  .line 336
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 337
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->dropList()V
  .line 338
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 339
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->footer:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 340
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->rows:[Landroid/view/View;
  .line 341
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->boxes:[Landroid/view/View;
  .line 342
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->running:Z
  .line 343
    const/4 v2, 0
    iput v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->total:I
  .line 344
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
  .line 346
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 347
    invoke-virtual { v2, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 348
    const/16 v3, 14
    const/16 v4, 10
    invoke-virtual { v2, v4, v3, v4, v4 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 350
    const/high16 v3, 0x41700000
    const-string v4, ""
    invoke-direct { p0, v4, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v3
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->name:Landroid/widget/TextView;
  .line 351
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->bold(Landroid/widget/TextView;)V
  .line 352
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->name:Landroid/widget/TextView;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, -1
    const/4 v7, -2
    invoke-direct { v5, v6, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v3, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 353
    const/high16 v3, 0x41500000
    invoke-direct { p0, v4, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v5
    iput-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->which:Landroid/widget/TextView;
  .line 354
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v8, v6, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v5, v8 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 357
    new-instance v5, Landroid/widget/ProgressBar;
    const v8, 16842872
    invoke-direct { v5, p0, v0, v8 }, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    iput-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
  :L3
  .line 359
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v5, 2131231130
    invoke-virtual { v0, v5 }, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 360
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
    invoke-virtual { v5, v0 }, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 361
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
    invoke-virtual { v0, v5 }, Lcom/innioasis/y1/theme/ThemeManager;->setCustomBackground(Landroid/widget/ProgressBar;)V
  :L4
  .line 363
    goto :L6
  :L5
  .line 362
    move-exception v0
  :L6
  .line 364
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
    iget v5, p0, Lcom/innioasis/y1/activity/IppImportActivity;->total:I
    invoke-static { v1, v5 }, Ljava/lang/Math;->max(II)I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/widget/ProgressBar;->setMax(I)V
  .line 365
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v1, 8
    invoke-direct { v0, v6, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 366
    const/16 v5, 12
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
  .line 367
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I
  .line 368
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppImportActivity;->bar:Landroid/widget/ProgressBar;
    invoke-virtual { v2, v1, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 370
    invoke-direct { p0, v4, v3 }, Lcom/innioasis/y1/activity/IppImportActivity;->line(Ljava/lang/String;F)Landroid/widget/TextView;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->counts:Landroid/widget/TextView;
  .line 371
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v6, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 372
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->container:Landroid/widget/LinearLayout;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v6, v7 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v2, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 374
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->paint()V
  .line 375
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/y1/activity/IppImportActivity$Work;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Work;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    const-string v2, "ipp-m3u-import"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 376
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 377
    return-void
.end method

.method tick()V
  .registers 3
  .line 384
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->paintPending:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 385
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->paintPending:Z
  .line 386
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->main:Landroid/os/Handler;
    new-instance v1, Lcom/innioasis/y1/activity/IppImportActivity$Paint;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Paint;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 387
    return-void
.end method

.method work()V
  .catchall { :L1 .. :L2 } :L3
  .registers 8
  .line 403
    new-instance v0, Lcom/innioasis/ipp/M3u$Resolver;
    invoke-direct { v0 }, Lcom/innioasis/ipp/M3u$Resolver;-><init>()V
  .line 404
    new-instance v1, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
  .line 405
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L5
  .line 406
    iput v2, p0, Lcom/innioasis/y1/activity/IppImportActivity;->current:I
  .line 407
    iget v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->doneEntries:I
    iput v3, v1, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;->base:I
  .line 408
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppImportActivity;->plans:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/M3u$Plan;
  :L1
  .line 410
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->getApplicationContext()Landroid/content/Context;
    move-result-object v4
    invoke-static { v4, v3, v0, v1 }, Lcom/innioasis/ipp/M3u;->apply(Landroid/content/Context;Lcom/innioasis/ipp/M3u$Plan;Lcom/innioasis/ipp/M3u$Resolver;Lcom/innioasis/ipp/M3u$Tick;)V
  :L2
  .line 413
    goto :L4
  :L3
  .line 411
    move-exception v4
  .line 412
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
  .line 414
    iget v4, v1, Lcom/innioasis/y1/activity/IppImportActivity$Ticker;->base:I
    iget-object v3, v3, Lcom/innioasis/ipp/M3u$Plan;->lines:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    add-int/2addr v4, v3
    iput v4, p0, Lcom/innioasis/y1/activity/IppImportActivity;->doneEntries:I
  .line 415
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppImportActivity;->tick()V
  .line 405
    add-int/lit8 v2, v2, 1
    goto :L0
  :L5
  .line 417
    iget-object v0, v0, Lcom/innioasis/ipp/M3u$Resolver;->learn:Lcom/innioasis/ipp/M3uBase$Learn;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/M3uBase$Learn;->best()Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->learned:Ljava/lang/String;
  .line 418
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppImportActivity;->main:Landroid/os/Handler;
    new-instance v1, Lcom/innioasis/y1/activity/IppImportActivity$Done;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppImportActivity$Done;-><init>(Lcom/innioasis/y1/activity/IppImportActivity;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 419
    return-void
.end method

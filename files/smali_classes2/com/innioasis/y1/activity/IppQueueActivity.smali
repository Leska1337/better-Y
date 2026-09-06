.class public final Lcom/innioasis/y1/activity/IppQueueActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/y1/activity/IppQueueActivity$Pin;,
    Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;,
    Lcom/innioasis/y1/activity/IppQueueActivity$Tail;,
    Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;,
    Lcom/innioasis/y1/activity/IppQueueActivity$ScrollTask;,
    Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;,
    Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;,
    Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;,
    Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
  }
.end annotation

.field private final static ACCENT:I = 0

.field private final static BLINK_MS:I = 500

.field private final static CAPTION_PAD:I = 3

.field private final static CAPTION_SP:F = 12.0F

.field private final static COVER_PX:I = 50

.field private final static HAIR_ALPHA:I = 520093696

.field private final static HAIR_H:I = 1

.field private final static PLAY_ALPHA:I = 771751936

.field private final static PLAY_NAME_SP:F = 18.0F

.field private final static PLAY_SUB_SP:F = 14.0F

.field private final static RULE_H:I = 2

.field private final static SEP:Ljava/lang/String; = " \u2014 "

.field private final static SYNC_ROWS_MIN:I = 8

.field private autoHeaderDone:Z

.field private blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;

.field private blinkOn:Z

.field private final capLabels:Ljava/util/ArrayList;

.field private final capViews:Ljava/util/ArrayList;

.field private childIndex:[I

.field private container:Landroid/widget/LinearLayout;

.field private coverArt:Landroid/graphics/Bitmap;

.field private coverPath:Ljava/lang/String;

.field private dotViews:[Landroid/widget/ImageView;

.field private header:Landroid/widget/LinearLayout;

.field private labels:[Ljava/lang/String;

.field private lastHair:Landroid/view/View;

.field private manualHeaderDone:Z

.field private final markCache:Ljava/util/HashMap;

.field private final marked:Ljava/util/HashSet;

.field private menuDlg:Lcom/innioasis/music/util/SubMenuDialog;

.field private multi:Z

.field private pinned:Landroid/widget/LinearLayout;

.field private pinnedFirst:Ljava/lang/String;

.field private pinnedShown:Ljava/lang/String;

.field private pinnedText:Landroid/widget/TextView;

.field private playBase:I

.field private playExtra:I

.field private final resolvedByPath:Ljava/util/HashMap;

.field private rowViews:[Landroid/view/View;

.field private rows:Ljava/util/List;

.field private scrollPending:Z

.field private scroller:Landroid/widget/ScrollView;

.field private sel:I

.field private subViews:[Landroid/widget/TextView;

.field private tagViews:[Landroid/widget/TextView;

.field private tailFrom:I

.field private tailPending:Z

.field private tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;

.field private titleViews:[Landroid/widget/TextView;

.field private watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;

.method static constructor <clinit>()V
  .registers 1
  .line 65
    const-string v0, "#3CFFDE"
    invoke-static { v0 }, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    move-result v0
    sput v0, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    return-void
.end method

.method public constructor <init>()V
  .registers 2
  .line 63
    invoke-direct { p0 }, Lcom/innioasis/y1/base/BaseActivity;-><init>()V
  .line 176
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capViews:Ljava/util/ArrayList;
  .line 177
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capLabels:Ljava/util/ArrayList;
  .line 189
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
  .line 197
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
  .line 205
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    return-void
.end method

.method private addToPlaylist(Ljava/util/UUID;)V
  .registers 6
  .line 1443
    if-nez p1, :L0
    return-void
  :L0
  .line 1444
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1445
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->pickedRows()Ljava/util/List;
    move-result-object v1
  .line 1446
    const/4 v2, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 1447
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 1448
    if-eqz v3, :L2
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 1446
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 1450
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1451
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repaintAll()V
  .line 1452
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L4
    return-void
  :L4
  .line 1453
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;
    invoke-direct { v2, v0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;-><init>(Ljava/util/List;Ljava/util/UUID;)V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 1454
    return-void
.end method

.method private artistAt(I)Ljava/lang/String;
  .registers 4
  .line 1099
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object p1
  .line 1100
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->titleLen(Ljava/lang/String;)I
    move-result v0
    const-string v1, " \u2014 "
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v1
    add-int/2addr v0, v1
  .line 1101
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-lt v0, v1, :L0
    const-string p1, ""
    goto :L1
  :L0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p1
  :L1
    return-object p1
.end method

.method private artistsOf(I)Ljava/util/List;
  .registers 2
  .line 1494
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object p1
    return-object p1
.end method

.method private band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
  .registers 13
  .line 928
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 929
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget v2, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    const/4 v3, 1
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 930
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v1
    const v2, 16777215
    and-int/2addr v1, v2
  .line 931
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 932
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    const v6, 2131100252
    invoke-virtual { v5, v6 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v5
  .line 931
    const/4 v6, 0
    invoke-virtual { v4, v0, v5, v6 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 933
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    and-int/2addr v0, v2
  .line 935
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 936
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 937
    const/4 v3, -1
    if-eqz p3, :L0
    invoke-direct { p0, v0, p3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rule(II)Landroid/view/View;
    move-result-object v4
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v5, v3, p4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v4, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L0
  .line 938
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v4, v3, p2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, p1, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 939
    if-eqz p3, :L1
    invoke-direct { p0, v0, p3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rule(II)Landroid/view/View;
    move-result-object p1
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v3, p4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L1
  .line 940
    or-int p1, v1, p5
    invoke-virtual { v2, p1 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  .line 941
    return-object v2
.end method

.method private static bold(Landroid/widget/TextView;)V
  .registers 3
  .line 1009
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-virtual { p0, v0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 1010
    return-void
.end method

.method private build(II)V
  .registers 19
  .line 374
    move-object/from16 v6, p0
    move/from16 v7, p1
  :L0
    move/from16 v8, p2
    if-ge v7, v8, :L17
  .line 375
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 376
    const/4 v1, 1
    const/4 v2, 0
    if-nez v7, :L1
    const/4 v3, 1
    goto :L2
  :L1
    const/4 v3, 0
  :L2
  .line 377
    invoke-static { v7 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v4
  .line 378
    invoke-static { v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v5
  .line 384
    if-nez v3, :L3
    if-eqz v4, :L3
    iget-boolean v9, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->manualHeaderDone:Z
    if-nez v9, :L3
  .line 385
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->manualCaption()Ljava/lang/String;
    move-result-object v4
    invoke-direct { v6, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->caption(Ljava/lang/String;)V
  .line 386
    iput-boolean v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->manualHeaderDone:Z
    goto :L4
  :L3
  .line 387
    if-nez v3, :L4
    if-nez v4, :L4
    iget-boolean v4, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->autoHeaderDone:Z
    if-nez v4, :L4
  .line 388
    new-array v4, v1, [Ljava/lang/Object;
  .line 389
    invoke-static { }, Lcom/innioasis/ipp/Queue;->source()Ljava/lang/String;
    move-result-object v9
    aput-object v9, v4, v2
  .line 388
    const v9, 2131821079
    invoke-virtual { v6, v9, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v4
    invoke-direct { v6, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->caption(Ljava/lang/String;)V
  .line 390
    iput-boolean v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->autoHeaderDone:Z
  :L4
  .line 393
    new-instance v4, Landroid/widget/LinearLayout;
    invoke-direct { v4, v6 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 394
    invoke-virtual { v4, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 395
    invoke-virtual { v4, v2 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 396
    const/16 v9, 16
    invoke-virtual { v4, v9 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 397
    const/4 v10, 5
    invoke-virtual { v4, v10, v2, v10, v2 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 401
    const/4 v10, 0
    if-eqz v3, :L5
    invoke-direct { v6, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->cover(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v0
    goto :L6
  :L5
    move-object v0, v10
  :L6
  .line 402
    new-instance v11, Landroid/widget/TextView;
    invoke-direct { v11, v6 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 403
    const/16 v12, 50
    const/16 v13, 8
    const/4 v14, -2
    if-eqz v3, :L8
  .line 404
    if-eqz v0, :L7
  .line 405
    new-instance v15, Landroid/widget/ImageView;
    invoke-direct { v15, v6 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 406
    invoke-virtual { v15, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 407
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v0, v12, v12 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 408
    iput v13, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 409
    invoke-virtual { v4, v15, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 410
    goto :L9
  :L7
  .line 411
    invoke-virtual { v11, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 412
    invoke-static { v11 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 413
    invoke-virtual { v11, v2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 414
    invoke-virtual { v11, v9 }, Landroid/widget/TextView;->setGravity(I)V
  .line 415
    invoke-virtual { v11, v2, v2, v13, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 416
    const-string v0, "\u25b6"
    invoke-virtual { v11, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 417
    invoke-virtual { v4, v11, v14, v14 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
    goto :L9
  :L8
  .line 423
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct { v0, v6 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 424
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v15, v14, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 425
    iput v13, v15, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 426
    invoke-virtual { v4, v0, v15 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 427
    iget-object v13, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->dotViews:[Landroid/widget/ImageView;
    aput-object v0, v13, v7
  :L9
  .line 430
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, v6 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 431
    if-eqz v3, :L10
    const/high16 v5, 0x41900000
  :L10
    invoke-virtual { v0, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 433
    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v0, v5, v2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 434
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 435
    invoke-virtual { v0, v9 }, Landroid/widget/TextView;->setGravity(I)V
  .line 436
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 438
    nop
  .line 439
    const/high16 v5, 0x3F800000
    const/4 v13, -1
    if-eqz v3, :L11
  .line 443
    invoke-direct { v6, v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->nameAt(I)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v0, v10 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 444
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 446
    new-instance v10, Landroid/widget/TextView;
    invoke-direct { v10, v6 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 447
    const/high16 v15, 0x41600000
    invoke-virtual { v10, v15 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 448
    sget-object v15, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v10, v15, v2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 449
    invoke-virtual { v10, v2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 450
    invoke-virtual { v10, v9 }, Landroid/widget/TextView;->setGravity(I)V
  .line 451
    invoke-virtual { v10, v1 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 452
    sget-object v15, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v10, v15 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 453
    invoke-direct { v6, v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistAt(I)Ljava/lang/String;
    move-result-object v15
    invoke-virtual { v10, v15 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 455
    new-instance v15, Landroid/widget/LinearLayout;
    invoke-direct { v15, v6 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 456
    invoke-virtual { v15, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 457
    invoke-virtual { v15, v9 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 458
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v13, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v15, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 459
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v13, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v15, v10, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 460
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v2, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 461
    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 462
    invoke-virtual { v4, v15, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 463
    goto :L12
  :L11
  .line 464
    invoke-direct { v6, v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 465
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v2, v13 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 466
    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 467
    invoke-virtual { v4, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L12
  .line 470
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    aput-object v4, v1, v7
  .line 471
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->tagViews:[Landroid/widget/TextView;
    aput-object v11, v1, v7
  .line 472
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
    aput-object v0, v1, v7
  .line 473
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->subViews:[Landroid/widget/TextView;
    aput-object v10, v1, v7
  .line 474
    invoke-direct { v6, v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paint(I)V
  .line 478
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rowHeight(Landroid/widget/TextView;)I
    move-result v0
  .line 481
    if-eqz v3, :L13
  .line 482
    invoke-static { v10 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rowHeight(Landroid/widget/TextView;)I
    move-result v1
    add-int/2addr v0, v1
    invoke-static { v0, v12 }, Ljava/lang/Math;->max(II)I
    move-result v0
  .line 483
    iput v0, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->playBase:I
    move v2, v0
    goto :L14
  :L13
  .line 481
    move v2, v0
  :L14
  .line 485
    if-eqz v3, :L15
  .line 490
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    const v1, 2131820769
    invoke-virtual { v6, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-direct { v6, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->divider(Ljava/lang/String;)Landroid/view/View;
    move-result-object v1
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->dividerParams()Landroid/widget/LinearLayout$LayoutParams;
    move-result-object v3
    invoke-virtual { v0, v1, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 494
    iget-object v9, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    const/4 v3, 0
    const/4 v5, 0
    const/high16 v10, 0x2E000000
    move-object/from16 v0, p0
    move-object v1, v4
    move v4, v5
    move v5, v10
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppQueueActivity;->band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
    move-result-object v0
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v13, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v9, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 496
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
    aput v13, v0, v7
    goto :L16
  :L15
  .line 502
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v1 }, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v1
    aput v1, v0, v7
  .line 503
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-direct { v6, v4, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rowBox(Landroid/view/View;I)Landroid/widget/LinearLayout;
    move-result-object v1
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v2, v13, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, v1, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L16
  .line 374
    add-int/lit8 v7, v7, 1
    goto/16 :L0
  :L17
  .line 506
    return-void
.end method

.method private cancelTail()V
  .registers 3
  .line 536
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
  .line 537
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-eqz v0, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    if-eqz v1, :L0
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L0
  .line 538
    return-void
.end method

.method private caption(Ljava/lang/String;)V
  .registers 4
  .line 752
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
    if-nez v0, :L0
  .line 753
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
  .line 754
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setPinned(Ljava/lang/String;)V
  .line 755
    return-void
  :L0
  .line 759
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->dropHair()V
  .line 760
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->divider(Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
  .line 761
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capViews:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 762
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capLabels:Ljava/util/ArrayList;
    invoke-virtual { v1, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 763
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->dividerParams()Landroid/widget/LinearLayout$LayoutParams;
    move-result-object v1
    invoke-virtual { p1, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 764
    return-void
.end method

.method private captionView(Ljava/lang/String;)Landroid/widget/TextView;
  .registers 6
  .line 896
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 897
    const/high16 v1, 0x41400000
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 898
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 899
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 900
    const/16 v2, 16
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 903
    const/4 v2, 5
    const/4 v3, 3
    invoke-virtual { v0, v2, v3, v2, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 904
    const/4 v2, 1
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 905
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 906
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 907
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 908
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 907
    invoke-virtual { p1, v0, v2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 909
    return-object v0
.end method

.method private cover(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/Exception; { :L0 .. :L5 } :L6
  .registers 6
  .line 1032
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 1033
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 1034
    if-eqz v1, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverPath:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverArt:Landroid/graphics/Bitmap;
    if-eqz v2, :L1
    return-object v2
  :L1
  .line 1035
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 1036
    if-eqz v2, :L2
    const/16 v3, 50
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v2
    goto :L3
  :L2
    move-object v2, v0
  :L3
  .line 1037
    if-nez v2, :L4
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L4
  .line 1038
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverPath:Ljava/lang/String;
  .line 1039
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverArt:Landroid/graphics/Bitmap;
  :L5
  .line 1040
    return-object v2
  :L6
  .line 1041
    move-exception p1
  .line 1042
    return-object v0
.end method

.method private divider(Ljava/lang/String;)Landroid/view/View;
  .registers 8
  .line 741
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->captionView(Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v1
    const/4 v2, -2
    const/high16 v3, 0x59000000
    const/4 v4, 2
    const/high16 v5, 0x59000000
    move-object v0, p0
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppQueueActivity;->band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
    move-result-object p1
    return-object p1
.end method

.method private dividerParams()Landroid/widget/LinearLayout$LayoutParams;
  .registers 4
  .line 986
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, -1
    const/4 v2, -2
    invoke-direct { v0, v1, v2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    return-object v0
.end method

.method private dropHair()V
  .registers 3
  .line 964
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lastHair:Landroid/view/View;
    if-eqz v0, :L0
    const/16 v1, 8
    invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
  :L0
  .line 965
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lastHair:Landroid/view/View;
  .line 966
    return-void
.end method

.method private endMulti()V
  .registers 2
  .line 1522
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 1523
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
  .line 1524
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->clear()V
  .line 1525
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->stopBlink()V
  .line 1526
    return-void
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 1000
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private glide(I)V
  .registers 4
  .line 1262
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->getHeight()I
    move-result v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v1
    sub-int/2addr v0, v1
  .line 1263
    const/4 v1, 0
    if-gez v0, :L0
    const/4 v0, 0
  :L0
  .line 1264
    if-gez p1, :L1
    const/4 p1, 0
  :L1
  .line 1265
    if-le p1, v0, :L2
    goto :L3
  :L2
    move v0, p1
  :L3
  .line 1266
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { p1, v1, v0 }, Landroid/widget/ScrollView;->scrollTo(II)V
  .line 1267
    return-void
.end method

.method private highlighted(I)Z
  .registers 3
  .line 597
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne p1, v0, :L3
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz p1, :L1
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
    if-eqz p1, :L0
    goto :L1
  :L0
    const/4 p1, 0
    goto :L2
  :L1
    const/4 p1, 1
  :L2
    return p1
  :L3
  .line 598
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p1
    return p1
.end method

.method private itemRgb()I
  .registers 5
  .line 970
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 971
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 972
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 971
    const/4 v3, 0
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 973
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    const v1, 16777215
    and-int/2addr v0, v1
    return v0
.end method

.method private label(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 4
  .line 1069
    if-nez p1, :L0
    const-string p1, ""
    return-object p1
  :L0
  .line 1070
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
    move-result-object p1
  .line 1071
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Ipp;->songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 1072
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 1073
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 1074
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " \u2014 "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    return-object p1
.end method

.method private labelAt(I)Ljava/lang/String;
  .registers 5
  .line 1083
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L3
    if-ltz p1, :L3
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L3
  :L0
  .line 1084
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
    if-eqz v0, :L1
    array-length v1, v0
    if-ge p1, v1, :L1
    aget-object v0, v0, p1
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 1085
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->label(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
  .line 1086
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
    if-eqz v1, :L2
    array-length v2, v1
    if-ge p1, v2, :L2
    aput-object v0, v1, p1
  :L2
  .line 1087
    return-object v0
  :L3
  .line 1083
    const-string p1, ""
    return-object p1
.end method

.method private manualCaption()Ljava/lang/String;
  .registers 5
  .line 1052
    invoke-static { }, Lcom/innioasis/ipp/Queue;->manualCount()I
    move-result v0
  .line 1053
    invoke-static { }, Lcom/innioasis/ipp/Queue;->manualShown()I
    move-result v1
  .line 1054
    if-gt v0, v1, :L0
    const v0, 2131821078
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    return-object v0
  :L0
  .line 1055
    const/4 v2, 2
    new-array v2, v2, [Ljava/lang/Object;
  .line 1056
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    const/4 v3, 0
    aput-object v1, v2, v3
    const/4 v1, 1
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    aput-object v0, v2, v1
  .line 1055
    const v0, 2131821117
    invoke-virtual { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private markBox(F)I
  .registers 3
  .line 731
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->scaledDensity:F
    mul-float p1, p1, v0
    const v0, 1061997773
    mul-float p1, p1, v0
    invoke-static { p1 }, Ljava/lang/Math;->round(F)I
    move-result p1
  .line 732
    const/16 v0, 10
    if-ge p1, v0, :L0
    const/16 p1, 10
  :L0
    return p1
.end method

.method private move(I)V
  .registers 3
  .line 549
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 550
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paint(I)V
  .line 551
    iget p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paint(I)V
  .line 552
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollToSel()V
  .line 553
    return-void
.end method

.method private nameAt(I)Ljava/lang/String;
  .registers 4
  .line 1093
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object p1
  .line 1094
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->titleLen(Ljava/lang/String;)I
    move-result v0
  .line 1095
    if-gtz v0, :L0
    goto :L1
  :L0
    const/4 v1, 0
    invoke-virtual { p1, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p1
  :L1
    return-object p1
.end method

.method private openAlbum()V
  .registers 2
  .line 1471
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 1472
    if-nez v0, :L0
    return-void
  :L0
  .line 1473
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Albums;->openAlbumOfSong(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;)V
  .line 1474
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1475
    return-void
.end method

.method private openArtist(Ljava/lang/String;)V
  .registers 4
  .line 1479
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1480
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 1481
    const-string v1, "ipp_artist"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1482
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->startActivity(Landroid/content/Intent;)V
  .line 1483
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1484
    return-void
  :L1
  .line 1479
    return-void
.end method

.method private paint(I)V
  .registers 5
  .line 603
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    if-eqz v0, :L8
    if-ltz p1, :L8
    array-length v1, v0
    if-ge p1, v1, :L8
    aget-object v0, v0, p1
    if-nez v0, :L0
    goto :L8
  :L0
  .line 604
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 605
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne p1, v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 606
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
    aget-object v1, v1, p1
  .line 613
    if-nez p1, :L3
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->nameAt(I)Ljava/lang/String;
    move-result-object v2
    goto :L4
  :L3
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object v2
  :L4
  .line 614
    if-eqz v0, :L5
  .line 615
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
    goto :L6
  :L5
  .line 617
    invoke-static { v1 }, Lcom/innioasis/ipp/Scroll;->stopMarquee(Landroid/widget/TextView;)V
  :L6
  .line 621
    if-nez p1, :L7
    return-void
  :L7
  .line 627
    new-instance p1, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->titleLen(Ljava/lang/String;)I
    move-result v0
    invoke-direct { p1, v2, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;-><init>(Ljava/lang/String;I)V
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V
  .line 628
    return-void
  :L8
  .line 603
    return-void
.end method

.method private paintFocus(I)V
  .registers 11
  .line 561
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    if-eqz v0, :L15
    if-ltz p1, :L15
    array-length v1, v0
    if-ge p1, v1, :L15
    aget-object v0, v0, p1
    if-nez v0, :L0
    goto/16 :L15
  :L0
  .line 562
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->highlighted(I)Z
    move-result v0
  .line 563
    const/4 v1, 0
    if-nez p1, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 564
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tagViews:[Landroid/widget/TextView;
    aget-object v3, v3, p1
  .line 565
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
    aget-object v4, v4, p1
  .line 570
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    aget-object v6, v6, p1
    if-eqz v0, :L3
    const v7, 2131231052
    goto :L4
  :L3
    const/4 v7, 0
  :L4
    invoke-virtual { v5, v6, v7, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 571
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->subViews:[Landroid/widget/TextView;
    aget-object v5, v5, p1
  .line 572
    sget-object v6, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v7, -1
    if-eqz v0, :L5
    sget v8, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    goto :L6
  :L5
    const/4 v8, -1
  :L6
    invoke-virtual { v6, v3, v8, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 573
    sget-object v6, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v0, :L7
    sget v8, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    goto :L8
  :L7
    const/4 v8, -1
  :L8
    invoke-virtual { v6, v4, v8, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 574
    if-eqz v5, :L10
    sget-object v6, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v0, :L9
    sget v7, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
  :L9
    invoke-virtual { v6, v5, v7, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L10
  .line 577
    if-eqz v2, :L11
    if-nez v0, :L11
  .line 578
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v2, 2131100252
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 579
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v3, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 580
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v4, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 581
    if-eqz v5, :L11
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v5, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L11
  .line 585
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->dotViews:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    if-eqz v0, :L14
  .line 586
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L12
  .line 587
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result p1
    invoke-direct { p0, p1, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->tickMark(FLandroid/widget/TextView;)Landroid/graphics/Bitmap;
    move-result-object p1
    goto :L13
  :L12
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result p1
    invoke-direct { p0, p1, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->queuedDot(FLandroid/widget/TextView;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L13
  .line 586
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L14
  .line 589
    return-void
  :L15
  .line 561
    return-void
.end method

.method private pickedRows()Ljava/util/List;
  .registers 4
  .line 1458
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1459
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 1460
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L0
  .line 1461
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L1
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L0
  :L1
  .line 1462
    invoke-static { v0 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
  .line 1463
    return-object v0
  :L2
  .line 1465
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ltz v1, :L3
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v2, :L3
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 1466
    return-object v0
.end method

.method private postScroll()V
  .registers 3
  .line 1212
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollPending:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1213
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollPending:Z
  .line 1214
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    new-instance v1, Lcom/innioasis/y1/activity/IppQueueActivity$ScrollTask;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$ScrollTask;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z
  .line 1215
    return-void
.end method

.method private static px(FLandroid/util/DisplayMetrics;)I
  .registers 3
  .line 159
    const/4 v0, 2
    invoke-static { v0, p0, p1 }, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F
    move-result p0
    const/high16 p1, 0x3FC00000
    mul-float p0, p0, p1
    float-to-int p0, p0
    return p0
.end method

.method private queuedDot(FLandroid/widget/TextView;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 10
  .line 646
    nop
  :L0
  .line 648
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  :L1
  .line 651
    goto :L3
  :L2
  .line 649
    move-exception v0
    const/4 v0, 0
  :L3
  .line 652
    const v1, 16777215
    const/high16 v2, 0xFF000000
    if-eqz v0, :L4
  .line 653
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result p2
    or-int/2addr p2, v2
    goto :L5
  :L4
  .line 655
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p2
    xor-int/2addr p2, v1
    or-int/2addr p2, v2
  :L5
  .line 657
    xor-int v0, p2, v1
    or-int/2addr v0, v2
  .line 658
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->markBox(F)I
    move-result v1
  .line 661
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "d"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ":"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  .line 662
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  .line 663
    instance-of v4, v3, Landroid/graphics/Bitmap;
    if-eqz v4, :L6
    check-cast v3, Landroid/graphics/Bitmap;
    return-object v3
  :L6
  .line 668
    new-instance v3, Landroid/graphics/Paint;
    invoke-direct { v3 }, Landroid/graphics/Paint;-><init>()V
  .line 669
    const/4 v4, 1
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 670
    invoke-static { }, Lcom/innioasis/y1/activity/IppQueueActivity;->font()Landroid/graphics/Typeface;
    move-result-object v5
    invoke-virtual { v3, v5 }, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 671
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v5
    iget v5, v5, Landroid/util/DisplayMetrics;->scaledDensity:F
    mul-float p1, p1, v5
    invoke-virtual { v3, p1 }, Landroid/graphics/Paint;->setTextSize(F)V
  .line 672
    new-instance p1, Landroid/graphics/Rect;
    invoke-direct { p1 }, Landroid/graphics/Rect;-><init>()V
  .line 673
    const-string v5, "\u2022"
    const/4 v6, 0
    invoke-virtual { v3, v5, v6, v4, p1 }, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V
  .line 674
    invoke-virtual { p1 }, Landroid/graphics/Rect;->height()I
    move-result v4
    invoke-virtual { p1 }, Landroid/graphics/Rect;->width()I
    move-result p1
    invoke-static { v4, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 675
    const/4 v4, 3
    if-ge p1, v4, :L7
    const/4 p1, 3
  :L7
  .line 677
    nop
  .line 678
    add-int/lit8 v4, v1, -4
    if-le p1, v4, :L8
    move p1, v4
  :L8
  .line 680
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v1, v1, v4 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 681
    new-instance v5, Landroid/graphics/Canvas;
    invoke-direct { v5, v4 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 682
    int-to-float v1, v1
    const/high16 v6, 0x40000000
    div-float/2addr v1, v6
  .line 683
    int-to-float p1, p1
    div-float/2addr p1, v6
  .line 684
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual { v3, v6 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 685
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setColor(I)V
  .line 686
    invoke-virtual { v5, v1, v1, p1, v3 }, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
  .line 687
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 688
    const/high16 p2, 0x3FC00000
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 689
    invoke-virtual { v3, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 690
    invoke-virtual { v5, v1, v1, p1, v3 }, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
  .line 691
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { p1, v2, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 692
    return-object v4
.end method

.method private removePicked()V
  .registers 5
  .line 1424
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1425
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 1426
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L0
  .line 1427
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L1
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L0
  :L1
  .line 1428
    invoke-static { v0 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
    goto :L3
  :L2
  .line 1429
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lez v1, :L3
  .line 1430
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L4
  :L3
  .line 1429
    nop
  :L4
  .line 1432
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    add-int/lit8 v1, v1, -1
  :L5
    if-ltz v1, :L7
  .line 1433
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 1434
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->canRemoveRow(I)Z
    move-result v3
    if-eqz v3, :L6
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->removeRow(I)V
  :L6
  .line 1432
    add-int/lit8 v1, v1, -1
    goto :L5
  :L7
  .line 1436
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1437
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 1438
    return-void
.end method

.method private repaintAll()V
  .registers 3
  .line 1545
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    if-nez v0, :L0
    return-void
  :L0
  .line 1546
    const/4 v0, 0
  :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    array-length v1, v1
    if-ge v0, v1, :L2
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 1547
    return-void
.end method

.method private resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L6 } :L8
  .registers 5
  :L0
  .line 1174
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v0
  .line 1175
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L1
    return-object p1
  :L1
  .line 1176
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 1177
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 1178
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    invoke-virtual { v1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 1179
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L3
    check-cast v1, Lcom/innioasis/y1/database/Song;
    return-object v1
  :L3
  .line 1180
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 1181
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  .line 1182
    if-nez v2, :L4
    new-instance v2, Ljava/io/File;
    invoke-direct { v2, v0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L4
  .line 1183
    if-nez v2, :L5
    return-object p1
  :L5
  .line 1184
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    invoke-virtual { v1, v0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L6
  .line 1185
    return-object v2
  :L7
  .line 1177
    return-object p1
  :L8
  .line 1186
    move-exception v0
  .line 1187
    return-object p1
.end method

.method private rowBox(Landroid/view/View;I)Landroid/widget/LinearLayout;
  .registers 7
  .line 953
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct { v0, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 954
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 955
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -1
    invoke-direct { v2, v3, p2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, p1, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 956
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->itemRgb()I
    move-result p1
    const/high16 p2, 0x1F000000
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rule(II)Landroid/view/View;
    move-result-object p1
  .line 957
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v3, v1 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v0, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 958
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lastHair:Landroid/view/View;
  .line 959
    return-object v0
.end method

.method static rowHeight(Landroid/widget/TextView;)I
  .registers 2
  .line 991
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTextSize()F
    move-result p0
    const/high16 v0, 0x3FC00000
    mul-float p0, p0, v0
    float-to-int p0, p0
    return p0
.end method

.method private rule(II)Landroid/view/View;
  .registers 4
  .line 978
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 979
    or-int/2addr p1, p2
    invoke-virtual { v0, p1 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 980
    return-object v0
.end method

.method private scrollToSel()V
  .registers 2
  .line 1207
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-nez v0, :L0
    return-void
  :L0
  .line 1208
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->doScroll()Z
    move-result v0
    if-nez v0, :L1
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->postScroll()V
  :L1
  .line 1209
    return-void
.end method

.method private static setHeight(Landroid/view/View;I)Z
  .registers 5
  .line 860
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 861
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
  .line 862
    if-eqz v1, :L2
    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v2, p1, :L1
    goto :L2
  :L1
  .line 863
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 864
    invoke-virtual { p0, v1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 865
    const/4 p0, 1
    return p0
  :L2
  .line 862
    return v0
.end method

.method private setPinned(Ljava/lang/String;)V
  .registers 3
  .line 806
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedText:Landroid/widget/TextView;
    if-eqz v0, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    if-nez v0, :L0
    goto :L2
  :L0
  .line 807
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedShown:Ljava/lang/String;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->getVisibility()I
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 808
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedShown:Ljava/lang/String;
  .line 809
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedText:Landroid/widget/TextView;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 810
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  .line 811
    return-void
  :L2
  .line 806
    return-void
.end method

.method private songAt(I)Lcom/innioasis/y1/database/Song;
  .registers 4
  .line 1499
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    const/4 v1, 0
    if-eqz v0, :L2
    if-ltz p1, :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L2
  :L0
  .line 1500
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 1501
    instance-of v0, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v0, :L1
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L1
    return-object v1
  :L2
  .line 1499
    return-object v1
.end method

.method private startMulti()V
  .registers 5
  .line 1507
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1508
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
  .line 1509
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->clear()V
  .line 1513
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lez v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L1
  .line 1514
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1515
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Blink;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
  .line 1516
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v1, :L2
    const-wide/16 v2, 500
    invoke-virtual { v1, v0, v2, v3 }, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z
  :L2
  .line 1517
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 1518
    return-void
.end method

.method private stopBlink()V
  .registers 3
  .line 1529
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1530
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    if-eqz v0, :L1
  .line 1531
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v1, :L0
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L0
  .line 1532
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
  :L1
  .line 1534
    return-void
.end method

.method private syncRows()I
  .catchall { :L0 .. :L3 } :L6
  .registers 8
  .line 138
    const/16 v0, 8
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
  .line 139
    iget v2, v1, Landroid/util/DisplayMetrics;->heightPixels:I
  .line 140
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131165782
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v3
    float-to-int v3, v3
  .line 143
    const/high16 v4, 0x41400000
    invoke-static { v4, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->px(FLandroid/util/DisplayMetrics;)I
    move-result v4
    add-int/lit8 v4, v4, 6
    add-int/lit8 v4, v4, 4
  .line 144
    const/high16 v5, 0x41900000
    invoke-static { v5, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->px(FLandroid/util/DisplayMetrics;)I
    move-result v5
    const/high16 v6, 0x41600000
    invoke-static { v6, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->px(FLandroid/util/DisplayMetrics;)I
    move-result v6
    add-int/2addr v5, v6
  .line 145
    const/16 v6, 50
    if-ge v5, v6, :L1
    const/16 v5, 50
  :L1
  .line 146
    mul-int/lit8 v4, v4, 2
    add-int/2addr v4, v5
  .line 147
    const/4 v5, 1
    invoke-static { v5 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v6
    invoke-static { v6, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->px(FLandroid/util/DisplayMetrics;)I
    move-result v1
    add-int/2addr v1, v5
  .line 148
    if-gtz v1, :L2
    return v0
  :L2
  .line 149
    sub-int/2addr v2, v3
    sub-int/2addr v2, v4
    div-int/2addr v2, v1
  :L3
  .line 150
    add-int/2addr v2, v5
    add-int/lit8 v2, v2, 2
  .line 151
    if-ge v2, v0, :L4
    goto :L5
  :L4
    move v0, v2
  :L5
    return v0
  :L6
  .line 152
    move-exception v1
  .line 153
    return v0
.end method

.method private static textSize(I)F
  .registers 1
  .line 292
    if-nez p0, :L0
    const/high16 p0, 0x41900000
    goto :L1
  :L0
    const/high16 p0, 0x41800000
  :L1
    return p0
.end method

.method private tickMark(FLandroid/widget/TextView;)Landroid/graphics/Bitmap;
  .registers 14
  .line 705
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->markBox(F)I
    move-result p1
  .line 706
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p2
  .line 707
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "t"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, ":"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 708
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { v1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 709
    instance-of v2, v1, Landroid/graphics/Bitmap;
    if-eqz v2, :L0
    check-cast v1, Landroid/graphics/Bitmap;
    return-object v1
  :L0
  .line 711
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p1, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 712
    new-instance v8, Landroid/graphics/Canvas;
    invoke-direct { v8, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 713
    new-instance v9, Landroid/graphics/Paint;
    const/4 v2, 1
    invoke-direct { v9, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 714
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setColor(I)V
  .line 715
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 716
    int-to-float p1, p1
    const/high16 p2, 0x41800000
    div-float/2addr p1, p2
  .line 717
    const p2, 1075419546
    mul-float p2, p2, p1
  .line 718
    const/high16 v2, 0x3FC00000
    cmpg-float v3, p2, v2
    if-gez v3, :L1
    const/high16 p2, 0x3FC00000
  :L1
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 719
    const/high16 p2, 0x40200000
    mul-float v3, p1, p2
    const/high16 p2, 0x41080000
    mul-float v4, p1, p2
    const/high16 p2, 0x40D00000
    mul-float p2, p2, p1
    const/high16 v2, 0x41480000
    mul-float v10, p1, v2
    move-object v2, v8
    move v5, p2
    move v6, v10
    move-object v7, v9
    invoke-virtual/range { v2 .. v7 }, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
  .line 720
    const/high16 v2, 0x41580000
    mul-float v5, p1, v2
    const/high16 v2, 0x40600000
    mul-float v6, p1, v2
    move-object v2, v8
    move v3, p2
    move v4, v10
    invoke-virtual/range { v2 .. v7 }, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
  .line 721
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { p1, v0, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 722
    return-object v1
.end method

.method private static titleLen(Ljava/lang/String;)I
  .registers 2
  .line 1105
    if-nez p0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 1106
    const-string v0, " \u2014 "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v0
  .line 1107
    if-gez v0, :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
  :L1
    return v0
.end method

.method private static unNamed(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 1153
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 1155
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 1156
    move-exception v0
  .line 1157
    return-object p0
.end method

.method public antiClockwise()V
  .registers 3
  .line 1281
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 1282
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-gt v0, v1, :L0
    return-void
  :L0
  .line 1283
    add-int/lit8 v1, v0, -1
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 1284
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->move(I)V
  .line 1285
    return-void
.end method

.method blinkTick()V
  .registers 5
  .line 1537
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v0, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    if-nez v0, :L0
    goto :L2
  :L0
  .line 1538
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
    xor-int/lit8 v0, v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1539
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 1540
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    const-wide/16 v2, 500
    invoke-virtual { v0, v1, v2, v3 }, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 1541
    return-void
  :L2
  .line 1537
    return-void
.end method

.method buildTail()V
  .registers 3
  .line 514
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 515
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
  .line 516
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    if-eqz v1, :L1
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L1
  .line 517
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L4
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v0, :L4
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L2
    goto :L4
  :L2
  .line 518
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailFrom:I
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->build(II)V
  .line 519
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L3
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V
  :L3
  .line 520
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollToSel()V
  .line 522
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repin()V
  .line 523
    return-void
  :L4
  .line 517
    return-void
.end method

.method public clockwise()V
  .registers 3
  .line 1271
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 1272
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L1
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
    if-lt v1, v0, :L0
    goto :L1
  :L0
  .line 1273
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    add-int/lit8 v1, v0, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 1274
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->move(I)V
  .line 1275
    return-void
  :L1
  .line 1272
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 1297
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 1298
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 1299
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v0, :L3
  .line 1300
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v0, :L1
    return-void
  :L1
  .line 1301
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
  .line 1302
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L2
  .line 1303
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 1304
    return-void
  :L3
  .line 1306
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v0, :L4
  .line 1307
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1308
    return-void
  :L4
  .line 1310
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->playRow(I)V
  .line 1311
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 1312
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 1313
    return-void
  :L5
  .line 1298
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 1551
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L1
  .line 1554
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz p1, :L0
  .line 1555
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1556
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repaintAll()V
  .line 1557
    return-void
  :L0
  .line 1559
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  :L1
  .line 1561
    return-void
.end method

.method doScroll()Z
  .registers 6
  .line 1219
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollPending:Z
  .line 1220
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v1, :L10
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-nez v1, :L0
    goto :L10
  :L0
  .line 1223
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
    if-eqz v2, :L9
    iget v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ltz v3, :L9
    array-length v4, v2
    if-lt v3, v4, :L1
    goto :L9
  :L1
  .line 1224
    aget v2, v2, v3
  .line 1225
    const/4 v3, 1
    if-gez v2, :L2
  .line 1226
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->glide(I)V
  .line 1227
    return v3
  :L2
  .line 1229
    invoke-virtual { v1 }, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v1
    if-lt v2, v1, :L3
    return v0
  :L3
  .line 1230
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v1, v2 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 1231
    if-nez v1, :L4
    return v0
  :L4
  .line 1234
    invoke-virtual { v1 }, Landroid/view/View;->getHeight()I
    move-result v4
    if-gtz v4, :L5
    return v0
  :L5
  .line 1235
    invoke-virtual { v1 }, Landroid/view/View;->getTop()I
    move-result v0
  .line 1236
    invoke-virtual { v1 }, Landroid/view/View;->getBottom()I
    move-result v1
  .line 1239
    if-lez v2, :L6
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    sub-int/2addr v2, v3
    invoke-virtual { v4, v2 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v4
    instance-of v4, v4, Landroid/widget/TextView;
    if-eqz v4, :L6
  .line 1240
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v0
  :L6
  .line 1242
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v2 }, Landroid/widget/ScrollView;->getScrollY()I
    move-result v2
  .line 1243
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v4 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v4
  .line 1244
    if-ge v0, v2, :L7
  .line 1245
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->glide(I)V
    goto :L8
  :L7
  .line 1246
    add-int/2addr v2, v4
    if-le v1, v2, :L8
  .line 1247
    sub-int/2addr v1, v4
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->glide(I)V
  :L8
  .line 1249
    return v3
  :L9
  .line 1223
    return v0
  :L10
  .line 1220
    return v0
.end method

.method public bridge synthetic getViewBinding()Landroidx/viewbinding/ViewBinding;
  .registers 2
  .line 63
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public getViewBinding()Lcom/innioasis/y1/databinding/ActivityAboutBinding;
  .registers 2
  .line 209
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 13
  .line 214
    const v0, 2131821043
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 216
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 217
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 221
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct { v1, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 222
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 227
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
  .line 228
    invoke-virtual { v3, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 229
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    const/4 v4, -1
    const/4 v5, -2
    invoke-virtual { v1, v3, v4, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 233
    const-string v3, ""
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->captionView(Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v7
    iput-object v7, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedText:Landroid/widget/TextView;
  .line 234
    const/4 v8, -2
    const/high16 v9, 0x59000000
    const/4 v10, 2
    const/high16 v11, 0x59000000
    move-object v6, p0
    invoke-direct/range { v6 .. v11 }, Lcom/innioasis/y1/activity/IppQueueActivity;->band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
    move-result-object v3
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
  .line 235
    const/16 v6, 8
    invoke-virtual { v3, v6 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  .line 236
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    invoke-virtual { v1, v3, v4, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 238
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
  .line 239
    invoke-virtual { v3, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 241
    new-instance v2, Landroid/widget/ScrollView;
    invoke-direct { v2, p0 }, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
  .line 242
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v2, v3, v4, v5 }, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V
  .line 243
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, 0
    invoke-direct { v2, v4, v3 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 244
    const/high16 v5, 0x3F800000
    iput v5, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 245
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v5, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 247
    invoke-virtual { v0, v1, v4, v4 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 252
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$Pin;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Pin;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .line 253
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v1
    invoke-virtual { v1, v0 }, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V
  .line 254
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v1
    invoke-virtual { v1, v0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 256
    iput v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 257
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 259
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
  .line 260
    new-instance v1, Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.MY_PLAY_SONG"
    invoke-direct { v1, v2 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 261
    return-void
.end method

.method public longConfirm()V
  .registers 6
  .line 1334
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 1335
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L7
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L7
  :L0
  .line 1336
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1337
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    const v2, 2131821106
    if-eqz v1, :L1
  .line 1338
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L1
  .line 1339
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    const v3, 2131821105
    const v4, 2131821071
    if-nez v1, :L3
  .line 1340
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :L2
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 1341
    invoke-virtual { p0, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1342
    invoke-static { }, Lcom/innioasis/ipp/Queue;->hasSource()Z
    move-result v1
    if-eqz v1, :L6
    const v1, 2131821093
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L3
  .line 1344
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->canRemoveRow(I)Z
    move-result v1
    if-eqz v1, :L4
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 1345
    const v1, 2131820844
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1346
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :L5
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 1347
    invoke-virtual { p0, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 1351
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getActivity()Landroid/app/Activity;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;
    invoke-direct { v3, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    const v4, 2131886360
    invoke-direct { v1, v2, v0, v3, v4 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
  .line 1352
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 1353
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 1354
    return-void
  :L7
  .line 1335
    return-void
.end method

.method protected onDestroy()V
  .catch Ljava/lang/Exception; { :L0 .. :L1 } :L2
  .registers 2
  .line 265
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->stopBlink()V
  .line 266
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->cancelTail()V
  .line 267
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
    if-eqz v0, :L4
  :L0
  .line 269
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
  :L1
  .line 272
    goto :L3
  :L2
  .line 270
    move-exception v0
  :L3
  .line 273
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
  :L4
  .line 275
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 276
    return-void
.end method

.method onTrackChanged()V
  .registers 1
  .line 286
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 287
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 288
    return-void
.end method

.method public onWindowFocusChanged(Z)V
  .registers 3
  .line 531
    invoke-super { p0, p1 }, Lcom/innioasis/y1/base/BaseActivity;->onWindowFocusChanged(Z)V
  .line 532
    if-eqz p1, :L0
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
    if-eqz p1, :L0
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-eqz p1, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    if-eqz v0, :L0
    invoke-virtual { v0, p1 }, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z
  :L0
  .line 533
    return-void
.end method

.method pick(Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 7
  .line 1362
    const/4 v0, 1
    if-nez p1, :L0
    return v0
  :L0
  .line 1363
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
  .line 1364
    if-eqz v1, :L1
  .line 1365
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->addToPlaylist(Ljava/util/UUID;)V
  .line 1366
    return v0
  :L1
  .line 1368
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  .line 1369
    if-nez p1, :L2
    return v0
  :L2
  .line 1370
    const v1, 2131821106
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
  .line 1371
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->removePicked()V
  .line 1372
    return v0
  :L3
  .line 1374
    const v1, 2131820844
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L4
  .line 1375
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->startMulti()V
  .line 1376
    return v0
  :L4
  .line 1378
    const v1, 2131821071
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L5
  .line 1379
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openAlbum()V
  .line 1380
    return v0
  :L5
  .line 1382
    const v1, 2131821093
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L7
  .line 1385
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->openSource(Landroid/app/Activity;)Z
    move-result p1
    if-eqz p1, :L6
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  :L6
  .line 1386
    return v0
  :L7
  .line 1388
    const v1, 2131821105
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L10
  .line 1389
    iget p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object p1
  .line 1390
    if-nez p1, :L8
    return v0
  :L8
  .line 1391
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 0
    if-ne v1, v0, :L9
  .line 1392
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/String;
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openArtist(Ljava/lang/String;)V
  .line 1393
    return v0
  :L9
  .line 1396
    new-instance v0, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    new-instance v3, Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;
    invoke-direct { v3, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    const v4, 2131886360
    invoke-direct { v0, v1, p1, v3, v4 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 1397
    return v2
  :L10
  .line 1399
    return v0
.end method

.method pickArtist(Ljava/lang/String;)V
  .registers 3
  .line 1404
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
    if-eqz v0, :L0
  .line 1405
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->dismiss()V
  .line 1406
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
  :L0
  .line 1408
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openArtist(Ljava/lang/String;)V
  .line 1409
    return-void
.end method

.method public quit()V
  .registers 1
  .line 1565
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1566
    return-void
.end method

.method render()V
  .registers 5
  .line 303
    invoke-static { }, Lcom/innioasis/ipp/Queue;->upNext()Ljava/util/List;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
  .line 304
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 305
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 306
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->cancelTail()V
  .line 308
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
  .line 309
    new-array v1, v0, [Landroid/view/View;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
  .line 310
    new-array v1, v0, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tagViews:[Landroid/widget/TextView;
  .line 311
    new-array v1, v0, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
  .line 312
    new-array v1, v0, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->subViews:[Landroid/widget/TextView;
  .line 313
    new-array v1, v0, [Landroid/widget/ImageView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->dotViews:[Landroid/widget/ImageView;
  .line 314
    new-array v1, v0, [Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
  .line 315
    const/4 v1, 0
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->manualHeaderDone:Z
  .line 316
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->autoHeaderDone:Z
  .line 317
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capViews:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->clear()V
  .line 318
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capLabels:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->clear()V
  .line 319
    const/4 v2, 0
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
  .line 320
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->lastHair:Landroid/view/View;
  .line 321
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playBase:I
  .line 322
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playExtra:I
  .line 323
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedShown:Ljava/lang/String;
  .line 324
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    if-eqz v2, :L0
    const/16 v3, 8
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  :L0
  .line 326
    if-nez v0, :L1
  .line 327
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 328
    const/high16 v2, 0x41800000
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 329
    const/16 v2, 12
    const/4 v3, 6
    invoke-virtual { v0, v3, v2, v3, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 330
    const v2, 2131821044
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 331
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v3, -1
    invoke-virtual { v2, v0, v3, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 332
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    const/4 v2, -2
    invoke-virtual { v1, v0, v3, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 333
    return-void
  :L1
  .line 335
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lt v2, v0, :L2
    add-int/lit8 v2, v0, -1
    iput v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  :L2
  .line 336
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-gez v2, :L3
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  :L3
  .line 338
    new-array v2, v0, [I
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
  .line 342
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->syncRows()I
    move-result v2
    iget v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    add-int/lit8 v3, v3, 2
    invoke-static { v2, v3 }, Ljava/lang/Math;->max(II)I
    move-result v2
  .line 343
    if-le v2, v0, :L4
    move v2, v0
  :L4
  .line 344
    invoke-direct { p0, v1, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->build(II)V
  .line 345
    const/4 v1, 1
    if-ge v2, v0, :L6
  .line 346
    iput v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailFrom:I
  .line 347
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
  .line 348
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-nez v0, :L5
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Tail;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
  :L5
  .line 358
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->hasWindowFocus()Z
    move-result v0
    if-eqz v0, :L6
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z
  :L6
  .line 366
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
    xor-int/2addr v1, v2
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V
  .line 367
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollToSel()V
  .line 369
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repin()V
  .line 370
    return-void
.end method

.method repin()V
  .catchall { :L0 .. :L8 } :L10
  .registers 6
  :L0
  .line 778
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    if-eqz v0, :L9
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-nez v1, :L1
    goto :L9
  :L1
  .line 779
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
    if-nez v2, :L3
  .line 780
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->getVisibility()I
    move-result v0
    const/16 v1, 8
    if-eq v0, v1, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  :L2
  .line 781
    return-void
  :L3
  .line 783
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getScrollY()I
    move-result v0
  .line 784
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
  .line 785
    const/4 v2, 0
  :L4
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capViews:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L7
  .line 786
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capViews:Ljava/util/ArrayList;
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroid/view/View;
  .line 792
    invoke-virtual { v3 }, Landroid/view/View;->getHeight()I
    move-result v4
    if-gtz v4, :L5
    goto :L7
  :L5
  .line 796
    invoke-virtual { v3 }, Landroid/view/View;->getTop()I
    move-result v4
    invoke-virtual { v3 }, Landroid/view/View;->getHeight()I
    move-result v3
    add-int/2addr v4, v3
    sub-int/2addr v4, v0
    if-lez v4, :L6
    goto :L7
  :L6
  .line 797
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capLabels:Ljava/util/ArrayList;
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 785
    add-int/lit8 v2, v2, 1
    goto :L4
  :L7
  .line 799
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setPinned(Ljava/lang/String;)V
  :L8
  .line 802
    goto :L11
  :L9
  .line 778
    return-void
  :L10
  .line 800
    move-exception v0
  :L11
  .line 803
    return-void
.end method

.method stretch()Z
  .catchall { :L0 .. :L7 } :L11
  .registers 9
  .line 834
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v1, :L10
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    if-eqz v2, :L10
    array-length v2, v2
    const/4 v3, 2
    if-ge v2, v3, :L1
    goto :L10
  :L1
  .line 835
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v1
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playExtra:I
    add-int/2addr v1, v2
  .line 836
    if-gtz v1, :L2
    return v0
  :L2
  .line 838
    const/4 v2, 1
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v3
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    invoke-virtual { v4 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v4
    invoke-static { v3, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->px(FLandroid/util/DisplayMetrics;)I
    move-result v3
  .line 839
    add-int/2addr v3, v2
    div-int v3, v1, v3
  .line 840
    if-ge v3, v2, :L3
    return v0
  :L3
  .line 841
    div-int v4, v1, v3
  .line 842
    mul-int v3, v3, v4
    sub-int/2addr v1, v3
  .line 843
    sub-int/2addr v4, v2
  .line 845
    nop
  .line 846
    const/4 v3, 1
    const/4 v5, 0
  :L4
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    array-length v7, v6
    if-ge v3, v7, :L6
  .line 847
    aget-object v6, v6, v3
    invoke-static { v6, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setHeight(Landroid/view/View;I)Z
    move-result v6
    if-eqz v6, :L5
    const/4 v5, 1
  :L5
  .line 846
    add-int/lit8 v3, v3, 1
    goto :L4
  :L6
  .line 849
    iget v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playBase:I
    if-lez v3, :L8
    aget-object v4, v6, v0
    add-int/2addr v3, v1
    invoke-static { v4, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setHeight(Landroid/view/View;I)Z
    move-result v3
    if-eqz v3, :L8
  .line 850
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->playExtra:I
  :L7
  .line 851
    goto :L9
  :L8
  .line 853
    move v2, v5
  :L9
    return v2
  :L10
  .line 834
    return v0
  :L11
  .line 854
    move-exception v1
  .line 855
    return v0
.end method

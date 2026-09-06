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

.field private manualHeaderDone:Z

.field private final markCache:Ljava/util/HashMap;

.field private final marked:Ljava/util/HashSet;

.field private menuDlg:Lcom/innioasis/music/util/SubMenuDialog;

.field private multi:Z

.field private pinned:Landroid/widget/LinearLayout;

.field private pinnedFirst:Ljava/lang/String;

.field private pinnedShown:Ljava/lang/String;

.field private pinnedText:Landroid/widget/TextView;

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
  .line 186
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
  .line 194
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
  .line 202
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    return-void
.end method

.method private addToPlaylist(Ljava/util/UUID;)V
  .registers 6
  .line 1282
    if-nez p1, :L0
    return-void
  :L0
  .line 1283
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1284
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->pickedRows()Ljava/util/List;
    move-result-object v1
  .line 1285
    const/4 v2, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 1286
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 1287
    if-eqz v3, :L2
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 1285
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 1289
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1290
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repaintAll()V
  .line 1291
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L4
    return-void
  :L4
  .line 1292
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;
    invoke-direct { v2, v0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;-><init>(Ljava/util/List;Ljava/util/UUID;)V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 1293
    return-void
.end method

.method private artistAt(I)Ljava/lang/String;
  .registers 4
  .line 975
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object p1
  .line 976
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->titleLen(Ljava/lang/String;)I
    move-result v0
    const-string v1, " \u2014 "
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v1
    add-int/2addr v0, v1
  .line 977
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
  .line 1333
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object p1
    return-object p1
.end method

.method private band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
  .registers 13
  .line 836
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 837
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget v2, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    const/4 v3, 1
    invoke-virtual { v1, v0, v2, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 838
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v1
    const v2, 16777215
    and-int/2addr v1, v2
  .line 839
    sget-object v4, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 840
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    const v6, 2131100252
    invoke-virtual { v5, v6 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v5
  .line 839
    const/4 v6, 0
    invoke-virtual { v4, v0, v5, v6 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 841
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    and-int/2addr v0, v2
  .line 843
    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct { v2, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 844
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 845
    const/4 v3, -1
    if-eqz p3, :L0
    invoke-direct { p0, v0, p3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rule(II)Landroid/view/View;
    move-result-object v4
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v5, v3, p4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, v4, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L0
  .line 846
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v4, v3, p2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, p1, v4 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 847
    if-eqz p3, :L1
    invoke-direct { p0, v0, p3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rule(II)Landroid/view/View;
    move-result-object p1
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { p2, v3, p4 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v2, p1, p2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L1
  .line 848
    or-int p1, v1, p5
    invoke-virtual { v2, p1 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  .line 849
    return-object v2
.end method

.method private static bold(Landroid/widget/TextView;)V
  .registers 3
  .line 885
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-virtual { p0, v0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 886
    return-void
.end method

.method private build(II)V
  .registers 19
  .line 366
    move-object/from16 v6, p0
    move/from16 v7, p1
  :L0
    move/from16 v8, p2
    if-ge v7, v8, :L16
  .line 367
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 368
    const/4 v1, 1
    const/4 v2, 0
    if-nez v7, :L1
    const/4 v3, 1
    goto :L2
  :L1
    const/4 v3, 0
  :L2
  .line 369
    invoke-static { v7 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v4
  .line 370
    invoke-static { v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v5
  .line 376
    if-nez v3, :L3
    if-eqz v4, :L3
    iget-boolean v9, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->manualHeaderDone:Z
    if-nez v9, :L3
  .line 377
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->manualCaption()Ljava/lang/String;
    move-result-object v4
    invoke-direct { v6, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->caption(Ljava/lang/String;)V
  .line 378
    iput-boolean v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->manualHeaderDone:Z
    goto :L4
  :L3
  .line 379
    if-nez v3, :L4
    if-nez v4, :L4
    iget-boolean v4, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->autoHeaderDone:Z
    if-nez v4, :L4
  .line 380
    new-array v4, v1, [Ljava/lang/Object;
  .line 381
    invoke-static { }, Lcom/innioasis/ipp/Queue;->source()Ljava/lang/String;
    move-result-object v9
    aput-object v9, v4, v2
  .line 380
    const v9, 2131821079
    invoke-virtual { v6, v9, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v4
    invoke-direct { v6, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->caption(Ljava/lang/String;)V
  .line 382
    iput-boolean v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->autoHeaderDone:Z
  :L4
  .line 385
    new-instance v4, Landroid/widget/LinearLayout;
    invoke-direct { v4, v6 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 386
    invoke-virtual { v4, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 387
    invoke-virtual { v4, v2 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 388
    const/16 v9, 16
    invoke-virtual { v4, v9 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 389
    const/4 v10, 5
    invoke-virtual { v4, v10, v2, v10, v2 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 393
    const/4 v10, 0
    if-eqz v3, :L5
    invoke-direct { v6, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->cover(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v0
    goto :L6
  :L5
    move-object v0, v10
  :L6
  .line 394
    new-instance v11, Landroid/widget/TextView;
    invoke-direct { v11, v6 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 395
    const/16 v12, 50
    const/16 v13, 8
    const/4 v14, -2
    if-eqz v3, :L8
  .line 396
    if-eqz v0, :L7
  .line 397
    new-instance v15, Landroid/widget/ImageView;
    invoke-direct { v15, v6 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 398
    invoke-virtual { v15, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 399
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v0, v12, v12 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 400
    iput v13, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 401
    invoke-virtual { v4, v15, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 402
    goto :L9
  :L7
  .line 403
    invoke-virtual { v11, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 404
    invoke-static { v11 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 405
    invoke-virtual { v11, v2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 406
    invoke-virtual { v11, v9 }, Landroid/widget/TextView;->setGravity(I)V
  .line 407
    invoke-virtual { v11, v2, v2, v13, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 408
    const-string v0, "\u25b6"
    invoke-virtual { v11, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 409
    invoke-virtual { v4, v11, v14, v14 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
    goto :L9
  :L8
  .line 415
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct { v0, v6 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 416
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v15, v14, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 417
    iput v13, v15, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 418
    invoke-virtual { v4, v0, v15 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 419
    iget-object v13, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->dotViews:[Landroid/widget/ImageView;
    aput-object v0, v13, v7
  :L9
  .line 422
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, v6 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 423
    if-eqz v3, :L10
    const/high16 v5, 0x41900000
  :L10
    invoke-virtual { v0, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 425
    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v0, v5, v2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 426
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 427
    invoke-virtual { v0, v9 }, Landroid/widget/TextView;->setGravity(I)V
  .line 428
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 430
    nop
  .line 431
    const/high16 v5, 0x3F800000
    const/4 v13, -1
    if-eqz v3, :L11
  .line 435
    invoke-direct { v6, v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->nameAt(I)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v0, v10 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 436
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 438
    new-instance v10, Landroid/widget/TextView;
    invoke-direct { v10, v6 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 439
    const/high16 v15, 0x41600000
    invoke-virtual { v10, v15 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 440
    sget-object v15, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v10, v15, v2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 441
    invoke-virtual { v10, v2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 442
    invoke-virtual { v10, v9 }, Landroid/widget/TextView;->setGravity(I)V
  .line 443
    invoke-virtual { v10, v1 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 444
    sget-object v15, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v10, v15 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 445
    invoke-direct { v6, v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistAt(I)Ljava/lang/String;
    move-result-object v15
    invoke-virtual { v10, v15 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 447
    new-instance v15, Landroid/widget/LinearLayout;
    invoke-direct { v15, v6 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 448
    invoke-virtual { v15, v1 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 449
    invoke-virtual { v15, v9 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 450
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v13, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v15, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 451
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v13, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v15, v10, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 452
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v2, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 453
    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 454
    invoke-virtual { v4, v15, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 455
    goto :L12
  :L11
  .line 456
    invoke-direct { v6, v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 457
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v2, v13 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 458
    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 459
    invoke-virtual { v4, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L12
  .line 462
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    aput-object v4, v1, v7
  .line 463
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->tagViews:[Landroid/widget/TextView;
    aput-object v11, v1, v7
  .line 464
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
    aput-object v0, v1, v7
  .line 465
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->subViews:[Landroid/widget/TextView;
    aput-object v10, v1, v7
  .line 466
    invoke-direct { v6, v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paint(I)V
  .line 470
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rowHeight(Landroid/widget/TextView;)I
    move-result v0
  .line 472
    if-eqz v3, :L13
    invoke-static { v10 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rowHeight(Landroid/widget/TextView;)I
    move-result v1
    add-int/2addr v0, v1
    invoke-static { v0, v12 }, Ljava/lang/Math;->max(II)I
    move-result v0
  :L13
    move v2, v0
  .line 473
    if-eqz v3, :L14
  .line 478
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    const v1, 2131820769
    invoke-virtual { v6, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-direct { v6, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->divider(Ljava/lang/String;)Landroid/view/View;
    move-result-object v1
    invoke-direct/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->dividerParams()Landroid/widget/LinearLayout$LayoutParams;
    move-result-object v3
    invoke-virtual { v0, v1, v3 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 482
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
  .line 484
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
    aput v13, v0, v7
    goto :L15
  :L14
  .line 490
    iget-object v0, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
    iget-object v1, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v1 }, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v1
    aput v1, v0, v7
  .line 491
    iget-object v9, v6, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    const/high16 v3, 0x1F000000
    const/4 v5, 1
    const/4 v10, 0
    move-object/from16 v0, p0
    move-object v1, v4
    move v4, v5
    move v5, v10
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppQueueActivity;->band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
    move-result-object v0
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v13, v14 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual { v9, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L15
  .line 366
    add-int/lit8 v7, v7, 1
    goto/16 :L0
  :L16
  .line 495
    return-void
.end method

.method private cancelTail()V
  .registers 3
  .line 525
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
  .line 526
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-eqz v0, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    if-eqz v1, :L0
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L0
  .line 527
    return-void
.end method

.method private caption(Ljava/lang/String;)V
  .registers 4
  .line 741
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
    if-nez v0, :L0
  .line 742
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
  .line 743
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setPinned(Ljava/lang/String;)V
  .line 744
    return-void
  :L0
  .line 746
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->divider(Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
  .line 747
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capViews:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 748
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capLabels:Ljava/util/ArrayList;
    invoke-virtual { v1, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 749
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->dividerParams()Landroid/widget/LinearLayout$LayoutParams;
    move-result-object v1
    invoke-virtual { p1, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 750
    return-void
.end method

.method private captionView(Ljava/lang/String;)Landroid/widget/TextView;
  .registers 6
  .line 804
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 805
    const/high16 v1, 0x41400000
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 806
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 807
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 808
    const/16 v2, 16
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 811
    const/4 v2, 5
    const/4 v3, 3
    invoke-virtual { v0, v2, v3, v2, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 812
    const/4 v2, 1
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 813
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 814
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 815
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 816
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 815
    invoke-virtual { p1, v0, v2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 817
    return-object v0
.end method

.method private cover(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/Exception; { :L0 .. :L5 } :L6
  .registers 6
  .line 908
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 909
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 910
    if-eqz v1, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverPath:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverArt:Landroid/graphics/Bitmap;
    if-eqz v2, :L1
    return-object v2
  :L1
  .line 911
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 912
    if-eqz v2, :L2
    const/16 v3, 50
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v2
    goto :L3
  :L2
    move-object v2, v0
  :L3
  .line 913
    if-nez v2, :L4
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L4
  .line 914
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverPath:Ljava/lang/String;
  .line 915
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverArt:Landroid/graphics/Bitmap;
  :L5
  .line 916
    return-object v2
  :L6
  .line 917
    move-exception p1
  .line 918
    return-object v0
.end method

.method private divider(Ljava/lang/String;)Landroid/view/View;
  .registers 8
  .line 730
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
  .line 862
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, -1
    const/4 v2, -2
    invoke-direct { v0, v1, v2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    return-object v0
.end method

.method private endMulti()V
  .registers 2
  .line 1361
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 1362
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
  .line 1363
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->clear()V
  .line 1364
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->stopBlink()V
  .line 1365
    return-void
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 876
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private highlighted(I)Z
  .registers 3
  .line 586
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
  .line 587
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p1
    return p1
.end method

.method private label(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 4
  .line 945
    if-nez p1, :L0
    const-string p1, ""
    return-object p1
  :L0
  .line 946
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
    move-result-object p1
  .line 947
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Ipp;->songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 948
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 949
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 950
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
  .line 959
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L3
    if-ltz p1, :L3
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L3
  :L0
  .line 960
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
    if-eqz v0, :L1
    array-length v1, v0
    if-ge p1, v1, :L1
    aget-object v0, v0, p1
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 961
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->label(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
  .line 962
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
    if-eqz v1, :L2
    array-length v2, v1
    if-ge p1, v2, :L2
    aput-object v0, v1, p1
  :L2
  .line 963
    return-object v0
  :L3
  .line 959
    const-string p1, ""
    return-object p1
.end method

.method private manualCaption()Ljava/lang/String;
  .registers 5
  .line 928
    invoke-static { }, Lcom/innioasis/ipp/Queue;->manualCount()I
    move-result v0
  .line 929
    invoke-static { }, Lcom/innioasis/ipp/Queue;->manualShown()I
    move-result v1
  .line 930
    if-gt v0, v1, :L0
    const v0, 2131821078
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    return-object v0
  :L0
  .line 931
    const/4 v2, 2
    new-array v2, v2, [Ljava/lang/Object;
  .line 932
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    const/4 v3, 0
    aput-object v1, v2, v3
    const/4 v1, 1
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    aput-object v0, v2, v1
  .line 931
    const v0, 2131821117
    invoke-virtual { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private markBox(F)I
  .registers 3
  .line 720
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
  .line 721
    const/16 v0, 10
    if-ge p1, v0, :L0
    const/16 p1, 10
  :L0
    return p1
.end method

.method private move(I)V
  .registers 3
  .line 538
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 539
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paint(I)V
  .line 540
    iget p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paint(I)V
  .line 541
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollToSel()V
  .line 542
    return-void
.end method

.method private nameAt(I)Ljava/lang/String;
  .registers 4
  .line 969
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object p1
  .line 970
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->titleLen(Ljava/lang/String;)I
    move-result v0
  .line 971
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
  .line 1310
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 1311
    if-nez v0, :L0
    return-void
  :L0
  .line 1312
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Albums;->openAlbumOfSong(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;)V
  .line 1313
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1314
    return-void
.end method

.method private openArtist(Ljava/lang/String;)V
  .registers 4
  .line 1318
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1319
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 1320
    const-string v1, "ipp_artist"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1321
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->startActivity(Landroid/content/Intent;)V
  .line 1322
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1323
    return-void
  :L1
  .line 1318
    return-void
.end method

.method private paint(I)V
  .registers 5
  .line 592
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    if-eqz v0, :L8
    if-ltz p1, :L8
    array-length v1, v0
    if-ge p1, v1, :L8
    aget-object v0, v0, p1
    if-nez v0, :L0
    goto :L8
  :L0
  .line 593
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 594
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne p1, v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 595
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
    aget-object v1, v1, p1
  .line 602
    if-nez p1, :L3
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->nameAt(I)Ljava/lang/String;
    move-result-object v2
    goto :L4
  :L3
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object v2
  :L4
  .line 603
    if-eqz v0, :L5
  .line 604
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
    goto :L6
  :L5
  .line 606
    invoke-static { v1 }, Lcom/innioasis/ipp/Scroll;->stopMarquee(Landroid/widget/TextView;)V
  :L6
  .line 610
    if-nez p1, :L7
    return-void
  :L7
  .line 616
    new-instance p1, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->titleLen(Ljava/lang/String;)I
    move-result v0
    invoke-direct { p1, v2, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;-><init>(Ljava/lang/String;I)V
    invoke-virtual { v1, p1 }, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V
  .line 617
    return-void
  :L8
  .line 592
    return-void
.end method

.method private paintFocus(I)V
  .registers 11
  .line 550
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    if-eqz v0, :L15
    if-ltz p1, :L15
    array-length v1, v0
    if-ge p1, v1, :L15
    aget-object v0, v0, p1
    if-nez v0, :L0
    goto/16 :L15
  :L0
  .line 551
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->highlighted(I)Z
    move-result v0
  .line 552
    const/4 v1, 0
    if-nez p1, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 553
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tagViews:[Landroid/widget/TextView;
    aget-object v3, v3, p1
  .line 554
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
    aget-object v4, v4, p1
  .line 559
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
  .line 560
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->subViews:[Landroid/widget/TextView;
    aget-object v5, v5, p1
  .line 561
    sget-object v6, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v7, -1
    if-eqz v0, :L5
    sget v8, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    goto :L6
  :L5
    const/4 v8, -1
  :L6
    invoke-virtual { v6, v3, v8, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 562
    sget-object v6, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v0, :L7
    sget v8, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    goto :L8
  :L7
    const/4 v8, -1
  :L8
    invoke-virtual { v6, v4, v8, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 563
    if-eqz v5, :L10
    sget-object v6, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v0, :L9
    sget v7, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
  :L9
    invoke-virtual { v6, v5, v7, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L10
  .line 566
    if-eqz v2, :L11
    if-nez v0, :L11
  .line 567
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v2, 2131100252
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 568
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v3, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 569
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v4, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 570
    if-eqz v5, :L11
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v5, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L11
  .line 574
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->dotViews:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    if-eqz v0, :L14
  .line 575
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L12
  .line 576
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
  .line 575
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L14
  .line 578
    return-void
  :L15
  .line 550
    return-void
.end method

.method private pickedRows()Ljava/util/List;
  .registers 4
  .line 1297
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1298
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 1299
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L0
  .line 1300
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L1
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L0
  :L1
  .line 1301
    invoke-static { v0 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
  .line 1302
    return-object v0
  :L2
  .line 1304
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
  .line 1305
    return-object v0
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
  .line 635
    nop
  :L0
  .line 637
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  :L1
  .line 640
    goto :L3
  :L2
  .line 638
    move-exception v0
    const/4 v0, 0
  :L3
  .line 641
    const v1, 16777215
    const/high16 v2, 0xFF000000
    if-eqz v0, :L4
  .line 642
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result p2
    or-int/2addr p2, v2
    goto :L5
  :L4
  .line 644
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p2
    xor-int/2addr p2, v1
    or-int/2addr p2, v2
  :L5
  .line 646
    xor-int v0, p2, v1
    or-int/2addr v0, v2
  .line 647
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->markBox(F)I
    move-result v1
  .line 650
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
  .line 651
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  .line 652
    instance-of v4, v3, Landroid/graphics/Bitmap;
    if-eqz v4, :L6
    check-cast v3, Landroid/graphics/Bitmap;
    return-object v3
  :L6
  .line 657
    new-instance v3, Landroid/graphics/Paint;
    invoke-direct { v3 }, Landroid/graphics/Paint;-><init>()V
  .line 658
    const/4 v4, 1
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 659
    invoke-static { }, Lcom/innioasis/y1/activity/IppQueueActivity;->font()Landroid/graphics/Typeface;
    move-result-object v5
    invoke-virtual { v3, v5 }, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 660
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v5
    iget v5, v5, Landroid/util/DisplayMetrics;->scaledDensity:F
    mul-float p1, p1, v5
    invoke-virtual { v3, p1 }, Landroid/graphics/Paint;->setTextSize(F)V
  .line 661
    new-instance p1, Landroid/graphics/Rect;
    invoke-direct { p1 }, Landroid/graphics/Rect;-><init>()V
  .line 662
    const-string v5, "\u2022"
    const/4 v6, 0
    invoke-virtual { v3, v5, v6, v4, p1 }, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V
  .line 663
    invoke-virtual { p1 }, Landroid/graphics/Rect;->height()I
    move-result v4
    invoke-virtual { p1 }, Landroid/graphics/Rect;->width()I
    move-result p1
    invoke-static { v4, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 664
    const/4 v4, 3
    if-ge p1, v4, :L7
    const/4 p1, 3
  :L7
  .line 666
    nop
  .line 667
    add-int/lit8 v4, v1, -4
    if-le p1, v4, :L8
    move p1, v4
  :L8
  .line 669
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v1, v1, v4 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 670
    new-instance v5, Landroid/graphics/Canvas;
    invoke-direct { v5, v4 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 671
    int-to-float v1, v1
    const/high16 v6, 0x40000000
    div-float/2addr v1, v6
  .line 672
    int-to-float p1, p1
    div-float/2addr p1, v6
  .line 673
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual { v3, v6 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 674
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setColor(I)V
  .line 675
    invoke-virtual { v5, v1, v1, p1, v3 }, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
  .line 676
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 677
    const/high16 p2, 0x3FC00000
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 678
    invoke-virtual { v3, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 679
    invoke-virtual { v5, v1, v1, p1, v3 }, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
  .line 680
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { p1, v2, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 681
    return-object v4
.end method

.method private removePicked()V
  .registers 5
  .line 1263
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1264
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 1265
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L0
  .line 1266
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L1
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L0
  :L1
  .line 1267
    invoke-static { v0 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
    goto :L3
  :L2
  .line 1268
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lez v1, :L3
  .line 1269
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L4
  :L3
  .line 1268
    nop
  :L4
  .line 1271
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    add-int/lit8 v1, v1, -1
  :L5
    if-ltz v1, :L7
  .line 1272
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 1273
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->canRemoveRow(I)Z
    move-result v3
    if-eqz v3, :L6
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->removeRow(I)V
  :L6
  .line 1271
    add-int/lit8 v1, v1, -1
    goto :L5
  :L7
  .line 1275
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1276
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 1277
    return-void
.end method

.method private repaintAll()V
  .registers 3
  .line 1384
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    if-nez v0, :L0
    return-void
  :L0
  .line 1385
    const/4 v0, 0
  :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    array-length v1, v1
    if-ge v0, v1, :L2
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 1386
    return-void
.end method

.method private resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L6 } :L8
  .registers 5
  :L0
  .line 1050
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v0
  .line 1051
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L1
    return-object p1
  :L1
  .line 1052
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 1053
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 1054
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    invoke-virtual { v1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 1055
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L3
    check-cast v1, Lcom/innioasis/y1/database/Song;
    return-object v1
  :L3
  .line 1056
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 1057
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  .line 1058
    if-nez v2, :L4
    new-instance v2, Ljava/io/File;
    invoke-direct { v2, v0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L4
  .line 1059
    if-nez v2, :L5
    return-object p1
  :L5
  .line 1060
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    invoke-virtual { v1, v0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L6
  .line 1061
    return-object v2
  :L7
  .line 1053
    return-object p1
  :L8
  .line 1062
    move-exception v0
  .line 1063
    return-object p1
.end method

.method static rowHeight(Landroid/widget/TextView;)I
  .registers 2
  .line 867
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTextSize()F
    move-result p0
    const/high16 v0, 0x3FC00000
    mul-float p0, p0, v0
    float-to-int p0, p0
    return p0
.end method

.method private rule(II)Landroid/view/View;
  .registers 4
  .line 854
    new-instance v0, Landroid/view/View;
    invoke-direct { v0, p0 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 855
    or-int/2addr p1, p2
    invoke-virtual { v0, p1 }, Landroid/view/View;->setBackgroundColor(I)V
  .line 856
    return-object v0
.end method

.method private scrollToSel()V
  .registers 3
  .line 1073
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L1
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollPending:Z
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 1074
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollPending:Z
  .line 1075
    new-instance v1, Lcom/innioasis/y1/activity/IppQueueActivity$ScrollTask;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$ScrollTask;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z
  .line 1076
    return-void
  :L1
  .line 1073
    return-void
.end method

.method private setPinned(Ljava/lang/String;)V
  .registers 3
  .line 782
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedText:Landroid/widget/TextView;
    if-eqz v0, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    if-nez v0, :L0
    goto :L2
  :L0
  .line 783
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
  .line 784
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedShown:Ljava/lang/String;
  .line 785
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedText:Landroid/widget/TextView;
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 786
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    const/4 v0, 0
    invoke-virtual { p1, v0 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  .line 787
    return-void
  :L2
  .line 782
    return-void
.end method

.method private songAt(I)Lcom/innioasis/y1/database/Song;
  .registers 4
  .line 1338
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    const/4 v1, 0
    if-eqz v0, :L2
    if-ltz p1, :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L2
  :L0
  .line 1339
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 1340
    instance-of v0, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v0, :L1
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L1
    return-object v1
  :L2
  .line 1338
    return-object v1
.end method

.method private startMulti()V
  .registers 5
  .line 1346
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1347
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
  .line 1348
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->clear()V
  .line 1352
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lez v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L1
  .line 1353
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1354
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Blink;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
  .line 1355
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v1, :L2
    const-wide/16 v2, 500
    invoke-virtual { v1, v0, v2, v3 }, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z
  :L2
  .line 1356
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 1357
    return-void
.end method

.method private stopBlink()V
  .registers 3
  .line 1368
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1369
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    if-eqz v0, :L1
  .line 1370
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v1, :L0
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L0
  .line 1371
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
  :L1
  .line 1373
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
    add-int/lit8 v1, v1, 2
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
  .line 287
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
  .line 694
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->markBox(F)I
    move-result p1
  .line 695
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p2
  .line 696
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
  .line 697
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { v1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 698
    instance-of v2, v1, Landroid/graphics/Bitmap;
    if-eqz v2, :L0
    check-cast v1, Landroid/graphics/Bitmap;
    return-object v1
  :L0
  .line 700
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p1, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 701
    new-instance v8, Landroid/graphics/Canvas;
    invoke-direct { v8, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 702
    new-instance v9, Landroid/graphics/Paint;
    const/4 v2, 1
    invoke-direct { v9, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 703
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setColor(I)V
  .line 704
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 705
    int-to-float p1, p1
    const/high16 p2, 0x41800000
    div-float/2addr p1, p2
  .line 706
    const p2, 1075419546
    mul-float p2, p2, p1
  .line 707
    const/high16 v2, 0x3FC00000
    cmpg-float v3, p2, v2
    if-gez v3, :L1
    const/high16 p2, 0x3FC00000
  :L1
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 708
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
  .line 709
    const/high16 v2, 0x41580000
    mul-float v5, p1, v2
    const/high16 v2, 0x40600000
    mul-float v6, p1, v2
    move-object v2, v8
    move v3, p2
    move v4, v10
    invoke-virtual/range { v2 .. v7 }, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
  .line 710
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { p1, v0, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 711
    return-object v1
.end method

.method private static titleLen(Ljava/lang/String;)I
  .registers 2
  .line 981
    if-nez p0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 982
    const-string v0, " \u2014 "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v0
  .line 983
    if-gez v0, :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
  :L1
    return v0
.end method

.method private static unNamed(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 1029
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 1031
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 1032
    move-exception v0
  .line 1033
    return-object p0
.end method

.method public antiClockwise()V
  .registers 3
  .line 1120
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 1121
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-gt v0, v1, :L0
    return-void
  :L0
  .line 1122
    add-int/lit8 v1, v0, -1
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 1123
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->move(I)V
  .line 1124
    return-void
.end method

.method blinkTick()V
  .registers 5
  .line 1376
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v0, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    if-nez v0, :L0
    goto :L2
  :L0
  .line 1377
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
    xor-int/lit8 v0, v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1378
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 1379
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    const-wide/16 v2, 500
    invoke-virtual { v0, v1, v2, v3 }, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 1380
    return-void
  :L2
  .line 1376
    return-void
.end method

.method buildTail()V
  .registers 3
  .line 503
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 504
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
  .line 505
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    if-eqz v1, :L1
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L1
  .line 506
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L4
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v0, :L4
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L2
    goto :L4
  :L2
  .line 507
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailFrom:I
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->build(II)V
  .line 508
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L3
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V
  :L3
  .line 509
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollToSel()V
  .line 511
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repin()V
  .line 512
    return-void
  :L4
  .line 506
    return-void
.end method

.method public clockwise()V
  .registers 3
  .line 1110
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 1111
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L1
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
    if-lt v1, v0, :L0
    goto :L1
  :L0
  .line 1112
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    add-int/lit8 v1, v0, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 1113
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->move(I)V
  .line 1114
    return-void
  :L1
  .line 1111
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 1136
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 1137
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 1138
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v0, :L3
  .line 1139
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v0, :L1
    return-void
  :L1
  .line 1140
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
  .line 1141
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L2
  .line 1142
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 1143
    return-void
  :L3
  .line 1145
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v0, :L4
  .line 1146
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1147
    return-void
  :L4
  .line 1149
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->playRow(I)V
  .line 1150
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 1151
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 1152
    return-void
  :L5
  .line 1137
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 1390
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L1
  .line 1393
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz p1, :L0
  .line 1394
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1395
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repaintAll()V
  .line 1396
    return-void
  :L0
  .line 1398
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  :L1
  .line 1400
    return-void
.end method

.method doScroll()V
  .registers 7
  .line 1079
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollPending:Z
  .line 1080
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v1, :L9
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-nez v2, :L0
    goto :L9
  :L0
  .line 1083
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
    if-eqz v3, :L8
    iget v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ltz v4, :L8
    array-length v5, v3
    if-lt v4, v5, :L1
    goto :L8
  :L1
  .line 1084
    aget v3, v3, v4
  .line 1085
    if-gez v3, :L2
  .line 1086
    invoke-virtual { v1, v0, v0 }, Landroid/widget/ScrollView;->smoothScrollTo(II)V
  .line 1087
    return-void
  :L2
  .line 1089
    invoke-virtual { v2 }, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v1
    if-lt v3, v1, :L3
    return-void
  :L3
  .line 1090
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v1, v3 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 1091
    if-nez v1, :L4
    return-void
  :L4
  .line 1092
    invoke-virtual { v1 }, Landroid/view/View;->getTop()I
    move-result v2
  .line 1093
    invoke-virtual { v1 }, Landroid/view/View;->getBottom()I
    move-result v1
  .line 1096
    if-lez v3, :L5
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    add-int/lit8 v3, v3, -1
    invoke-virtual { v4, v3 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v4
    instance-of v4, v4, Landroid/widget/TextView;
    if-eqz v4, :L5
  .line 1097
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v2
  :L5
  .line 1099
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v3 }, Landroid/widget/ScrollView;->getScrollY()I
    move-result v3
  .line 1100
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v4 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v4
  .line 1101
    if-ge v2, v3, :L6
  .line 1102
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v0, v2 }, Landroid/widget/ScrollView;->smoothScrollTo(II)V
    goto :L7
  :L6
  .line 1103
    add-int/2addr v3, v4
    if-le v1, v3, :L7
  .line 1104
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    sub-int/2addr v1, v4
    invoke-virtual { v2, v0, v1 }, Landroid/widget/ScrollView;->smoothScrollTo(II)V
  :L7
  .line 1106
    return-void
  :L8
  .line 1083
    return-void
  :L9
  .line 1080
    return-void
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
  .line 206
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 13
  .line 211
    const v0, 2131821043
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 213
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 214
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 218
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct { v1, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 219
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 224
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
  .line 225
    invoke-virtual { v3, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 226
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    const/4 v4, -1
    const/4 v5, -2
    invoke-virtual { v1, v3, v4, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 230
    const-string v3, ""
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->captionView(Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v7
    iput-object v7, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedText:Landroid/widget/TextView;
  .line 231
    const/4 v8, -2
    const/high16 v9, 0x59000000
    const/4 v10, 2
    const/high16 v11, 0x59000000
    move-object v6, p0
    invoke-direct/range { v6 .. v11 }, Lcom/innioasis/y1/activity/IppQueueActivity;->band(Landroid/view/View;IIII)Landroid/widget/LinearLayout;
    move-result-object v3
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
  .line 232
    const/16 v6, 8
    invoke-virtual { v3, v6 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  .line 233
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    invoke-virtual { v1, v3, v4, v5 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 235
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
  .line 236
    invoke-virtual { v3, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 238
    new-instance v2, Landroid/widget/ScrollView;
    invoke-direct { v2, p0 }, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
  .line 239
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v2, v3, v4, v5 }, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V
  .line 240
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, 0
    invoke-direct { v2, v4, v3 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 241
    const/high16 v5, 0x3F800000
    iput v5, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 242
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v5, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 244
    invoke-virtual { v0, v1, v4, v4 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 249
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v0 }, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppQueueActivity$Pin;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Pin;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V
  .line 251
    iput v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 252
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 254
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
  .line 255
    new-instance v1, Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.MY_PLAY_SONG"
    invoke-direct { v1, v2 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 256
    return-void
.end method

.method public longConfirm()V
  .registers 6
  .line 1173
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 1174
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L7
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L7
  :L0
  .line 1175
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1176
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    const v2, 2131821106
    if-eqz v1, :L1
  .line 1177
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L1
  .line 1178
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    const v3, 2131821105
    const v4, 2131821071
    if-nez v1, :L3
  .line 1179
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :L2
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 1180
    invoke-virtual { p0, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1181
    invoke-static { }, Lcom/innioasis/ipp/Queue;->hasSource()Z
    move-result v1
    if-eqz v1, :L6
    const v1, 2131821093
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L3
  .line 1183
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->canRemoveRow(I)Z
    move-result v1
    if-eqz v1, :L4
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 1184
    const v1, 2131820844
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1185
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :L5
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 1186
    invoke-virtual { p0, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 1190
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getActivity()Landroid/app/Activity;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;
    invoke-direct { v3, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    const v4, 2131886360
    invoke-direct { v1, v2, v0, v3, v4 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
  .line 1191
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 1192
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 1193
    return-void
  :L7
  .line 1174
    return-void
.end method

.method protected onDestroy()V
  .catch Ljava/lang/Exception; { :L0 .. :L1 } :L2
  .registers 2
  .line 260
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->stopBlink()V
  .line 261
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->cancelTail()V
  .line 262
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
    if-eqz v0, :L4
  :L0
  .line 264
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
  :L1
  .line 267
    goto :L3
  :L2
  .line 265
    move-exception v0
  :L3
  .line 268
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
  :L4
  .line 270
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 271
    return-void
.end method

.method onTrackChanged()V
  .registers 1
  .line 281
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 282
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 283
    return-void
.end method

.method public onWindowFocusChanged(Z)V
  .registers 3
  .line 520
    invoke-super { p0, p1 }, Lcom/innioasis/y1/base/BaseActivity;->onWindowFocusChanged(Z)V
  .line 521
    if-eqz p1, :L0
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
    if-eqz p1, :L0
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-eqz p1, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    if-eqz v0, :L0
    invoke-virtual { v0, p1 }, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z
  :L0
  .line 522
    return-void
.end method

.method pick(Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 7
  .line 1201
    const/4 v0, 1
    if-nez p1, :L0
    return v0
  :L0
  .line 1202
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
  .line 1203
    if-eqz v1, :L1
  .line 1204
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->addToPlaylist(Ljava/util/UUID;)V
  .line 1205
    return v0
  :L1
  .line 1207
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  .line 1208
    if-nez p1, :L2
    return v0
  :L2
  .line 1209
    const v1, 2131821106
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
  .line 1210
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->removePicked()V
  .line 1211
    return v0
  :L3
  .line 1213
    const v1, 2131820844
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L4
  .line 1214
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->startMulti()V
  .line 1215
    return v0
  :L4
  .line 1217
    const v1, 2131821071
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L5
  .line 1218
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openAlbum()V
  .line 1219
    return v0
  :L5
  .line 1221
    const v1, 2131821093
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L7
  .line 1224
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->openSource(Landroid/app/Activity;)Z
    move-result p1
    if-eqz p1, :L6
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  :L6
  .line 1225
    return v0
  :L7
  .line 1227
    const v1, 2131821105
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L10
  .line 1228
    iget p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object p1
  .line 1229
    if-nez p1, :L8
    return v0
  :L8
  .line 1230
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 0
    if-ne v1, v0, :L9
  .line 1231
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/String;
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openArtist(Ljava/lang/String;)V
  .line 1232
    return v0
  :L9
  .line 1235
    new-instance v0, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    new-instance v3, Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;
    invoke-direct { v3, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    const v4, 2131886360
    invoke-direct { v0, v1, p1, v3, v4 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 1236
    return v2
  :L10
  .line 1238
    return v0
.end method

.method pickArtist(Ljava/lang/String;)V
  .registers 3
  .line 1243
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
    if-eqz v0, :L0
  .line 1244
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->dismiss()V
  .line 1245
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
  :L0
  .line 1247
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openArtist(Ljava/lang/String;)V
  .line 1248
    return-void
.end method

.method public quit()V
  .registers 1
  .line 1404
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1405
    return-void
.end method

.method render()V
  .registers 5
  .line 298
    invoke-static { }, Lcom/innioasis/ipp/Queue;->upNext()Ljava/util/List;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
  .line 299
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 300
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 301
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->cancelTail()V
  .line 303
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
  .line 304
    new-array v1, v0, [Landroid/view/View;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
  .line 305
    new-array v1, v0, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tagViews:[Landroid/widget/TextView;
  .line 306
    new-array v1, v0, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
  .line 307
    new-array v1, v0, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->subViews:[Landroid/widget/TextView;
  .line 308
    new-array v1, v0, [Landroid/widget/ImageView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->dotViews:[Landroid/widget/ImageView;
  .line 309
    new-array v1, v0, [Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
  .line 310
    const/4 v1, 0
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->manualHeaderDone:Z
  .line 311
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->autoHeaderDone:Z
  .line 312
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capViews:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->clear()V
  .line 313
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capLabels:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->clear()V
  .line 314
    const/4 v2, 0
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
  .line 315
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedShown:Ljava/lang/String;
  .line 316
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    if-eqz v2, :L0
    const/16 v3, 8
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  :L0
  .line 318
    if-nez v0, :L1
  .line 319
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 320
    const/high16 v2, 0x41800000
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 321
    const/16 v2, 12
    const/4 v3, 6
    invoke-virtual { v0, v3, v2, v3, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 322
    const v2, 2131821044
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 323
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v3, -1
    invoke-virtual { v2, v0, v3, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 324
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    const/4 v2, -2
    invoke-virtual { v1, v0, v3, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 325
    return-void
  :L1
  .line 327
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lt v2, v0, :L2
    add-int/lit8 v2, v0, -1
    iput v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  :L2
  .line 328
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-gez v2, :L3
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  :L3
  .line 330
    new-array v2, v0, [I
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
  .line 334
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->syncRows()I
    move-result v2
    iget v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    add-int/lit8 v3, v3, 2
    invoke-static { v2, v3 }, Ljava/lang/Math;->max(II)I
    move-result v2
  .line 335
    if-le v2, v0, :L4
    move v2, v0
  :L4
  .line 336
    invoke-direct { p0, v1, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->build(II)V
  .line 337
    const/4 v1, 1
    if-ge v2, v0, :L6
  .line 338
    iput v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailFrom:I
  .line 339
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
  .line 340
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-nez v0, :L5
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Tail;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
  :L5
  .line 350
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->hasWindowFocus()Z
    move-result v0
    if-eqz v0, :L6
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z
  :L6
  .line 358
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
    xor-int/2addr v1, v2
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V
  .line 359
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollToSel()V
  .line 361
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repin()V
  .line 362
    return-void
.end method

.method repin()V
  .catchall { :L0 .. :L7 } :L9
  .registers 5
  :L0
  .line 763
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    if-eqz v0, :L8
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-nez v1, :L1
    goto :L8
  :L1
  .line 764
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
    if-nez v2, :L3
  .line 765
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->getVisibility()I
    move-result v0
    const/16 v1, 8
    if-eq v0, v1, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinned:Landroid/widget/LinearLayout;
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setVisibility(I)V
  :L2
  .line 766
    return-void
  :L3
  .line 768
    invoke-virtual { v1 }, Landroid/widget/ScrollView;->getScrollY()I
    move-result v0
  .line 769
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->pinnedFirst:Ljava/lang/String;
  .line 770
    const/4 v2, 0
  :L4
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capViews:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L6
  .line 771
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capViews:Ljava/util/ArrayList;
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroid/view/View;
  .line 772
    invoke-virtual { v3 }, Landroid/view/View;->getTop()I
    move-result v3
    sub-int/2addr v3, v0
    if-lez v3, :L5
    goto :L6
  :L5
  .line 773
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->capLabels:Ljava/util/ArrayList;
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 770
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 775
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setPinned(Ljava/lang/String;)V
  :L7
  .line 778
    goto :L10
  :L8
  .line 763
    return-void
  :L9
  .line 776
    move-exception v0
  :L10
  .line 779
    return-void
.end method

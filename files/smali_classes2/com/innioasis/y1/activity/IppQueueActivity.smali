.class public final Lcom/innioasis/y1/activity/IppQueueActivity;
.super Lcom/innioasis/y1/base/BaseActivity;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
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

.field private final static COVER_PX:I = 50

.field private final static SEP:Ljava/lang/String; = " \u2014 "

.field private final static SYNC_ROWS_MIN:I = 8

.field private autoHeaderDone:Z

.field private blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;

.field private blinkOn:Z

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

.field private final resolvedByPath:Ljava/util/HashMap;

.field private rowViews:[Landroid/view/View;

.field private rows:Ljava/util/List;

.field private scrollPending:Z

.field private scroller:Landroid/widget/ScrollView;

.field private sel:I

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
  .line 147
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
  .line 155
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
  .line 163
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    return-void
.end method

.method private addToPlaylist(Ljava/util/UUID;)V
  .registers 6
  .line 1043
    if-nez p1, :L0
    return-void
  :L0
  .line 1044
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1045
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->pickedRows()Ljava/util/List;
    move-result-object v1
  .line 1046
    const/4 v2, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 1047
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-direct { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 1048
    if-eqz v3, :L2
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 1046
    add-int/lit8 v2, v2, 1
    goto :L1
  :L3
  .line 1050
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1051
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repaintAll()V
  .line 1052
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L4
    return-void
  :L4
  .line 1053
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;
    invoke-direct { v2, v0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity$AddTask;-><init>(Ljava/util/List;Ljava/util/UUID;)V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 1054
    return-void
.end method

.method private artistsOf(I)Ljava/util/List;
  .registers 2
  .line 1094
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object p1
    return-object p1
.end method

.method private static bold(Landroid/widget/TextView;)V
  .registers 3
  .line 659
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-virtual { p0, v0, v1 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 660
    return-void
.end method

.method private build(II)V
  .registers 14
  .line 306
    nop
  :L0
    if-ge p1, p2, :L13
  .line 307
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 308
    const/4 v1, 1
    const/4 v2, 0
    if-nez p1, :L1
    const/4 v3, 1
    goto :L2
  :L1
    const/4 v3, 0
  :L2
  .line 309
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->isManualRow(I)Z
    move-result v4
  .line 310
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v5
  .line 316
    if-nez v3, :L3
    if-eqz v4, :L3
    iget-boolean v6, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->manualHeaderDone:Z
    if-nez v6, :L3
  .line 317
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->manualCaption()Ljava/lang/String;
    move-result-object v6
    invoke-direct { p0, v6 }, Lcom/innioasis/y1/activity/IppQueueActivity;->divider(Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v6
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->dividerParams()Landroid/widget/LinearLayout$LayoutParams;
    move-result-object v7
    invoke-virtual { v4, v6, v7 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 318
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->manualHeaderDone:Z
    goto :L4
  :L3
  .line 319
    if-nez v3, :L4
    if-nez v4, :L4
    iget-boolean v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->autoHeaderDone:Z
    if-nez v4, :L4
  .line 320
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    new-array v6, v1, [Ljava/lang/Object;
  .line 321
    invoke-static { }, Lcom/innioasis/ipp/Queue;->source()Ljava/lang/String;
    move-result-object v7
    aput-object v7, v6, v2
  .line 320
    const v7, 2131821079
    invoke-virtual { p0, v7, v6 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v6
    invoke-direct { p0, v6 }, Lcom/innioasis/y1/activity/IppQueueActivity;->divider(Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v6
  .line 321
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->dividerParams()Landroid/widget/LinearLayout$LayoutParams;
    move-result-object v7
  .line 320
    invoke-virtual { v4, v6, v7 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 322
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->autoHeaderDone:Z
  :L4
  .line 325
    new-instance v4, Landroid/widget/LinearLayout;
    invoke-direct { v4, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 326
    invoke-virtual { v4, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 327
    invoke-virtual { v4, v2 }, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V
  .line 328
    const/16 v6, 16
    invoke-virtual { v4, v6 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 329
    const/4 v7, 5
    invoke-virtual { v4, v7, v2, v7, v2 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 333
    if-eqz v3, :L5
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->cover(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
    move-result-object v0
    goto :L6
  :L5
    const/4 v0, 0
  :L6
  .line 334
    new-instance v7, Landroid/widget/TextView;
    invoke-direct { v7, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 335
    const/16 v8, 8
    const/4 v9, -2
    if-eqz v3, :L8
  .line 336
    if-eqz v0, :L7
  .line 337
    new-instance v9, Landroid/widget/ImageView;
    invoke-direct { v9, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 338
    invoke-virtual { v9, v0 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 339
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v10, 50
    invoke-direct { v0, v10, v10 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 340
    iput v8, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 341
    invoke-virtual { v4, v9, v0 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 342
    goto :L9
  :L7
  .line 343
    invoke-virtual { v7, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 344
    invoke-static { v7 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 345
    invoke-virtual { v7, v2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 346
    invoke-virtual { v7, v6 }, Landroid/widget/TextView;->setGravity(I)V
  .line 347
    invoke-virtual { v7, v2, v2, v8, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 348
    const-string v0, "\u25b6"
    invoke-virtual { v7, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 349
    invoke-virtual { v4, v7, v9, v9 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
    goto :L9
  :L8
  .line 355
    new-instance v0, Landroid/widget/ImageView;
    invoke-direct { v0, p0 }, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
  .line 356
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v10, v9, v9 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 357
    iput v8, v10, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
  .line 358
    invoke-virtual { v4, v0, v10 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 359
    iget-object v8, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->dotViews:[Landroid/widget/ImageView;
    aput-object v0, v8, p1
  :L9
  .line 362
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 363
    invoke-virtual { v0, v5 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 365
    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v0, v5, v2 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 366
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 367
    invoke-virtual { v0, v6 }, Landroid/widget/TextView;->setGravity(I)V
  .line 368
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 369
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 370
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -1
    invoke-direct { v1, v2, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 371
    const/high16 v2, 0x3F800000
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 372
    invoke-virtual { v4, v0, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 374
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    aput-object v4, v1, p1
  .line 375
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tagViews:[Landroid/widget/TextView;
    aput-object v7, v1, p1
  .line 376
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
    aput-object v0, v1, p1
  .line 377
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paint(I)V
  .line 381
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->rowHeight(Landroid/widget/TextView;)I
    move-result v0
  .line 382
    if-eqz v3, :L10
    mul-int/lit8 v0, v0, 2
  :L10
  .line 383
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v1, v5, v0 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 384
    const/4 v0, 2
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
  .line 385
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I
  .line 386
    if-eqz v3, :L11
  .line 387
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    invoke-virtual { v0, v4, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 388
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
    aput v5, v0, p1
    goto :L12
  :L11
  .line 390
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v2 }, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v2
    aput v2, v0, p1
  .line 391
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v0, v4, v1 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  :L12
  .line 306
    add-int/lit8 p1, p1, 1
    goto/16 :L0
  :L13
  .line 394
    return-void
.end method

.method private cancelTail()V
  .registers 3
  .line 422
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
  .line 423
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-eqz v0, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    if-eqz v1, :L0
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L0
  .line 424
    return-void
.end method

.method private cover(Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/Exception; { :L0 .. :L5 } :L6
  .registers 6
  .line 682
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 683
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 684
    if-eqz v1, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverPath:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverArt:Landroid/graphics/Bitmap;
    if-eqz v2, :L1
    return-object v2
  :L1
  .line 685
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 686
    if-eqz v2, :L2
    const/16 v3, 50
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v2
    goto :L3
  :L2
    move-object v2, v0
  :L3
  .line 687
    if-nez v2, :L4
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L4
  .line 688
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverPath:Ljava/lang/String;
  .line 689
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->coverArt:Landroid/graphics/Bitmap;
  :L5
  .line 690
    return-object v2
  :L6
  .line 691
    move-exception p1
  .line 692
    return-object v0
.end method

.method private divider(Ljava/lang/String;)Landroid/widget/TextView;
  .registers 6
  .line 619
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 620
    const/high16 v1, 0x41400000
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 621
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->bold(Landroid/widget/TextView;)V
  .line 622
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 623
    const/16 v2, 16
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 624
    const/4 v2, 5
    invoke-virtual { v0, v2, v1, v2, v1 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 625
    const/4 v2, 1
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setSingleLine(Z)V
  .line 626
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 627
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 628
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100252
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
    invoke-virtual { p1, v0, v2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 629
    return-object v0
.end method

.method private dividerParams()Landroid/widget/LinearLayout$LayoutParams;
  .registers 4
  .line 633
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, -1
    const/4 v2, -2
    invoke-direct { v0, v1, v2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 634
    const/4 v1, 6
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
  .line 635
    const/4 v1, 1
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I
  .line 636
    return-object v0
.end method

.method private endMulti()V
  .registers 2
  .line 1122
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 1123
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
  .line 1124
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->clear()V
  .line 1125
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->stopBlink()V
  .line 1126
    return-void
.end method

.method private static font()Landroid/graphics/Typeface;
  .registers 2
  .line 650
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v1, 1
    invoke-static { v0, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v0
    return-object v0
.end method

.method private highlighted(I)Z
  .registers 3
  .line 480
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
  .line 481
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p1
    return p1
.end method

.method private label(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 4
  .line 719
    if-nez p1, :L0
    const-string p1, ""
    return-object p1
  :L0
  .line 720
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
    move-result-object p1
  .line 721
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Ipp;->songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 722
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 723
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 724
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
  .line 733
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L3
    if-ltz p1, :L3
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L3
  :L0
  .line 734
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
    if-eqz v0, :L1
    array-length v1, v0
    if-ge p1, v1, :L1
    aget-object v0, v0, p1
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 735
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->label(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
  .line 736
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
    if-eqz v1, :L2
    array-length v2, v1
    if-ge p1, v2, :L2
    aput-object v0, v1, p1
  :L2
  .line 737
    return-object v0
  :L3
  .line 733
    const-string p1, ""
    return-object p1
.end method

.method private manualCaption()Ljava/lang/String;
  .registers 5
  .line 702
    invoke-static { }, Lcom/innioasis/ipp/Queue;->manualCount()I
    move-result v0
  .line 703
    invoke-static { }, Lcom/innioasis/ipp/Queue;->manualShown()I
    move-result v1
  .line 704
    if-gt v0, v1, :L0
    const v0, 2131821078
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    return-object v0
  :L0
  .line 705
    const/4 v2, 2
    new-array v2, v2, [Ljava/lang/Object;
  .line 706
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    const/4 v3, 0
    aput-object v1, v2, v3
    const/4 v1, 1
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    aput-object v0, v2, v1
  .line 705
    const v0, 2131821117
    invoke-virtual { p0, v0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private markBox(F)I
  .registers 3
  .line 609
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
  .line 610
    const/16 v0, 10
    if-ge p1, v0, :L0
    const/16 p1, 10
  :L0
    return p1
.end method

.method private move(I)V
  .registers 3
  .line 435
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 436
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paint(I)V
  .line 437
    iget p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paint(I)V
  .line 438
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollToSel()V
  .line 439
    return-void
.end method

.method private openAlbum()V
  .registers 2
  .line 1071
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->songAt(I)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 1072
    if-nez v0, :L0
    return-void
  :L0
  .line 1073
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Albums;->openAlbumOfSong(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;)V
  .line 1074
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1075
    return-void
.end method

.method private openArtist(Ljava/lang/String;)V
  .registers 4
  .line 1079
    if-eqz p1, :L1
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 1080
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/AlbumsActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 1081
    const-string v1, "ipp_artist"
    invoke-virtual { v0, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 1082
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->startActivity(Landroid/content/Intent;)V
  .line 1083
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1084
    return-void
  :L1
  .line 1079
    return-void
.end method

.method private paint(I)V
  .registers 5
  .line 486
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    if-eqz v0, :L5
    if-ltz p1, :L5
    array-length v1, v0
    if-ge p1, v1, :L5
    aget-object v0, v0, p1
    if-nez v0, :L0
    goto :L5
  :L0
  .line 487
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 488
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ne p1, v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 489
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
    aget-object v1, v1, p1
  .line 494
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->labelAt(I)Ljava/lang/String;
    move-result-object p1
  .line 495
    if-eqz v0, :L3
  .line 496
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
    goto :L4
  :L3
  .line 498
    invoke-static { v1 }, Lcom/innioasis/ipp/Scroll;->stopMarquee(Landroid/widget/TextView;)V
  :L4
  .line 505
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->titleLen(Ljava/lang/String;)I
    move-result v2
    invoke-direct { v0, p1, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity$BoldTitle;-><init>(Ljava/lang/String;I)V
    invoke-virtual { v1, v0 }, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V
  .line 506
    return-void
  :L5
  .line 486
    return-void
.end method

.method private paintFocus(I)V
  .registers 10
  .line 447
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    if-eqz v0, :L12
    if-ltz p1, :L12
    array-length v1, v0
    if-ge p1, v1, :L12
    aget-object v0, v0, p1
    if-nez v0, :L0
    goto/16 :L12
  :L0
  .line 448
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->highlighted(I)Z
    move-result v0
  .line 449
    const/4 v1, 0
    if-nez p1, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 450
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tagViews:[Landroid/widget/TextView;
    aget-object v3, v3, p1
  .line 451
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
    aget-object v4, v4, p1
  .line 456
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
  .line 457
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v6, -1
    if-eqz v0, :L5
    sget v7, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
    goto :L6
  :L5
    const/4 v7, -1
  :L6
    invoke-virtual { v5, v3, v7, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 458
    sget-object v5, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    if-eqz v0, :L7
    sget v6, Lcom/innioasis/y1/activity/IppQueueActivity;->ACCENT:I
  :L7
    invoke-virtual { v5, v4, v6, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 461
    if-eqz v2, :L8
    if-nez v0, :L8
  .line 462
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v2, 2131100252
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 463
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v3, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 464
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2, v4, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L8
  .line 468
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->dotViews:[Landroid/widget/ImageView;
    aget-object v0, v0, p1
    if-eqz v0, :L11
  .line 469
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L9
  .line 470
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result p1
    invoke-direct { p0, p1, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->tickMark(FLandroid/widget/TextView;)Landroid/graphics/Bitmap;
    move-result-object p1
    goto :L10
  :L9
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result p1
    invoke-direct { p0, p1, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->queuedDot(FLandroid/widget/TextView;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L10
  .line 469
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L11
  .line 472
    return-void
  :L12
  .line 447
    return-void
.end method

.method private pickedRows()Ljava/util/List;
  .registers 4
  .line 1058
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1059
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 1060
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L0
  .line 1061
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L1
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L0
  :L1
  .line 1062
    invoke-static { v0 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
  .line 1063
    return-object v0
  :L2
  .line 1065
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
  .line 1066
    return-object v0
.end method

.method private static px(FLandroid/util/DisplayMetrics;)I
  .registers 3
  .line 130
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
  .line 524
    nop
  :L0
  .line 526
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  :L1
  .line 529
    goto :L3
  :L2
  .line 527
    move-exception v0
    const/4 v0, 0
  :L3
  .line 530
    const v1, 16777215
    const/high16 v2, 0xFF000000
    if-eqz v0, :L4
  .line 531
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result p2
    or-int/2addr p2, v2
    goto :L5
  :L4
  .line 533
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p2
    xor-int/2addr p2, v1
    or-int/2addr p2, v2
  :L5
  .line 535
    xor-int v0, p2, v1
    or-int/2addr v0, v2
  .line 536
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->markBox(F)I
    move-result v1
  .line 539
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
  .line 540
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  .line 541
    instance-of v4, v3, Landroid/graphics/Bitmap;
    if-eqz v4, :L6
    check-cast v3, Landroid/graphics/Bitmap;
    return-object v3
  :L6
  .line 546
    new-instance v3, Landroid/graphics/Paint;
    invoke-direct { v3 }, Landroid/graphics/Paint;-><init>()V
  .line 547
    const/4 v4, 1
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 548
    invoke-static { }, Lcom/innioasis/y1/activity/IppQueueActivity;->font()Landroid/graphics/Typeface;
    move-result-object v5
    invoke-virtual { v3, v5 }, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 549
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v5
    iget v5, v5, Landroid/util/DisplayMetrics;->scaledDensity:F
    mul-float p1, p1, v5
    invoke-virtual { v3, p1 }, Landroid/graphics/Paint;->setTextSize(F)V
  .line 550
    new-instance p1, Landroid/graphics/Rect;
    invoke-direct { p1 }, Landroid/graphics/Rect;-><init>()V
  .line 551
    const-string v5, "\u2022"
    const/4 v6, 0
    invoke-virtual { v3, v5, v6, v4, p1 }, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V
  .line 552
    invoke-virtual { p1 }, Landroid/graphics/Rect;->height()I
    move-result v4
    invoke-virtual { p1 }, Landroid/graphics/Rect;->width()I
    move-result p1
    invoke-static { v4, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 553
    const/4 v4, 3
    if-ge p1, v4, :L7
    const/4 p1, 3
  :L7
  .line 555
    nop
  .line 556
    add-int/lit8 v4, v1, -4
    if-le p1, v4, :L8
    move p1, v4
  :L8
  .line 558
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v1, v1, v4 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 559
    new-instance v5, Landroid/graphics/Canvas;
    invoke-direct { v5, v4 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 560
    int-to-float v1, v1
    const/high16 v6, 0x40000000
    div-float/2addr v1, v6
  .line 561
    int-to-float p1, p1
    div-float/2addr p1, v6
  .line 562
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual { v3, v6 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 563
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setColor(I)V
  .line 564
    invoke-virtual { v5, v1, v1, p1, v3 }, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
  .line 565
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 566
    const/high16 p2, 0x3FC00000
    invoke-virtual { v3, p2 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 567
    invoke-virtual { v3, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 568
    invoke-virtual { v5, v1, v1, p1, v3 }, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
  .line 569
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { p1, v2, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 570
    return-object v4
.end method

.method private removePicked()V
  .registers 5
  .line 1024
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1025
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v1
    if-nez v1, :L2
  .line 1026
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L0
  .line 1027
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L1
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L0
  :L1
  .line 1028
    invoke-static { v0 }, Ljava/util/Collections;->sort(Ljava/util/List;)V
    goto :L3
  :L2
  .line 1029
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lez v1, :L3
  .line 1030
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L4
  :L3
  .line 1029
    nop
  :L4
  .line 1032
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    add-int/lit8 v1, v1, -1
  :L5
    if-ltz v1, :L7
  .line 1033
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 1034
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->canRemoveRow(I)Z
    move-result v3
    if-eqz v3, :L6
    invoke-static { v2 }, Lcom/innioasis/ipp/Queue;->removeRow(I)V
  :L6
  .line 1032
    add-int/lit8 v1, v1, -1
    goto :L5
  :L7
  .line 1036
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1037
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 1038
    return-void
.end method

.method private repaintAll()V
  .registers 3
  .line 1145
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    if-nez v0, :L0
    return-void
  :L0
  .line 1146
    const/4 v0, 0
  :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
    array-length v1, v1
    if-ge v0, v1, :L2
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 1147
    return-void
.end method

.method private resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L6 } :L8
  .registers 5
  :L0
  .line 811
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v0
  .line 812
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L1
    return-object p1
  :L1
  .line 813
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 814
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 815
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    invoke-virtual { v1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 816
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L3
    check-cast v1, Lcom/innioasis/y1/database/Song;
    return-object v1
  :L3
  .line 817
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 818
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  .line 819
    if-nez v2, :L4
    new-instance v2, Ljava/io/File;
    invoke-direct { v2, v0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L4
  .line 820
    if-nez v2, :L5
    return-object p1
  :L5
  .line 821
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->resolvedByPath:Ljava/util/HashMap;
    invoke-virtual { v1, v0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L6
  .line 822
    return-object v2
  :L7
  .line 814
    return-object p1
  :L8
  .line 823
    move-exception v0
  .line 824
    return-object p1
.end method

.method static rowHeight(Landroid/widget/TextView;)I
  .registers 2
  .line 641
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTextSize()F
    move-result p0
    const/high16 v0, 0x3FC00000
    mul-float p0, p0, v0
    float-to-int p0, p0
    return p0
.end method

.method private scrollToSel()V
  .registers 3
  .line 834
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L1
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollPending:Z
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 835
    const/4 v1, 1
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollPending:Z
  .line 836
    new-instance v1, Lcom/innioasis/y1/activity/IppQueueActivity$ScrollTask;
    invoke-direct { v1, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$ScrollTask;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z
  .line 837
    return-void
  :L1
  .line 834
    return-void
.end method

.method private songAt(I)Lcom/innioasis/y1/database/Song;
  .registers 4
  .line 1099
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    const/4 v1, 0
    if-eqz v0, :L2
    if-ltz p1, :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L0
    goto :L2
  :L0
  .line 1100
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
  .line 1101
    instance-of v0, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v0, :L1
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->resolved(Lcom/innioasis/y1/database/Song;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L1
    return-object v1
  :L2
  .line 1099
    return-object v1
.end method

.method private startMulti()V
  .registers 5
  .line 1107
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 1108
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
  .line 1109
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->clear()V
  .line 1113
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lez v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L1
  .line 1114
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1115
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Blink;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
  .line 1116
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v1, :L2
    const-wide/16 v2, 500
    invoke-virtual { v1, v0, v2, v3 }, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z
  :L2
  .line 1117
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 1118
    return-void
.end method

.method private stopBlink()V
  .registers 3
  .line 1129
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1130
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    if-eqz v0, :L1
  .line 1131
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v1, :L0
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L0
  .line 1132
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
  :L1
  .line 1134
    return-void
.end method

.method private syncRows()I
  .catchall { :L0 .. :L2 } :L5
  .registers 8
  .line 114
    const/16 v0, 8
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
  .line 115
    iget v2, v1, Landroid/util/DisplayMetrics;->heightPixels:I
  .line 116
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131165782
    invoke-virtual { v3, v4 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v3
    float-to-int v3, v3
  .line 117
    const/4 v4, 0
    invoke-static { v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v4
    invoke-static { v4, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->px(FLandroid/util/DisplayMetrics;)I
    move-result v4
    mul-int/lit8 v4, v4, 2
    add-int/lit8 v4, v4, 4
  .line 118
    const/4 v5, 1
    invoke-static { v5 }, Lcom/innioasis/y1/activity/IppQueueActivity;->textSize(I)F
    move-result v6
    invoke-static { v6, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->px(FLandroid/util/DisplayMetrics;)I
    move-result v1
    add-int/lit8 v1, v1, 4
  .line 119
    if-gtz v1, :L1
    return v0
  :L1
  .line 120
    sub-int/2addr v2, v3
    sub-int/2addr v2, v4
    div-int/2addr v2, v1
  :L2
  .line 121
    add-int/2addr v2, v5
    add-int/lit8 v2, v2, 2
  .line 122
    if-ge v2, v0, :L3
    goto :L4
  :L3
    move v0, v2
  :L4
    return v0
  :L5
  .line 123
    move-exception v1
  .line 124
    return v0
.end method

.method private static textSize(I)F
  .registers 1
  .line 235
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
  .line 583
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->markBox(F)I
    move-result p1
  .line 584
    invoke-virtual { p2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p2
  .line 585
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
  .line 586
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { v1, v0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 587
    instance-of v2, v1, Landroid/graphics/Bitmap;
    if-eqz v2, :L0
    check-cast v1, Landroid/graphics/Bitmap;
    return-object v1
  :L0
  .line 589
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p1, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 590
    new-instance v8, Landroid/graphics/Canvas;
    invoke-direct { v8, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 591
    new-instance v9, Landroid/graphics/Paint;
    const/4 v2, 1
    invoke-direct { v9, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 592
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setColor(I)V
  .line 593
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 594
    int-to-float p1, p1
    const/high16 p2, 0x41800000
    div-float/2addr p1, p2
  .line 595
    const p2, 1075419546
    mul-float p2, p2, p1
  .line 596
    const/high16 v2, 0x3FC00000
    cmpg-float v3, p2, v2
    if-gez v3, :L1
    const/high16 p2, 0x3FC00000
  :L1
    invoke-virtual { v9, p2 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 597
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
  .line 598
    const/high16 v2, 0x41580000
    mul-float v5, p1, v2
    const/high16 v2, 0x40600000
    mul-float v6, p1, v2
    move-object v2, v8
    move v3, p2
    move v4, v10
    invoke-virtual/range { v2 .. v7 }, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
  .line 599
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->markCache:Ljava/util/HashMap;
    invoke-virtual { p1, v0, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 600
    return-object v1
.end method

.method private static titleLen(Ljava/lang/String;)I
  .registers 2
  .line 742
    if-nez p0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 743
    const-string v0, " \u2014 "
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v0
  .line 744
    if-gez v0, :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
  :L1
    return v0
.end method

.method private static unNamed(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 790
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 792
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 793
    move-exception v0
  .line 794
    return-object p0
.end method

.method public antiClockwise()V
  .registers 3
  .line 881
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 882
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-gt v0, v1, :L0
    return-void
  :L0
  .line 883
    add-int/lit8 v1, v0, -1
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 884
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->move(I)V
  .line 885
    return-void
.end method

.method blinkTick()V
  .registers 5
  .line 1137
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v0, :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    if-nez v0, :L0
    goto :L2
  :L0
  .line 1138
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
    xor-int/lit8 v0, v0, 1
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkOn:Z
  .line 1139
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 1140
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->blink:Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
    const-wide/16 v2, 500
    invoke-virtual { v0, v1, v2, v3 }, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 1141
    return-void
  :L2
  .line 1137
    return-void
.end method

.method buildTail()V
  .registers 3
  .line 402
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 403
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
  .line 404
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    if-eqz v1, :L1
    invoke-virtual { v1, v0 }, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z
  :L1
  .line 405
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L4
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-eqz v0, :L4
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L2
    goto :L4
  :L2
  .line 406
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailFrom:I
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->build(II)V
  .line 407
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v0, :L3
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V
  :L3
  .line 408
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollToSel()V
  .line 409
    return-void
  :L4
  .line 405
    return-void
.end method

.method public clockwise()V
  .registers 3
  .line 871
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 872
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L1
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
    if-lt v1, v0, :L0
    goto :L1
  :L0
  .line 873
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    add-int/lit8 v1, v0, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 874
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->move(I)V
  .line 875
    return-void
  :L1
  .line 872
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 897
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 898
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L5
  :L0
  .line 899
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz v0, :L3
  .line 900
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v0, :L1
    return-void
  :L1
  .line 901
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
  .line 902
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L2
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->marked:Ljava/util/HashSet;
    invoke-virtual { v1, v0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L2
  .line 903
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->paintFocus(I)V
  .line 904
    return-void
  :L3
  .line 906
    iget v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-nez v0, :L4
  .line 907
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 908
    return-void
  :L4
  .line 910
    invoke-static { v0 }, Lcom/innioasis/ipp/Queue;->playRow(I)V
  .line 911
    const/4 v0, 0
    iput v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 912
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 913
    return-void
  :L5
  .line 898
    return-void
.end method

.method public direction(Lcom/innioasis/y1/base/BaseActivity$Direction;)V
  .registers 3
  .line 1151
    sget-object v0, Lcom/innioasis/y1/base/BaseActivity$Direction;->TOP:Lcom/innioasis/y1/base/BaseActivity$Direction;
    if-ne p1, v0, :L1
  .line 1154
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    if-eqz p1, :L0
  .line 1155
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 1156
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repaintAll()V
  .line 1157
    return-void
  :L0
  .line 1159
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  :L1
  .line 1161
    return-void
.end method

.method doScroll()V
  .registers 7
  .line 840
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollPending:Z
  .line 841
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    if-eqz v1, :L9
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    if-nez v2, :L0
    goto :L9
  :L0
  .line 844
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
    if-eqz v3, :L8
    iget v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-ltz v4, :L8
    array-length v5, v3
    if-lt v4, v5, :L1
    goto :L8
  :L1
  .line 845
    aget v3, v3, v4
  .line 846
    if-gez v3, :L2
  .line 847
    invoke-virtual { v1, v0, v0 }, Landroid/widget/ScrollView;->smoothScrollTo(II)V
  .line 848
    return-void
  :L2
  .line 850
    invoke-virtual { v2 }, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v1
    if-lt v3, v1, :L3
    return-void
  :L3
  .line 851
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v1, v3 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 852
    if-nez v1, :L4
    return-void
  :L4
  .line 853
    invoke-virtual { v1 }, Landroid/view/View;->getTop()I
    move-result v2
  .line 854
    invoke-virtual { v1 }, Landroid/view/View;->getBottom()I
    move-result v1
  .line 857
    if-lez v3, :L5
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    add-int/lit8 v3, v3, -1
    invoke-virtual { v4, v3 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v4
    instance-of v4, v4, Landroid/widget/TextView;
    if-eqz v4, :L5
  .line 858
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v2, v3 }, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v2
  :L5
  .line 860
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v3 }, Landroid/widget/ScrollView;->getScrollY()I
    move-result v3
  .line 861
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v4 }, Landroid/widget/ScrollView;->getHeight()I
    move-result v4
  .line 862
    if-ge v2, v3, :L6
  .line 863
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v0, v2 }, Landroid/widget/ScrollView;->smoothScrollTo(II)V
    goto :L7
  :L6
  .line 864
    add-int/2addr v3, v4
    if-le v1, v3, :L7
  .line 865
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    sub-int/2addr v1, v4
    invoke-virtual { v2, v0, v1 }, Landroid/widget/ScrollView;->smoothScrollTo(II)V
  :L7
  .line 867
    return-void
  :L8
  .line 844
    return-void
  :L9
  .line 841
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
  .line 167
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getLayoutInflater()Landroid/view/LayoutInflater;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/y1/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/innioasis/y1/databinding/ActivityAboutBinding;
    move-result-object v0
    return-object v0
.end method

.method public initView()V
  .registers 9
  .line 172
    const v0, 2131821043
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 174
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    invoke-interface { v0 }, Landroidx/viewbinding/ViewBinding;->getRoot()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 175
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->removeAllViews()V
  .line 179
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct { v1, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
  .line 180
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 182
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
  .line 183
    invoke-virtual { v3, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 184
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    const/16 v4, 8
    const/4 v5, 0
    invoke-virtual { v3, v4, v5, v4, v5 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 185
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    const/4 v6, -1
    const/4 v7, -2
    invoke-virtual { v1, v3, v6, v7 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 187
    new-instance v3, Landroid/widget/LinearLayout;
    invoke-direct { v3, p0 }, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
  .line 188
    invoke-virtual { v3, v2 }, Landroid/widget/LinearLayout;->setOrientation(I)V
  .line 189
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v2, v4, v5, v4, v5 }, Landroid/widget/LinearLayout;->setPadding(IIII)V
  .line 191
    new-instance v2, Landroid/widget/ScrollView;
    invoke-direct { v2, p0 }, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
  .line 192
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v2, v3, v6, v7 }, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V
  .line 193
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v2, v6, v5 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 194
    const/high16 v3, 0x3F800000
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F
  .line 195
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    invoke-virtual { v1, v3, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 197
    invoke-virtual { v0, v1, v6, v6 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
  .line 199
    iput v5, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  .line 200
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 202
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
  .line 203
    new-instance v1, Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.MY_PLAY_SONG"
    invoke-direct { v1, v2 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
    invoke-virtual { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  .line 204
    return-void
.end method

.method public longConfirm()V
  .registers 6
  .line 934
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->buildTail()V
  .line 935
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    if-eqz v0, :L7
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L7
  :L0
  .line 936
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 937
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->multi:Z
    const v2, 2131821106
    if-eqz v1, :L1
  .line 938
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L1
  .line 939
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    const v3, 2131821105
    const v4, 2131821071
    if-nez v1, :L3
  .line 940
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :L2
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 941
    invoke-virtual { p0, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 942
    invoke-static { }, Lcom/innioasis/ipp/Queue;->hasSource()Z
    move-result v1
    if-eqz v1, :L6
    const v1, 2131821093
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L3
  .line 944
    invoke-static { v1 }, Lcom/innioasis/ipp/Queue;->canRemoveRow(I)Z
    move-result v1
    if-eqz v1, :L4
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 945
    const v1, 2131820844
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 946
    iget v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :L5
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 947
    invoke-virtual { p0, v4 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 951
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getActivity()Landroid/app/Activity;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;
    invoke-direct { v3, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QMenu;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    const v4, 2131886360
    invoke-direct { v1, v2, v0, v3, v4 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
  .line 952
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 953
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 954
    return-void
  :L7
  .line 935
    return-void
.end method

.method protected onDestroy()V
  .catch Ljava/lang/Exception; { :L0 .. :L1 } :L2
  .registers 2
  .line 208
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->stopBlink()V
  .line 209
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->cancelTail()V
  .line 210
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
    if-eqz v0, :L4
  :L0
  .line 212
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
  :L1
  .line 215
    goto :L3
  :L2
  .line 213
    move-exception v0
  :L3
  .line 216
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->watch:Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
  :L4
  .line 218
    invoke-super { p0 }, Lcom/innioasis/y1/base/BaseActivity;->onDestroy()V
  .line 219
    return-void
.end method

.method onTrackChanged()V
  .registers 1
  .line 229
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->endMulti()V
  .line 230
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 231
    return-void
.end method

.method public onWindowFocusChanged(Z)V
  .registers 3
  .line 417
    invoke-super { p0, p1 }, Lcom/innioasis/y1/base/BaseActivity;->onWindowFocusChanged(Z)V
  .line 418
    if-eqz p1, :L0
    iget-boolean p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
    if-eqz p1, :L0
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-eqz p1, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    if-eqz v0, :L0
    invoke-virtual { v0, p1 }, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z
  :L0
  .line 419
    return-void
.end method

.method pick(Lcom/innioasis/music/adapter/SubmenuAdapter$Item;)Z
  .registers 7
  .line 962
    const/4 v0, 1
    if-nez p1, :L0
    return v0
  :L0
  .line 963
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
  .line 964
    if-eqz v1, :L1
  .line 965
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->addToPlaylist(Ljava/util/UUID;)V
  .line 966
    return v0
  :L1
  .line 968
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  .line 969
    if-nez p1, :L2
    return v0
  :L2
  .line 970
    const v1, 2131821106
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
  .line 971
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->removePicked()V
  .line 972
    return v0
  :L3
  .line 974
    const v1, 2131820844
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L4
  .line 975
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->startMulti()V
  .line 976
    return v0
  :L4
  .line 978
    const v1, 2131821071
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L5
  .line 979
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openAlbum()V
  .line 980
    return v0
  :L5
  .line 982
    const v1, 2131821093
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L7
  .line 985
    invoke-static { p0 }, Lcom/innioasis/ipp/Queue;->openSource(Landroid/app/Activity;)Z
    move-result p1
    if-eqz p1, :L6
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  :L6
  .line 986
    return v0
  :L7
  .line 988
    const v1, 2131821105
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L10
  .line 989
    iget p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->artistsOf(I)Ljava/util/List;
    move-result-object p1
  .line 990
    if-nez p1, :L8
    return v0
  :L8
  .line 991
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 0
    if-ne v1, v0, :L9
  .line 992
    invoke-interface { p1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Ljava/lang/String;
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openArtist(Ljava/lang/String;)V
  .line 993
    return v0
  :L9
  .line 996
    new-instance v0, Lcom/innioasis/music/util/SubMenuDialog;
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getActivity()Landroid/app/Activity;
    move-result-object v1
    new-instance v3, Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;
    invoke-direct { v3, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$QArtists;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    const v4, 2131886360
    invoke-direct { v0, v1, p1, v3, v4 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 997
    return v2
  :L10
  .line 999
    return v0
.end method

.method pickArtist(Ljava/lang/String;)V
  .registers 3
  .line 1004
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
    if-eqz v0, :L0
  .line 1005
    invoke-virtual { v0 }, Lcom/innioasis/music/util/SubMenuDialog;->dismiss()V
  .line 1006
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
  :L0
  .line 1008
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->openArtist(Ljava/lang/String;)V
  .line 1009
    return-void
.end method

.method public quit()V
  .registers 1
  .line 1165
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->finish()V
  .line 1166
    return-void
.end method

.method render()V
  .registers 5
  .line 246
    invoke-static { }, Lcom/innioasis/ipp/Queue;->upNext()Ljava/util/List;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
  .line 247
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 248
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    invoke-virtual { v0 }, Landroid/widget/LinearLayout;->removeAllViews()V
  .line 249
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->cancelTail()V
  .line 251
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rows:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
  .line 252
    new-array v1, v0, [Landroid/view/View;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->rowViews:[Landroid/view/View;
  .line 253
    new-array v1, v0, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tagViews:[Landroid/widget/TextView;
  .line 254
    new-array v1, v0, [Landroid/widget/TextView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->titleViews:[Landroid/widget/TextView;
  .line 255
    new-array v1, v0, [Landroid/widget/ImageView;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->dotViews:[Landroid/widget/ImageView;
  .line 256
    new-array v1, v0, [Ljava/lang/String;
    iput-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->labels:[Ljava/lang/String;
  .line 257
    const/4 v1, 0
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->manualHeaderDone:Z
  .line 258
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->autoHeaderDone:Z
  .line 260
    if-nez v0, :L0
  .line 261
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 262
    const/high16 v2, 0x41800000
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setTextSize(F)V
  .line 263
    const/16 v2, 12
    const/4 v3, 6
    invoke-virtual { v0, v3, v2, v3, v3 }, Landroid/widget/TextView;->setPadding(IIII)V
  .line 264
    const v2, 2131821044
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 265
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v3, -1
    invoke-virtual { v2, v0, v3, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 266
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->container:Landroid/widget/LinearLayout;
    const/4 v2, -2
    invoke-virtual { v1, v0, v3, v2 }, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V
  .line 267
    return-void
  :L0
  .line 269
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-lt v2, v0, :L1
    add-int/lit8 v2, v0, -1
    iput v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  :L1
  .line 270
    iget v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    if-gez v2, :L2
    iput v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
  :L2
  .line 272
    new-array v2, v0, [I
    iput-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->childIndex:[I
  .line 276
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->syncRows()I
    move-result v2
    iget v3, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->sel:I
    add-int/lit8 v3, v3, 2
    invoke-static { v2, v3 }, Ljava/lang/Math;->max(II)I
    move-result v2
  .line 277
    if-le v2, v0, :L3
    move v2, v0
  :L3
  .line 278
    invoke-direct { p0, v1, v2 }, Lcom/innioasis/y1/activity/IppQueueActivity;->build(II)V
  .line 279
    const/4 v1, 1
    if-ge v2, v0, :L5
  .line 280
    iput v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailFrom:I
  .line 281
    iput-boolean v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
  .line 282
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    if-nez v0, :L4
    new-instance v0, Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    invoke-direct { v0, p0 }, Lcom/innioasis/y1/activity/IppQueueActivity$Tail;-><init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
  :L4
  .line 292
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->hasWindowFocus()Z
    move-result v0
    if-eqz v0, :L5
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->header:Landroid/widget/LinearLayout;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailRun:Lcom/innioasis/y1/activity/IppQueueActivity$Tail;
    invoke-virtual { v0, v2 }, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z
  :L5
  .line 300
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->scroller:Landroid/widget/ScrollView;
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppQueueActivity;->tailPending:Z
    xor-int/2addr v1, v2
    invoke-virtual { v0, v1 }, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V
  .line 301
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->scrollToSel()V
  .line 302
    return-void
.end method

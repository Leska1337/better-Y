.class public final Lcom/innioasis/ipp/Alpha;
.super Ljava/lang/Object;
.source "Alpha.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Alpha$Hide;,
    Lcom/innioasis/ipp/Alpha$PopHide;
  }
.end annotation

.field private final static BAR_DP:I = 45

.field private final static BURST_MS:J = 25L

.field private final static FAST_MS:J = 250L

.field private final static FLASH_MS:J = 700L

.field private final static HIDE:Lcom/innioasis/ipp/Alpha$Hide;

.field private final static IDLE_MS:J = 1000L

.field private final static LETTER:I = 1

.field private final static LETTER_SP:I = 56

.field private final static NONE:I = 0

.field private final static NO_YEAR:Ljava/lang/String; = "?"

.field private final static OTHER:Ljava/lang/String; = "(no key)"

.field private final static OTHER_TEXT:Ljava/lang/String; = "#"

.field private final static PAD_DP:I = 14

.field private final static PLATE_ALPHA:I = -654311424

.field private final static PLATE_RGB:I = 31487

.field private final static POP_HIDE:Ljava/lang/Runnable;

.field private final static RADIUS_DP:I = 12

.field private final static SHADOW_COLOR:I = 855638016

.field private final static SHADOW_DP:I = 10

.field private final static SHADOW_DY_DP:I = 2

.field public final static THRESHOLDS:[I

.field public final static THRESHOLD_DEFAULT:I = 5

.field private final static YEAR:I = 2

.field private final static YEAR_SP:I = 40

.field private static fast:I

.field private static jumping:Z

.field private static lastCall:J

.field private static lastClick:J

.field private static overlayRef:Ljava/lang/ref/WeakReference;

.field private static plateBm:Landroid/graphics/Bitmap;

.field private static plateKey:I

.field private static pop:Landroid/widget/PopupWindow;

.method static constructor <clinit>()V
  .registers 1
  .line 95
    const/16 v0, 12
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
  .line 154
    new-instance v0, Lcom/innioasis/ipp/Alpha$Hide;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Alpha$Hide;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Alpha;->HIDE:Lcom/innioasis/ipp/Alpha$Hide;
  .line 225
    new-instance v0, Lcom/innioasis/ipp/Alpha$PopHide;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Alpha$PopHide;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Alpha;->POP_HIDE:Ljava/lang/Runnable;
    return-void
  :L0
  .array-data 4
      5
      10
      15
      20
      25
      30
      35
      40
      45
      50
      55
      60
  .end array-data
.end method

.method private constructor <init>()V
  .registers 1
  .line 75
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()V
  .registers 0
  .line 73
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->hidePop()V
    return-void
.end method

.method static synthetic access$102(I)I
  .registers 1
  .line 73
    sput p0, Lcom/innioasis/ipp/Alpha;->fast:I
    return p0
.end method

.method static synthetic access$202(Z)Z
  .registers 1
  .line 73
    sput-boolean p0, Lcom/innioasis/ipp/Alpha;->jumping:Z
    return p0
.end method

.method static synthetic access$300()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 73
    sget-object v0, Lcom/innioasis/ipp/Alpha;->overlayRef:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$302(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 73
    sput-object p0, Lcom/innioasis/ipp/Alpha;->overlayRef:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method private static barOffset(Landroid/app/Activity;F)I
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 522
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    const v1, 2131362408
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 523
    if-eqz p0, :L4
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-eqz v1, :L1
    goto :L4
  :L1
  .line 524
    invoke-virtual { p0 }, Landroid/view/View;->getHeight()I
    move-result p0
  .line 525
    if-gtz p0, :L2
    const/high16 p0, 0x42340000
    mul-float p1, p1, p0
    const/high16 p0, 0x3F000000
    add-float/2addr p1, p0
    float-to-int p0, p1
  :L2
  .line 526
    div-int/lit8 p0, p0, 2
  :L3
    return p0
  :L4
  .line 523
    return v0
  :L5
  .line 527
    move-exception p0
  .line 528
    return v0
.end method

.method private static dress(Landroid/widget/TextView;F)I
  .registers 6
  .line 595
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Alpha;->side(Landroid/widget/TextView;F)I
    move-result v0
  .line 596
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Alpha;->plateBitmap(IF)Landroid/graphics/Bitmap;
    move-result-object v3
    invoke-direct { v1, v2, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { p0, v1 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 597
    invoke-static { p1 }, Lcom/innioasis/ipp/Alpha;->margin(F)I
    move-result p0
    mul-int/lit8 p0, p0, 2
    add-int/2addr v0, p0
    return v0
.end method

.method private static enabled()Z
  .registers 2
  .line 651
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 652
    const-string v1, "alpha_scroll"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method public static flash(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 11
  .line 173
    if-eqz p0, :L4
    if-eqz p1, :L4
    if-nez p2, :L0
    goto :L4
  :L0
  .line 174
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 176
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Alpha;->plateView(Landroid/app/Activity;F)Landroid/widget/TextView;
    move-result-object v1
  .line 177
    invoke-virtual { v1, p2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 178
    const/high16 p2, 0x42200000
    const/4 v2, 2
    invoke-virtual { v1, v2, p2 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 179
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Alpha;->dress(Landroid/widget/TextView;F)I
    move-result p2
  .line 185
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->hidePop()V
  .line 186
    new-instance v0, Landroid/widget/PopupWindow;
    invoke-direct { v0, v1, p2, p2 }, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V
  .line 187
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 188
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setTouchable(Z)V
  .line 189
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setFocusable(Z)V
  .line 190
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V
  .line 196
    new-array v3, v2, [I
  .line 197
    new-array v4, v2, [I
  .line 198
    invoke-virtual { p1, v3 }, Landroid/view/View;->getLocationOnScreen([I)V
  .line 199
    invoke-virtual { p1, v4 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 200
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
  .line 205
    iget v5, p0, Landroid/util/DisplayMetrics;->widthPixels:I
    sub-int/2addr v5, p2
    div-int/2addr v5, v2
    aget v6, v3, v1
    aget v7, v4, v1
    sub-int/2addr v6, v7
    sub-int/2addr v5, v6
  .line 206
    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I
    sub-int/2addr p0, p2
    div-int/2addr p0, v2
    const/4 p2, 1
    aget v2, v3, p2
    aget p2, v4, p2
    sub-int/2addr v2, p2
    sub-int/2addr p0, v2
  .line 207
    invoke-virtual { v0, p1, v1, v5, p0 }, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
  .line 208
    sput-object v0, Lcom/innioasis/ipp/Alpha;->pop:Landroid/widget/PopupWindow;
  .line 210
    sget-object p0, Lcom/innioasis/ipp/Alpha;->POP_HIDE:Ljava/lang/Runnable;
    invoke-virtual { p1, p0 }, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 211
    const-wide/16 v0, 700
    invoke-virtual { p1, p0, v0, v1 }, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 214
    goto :L3
  :L2
  .line 212
    move-exception p0
  :L3
  .line 215
    return-void
  :L4
  .line 173
    return-void
.end method

.method private static hidePop()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 235
    sget-object v0, Lcom/innioasis/ipp/Alpha;->pop:Landroid/widget/PopupWindow;
  .line 236
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Alpha;->pop:Landroid/widget/PopupWindow;
  .line 237
    if-eqz v0, :L1
    invoke-virtual { v0 }, Landroid/widget/PopupWindow;->dismiss()V
  :L1
  .line 240
    goto :L3
  :L2
  .line 238
    move-exception v0
  :L3
  .line 241
    return-void
.end method

.method private static ink()I
  .registers 1
  .line 579
    invoke-static { }, Lcom/innioasis/ipp/Icons;->menuColor()I
    move-result v0
  .line 580
    if-nez v0, :L0
    const/4 v0, -1
  :L0
    return v0
.end method

.method private static is(ILcom/innioasis/y1/database/Y1Repository$SongSortType;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Z
  .registers 3
  .line 354
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p1
    if-eq p0, p1, :L1
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->getType()I
    move-result p1
    if-ne p0, p1, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method private static jump(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .registers 9
  .line 360
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 361
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
  .line 362
    const/4 v2, 0
    if-gez v1, :L0
    const/4 v1, 0
  :L0
  .line 363
    invoke-static { p1, v1, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v3
  .line 364
    nop
  .line 366
    const/4 v4, 1
    if-ne p2, v4, :L5
  .line 367
    add-int/lit8 p2, v1, 1
  :L1
    if-ge p2, v0, :L3
  .line 368
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v3, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L2
    move v2, p2
    goto :L4
  :L2
  .line 367
    add-int/lit8 p2, p2, 1
    goto :L1
  :L3
    const/4 p2, -1
    const/4 v2, -1
  :L4
  .line 370
    if-gez v2, :L11
    add-int/lit8 v2, v0, -1
    goto :L11
  :L5
  .line 372
    add-int/lit8 p2, v1, -1
  :L6
  .line 373
    if-ltz p2, :L7
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v3, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L7
    add-int/lit8 p2, p2, -1
    goto :L6
  :L7
  .line 374
    if-gez p2, :L8
  .line 375
    goto :L11
  :L8
  .line 377
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v0
    move v2, p2
  :L9
  .line 378
    if-lez v2, :L10
    add-int/lit8 p2, v2, -1
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object p2
    invoke-virtual { v0, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L10
    add-int/lit8 v2, v2, -1
    goto :L9
  :L10
  .line 379
    nop
  :L11
  .line 382
    if-ne v2, v1, :L12
    return-void
  :L12
  .line 384
    invoke-virtual { p1, v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 389
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  .line 390
    return-void
.end method

.method private static keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
  .registers 7
  .line 394
    const/4 v0, 2
    const-string v1, "?"
    const-string v2, "(no key)"
    if-ltz p1, :L11
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v3
    if-lt p1, v3, :L0
    goto :L11
  :L0
  .line 398
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v3
    if-eqz v3, :L3
    if-ne p2, v0, :L1
    goto :L2
  :L1
    move-object v1, v2
  :L2
    return-object v1
  :L3
  .line 399
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p1
  .line 400
    if-ne p2, v0, :L7
  .line 401
    instance-of p0, p1, Lcom/innioasis/music/data/Album;
    if-nez p0, :L4
    return-object v1
  :L4
  .line 402
    check-cast p1, Lcom/innioasis/music/data/Album;
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 403
    if-eqz p0, :L6
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p1
    if-nez p1, :L5
    goto :L6
  :L5
    move-object v1, p0
  :L6
    return-object v1
  :L7
  .line 405
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Alpha;->label(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
  .line 406
    if-nez p0, :L8
    return-object v2
  :L8
  .line 407
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 412
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p1
    if-eqz p1, :L10
    const-string p1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L9
    goto :L10
  :L9
  .line 418
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Ljava/lang/String;->charAt(I)C
    move-result p0
    invoke-static { p0 }, Ljava/lang/Character;->toUpperCase(C)C
    move-result p0
    invoke-static { p0 }, Ljava/lang/String;->valueOf(C)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L10
  .line 412
    return-object v2
  :L11
  .line 394
    if-ne p2, v0, :L12
    goto :L13
  :L12
    move-object v1, v2
  :L13
    return-object v1
.end method

.method private static label(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/Object;)Ljava/lang/String;
  .registers 3
  .line 433
    instance-of v0, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v0, :L4
  .line 434
    check-cast p1, Lcom/innioasis/y1/database/Song;
  .line 435
    instance-of v0, p0, Lcom/innioasis/music/adapter/SongListAdapter;
    if-eqz v0, :L0
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/SongListAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/SongListAdapter;->getCanShowSongName()Z
    move-result v0
    if-eqz v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 436
    if-nez v0, :L2
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
    const-string v0, "meta_title"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
  :L2
  .line 437
    if-eqz v0, :L3
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L3
  .line 438
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L4
  .line 440
    instance-of p0, p1, Lcom/innioasis/music/data/Album;
    if-eqz p0, :L5
    check-cast p1, Lcom/innioasis/music/data/Album;
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->albumLabel(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L5
  .line 441
    instance-of p0, p1, Lcom/innioasis/music/data/Genre;
    if-eqz p0, :L6
    check-cast p1, Lcom/innioasis/music/data/Genre;
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L6
  .line 442
    instance-of p0, p1, Ljava/lang/String;
    if-eqz p0, :L7
    check-cast p1, Ljava/lang/String;
    return-object p1
  :L7
  .line 443
    const/4 p0, 0
    return-object p0
.end method

.method private static margin(F)I
  .registers 2
  .line 585
    const/high16 v0, 0x41400000
    mul-float p0, p0, v0
    const/high16 v0, 0x3F000000
    add-float/2addr p0, v0
    float-to-int p0, p0
    return p0
.end method

.method private static mode(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
  .registers 8
  .line 292
    invoke-virtual { p0 }, Landroid/widget/ListView;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 293
    instance-of v0, p0, Landroid/app/Activity;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 294
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v0
  .line 295
    sget-object v2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 297
    const-string v3, ".SongListActivity"
    invoke-virtual { v0, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
    instance-of v3, p1, Lcom/innioasis/music/adapter/SongListAdapter;
    if-eqz v3, :L1
  .line 298
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAllSong()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->songs(I)I
    move-result p0
    return p0
  :L1
  .line 304
    const-string v3, ".AlbumsActivity"
    invoke-virtual { v0, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L2
    instance-of v4, p1, Lcom/innioasis/music/adapter/SongListAdapter;
    if-eqz v4, :L2
  .line 305
    invoke-static { }, Lcom/innioasis/ipp/Albums;->songListSort()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->songs(I)I
    move-result p0
    return p0
  :L2
  .line 310
    const-string v4, ".PlayListActivity"
    invoke-virtual { v0, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L4
    instance-of v4, p1, Lcom/innioasis/music/adapter/SongListAdapter;
    if-eqz v4, :L4
  .line 311
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->byAddedOn()Z
    move-result p0
    if-eqz p0, :L3
    return v1
  :L3
  .line 312
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortPlayListSong()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->songs(I)I
    move-result p0
    return p0
  :L4
  .line 314
    const-string v4, ".ArtistsActivity"
    invoke-virtual { v0, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    const/4 v5, 1
    if-eqz v4, :L7
    instance-of v4, p1, Lcom/innioasis/music/adapter/MainAdapter;
    if-eqz v4, :L7
  .line 315
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortArtist()I
    move-result p0
  .line 316
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->getType()I
    move-result p1
    if-eq p0, p1, :L5
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
  .line 317
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->getType()I
    move-result p1
    if-ne p0, p1, :L6
  :L5
    const/4 v1, 1
  :L6
  .line 316
    return v1
  :L7
  .line 319
    invoke-virtual { v0, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    const/4 v3, 2
    if-eqz v2, :L11
    instance-of v2, p1, Lcom/innioasis/music/adapter/AlbumListAdapter;
    if-eqz v2, :L11
  .line 321
    check-cast p0, Landroid/app/Activity;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumSortFor(Landroid/app/Activity;)I
    move-result p0
  .line 322
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-eq p0, v2, :L10
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
  .line 323
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-ne p0, v2, :L8
    goto :L10
  :L8
  .line 324
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Asc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-eq p0, v2, :L9
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Desc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
  .line 325
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-ne p0, v2, :L11
  :L9
    return v3
  :L10
  .line 323
    return v5
  :L11
  .line 329
    const-string p0, ".GenresActivity"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L13
  .line 330
    invoke-static { p1 }, Lcom/innioasis/ipp/Genres;->alphaKind(Ljava/lang/Object;)I
    move-result p0
  .line 331
    if-ne p0, v5, :L12
    return v5
  :L12
  .line 332
    if-ne p0, v3, :L13
    return v3
  :L13
  .line 334
    return v1
.end method

.method private static overlay(Landroid/widget/ListView;)Landroid/widget/TextView;
  .registers 7
  .line 469
    invoke-virtual { p0 }, Landroid/widget/ListView;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 470
    instance-of v0, p0, Landroid/app/Activity;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 471
    move-object v0, p0
    check-cast v0, Landroid/app/Activity;
  .line 472
    invoke-virtual { v0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v2
    const v3, 16908290
    invoke-virtual { v2, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 473
    instance-of v3, v2, Landroid/widget/FrameLayout;
    if-nez v3, :L1
    return-object v1
  :L1
  .line 474
    check-cast v2, Landroid/widget/FrameLayout;
  .line 476
    sget-object v3, Lcom/innioasis/ipp/Alpha;->overlayRef:Ljava/lang/ref/WeakReference;
    if-nez v3, :L2
    goto :L3
  :L2
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L3
  .line 477
    instance-of v3, v1, Landroid/widget/TextView;
    if-eqz v3, :L4
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    if-ne v3, v2, :L4
    return-object v1
  :L4
  .line 479
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F
  .line 481
    new-instance v3, Landroid/widget/TextView;
    invoke-direct { v3, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 482
    const-string p0, ""
    invoke-virtual { v3, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 483
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->ink()I
    move-result p0
    invoke-virtual { v3, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 484
    const/16 p0, 17
    invoke-virtual { v3, p0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 485
    const/4 v4, 0
    invoke-virtual { v3, v4 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 489
    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v5, 1
    invoke-virtual { v3, v4, v5 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 491
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/Alpha;->dress(Landroid/widget/TextView;F)I
    move-result v4
  .line 492
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v5, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 493
    iput p0, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 494
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Alpha;->barOffset(Landroid/app/Activity;F)I
    move-result p0
    iput p0, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 495
    invoke-virtual { v2, v3, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 496
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, v3 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Alpha;->overlayRef:Ljava/lang/ref/WeakReference;
  .line 497
    return-object v3
.end method

.method private static plate()I
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  :L0
  .line 560
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 561
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  :L1
    const v1, 16777215
    and-int/2addr v0, v1
    const/high16 v1, 0xD9000000
    or-int/2addr v0, v1
    return v0
  :L2
  .line 564
    goto :L4
  :L3
  .line 562
    move-exception v0
  :L4
  .line 565
    const v0, -654279937
    return v0
.end method

.method private static plateBitmap(IF)Landroid/graphics/Bitmap;
  .registers 11
  .line 618
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->plate()I
    move-result v0
  .line 619
    mul-int/lit8 v1, p0, 31
    add-int/2addr v1, v0
  .line 620
    sget-object v2, Lcom/innioasis/ipp/Alpha;->plateBm:Landroid/graphics/Bitmap;
  .line 621
    if-eqz v2, :L0
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v3
    if-nez v3, :L0
    sget v3, Lcom/innioasis/ipp/Alpha;->plateKey:I
    if-ne v1, v3, :L0
    return-object v2
  :L0
  .line 623
    invoke-static { p1 }, Lcom/innioasis/ipp/Alpha;->margin(F)I
    move-result v2
  .line 624
    mul-int/lit8 v3, v2, 2
    add-int/2addr v3, p0
  .line 625
    const/high16 v4, 0x41400000
    mul-float v4, v4, p1
  .line 626
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v3, v3, v5 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 627
    new-instance v5, Landroid/graphics/Canvas;
    invoke-direct { v5, v3 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 629
    new-instance v6, Landroid/graphics/Path;
    invoke-direct { v6 }, Landroid/graphics/Path;-><init>()V
  .line 630
    new-instance v7, Landroid/graphics/RectF;
    int-to-float v8, v2
    add-int/2addr v2, p0
    int-to-float p0, v2
    invoke-direct { v7, v8, v8, p0, p0 }, Landroid/graphics/RectF;-><init>(FFFF)V
    sget-object p0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;
    invoke-virtual { v6, v7, v4, v4, p0 }, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V
  .line 632
    new-instance p0, Landroid/graphics/Paint;
    const/4 v2, 1
    invoke-direct { p0, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 633
    const/high16 v4, 0x33000000
    invoke-virtual { p0, v4 }, Landroid/graphics/Paint;->setColor(I)V
  .line 634
    const/high16 v7, 0x41200000
    mul-float v7, v7, p1
    const/high16 v8, 0x40000000
    mul-float p1, p1, v8
    const/4 v8, 0
    invoke-virtual { p0, v7, v8, p1, v4 }, Landroid/graphics/Paint;->setShadowLayer(FFFI)V
  .line 635
    invoke-virtual { v5, v6, p0 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 637
    new-instance p0, Landroid/graphics/Paint;
    invoke-direct { p0, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 638
    new-instance p1, Landroid/graphics/PorterDuffXfermode;
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { p1, v4 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { p0, p1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 639
    invoke-virtual { v5, v6, p0 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 641
    new-instance p0, Landroid/graphics/Paint;
    invoke-direct { p0, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 642
    invoke-virtual { p0, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 643
    invoke-virtual { v5, v6, p0 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 645
    sput-object v3, Lcom/innioasis/ipp/Alpha;->plateBm:Landroid/graphics/Bitmap;
  .line 646
    sput v1, Lcom/innioasis/ipp/Alpha;->plateKey:I
  .line 647
    return-object v3
.end method

.method private static plateView(Landroid/app/Activity;F)Landroid/widget/TextView;
  .registers 3
  .line 245
    new-instance p1, Landroid/widget/TextView;
    invoke-direct { p1, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 246
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->ink()I
    move-result p0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 247
    const/16 p0, 17
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 248
    const/4 p0, 0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 251
    sget-object p0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v0, 1
    invoke-virtual { p1, p0, v0 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 252
    return-object p1
.end method

.method private static show(Landroid/widget/ListView;Ljava/lang/String;)V
  .registers 4
  .line 454
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->overlay(Landroid/widget/ListView;)Landroid/widget/TextView;
    move-result-object v0
  .line 455
    if-nez v0, :L0
    return-void
  :L0
  .line 458
    const-string v1, "(no key)"
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    const-string p1, "#"
  :L1
  .line 459
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 462
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result p1
    const/4 v1, 2
    if-le p1, v1, :L2
    const/high16 p1, 0x42200000
    goto :L3
  :L2
    const/high16 p1, 0x42600000
  :L3
    invoke-virtual { v0, v1, p1 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 463
    const/4 p1, 0
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 464
    sget-object p1, Lcom/innioasis/ipp/Alpha;->HIDE:Lcom/innioasis/ipp/Alpha$Hide;
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 465
    const-wide/16 v0, 1000
    invoke-virtual { p0, p1, v0, v1 }, Landroid/widget/ListView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 466
    return-void
.end method

.method private static side(Landroid/widget/TextView;F)I
  .registers 5
  .line 507
    const/high16 v0, 0x41600000
    mul-float v0, v0, p1
    const/high16 v1, 0x3F000000
    add-float/2addr v0, v1
    float-to-int v0, v0
  .line 508
    new-instance v2, Landroid/text/TextPaint;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p0
    invoke-direct { v2, p0 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 509
    const/high16 p0, 0x42200000
    mul-float p1, p1, p0
    invoke-virtual { v2, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 510
    const-string p0, "0000"
    invoke-virtual { v2, p0 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result p0
    add-float/2addr p0, v1
    float-to-int p0, p0
    mul-int/lit8 v0, v0, 2
    add-int/2addr p0, v0
    return p0
.end method

.method private static songs(I)I
  .registers 3
  .line 349
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Alpha;->is(ILcom/innioasis/y1/database/Y1Repository$SongSortType;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Z
    move-result p0
    if-eqz p0, :L0
  .line 350
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
  .line 349
    return p0
.end method

.method public static step(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
  .catchall { :L0 .. :L11 } :L12
  .registers 13
  .line 261
    const/4 v0, 0
  :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 262
    sget-wide v3, Lcom/innioasis/ipp/Alpha;->lastCall:J
    sub-long v3, v1, v3
    const-wide/16 v5, 25
    const/4 v7, 1
    cmp-long v8, v3, v5
    if-gez v8, :L1
    const/4 v3, 1
    goto :L2
  :L1
    const/4 v3, 0
  :L2
  .line 263
    sput-wide v1, Lcom/innioasis/ipp/Alpha;->lastCall:J
  .line 265
    if-eqz p0, :L10
    if-eqz p1, :L10
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->enabled()Z
    move-result v4
    if-nez v4, :L3
    goto :L10
  :L3
  .line 266
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Alpha;->mode(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
    move-result v4
  .line 267
    if-nez v4, :L4
    sput v0, Lcom/innioasis/ipp/Alpha;->fast:I
    return v0
  :L4
  .line 269
    if-eqz v3, :L5
    return v7
  :L5
  .line 271
    sget-boolean v3, Lcom/innioasis/ipp/Alpha;->jumping:Z
    if-nez v3, :L9
  .line 272
    sget-wide v5, Lcom/innioasis/ipp/Alpha;->lastClick:J
    sub-long v5, v1, v5
    const-wide/16 v8, 250
    cmp-long v3, v5, v8
    if-gez v3, :L6
    sget v3, Lcom/innioasis/ipp/Alpha;->fast:I
    add-int/2addr v3, v7
    goto :L7
  :L6
    const/4 v3, 1
  :L7
    sput v3, Lcom/innioasis/ipp/Alpha;->fast:I
  .line 273
    sput-wide v1, Lcom/innioasis/ipp/Alpha;->lastClick:J
  .line 274
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->threshold()I
    move-result v5
    if-ge v3, v5, :L8
    return v0
  :L8
  .line 275
    sput-boolean v7, Lcom/innioasis/ipp/Alpha;->jumping:Z
  :L9
  .line 277
    sput-wide v1, Lcom/innioasis/ipp/Alpha;->lastClick:J
  .line 279
    invoke-static { p0, p1, p2, v4 }, Lcom/innioasis/ipp/Alpha;->jump(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .line 280
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p2
    invoke-static { p1, p2, v4 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Alpha;->show(Landroid/widget/ListView;Ljava/lang/String;)V
  .line 281
    return v7
  :L10
  .line 265
    sput v0, Lcom/innioasis/ipp/Alpha;->fast:I
  :L11
    return v0
  :L12
  .line 282
    move-exception p0
  .line 283
    sput v0, Lcom/innioasis/ipp/Alpha;->fast:I
  .line 284
    sput-boolean v0, Lcom/innioasis/ipp/Alpha;->jumping:Z
  .line 285
    return v0
.end method

.method private static threshold()I
  .registers 3
  .line 656
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 657
    const/4 v1, 5
    if-nez v0, :L0
    const/4 v0, 5
    goto :L1
  :L0
  .line 658
    const-string v2, "alpha_threshold"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  :L1
  .line 659
    if-ltz v0, :L3
    sget-object v2, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    array-length v2, v2
    if-lt v0, v2, :L2
    goto :L3
  :L2
    move v1, v0
  :L3
  .line 660
    sget-object v0, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    aget v0, v0, v1
    return v0
.end method

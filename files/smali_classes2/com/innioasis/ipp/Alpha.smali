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

.field private final static PLATE_ALPHA:I = -872415232

.field private final static PLATE_RGB:I = 31487

.field private final static POP_HIDE:Ljava/lang/Runnable;

.field private final static RADIUS_DP:I = 12

.field public final static THRESHOLDS:[I

.field public final static THRESHOLD_DEFAULT:I = 5

.field private final static YEAR:I = 2

.field private final static YEAR_SP:I = 40

.field private static fast:I

.field private static jumping:Z

.field private static lastCall:J

.field private static lastClick:J

.field private static overlayRef:Ljava/lang/ref/WeakReference;

.field private static pop:Landroid/widget/PopupWindow;

.method static constructor <clinit>()V
  .registers 1
  .line 90
    const/16 v0, 12
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
  .line 143
    new-instance v0, Lcom/innioasis/ipp/Alpha$Hide;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Alpha$Hide;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Alpha;->HIDE:Lcom/innioasis/ipp/Alpha$Hide;
  .line 214
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
  .line 70
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()V
  .registers 0
  .line 68
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->hidePop()V
    return-void
.end method

.method static synthetic access$102(I)I
  .registers 1
  .line 68
    sput p0, Lcom/innioasis/ipp/Alpha;->fast:I
    return p0
.end method

.method static synthetic access$202(Z)Z
  .registers 1
  .line 68
    sput-boolean p0, Lcom/innioasis/ipp/Alpha;->jumping:Z
    return p0
.end method

.method static synthetic access$300()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 68
    sget-object v0, Lcom/innioasis/ipp/Alpha;->overlayRef:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$302(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 68
    sput-object p0, Lcom/innioasis/ipp/Alpha;->overlayRef:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method private static barOffset(Landroid/app/Activity;F)I
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 518
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    const v1, 2131362408
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 519
    if-eqz p0, :L4
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-eqz v1, :L1
    goto :L4
  :L1
  .line 520
    invoke-virtual { p0 }, Landroid/view/View;->getHeight()I
    move-result p0
  .line 521
    if-gtz p0, :L2
    const/high16 p0, 0x42340000
    mul-float p1, p1, p0
    const/high16 p0, 0x3F000000
    add-float/2addr p1, p0
    float-to-int p0, p1
  :L2
  .line 522
    div-int/lit8 p0, p0, 2
  :L3
    return p0
  :L4
  .line 519
    return v0
  :L5
  .line 523
    move-exception p0
  .line 524
    return v0
.end method

.method private static enabled()Z
  .registers 2
  .line 565
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 566
    const-string v1, "alpha_scroll"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method public static flash(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 11
  .line 162
    if-eqz p0, :L4
    if-eqz p1, :L4
    if-nez p2, :L0
    goto :L4
  :L0
  .line 163
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 165
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Alpha;->plateView(Landroid/app/Activity;F)Landroid/widget/TextView;
    move-result-object v1
  .line 166
    invoke-virtual { v1, p2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 167
    const/high16 p2, 0x42200000
    const/4 v2, 2
    invoke-virtual { v1, v2, p2 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 168
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Alpha;->side(Landroid/widget/TextView;F)I
    move-result p2
  .line 174
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->hidePop()V
  .line 175
    new-instance v0, Landroid/widget/PopupWindow;
    invoke-direct { v0, v1, p2, p2 }, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V
  .line 176
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 177
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setTouchable(Z)V
  .line 178
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setFocusable(Z)V
  .line 179
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V
  .line 185
    new-array v3, v2, [I
  .line 186
    new-array v4, v2, [I
  .line 187
    invoke-virtual { p1, v3 }, Landroid/view/View;->getLocationOnScreen([I)V
  .line 188
    invoke-virtual { p1, v4 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 189
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
  .line 194
    iget v5, p0, Landroid/util/DisplayMetrics;->widthPixels:I
    sub-int/2addr v5, p2
    div-int/2addr v5, v2
    aget v6, v3, v1
    aget v7, v4, v1
    sub-int/2addr v6, v7
    sub-int/2addr v5, v6
  .line 195
    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I
    sub-int/2addr p0, p2
    div-int/2addr p0, v2
    const/4 p2, 1
    aget v2, v3, p2
    aget p2, v4, p2
    sub-int/2addr v2, p2
    sub-int/2addr p0, v2
  .line 196
    invoke-virtual { v0, p1, v1, v5, p0 }, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
  .line 197
    sput-object v0, Lcom/innioasis/ipp/Alpha;->pop:Landroid/widget/PopupWindow;
  .line 199
    sget-object p0, Lcom/innioasis/ipp/Alpha;->POP_HIDE:Ljava/lang/Runnable;
    invoke-virtual { p1, p0 }, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 200
    const-wide/16 v0, 700
    invoke-virtual { p1, p0, v0, v1 }, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 203
    goto :L3
  :L2
  .line 201
    move-exception p0
  :L3
  .line 204
    return-void
  :L4
  .line 162
    return-void
.end method

.method private static hidePop()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 224
    sget-object v0, Lcom/innioasis/ipp/Alpha;->pop:Landroid/widget/PopupWindow;
  .line 225
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Alpha;->pop:Landroid/widget/PopupWindow;
  .line 226
    if-eqz v0, :L1
    invoke-virtual { v0 }, Landroid/widget/PopupWindow;->dismiss()V
  :L1
  .line 229
    goto :L3
  :L2
  .line 227
    move-exception v0
  :L3
  .line 230
    return-void
.end method

.method private static is(ILcom/innioasis/y1/database/Y1Repository$SongSortType;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Z
  .registers 3
  .line 346
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
  .line 352
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 353
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
  .line 354
    const/4 v2, 0
    if-gez v1, :L0
    const/4 v1, 0
  :L0
  .line 355
    invoke-static { p1, v1, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v3
  .line 356
    nop
  .line 358
    const/4 v4, 1
    if-ne p2, v4, :L5
  .line 359
    add-int/lit8 p2, v1, 1
  :L1
    if-ge p2, v0, :L3
  .line 360
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v3, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L2
    move v2, p2
    goto :L4
  :L2
  .line 359
    add-int/lit8 p2, p2, 1
    goto :L1
  :L3
    const/4 p2, -1
    const/4 v2, -1
  :L4
  .line 362
    if-gez v2, :L11
    add-int/lit8 v2, v0, -1
    goto :L11
  :L5
  .line 364
    add-int/lit8 p2, v1, -1
  :L6
  .line 365
    if-ltz p2, :L7
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v3, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L7
    add-int/lit8 p2, p2, -1
    goto :L6
  :L7
  .line 366
    if-gez p2, :L8
  .line 367
    goto :L11
  :L8
  .line 369
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v0
    move v2, p2
  :L9
  .line 370
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
  .line 371
    nop
  :L11
  .line 374
    if-ne v2, v1, :L12
    return-void
  :L12
  .line 376
    invoke-virtual { p1, v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 381
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  .line 382
    return-void
.end method

.method private static keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
  .registers 7
  .line 386
    const/4 v0, 2
    const-string v1, "?"
    const-string v2, "(no key)"
    if-ltz p1, :L11
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v3
    if-lt p1, v3, :L0
    goto :L11
  :L0
  .line 390
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
  .line 391
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p1
  .line 392
    if-ne p2, v0, :L7
  .line 393
    instance-of p0, p1, Lcom/innioasis/music/data/Album;
    if-nez p0, :L4
    return-object v1
  :L4
  .line 394
    check-cast p1, Lcom/innioasis/music/data/Album;
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 395
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
  .line 397
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Alpha;->label(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
  .line 398
    if-nez p0, :L8
    return-object v2
  :L8
  .line 399
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 404
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p1
    if-eqz p1, :L10
    const-string p1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L9
    goto :L10
  :L9
  .line 410
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Ljava/lang/String;->charAt(I)C
    move-result p0
    invoke-static { p0 }, Ljava/lang/Character;->toUpperCase(C)C
    move-result p0
    invoke-static { p0 }, Ljava/lang/String;->valueOf(C)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L10
  .line 404
    return-object v2
  :L11
  .line 386
    if-ne p2, v0, :L12
    goto :L13
  :L12
    move-object v1, v2
  :L13
    return-object v1
.end method

.method private static label(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/Object;)Ljava/lang/String;
  .registers 3
  .line 425
    instance-of v0, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v0, :L4
  .line 426
    check-cast p1, Lcom/innioasis/y1/database/Song;
  .line 427
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
  .line 428
    if-nez v0, :L2
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
    const-string v0, "meta_title"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
  :L2
  .line 429
    if-eqz v0, :L3
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L3
  .line 430
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L4
  .line 432
    instance-of p0, p1, Lcom/innioasis/music/data/Album;
    if-eqz p0, :L5
    check-cast p1, Lcom/innioasis/music/data/Album;
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->albumLabel(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L5
  .line 433
    instance-of p0, p1, Lcom/innioasis/music/data/Genre;
    if-eqz p0, :L6
    check-cast p1, Lcom/innioasis/music/data/Genre;
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L6
  .line 434
    instance-of p0, p1, Ljava/lang/String;
    if-eqz p0, :L7
    check-cast p1, Ljava/lang/String;
    return-object p1
  :L7
  .line 435
    const/4 p0, 0
    return-object p0
.end method

.method private static mode(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
  .registers 8
  .line 284
    invoke-virtual { p0 }, Landroid/widget/ListView;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 285
    instance-of v0, p0, Landroid/app/Activity;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 286
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v0
  .line 287
    sget-object v2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 289
    const-string v3, ".SongListActivity"
    invoke-virtual { v0, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
    instance-of v3, p1, Lcom/innioasis/music/adapter/SongListAdapter;
    if-eqz v3, :L1
  .line 290
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAllSong()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->songs(I)I
    move-result p0
    return p0
  :L1
  .line 296
    const-string v3, ".AlbumsActivity"
    invoke-virtual { v0, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L2
    instance-of v4, p1, Lcom/innioasis/music/adapter/SongListAdapter;
    if-eqz v4, :L2
  .line 297
    invoke-static { }, Lcom/innioasis/ipp/Albums;->songListSort()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->songs(I)I
    move-result p0
    return p0
  :L2
  .line 302
    const-string v4, ".PlayListActivity"
    invoke-virtual { v0, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L4
    instance-of v4, p1, Lcom/innioasis/music/adapter/SongListAdapter;
    if-eqz v4, :L4
  .line 303
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->byAddedOn()Z
    move-result p0
    if-eqz p0, :L3
    return v1
  :L3
  .line 304
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortPlayListSong()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->songs(I)I
    move-result p0
    return p0
  :L4
  .line 306
    const-string v4, ".ArtistsActivity"
    invoke-virtual { v0, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    const/4 v5, 1
    if-eqz v4, :L7
    instance-of v4, p1, Lcom/innioasis/music/adapter/MainAdapter;
    if-eqz v4, :L7
  .line 307
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortArtist()I
    move-result p0
  .line 308
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->getType()I
    move-result p1
    if-eq p0, p1, :L5
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
  .line 309
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->getType()I
    move-result p1
    if-ne p0, p1, :L6
  :L5
    const/4 v1, 1
  :L6
  .line 308
    return v1
  :L7
  .line 311
    invoke-virtual { v0, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    const/4 v3, 2
    if-eqz v2, :L11
    instance-of v2, p1, Lcom/innioasis/music/adapter/AlbumListAdapter;
    if-eqz v2, :L11
  .line 313
    check-cast p0, Landroid/app/Activity;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumSortFor(Landroid/app/Activity;)I
    move-result p0
  .line 314
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-eq p0, v2, :L10
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
  .line 315
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-ne p0, v2, :L8
    goto :L10
  :L8
  .line 316
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Asc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-eq p0, v2, :L9
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Desc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
  .line 317
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-ne p0, v2, :L11
  :L9
    return v3
  :L10
  .line 315
    return v5
  :L11
  .line 321
    const-string p0, ".GenresActivity"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L13
  .line 322
    invoke-static { p1 }, Lcom/innioasis/ipp/Genres;->alphaKind(Ljava/lang/Object;)I
    move-result p0
  .line 323
    if-ne p0, v5, :L12
    return v5
  :L12
  .line 324
    if-ne p0, v3, :L13
    return v3
  :L13
  .line 326
    return v1
.end method

.method private static overlay(Landroid/widget/ListView;)Landroid/widget/TextView;
  .registers 7
  .line 461
    invoke-virtual { p0 }, Landroid/widget/ListView;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 462
    instance-of v0, p0, Landroid/app/Activity;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 463
    move-object v0, p0
    check-cast v0, Landroid/app/Activity;
  .line 464
    invoke-virtual { v0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v2
    const v3, 16908290
    invoke-virtual { v2, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 465
    instance-of v3, v2, Landroid/widget/FrameLayout;
    if-nez v3, :L1
    return-object v1
  :L1
  .line 466
    check-cast v2, Landroid/widget/FrameLayout;
  .line 468
    sget-object v3, Lcom/innioasis/ipp/Alpha;->overlayRef:Ljava/lang/ref/WeakReference;
    if-nez v3, :L2
    goto :L3
  :L2
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L3
  .line 469
    instance-of v3, v1, Landroid/widget/TextView;
    if-eqz v3, :L4
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    if-ne v3, v2, :L4
    return-object v1
  :L4
  .line 471
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F
  .line 473
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v3 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 474
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->plate()I
    move-result v4
    invoke-virtual { v3, v4 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 475
    const/high16 v4, 0x41400000
    mul-float v4, v4, v1
    invoke-virtual { v3, v4 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 477
    new-instance v4, Landroid/widget/TextView;
    invoke-direct { v4, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 478
    const-string p0, ""
    invoke-virtual { v4, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 479
    const/4 p0, -1
    invoke-virtual { v4, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 480
    const/16 p0, 17
    invoke-virtual { v4, p0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 481
    const/4 v5, 0
    invoke-virtual { v4, v5 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 482
    invoke-virtual { v4, v3 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 485
    sget-object v3, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v5, 1
    invoke-virtual { v4, v3, v5 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 487
    invoke-static { v4, v1 }, Lcom/innioasis/ipp/Alpha;->side(Landroid/widget/TextView;F)I
    move-result v3
  .line 488
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v5, v3, v3 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 489
    iput p0, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 490
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Alpha;->barOffset(Landroid/app/Activity;F)I
    move-result p0
    iput p0, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 491
    invoke-virtual { v2, v4, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 492
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, v4 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Alpha;->overlayRef:Ljava/lang/ref/WeakReference;
  .line 493
    return-object v4
.end method

.method private static plate()I
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  :L0
  .line 556
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 557
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  :L1
    const v1, 16777215
    and-int/2addr v0, v1
    const/high16 v1, 0xCC000000
    or-int/2addr v0, v1
    return v0
  :L2
  .line 560
    goto :L4
  :L3
  .line 558
    move-exception v0
  :L4
  .line 561
    const v0, -872383745
    return v0
.end method

.method private static plateView(Landroid/app/Activity;F)Landroid/widget/TextView;
  .registers 4
  .line 234
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v0 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 235
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->plate()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 236
    const/high16 v1, 0x41400000
    mul-float p1, p1, v1
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 238
    new-instance p1, Landroid/widget/TextView;
    invoke-direct { p1, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 239
    const/4 p0, -1
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 240
    const/16 p0, 17
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 241
    const/4 p0, 0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 242
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 243
    sget-object p0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v0, 1
    invoke-virtual { p1, p0, v0 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 244
    return-object p1
.end method

.method private static show(Landroid/widget/ListView;Ljava/lang/String;)V
  .registers 4
  .line 446
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->overlay(Landroid/widget/ListView;)Landroid/widget/TextView;
    move-result-object v0
  .line 447
    if-nez v0, :L0
    return-void
  :L0
  .line 450
    const-string v1, "(no key)"
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    const-string p1, "#"
  :L1
  .line 451
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 454
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
  .line 455
    const/4 p1, 0
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 456
    sget-object p1, Lcom/innioasis/ipp/Alpha;->HIDE:Lcom/innioasis/ipp/Alpha$Hide;
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 457
    const-wide/16 v0, 1000
    invoke-virtual { p0, p1, v0, v1 }, Landroid/widget/ListView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 458
    return-void
.end method

.method private static side(Landroid/widget/TextView;F)I
  .registers 5
  .line 503
    const/high16 v0, 0x41600000
    mul-float v0, v0, p1
    const/high16 v1, 0x3F000000
    add-float/2addr v0, v1
    float-to-int v0, v0
  .line 504
    new-instance v2, Landroid/text/TextPaint;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object p0
    invoke-direct { v2, p0 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 505
    const/high16 p0, 0x42200000
    mul-float p1, p1, p0
    invoke-virtual { v2, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 506
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
  .line 341
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Alpha;->is(ILcom/innioasis/y1/database/Y1Repository$SongSortType;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Z
    move-result p0
    if-eqz p0, :L0
  .line 342
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
  .line 341
    return p0
.end method

.method public static step(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
  .catchall { :L0 .. :L11 } :L12
  .registers 13
  .line 253
    const/4 v0, 0
  :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 254
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
  .line 255
    sput-wide v1, Lcom/innioasis/ipp/Alpha;->lastCall:J
  .line 257
    if-eqz p0, :L10
    if-eqz p1, :L10
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->enabled()Z
    move-result v4
    if-nez v4, :L3
    goto :L10
  :L3
  .line 258
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Alpha;->mode(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
    move-result v4
  .line 259
    if-nez v4, :L4
    sput v0, Lcom/innioasis/ipp/Alpha;->fast:I
    return v0
  :L4
  .line 261
    if-eqz v3, :L5
    return v7
  :L5
  .line 263
    sget-boolean v3, Lcom/innioasis/ipp/Alpha;->jumping:Z
    if-nez v3, :L9
  .line 264
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
  .line 265
    sput-wide v1, Lcom/innioasis/ipp/Alpha;->lastClick:J
  .line 266
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->threshold()I
    move-result v5
    if-ge v3, v5, :L8
    return v0
  :L8
  .line 267
    sput-boolean v7, Lcom/innioasis/ipp/Alpha;->jumping:Z
  :L9
  .line 269
    sput-wide v1, Lcom/innioasis/ipp/Alpha;->lastClick:J
  .line 271
    invoke-static { p0, p1, p2, v4 }, Lcom/innioasis/ipp/Alpha;->jump(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .line 272
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p2
    invoke-static { p1, p2, v4 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Alpha;->show(Landroid/widget/ListView;Ljava/lang/String;)V
  .line 273
    return v7
  :L10
  .line 257
    sput v0, Lcom/innioasis/ipp/Alpha;->fast:I
  :L11
    return v0
  :L12
  .line 274
    move-exception p0
  .line 275
    sput v0, Lcom/innioasis/ipp/Alpha;->fast:I
  .line 276
    sput-boolean v0, Lcom/innioasis/ipp/Alpha;->jumping:Z
  .line 277
    return v0
.end method

.method private static threshold()I
  .registers 3
  .line 570
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 571
    const/4 v1, 5
    if-nez v0, :L0
    const/4 v0, 5
    goto :L1
  :L0
  .line 572
    const-string v2, "alpha_threshold"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  :L1
  .line 573
    if-ltz v0, :L3
    sget-object v2, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    array-length v2, v2
    if-lt v0, v2, :L2
    goto :L3
  :L2
    move v1, v0
  :L3
  .line 574
    sget-object v0, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    aget v0, v0, v1
    return v0
.end method

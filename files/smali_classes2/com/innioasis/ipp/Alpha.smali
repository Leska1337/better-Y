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
  .line 158
    new-instance v0, Lcom/innioasis/ipp/Alpha$Hide;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Alpha$Hide;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Alpha;->HIDE:Lcom/innioasis/ipp/Alpha$Hide;
  .line 229
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
  .line 560
    const/4 v0, 0
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
    const v1, 2131362408
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 561
    if-eqz p0, :L4
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-eqz v1, :L1
    goto :L4
  :L1
  .line 562
    invoke-virtual { p0 }, Landroid/view/View;->getHeight()I
    move-result p0
  .line 563
    if-gtz p0, :L2
    const/high16 p0, 0x42340000
    mul-float p1, p1, p0
    const/high16 p0, 0x3F000000
    add-float/2addr p1, p0
    float-to-int p0, p1
  :L2
  .line 564
    div-int/lit8 p0, p0, 2
  :L3
    return p0
  :L4
  .line 561
    return v0
  :L5
  .line 565
    move-exception p0
  .line 566
    return v0
.end method

.method private static dress(Landroid/widget/TextView;F)I
  .registers 6
  .line 633
    invoke-static { p1 }, Lcom/innioasis/ipp/Alpha;->side(F)I
    move-result v0
  .line 634
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Alpha;->plateBitmap(IF)Landroid/graphics/Bitmap;
    move-result-object v3
    invoke-direct { v1, v2, v3 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { p0, v1 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 635
    invoke-static { p1 }, Lcom/innioasis/ipp/Alpha;->margin(F)I
    move-result p0
    mul-int/lit8 p0, p0, 2
    add-int/2addr v0, p0
    return v0
.end method

.method private static enabled()Z
  .registers 2
  .line 689
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 690
    const-string v1, "alpha_scroll"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static fit(Landroid/widget/TextView;Ljava/lang/String;IF)V
  .registers 8
  .line 539
    invoke-static { p3 }, Lcom/innioasis/ipp/Alpha;->side(F)I
    move-result v0
    const/high16 v1, 0x41600000
    mul-float v1, v1, p3
    const/high16 v2, 0x3F000000
    add-float/2addr v1, v2
    float-to-int v1, v1
    const/4 v2, 2
    mul-int/lit8 v1, v1, 2
    sub-int/2addr v0, v1
  .line 540
    new-instance v1, Landroid/text/TextPaint;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v3
    invoke-direct { v1, v3 }, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V
  .line 541
    int-to-float p2, p2
    mul-float p3, p3, p2
    invoke-virtual { v1, p3 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 542
    nop
  .line 543
    invoke-virtual { v1, p1 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result p1
  .line 544
    int-to-float p3, v0
    const/high16 v0, 0x3F800000
    cmpl-float v3, p1, p3
    if-lez v3, :L0
    div-float p1, p3, p1
    goto :L1
  :L0
    const/high16 p1, 0x3F800000
  :L1
  .line 545
    invoke-virtual { v1 }, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;
    move-result-object v1
  .line 546
    iget v3, v1, Landroid/graphics/Paint$FontMetrics;->descent:F
    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->ascent:F
    sub-float/2addr v3, v1
  .line 547
    cmpl-float v1, v3, p3
    if-lez v1, :L2
    div-float/2addr p3, v3
    invoke-static { p1, p3 }, Ljava/lang/Math;->min(FF)F
    move-result p1
  :L2
  .line 548
    cmpg-float p3, p1, v0
    if-gez p3, :L3
    mul-float p2, p2, p1
  :L3
    invoke-virtual { p0, v2, p2 }, Landroid/widget/TextView;->setTextSize(IF)V
  .line 549
    return-void
.end method

.method public static flash(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 11
  .line 177
    if-eqz p0, :L4
    if-eqz p1, :L4
    if-nez p2, :L0
    goto :L4
  :L0
  .line 178
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
  .line 180
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Alpha;->plateView(Landroid/app/Activity;F)Landroid/widget/TextView;
    move-result-object v1
  .line 181
    invoke-virtual { v1, p2 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 182
    const/16 v2, 40
    invoke-static { v1, p2, v2, v0 }, Lcom/innioasis/ipp/Alpha;->fit(Landroid/widget/TextView;Ljava/lang/String;IF)V
  .line 183
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Alpha;->dress(Landroid/widget/TextView;F)I
    move-result p2
  .line 189
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->hidePop()V
  .line 190
    new-instance v0, Landroid/widget/PopupWindow;
    invoke-direct { v0, v1, p2, p2 }, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V
  .line 191
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 192
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setTouchable(Z)V
  .line 193
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setFocusable(Z)V
  .line 194
    invoke-virtual { v0, v1 }, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V
  .line 200
    const/4 v2, 2
    new-array v3, v2, [I
  .line 201
    new-array v4, v2, [I
  .line 202
    invoke-virtual { p1, v3 }, Landroid/view/View;->getLocationOnScreen([I)V
  .line 203
    invoke-virtual { p1, v4 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 204
    invoke-virtual { p0 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
  .line 209
    iget v5, p0, Landroid/util/DisplayMetrics;->widthPixels:I
    sub-int/2addr v5, p2
    div-int/2addr v5, v2
    aget v6, v3, v1
    aget v7, v4, v1
    sub-int/2addr v6, v7
    sub-int/2addr v5, v6
  .line 210
    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I
    sub-int/2addr p0, p2
    div-int/2addr p0, v2
    const/4 p2, 1
    aget v2, v3, p2
    aget p2, v4, p2
    sub-int/2addr v2, p2
    sub-int/2addr p0, v2
  .line 211
    invoke-virtual { v0, p1, v1, v5, p0 }, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
  .line 212
    sput-object v0, Lcom/innioasis/ipp/Alpha;->pop:Landroid/widget/PopupWindow;
  .line 214
    sget-object p0, Lcom/innioasis/ipp/Alpha;->POP_HIDE:Ljava/lang/Runnable;
    invoke-virtual { p1, p0 }, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 215
    const-wide/16 v0, 700
    invoke-virtual { p1, p0, v0, v1 }, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
  :L1
  .line 218
    goto :L3
  :L2
  .line 216
    move-exception p0
  :L3
  .line 219
    return-void
  :L4
  .line 177
    return-void
.end method

.method private static hidePop()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 239
    sget-object v0, Lcom/innioasis/ipp/Alpha;->pop:Landroid/widget/PopupWindow;
  .line 240
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Alpha;->pop:Landroid/widget/PopupWindow;
  .line 241
    if-eqz v0, :L1
    invoke-virtual { v0 }, Landroid/widget/PopupWindow;->dismiss()V
  :L1
  .line 244
    goto :L3
  :L2
  .line 242
    move-exception v0
  :L3
  .line 245
    return-void
.end method

.method private static ink()I
  .registers 1
  .line 617
    invoke-static { }, Lcom/innioasis/ipp/Icons;->menuColor()I
    move-result v0
  .line 618
    if-nez v0, :L0
    const/4 v0, -1
  :L0
    return v0
.end method

.method private static is(ILcom/innioasis/y1/database/Y1Repository$SongSortType;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Z
  .registers 3
  .line 358
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
  .line 364
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 365
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
  .line 366
    const/4 v2, 0
    if-gez v1, :L0
    const/4 v1, 0
  :L0
  .line 367
    invoke-static { p1, v1, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v3
  .line 368
    nop
  .line 370
    const/4 v4, 1
    if-ne p2, v4, :L5
  .line 371
    add-int/lit8 p2, v1, 1
  :L1
    if-ge p2, v0, :L3
  .line 372
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v3, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L2
    move v2, p2
    goto :L4
  :L2
  .line 371
    add-int/lit8 p2, p2, 1
    goto :L1
  :L3
    const/4 p2, -1
    const/4 v2, -1
  :L4
  .line 374
    if-gez v2, :L11
    add-int/lit8 v2, v0, -1
    goto :L11
  :L5
  .line 376
    add-int/lit8 p2, v1, -1
  :L6
  .line 377
    if-ltz p2, :L7
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v3, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L7
    add-int/lit8 p2, p2, -1
    goto :L6
  :L7
  .line 378
    if-gez p2, :L8
  .line 379
    goto :L11
  :L8
  .line 381
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object v0
    move v2, p2
  :L9
  .line 382
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
  .line 383
    nop
  :L11
  .line 386
    if-ne v2, v1, :L12
    return-void
  :L12
  .line 388
    invoke-virtual { p1, v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 393
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Head;->selectPinned(Landroid/widget/ListView;I)V
  .line 394
    return-void
.end method

.method private static keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
  .registers 7
  .line 398
    const/4 v0, 2
    const-string v1, "?"
    const-string v2, "(no key)"
    if-ltz p1, :L11
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v3
    if-lt p1, v3, :L0
    goto :L11
  :L0
  .line 402
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
  .line 403
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p1
  .line 404
    if-ne p2, v0, :L7
  .line 405
    instance-of p0, p1, Lcom/innioasis/music/data/Album;
    if-nez p0, :L4
    return-object v1
  :L4
  .line 406
    check-cast p1, Lcom/innioasis/music/data/Album;
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 407
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
  .line 409
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Alpha;->label(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object p0
  .line 410
    if-nez p0, :L8
    return-object v2
  :L8
  .line 411
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 416
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p1
    if-eqz p1, :L10
    const-string p1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L9
    goto :L10
  :L9
  .line 422
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Ljava/lang/String;->charAt(I)C
    move-result p0
    invoke-static { p0 }, Ljava/lang/Character;->toUpperCase(C)C
    move-result p0
    invoke-static { p0 }, Ljava/lang/String;->valueOf(C)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L10
  .line 416
    return-object v2
  :L11
  .line 398
    if-ne p2, v0, :L12
    goto :L13
  :L12
    move-object v1, v2
  :L13
    return-object v1
.end method

.method private static label(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/Object;)Ljava/lang/String;
  .registers 3
  .line 437
    instance-of v0, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v0, :L4
  .line 438
    check-cast p1, Lcom/innioasis/y1/database/Song;
  .line 439
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
  .line 440
    if-nez v0, :L2
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
    const-string v0, "meta_title"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
  :L2
  .line 441
    if-eqz v0, :L3
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L3
  .line 442
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L4
  .line 444
    instance-of p0, p1, Lcom/innioasis/music/data/Album;
    if-eqz p0, :L5
    check-cast p1, Lcom/innioasis/music/data/Album;
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->albumLabel(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L5
  .line 445
    instance-of p0, p1, Lcom/innioasis/music/data/Genre;
    if-eqz p0, :L6
    check-cast p1, Lcom/innioasis/music/data/Genre;
    invoke-virtual { p1 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L6
  .line 446
    instance-of p0, p1, Ljava/lang/String;
    if-eqz p0, :L7
    check-cast p1, Ljava/lang/String;
    return-object p1
  :L7
  .line 447
    const/4 p0, 0
    return-object p0
.end method

.method private static margin(F)I
  .registers 2
  .line 623
    const/high16 v0, 0x41400000
    mul-float p0, p0, v0
    const/high16 v0, 0x3F000000
    add-float/2addr p0, v0
    float-to-int p0, p0
    return p0
.end method

.method private static mode(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
  .registers 8
  .line 296
    invoke-virtual { p0 }, Landroid/widget/ListView;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 297
    instance-of v0, p0, Landroid/app/Activity;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 298
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v0
  .line 299
    sget-object v2, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 301
    const-string v3, ".SongListActivity"
    invoke-virtual { v0, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L1
    instance-of v3, p1, Lcom/innioasis/music/adapter/SongListAdapter;
    if-eqz v3, :L1
  .line 302
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortAllSong()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->songs(I)I
    move-result p0
    return p0
  :L1
  .line 308
    const-string v3, ".AlbumsActivity"
    invoke-virtual { v0, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L2
    instance-of v4, p1, Lcom/innioasis/music/adapter/SongListAdapter;
    if-eqz v4, :L2
  .line 309
    invoke-static { }, Lcom/innioasis/ipp/Albums;->songListSort()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->songs(I)I
    move-result p0
    return p0
  :L2
  .line 314
    const-string v4, ".PlayListActivity"
    invoke-virtual { v0, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L4
    instance-of v4, p1, Lcom/innioasis/music/adapter/SongListAdapter;
    if-eqz v4, :L4
  .line 315
    invoke-static { }, Lcom/innioasis/ipp/Playlists;->byAddedOn()Z
    move-result p0
    if-eqz p0, :L3
    return v1
  :L3
  .line 316
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortPlayListSong()I
    move-result p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->songs(I)I
    move-result p0
    return p0
  :L4
  .line 318
    const-string v4, ".ArtistsActivity"
    invoke-virtual { v0, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    const/4 v5, 1
    if-eqz v4, :L7
    instance-of v4, p1, Lcom/innioasis/music/adapter/MainAdapter;
    if-eqz v4, :L7
  .line 319
    invoke-virtual { v2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortArtist()I
    move-result p0
  .line 320
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->getType()I
    move-result p1
    if-eq p0, p1, :L5
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
  .line 321
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->getType()I
    move-result p1
    if-ne p0, p1, :L6
  :L5
    const/4 v1, 1
  :L6
  .line 320
    return v1
  :L7
  .line 323
    invoke-virtual { v0, v3 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    const/4 v3, 2
    if-eqz v2, :L11
    instance-of v2, p1, Lcom/innioasis/music/adapter/AlbumListAdapter;
    if-eqz v2, :L11
  .line 325
    check-cast p0, Landroid/app/Activity;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->albumSortFor(Landroid/app/Activity;)I
    move-result p0
  .line 326
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-eq p0, v2, :L10
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
  .line 327
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-ne p0, v2, :L8
    goto :L10
  :L8
  .line 328
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Asc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-eq p0, v2, :L9
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->Date_Desc:Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;
  .line 329
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortAlbumType;->getType()I
    move-result v2
    if-ne p0, v2, :L11
  :L9
    return v3
  :L10
  .line 327
    return v5
  :L11
  .line 333
    const-string p0, ".GenresActivity"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L13
  .line 334
    invoke-static { p1 }, Lcom/innioasis/ipp/Genres;->alphaKind(Ljava/lang/Object;)I
    move-result p0
  .line 335
    if-ne p0, v5, :L12
    return v5
  :L12
  .line 336
    if-ne p0, v3, :L13
    return v3
  :L13
  .line 338
    return v1
.end method

.method private static overlay(Landroid/widget/ListView;)Landroid/widget/TextView;
  .registers 7
  .line 475
    invoke-virtual { p0 }, Landroid/widget/ListView;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 476
    instance-of v0, p0, Landroid/app/Activity;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 477
    move-object v0, p0
    check-cast v0, Landroid/app/Activity;
  .line 478
    invoke-virtual { v0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v2
    const v3, 16908290
    invoke-virtual { v2, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 479
    instance-of v3, v2, Landroid/widget/FrameLayout;
    if-nez v3, :L1
    return-object v1
  :L1
  .line 480
    check-cast v2, Landroid/widget/FrameLayout;
  .line 482
    sget-object v3, Lcom/innioasis/ipp/Alpha;->overlayRef:Ljava/lang/ref/WeakReference;
    if-nez v3, :L2
    goto :L3
  :L2
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L3
  .line 483
    instance-of v3, v1, Landroid/widget/TextView;
    if-eqz v3, :L4
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual { v1 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    if-ne v3, v2, :L4
    return-object v1
  :L4
  .line 485
    invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F
  .line 487
    new-instance v3, Landroid/widget/TextView;
    invoke-direct { v3, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 488
    const-string p0, ""
    invoke-virtual { v3, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 489
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->ink()I
    move-result p0
    invoke-virtual { v3, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 490
    const/16 p0, 17
    invoke-virtual { v3, p0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 491
    const/4 v4, 0
    invoke-virtual { v3, v4 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 495
    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v5, 1
    invoke-virtual { v3, v4, v5 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 497
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/Alpha;->dress(Landroid/widget/TextView;F)I
    move-result v4
  .line 498
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { v5, v4, v4 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
  .line 499
    iput p0, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  .line 500
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Alpha;->barOffset(Landroid/app/Activity;F)I
    move-result p0
    iput p0, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 501
    invoke-virtual { v2, v3, v5 }, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 502
    new-instance p0, Ljava/lang/ref/WeakReference;
    invoke-direct { p0, v3 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object p0, Lcom/innioasis/ipp/Alpha;->overlayRef:Ljava/lang/ref/WeakReference;
  .line 503
    return-object v3
.end method

.method private static plate()I
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  :L0
  .line 598
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 599
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
  .line 602
    goto :L4
  :L3
  .line 600
    move-exception v0
  :L4
  .line 603
    const v0, -654279937
    return v0
.end method

.method private static plateBitmap(IF)Landroid/graphics/Bitmap;
  .registers 11
  .line 656
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->plate()I
    move-result v0
  .line 657
    mul-int/lit8 v1, p0, 31
    add-int/2addr v1, v0
  .line 658
    sget-object v2, Lcom/innioasis/ipp/Alpha;->plateBm:Landroid/graphics/Bitmap;
  .line 659
    if-eqz v2, :L0
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v3
    if-nez v3, :L0
    sget v3, Lcom/innioasis/ipp/Alpha;->plateKey:I
    if-ne v1, v3, :L0
    return-object v2
  :L0
  .line 661
    invoke-static { p1 }, Lcom/innioasis/ipp/Alpha;->margin(F)I
    move-result v2
  .line 662
    mul-int/lit8 v3, v2, 2
    add-int/2addr v3, p0
  .line 663
    const/high16 v4, 0x41400000
    mul-float v4, v4, p1
  .line 664
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v3, v3, v5 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 665
    new-instance v5, Landroid/graphics/Canvas;
    invoke-direct { v5, v3 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 667
    new-instance v6, Landroid/graphics/Path;
    invoke-direct { v6 }, Landroid/graphics/Path;-><init>()V
  .line 668
    new-instance v7, Landroid/graphics/RectF;
    int-to-float v8, v2
    add-int/2addr v2, p0
    int-to-float p0, v2
    invoke-direct { v7, v8, v8, p0, p0 }, Landroid/graphics/RectF;-><init>(FFFF)V
    sget-object p0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;
    invoke-virtual { v6, v7, v4, v4, p0 }, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V
  .line 670
    new-instance p0, Landroid/graphics/Paint;
    const/4 v2, 1
    invoke-direct { p0, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 671
    const/high16 v4, 0x33000000
    invoke-virtual { p0, v4 }, Landroid/graphics/Paint;->setColor(I)V
  .line 672
    const/high16 v7, 0x41200000
    mul-float v7, v7, p1
    const/high16 v8, 0x40000000
    mul-float p1, p1, v8
    const/4 v8, 0
    invoke-virtual { p0, v7, v8, p1, v4 }, Landroid/graphics/Paint;->setShadowLayer(FFFI)V
  .line 673
    invoke-virtual { v5, v6, p0 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 675
    new-instance p0, Landroid/graphics/Paint;
    invoke-direct { p0, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 676
    new-instance p1, Landroid/graphics/PorterDuffXfermode;
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { p1, v4 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { p0, p1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 677
    invoke-virtual { v5, v6, p0 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 679
    new-instance p0, Landroid/graphics/Paint;
    invoke-direct { p0, v2 }, Landroid/graphics/Paint;-><init>(I)V
  .line 680
    invoke-virtual { p0, v0 }, Landroid/graphics/Paint;->setColor(I)V
  .line 681
    invoke-virtual { v5, v6, p0 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 683
    sput-object v3, Lcom/innioasis/ipp/Alpha;->plateBm:Landroid/graphics/Bitmap;
  .line 684
    sput v1, Lcom/innioasis/ipp/Alpha;->plateKey:I
  .line 685
    return-object v3
.end method

.method private static plateView(Landroid/app/Activity;F)Landroid/widget/TextView;
  .registers 3
  .line 249
    new-instance p1, Landroid/widget/TextView;
    invoke-direct { p1, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 250
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->ink()I
    move-result p0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 251
    const/16 p0, 17
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setGravity(I)V
  .line 252
    const/4 p0, 0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 255
    sget-object p0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    const/4 v0, 1
    invoke-virtual { p1, p0, v0 }, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
  .line 256
    return-object p1
.end method

.method private static show(Landroid/widget/ListView;Ljava/lang/String;)V
  .registers 5
  .line 458
    invoke-static { p0 }, Lcom/innioasis/ipp/Alpha;->overlay(Landroid/widget/ListView;)Landroid/widget/TextView;
    move-result-object v0
  .line 459
    if-nez v0, :L0
    return-void
  :L0
  .line 462
    const-string v1, "(no key)"
    invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    const-string p1, "#"
  :L1
  .line 463
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 467
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 2
    if-le v1, v2, :L2
    const/16 v1, 40
    goto :L3
  :L2
    const/16 v1, 56
  :L3
  .line 468
    invoke-virtual { p0 }, Landroid/widget/ListView;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
  .line 467
    invoke-static { v0, p1, v1, v2 }, Lcom/innioasis/ipp/Alpha;->fit(Landroid/widget/TextView;Ljava/lang/String;IF)V
  .line 469
    const/4 p1, 0
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 470
    sget-object p1, Lcom/innioasis/ipp/Alpha;->HIDE:Lcom/innioasis/ipp/Alpha$Hide;
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z
  .line 471
    const-wide/16 v0, 1000
    invoke-virtual { p0, p1, v0, v1 }, Landroid/widget/ListView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 472
    return-void
.end method

.method private static side(F)I
  .registers 6
  .line 520
    const/high16 v0, 0x41600000
    mul-float v0, v0, p0
    const/high16 v1, 0x3F000000
    add-float/2addr v0, v1
    float-to-int v0, v0
  .line 521
    new-instance v2, Landroid/text/TextPaint;
    invoke-direct { v2 }, Landroid/text/TextPaint;-><init>()V
  .line 522
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/text/TextPaint;->setAntiAlias(Z)V
  .line 523
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;
    invoke-static { v4, v3 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v3
    invoke-virtual { v2, v3 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 524
    const/high16 v3, 0x42200000
    mul-float p0, p0, v3
    invoke-virtual { v2, p0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 525
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
  .line 353
    sget-object v0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->SongName_Z_To_A:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Alpha;->is(ILcom/innioasis/y1/database/Y1Repository$SongSortType;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Z
    move-result p0
    if-eqz p0, :L0
  .line 354
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
  .line 353
    return p0
.end method

.method public static step(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)Z
  .catchall { :L0 .. :L11 } :L12
  .registers 13
  .line 265
    const/4 v0, 0
  :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 266
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
  .line 267
    sput-wide v1, Lcom/innioasis/ipp/Alpha;->lastCall:J
  .line 269
    if-eqz p0, :L10
    if-eqz p1, :L10
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->enabled()Z
    move-result v4
    if-nez v4, :L3
    goto :L10
  :L3
  .line 270
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Alpha;->mode(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)I
    move-result v4
  .line 271
    if-nez v4, :L4
    sput v0, Lcom/innioasis/ipp/Alpha;->fast:I
    return v0
  :L4
  .line 273
    if-eqz v3, :L5
    return v7
  :L5
  .line 275
    sget-boolean v3, Lcom/innioasis/ipp/Alpha;->jumping:Z
    if-nez v3, :L9
  .line 276
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
  .line 277
    sput-wide v1, Lcom/innioasis/ipp/Alpha;->lastClick:J
  .line 278
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->threshold()I
    move-result v5
    if-ge v3, v5, :L8
    return v0
  :L8
  .line 279
    sput-boolean v7, Lcom/innioasis/ipp/Alpha;->jumping:Z
  :L9
  .line 281
    sput-wide v1, Lcom/innioasis/ipp/Alpha;->lastClick:J
  .line 283
    invoke-static { p0, p1, p2, v4 }, Lcom/innioasis/ipp/Alpha;->jump(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;II)V
  .line 284
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p2
    invoke-static { p1, p2, v4 }, Lcom/innioasis/ipp/Alpha;->keyAt(Lcom/innioasis/music/adapter/MyBaseAdapter;II)Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Alpha;->show(Landroid/widget/ListView;Ljava/lang/String;)V
  .line 285
    return v7
  :L10
  .line 269
    sput v0, Lcom/innioasis/ipp/Alpha;->fast:I
  :L11
    return v0
  :L12
  .line 286
    move-exception p0
  .line 287
    sput v0, Lcom/innioasis/ipp/Alpha;->fast:I
  .line 288
    sput-boolean v0, Lcom/innioasis/ipp/Alpha;->jumping:Z
  .line 289
    return v0
.end method

.method private static threshold()I
  .registers 3
  .line 694
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 695
    const/4 v1, 5
    if-nez v0, :L0
    const/4 v0, 5
    goto :L1
  :L0
  .line 696
    const-string v2, "alpha_threshold"
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  :L1
  .line 697
    if-ltz v0, :L3
    sget-object v2, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    array-length v2, v2
    if-lt v0, v2, :L2
    goto :L3
  :L2
    move v1, v0
  :L3
  .line 698
    sget-object v0, Lcom/innioasis/ipp/Alpha;->THRESHOLDS:[I
    aget v0, v0, v1
    return v0
.end method

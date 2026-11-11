.class public final Lcom/innioasis/ipp/Loading;
.super Ljava/lang/Object;
.source "Loading.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Loading$ScanText;,
    Lcom/innioasis/ipp/Loading$Spin;
  }
.end annotation

.field private final static BIG:F = 2.2F

.field private final static BOX:I = -1

.field private final static COUNTERS:Ljava/util/WeakHashMap;

.field private final static FADE:F = 1.15F

.field private final static FADE_STYLE:I = 2131887152

.field private final static FULL:Ljava/lang/String; = "100%"

.field private final static MAIN:Landroid/os/Handler;

.field private final static PLATFORM_DIP:I = 48

.field private final static PROBE:I = 16707006

.field private final static RADIUS_DIP:I = 10

.field private final static RULE_MAX_DIP:I = 4

.field private final static SEEN:Ljava/util/WeakHashMap;

.field private final static SIDE_DIP:I = 14

.field private final static SLACK:I = 4

.field private final static SMALL:F = 0.7F

.field private final static TEXT:I = -15720094

.field private final static TOP_DIP:I = 16

.field private static volatile scanDialog:Ljava/lang/ref/WeakReference;

.field private static scanTitle:Ljava/lang/String;

.method static constructor <clinit>()V
  .registers 2
  .line 63
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Loading;->SEEN:Ljava/util/WeakHashMap;
  .line 188
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Loading;->COUNTERS:Ljava/util/WeakHashMap;
  .line 277
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Loading;->MAIN:Landroid/os/Handler;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 60
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(I)Landroid/graphics/ColorMatrixColorFilter;
  .registers 1
  .line 58
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->fade(I)Landroid/graphics/ColorMatrixColorFilter;
    move-result-object p0
    return-object p0
.end method

.method private static centre(Landroid/view/View;)V
  .registers 4
  .line 561
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 562
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 17
    if-eqz v1, :L0
  .line 563
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
    goto :L1
  :L0
  .line 564
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;
    if-eqz v1, :L1
  .line 565
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  :L1
  .line 567
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 568
    instance-of v0, p0, Landroid/widget/LinearLayout;
    if-eqz v0, :L2
  .line 569
    check-cast p0, Landroid/widget/LinearLayout;
    invoke-virtual { p0, v2 }, Landroid/widget/LinearLayout;->setGravity(I)V
    goto :L3
  :L2
  .line 570
    instance-of v0, p0, Landroid/widget/RelativeLayout;
    if-eqz v0, :L3
  .line 571
    check-cast p0, Landroid/widget/RelativeLayout;
    invoke-virtual { p0, v2 }, Landroid/widget/RelativeLayout;->setGravity(I)V
  :L3
  .line 573
    return-void
.end method

.method public static counter(Landroid/app/Dialog;)V
  .catchall { :L1 .. :L2 } :L6
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L7 .. :L8 } :L6
  .registers 3
  .line 170
    if-nez p0, :L0
    return-void
  :L0
  .line 171
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->seen(Landroid/app/Dialog;)V
  .line 172
    sget-object v0, Lcom/innioasis/ipp/Loading;->COUNTERS:Ljava/util/WeakHashMap;
    monitor-enter v0
  :L1
  .line 173
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { v0, p0, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 174
    monitor-exit v0
  :L2
  .line 176
    invoke-virtual { p0 }, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object p0
  .line 177
    if-eqz p0, :L3
    const/16 v0, 128
    invoke-virtual { p0, v0 }, Landroid/view/Window;->addFlags(I)V
  :L3
  .line 179
    goto :L5
  :L4
  .line 178
    move-exception p0
  :L5
  .line 180
    return-void
  :L6
  .line 174
    move-exception p0
  :L7
    monitor-exit v0
  :L8
    throw p0
.end method

.method private static counts(Landroid/app/Dialog;)Z
  .catchall { :L0 .. :L4 } :L3
  .registers 2
  .line 183
    sget-object v0, Lcom/innioasis/ipp/Loading;->COUNTERS:Ljava/util/WeakHashMap;
    monitor-enter v0
  .line 184
    if-eqz p0, :L1
  :L0
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L1
    const/4 p0, 1
    goto :L2
  :L1
    const/4 p0, 0
  :L2
    monitor-exit v0
    return p0
  :L3
  .line 185
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
.end method

.method private static dress(Landroid/view/View;IIZ)V
  .registers 7
  .line 367
    const v0, 16707006
    const/4 v1, 0
    if-eq p1, v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 368
    instance-of v2, p0, Landroid/widget/TextView;
    if-eqz v2, :L5
  .line 369
    check-cast p0, Landroid/widget/TextView;
  .line 370
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object p2
  .line 371
    if-eqz p2, :L4
    invoke-interface { p2 }, Ljava/lang/CharSequence;->length()I
    move-result p2
    if-nez p2, :L2
    goto :L4
  :L2
  .line 375
    const/16 p2, 17
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setGravity(I)V
  .line 376
    if-eqz v0, :L3
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setTextColor(I)V
  :L3
  .line 377
    return-void
  :L4
  .line 372
    const/16 p1, 8
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 373
    return-void
  :L5
  .line 379
    instance-of v2, p0, Landroid/widget/ProgressBar;
    if-eqz v2, :L7
  .line 381
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p2
    invoke-virtual { p2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p2
    iget p2, p2, Landroid/util/DisplayMetrics;->density:F
    const/high16 p3, 0x42400000
    mul-float p2, p2, p3
    float-to-int p2, p2
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Loading;->spin(Landroid/view/View;II)Z
    move-result p1
    if-nez p1, :L6
  .line 382
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->centre(Landroid/view/View;)V
  :L6
  .line 384
    return-void
  :L7
  .line 386
    instance-of v2, p0, Landroid/view/ViewGroup;
    if-eqz v2, :L11
  .line 388
    if-eqz p3, :L8
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L8
  .line 389
    check-cast p0, Landroid/view/ViewGroup;
  .line 390
    nop
  :L9
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-ge v1, v0, :L10
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    invoke-static { v0, p1, p2, p3 }, Lcom/innioasis/ipp/Loading;->dress(Landroid/view/View;IIZ)V
    add-int/lit8 v1, v1, 1
    goto :L9
  :L10
  .line 391
    return-void
  :L11
  .line 393
    if-eqz v0, :L12
  .line 395
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p3
  .line 396
    if-eqz p3, :L12
    iget v0, p3, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-lez v0, :L12
    iget p3, p3, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-gt p3, p2, :L12
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundColor(I)V
  :L12
  .line 398
    return-void
.end method

.method private static fade(I)Landroid/graphics/ColorMatrixColorFilter;
  .registers 7
  .line 577
    nop
  .line 578
    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;
    new-instance v1, Landroid/graphics/ColorMatrix;
    const/16 v2, 20
    new-array v2, v2, [F
    const/4 v3, 0
    const/4 v4, 0
    aput v4, v2, v3
    const/4 v3, 1
    aput v4, v2, v3
    const/4 v3, 2
    aput v4, v2, v3
    const/4 v3, 3
    aput v4, v2, v3
  .line 579
    invoke-static { p0 }, Landroid/graphics/Color;->red(I)I
    move-result v3
    int-to-float v3, v3
    const/4 v5, 4
    aput v3, v2, v5
    const/4 v3, 5
    aput v4, v2, v3
    const/4 v3, 6
    aput v4, v2, v3
    const/4 v3, 7
    aput v4, v2, v3
    const/16 v3, 8
    aput v4, v2, v3
  .line 580
    invoke-static { p0 }, Landroid/graphics/Color;->green(I)I
    move-result v3
    int-to-float v3, v3
    const/16 v5, 9
    aput v3, v2, v5
    const/16 v3, 10
    aput v4, v2, v3
    const/16 v3, 11
    aput v4, v2, v3
    const/16 v3, 12
    aput v4, v2, v3
    const/16 v3, 13
    aput v4, v2, v3
  .line 581
    invoke-static { p0 }, Landroid/graphics/Color;->blue(I)I
    move-result p0
    int-to-float p0, p0
    const/16 v3, 14
    aput p0, v2, v3
    const/16 p0, 15
    const v3, -1095758565
    aput v3, v2, p0
    const/16 p0, 16
    const v3, -1087582188
    aput v3, v2, p0
    const/16 p0, 17
    const v3, -1106886892
    aput v3, v2, p0
    const/16 p0, 18
    const v3, 1066611507
    aput v3, v2, p0
    const/16 p0, 19
    aput v4, v2, p0
    invoke-direct { v1, v2 }, Landroid/graphics/ColorMatrix;-><init>([F)V
    invoke-direct { v0, v1 }, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V
  .line 578
    return-object v0
.end method

.method public static hidden(Landroid/app/ProgressDialog;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 348
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->seen(Landroid/app/Dialog;)V
  .line 349
    if-nez p0, :L0
    return-void
  :L0
  .line 351
    invoke-virtual { p0 }, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;
    move-result-object p0
  .line 352
    if-nez p0, :L1
    return-void
  :L1
  .line 354
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/view/Window;->setWindowAnimations(I)V
  .line 355
    const/4 v1, 2
    invoke-virtual { p0, v1 }, Landroid/view/Window;->clearFlags(I)V
  .line 356
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;
    invoke-direct { v1, v0 }, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    invoke-virtual { p0, v1 }, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 357
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p0
  .line 358
    instance-of v1, p0, Landroid/view/ViewGroup;
    if-eqz v1, :L4
  .line 359
    check-cast p0, Landroid/view/ViewGroup;
  .line 360
    nop
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L4
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    const/4 v2, 4
    invoke-virtual { v1, v2 }, Landroid/view/View;->setVisibility(I)V
  :L3
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 363
    goto :L6
  :L5
  .line 362
    move-exception p0
  :L6
  .line 364
    return-void
.end method

.method private static holdsSpin(Landroid/view/View;)Z
  .registers 5
  .line 440
    instance-of v0, p0, Lcom/innioasis/ipp/Loading$Spin;
    const/4 v1, 1
    if-eqz v0, :L0
    return v1
  :L0
  .line 441
    instance-of v0, p0, Landroid/view/ViewGroup;
    const/4 v2, 0
    if-nez v0, :L1
    return v2
  :L1
  .line 442
    check-cast p0, Landroid/view/ViewGroup;
  .line 443
    const/4 v0, 0
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v0, v3, :L4
  .line 444
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Loading;->holdsSpin(Landroid/view/View;)Z
    move-result v3
    if-eqz v3, :L3
    return v1
  :L3
  .line 443
    add-int/lit8 v0, v0, 1
    goto :L2
  :L4
  .line 446
    return v2
.end method

.method public static paint(Landroid/app/Dialog;Landroid/view/View;)V
  .catchall { :L0 .. :L10 } :L13
  .registers 8
  .line 108
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->seen(Landroid/app/Dialog;)V
  .line 109
    if-nez p1, :L0
    return-void
  :L0
  .line 111
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 112
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v1 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 113
    const/4 v2, -1
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogBGColor(I)I
    move-result v2
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 114
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
    const/high16 v3, 0x41200000
    mul-float v2, v2, v3
    invoke-virtual { v1, v2 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 115
    invoke-virtual { p1, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 117
    const v1, 16707006
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogTextColor(I)I
    move-result v0
  .line 118
    if-ne v0, v1, :L1
    const v2, -15720094
    goto :L2
  :L1
    move v2, v0
  :L2
  .line 119
    const v3, 2131361970
    invoke-static { p1, v3, v2 }, Lcom/innioasis/ipp/Loading;->text(Landroid/view/View;II)V
  .line 120
    const v4, 2131362457
    invoke-static { p1, v4, v2 }, Lcom/innioasis/ipp/Loading;->text(Landroid/view/View;II)V
  .line 121
    const v2, 2131362176
    invoke-virtual { p1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 122
    invoke-virtual { p1, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v3
  .line 123
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->counts(Landroid/app/Dialog;)Z
    move-result v5
    if-eqz v5, :L6
  .line 125
    if-eqz v2, :L3
    const/16 p0, 8
    invoke-virtual { v2, p0 }, Landroid/view/View;->setVisibility(I)V
  :L3
  .line 127
    invoke-virtual { p1 }, Landroid/view/View;->getPaddingLeft()I
    move-result p0
  .line 128
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
    const/high16 v1, 0x41800000
    mul-float v0, v0, v1
    float-to-int v0, v0
  .line 129
    invoke-virtual { p1 }, Landroid/view/View;->getPaddingRight()I
    move-result v1
    invoke-virtual { p1 }, Landroid/view/View;->getPaddingBottom()I
    move-result v2
  .line 127
    invoke-virtual { p1, p0, v0, v1, v2 }, Landroid/view/View;->setPadding(IIII)V
  .line 131
    invoke-virtual { p1, v4 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 132
    if-eqz p0, :L4
  .line 133
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v0, 0x41600000
    mul-float p1, p1, v0
    float-to-int p1, p1
  .line 134
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingTop()I
    move-result v0
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingBottom()I
    move-result v1
    invoke-virtual { p0, p1, v0, p1, v1 }, Landroid/view/View;->setPadding(IIII)V
  :L4
  .line 136
    instance-of p0, v3, Landroid/widget/TextView;
    if-eqz p0, :L5
    check-cast v3, Landroid/widget/TextView;
    invoke-static { v3 }, Lcom/innioasis/ipp/Loading;->steady(Landroid/widget/TextView;)V
  :L5
  .line 137
    goto :L12
  :L6
    const/4 p1, 0
    invoke-static { v2, v0, p1 }, Lcom/innioasis/ipp/Loading;->spin(Landroid/view/View;II)Z
    move-result p1
    if-eqz p1, :L9
  .line 138
    if-nez p0, :L7
    const/4 p0, 0
    goto :L8
  :L7
    invoke-virtual { p0 }, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object p0
  :L8
  .line 139
    if-eqz p0, :L11
    const p1, 2131887152
    invoke-virtual { p0, p1 }, Landroid/view/Window;->setWindowAnimations(I)V
    goto :L11
  :L9
  .line 140
    if-eq v0, v1, :L11
    instance-of p0, v2, Landroid/widget/ImageView;
    if-eqz p0, :L11
  .line 141
    check-cast v2, Landroid/widget/ImageView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Loading;->fade(I)Landroid/graphics/ColorMatrixColorFilter;
    move-result-object p0
    invoke-virtual { v2, p0 }, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V
  :L10
    goto :L12
  :L11
  .line 140
    nop
  :L12
  .line 144
    goto :L14
  :L13
  .line 143
    move-exception p0
  :L14
  .line 145
    return-void
.end method

.method public static percent(Ljava/lang/String;I)Ljava/lang/String;
  .registers 3
  .line 151
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, "%\n"
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static progress(Landroid/app/ProgressDialog;)V
  .catchall { :L0 .. :L12 } :L13
  .registers 11
  .line 305
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->seen(Landroid/app/Dialog;)V
  .line 306
    if-nez p0, :L0
    return-void
  :L0
  .line 308
    const-string v0, ""
    invoke-virtual { p0, v0 }, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V
  .line 309
    invoke-virtual { p0 }, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;
    move-result-object p0
  .line 310
    if-nez p0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
  :L2
  .line 311
    if-nez v0, :L3
    return-void
  :L3
  .line 313
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 314
    const v2, 16707006
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogBGColor(I)I
    move-result v3
  .line 315
    const/4 v4, 0
    if-eq v3, v2, :L4
    const/4 v5, 1
    goto :L5
  :L4
    const/4 v5, 0
  :L5
  .line 316
    invoke-virtual { v0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v6
    invoke-virtual { v6 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v6
    iget v6, v6, Landroid/util/DisplayMetrics;->density:F
  .line 317
    if-eqz v5, :L7
  .line 319
    new-instance v7, Landroid/graphics/Rect;
    invoke-direct { v7 }, Landroid/graphics/Rect;-><init>()V
  .line 320
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v8
  .line 321
    if-eqz v8, :L6
    invoke-virtual { v8, v7 }, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z
  :L6
  .line 322
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v8 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 323
    invoke-virtual { v8, v3 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 324
    const/high16 v3, 0x41200000
    mul-float v3, v3, v6
    invoke-virtual { v8, v3 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 325
    invoke-virtual { p0, v8 }, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 326
    iget v3, v7, Landroid/graphics/Rect;->left:I
    iget v8, v7, Landroid/graphics/Rect;->top:I
    iget v9, v7, Landroid/graphics/Rect;->right:I
    iget v7, v7, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v0, v3, v8, v9, v7 }, Landroid/view/View;->setPadding(IIII)V
  :L7
  .line 329
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->dialogTextColor(I)I
    move-result v1
  .line 330
    const/high16 v2, 0x40800000
    mul-float v6, v6, v2
    float-to-int v2, v6
  .line 331
    instance-of v3, v0, Landroid/view/ViewGroup;
    if-eqz v3, :L10
  .line 332
    move-object v3, v0
    check-cast v3, Landroid/view/ViewGroup;
  .line 333
    nop
  :L8
    invoke-virtual { v3 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v6
    if-ge v4, v6, :L9
    invoke-virtual { v3, v4 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v6
    invoke-static { v6, v1, v2, v5 }, Lcom/innioasis/ipp/Loading;->dress(Landroid/view/View;IIZ)V
    add-int/lit8 v4, v4, 1
    goto :L8
  :L9
  .line 334
    goto :L11
  :L10
  .line 335
    invoke-static { v0, v1, v2, v5 }, Lcom/innioasis/ipp/Loading;->dress(Landroid/view/View;IIZ)V
  :L11
  .line 338
    invoke-static { v0 }, Lcom/innioasis/ipp/Loading;->holdsSpin(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L12
    const v0, 2131887152
    invoke-virtual { p0, v0 }, Landroid/view/Window;->setWindowAnimations(I)V
  :L12
  .line 340
    goto :L14
  :L13
  .line 339
    move-exception p0
  :L14
  .line 341
    return-void
.end method

.method public static scan(Lcom/innioasis/y1/utils/LoadingDialog;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 3
  .line 248
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->seen(Landroid/app/Dialog;)V
  .line 249
    if-nez p0, :L0
    return-void
  :L0
  .line 250
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->counter(Landroid/app/Dialog;)V
  .line 251
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/LoadingDialog;->show()V
  :L1
  .line 253
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/LoadingDialog;->getContext()Landroid/content/Context;
    move-result-object v0
    const v1, 2131820917
    invoke-virtual { v0, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Loading;->scanTitle:Ljava/lang/String;
  .line 254
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Loading;->scanDialog:Ljava/lang/ref/WeakReference;
  .line 255
    sget-object v0, Lcom/innioasis/ipp/Loading;->scanTitle:Ljava/lang/String;
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Loading;->show(Lcom/innioasis/y1/utils/LoadingDialog;Ljava/lang/String;)V
  :L2
  .line 257
    goto :L4
  :L3
  .line 256
    move-exception p0
  :L4
  .line 258
    return-void
.end method

.method private static scanLine(Ljava/lang/String;)V
  .registers 4
  .line 271
    sget-object v0, Lcom/innioasis/ipp/Loading;->scanDialog:Ljava/lang/ref/WeakReference;
  .line 272
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/utils/LoadingDialog;
  :L1
  .line 273
    if-nez v0, :L2
    return-void
  :L2
  .line 274
    sget-object v1, Lcom/innioasis/ipp/Loading;->MAIN:Landroid/os/Handler;
    new-instance v2, Lcom/innioasis/ipp/Loading$ScanText;
    invoke-direct { v2, v0, p0 }, Lcom/innioasis/ipp/Loading$ScanText;-><init>(Lcom/innioasis/y1/utils/LoadingDialog;Ljava/lang/String;)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 275
    return-void
.end method

.method static scanned(I)V
  .registers 2
  .line 263
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, "\n"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-object v0, Lcom/innioasis/ipp/Loading;->scanTitle:Ljava/lang/String;
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->scanLine(Ljava/lang/String;)V
  .line 264
    return-void
.end method

.method static scannedPercent(I)V
  .registers 2
  .line 267
    sget-object v0, Lcom/innioasis/ipp/Loading;->scanTitle:Ljava/lang/String;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->scanLine(Ljava/lang/String;)V
  .line 268
    return-void
.end method

.method private static seen(Landroid/app/Dialog;)V
  .catchall { :L1 .. :L3 } :L2
  .registers 3
  .line 66
    if-nez p0, :L0
    return-void
  :L0
  .line 67
    sget-object v0, Lcom/innioasis/ipp/Loading;->SEEN:Ljava/util/WeakHashMap;
    monitor-enter v0
  :L1
  .line 68
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { v0, p0, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 69
    monitor-exit v0
  .line 70
    return-void
  :L2
  .line 69
    move-exception p0
    monitor-exit v0
  :L3
    throw p0
.end method

.method public static show(Lcom/innioasis/y1/utils/LoadingDialog;Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 156
    if-nez p0, :L0
    return-void
  :L0
  .line 158
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/LoadingDialog;->show(Ljava/lang/String;)V
  .line 159
    const p1, 2131361970
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/LoadingDialog;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 160
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L1
    check-cast p0, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->steady(Landroid/widget/TextView;)V
  :L1
  .line 162
    goto :L3
  :L2
  .line 161
    move-exception p0
  :L3
  .line 163
    return-void
.end method

.method private static spin(Landroid/view/View;II)Z
  .catchall { :L3 .. :L6 } :L8
  .registers 9
  .line 408
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v1
  :L1
  .line 409
    instance-of v2, v1, Landroid/view/ViewGroup;
    const/4 v3, 0
    if-nez v2, :L2
    return v3
  :L2
  .line 410
    check-cast v1, Landroid/view/ViewGroup;
  :L3
  .line 412
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
  .line 415
    instance-of v4, v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    if-eqz v4, :L4
  .line 416
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    invoke-static { v2 }, Lcom/innioasis/ipp/Pad;->copy(Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    move-result-object p2
  .line 417
    const/4 v2, 4
    goto :L5
  :L4
  .line 418
    instance-of v2, v1, Landroid/widget/LinearLayout;
    if-eqz v2, :L7
    if-lez p2, :L7
  .line 419
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct { v2, p2, p2 }, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
  .line 420
    const/16 p2, 17
    iput p2, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
  .line 421
    move-object v4, v1
    check-cast v4, Landroid/widget/LinearLayout;
    invoke-virtual { v4, p2 }, Landroid/widget/LinearLayout;->setGravity(I)V
  .line 422
    nop
  .line 423
    nop
  .line 424
    const/16 p2, 8
    move-object p2, v2
    const/16 v2, 8
  :L5
  .line 427
    new-instance v4, Lcom/innioasis/ipp/Loading$Spin;
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v5
    invoke-direct { v4, v5, p1 }, Lcom/innioasis/ipp/Loading$Spin;-><init>(Landroid/content/Context;I)V
  .line 428
    invoke-static { }, Landroid/view/View;->generateViewId()I
    move-result p1
    invoke-virtual { v4, p1 }, Lcom/innioasis/ipp/Loading$Spin;->setId(I)V
  .line 429
    invoke-virtual { v1, p0 }, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result p1
    const/4 v5, 1
    add-int/2addr p1, v5
    invoke-virtual { v1, v4, p1, p2 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 430
    invoke-virtual { p0, v2 }, Landroid/view/View;->setVisibility(I)V
  .line 432
    instance-of p1, p0, Landroid/widget/ImageView;
    if-eqz p1, :L6
    check-cast p0, Landroid/widget/ImageView;
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  :L6
  .line 433
    return v5
  :L7
  .line 425
    return v3
  :L8
  .line 434
    move-exception p0
  .line 435
    return v3
.end method

.method private static steady(Landroid/widget/TextView;)V
  .registers 12
  .line 202
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 203
    if-nez v0, :L0
    return-void
  :L0
  .line 204
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
  .line 205
    const/16 v2, 10
    invoke-virtual { v1, v2 }, Ljava/lang/String;->indexOf(I)I
    move-result v3
  .line 206
    const/4 v4, 0
    if-gez v3, :L1
    move-object v5, v1
    goto :L2
  :L1
    invoke-virtual { v1, v4, v3 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v5
  :L2
  .line 207
    invoke-virtual { v5 }, Ljava/lang/String;->length()I
    move-result v6
    if-eqz v6, :L13
    invoke-virtual { v5, v4 }, Ljava/lang/String;->charAt(I)C
    move-result v6
    invoke-static { v6 }, Ljava/lang/Character;->isDigit(C)Z
    move-result v6
    if-nez v6, :L3
    goto/16 :L13
  :L3
  .line 208
    instance-of v0, v0, Landroid/text/Spanned;
    const v6, 1060320051
    const v7, 1074580685
    if-nez v0, :L5
  .line 209
    new-instance v0, Landroid/text/SpannableString;
    invoke-direct { v0, v1 }, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V
  .line 210
    nop
  .line 211
    new-instance v8, Landroid/text/style/RelativeSizeSpan;
    invoke-direct { v8, v7 }, Landroid/text/style/RelativeSizeSpan;-><init>(F)V
    invoke-virtual { v5 }, Ljava/lang/String;->length()I
    move-result v9
    const/16 v10, 33
    invoke-virtual { v0, v8, v4, v9, v10 }, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V
  .line 212
    if-ltz v3, :L4
    new-instance v4, Landroid/text/style/RelativeSizeSpan;
    invoke-direct { v4, v6 }, Landroid/text/style/RelativeSizeSpan;-><init>(F)V
    add-int/lit8 v8, v3, 1
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v9
    invoke-virtual { v0, v4, v8, v9, v10 }, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V
  :L4
  .line 213
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L5
  .line 215
    new-instance v0, Landroid/graphics/Paint;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v4
    invoke-direct { v0, v4 }, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V
  .line 216
    invoke-virtual { v0 }, Landroid/graphics/Paint;->getTextSize()F
    move-result v4
  .line 217
    mul-float v7, v7, v4
    invoke-virtual { v0, v7 }, Landroid/graphics/Paint;->setTextSize(F)V
  .line 218
    invoke-virtual { v0, v5 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v5
    const-string v7, "100%"
    invoke-virtual { v0, v7 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v7
    invoke-static { v5, v7 }, Ljava/lang/Math;->max(FF)F
    move-result v5
  .line 219
    mul-float v4, v4, v6
    invoke-virtual { v0, v4 }, Landroid/graphics/Paint;->setTextSize(F)V
  .line 220
    add-int/lit8 v4, v3, 1
  :L6
  .line 221
    if-ltz v3, :L10
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v6
    if-gt v4, v6, :L10
  .line 222
    invoke-virtual { v1, v2, v4 }, Ljava/lang/String;->indexOf(II)I
    move-result v6
  .line 223
    if-gez v6, :L7
    invoke-virtual { v1, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v4
    goto :L8
  :L7
    invoke-virtual { v1, v4, v6 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
  :L8
  .line 224
    invoke-virtual { v0, v4 }, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F
    move-result v4
    invoke-static { v5, v4 }, Ljava/lang/Math;->max(FF)F
    move-result v5
  .line 225
    if-gez v6, :L9
    goto :L10
  :L9
  .line 226
    add-int/lit8 v4, v6, 1
  .line 227
    goto :L6
  :L10
  .line 228
    float-to-double v0, v5
    invoke-static { v0, v1 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v0
    double-to-int v0, v0
    add-int/lit8 v0, v0, 4
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingLeft()I
    move-result v1
    add-int/2addr v0, v1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingRight()I
    move-result v1
    add-int/2addr v0, v1
  .line 229
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I
    mul-int/lit8 v1, v1, 9
    div-int/2addr v1, v2
  .line 230
    if-le v0, v1, :L11
    move v0, v1
  :L11
  .line 231
    const v1, 2131361970
    invoke-virtual { p0, v1 }, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;
    move-result-object v2
  .line 232
    instance-of v3, v2, Ljava/lang/Integer;
    if-eqz v3, :L12
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    if-gt v0, v2, :L12
    return-void
  :L12
  .line 233
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { p0, v1, v2 }, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V
  .line 234
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setWidth(I)V
  .line 235
    return-void
  :L13
  .line 207
    return-void
.end method

.method private static text(Landroid/view/View;II)V
  .registers 3
  .line 587
    invoke-virtual { p0, p1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 588
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setTextColor(I)V
  :L0
  .line 589
    return-void
.end method

.method public static up()Z
  .catchall { :L0 .. :L6 } :L5
  .registers 4
  .line 78
    sget-object v0, Lcom/innioasis/ipp/Loading;->SEEN:Ljava/util/WeakHashMap;
    monitor-enter v0
  :L0
  .line 79
    invoke-virtual { v0 }, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L1
  .line 80
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L4
  .line 81
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
  .line 82
    instance-of v3, v2, Landroid/app/Dialog;
    if-eqz v3, :L1
    move-object v3, v2
    check-cast v3, Landroid/app/Dialog;
    invoke-virtual { v3 }, Landroid/app/Dialog;->isShowing()Z
    move-result v3
    if-nez v3, :L2
    goto :L1
  :L2
  .line 83
    check-cast v2, Landroid/app/Dialog;
    invoke-virtual { v2 }, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object v2
  .line 84
    if-eqz v2, :L3
    invoke-virtual { v2 }, Landroid/view/Window;->peekDecorView()Landroid/view/View;
    move-result-object v3
    if-eqz v3, :L3
  .line 85
    invoke-virtual { v2 }, Landroid/view/Window;->peekDecorView()Landroid/view/View;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/View;->getVisibility()I
    move-result v2
    if-nez v2, :L3
  .line 86
    monitor-exit v0
    const/4 v0, 1
    return v0
  :L3
  .line 88
    goto :L1
  :L4
  .line 89
    monitor-exit v0
  .line 90
    const/4 v0, 0
    return v0
  :L5
  .line 89
    move-exception v1
    monitor-exit v0
  :L6
    goto :L8
  :L7
    throw v1
  :L8
    goto :L7
.end method

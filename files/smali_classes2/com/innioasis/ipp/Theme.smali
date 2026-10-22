.class public final Lcom/innioasis/ipp/Theme;
.super Ljava/lang/Object;
.source "Theme.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Theme$Covers;
  }
.end annotation

.field private final static ACCENT:I = -12779554

.field private final static CACHE:Ljava/util/HashMap;

.field private final static CAPTION:F = 1.35F

.field private final static COVER_H:I = 60

.field private final static COVER_W:I = 80

.field private final static HALF:I = 128

.field private final static MENU_SEL_STOCK:I = -16714241

.field private final static TILE_FRAME:I = -13187329

.field private final static TILE_INSET:I = 6

.field private final static TILE_TEXT:I = -855638017

.field private final static TRACK_ALPHA:I = 101

.field private final static covers:Ljava/util/Hashtable;

.field private static coversFor:Ljava/lang/ref/WeakReference;

.field private static fileIconsFor:Ljava/lang/String;

.field private static fitFor:I

.field private static fitSide:I

.field private static folderIcon:Z

.field private static menuPainted:Ljava/lang/Boolean;

.field private static menuPaintedFor:Ljava/lang/String;

.field private static menuProbe:Landroid/view/View;

.field private static menuSel:I

.field private static menuSelFor:Ljava/lang/String;

.field private static menuWatch:Ljava/lang/Runnable;

.field private static musicIcon:Z

.field private static painted:Ljava/lang/Boolean;

.field private static paintedFor:Ljava/lang/String;

.field private static probe:Landroid/view/View;

.field private static watch:Ljava/lang/Runnable;

.method static constructor <clinit>()V
  .registers 2
  .line 48
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Theme;->CACHE:Ljava/util/HashMap;
  .line 420
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Theme;->fitFor:I
  .line 507
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Theme;->covers:Ljava/util/Hashtable;
  .line 510
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Theme;->coversFor:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 46
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/util/Hashtable;
  .registers 1
  .line 46
    sget-object v0, Lcom/innioasis/ipp/Theme;->covers:Ljava/util/Hashtable;
    return-object v0
.end method

.method public static bootReady()Z
  .catchall { :L0 .. :L5 } :L8
  .registers 5
  :L0
  .line 62
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v0
  .line 63
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 64
    const/4 v2, 1
    const/4 v3, 0
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-gtz v0, :L2
  :L1
    if-eqz v1, :L3
    const-string v0, "key_tone_sound"
    const-string v4, ""
  .line 65
    invoke-static { v1, v0, v4 }, Lcom/innioasis/ipp/Prefs;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L3
  :L2
    const/4 v0, 1
    goto :L4
  :L3
    const/4 v0, 0
  :L4
  .line 66
    if-eqz v0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Theme;->cardMounted()Z
    move-result v0
  :L5
    if-eqz v0, :L6
    goto :L7
  :L6
    const/4 v2, 0
  :L7
    return v2
  :L8
  .line 67
    move-exception v0
  .line 68
    invoke-static { }, Lcom/innioasis/ipp/Theme;->cardMounted()Z
    move-result v0
    return v0
.end method

.method public static brightnessBar(Landroid/widget/ProgressBar;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 8
  .line 336
    if-nez p0, :L0
    return-void
  :L0
  .line 337
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result v0
  .line 338
    if-nez v0, :L1
    return-void
  :L1
  .line 339
    invoke-virtual { p0 }, Landroid/widget/ProgressBar;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v2, 0x41200000
    mul-float v1, v1, v2
  .line 340
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v2 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 341
    invoke-virtual { v2, v1 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 342
    const/4 v3, 0
    invoke-virtual { v2, v3 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 343
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v4 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 344
    invoke-virtual { v4, v1 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 345
    const/high16 v1, 0xFF000000
    or-int/2addr v1, v0
    invoke-virtual { v4, v1 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 346
    new-instance v1, Landroid/graphics/drawable/ClipDrawable;
    const/4 v5, 3
    const/4 v6, 1
    invoke-direct { v1, v4, v5, v6 }, Landroid/graphics/drawable/ClipDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V
  .line 348
    new-instance v4, Landroid/graphics/drawable/LayerDrawable;
    const/4 v5, 2
    new-array v5, v5, [Landroid/graphics/drawable/Drawable;
    aput-object v2, v5, v3
    aput-object v1, v5, v6
    invoke-direct { v4, v5 }, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
  .line 350
    const/high16 v1, 0x01020000
    invoke-virtual { v4, v3, v1 }, Landroid/graphics/drawable/LayerDrawable;->setId(II)V
  .line 351
    const v1, 16908301
    invoke-virtual { v4, v6, v1 }, Landroid/graphics/drawable/LayerDrawable;->setId(II)V
  .line 352
    invoke-virtual { p0, v4 }, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 353
    invoke-virtual { p0 }, Landroid/widget/ProgressBar;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    instance-of v1, v1, Landroid/view/ViewGroup;
    if-eqz v1, :L4
  .line 354
    invoke-virtual { p0 }, Landroid/widget/ProgressBar;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroid/view/ViewGroup;
  .line 355
    nop
  :L2
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v3, v1, :L4
  .line 356
    invoke-virtual { p0, v3 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 357
    invoke-virtual { v1 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
    const-class v4, Landroid/view/View;
    if-ne v2, v4, :L3
  .line 358
    const v2, 16777215
    and-int/2addr v2, v0
    const/high16 v4, 0x65000000
    or-int/2addr v2, v4
    invoke-virtual { v1, v2 }, Landroid/view/View;->setBackgroundColor(I)V
  :L3
  .line 355
    add-int/lit8 v3, v3, 1
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

.method public static cardMounted()Z
  .catchall { :L1 .. :L2 } :L15
  .catchall { :L2 .. :L4 } :L14
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L17 .. :L18 } :L19
  .registers 5
  .line 73
    sget-object v0, Lcom/innioasis/y1/utils/SDReceiver;->Companion:Lcom/innioasis/y1/utils/SDReceiver$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SDReceiver$Companion;->isSdcard()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 74
    nop
  .line 76
    const/4 v0, 0
  :L1
    new-instance v2, Ljava/io/BufferedReader;
    new-instance v3, Ljava/io/FileReader;
    const-string v4, "/proc/mounts"
    invoke-direct { v3, v4 }, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    invoke-direct { v2, v3 }, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
  :L2
  .line 77
    const-string v0, " /storage/sdcard0 "
  :L3
  .line 78
    invoke-virtual { v2 }, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v3
    if-eqz v3, :L9
  .line 79
    invoke-virtual { v3, v0 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v3
  :L4
    if-ltz v3, :L3
  .line 85
    nop
  :L5
  .line 87
    invoke-virtual { v2 }, Ljava/io/BufferedReader;->close()V
  :L6
  .line 89
    goto :L8
  :L7
  .line 88
    move-exception v0
  :L8
  .line 79
    const/4 v0, 1
    return v0
  :L9
  .line 81
    nop
  .line 85
    nop
  :L10
  .line 87
    invoke-virtual { v2 }, Ljava/io/BufferedReader;->close()V
  :L11
  .line 89
    goto :L13
  :L12
  .line 88
    move-exception v0
  :L13
  .line 81
    return v1
  :L14
  .line 82
    move-exception v0
    move-object v0, v2
    goto :L16
  :L15
    move-exception v2
  :L16
  .line 83
    nop
  .line 85
    if-eqz v0, :L20
  :L17
  .line 87
    invoke-virtual { v0 }, Ljava/io/BufferedReader;->close()V
  :L18
  .line 89
    goto :L20
  :L19
  .line 88
    move-exception v0
  :L20
  .line 83
    return v1
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 2
  .line 297
    if-nez p0, :L1
    if-nez p1, :L0
    const/4 p0, 1
    goto :L2
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
  :L2
    return p0
.end method

.method public static focusCard(Landroidx/cardview/widget/CardView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 305
    if-nez p0, :L0
    return-void
  :L0
  .line 307
    invoke-virtual { p0 }, Landroidx/cardview/widget/CardView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Theme;->focusColor(Landroid/content/Context;)I
    move-result v0
    invoke-virtual { p0, v0 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  :L1
  .line 309
    goto :L3
  :L2
  .line 308
    move-exception p0
  :L3
  .line 310
    return-void
.end method

.method static focusColor(Landroid/content/Context;)I
  .registers 4
  .line 314
    new-instance v0, Landroid/widget/TextView;
    invoke-direct { v0, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 315
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v1, -12779554
    const/4 v2, 1
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 316
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    return p0
.end method

.method public static fullHint(Landroid/widget/ImageView;Landroid/widget/TextView;)V
  .registers 2
  .line 396
    if-nez p1, :L0
    return-void
  :L0
  .line 397
    invoke-static { p1 }, Lcom/innioasis/ipp/Theme;->tileName(Landroid/widget/TextView;)V
  .line 398
    if-eqz p0, :L1
    invoke-virtual { p1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L1
  .line 399
    return-void
.end method

.method public static fullShown(Landroid/view/View;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 372
    if-eqz p0, :L7
  :L0
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v0, v0, Landroid/view/View;
    if-nez v0, :L1
    goto :L7
  :L1
  .line 373
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    check-cast v0, Landroid/view/View;
    const v1, 2131362310
    invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 374
    if-eqz v0, :L4
  .line 375
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result p0
    if-nez p0, :L2
    const/4 p0, 4
    goto :L3
  :L2
    const/4 p0, 0
  :L3
    invoke-virtual { v0, p0 }, Landroid/view/View;->setVisibility(I)V
  :L4
  .line 378
    goto :L6
  :L5
  .line 377
    move-exception p0
  :L6
  .line 379
    return-void
  :L7
  .line 372
    return-void
.end method

.method public static hasFileIcon(Z)Z
  .catchall { :L0 .. :L7 } :L8
  .registers 6
  .line 205
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v1
  .line 206
    sget-object v2, Lcom/innioasis/ipp/Theme;->fileIconsFor:Ljava/lang/String;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Theme;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L5
  .line 207
    nop
  .line 208
    if-eqz v1, :L3
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
    if-eqz v2, :L3
  .line 209
    new-instance v2, Ljava/io/File;
    const-string v3, "/storage/sdcard0/Themes"
    invoke-direct { v2, v3, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  .line 210
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->getConfig(Ljava/lang/String;)Lcom/innioasis/y1/theme/ThemeConfig;
    move-result-object v3
  .line 211
    if-nez v3, :L1
    const/4 v3, 0
    goto :L2
  :L1
    invoke-virtual { v3 }, Lcom/innioasis/y1/theme/ThemeConfig;->getFileConfig()Lcom/innioasis/y1/theme/config/FileConfig;
    move-result-object v3
  :L2
  .line 212
    if-eqz v3, :L3
  .line 213
    invoke-virtual { v3 }, Lcom/innioasis/y1/theme/config/FileConfig;->getFolderIcon()Ljava/lang/String;
    move-result-object v4
    invoke-static { v2, v4 }, Lcom/innioasis/ipp/Theme;->shipped(Ljava/io/File;Ljava/lang/String;)Z
    move-result v4
  .line 214
    invoke-virtual { v3 }, Lcom/innioasis/y1/theme/config/FileConfig;->getMusicIcon()Ljava/lang/String;
    move-result-object v3
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Theme;->shipped(Ljava/io/File;Ljava/lang/String;)Z
    move-result v2
    goto :L4
  :L3
  .line 217
    const/4 v2, 0
    const/4 v4, 0
  :L4
    sput-boolean v4, Lcom/innioasis/ipp/Theme;->folderIcon:Z
  .line 218
    sput-boolean v2, Lcom/innioasis/ipp/Theme;->musicIcon:Z
  .line 219
    sput-object v1, Lcom/innioasis/ipp/Theme;->fileIconsFor:Ljava/lang/String;
  :L5
  .line 221
    if-eqz p0, :L6
    sget-boolean p0, Lcom/innioasis/ipp/Theme;->folderIcon:Z
    goto :L7
  :L6
    sget-boolean p0, Lcom/innioasis/ipp/Theme;->musicIcon:Z
  :L7
    return p0
  :L8
  .line 222
    move-exception p0
  .line 223
    return v0
.end method

.method private static height(Landroid/view/View;I)V
  .registers 4
  .line 479
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 480
    if-eqz v0, :L1
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v1, p1, :L0
    goto :L1
  :L0
  .line 481
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 482
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 483
    return-void
  :L1
  .line 480
    return-void
.end method

.method static landed(Landroid/view/View;)V
  .registers 3
  .line 183
    if-nez p0, :L0
    return-void
  :L0
  .line 185
    sget-object v0, Lcom/innioasis/ipp/Theme;->probe:Landroid/view/View;
    const/4 v1, 0
    if-ne p0, v0, :L1
  .line 186
    sput-object v1, Lcom/innioasis/ipp/Theme;->painted:Ljava/lang/Boolean;
  .line 187
    sget-object p0, Lcom/innioasis/ipp/Theme;->watch:Ljava/lang/Runnable;
    goto :L2
  :L1
  .line 188
    sget-object v0, Lcom/innioasis/ipp/Theme;->menuProbe:Landroid/view/View;
    if-ne p0, v0, :L4
  .line 189
    sput-object v1, Lcom/innioasis/ipp/Theme;->menuPainted:Ljava/lang/Boolean;
  .line 190
    sget-object p0, Lcom/innioasis/ipp/Theme;->menuWatch:Ljava/lang/Runnable;
  :L2
  .line 195
    if-eqz p0, :L3
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    invoke-virtual { v0, p0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L3
  .line 196
    return-void
  :L4
  .line 192
    return-void
.end method

.method public static menuRowsPainted()Z
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 143
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v1
  .line 144
    sget-object v2, Lcom/innioasis/ipp/Theme;->menuPainted:Ljava/lang/Boolean;
    if-eqz v2, :L1
    sget-object v2, Lcom/innioasis/ipp/Theme;->menuPaintedFor:Ljava/lang/String;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Theme;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L1
    sget-object v1, Lcom/innioasis/ipp/Theme;->menuPainted:Ljava/lang/Boolean;
    invoke-virtual { v1 }, Ljava/lang/Boolean;->booleanValue()Z
    move-result v0
    return v0
  :L1
  .line 145
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
  .line 146
    if-nez v2, :L2
    return v0
  :L2
  .line 147
    sget-object v3, Lcom/innioasis/ipp/Theme;->menuProbe:Landroid/view/View;
    if-nez v3, :L3
    new-instance v3, Landroid/view/View;
    invoke-direct { v3, v2 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    sput-object v3, Lcom/innioasis/ipp/Theme;->menuProbe:Landroid/view/View;
  :L3
  .line 148
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget-object v3, Lcom/innioasis/ipp/Theme;->menuProbe:Landroid/view/View;
    invoke-virtual { v2, v3, v0, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuItemSetBackground(Landroid/view/View;IZ)V
  .line 149
    sget-object v2, Lcom/innioasis/ipp/Theme;->menuProbe:Landroid/view/View;
    invoke-virtual { v2 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Theme;->opaque(Landroid/graphics/drawable/Drawable;)Z
    move-result v2
  .line 150
    invoke-static { v2 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v3
    sput-object v3, Lcom/innioasis/ipp/Theme;->menuPainted:Ljava/lang/Boolean;
  .line 151
    sput-object v1, Lcom/innioasis/ipp/Theme;->menuPaintedFor:Ljava/lang/String;
  :L4
  .line 152
    return v2
  :L5
  .line 153
    move-exception v1
  .line 154
    return v0
.end method

.method public static menuSelectedColor()I
  .catchall { :L0 .. :L9 } :L10
  .registers 5
  .line 241
    const v0, -16714241
  :L0
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v1
  .line 242
    sget-object v2, Lcom/innioasis/ipp/Theme;->menuSelFor:Ljava/lang/String;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Theme;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L8
  .line 243
    nop
  .line 244
    if-eqz v1, :L6
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
    if-eqz v2, :L6
  .line 245
    new-instance v2, Ljava/io/File;
    const-string v3, "/storage/sdcard0/Themes"
    invoke-direct { v2, v3, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
  .line 246
    sget-object v3, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v2 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/theme/ThemeManager;->getConfig(Ljava/lang/String;)Lcom/innioasis/y1/theme/ThemeConfig;
    move-result-object v3
  .line 247
    const/4 v4, 0
    if-nez v3, :L1
    move-object v3, v4
    goto :L2
  :L1
    invoke-virtual { v3 }, Lcom/innioasis/y1/theme/ThemeConfig;->getMenuConfig()Lcom/innioasis/y1/theme/config/MenuConfig;
    move-result-object v3
  :L2
  .line 248
    if-nez v3, :L3
    goto :L4
  :L3
    invoke-virtual { v3 }, Lcom/innioasis/y1/theme/config/MenuConfig;->getMenuItemSelectedBackground()Ljava/lang/String;
    move-result-object v4
  :L4
  .line 249
    invoke-static { v2, v4 }, Lcom/innioasis/ipp/Theme;->shipped(Ljava/io/File;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L5
  .line 250
    const/4 v2, 0
    goto :L7
  :L5
  .line 251
    if-eqz v4, :L6
  .line 252
    invoke-static { v4 }, Lcom/innioasis/ipp/Theme;->parseColor(Ljava/lang/String;)Ljava/lang/Integer;
    move-result-object v2
  .line 253
    if-eqz v2, :L6
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    goto :L7
  :L6
  .line 256
    const v2, -16714241
  :L7
    sput v2, Lcom/innioasis/ipp/Theme;->menuSel:I
  .line 257
    sput-object v1, Lcom/innioasis/ipp/Theme;->menuSelFor:Ljava/lang/String;
  :L8
  .line 259
    sget v0, Lcom/innioasis/ipp/Theme;->menuSel:I
  :L9
    return v0
  :L10
  .line 260
    move-exception v1
  .line 261
    return v0
.end method

.method private static opaque(Landroid/graphics/drawable/Drawable;)Z
  .registers 12
  .line 275
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 276
    instance-of v1, p0, Landroid/graphics/drawable/ColorDrawable;
    const/16 v2, 128
    const/4 v3, 1
    if-eqz v1, :L2
    check-cast p0, Landroid/graphics/drawable/ColorDrawable;
    invoke-virtual { p0 }, Landroid/graphics/drawable/ColorDrawable;->getColor()I
    move-result p0
    invoke-static { p0 }, Landroid/graphics/Color;->alpha(I)I
    move-result p0
    if-lt p0, v2, :L1
    const/4 v0, 1
  :L1
    return v0
  :L2
  .line 277
    instance-of v1, p0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L13
  .line 278
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object p0
  .line 279
    if-eqz p0, :L12
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v1
    if-eqz v1, :L3
    goto :L12
  :L3
  .line 280
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->hasAlpha()Z
    move-result v1
    if-nez v1, :L4
    return v3
  :L4
  .line 281
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v1
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v4
  .line 282
    if-lez v1, :L11
    if-gtz v4, :L5
    goto :L11
  :L5
  .line 284
    nop
  .line 285
    const/4 v5, 0
    const/4 v6, 0
  :L6
    const/4 v7, 3
    if-ge v5, v7, :L9
  .line 286
    const/4 v8, 0
  :L7
    if-ge v8, v7, :L8
  .line 287
    add-int/lit8 v9, v1, -1
    mul-int v9, v9, v8
    div-int/lit8 v9, v9, 2
    add-int/lit8 v10, v4, -1
    mul-int v10, v10, v5
    div-int/lit8 v10, v10, 2
    invoke-virtual { p0, v9, v10 }, Landroid/graphics/Bitmap;->getPixel(II)I
    move-result v9
    invoke-static { v9 }, Landroid/graphics/Color;->alpha(I)I
    move-result v9
    add-int/2addr v6, v9
  .line 286
    add-int/lit8 v8, v8, 1
    goto :L7
  :L8
  .line 285
    add-int/lit8 v5, v5, 1
    goto :L6
  :L9
  .line 290
    div-int/lit8 v6, v6, 9
    if-lt v6, v2, :L10
    const/4 v0, 1
  :L10
    return v0
  :L11
  .line 282
    return v0
  :L12
  .line 279
    return v0
  :L13
  .line 293
    invoke-virtual { p0 }, Landroid/graphics/drawable/Drawable;->getOpacity()I
    move-result p0
    const/4 v1, -1
    if-ne p0, v1, :L14
    const/4 v0, 1
  :L14
    return v0
.end method

.method public static parseColor(Ljava/lang/String;)Ljava/lang/Integer;
  .catchall { :L2 .. :L3 } :L4
  .registers 4
  .line 96
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 97
    sget-object v1, Lcom/innioasis/ipp/Theme;->CACHE:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L1
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/Integer;
    return-object p0
  :L1
  .line 98
    nop
  .line 99
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v1
    if-eqz v1, :L5
  :L2
  .line 101
    invoke-static { p0 }, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    move-result v1
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
  :L3
  .line 104
    goto :L5
  :L4
  .line 102
    move-exception v1
  .line 103
    nop
  :L5
  .line 106
    sget-object v1, Lcom/innioasis/ipp/Theme;->CACHE:Ljava/util/HashMap;
    invoke-virtual { v1, p0, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 107
    return-object v0
.end method

.method public static rowsPainted()Z
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 117
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1 }, Lcom/innioasis/y1/theme/ThemeManager;->getThemeName()Ljava/lang/String;
    move-result-object v1
  .line 119
    sget-object v2, Lcom/innioasis/ipp/Theme;->painted:Ljava/lang/Boolean;
    if-eqz v2, :L1
    sget-object v2, Lcom/innioasis/ipp/Theme;->paintedFor:Ljava/lang/String;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Theme;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L1
    sget-object v1, Lcom/innioasis/ipp/Theme;->painted:Ljava/lang/Boolean;
    invoke-virtual { v1 }, Ljava/lang/Boolean;->booleanValue()Z
    move-result v0
    return v0
  :L1
  .line 120
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
  .line 121
    if-nez v2, :L2
    return v0
  :L2
  .line 122
    sget-object v3, Lcom/innioasis/ipp/Theme;->probe:Landroid/view/View;
    if-nez v3, :L3
    new-instance v3, Landroid/view/View;
    invoke-direct { v3, v2 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
    sput-object v3, Lcom/innioasis/ipp/Theme;->probe:Landroid/view/View;
  :L3
  .line 123
    sget-object v2, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    sget-object v3, Lcom/innioasis/ipp/Theme;->probe:Landroid/view/View;
    const v4, 2131231044
    invoke-virtual { v2, v3, v4, v0 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 124
    sget-object v2, Lcom/innioasis/ipp/Theme;->probe:Landroid/view/View;
    invoke-virtual { v2 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Theme;->opaque(Landroid/graphics/drawable/Drawable;)Z
    move-result v2
  .line 125
    invoke-static { v2 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v3
    sput-object v3, Lcom/innioasis/ipp/Theme;->painted:Ljava/lang/Boolean;
  .line 126
    sput-object v1, Lcom/innioasis/ipp/Theme;->paintedFor:Ljava/lang/String;
  :L4
  .line 127
    return v2
  :L5
  .line 128
    move-exception v1
  .line 129
    return v0
.end method

.method public static settingRow(Lcom/innioasis/y1/databinding/ItemSettingBinding;Z)V
  .catchall { :L2 .. :L3 } :L4
  .registers 5
  .line 321
    if-nez p0, :L0
    return-void
  :L0
  .line 323
    if-eqz p1, :L1
    const v0, -12779554
    goto :L2
  :L1
    const/4 v0, -1
  :L2
  .line 324
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object v2, p0, Lcom/innioasis/y1/databinding/ItemSettingBinding;->title:Landroid/widget/TextView;
    invoke-virtual { v1, v2, v0, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 325
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ItemSettingBinding;->text:Landroid/widget/TextView;
    invoke-virtual { v1, p0, v0, p1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L3
  .line 327
    goto :L5
  :L4
  .line 326
    move-exception p0
  :L5
  .line 328
    return-void
.end method

.method private static shipped(Ljava/io/File;Ljava/lang/String;)Z
  .registers 3
  .line 269
    if-eqz p1, :L0
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-eqz v0, :L0
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p0, p1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static side(Landroid/view/View;I)V
  .registers 4
  .line 471
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 472
    if-eqz v0, :L1
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-ne v1, p1, :L0
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v1, p1, :L0
    goto :L1
  :L0
  .line 473
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 474
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 475
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 476
    return-void
  :L1
  .line 472
    return-void
.end method

.method public static tileCardSide()I
  .registers 2
  .line 408
    sget v0, Lcom/innioasis/ipp/Theme;->fitSide:I
    const/4 v1, 6
    if-le v0, v1, :L0
    sub-int/2addr v0, v1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method public static tileCover(Landroid/widget/ImageView;Ljava/lang/String;)Z
  .registers 6
  .line 492
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 493
    const/4 v1, 0
    if-nez p1, :L1
    move-object v2, v1
    goto :L2
  :L1
    sget-object v2, Lcom/innioasis/ipp/Theme;->covers:Ljava/util/Hashtable;
    invoke-virtual { v2, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/graphics/Bitmap;
  :L2
  .line 494
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;
    move-result-object v3
  .line 495
    if-eqz v3, :L5
    invoke-virtual { v3, p1 }, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L3
    goto :L5
  :L3
  .line 497
    if-eqz v2, :L8
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v1
    instance-of v1, v1, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L4
  .line 498
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v1
    check-cast v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v1 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v1
    if-eq v1, v2, :L8
  :L4
  .line 500
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-direct { v1, v3, v2 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    goto :L8
  :L5
  .line 496
    if-nez v2, :L6
    goto :L7
  :L6
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-direct { v1, v3, v2 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
  :L7
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  :L8
  .line 502
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V
  .line 503
    if-eqz v2, :L9
    const/4 v0, 1
  :L9
    return v0
.end method

.method public static tileFit(Landroid/view/View;Landroid/view/View;Landroid/widget/TextView;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 9
  .line 428
    if-eqz p0, :L8
    if-eqz p1, :L8
    if-nez p2, :L0
    goto :L8
  :L0
  .line 430
    invoke-virtual { p2 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
  .line 431
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I
  .line 432
    invoke-virtual { v0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v2, 2131165782
    invoke-virtual { v0, v2 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v0
    float-to-int v0, v0
    sub-int/2addr v1, v0
  .line 433
    invoke-virtual { p2 }, Landroid/widget/TextView;->getTextSize()F
    move-result v0
    const v2, 1068289229
    mul-float v0, v0, v2
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 434
    nop
  .line 435
    invoke-virtual { p2 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    check-cast v2, Landroid/view/View;
  .line 436
    const/4 v3, 0
    if-eqz v2, :L1
    invoke-virtual { v2 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v4
    instance-of v4, v4, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v4, :L1
  .line 437
    invoke-virtual { v2 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 438
    iget v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    add-int/2addr v4, v2
    goto :L2
  :L1
  .line 440
    const/4 v4, 0
  :L2
    mul-int/lit16 v2, v1, 1000
    add-int/2addr v2, v0
  .line 441
    sget v5, Lcom/innioasis/ipp/Theme;->fitFor:I
    if-eq v2, v5, :L3
  .line 442
    sput v2, Lcom/innioasis/ipp/Theme;->fitFor:I
  .line 443
    div-int/lit8 v1, v1, 2
    sub-int/2addr v1, v0
    sub-int/2addr v1, v4
    sput v1, Lcom/innioasis/ipp/Theme;->fitSide:I
  :L3
  .line 445
    sget v1, Lcom/innioasis/ipp/Theme;->fitSide:I
    if-gtz v1, :L4
    return-void
  :L4
  .line 447
    invoke-virtual { p2, v3 }, Landroid/widget/TextView;->setIncludeFontPadding(Z)V
  .line 448
    invoke-static { p2, v0 }, Lcom/innioasis/ipp/Theme;->height(Landroid/view/View;I)V
  .line 449
    sget p2, Lcom/innioasis/ipp/Theme;->fitSide:I
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Theme;->side(Landroid/view/View;I)V
  .line 450
    sget p0, Lcom/innioasis/ipp/Theme;->fitSide:I
    add-int/lit8 p0, p0, -6
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Theme;->side(Landroid/view/View;I)V
  :L5
  .line 452
    goto :L7
  :L6
  .line 451
    move-exception p0
  :L7
  .line 453
    return-void
  :L8
  .line 428
    return-void
.end method

.method public static tileFrame()I
  .registers 1
  .line 402
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result v0
  .line 403
    if-nez v0, :L0
    const v0, -13187329
  :L0
    return v0
.end method

.method public static tileGrid(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 460
    if-nez p0, :L0
    return-void
  :L0
  .line 462
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I
  .line 463
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v2, 2131165782
    invoke-virtual { v1, v2 }, Landroid/content/res/Resources;->getDimension(I)F
    move-result v1
    float-to-int v1, v1
    sub-int/2addr v0, v1
  .line 464
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingLeft()I
    move-result v1
    rem-int/lit8 v0, v0, 2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingRight()I
    move-result v2
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v3
    invoke-virtual { p0, v1, v0, v2, v3 }, Landroidx/recyclerview/widget/RecyclerView;->setPadding(IIII)V
  :L1
  .line 466
    goto :L3
  :L2
  .line 465
    move-exception p0
  :L3
  .line 467
    return-void
.end method

.method public static tileName(Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 387
    if-nez p0, :L0
    return-void
  :L0
  .line 389
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v1, -855638017
    const/4 v2, 0
    invoke-virtual { v0, p0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L1
  .line 391
    goto :L3
  :L2
  .line 390
    move-exception p0
  :L3
  .line 392
    return-void
.end method

.method public static tilesAhead(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L9 } :L12
  .registers 7
  .line 518
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  :L1
  .line 519
    instance-of v0, p0, Lcom/chad/library/adapter/base/BaseQuickAdapter;
    if-eqz v0, :L11
    sget-object v0, Lcom/innioasis/ipp/Theme;->coversFor:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p0, :L2
    goto/16 :L11
  :L2
  .line 520
    move-object v0, p0
    check-cast v0, Lcom/chad/library/adapter/base/BaseQuickAdapter;
    invoke-virtual { v0 }, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;
    move-result-object v0
  .line 521
    if-eqz v0, :L10
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L3
    goto :L10
  :L3
  .line 522
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Theme;->coversFor:Ljava/lang/ref/WeakReference;
  .line 523
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
  .line 524
    const/4 v1, 0
    const/4 v2, 0
  :L4
    if-eqz v0, :L8
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 525
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 526
    instance-of v4, v3, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;
    if-nez v4, :L5
    goto :L7
  :L5
  .line 527
    check-cast v3, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;
  .line 528
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;->getPicturePath()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/String;->length()I
    move-result v4
    if-eqz v4, :L7
    sget-object v4, Lcom/innioasis/ipp/Theme;->covers:Ljava/util/Hashtable;
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    if-eqz v4, :L6
    goto :L7
  :L6
  .line 529
    const/4 v4, 2
    new-array v4, v4, [Ljava/lang/String;
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;->getPath()Ljava/lang/String;
    move-result-object v5
    aput-object v5, v4, v1
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/theme/ThemeListActivity$Item;->getPicturePath()Ljava/lang/String;
    move-result-object v3
    const/4 v5, 1
    aput-object v3, v4, v5
    invoke-virtual { p0, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 524
    add-int/lit8 v2, v2, 1
    goto :L4
  :L8
  .line 531
    invoke-virtual { p0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-nez v0, :L9
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Theme$Covers;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Theme$Covers;-><init>(Ljava/util/List;)V
    const-string p0, "ipp-theme-covers"
    invoke-direct { v0, v1, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  :L9
  .line 533
    goto :L13
  :L10
  .line 521
    return-void
  :L11
  .line 519
    return-void
  :L12
  .line 532
    move-exception p0
  :L13
  .line 534
    return-void
.end method

.method public static unwatchRows(Ljava/lang/Runnable;)V
  .registers 2
  .line 175
    sget-object v0, Lcom/innioasis/ipp/Theme;->watch:Ljava/lang/Runnable;
    if-ne v0, p0, :L0
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Theme;->watch:Ljava/lang/Runnable;
  :L0
  .line 176
    return-void
.end method

.method public static watchMenuRows(Ljava/lang/Runnable;)V
  .registers 1
  .line 165
    sput-object p0, Lcom/innioasis/ipp/Theme;->menuWatch:Ljava/lang/Runnable;
  .line 166
    return-void
.end method

.method public static watchRows(Ljava/lang/Runnable;)V
  .registers 1
  .line 170
    sput-object p0, Lcom/innioasis/ipp/Theme;->watch:Ljava/lang/Runnable;
  .line 171
    return-void
.end method

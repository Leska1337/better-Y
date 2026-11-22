.class public final Lcom/innioasis/ipp/Rows;
.super Ljava/lang/Object;
.source "Rows.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Rows$Flat;,
    Lcom/innioasis/ipp/Rows$Pic;
  }
.end annotation

.field final static BLANK:I = -1

.field public final static FLAT:Ljava/lang/String; = "ipp_flat"

.field private final static IMG_SPARE:Ljava/util/WeakHashMap;

.field private final static INDEX_GAP_DIP:I = 8

.field private final static INDEX_MAX_DIP:I = 120

.field private final static INDEX_MIN_DIP:I = 40

.field private static flatWatch:Ljava/lang/Runnable;

.field private static indexDigit:F

.field private static indexFont:Ljava/lang/Object;

.field private static indexHash:F

.field private static indexSize:F

.method static constructor <clinit>()V
  .registers 1
  .line 555
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Rows;->IMG_SPARE:Ljava/util/WeakHashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 35
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static arrowOf(Landroid/view/View;)Landroid/view/View;
  .registers 2
  .line 146
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->findArrow(Landroid/view/View;)Landroid/view/View;
    move-result-object v0
  .line 147
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 148
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 149
    instance-of v0, p0, Landroid/view/View;
    if-eqz v0, :L1
    check-cast p0, Landroid/view/View;
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->findArrow(Landroid/view/View;)Landroid/view/View;
    move-result-object p0
    goto :L2
  :L1
    const/4 p0, 0
  :L2
    return-object p0
.end method

.method public static bg(Landroid/view/View;Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L8 } :L9
  .registers 5
  .line 503
    if-eqz p0, :L11
    if-nez p1, :L0
    goto :L11
  :L0
  .line 505
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 506
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v1, :L6
  .line 507
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 508
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->holds(Landroid/graphics/Bitmap;)Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 510
    iget v1, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
    const/4 v2, -1
    if-ne v1, v2, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->owns(Landroid/view/View;)Z
    move-result v1
    if-eqz v1, :L2
    return-void
  :L2
  .line 511
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->spareFor(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/BitmapDrawable;
    move-result-object v1
  .line 512
    if-eqz v1, :L4
  :L3
    goto :L5
  :L4
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Ends;->of(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/BitmapDrawable;
    move-result-object v1
    goto :L3
  :L5
    const/4 p0, 0
    invoke-virtual { v0, v1, p0 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  .line 513
    return-void
  :L6
  .line 515
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L7
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    if-ne v0, p1, :L7
    return-void
  :L7
  .line 516
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Ends;->of(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/BitmapDrawable;
    move-result-object p1
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L8
  .line 518
    goto :L10
  :L9
  .line 517
    move-exception p0
  :L10
  .line 519
    return-void
  :L11
  .line 503
    return-void
.end method

.method public static bgRes(Landroid/view/View;I)V
  .catchall { :L0 .. :L7 } :L8
  .registers 4
  .line 525
    if-nez p0, :L0
    return-void
  :L0
  .line 527
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 530
    if-nez p1, :L3
  .line 532
    instance-of p1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz p1, :L1
    move-object p1, v0
    check-cast p1, Lcom/innioasis/ipp/Rows$Flat;
    iget p1, p1, Lcom/innioasis/ipp/Rows$Flat;->res:I
    const/4 v1, -1
    if-ne p1, v1, :L1
    return-void
  :L1
  .line 533
    if-eqz v0, :L2
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundResource(I)V
  :L2
  .line 534
    return-void
  :L3
  .line 536
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v1, :L6
  .line 537
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 538
    iget v1, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
    if-ne v1, p1, :L4
    return-void
  :L4
  .line 540
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->spareFor(I)Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 541
    if-nez v1, :L5
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Ends;->drawable(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;
    move-result-object v1
  :L5
  .line 542
    if-eqz v1, :L6
  .line 543
    invoke-virtual { v0, v1, p1 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  .line 544
    return-void
  :L6
  .line 547
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Ends;->res(Landroid/view/View;I)Z
    move-result v0
    if-nez v0, :L7
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundResource(I)V
  :L7
  .line 549
    goto :L9
  :L8
  .line 548
    move-exception p0
  :L9
  .line 550
    return-void
.end method

.method public static blink(Landroid/view/View;IZ)V
  .catchall { :L0 .. :L8 } :L9
  .registers 6
  .line 88
    if-nez p0, :L0
    return-void
  :L0
  .line 90
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Bar;->blink(Landroid/view/View;Z)Z
    move-result v0
    if-eqz v0, :L1
    return-void
  :L1
  .line 92
    const v0, 2131362091
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 93
    instance-of v1, v0, Landroidx/cardview/widget/CardView;
    const/4 v2, 0
    if-eqz v1, :L3
  .line 94
    check-cast v0, Landroidx/cardview/widget/CardView;
  .line 95
    if-eqz p2, :L2
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileFrame()I
    move-result v2
  :L2
  .line 94
    invoke-virtual { v0, v2 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 96
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/PlGrid;->blinkEdge(Landroid/view/View;Z)V
  .line 97
    return-void
  :L3
  .line 99
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0, p0, p1, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 102
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p1
  .line 103
    if-eqz p2, :L4
    const v0, 2131100252
    goto :L5
  :L4
    const v0, 2131100267
  :L5
    invoke-virtual { p1, v0 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p1
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Rows;->blinkText(Landroid/view/View;IZ)V
  .line 104
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->arrowOf(Landroid/view/View;)Landroid/view/View;
    move-result-object p0
  .line 105
    if-nez p0, :L6
    return-void
  :L6
  .line 106
    const/4 p1, 4
    if-eqz p2, :L7
  .line 107
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-ne p2, p1, :L8
    invoke-virtual { p0, v2 }, Landroid/view/View;->setVisibility(I)V
    goto :L8
  :L7
  .line 109
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-nez p2, :L8
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  :L8
  .line 112
    goto :L10
  :L9
  .line 111
    move-exception p0
  :L10
  .line 113
    return-void
.end method

.method private static blinkText(Landroid/view/View;IZ)V
  .registers 5
  .line 120
    instance-of v0, p0, Landroid/widget/TextView;
    if-eqz v0, :L1
  .line 121
    invoke-virtual { p0 }, Landroid/view/View;->getId()I
    move-result v0
    const v1, 2131362549
    if-eq v0, v1, :L0
  .line 122
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { v0, p0, p1, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L0
  .line 124
    return-void
  :L1
  .line 126
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-nez v0, :L2
    return-void
  :L2
  .line 127
    check-cast p0, Landroid/view/ViewGroup;
  .line 128
    const/4 v0, 0
  :L3
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L4
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1, p1, p2 }, Lcom/innioasis/ipp/Rows;->blinkText(Landroid/view/View;IZ)V
    add-int/lit8 v0, v0, 1
    goto :L3
  :L4
  .line 129
    const p1, 2131362551
    invoke-virtual { p0, p1 }, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;
    move-result-object p1
  .line 130
    const p2, 2131362499
    invoke-virtual { p0, p2 }, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 131
    instance-of p2, p1, Landroid/widget/ImageView;
    if-eqz p2, :L5
    instance-of p2, p0, Landroid/widget/TextView;
    if-eqz p2, :L5
    invoke-virtual { p1 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-nez p2, :L5
  .line 132
    check-cast p1, Landroid/widget/ImageView;
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L5
  .line 134
    return-void
.end method

.method public static bookIndex(Landroid/view/View;I)V
  .catchall { :L1 .. :L3 } :L4
  .registers 4
  .line 256
    if-nez p0, :L0
    return-void
  :L0
  .line 258
    const v0, 2131362558
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 259
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L2
    return-void
  :L2
  .line 260
    move-object v1, v0
    check-cast v1, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->rowColour(Landroid/view/View;)I
    move-result p0
    invoke-virtual { v1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 261
    check-cast v0, Landroid/widget/TextView;
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L3
  .line 263
    goto :L5
  :L4
  .line 262
    move-exception p0
  :L5
  .line 264
    return-void
.end method

.method public static bookMark(Landroid/view/View;ILjava/lang/Object;)V
  .catchall { :L1 .. :L7 } :L8
  .registers 8
  .line 223
    if-nez p0, :L0
    return-void
  :L0
  .line 225
    const v0, 2131362558
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 226
    const v1, 2131362559
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 227
    instance-of v2, v0, Landroid/widget/TextView;
    if-nez v2, :L2
    return-void
  :L2
  .line 228
    check-cast v0, Landroid/widget/TextView;
  .line 229
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->rowColour(Landroid/view/View;)I
    move-result p0
  .line 230
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 231
    nop
  .line 232
    instance-of v2, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v3, 0
    if-eqz v2, :L3
  .line 233
    move-object v2, p2
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v2, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  .line 234
    instance-of v4, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v4, :L3
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p2 }, Lcom/innioasis/ipp/Rows;->playMark(Ljava/lang/String;Ljava/lang/Object;)I
    move-result p2
    goto :L4
  :L3
  .line 236
    const/4 p2, 0
  :L4
    instance-of v2, v1, Landroid/widget/ImageView;
    if-nez v2, :L5
  .line 237
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 238
    return-void
  :L5
  .line 240
    check-cast v1, Landroid/widget/ImageView;
  .line 241
    if-eqz p2, :L6
  .line 242
    invoke-virtual { v1, p2 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 243
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 244
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 245
    const-string p0, ""
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :L7
  :L6
  .line 247
    const/16 p0, 8
    invoke-virtual { v1, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 248
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L7
  .line 251
    goto :L9
  :L8
  .line 250
    move-exception p0
  :L9
  .line 252
    return-void
.end method

.method public static bookRow(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  .line 42
    if-nez p1, :L0
    return-void
  :L0
  .line 44
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const v0, 2131100267
    invoke-virtual { p0, v0 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p0
  .line 45
    const v0, 2131362492
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 46
    instance-of v1, v0, Landroid/widget/TextView;
    const/4 v2, 0
    if-eqz v1, :L1
  .line 47
    check-cast v0, Landroid/widget/TextView;
  .line 48
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->rowPlain(Landroid/widget/TextView;)V
  .line 49
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1, v0, p0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L1
  .line 51
    const v0, 2131362495
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  .line 52
    instance-of v0, p1, Landroid/widget/TextView;
    if-eqz v0, :L2
  .line 53
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast p1, Landroid/widget/TextView;
    invoke-virtual { v0, p1, p0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L2
  .line 56
    goto :L4
  :L3
  .line 55
    move-exception p0
  :L4
  .line 57
    return-void
.end method

.method public static fileLabel(Ljava/io/File;)Ljava/lang/String;
  .registers 2
  .line 138
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 139
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v0
  .line 140
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result p0
    if-eqz p0, :L1
    return-object v0
  :L1
  .line 141
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static fileMark(ILjava/lang/Object;)I
  .registers 4
  .line 189
    instance-of v0, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 190
    move-object v0, p1
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 191
    instance-of v0, p0, Ljava/io/File;
    if-nez v0, :L1
    return v1
  :L1
  .line 192
    check-cast p0, Ljava/io/File;
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Rows;->playMark(Ljava/lang/String;Ljava/lang/Object;)I
    move-result p0
    return p0
.end method

.method public static filePlaying(Landroid/view/View;ILjava/lang/Object;)V
  .catchall { :L1 .. :L7 } :L8
  .registers 6
  .line 164
    if-nez p0, :L0
    return-void
  :L0
  .line 166
    const v0, 2131362550
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 167
    const v1, 2131362159
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 168
    instance-of v2, v0, Landroid/widget/ImageView;
    if-nez v2, :L2
    return-void
  :L2
  .line 169
    check-cast v0, Landroid/widget/ImageView;
  .line 170
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Rows;->fileMark(ILjava/lang/Object;)I
    move-result p1
  .line 171
    const/4 p2, 0
    if-eqz p1, :L6
  .line 172
    const v2, 2131362042
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 173
    instance-of v2, p0, Landroid/widget/TextView;
    if-eqz v2, :L3
  .line 174
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    goto :L4
  :L3
    const/4 p0, -1
  :L4
  .line 175
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 176
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 177
    invoke-virtual { v0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 178
    if-eqz v1, :L5
    const/4 p0, 4
    invoke-virtual { v1, p0 }, Landroid/view/View;->setVisibility(I)V
  :L5
  .line 179
    goto :L7
  :L6
  .line 180
    const/16 p0, 8
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 181
    if-eqz v1, :L7
    invoke-virtual { v1, p2 }, Landroid/view/View;->setVisibility(I)V
  :L7
  .line 184
    goto :L9
  :L8
  .line 183
    move-exception p0
  :L9
  .line 185
    return-void
.end method

.method public static fileRow(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .catchall { :L1 .. :L4 } :L5
  .registers 6
  .line 64
    if-nez p1, :L0
    return-void
  :L0
  .line 66
    const p0, 2131362321
  :L1
    invoke-virtual { p1, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 67
    if-eqz p0, :L2
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/util/Other;->hideV(Landroid/view/View;)V
  :L2
  .line 68
    const p0, 2131362042
    invoke-virtual { p1, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 69
    instance-of v0, p0, Landroid/widget/TextView;
    const/4 v1, 0
    if-eqz v0, :L3
  .line 70
    check-cast p0, Landroid/widget/TextView;
  .line 71
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->rowPlain(Landroid/widget/TextView;)V
  .line 72
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 73
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100267
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 72
    invoke-virtual { v0, p0, v2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L3
  .line 75
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v0, 2131231044
    invoke-virtual { p0, p1, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L4
  .line 77
    goto :L6
  :L5
  .line 76
    move-exception p0
  :L6
  .line 78
    return-void
.end method

.method private static findArrow(Landroid/view/View;)Landroid/view/View;
  .registers 2
  .line 153
    const v0, 2131362321
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 154
    if-nez v0, :L0
    const v0, 2131362144
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L0
  .line 155
    if-nez v0, :L1
    const v0, 2131361881
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 156
    return-object v0
.end method

.method public static flat(Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 418
    if-nez p0, :L0
    return-void
  :L0
  .line 419
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->headerInset(Landroid/view/View;)I
    move-result v0
  .line 420
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 421
    instance-of v2, v1, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v2, :L1
    check-cast v1, Lcom/innioasis/ipp/Rows$Flat;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/Rows$Flat;->inset(I)V
    return-void
  :L1
  .line 422
    if-eqz v1, :L3
    if-gtz v0, :L2
    invoke-virtual { v1 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v2
    if-lez v2, :L3
  :L2
  .line 423
    new-instance v2, Lcom/innioasis/ipp/Rows$Flat;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 424
    invoke-virtual { v2, v0 }, Lcom/innioasis/ipp/Rows$Flat;->inset(I)V
  .line 425
    invoke-virtual { p0, v2 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 428
    goto :L5
  :L4
  .line 427
    move-exception p0
  :L5
  .line 429
    return-void
.end method

.method public static fmMenuValue(Lcom/innioasis/y1/databinding/ItemFmMenuBinding;)V
  .registers 2
  .line 408
    if-nez p0, :L0
    return-void
  :L0
  .line 409
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemFmMenuBinding;->tvItem:Landroid/widget/TextView;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ItemFmMenuBinding;->text:Landroid/widget/TextView;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Rows;->subLine(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .line 410
    return-void
.end method

.method public static genreInfo(Landroid/widget/TextView;Ljava/lang/Object;)Z
  .registers 2
  .line 314
    if-eqz p0, :L0
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTag()Ljava/lang/Object;
    move-result-object p0
    if-ne p0, p1, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static headerInset(Landroid/view/View;)I
  .registers 3
  .line 436
    const v0, 2131362549
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 437
    instance-of v1, v0, Landroid/widget/TextView;
    if-eqz v1, :L1
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 438
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->stripPx(Landroid/view/View;)I
    move-result p0
    return p0
  :L1
  .line 437
    const/4 p0, 0
    return p0
.end method

.method public static img(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 559
    if-eqz p0, :L7
    if-nez p1, :L0
    goto :L7
  :L0
  .line 561
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 562
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L1
    move-object v1, v0
    check-cast v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v1 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v1
    if-ne v1, p1, :L1
    return-void
  :L1
  .line 564
    sget-object v1, Lcom/innioasis/ipp/Rows;->IMG_SPARE:Ljava/util/WeakHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 565
    instance-of v3, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v3, :L2
    invoke-virtual { v1, p0, v0 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 566
    instance-of v0, v2, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :L3
    move-object v0, v2
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    if-ne v0, p1, :L3
  .line 567
    check-cast v2, Landroid/graphics/drawable/Drawable;
    invoke-virtual { p0, v2 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 568
    return-void
  :L3
  .line 570
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L4
  .line 572
    goto :L6
  :L5
  .line 571
    move-exception p0
  :L6
  .line 573
    return-void
  :L7
  .line 559
    return-void
.end method

.method public static indexWidth(Landroid/widget/TextView;Ljava/util/List;Ljava/lang/Object;)V
  .catchall { :L0 .. :L11 } :L13
  .registers 10
  .line 351
    if-nez p0, :L0
    return-void
  :L0
  .line 353
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;
    move-result-object v0
  .line 354
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTextSize()F
    move-result v1
  .line 355
    sget-object v2, Lcom/innioasis/ipp/Rows;->indexFont:Ljava/lang/Object;
    if-ne v0, v2, :L1
    sget v2, Lcom/innioasis/ipp/Rows;->indexSize:F
    cmpl-float v2, v1, v2
    if-eqz v2, :L5
  :L1
  .line 356
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v2
  .line 357
    nop
  .line 358
    const/4 v3, 0
    const/16 v4, 48
  :L2
    const/16 v5, 57
    if-gt v4, v5, :L4
  .line 359
    invoke-static { v4 }, Ljava/lang/String;->valueOf(C)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v2, v5 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v5
  .line 360
    cmpl-float v6, v5, v3
    if-lez v6, :L3
    move v3, v5
  :L3
  .line 358
    add-int/lit8 v4, v4, 1
    int-to-char v4, v4
    goto :L2
  :L4
  .line 362
    sput v3, Lcom/innioasis/ipp/Rows;->indexDigit:F
  .line 363
    const-string v3, "#"
    invoke-virtual { v2, v3 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    sput v2, Lcom/innioasis/ipp/Rows;->indexHash:F
  .line 364
    sput v1, Lcom/innioasis/ipp/Rows;->indexSize:F
  .line 365
    sput-object v0, Lcom/innioasis/ipp/Rows;->indexFont:Ljava/lang/Object;
  :L5
  .line 367
    sget v0, Lcom/innioasis/ipp/Rows;->indexDigit:F
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Disc;->widestIndex(Ljava/util/List;Ljava/lang/Object;)I
    move-result p1
    int-to-float p1, p1
    mul-float v0, v0, p1
  .line 368
    sget p1, Lcom/innioasis/ipp/Rows;->indexHash:F
    cmpl-float p2, p1, v0
    if-lez p2, :L6
    move v0, p1
  :L6
  .line 370
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F
  .line 371
    const/high16 p2, 0x3F000000
    add-float/2addr v0, p2
    float-to-int v0, v0
    const/high16 v1, 0x41000000
    mul-float v1, v1, p1
    add-float/2addr v1, p2
    float-to-int v1, v1
    add-int/2addr v0, v1
  .line 372
    const/high16 v1, 0x42200000
    mul-float v1, v1, p1
    add-float/2addr v1, p2
    float-to-int v1, v1
  .line 373
    const/high16 v2, 0x42F00000
    mul-float p1, p1, v2
    add-float/2addr p1, p2
    float-to-int p1, p1
  .line 374
    if-ge v0, v1, :L7
    move v0, v1
  :L7
  .line 375
    if-le v0, p1, :L8
    goto :L9
  :L8
    move p1, v0
  :L9
  .line 377
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p2
  .line 378
    if-eqz p2, :L12
    iget v0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-ne v0, p1, :L10
    goto :L12
  :L10
  .line 379
    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 380
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L11
  .line 382
    goto :L14
  :L12
  .line 378
    return-void
  :L13
  .line 381
    move-exception p0
  :L14
  .line 383
    return-void
.end method

.method public static noSize(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 455
    if-nez p0, :L0
    return-void
  :L0
  .line 456
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 457
    if-eqz v0, :L1
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-nez v1, :L1
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v1
    if-lez v1, :L1
  .line 458
    new-instance v1, Lcom/innioasis/ipp/Rows$Flat;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L1
  .line 461
    goto :L3
  :L2
  .line 460
    move-exception p0
  :L3
  .line 462
    return-void
.end method

.method public static playMark(Ljava/lang/String;Ljava/lang/Object;)I
  .catchall { :L0 .. :L8 } :L10
  .registers 5
  .line 279
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 280
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v2, 0
    if-eqz v1, :L1
  .line 281
    move-object v1, p1
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v1
    goto :L2
  :L1
    move-object v1, v2
  :L2
  .line 282
    if-nez v1, :L3
    return v0
  :L3
  .line 283
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L4
    return v0
  :L4
  .line 284
    sget-object p1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p1
  .line 286
    if-nez p1, :L5
    goto :L6
  :L5
    invoke-virtual { p1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L6
  .line 287
    if-eqz v2, :L9
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L7
    goto :L9
  :L7
  .line 288
    invoke-static { }, Lcom/innioasis/ipp/Rows;->stateIcon()I
    move-result p0
  :L8
    return p0
  :L9
  .line 287
    return v0
  :L10
  .line 289
    move-exception p0
  .line 290
    return v0
.end method

.method public static reflat(Landroid/view/View;)V
  .catchall { :L0 .. :L10 } :L11
  .registers 3
  .line 472
    if-nez p0, :L0
    return-void
  :L0
  .line 474
    invoke-static { p0 }, Lcom/innioasis/ipp/Theme;->landed(Landroid/view/View;)V
  .line 475
    invoke-static { p0 }, Lcom/innioasis/ipp/Bar;->landed(Landroid/view/View;)Z
    move-result v0
    if-eqz v0, :L1
    return-void
  :L1
  .line 477
    invoke-virtual { p0 }, Landroid/view/View;->getId()I
    move-result v0
  .line 478
    const v1, 2131362548
    if-eq v0, v1, :L9
    const v1, 2131362549
    if-ne v0, v1, :L2
    goto :L9
  :L2
  .line 481
    const-string v0, "ipp_flat"
    invoke-virtual { p0 }, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L4
  .line 482
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 483
    sget-object v0, Lcom/innioasis/ipp/Rows;->flatWatch:Ljava/lang/Runnable;
  .line 484
    if-eqz v0, :L3
    invoke-virtual { p0, v0 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
  :L3
  .line 485
    return-void
  :L4
  .line 487
    const v0, 2131362499
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->flat(Landroid/view/View;)V
    return-void
  :L5
  .line 488
    const v0, 2131361870
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
    return-void
  :L6
  .line 490
    const v0, 2131362301
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-nez v0, :L7
    const v0, 2131362376
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L8
  :L7
  .line 491
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  :L8
  .line 494
    goto :L12
  :L9
  .line 478
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  :L10
    return-void
  :L11
  .line 493
    move-exception p0
  :L12
  .line 495
    return-void
.end method

.method private static rowColour(Landroid/view/View;)I
  .registers 2
  .line 268
    const v0, 2131362492
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 269
    instance-of v0, p0, Landroid/widget/TextView;
    if-eqz v0, :L0
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    goto :L1
  :L0
    const/4 p0, -1
  :L1
    return p0
.end method

.method public static songMark(Landroid/view/View;ILjava/lang/Object;)V
  .catchall { :L1 .. :L6 } :L8
  .registers 6
  .line 197
    if-nez p0, :L0
    return-void
  :L0
  .line 199
    const v0, 2131362551
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 200
    const v1, 2131362499
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 201
    instance-of v1, v0, Landroid/widget/ImageView;
    if-eqz v1, :L7
    instance-of v1, p0, Landroid/widget/TextView;
    if-nez v1, :L2
    goto :L7
  :L2
  .line 202
    check-cast v0, Landroid/widget/ImageView;
  .line 203
    check-cast p0, Landroid/widget/TextView;
  .line 204
    nop
  .line 205
    instance-of v1, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v2, 0
    if-eqz v1, :L3
  .line 206
    move-object v1, p2
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p1
  .line 207
    instance-of v1, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v1, :L3
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Rows;->playMark(Ljava/lang/String;Ljava/lang/Object;)I
    move-result p1
    goto :L4
  :L3
  .line 209
    const/4 p1, 0
  :L4
    if-eqz p1, :L5
  .line 210
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 211
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 212
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 213
    const-string p1, ""
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :L6
  :L5
  .line 215
    const/16 p0, 8
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L6
  .line 218
    goto :L9
  :L7
  .line 201
    return-void
  :L8
  .line 217
    move-exception p0
  :L9
  .line 219
    return-void
.end method

.method public static stateIcon()I
  .catchall { :L0 .. :L1 } :L8
  .registers 3
  .line 296
    nop
  .line 298
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/utils/Static;->INSTANCE:Lcom/innioasis/y1/utils/Static;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/Static;->getPlayValue()Landroidx/lifecycle/LiveData;
    move-result-object v1
    invoke-virtual { v1 }, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;
    move-result-object v1
  .line 299
    instance-of v2, v1, Ljava/lang/Integer;
    if-eqz v2, :L2
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  :L1
    goto :L3
  :L2
    const/4 v1, 0
  :L3
  .line 302
    nop
  .line 303
    const/4 v2, 1
    if-eq v1, v2, :L7
    const/4 v2, 2
    if-ne v1, v2, :L4
    goto :L7
  :L4
  .line 304
    const/4 v2, 3
    if-ne v1, v2, :L5
    const v0, 2131624009
    return v0
  :L5
  .line 305
    const/4 v2, 5
    if-ne v1, v2, :L6
    const v0, 2131624010
    return v0
  :L6
  .line 306
    return v0
  :L7
  .line 303
    const v0, 2131624008
    return v0
  :L8
  .line 300
    move-exception v1
  .line 301
    return v0
.end method

.method public static subLine(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 390
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 392
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  :L1
  .line 394
    goto :L3
  :L2
  .line 393
    move-exception p0
  :L3
  .line 395
    return-void
  :L4
  .line 390
    return-void
.end method

.method public static text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 323
    if-nez p0, :L0
    return-void
  :L0
  .line 324
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 325
    if-ne v0, p1, :L1
    return-void
  :L1
  .line 326
    if-eqz v0, :L2
    if-eqz p1, :L2
    invoke-interface { v0 }, Ljava/lang/CharSequence;->length()I
    move-result v1
    invoke-interface { p1 }, Ljava/lang/CharSequence;->length()I
    move-result v2
    if-ne v1, v2, :L2
  .line 327
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-interface { p1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
  .line 328
    return-void
  :L2
  .line 330
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L3
  .line 333
    goto :L5
  :L4
  .line 331
    move-exception v0
  .line 332
    if-eqz p0, :L5
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L5
  .line 334
    return-void
.end method

.method public static thumb(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 6
  .line 581
    if-nez p0, :L0
    return-void
  :L0
  .line 583
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 584
    if-eqz p1, :L2
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Pic;
    if-eqz v1, :L2
  .line 585
    move-object v1, v0
    check-cast v1, Lcom/innioasis/ipp/Rows$Pic;
  .line 586
    iget-object v2, v1, Lcom/innioasis/ipp/Rows$Pic;->b:Landroid/graphics/Bitmap;
    if-ne v2, p1, :L1
    return-void
  :L1
  .line 587
    iget-object v2, v1, Lcom/innioasis/ipp/Rows$Pic;->b:Landroid/graphics/Bitmap;
    if-eqz v2, :L2
    iget-object v2, v1, Lcom/innioasis/ipp/Rows$Pic;->b:Landroid/graphics/Bitmap;
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v3
    if-ne v2, v3, :L2
    iget-object v2, v1, Lcom/innioasis/ipp/Rows$Pic;->b:Landroid/graphics/Bitmap;
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v2
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    if-ne v2, v3, :L2
  .line 588
    iput-object p1, v1, Lcom/innioasis/ipp/Rows$Pic;->b:Landroid/graphics/Bitmap;
  .line 589
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Rows$Pic;->invalidateSelf()V
  .line 590
    return-void
  :L2
  .line 593
    const/4 v1, 0
    if-nez p1, :L3
  .line 594
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 595
    return-void
  :L3
  .line 597
    instance-of v2, v0, Lcom/innioasis/ipp/Rows$Pic;
    if-eqz v2, :L4
    move-object v2, v0
    check-cast v2, Lcom/innioasis/ipp/Rows$Pic;
    goto :L5
  :L4
    new-instance v2, Lcom/innioasis/ipp/Rows$Pic;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Rows$Pic;-><init>()V
  :L5
  .line 598
    iput-object p1, v2, Lcom/innioasis/ipp/Rows$Pic;->b:Landroid/graphics/Bitmap;
  .line 599
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual { v3 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v3
    iget v3, v3, Landroid/util/DisplayMetrics;->densityDpi:I
    iput v3, v2, Lcom/innioasis/ipp/Rows$Pic;->density:I
  .line 600
    if-ne v0, v2, :L6
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  :L6
  .line 601
    invoke-virtual { p0, v2 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  :L7
  .line 604
    goto :L9
  :L8
  .line 602
    move-exception v0
  .line 603
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L9
  .line 605
    return-void
.end method

.method public static videoSub(Lcom/innioasis/y1/databinding/ItemVideoBinding;)V
  .registers 2
  .line 399
    if-nez p0, :L0
    return-void
  :L0
  .line 400
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemVideoBinding;->videoName:Landroid/widget/TextView;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ItemVideoBinding;->videoTime:Landroid/widget/TextView;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Rows;->subLine(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .line 401
    return-void
.end method

.method public static watchFlat(Ljava/lang/Runnable;)V
  .registers 1
  .line 449
    sput-object p0, Lcom/innioasis/ipp/Rows;->flatWatch:Ljava/lang/Runnable;
  .line 450
    return-void
.end method

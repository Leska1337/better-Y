.class public final Lcom/innioasis/ipp/Rows;
.super Ljava/lang/Object;
.source "Rows.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Rows$Kick;,
    Lcom/innioasis/ipp/Rows$Flat;
  }
.end annotation

.field public final static FLAT:Ljava/lang/String; = "ipp_flat"

.field private final static INDEX_GAP_DIP:I = 8

.field private final static INDEX_MAX_DIP:I = 120

.field private final static INDEX_MIN_DIP:I = 40

.field private static flatWatch:Ljava/lang/Runnable;

.field private static indexDigit:F

.field private static indexFont:Ljava/lang/Object;

.field private static indexHash:F

.field private static indexSize:F

.method public constructor <init>()V
  .registers 1
  .line 45
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static arrowOf(Landroid/view/View;)Landroid/view/View;
  .registers 2
  .line 171
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->findArrow(Landroid/view/View;)Landroid/view/View;
    move-result-object v0
  .line 172
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 173
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 174
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
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 718
    if-eqz p0, :L7
    if-nez p1, :L0
    goto :L7
  :L0
  .line 720
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 721
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v1, :L2
  .line 722
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 723
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->holds(Landroid/graphics/Bitmap;)Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 724
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-direct { v1, p0, p1 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    const/4 p0, 0
    invoke-virtual { v0, v1, p0 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  .line 725
    return-void
  :L2
  .line 727
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L3
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    if-ne v0, p1, :L3
    return-void
  :L3
  .line 728
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-direct { v0, v1, p1 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L4
  .line 731
    goto :L6
  :L5
  .line 729
    move-exception p0
  :L6
  .line 732
    return-void
  :L7
  .line 718
    return-void
.end method

.method public static bgRes(Landroid/view/View;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 741
    if-nez p0, :L0
    return-void
  :L0
  .line 743
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 751
    if-nez p1, :L2
  .line 752
    if-eqz v0, :L1
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundResource(I)V
  :L1
  .line 753
    return-void
  :L2
  .line 755
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v1, :L4
  .line 756
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 757
    iget v1, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
    if-ne v1, p1, :L3
    return-void
  :L3
  .line 758
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1, p1 }, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 759
    if-eqz v1, :L4
  .line 760
    invoke-virtual { v0, v1, p1 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  .line 761
    return-void
  :L4
  .line 764
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundResource(I)V
  :L5
  .line 767
    goto :L7
  :L6
  .line 765
    move-exception p0
  :L7
  .line 768
    return-void
.end method

.method public static blink(Landroid/view/View;IZ)V
  .catchall { :L1 .. :L6 } :L7
  .registers 6
  .line 133
    if-nez p0, :L0
    return-void
  :L0
  .line 136
    const v0, 2131362091
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 137
    instance-of v1, v0, Landroidx/cardview/widget/CardView;
    const/4 v2, 0
    if-eqz v1, :L3
  .line 138
    check-cast v0, Landroidx/cardview/widget/CardView;
  .line 139
    if-eqz p2, :L2
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileFrame()I
    move-result v2
  :L2
  .line 138
    invoke-virtual { v0, v2 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 140
    return-void
  :L3
  .line 142
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0, p0, p1, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 143
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->arrowOf(Landroid/view/View;)Landroid/view/View;
    move-result-object p0
  .line 144
    if-nez p0, :L4
    return-void
  :L4
  .line 145
    const/4 p1, 4
    if-eqz p2, :L5
  .line 146
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-ne p2, p1, :L6
    invoke-virtual { p0, v2 }, Landroid/view/View;->setVisibility(I)V
    goto :L6
  :L5
  .line 148
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-nez p2, :L6
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  :L6
  .line 152
    goto :L8
  :L7
  .line 150
    move-exception p0
  :L8
  .line 153
    return-void
.end method

.method public static bookIndex(Landroid/view/View;I)V
  .catchall { :L1 .. :L3 } :L4
  .registers 4
  .line 316
    if-nez p0, :L0
    return-void
  :L0
  .line 318
    const v0, 2131362558
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 319
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L2
    return-void
  :L2
  .line 320
    move-object v1, v0
    check-cast v1, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->rowColour(Landroid/view/View;)I
    move-result p0
    invoke-virtual { v1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 321
    check-cast v0, Landroid/widget/TextView;
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L3
  .line 324
    goto :L5
  :L4
  .line 322
    move-exception p0
  :L5
  .line 325
    return-void
.end method

.method public static bookMark(Landroid/view/View;ILjava/lang/Object;)V
  .catchall { :L1 .. :L7 } :L8
  .registers 8
  .line 280
    if-nez p0, :L0
    return-void
  :L0
  .line 282
    const v0, 2131362558
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 283
    const v1, 2131362559
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 284
    instance-of v2, v0, Landroid/widget/TextView;
    if-nez v2, :L2
    return-void
  :L2
  .line 285
    check-cast v0, Landroid/widget/TextView;
  .line 286
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->rowColour(Landroid/view/View;)I
    move-result p0
  .line 287
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 288
    nop
  .line 289
    instance-of v2, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v3, 0
    if-eqz v2, :L3
  .line 290
    move-object v2, p2
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v2, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  .line 291
    instance-of v4, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v4, :L3
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p2 }, Lcom/innioasis/ipp/Rows;->playMark(Ljava/lang/String;Ljava/lang/Object;)I
    move-result p2
    goto :L4
  :L3
  .line 293
    const/4 p2, 0
  :L4
    instance-of v2, v1, Landroid/widget/ImageView;
    if-nez v2, :L5
  .line 294
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 295
    return-void
  :L5
  .line 297
    check-cast v1, Landroid/widget/ImageView;
  .line 300
    if-eqz p2, :L6
  .line 301
    invoke-virtual { v1, p2 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 302
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 303
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 304
    const-string p0, ""
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :L7
  :L6
  .line 306
    const/16 p0, 8
    invoke-virtual { v1, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 307
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L7
  .line 311
    goto :L9
  :L8
  .line 309
    move-exception p0
  :L9
  .line 312
    return-void
.end method

.method public static bookRow(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  .line 60
    if-nez p1, :L0
    return-void
  :L0
  .line 62
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const v0, 2131100267
    invoke-virtual { p0, v0 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p0
  .line 63
    const v0, 2131362492
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 64
    instance-of v1, v0, Landroid/widget/TextView;
    const/4 v2, 0
    if-eqz v1, :L1
  .line 65
    check-cast v0, Landroid/widget/TextView;
  .line 66
    invoke-static { v0 }, Lcom/innioasis/ipp/Scroll;->rowPlain(Landroid/widget/TextView;)V
  .line 67
    sget-object v1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v1, v0, p0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L1
  .line 69
    const v0, 2131362495
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p1
  .line 70
    instance-of v0, p1, Landroid/widget/TextView;
    if-eqz v0, :L2
  .line 71
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast p1, Landroid/widget/TextView;
    invoke-virtual { v0, p1, p0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L2
  .line 75
    goto :L4
  :L3
  .line 73
    move-exception p0
  :L4
  .line 76
    return-void
.end method

.method public static fileLabel(Ljava/io/File;)Ljava/lang/String;
  .registers 2
  .line 163
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 164
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v0
  .line 165
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result p0
    if-eqz p0, :L1
    return-object v0
  :L1
  .line 166
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static fileMark(ILjava/lang/Object;)I
  .registers 4
  .line 229
    instance-of v0, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 230
    move-object v0, p1
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 231
    instance-of v0, p0, Ljava/io/File;
    if-nez v0, :L1
    return v1
  :L1
  .line 232
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
  .line 203
    if-nez p0, :L0
    return-void
  :L0
  .line 205
    const v0, 2131362550
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 206
    const v1, 2131362159
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 207
    instance-of v2, v0, Landroid/widget/ImageView;
    if-nez v2, :L2
    return-void
  :L2
  .line 208
    check-cast v0, Landroid/widget/ImageView;
  .line 209
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Rows;->fileMark(ILjava/lang/Object;)I
    move-result p1
  .line 210
    const/4 p2, 0
    if-eqz p1, :L6
  .line 211
    const v2, 2131362042
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 212
    instance-of v2, p0, Landroid/widget/TextView;
    if-eqz v2, :L3
  .line 213
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    goto :L4
  :L3
    const/4 p0, -1
  :L4
  .line 214
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 215
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 216
    invoke-virtual { v0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 217
    if-eqz v1, :L5
    const/4 p0, 4
    invoke-virtual { v1, p0 }, Landroid/view/View;->setVisibility(I)V
  :L5
  .line 218
    goto :L7
  :L6
  .line 219
    const/16 p0, 8
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 220
    if-eqz v1, :L7
    invoke-virtual { v1, p2 }, Landroid/view/View;->setVisibility(I)V
  :L7
  .line 224
    goto :L9
  :L8
  .line 222
    move-exception p0
  :L9
  .line 225
    return-void
.end method

.method public static fileRow(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .catchall { :L1 .. :L4 } :L5
  .registers 6
  .line 90
    if-nez p1, :L0
    return-void
  :L0
  .line 92
    const p0, 2131362321
  :L1
    invoke-virtual { p1, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 93
    if-eqz p0, :L2
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/util/Other;->hideV(Landroid/view/View;)V
  :L2
  .line 94
    const p0, 2131362042
    invoke-virtual { p1, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 95
    instance-of v0, p0, Landroid/widget/TextView;
    const/4 v1, 0
    if-eqz v0, :L3
  .line 96
    check-cast p0, Landroid/widget/TextView;
  .line 97
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->rowPlain(Landroid/widget/TextView;)V
  .line 98
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 99
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const v3, 2131100267
    invoke-virtual { v2, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v2
  .line 98
    invoke-virtual { v0, p0, v2, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L3
  .line 101
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v0, 2131231044
    invoke-virtual { p0, p1, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L4
  .line 104
    goto :L6
  :L5
  .line 102
    move-exception p0
  :L6
  .line 105
    return-void
.end method

.method private static findArrow(Landroid/view/View;)Landroid/view/View;
  .registers 2
  .line 178
    const v0, 2131362321
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 179
    if-nez v0, :L0
    const v0, 2131362144
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L0
  .line 180
    if-nez v0, :L1
    const v0, 2131361881
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 181
    return-object v0
.end method

.method public static flat(Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 574
    if-nez p0, :L0
    return-void
  :L0
  .line 575
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->headerInset(Landroid/view/View;)I
    move-result v0
  .line 576
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 577
    instance-of v2, v1, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v2, :L1
    check-cast v1, Lcom/innioasis/ipp/Rows$Flat;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/Rows$Flat;->inset(I)V
    return-void
  :L1
  .line 578
    if-eqz v1, :L3
    if-gtz v0, :L2
    invoke-virtual { v1 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v2
    if-lez v2, :L3
  :L2
  .line 579
    new-instance v2, Lcom/innioasis/ipp/Rows$Flat;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 580
    invoke-virtual { v2, v0 }, Lcom/innioasis/ipp/Rows$Flat;->inset(I)V
  .line 581
    invoke-virtual { p0, v2 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 585
    goto :L5
  :L4
  .line 583
    move-exception p0
  :L5
  .line 586
    return-void
.end method

.method public static fmMenuValue(Lcom/innioasis/y1/databinding/ItemFmMenuBinding;)V
  .registers 2
  .line 560
    if-nez p0, :L0
    return-void
  :L0
  .line 561
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemFmMenuBinding;->tvItem:Landroid/widget/TextView;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ItemFmMenuBinding;->text:Landroid/widget/TextView;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Rows;->subLine(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .line 562
    return-void
.end method

.method public static genreInfo(Landroid/widget/TextView;Ljava/lang/Object;)Z
  .registers 2
  .line 439
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
  .line 601
    const v0, 2131362549
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 602
    instance-of v1, v0, Landroid/widget/TextView;
    if-eqz v1, :L1
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 603
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->stripPx(Landroid/view/View;)I
    move-result p0
    return p0
  :L1
  .line 602
    const/4 p0, 0
    return p0
.end method

.method public static img(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 772
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 774
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 775
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L1
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    if-ne v0, p1, :L1
    return-void
  :L1
  .line 776
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L2
  .line 779
    goto :L4
  :L3
  .line 777
    move-exception p0
  :L4
  .line 780
    return-void
  :L5
  .line 772
    return-void
.end method

.method public static indexWidth(Landroid/widget/TextView;Ljava/util/List;Ljava/lang/Object;)V
  .catchall { :L0 .. :L11 } :L13
  .registers 10
  .line 493
    if-nez p0, :L0
    return-void
  :L0
  .line 495
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;
    move-result-object v0
  .line 496
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTextSize()F
    move-result v1
  .line 497
    sget-object v2, Lcom/innioasis/ipp/Rows;->indexFont:Ljava/lang/Object;
    if-ne v0, v2, :L1
    sget v2, Lcom/innioasis/ipp/Rows;->indexSize:F
    cmpl-float v2, v1, v2
    if-eqz v2, :L5
  :L1
  .line 498
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;
    move-result-object v2
  .line 499
    nop
  .line 500
    const/4 v3, 0
    const/16 v4, 48
  :L2
    const/16 v5, 57
    if-gt v4, v5, :L4
  .line 501
    invoke-static { v4 }, Ljava/lang/String;->valueOf(C)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v2, v5 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v5
  .line 502
    cmpl-float v6, v5, v3
    if-lez v6, :L3
    move v3, v5
  :L3
  .line 500
    add-int/lit8 v4, v4, 1
    int-to-char v4, v4
    goto :L2
  :L4
  .line 504
    sput v3, Lcom/innioasis/ipp/Rows;->indexDigit:F
  .line 505
    const-string v3, "#"
    invoke-virtual { v2, v3 }, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F
    move-result v2
    sput v2, Lcom/innioasis/ipp/Rows;->indexHash:F
  .line 506
    sput v1, Lcom/innioasis/ipp/Rows;->indexSize:F
  .line 507
    sput-object v0, Lcom/innioasis/ipp/Rows;->indexFont:Ljava/lang/Object;
  :L5
  .line 509
    sget v0, Lcom/innioasis/ipp/Rows;->indexDigit:F
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Disc;->widestIndex(Ljava/util/List;Ljava/lang/Object;)I
    move-result p1
    int-to-float p1, p1
    mul-float v0, v0, p1
  .line 510
    sget p1, Lcom/innioasis/ipp/Rows;->indexHash:F
    cmpl-float p2, p1, v0
    if-lez p2, :L6
    move v0, p1
  :L6
  .line 512
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F
  .line 513
    const/high16 p2, 0x3F000000
    add-float/2addr v0, p2
    float-to-int v0, v0
    const/high16 v1, 0x41000000
    mul-float v1, v1, p1
    add-float/2addr v1, p2
    float-to-int v1, v1
    add-int/2addr v0, v1
  .line 514
    const/high16 v1, 0x42200000
    mul-float v1, v1, p1
    add-float/2addr v1, p2
    float-to-int v1, v1
  .line 515
    const/high16 v2, 0x42F00000
    mul-float p1, p1, v2
    add-float/2addr p1, p2
    float-to-int p1, p1
  .line 516
    if-ge v0, v1, :L7
    move v0, v1
  :L7
  .line 517
    if-le v0, p1, :L8
    goto :L9
  :L8
    move p1, v0
  :L9
  .line 519
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p2
  .line 520
    if-eqz p2, :L12
    iget v0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I
    if-ne v0, p1, :L10
    goto :L12
  :L10
  .line 521
    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->width:I
  .line 522
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L11
  .line 525
    goto :L14
  :L12
  .line 520
    return-void
  :L13
  .line 523
    move-exception p0
  :L14
  .line 526
    return-void
.end method

.method public static marqueeKick(Landroid/widget/TextView;)V
  .registers 2
  .line 343
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getWidth()I
    move-result v0
    if-lez v0, :L0
    goto :L1
  :L0
  .line 344
    new-instance v0, Lcom/innioasis/ipp/Rows$Kick;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Rows$Kick;-><init>(Landroid/widget/TextView;)V
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z
  .line 345
    return-void
  :L1
  .line 343
    return-void
.end method

.method public static noSize(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 628
    if-nez p0, :L0
    return-void
  :L0
  .line 629
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 630
    if-eqz v0, :L1
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-nez v1, :L1
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v1
    if-lez v1, :L1
  .line 631
    new-instance v1, Lcom/innioasis/ipp/Rows$Flat;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L1
  .line 635
    goto :L3
  :L2
  .line 633
    move-exception p0
  :L3
  .line 636
    return-void
.end method

.method public static playMark(Ljava/lang/String;Ljava/lang/Object;)I
  .catchall { :L0 .. :L8 } :L10
  .registers 5
  .line 396
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 397
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v2, 0
    if-eqz v1, :L1
  .line 398
    move-object v1, p1
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v1
    goto :L2
  :L1
    move-object v1, v2
  :L2
  .line 399
    if-nez v1, :L3
    return v0
  :L3
  .line 400
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L4
    return v0
  :L4
  .line 401
    sget-object p1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p1
  .line 405
    if-nez p1, :L5
    goto :L6
  :L5
    invoke-virtual { p1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L6
  .line 406
    if-eqz v2, :L9
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L7
    goto :L9
  :L7
  .line 407
    invoke-static { }, Lcom/innioasis/ipp/Rows;->stateIcon()I
    move-result p0
  :L8
    return p0
  :L9
  .line 406
    return v0
  :L10
  .line 408
    move-exception p0
  .line 409
    return v0
.end method

.method public static reflat(Landroid/view/View;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 3
  .line 655
    if-nez p0, :L0
    return-void
  :L0
  .line 658
    invoke-static { p0 }, Lcom/innioasis/ipp/Theme;->landed(Landroid/view/View;)V
  .line 663
    invoke-virtual { p0 }, Landroid/view/View;->getId()I
    move-result v0
  .line 664
    const v1, 2131362548
    if-eq v0, v1, :L8
    const v1, 2131362549
    if-ne v0, v1, :L1
    goto :L8
  :L1
  .line 671
    const-string v0, "ipp_flat"
    invoke-virtual { p0 }, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
  .line 672
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 673
    sget-object v0, Lcom/innioasis/ipp/Rows;->flatWatch:Ljava/lang/Runnable;
  .line 674
    if-eqz v0, :L2
    invoke-virtual { p0, v0 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
  :L2
  .line 675
    return-void
  :L3
  .line 677
    const v0, 2131362499
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->flat(Landroid/view/View;)V
    return-void
  :L4
  .line 680
    const v0, 2131361870
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
    return-void
  :L5
  .line 687
    const v0, 2131362301
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-nez v0, :L6
    const v0, 2131362376
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L7
  :L6
  .line 688
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  :L7
  .line 692
    goto :L11
  :L8
  .line 664
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  :L9
    return-void
  :L10
  .line 690
    move-exception p0
  :L11
  .line 693
    return-void
.end method

.method private static rowColour(Landroid/view/View;)I
  .registers 2
  .line 370
    const v0, 2131362492
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 371
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
  .line 242
    if-nez p0, :L0
    return-void
  :L0
  .line 244
    const v0, 2131362551
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 245
    const v1, 2131362499
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 246
    instance-of v1, v0, Landroid/widget/ImageView;
    if-eqz v1, :L7
    instance-of v1, p0, Landroid/widget/TextView;
    if-nez v1, :L2
    goto :L7
  :L2
  .line 247
    check-cast v0, Landroid/widget/ImageView;
  .line 248
    check-cast p0, Landroid/widget/TextView;
  .line 249
    nop
  .line 250
    instance-of v1, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v2, 0
    if-eqz v1, :L3
  .line 251
    move-object v1, p2
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p1
  .line 252
    instance-of v1, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v1, :L3
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Rows;->playMark(Ljava/lang/String;Ljava/lang/Object;)I
    move-result p1
    goto :L4
  :L3
  .line 254
    const/4 p1, 0
  :L4
    if-eqz p1, :L5
  .line 255
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 256
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 257
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 258
    const-string p1, ""
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :L6
  :L5
  .line 260
    const/16 p0, 8
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L6
  .line 264
    goto :L9
  :L7
  .line 246
    return-void
  :L8
  .line 262
    move-exception p0
  :L9
  .line 265
    return-void
.end method

.method private static stateIcon()I
  .catchall { :L0 .. :L1 } :L8
  .registers 3
  .line 415
    nop
  .line 417
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/utils/Static;->INSTANCE:Lcom/innioasis/y1/utils/Static;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/Static;->getPlayValue()Landroidx/lifecycle/LiveData;
    move-result-object v1
    invoke-virtual { v1 }, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;
    move-result-object v1
  .line 418
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
  .line 421
    nop
  .line 422
    const/4 v2, 1
    if-eq v1, v2, :L7
    const/4 v2, 2
    if-ne v1, v2, :L4
    goto :L7
  :L4
  .line 423
    const/4 v2, 3
    if-ne v1, v2, :L5
    const v0, 2131624009
    return v0
  :L5
  .line 424
    const/4 v2, 5
    if-ne v1, v2, :L6
    const v0, 2131624010
    return v0
  :L6
  .line 425
    return v0
  :L7
  .line 422
    const v0, 2131624008
    return v0
  :L8
  .line 419
    move-exception v1
  .line 420
    return v0
.end method

.method public static subLine(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 540
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 542
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-virtual { p1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  :L1
  .line 545
    goto :L3
  :L2
  .line 543
    move-exception p0
  :L3
  .line 546
    return-void
  :L4
  .line 540
    return-void
.end method

.method public static text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 458
    if-nez p0, :L0
    return-void
  :L0
  .line 459
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 460
    if-ne v0, p1, :L1
    return-void
  :L1
  .line 461
    if-eqz v0, :L2
    if-eqz p1, :L2
    invoke-interface { v0 }, Ljava/lang/CharSequence;->length()I
    move-result v1
    invoke-interface { p1 }, Ljava/lang/CharSequence;->length()I
    move-result v2
    if-ne v1, v2, :L2
  .line 462
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-interface { p1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
  .line 463
    return-void
  :L2
  .line 465
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L3
  .line 468
    goto :L5
  :L4
  .line 466
    move-exception v0
  .line 467
    if-eqz p0, :L5
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L5
  .line 469
    return-void
.end method

.method public static videoSub(Lcom/innioasis/y1/databinding/ItemVideoBinding;)V
  .registers 2
  .line 550
    if-nez p0, :L0
    return-void
  :L0
  .line 551
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemVideoBinding;->videoName:Landroid/widget/TextView;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ItemVideoBinding;->videoTime:Landroid/widget/TextView;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Rows;->subLine(Landroid/widget/TextView;Landroid/widget/TextView;)V
  .line 552
    return-void
.end method

.method public static watchFlat(Ljava/lang/Runnable;)V
  .registers 1
  .line 623
    sput-object p0, Lcom/innioasis/ipp/Rows;->flatWatch:Ljava/lang/Runnable;
  .line 624
    return-void
.end method

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

.field private static flatWatch:Ljava/lang/Runnable;

.method public constructor <init>()V
  .registers 1
  .line 43
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static arrowOf(Landroid/view/View;)Landroid/view/View;
  .registers 2
  .line 161
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->findArrow(Landroid/view/View;)Landroid/view/View;
    move-result-object v0
  .line 162
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 163
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 164
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
  .line 607
    if-eqz p0, :L7
    if-nez p1, :L0
    goto :L7
  :L0
  .line 609
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 610
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v1, :L2
  .line 611
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 612
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->holds(Landroid/graphics/Bitmap;)Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 613
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-direct { v1, p0, p1 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    const/4 p0, 0
    invoke-virtual { v0, v1, p0 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  .line 614
    return-void
  :L2
  .line 616
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L3
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    if-ne v0, p1, :L3
    return-void
  :L3
  .line 617
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-direct { v0, v1, p1 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L4
  .line 620
    goto :L6
  :L5
  .line 618
    move-exception p0
  :L6
  .line 621
    return-void
  :L7
  .line 607
    return-void
.end method

.method public static bgRes(Landroid/view/View;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 630
    if-nez p0, :L0
    return-void
  :L0
  .line 632
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 640
    if-nez p1, :L2
  .line 641
    if-eqz v0, :L1
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundResource(I)V
  :L1
  .line 642
    return-void
  :L2
  .line 644
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v1, :L4
  .line 645
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 646
    iget v1, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
    if-ne v1, p1, :L3
    return-void
  :L3
  .line 647
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1, p1 }, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 648
    if-eqz v1, :L4
  .line 649
    invoke-virtual { v0, v1, p1 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  .line 650
    return-void
  :L4
  .line 653
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundResource(I)V
  :L5
  .line 656
    goto :L7
  :L6
  .line 654
    move-exception p0
  :L7
  .line 657
    return-void
.end method

.method public static blink(Landroid/view/View;IZ)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 131
    if-nez p0, :L0
    return-void
  :L0
  .line 132
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0, p0, p1, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 133
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->arrowOf(Landroid/view/View;)Landroid/view/View;
    move-result-object p0
  .line 134
    if-nez p0, :L1
    return-void
  :L1
  .line 135
    const/4 p1, 4
    if-eqz p2, :L2
  .line 136
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-ne p2, p1, :L3
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
    goto :L3
  :L2
  .line 138
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-nez p2, :L3
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  :L3
  .line 142
    goto :L5
  :L4
  .line 140
    move-exception p0
  :L5
  .line 143
    return-void
.end method

.method public static bookIndex(Landroid/view/View;I)V
  .catchall { :L1 .. :L3 } :L4
  .registers 4
  .line 306
    if-nez p0, :L0
    return-void
  :L0
  .line 308
    const v0, 2131362558
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 309
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L2
    return-void
  :L2
  .line 310
    move-object v1, v0
    check-cast v1, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->rowColour(Landroid/view/View;)I
    move-result p0
    invoke-virtual { v1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 311
    check-cast v0, Landroid/widget/TextView;
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L3
  .line 314
    goto :L5
  :L4
  .line 312
    move-exception p0
  :L5
  .line 315
    return-void
.end method

.method public static bookMark(Landroid/view/View;ILjava/lang/Object;)V
  .catchall { :L1 .. :L7 } :L8
  .registers 8
  .line 270
    if-nez p0, :L0
    return-void
  :L0
  .line 272
    const v0, 2131362558
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 273
    const v1, 2131362559
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 274
    instance-of v2, v0, Landroid/widget/TextView;
    if-nez v2, :L2
    return-void
  :L2
  .line 275
    check-cast v0, Landroid/widget/TextView;
  .line 276
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->rowColour(Landroid/view/View;)I
    move-result p0
  .line 277
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 278
    nop
  .line 279
    instance-of v2, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v3, 0
    if-eqz v2, :L3
  .line 280
    move-object v2, p2
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v2, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  .line 281
    instance-of v4, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v4, :L3
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p2 }, Lcom/innioasis/ipp/Rows;->playMark(Ljava/lang/String;Ljava/lang/Object;)I
    move-result p2
    goto :L4
  :L3
  .line 283
    const/4 p2, 0
  :L4
    instance-of v2, v1, Landroid/widget/ImageView;
    if-nez v2, :L5
  .line 284
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 285
    return-void
  :L5
  .line 287
    check-cast v1, Landroid/widget/ImageView;
  .line 290
    if-eqz p2, :L6
  .line 291
    invoke-virtual { v1, p2 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 292
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 293
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 294
    const-string p0, ""
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :L7
  :L6
  .line 296
    const/16 p0, 8
    invoke-virtual { v1, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 297
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L7
  .line 301
    goto :L9
  :L8
  .line 299
    move-exception p0
  :L9
  .line 302
    return-void
.end method

.method public static bookRow(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 6
  .line 58
    if-nez p1, :L0
    return-void
  :L0
  .line 60
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131100267
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 61
    const v1, 2131362492
    invoke-virtual { p1, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 62
    instance-of v2, v1, Landroid/widget/TextView;
    const/4 v3, 0
    if-eqz v2, :L2
  .line 63
    check-cast v1, Landroid/widget/TextView;
  .line 64
    if-eqz p0, :L1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->makeItNormal(Landroid/widget/TextView;)V
  :L1
  .line 65
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { p0, v1, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L2
  .line 67
    const p0, 2131362495
    invoke-virtual { p1, p0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 68
    instance-of p1, p0, Landroid/widget/TextView;
    if-eqz p1, :L3
  .line 69
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p1, p0, v0, v3 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L3
  .line 73
    goto :L5
  :L4
  .line 71
    move-exception p0
  :L5
  .line 74
    return-void
.end method

.method public static fileLabel(Ljava/io/File;)Ljava/lang/String;
  .registers 2
  .line 153
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 154
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v0
  .line 155
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result p0
    if-eqz p0, :L1
    return-object v0
  :L1
  .line 156
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static fileMark(ILjava/lang/Object;)I
  .registers 4
  .line 219
    instance-of v0, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 220
    move-object v0, p1
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 221
    instance-of v0, p0, Ljava/io/File;
    if-nez v0, :L1
    return v1
  :L1
  .line 222
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
  .line 193
    if-nez p0, :L0
    return-void
  :L0
  .line 195
    const v0, 2131362550
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 196
    const v1, 2131362159
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 197
    instance-of v2, v0, Landroid/widget/ImageView;
    if-nez v2, :L2
    return-void
  :L2
  .line 198
    check-cast v0, Landroid/widget/ImageView;
  .line 199
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Rows;->fileMark(ILjava/lang/Object;)I
    move-result p1
  .line 200
    const/4 p2, 0
    if-eqz p1, :L6
  .line 201
    const v2, 2131362042
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 202
    instance-of v2, p0, Landroid/widget/TextView;
    if-eqz v2, :L3
  .line 203
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    goto :L4
  :L3
    const/4 p0, -1
  :L4
  .line 204
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 205
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 206
    invoke-virtual { v0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 207
    if-eqz v1, :L5
    const/4 p0, 4
    invoke-virtual { v1, p0 }, Landroid/view/View;->setVisibility(I)V
  :L5
  .line 208
    goto :L7
  :L6
  .line 209
    const/16 p0, 8
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 210
    if-eqz v1, :L7
    invoke-virtual { v1, p2 }, Landroid/view/View;->setVisibility(I)V
  :L7
  .line 214
    goto :L9
  :L8
  .line 212
    move-exception p0
  :L9
  .line 215
    return-void
.end method

.method public static fileRow(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 6
  .line 88
    if-nez p1, :L0
    return-void
  :L0
  .line 90
    const v0, 2131362321
  :L1
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 91
    if-eqz v0, :L2
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/util/Other;->hideV(Landroid/view/View;)V
  :L2
  .line 92
    const v0, 2131362042
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 93
    instance-of v1, v0, Landroid/widget/TextView;
    const/4 v2, 0
    if-eqz v1, :L4
  .line 94
    check-cast v0, Landroid/widget/TextView;
  .line 95
    if-eqz p0, :L3
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->makeItNormal(Landroid/widget/TextView;)V
  :L3
  .line 96
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 97
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v3, 2131100267
    invoke-virtual { v1, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
  .line 96
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L4
  .line 99
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v0, 2131231044
    invoke-virtual { p0, p1, v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L5
  .line 102
    goto :L7
  :L6
  .line 100
    move-exception p0
  :L7
  .line 103
    return-void
.end method

.method private static findArrow(Landroid/view/View;)Landroid/view/View;
  .registers 2
  .line 168
    const v0, 2131362321
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 169
    if-nez v0, :L0
    const v0, 2131362144
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L0
  .line 170
    if-nez v0, :L1
    const v0, 2131361881
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 171
    return-object v0
.end method

.method public static flat(Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 471
    if-nez p0, :L0
    return-void
  :L0
  .line 472
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->headerInset(Landroid/view/View;)I
    move-result v0
  .line 473
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 474
    instance-of v2, v1, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v2, :L1
    check-cast v1, Lcom/innioasis/ipp/Rows$Flat;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/Rows$Flat;->inset(I)V
    return-void
  :L1
  .line 475
    if-eqz v1, :L3
    if-gtz v0, :L2
    invoke-virtual { v1 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v2
    if-lez v2, :L3
  :L2
  .line 476
    new-instance v2, Lcom/innioasis/ipp/Rows$Flat;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 477
    invoke-virtual { v2, v0 }, Lcom/innioasis/ipp/Rows$Flat;->inset(I)V
  .line 478
    invoke-virtual { p0, v2 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 482
    goto :L5
  :L4
  .line 480
    move-exception p0
  :L5
  .line 483
    return-void
.end method

.method public static genreInfo(Landroid/widget/TextView;Ljava/lang/Object;)Z
  .registers 2
  .line 429
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
  .line 492
    const v0, 2131362549
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 493
    instance-of v0, p0, Landroid/widget/TextView;
    if-eqz v0, :L1
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 494
    check-cast p0, Landroid/widget/TextView;
  .line 495
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLineHeight()I
    move-result v0
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingTop()I
    move-result v1
    add-int/2addr v0, v1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingBottom()I
    move-result p0
    add-int/2addr v0, p0
    return v0
  :L1
  .line 493
    const/4 p0, 0
    return p0
.end method

.method public static img(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 661
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 663
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 664
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L1
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    if-ne v0, p1, :L1
    return-void
  :L1
  .line 665
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L2
  .line 668
    goto :L4
  :L3
  .line 666
    move-exception p0
  :L4
  .line 669
    return-void
  :L5
  .line 661
    return-void
.end method

.method public static marqueeKick(Landroid/widget/TextView;)V
  .registers 2
  .line 333
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getWidth()I
    move-result v0
    if-lez v0, :L0
    goto :L1
  :L0
  .line 334
    new-instance v0, Lcom/innioasis/ipp/Rows$Kick;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Rows$Kick;-><init>(Landroid/widget/TextView;)V
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z
  .line 335
    return-void
  :L1
  .line 333
    return-void
.end method

.method public static noSize(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 520
    if-nez p0, :L0
    return-void
  :L0
  .line 521
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 522
    if-eqz v0, :L1
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-nez v1, :L1
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v1
    if-lez v1, :L1
  .line 523
    new-instance v1, Lcom/innioasis/ipp/Rows$Flat;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L1
  .line 527
    goto :L3
  :L2
  .line 525
    move-exception p0
  :L3
  .line 528
    return-void
.end method

.method public static playMark(Ljava/lang/String;Ljava/lang/Object;)I
  .catchall { :L0 .. :L8 } :L10
  .registers 5
  .line 386
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 387
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v2, 0
    if-eqz v1, :L1
  .line 388
    move-object v1, p1
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v1
    goto :L2
  :L1
    move-object v1, v2
  :L2
  .line 389
    if-nez v1, :L3
    return v0
  :L3
  .line 390
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L4
    return v0
  :L4
  .line 391
    sget-object p1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p1
  .line 395
    if-nez p1, :L5
    goto :L6
  :L5
    invoke-virtual { p1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L6
  .line 396
    if-eqz v2, :L9
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L7
    goto :L9
  :L7
  .line 397
    invoke-static { }, Lcom/innioasis/ipp/Rows;->stateIcon()I
    move-result p0
  :L8
    return p0
  :L9
  .line 396
    return v0
  :L10
  .line 398
    move-exception p0
  .line 399
    return v0
.end method

.method public static reflat(Landroid/view/View;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 3
  .line 547
    if-nez p0, :L0
    return-void
  :L0
  .line 552
    invoke-virtual { p0 }, Landroid/view/View;->getId()I
    move-result v0
  .line 553
    const v1, 2131362548
    if-eq v0, v1, :L8
    const v1, 2131362549
    if-ne v0, v1, :L1
    goto :L8
  :L1
  .line 560
    const-string v0, "ipp_flat"
    invoke-virtual { p0 }, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
  .line 561
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 562
    sget-object v0, Lcom/innioasis/ipp/Rows;->flatWatch:Ljava/lang/Runnable;
  .line 563
    if-eqz v0, :L2
    invoke-virtual { p0, v0 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
  :L2
  .line 564
    return-void
  :L3
  .line 566
    const v0, 2131362499
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->flat(Landroid/view/View;)V
    return-void
  :L4
  .line 569
    const v0, 2131361870
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
    return-void
  :L5
  .line 576
    const v0, 2131362301
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-nez v0, :L6
    const v0, 2131362376
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L7
  :L6
  .line 577
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  :L7
  .line 581
    goto :L11
  :L8
  .line 553
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  :L9
    return-void
  :L10
  .line 579
    move-exception p0
  :L11
  .line 582
    return-void
.end method

.method private static rowColour(Landroid/view/View;)I
  .registers 2
  .line 360
    const v0, 2131362492
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 361
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
  .line 232
    if-nez p0, :L0
    return-void
  :L0
  .line 234
    const v0, 2131362551
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 235
    const v1, 2131362499
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 236
    instance-of v1, v0, Landroid/widget/ImageView;
    if-eqz v1, :L7
    instance-of v1, p0, Landroid/widget/TextView;
    if-nez v1, :L2
    goto :L7
  :L2
  .line 237
    check-cast v0, Landroid/widget/ImageView;
  .line 238
    check-cast p0, Landroid/widget/TextView;
  .line 239
    nop
  .line 240
    instance-of v1, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v2, 0
    if-eqz v1, :L3
  .line 241
    move-object v1, p2
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p1
  .line 242
    instance-of v1, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v1, :L3
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Rows;->playMark(Ljava/lang/String;Ljava/lang/Object;)I
    move-result p1
    goto :L4
  :L3
  .line 244
    const/4 p1, 0
  :L4
    if-eqz p1, :L5
  .line 245
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 246
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 247
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 248
    const-string p1, ""
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :L6
  :L5
  .line 250
    const/16 p0, 8
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L6
  .line 254
    goto :L9
  :L7
  .line 236
    return-void
  :L8
  .line 252
    move-exception p0
  :L9
  .line 255
    return-void
.end method

.method private static stateIcon()I
  .catchall { :L0 .. :L1 } :L8
  .registers 3
  .line 405
    nop
  .line 407
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/utils/Static;->INSTANCE:Lcom/innioasis/y1/utils/Static;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/Static;->getPlayValue()Landroidx/lifecycle/LiveData;
    move-result-object v1
    invoke-virtual { v1 }, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;
    move-result-object v1
  .line 408
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
  .line 411
    nop
  .line 412
    const/4 v2, 1
    if-eq v1, v2, :L7
    const/4 v2, 2
    if-ne v1, v2, :L4
    goto :L7
  :L4
  .line 413
    const/4 v2, 3
    if-ne v1, v2, :L5
    const v0, 2131624009
    return v0
  :L5
  .line 414
    const/4 v2, 5
    if-ne v1, v2, :L6
    const v0, 2131624010
    return v0
  :L6
  .line 415
    return v0
  :L7
  .line 412
    const v0, 2131624008
    return v0
  :L8
  .line 409
    move-exception v1
  .line 410
    return v0
.end method

.method public static text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 448
    if-nez p0, :L0
    return-void
  :L0
  .line 449
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 450
    if-ne v0, p1, :L1
    return-void
  :L1
  .line 451
    if-eqz v0, :L2
    if-eqz p1, :L2
    invoke-interface { v0 }, Ljava/lang/CharSequence;->length()I
    move-result v1
    invoke-interface { p1 }, Ljava/lang/CharSequence;->length()I
    move-result v2
    if-ne v1, v2, :L2
  .line 452
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-interface { p1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
  .line 453
    return-void
  :L2
  .line 455
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L3
  .line 458
    goto :L5
  :L4
  .line 456
    move-exception v0
  .line 457
    if-eqz p0, :L5
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L5
  .line 459
    return-void
.end method

.method public static watchFlat(Ljava/lang/Runnable;)V
  .registers 1
  .line 515
    sput-object p0, Lcom/innioasis/ipp/Rows;->flatWatch:Ljava/lang/Runnable;
  .line 516
    return-void
.end method

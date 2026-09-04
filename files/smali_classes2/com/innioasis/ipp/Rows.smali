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
  .line 162
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->findArrow(Landroid/view/View;)Landroid/view/View;
    move-result-object v0
  .line 163
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 164
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 165
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
  .line 609
    if-eqz p0, :L7
    if-nez p1, :L0
    goto :L7
  :L0
  .line 611
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 612
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v1, :L2
  .line 613
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 614
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->holds(Landroid/graphics/Bitmap;)Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 615
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-direct { v1, p0, p1 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    const/4 p0, 0
    invoke-virtual { v0, v1, p0 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  .line 616
    return-void
  :L2
  .line 618
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L3
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    if-ne v0, p1, :L3
    return-void
  :L3
  .line 619
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-direct { v0, v1, p1 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L4
  .line 622
    goto :L6
  :L5
  .line 620
    move-exception p0
  :L6
  .line 623
    return-void
  :L7
  .line 609
    return-void
.end method

.method public static bgRes(Landroid/view/View;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 632
    if-nez p0, :L0
    return-void
  :L0
  .line 634
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 642
    if-nez p1, :L2
  .line 643
    if-eqz v0, :L1
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundResource(I)V
  :L1
  .line 644
    return-void
  :L2
  .line 646
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v1, :L4
  .line 647
    check-cast v0, Lcom/innioasis/ipp/Rows$Flat;
  .line 648
    iget v1, v0, Lcom/innioasis/ipp/Rows$Flat;->res:I
    if-ne v1, p1, :L3
    return-void
  :L3
  .line 649
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1, p1 }, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 650
    if-eqz v1, :L4
  .line 651
    invoke-virtual { v0, v1, p1 }, Lcom/innioasis/ipp/Rows$Flat;->swap(Landroid/graphics/drawable/Drawable;I)V
  .line 652
    return-void
  :L4
  .line 655
    invoke-virtual { p0, p1 }, Landroid/view/View;->setBackgroundResource(I)V
  :L5
  .line 658
    goto :L7
  :L6
  .line 656
    move-exception p0
  :L7
  .line 659
    return-void
.end method

.method public static blink(Landroid/view/View;IZ)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 132
    if-nez p0, :L0
    return-void
  :L0
  .line 133
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0, p0, p1, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 134
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->arrowOf(Landroid/view/View;)Landroid/view/View;
    move-result-object p0
  .line 135
    if-nez p0, :L1
    return-void
  :L1
  .line 136
    const/4 p1, 4
    if-eqz p2, :L2
  .line 137
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-ne p2, p1, :L3
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
    goto :L3
  :L2
  .line 139
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result p2
    if-nez p2, :L3
    invoke-virtual { p0, p1 }, Landroid/view/View;->setVisibility(I)V
  :L3
  .line 143
    goto :L5
  :L4
  .line 141
    move-exception p0
  :L5
  .line 144
    return-void
.end method

.method public static bookIndex(Landroid/view/View;I)V
  .catchall { :L1 .. :L3 } :L4
  .registers 4
  .line 307
    if-nez p0, :L0
    return-void
  :L0
  .line 309
    const v0, 2131362558
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 310
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L2
    return-void
  :L2
  .line 311
    move-object v1, v0
    check-cast v1, Landroid/widget/TextView;
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->rowColour(Landroid/view/View;)I
    move-result p0
    invoke-virtual { v1, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 312
    check-cast v0, Landroid/widget/TextView;
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L3
  .line 315
    goto :L5
  :L4
  .line 313
    move-exception p0
  :L5
  .line 316
    return-void
.end method

.method public static bookMark(Landroid/view/View;ILjava/lang/Object;)V
  .catchall { :L1 .. :L7 } :L8
  .registers 8
  .line 271
    if-nez p0, :L0
    return-void
  :L0
  .line 273
    const v0, 2131362558
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 274
    const v1, 2131362559
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 275
    instance-of v2, v0, Landroid/widget/TextView;
    if-nez v2, :L2
    return-void
  :L2
  .line 276
    check-cast v0, Landroid/widget/TextView;
  .line 277
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->rowColour(Landroid/view/View;)I
    move-result p0
  .line 278
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setTextColor(I)V
  .line 279
    nop
  .line 280
    instance-of v2, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v3, 0
    if-eqz v2, :L3
  .line 281
    move-object v2, p2
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v2, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  .line 282
    instance-of v4, v2, Lcom/innioasis/y1/database/Song;
    if-eqz v4, :L3
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2, p2 }, Lcom/innioasis/ipp/Rows;->playMark(Ljava/lang/String;Ljava/lang/Object;)I
    move-result p2
    goto :L4
  :L3
  .line 284
    const/4 p2, 0
  :L4
    instance-of v2, v1, Landroid/widget/ImageView;
    if-nez v2, :L5
  .line 285
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 286
    return-void
  :L5
  .line 288
    check-cast v1, Landroid/widget/ImageView;
  .line 291
    if-eqz p2, :L6
  .line 292
    invoke-virtual { v1, p2 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 293
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 294
    invoke-virtual { v1, v3 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 295
    const-string p0, ""
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :L7
  :L6
  .line 297
    const/16 p0, 8
    invoke-virtual { v1, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 298
    add-int/lit8 p1, p1, 1
    invoke-static { p1 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L7
  .line 302
    goto :L9
  :L8
  .line 300
    move-exception p0
  :L9
  .line 303
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
  .line 154
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 155
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v0
  .line 156
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result p0
    if-eqz p0, :L1
    return-object v0
  :L1
  .line 157
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static fileMark(ILjava/lang/Object;)I
  .registers 4
  .line 220
    instance-of v0, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 221
    move-object v0, p1
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 222
    instance-of v0, p0, Ljava/io/File;
    if-nez v0, :L1
    return v1
  :L1
  .line 223
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
  .line 194
    if-nez p0, :L0
    return-void
  :L0
  .line 196
    const v0, 2131362550
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 197
    const v1, 2131362159
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 198
    instance-of v2, v0, Landroid/widget/ImageView;
    if-nez v2, :L2
    return-void
  :L2
  .line 199
    check-cast v0, Landroid/widget/ImageView;
  .line 200
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Rows;->fileMark(ILjava/lang/Object;)I
    move-result p1
  .line 201
    const/4 p2, 0
    if-eqz p1, :L6
  .line 202
    const v2, 2131362042
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 203
    instance-of v2, p0, Landroid/widget/TextView;
    if-eqz v2, :L3
  .line 204
    check-cast p0, Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    goto :L4
  :L3
    const/4 p0, -1
  :L4
  .line 205
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 206
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 207
    invoke-virtual { v0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 208
    if-eqz v1, :L5
    const/4 p0, 4
    invoke-virtual { v1, p0 }, Landroid/view/View;->setVisibility(I)V
  :L5
  .line 209
    goto :L7
  :L6
  .line 210
    const/16 p0, 8
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 211
    if-eqz v1, :L7
    invoke-virtual { v1, p2 }, Landroid/view/View;->setVisibility(I)V
  :L7
  .line 215
    goto :L9
  :L8
  .line 213
    move-exception p0
  :L9
  .line 216
    return-void
.end method

.method public static fileRow(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 6
  .line 89
    if-nez p1, :L0
    return-void
  :L0
  .line 91
    const v0, 2131362321
  :L1
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 92
    if-eqz v0, :L2
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/util/Other;->hideV(Landroid/view/View;)V
  :L2
  .line 93
    const v0, 2131362042
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 94
    instance-of v1, v0, Landroid/widget/TextView;
    const/4 v2, 0
    if-eqz v1, :L4
  .line 95
    check-cast v0, Landroid/widget/TextView;
  .line 96
    if-eqz p0, :L3
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->makeItNormal(Landroid/widget/TextView;)V
  :L3
  .line 97
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 98
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const v3, 2131100267
    invoke-virtual { v1, v3 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v1
  .line 97
    invoke-virtual { p0, v0, v1, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  :L4
  .line 100
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v0, 2131231044
    invoke-virtual { p0, p1, v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  :L5
  .line 103
    goto :L7
  :L6
  .line 101
    move-exception p0
  :L7
  .line 104
    return-void
.end method

.method private static findArrow(Landroid/view/View;)Landroid/view/View;
  .registers 2
  .line 169
    const v0, 2131362321
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 170
    if-nez v0, :L0
    const v0, 2131362144
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L0
  .line 171
    if-nez v0, :L1
    const v0, 2131361881
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 172
    return-object v0
.end method

.method public static flat(Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 473
    if-nez p0, :L0
    return-void
  :L0
  .line 474
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->headerInset(Landroid/view/View;)I
    move-result v0
  .line 475
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v1
  .line 476
    instance-of v2, v1, Lcom/innioasis/ipp/Rows$Flat;
    if-eqz v2, :L1
    check-cast v1, Lcom/innioasis/ipp/Rows$Flat;
    invoke-virtual { v1, v0 }, Lcom/innioasis/ipp/Rows$Flat;->inset(I)V
    return-void
  :L1
  .line 477
    if-eqz v1, :L3
    if-gtz v0, :L2
    invoke-virtual { v1 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v2
    if-lez v2, :L3
  :L2
  .line 478
    new-instance v2, Lcom/innioasis/ipp/Rows$Flat;
    invoke-direct { v2, v1 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
  .line 479
    invoke-virtual { v2, v0 }, Lcom/innioasis/ipp/Rows$Flat;->inset(I)V
  .line 480
    invoke-virtual { p0, v2 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 484
    goto :L5
  :L4
  .line 482
    move-exception p0
  :L5
  .line 485
    return-void
.end method

.method public static genreInfo(Landroid/widget/TextView;Ljava/lang/Object;)Z
  .registers 2
  .line 431
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
  .line 494
    const v0, 2131362549
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 495
    instance-of v0, p0, Landroid/widget/TextView;
    if-eqz v0, :L1
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 496
    check-cast p0, Landroid/widget/TextView;
  .line 497
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
  .line 495
    const/4 p0, 0
    return p0
.end method

.method public static img(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 663
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 665
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 666
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L1
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    if-ne v0, p1, :L1
    return-void
  :L1
  .line 667
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L2
  .line 670
    goto :L4
  :L3
  .line 668
    move-exception p0
  :L4
  .line 671
    return-void
  :L5
  .line 663
    return-void
.end method

.method public static marqueeKick(Landroid/widget/TextView;)V
  .registers 2
  .line 334
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getWidth()I
    move-result v0
    if-lez v0, :L0
    goto :L1
  :L0
  .line 335
    new-instance v0, Lcom/innioasis/ipp/Rows$Kick;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Rows$Kick;-><init>(Landroid/widget/TextView;)V
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z
  .line 336
    return-void
  :L1
  .line 334
    return-void
.end method

.method public static noSize(Landroid/view/View;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 522
    if-nez p0, :L0
    return-void
  :L0
  .line 523
    invoke-virtual { p0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 524
    if-eqz v0, :L1
    instance-of v1, v0, Lcom/innioasis/ipp/Rows$Flat;
    if-nez v1, :L1
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v1
    if-lez v1, :L1
  .line 525
    new-instance v1, Lcom/innioasis/ipp/Rows$Flat;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Rows$Flat;-><init>(Landroid/graphics/drawable/Drawable;)V
    invoke-virtual { p0, v1 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L1
  .line 529
    goto :L3
  :L2
  .line 527
    move-exception p0
  :L3
  .line 530
    return-void
.end method

.method public static playMark(Ljava/lang/String;Ljava/lang/Object;)I
  .catchall { :L0 .. :L8 } :L10
  .registers 5
  .line 388
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 389
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v2, 0
    if-eqz v1, :L1
  .line 390
    move-object v1, p1
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getContext()Landroid/content/Context;
    move-result-object v1
    goto :L2
  :L1
    move-object v1, v2
  :L2
  .line 391
    if-nez v1, :L3
    return v0
  :L3
  .line 392
    invoke-static { p1 }, Lcom/innioasis/ipp/Queue;->atSource(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L4
    return v0
  :L4
  .line 393
    sget-object p1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p1
  .line 397
    if-nez p1, :L5
    goto :L6
  :L5
    invoke-virtual { p1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L6
  .line 398
    if-eqz v2, :L9
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L7
    goto :L9
  :L7
  .line 399
    invoke-static { }, Lcom/innioasis/ipp/Rows;->stateIcon()I
    move-result p0
  :L8
    return p0
  :L9
  .line 398
    return v0
  :L10
  .line 400
    move-exception p0
  .line 401
    return v0
.end method

.method public static reflat(Landroid/view/View;)V
  .catchall { :L0 .. :L9 } :L10
  .registers 3
  .line 549
    if-nez p0, :L0
    return-void
  :L0
  .line 554
    invoke-virtual { p0 }, Landroid/view/View;->getId()I
    move-result v0
  .line 555
    const v1, 2131362548
    if-eq v0, v1, :L8
    const v1, 2131362549
    if-ne v0, v1, :L1
    goto :L8
  :L1
  .line 562
    const-string v0, "ipp_flat"
    invoke-virtual { p0 }, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
  .line 563
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 564
    sget-object v0, Lcom/innioasis/ipp/Rows;->flatWatch:Ljava/lang/Runnable;
  .line 565
    if-eqz v0, :L2
    invoke-virtual { p0, v0 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
  :L2
  .line 566
    return-void
  :L3
  .line 568
    const v0, 2131362499
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->flat(Landroid/view/View;)V
    return-void
  :L4
  .line 571
    const v0, 2131361870
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
    return-void
  :L5
  .line 578
    const v0, 2131362301
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-nez v0, :L6
    const v0, 2131362376
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :L7
  :L6
  .line 579
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  :L7
  .line 583
    goto :L11
  :L8
  .line 555
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  :L9
    return-void
  :L10
  .line 581
    move-exception p0
  :L11
  .line 584
    return-void
.end method

.method private static rowColour(Landroid/view/View;)I
  .registers 2
  .line 361
    const v0, 2131362492
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 362
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
  .line 233
    if-nez p0, :L0
    return-void
  :L0
  .line 235
    const v0, 2131362551
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 236
    const v1, 2131362499
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 237
    instance-of v1, v0, Landroid/widget/ImageView;
    if-eqz v1, :L7
    instance-of v1, p0, Landroid/widget/TextView;
    if-nez v1, :L2
    goto :L7
  :L2
  .line 238
    check-cast v0, Landroid/widget/ImageView;
  .line 239
    check-cast p0, Landroid/widget/TextView;
  .line 240
    nop
  .line 241
    instance-of v1, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v2, 0
    if-eqz v1, :L3
  .line 242
    move-object v1, p2
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p1
  .line 243
    instance-of v1, p1, Lcom/innioasis/y1/database/Song;
    if-eqz v1, :L3
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Rows;->playMark(Ljava/lang/String;Ljava/lang/Object;)I
    move-result p1
    goto :L4
  :L3
  .line 245
    const/4 p1, 0
  :L4
    if-eqz p1, :L5
  .line 246
    invoke-virtual { v0, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 247
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p1
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 248
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 249
    const-string p1, ""
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :L6
  :L5
  .line 251
    const/16 p0, 8
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L6
  .line 255
    goto :L9
  :L7
  .line 237
    return-void
  :L8
  .line 253
    move-exception p0
  :L9
  .line 256
    return-void
.end method

.method private static stateIcon()I
  .catchall { :L0 .. :L1 } :L8
  .registers 3
  .line 407
    nop
  .line 409
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/utils/Static;->INSTANCE:Lcom/innioasis/y1/utils/Static;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/Static;->getPlayValue()Landroidx/lifecycle/LiveData;
    move-result-object v1
    invoke-virtual { v1 }, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;
    move-result-object v1
  .line 410
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
  .line 413
    nop
  .line 414
    const/4 v2, 1
    if-eq v1, v2, :L7
    const/4 v2, 2
    if-ne v1, v2, :L4
    goto :L7
  :L4
  .line 415
    const/4 v2, 3
    if-ne v1, v2, :L5
    const v0, 2131624009
    return v0
  :L5
  .line 416
    const/4 v2, 5
    if-ne v1, v2, :L6
    const v0, 2131624010
    return v0
  :L6
  .line 417
    return v0
  :L7
  .line 414
    const v0, 2131624008
    return v0
  :L8
  .line 411
    move-exception v1
  .line 412
    return v0
.end method

.method public static text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 450
    if-nez p0, :L0
    return-void
  :L0
  .line 451
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v0
  .line 452
    if-ne v0, p1, :L1
    return-void
  :L1
  .line 453
    if-eqz v0, :L2
    if-eqz p1, :L2
    invoke-interface { v0 }, Ljava/lang/CharSequence;->length()I
    move-result v1
    invoke-interface { p1 }, Ljava/lang/CharSequence;->length()I
    move-result v2
    if-ne v1, v2, :L2
  .line 454
    invoke-interface { v0 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-interface { p1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
  .line 455
    return-void
  :L2
  .line 457
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L3
  .line 460
    goto :L5
  :L4
  .line 458
    move-exception v0
  .line 459
    if-eqz p0, :L5
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L5
  .line 461
    return-void
.end method

.method public static watchFlat(Ljava/lang/Runnable;)V
  .registers 1
  .line 517
    sput-object p0, Lcom/innioasis/ipp/Rows;->flatWatch:Ljava/lang/Runnable;
  .line 518
    return-void
.end method

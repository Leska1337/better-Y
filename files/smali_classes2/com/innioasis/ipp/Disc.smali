.class public final Lcom/innioasis/ipp/Disc;
.super Ljava/lang/Object;
.source "Disc.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Disc$Warm;,
    Lcom/innioasis/ipp/Disc$Bar;,
    Lcom/innioasis/ipp/Disc$Commit;
  }
.end annotation

.field private final static BAR:Lcom/innioasis/ipp/Disc$Bar;

.field final static SIDE_BASE:I = 1000

.field private static albumAdapter:Ljava/lang/ref/WeakReference;

.field private static barLv:Ljava/lang/ref/WeakReference;

.field private static discs:[I

.field private static enabled:Z

.field private static genreAdapter1:Ljava/lang/ref/WeakReference;

.field private static genreAdapter2:Ljava/lang/ref/WeakReference;

.field private static groupStart:[I

.field private static posted:Z

.field private static preLv:Ljava/lang/ref/WeakReference;

.field private static shown:Ljava/lang/String;

.field private static sig:Ljava/lang/String;

.field private static singleAlbum:Z

.field private static tagNums:[I

.field private static warmSig:Ljava/lang/String;

.field private static wideDigits:I

.field private static wideSig:Ljava/lang/String;

.method static constructor <clinit>()V
  .registers 1
  .line 327
    const/4 v0, 1
    sput v0, Lcom/innioasis/ipp/Disc;->wideDigits:I
  .line 487
    new-instance v0, Lcom/innioasis/ipp/Disc$Bar;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Disc$Bar;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Disc;->BAR:Lcom/innioasis/ipp/Disc$Bar;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 48
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$002(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 48
    sput-object p0, Lcom/innioasis/ipp/Disc;->sig:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$102(Z)Z
  .registers 1
  .line 48
    sput-boolean p0, Lcom/innioasis/ipp/Disc;->posted:Z
    return p0
.end method

.method static synthetic access$200()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 48
    sget-object v0, Lcom/innioasis/ipp/Disc;->preLv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$202(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .registers 1
  .line 48
    sput-object p0, Lcom/innioasis/ipp/Disc;->preLv:Ljava/lang/ref/WeakReference;
    return-object p0
.end method

.method static synthetic access$300()Ljava/lang/ref/WeakReference;
  .registers 1
  .line 48
    sget-object v0, Lcom/innioasis/ipp/Disc;->barLv:Ljava/lang/ref/WeakReference;
    return-object v0
.end method

.method static synthetic access$400(Landroid/widget/ListView;)Ljava/lang/String;
  .registers 1
  .line 48
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->label(Landroid/widget/ListView;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$500(Landroid/widget/ListView;Ljava/lang/String;)V
  .registers 2
  .line 48
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Disc;->paint(Landroid/widget/ListView;Ljava/lang/String;)V
    return-void
.end method

.method private static album(Ljava/lang/Object;)Ljava/lang/String;
  .registers 2
  .line 135
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 136
    if-eqz p0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object p0
    goto :L2
  :L1
    const-string p0, ""
  :L2
    return-object p0
.end method

.method public static bind(Landroid/view/View;Ljava/util/List;ILjava/lang/Object;)V
  .registers 6
  .line 414
    if-nez p0, :L0
    return-void
  :L0
  .line 415
    const v0, 2131362549
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 416
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L1
    return-void
  :L1
  .line 417
    check-cast v0, Landroid/widget/TextView;
  .line 418
    invoke-static { p3 }, Lcom/innioasis/ipp/Disc;->discList(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L2
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->hide(Landroid/widget/TextView;)V
    return-void
  :L2
  .line 419
    invoke-static { p3 }, Lcom/innioasis/ipp/Disc;->flatOf(Ljava/lang/Object;)Z
    move-result p3
    invoke-static { p1, p3 }, Lcom/innioasis/ipp/Disc;->ensure(Ljava/util/List;Z)V
  .line 420
    sget-boolean p1, Lcom/innioasis/ipp/Disc;->enabled:Z
    if-eqz p1, :L7
    sget-object p1, Lcom/innioasis/ipp/Disc;->discs:[I
    if-eqz p1, :L7
    if-ltz p2, :L7
    array-length p3, p1
    if-lt p2, p3, :L3
    goto :L7
  :L3
  .line 422
    if-lez p2, :L6
    sget-object p3, Lcom/innioasis/ipp/Disc;->groupStart:[I
    aget p3, p3, p2
    if-eq p3, p2, :L4
    goto :L6
  :L4
  .line 424
    aget p1, p1, p2
    invoke-static { p1 }, Lcom/innioasis/ipp/Disc;->discLabel(I)Ljava/lang/String;
    move-result-object p1
  .line 429
    invoke-virtual { v0 }, Landroid/widget/TextView;->getTag()Ljava/lang/Object;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L5
    invoke-virtual { v0 }, Landroid/widget/TextView;->getVisibility()I
    move-result p2
    if-nez p2, :L5
    return-void
  :L5
  .line 430
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V
  .line 431
    invoke-virtual { v0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 432
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 433
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    const p2, 2131100252
    invoke-virtual { p0, p2 }, Landroid/content/res/Resources;->getColor(I)I
    move-result p0
  .line 432
    const/4 p2, 0
    invoke-virtual { p1, v0, p0, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 434
    invoke-virtual { v0, p2 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 440
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const p1, 2131231044
    invoke-virtual { p0, v0, p1, p2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 441
    invoke-static { v0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 442
    return-void
  :L6
  .line 422
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->hide(Landroid/widget/TextView;)V
    return-void
  :L7
  .line 420
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->hide(Landroid/widget/TextView;)V
    return-void
.end method

.method private static compute(Ljava/util/List;Z)V
  .registers 14
  .line 152
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 153
    new-array v1, v0, [I
    sput-object v1, Lcom/innioasis/ipp/Disc;->discs:[I
  .line 154
    new-array v1, v0, [I
    sput-object v1, Lcom/innioasis/ipp/Disc;->groupStart:[I
  .line 155
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Disc;->enabled:Z
  .line 156
    if-nez v0, :L0
    return-void
  :L0
  .line 158
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Disc;->album(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
  .line 159
    nop
  .line 160
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
  .line 161
    nop
  .line 162
    const/4 v4, 1
    const/4 v5, -1
    const/4 v6, 0
    const/4 v7, 1
    const/4 v8, 1
    const/4 v9, 1
  :L1
    if-ge v6, v0, :L6
  .line 163
    invoke-interface { p0, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v10
  .line 164
    invoke-static { v10 }, Lcom/innioasis/ipp/Disc;->album(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v11, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v11
    if-nez v11, :L2
    const/4 v7, 0
  :L2
  .line 165
    invoke-static { v10 }, Lcom/innioasis/ipp/Disc;->path(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v10
    invoke-static { v10 }, Lcom/innioasis/ipp/Albums;->discOf(Ljava/lang/String;)I
    move-result v10
  .line 166
    sget-object v11, Lcom/innioasis/ipp/Disc;->discs:[I
    aput v10, v11, v6
  .line 167
    if-gtz v10, :L3
    const/4 v9, 0
  :L3
  .line 168
    if-eq v10, v5, :L5
  .line 169
    invoke-static { v10 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v3, v5 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L4
    const/4 v8, 0
  :L4
  .line 170
    invoke-static { v10 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v3, v5 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L5
  .line 172
    nop
  .line 162
    add-int/lit8 v6, v6, 1
    move v5, v10
    goto :L1
  :L6
  .line 184
    if-eqz p1, :L7
    const/4 v7, 0
  :L7
  .line 186
    if-eqz v7, :L8
    if-eqz v8, :L8
    if-eqz v9, :L8
    const/4 p1, 1
    goto :L9
  :L8
    const/4 p1, 0
  :L9
    sput-boolean p1, Lcom/innioasis/ipp/Disc;->enabled:Z
  .line 188
    if-eqz p1, :L11
    invoke-virtual { v3 }, Ljava/util/HashSet;->size()I
    move-result p1
    if-ne p1, v4, :L11
    sget-object p1, Lcom/innioasis/ipp/Disc;->discs:[I
    aget p1, p1, v1
    const/4 v2, 2
    if-lt p1, v2, :L10
    const/16 v2, 1001
    if-ne p1, v2, :L11
  :L10
    sput-boolean v1, Lcom/innioasis/ipp/Disc;->enabled:Z
  :L11
  .line 190
    nop
  .line 191
    const/4 p1, 0
  :L12
    if-ge v1, v0, :L15
  .line 192
    if-eqz v1, :L13
    sget-object v2, Lcom/innioasis/ipp/Disc;->discs:[I
    aget v3, v2, v1
    add-int/lit8 v4, v1, -1
    aget v2, v2, v4
    if-eq v3, v2, :L14
  :L13
    move p1, v1
  :L14
  .line 193
    sget-object v2, Lcom/innioasis/ipp/Disc;->groupStart:[I
    aput p1, v2, v1
  .line 191
    add-int/lit8 v1, v1, 1
    goto :L12
  :L15
  .line 196
    sput-boolean v7, Lcom/innioasis/ipp/Disc;->singleAlbum:Z
  .line 197
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->tracks(Ljava/util/List;)[I
    move-result-object p0
    sput-object p0, Lcom/innioasis/ipp/Disc;->tagNums:[I
  .line 198
    return-void
.end method

.method private static digits(I)I
  .registers 3
  .line 373
    const/4 v0, 1
  :L0
  .line 374
    const/16 v1, 10
    if-lt p0, v1, :L1
    div-int/lit8 p0, p0, 10
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 375
    return v0
.end method

.method private static discLabel(I)Ljava/lang/String;
  .registers 4
  .line 395
    const/16 v0, 1000
    if-ge p0, v0, :L0
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "CD "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 396
    sub-int/2addr p0, v0
  .line 397
    const-string v0, "Side "
    const/4 v1, 1
    if-lt p0, v1, :L1
    const/16 v2, 26
    if-gt p0, v2, :L1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    add-int/lit8 p0, p0, 65
    sub-int/2addr p0, v1
    int-to-char p0, p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p0
    goto :L2
  :L1
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
  :L2
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static discList(Ljava/lang/Object;)Z
  .registers 2
  .line 107
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->isAlbumAdapter(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->isGenreAdapter(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method private static ensure(Ljava/util/List;Z)V
  .registers 7
  .line 140
    const/4 v0, 0
    if-nez p0, :L0
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Disc;->sig:Ljava/lang/String;
    sput-boolean v0, Lcom/innioasis/ipp/Disc;->enabled:Z
    return-void
  :L0
  .line 141
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
  .line 142
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    if-eqz p1, :L1
    const-string v3, "F|"
    goto :L2
  :L1
    const-string v3, "A|"
  :L2
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "|"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 143
    const-string v4, ""
    if-lez v1, :L3
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->path(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    goto :L4
  :L3
    move-object v0, v4
  :L4
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    if-lez v1, :L5
    add-int/lit8 v1, v1, -1
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Disc;->path(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v4
  :L5
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 144
    sget-object v1, Lcom/innioasis/ipp/Disc;->sig:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L6
    return-void
  :L6
  .line 147
    sput-object v0, Lcom/innioasis/ipp/Disc;->sig:Ljava/lang/String;
  .line 148
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Disc;->compute(Ljava/util/List;Z)V
  .line 149
    return-void
.end method

.method private static flatOf(Ljava/lang/Object;)Z
  .registers 1
  .line 118
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->isAlbumAdapter(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Albums;->isAllSongsList()Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static handOver(Landroid/widget/ListView;IZ)V
  .registers 4
  .line 610
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
    sub-int v0, p1, v0
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p0
  .line 611
    if-nez p0, :L0
    return-void
  :L0
  .line 612
    const v0, 2131362549
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 613
    instance-of v0, p0, Landroid/widget/TextView;
    if-nez v0, :L1
    return-void
  :L1
  .line 614
    check-cast p0, Landroid/widget/TextView;
  .line 615
    if-eqz p2, :L3
  .line 616
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object p1
    invoke-interface { p1 }, Ljava/lang/CharSequence;->length()I
    move-result p1
    if-nez p1, :L2
    return-void
  :L2
  .line 617
    const-string p1, ""
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 618
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V
    goto :L5
  :L3
  .line 619
    if-lez p1, :L5
    sget-object p2, Lcom/innioasis/ipp/Disc;->groupStart:[I
    aget p2, p2, p1
    if-ne p2, p1, :L5
    invoke-virtual { p0 }, Landroid/widget/TextView;->getVisibility()I
    move-result p2
    if-nez p2, :L5
  .line 620
    sget-object p2, Lcom/innioasis/ipp/Disc;->discs:[I
    aget p1, p2, p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Disc;->discLabel(I)Ljava/lang/String;
    move-result-object p1
  .line 621
    invoke-virtual { p0 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z
    move-result p2
    if-eqz p2, :L4
    return-void
  :L4
  .line 622
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 623
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V
  :L5
  .line 625
    return-void
.end method

.method private static hide(Landroid/widget/TextView;)V
  .registers 3
  .line 476
    invoke-virtual { p0 }, Landroid/widget/TextView;->getVisibility()I
    move-result v0
    const/16 v1, 8
    if-ne v0, v1, :L0
    invoke-virtual { p0 }, Landroid/widget/TextView;->getTag()Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L0
    return-void
  :L0
  .line 477
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V
  .line 478
    invoke-virtual { p0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 479
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 480
    return-void
.end method

.method private static isAlbumAdapter(Ljava/lang/Object;)Z
  .registers 2
  .line 57
    if-eqz p0, :L0
    sget-object v0, Lcom/innioasis/ipp/Disc;->albumAdapter:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static isGenreAdapter(Ljava/lang/Object;)Z
  .registers 4
  .line 91
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 92
    sget-object v1, Lcom/innioasis/ipp/Disc;->genreAdapter1:Ljava/lang/ref/WeakReference;
    const/4 v2, 1
    if-eqz v1, :L1
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, p0, :L1
    return v2
  :L1
  .line 93
    sget-object v1, Lcom/innioasis/ipp/Disc;->genreAdapter2:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, p0, :L2
    const/4 v0, 1
  :L2
    return v0
.end method

.method private static label(Landroid/widget/ListView;)Ljava/lang/String;
  .registers 5
  .line 561
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 562
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->discList(Ljava/lang/Object;)Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 563
    sget-boolean v0, Lcom/innioasis/ipp/Disc;->enabled:Z
    if-eqz v0, :L7
    sget-object v0, Lcom/innioasis/ipp/Disc;->discs:[I
    if-nez v0, :L1
    goto :L7
  :L1
  .line 571
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
  .line 572
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result v2
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Wheel;->firstShown(Landroid/widget/ListView;II)I
    move-result v0
  .line 573
    if-ltz v0, :L6
    sget-object v2, Lcom/innioasis/ipp/Disc;->discs:[I
    array-length v3, v2
    if-lt v0, v3, :L2
    goto :L6
  :L2
  .line 574
    aget v1, v2, v0
  .line 586
    if-lez v0, :L3
    sget-object v2, Lcom/innioasis/ipp/Disc;->groupStart:[I
    aget v2, v2, v0
    if-ne v2, v0, :L3
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Disc;->under(Landroid/widget/ListView;I)Z
    move-result v2
    if-eqz v2, :L3
    const/4 v2, 1
    goto :L4
  :L3
    const/4 v2, 0
  :L4
  .line 587
    if-lez v0, :L5
    sget-object v3, Lcom/innioasis/ipp/Disc;->groupStart:[I
    aget v3, v3, v0
    if-ne v3, v0, :L5
    if-nez v2, :L5
    sget-object v1, Lcom/innioasis/ipp/Disc;->discs:[I
    add-int/lit8 v3, v0, -1
    aget v1, v1, v3
  :L5
  .line 588
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Disc;->handOver(Landroid/widget/ListView;IZ)V
  .line 589
    invoke-static { v1 }, Lcom/innioasis/ipp/Disc;->discLabel(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L6
  .line 573
    return-object v1
  :L7
  .line 563
    return-object v1
.end method

.method public static note(Ljava/lang/Object;Landroid/view/View;)V
  .registers 3
  .line 501
    instance-of v0, p1, Landroid/widget/ListView;
    if-nez v0, :L0
    return-void
  :L0
  .line 502
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->discList(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L1
    check-cast p1, Landroid/widget/ListView;
    invoke-static { p1 }, Lcom/innioasis/ipp/Disc;->post(Landroid/widget/ListView;)V
  :L1
  .line 503
    return-void
.end method

.method public static number(Ljava/util/List;ILjava/lang/Object;)I
  .registers 4
  .line 303
    invoke-static { p2 }, Lcom/innioasis/ipp/Disc;->discList(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L0
    add-int/lit8 p1, p1, 1
    return p1
  :L0
  .line 304
    invoke-static { p2 }, Lcom/innioasis/ipp/Disc;->flatOf(Ljava/lang/Object;)Z
    move-result p2
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Disc;->ensure(Ljava/util/List;Z)V
  .line 305
    if-gez p1, :L1
    add-int/lit8 p1, p1, 1
    return p1
  :L1
  .line 306
    sget-object p0, Lcom/innioasis/ipp/Disc;->tagNums:[I
    if-eqz p0, :L2
    array-length p2, p0
    if-ge p1, p2, :L2
    aget p0, p0, p1
    return p0
  :L2
  .line 307
    sget-boolean p0, Lcom/innioasis/ipp/Disc;->enabled:Z
    if-eqz p0, :L4
    sget-object p0, Lcom/innioasis/ipp/Disc;->groupStart:[I
    array-length p2, p0
    if-lt p1, p2, :L3
    goto :L4
  :L3
  .line 308
    aget p0, p0, p1
    sub-int/2addr p1, p0
    add-int/lit8 p1, p1, 1
    return p1
  :L4
  .line 307
    add-int/lit8 p1, p1, 1
    return p1
.end method

.method public static offBar(Landroid/view/View;)V
  .registers 2
  .line 511
    instance-of v0, p0, Landroid/widget/ListView;
    if-nez v0, :L0
    return-void
  :L0
  .line 512
    move-object v0, p0
    check-cast v0, Landroid/widget/ListView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->post(Landroid/widget/ListView;)V
  .line 517
    invoke-static { p0 }, Lcom/innioasis/ipp/Status;->check(Landroid/view/View;)V
  .line 518
    return-void
.end method

.method public static offBarNow()V
  .registers 3
  .line 697
    sget-object v0, Lcom/innioasis/ipp/Disc;->barLv:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 698
    instance-of v2, v0, Landroid/widget/ListView;
    if-eqz v2, :L2
    check-cast v0, Landroid/widget/ListView;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Disc;->paint(Landroid/widget/ListView;Ljava/lang/String;)V
  :L2
  .line 699
    return-void
.end method

.method private static paint(Landroid/widget/ListView;Ljava/lang/String;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 4
  :L0
  .line 703
    invoke-virtual { p0 }, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;
    move-result-object p0
  .line 704
    instance-of v0, p0, Landroid/view/View;
    if-nez v0, :L1
    return-void
  :L1
  .line 705
    check-cast p0, Landroid/view/View;
    const v0, 2131362548
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 706
    instance-of v0, p0, Landroid/widget/TextView;
    if-nez v0, :L2
    return-void
  :L2
  .line 707
    check-cast p0, Landroid/widget/TextView;
  .line 709
    if-nez p1, :L4
  .line 710
    const/4 p1, 0
    sput-object p1, Lcom/innioasis/ipp/Disc;->shown:Ljava/lang/String;
  .line 711
    invoke-virtual { p0 }, Landroid/widget/TextView;->getVisibility()I
    move-result p1
    const/16 v0, 8
    if-eq p1, v0, :L3
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setVisibility(I)V
  :L3
  .line 712
    return-void
  :L4
  .line 714
    sget-object v0, Lcom/innioasis/ipp/Disc;->shown:Ljava/lang/String;
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L5
    invoke-virtual { p0 }, Landroid/widget/TextView;->getVisibility()I
    move-result v0
    if-nez v0, :L5
    return-void
  :L5
  .line 715
    sput-object p1, Lcom/innioasis/ipp/Disc;->shown:Ljava/lang/String;
  .line 716
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 723
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
  .line 724
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131100252
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getColor(I)I
    move-result v0
  .line 723
    const/4 v1, 0
    invoke-virtual { p1, p0, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 725
    sget-object p1, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const v0, 2131231044
    invoke-virtual { p1, p0, v0, v1 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetBackground(Landroid/view/View;IZ)V
  .line 726
    invoke-static { p0 }, Lcom/innioasis/ipp/Rows;->noSize(Landroid/view/View;)V
  .line 732
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->backdrop(Landroid/view/View;)V
  .line 733
    invoke-virtual { p0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  :L6
  .line 736
    goto :L8
  :L7
  .line 734
    move-exception p0
  :L8
  .line 737
    return-void
.end method

.method private static path(Ljava/lang/Object;)Ljava/lang/String;
  .registers 2
  .line 130
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 131
    if-eqz p0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    goto :L2
  :L1
    const-string p0, ""
  :L2
    return-object p0
.end method

.method private static post(Landroid/widget/ListView;)V
  .registers 3
  .line 540
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Disc;->barLv:Ljava/lang/ref/WeakReference;
  .line 541
    sget-boolean v0, Lcom/innioasis/ipp/Disc;->posted:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 542
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Disc;->posted:Z
  .line 543
    invoke-virtual { p0 }, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
  .line 544
    if-eqz v0, :L2
    invoke-virtual { v0 }, Landroid/view/ViewTreeObserver;->isAlive()Z
    move-result v1
    if-nez v1, :L1
    goto :L2
  :L1
  .line 548
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Disc;->preLv:Ljava/lang/ref/WeakReference;
  .line 549
    sget-object p0, Lcom/innioasis/ipp/Disc;->BAR:Lcom/innioasis/ipp/Disc$Bar;
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 550
    return-void
  :L2
  .line 545
    sget-object v0, Lcom/innioasis/ipp/Disc;->BAR:Lcom/innioasis/ipp/Disc$Bar;
    invoke-virtual { p0, v0 }, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
  .line 546
    return-void
.end method

.method public static preset(Ljava/lang/Object;Ljava/util/List;)V
  .registers 4
  .line 680
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->discList(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 687
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Disc;->sig:Ljava/lang/String;
  .line 688
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->flatOf(Ljava/lang/Object;)Z
    move-result p0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Disc;->ensure(Ljava/util/List;Z)V
  .line 689
    sget-object p0, Lcom/innioasis/ipp/Disc;->barLv:Ljava/lang/ref/WeakReference;
    if-nez p0, :L1
    move-object p0, v0
    goto :L2
  :L1
    invoke-virtual { p0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p0
  :L2
  .line 690
    instance-of p1, p0, Landroid/widget/ListView;
    if-nez p1, :L3
    return-void
  :L3
  .line 692
    check-cast p0, Landroid/widget/ListView;
    sget-boolean p1, Lcom/innioasis/ipp/Disc;->enabled:Z
    if-eqz p1, :L4
    sget-object p1, Lcom/innioasis/ipp/Disc;->discs:[I
    if-eqz p1, :L4
    array-length v1, p1
    if-lez v1, :L4
    const/4 v0, 0
    aget p1, p1, v0
    invoke-static { p1 }, Lcom/innioasis/ipp/Disc;->discLabel(I)Ljava/lang/String;
    move-result-object v0
  :L4
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Disc;->paint(Landroid/widget/ListView;Ljava/lang/String;)V
  .line 693
    return-void
.end method

.method public static preset(Ljava/lang/Object;Ljava/util/List;Landroid/widget/ListView;)V
  .registers 4
  .line 675
    if-eqz p2, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->discList(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Disc;->barLv:Ljava/lang/ref/WeakReference;
  :L0
  .line 676
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Disc;->preset(Ljava/lang/Object;Ljava/util/List;)V
  .line 677
    return-void
.end method

.method public static rowIndex(Lcom/innioasis/y1/database/Song;Ljava/util/List;ILjava/lang/Object;)Ljava/lang/String;
  .registers 4
  .line 317
    invoke-static { p1, p2, p3 }, Lcom/innioasis/ipp/Disc;->number(Ljava/util/List;ILjava/lang/Object;)I
    move-result p0
  .line 321
    if-gtz p0, :L0
    const-string p0, "#"
    goto :L1
  :L0
    invoke-static { p0 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method public static setAlbumAdapter(Ljava/lang/Object;)V
  .registers 2
  .line 53
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    move-object p0, v0
  :L1
    sput-object p0, Lcom/innioasis/ipp/Disc;->albumAdapter:Ljava/lang/ref/WeakReference;
  .line 54
    return-void
.end method

.method public static setGenreAdapters(Ljava/lang/Object;Ljava/lang/Object;)V
  .registers 4
  .line 86
    const/4 v0, 0
    if-nez p0, :L0
    move-object v1, v0
    goto :L1
  :L0
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L1
    sput-object v1, Lcom/innioasis/ipp/Disc;->genreAdapter1:Ljava/lang/ref/WeakReference;
  .line 87
    if-nez p1, :L2
    goto :L3
  :L2
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L3
    sput-object v0, Lcom/innioasis/ipp/Disc;->genreAdapter2:Ljava/lang/ref/WeakReference;
  .line 88
    return-void
.end method

.method public static startsDisc(I)Z
  .registers 3
  .line 455
    sget-boolean v0, Lcom/innioasis/ipp/Disc;->enabled:Z
    if-eqz v0, :L0
    sget-object v0, Lcom/innioasis/ipp/Disc;->groupStart:[I
    if-eqz v0, :L0
    if-lez p0, :L0
    array-length v1, v0
    if-ge p0, v1, :L0
    aget v0, v0, p0
    if-ne v0, p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static stripPx(Landroid/view/View;)I
  .registers 4
  .line 465
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 466
    const v1, 2131362549
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 467
    if-nez p0, :L1
    return v0
  :L1
  .line 468
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
  .line 469
    if-eqz v1, :L2
    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-lez v2, :L2
    iget p0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I
    return p0
  :L2
  .line 470
    instance-of v1, p0, Landroid/widget/TextView;
    if-nez v1, :L3
    return v0
  :L3
  .line 471
    check-cast p0, Landroid/widget/TextView;
  .line 472
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLineHeight()I
    move-result v0
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingTop()I
    move-result v1
    add-int/2addr v0, v1
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingBottom()I
    move-result p0
    add-int/2addr v0, p0
    return v0
.end method

.method private static tagsWanted()Z
  .registers 2
  .line 204
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 205
    const-string v1, "track_numbers"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static tracks(Ljava/util/List;)[I
  .registers 10
  .line 233
    sget-boolean v0, Lcom/innioasis/ipp/Disc;->singleAlbum:Z
    const/4 v1, 0
    if-eqz v0, :L11
    invoke-static { }, Lcom/innioasis/ipp/Disc;->tagsWanted()Z
    move-result v0
    if-nez v0, :L0
    goto :L11
  :L0
  .line 234
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 235
    if-nez v0, :L1
    return-object v1
  :L1
  .line 236
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->warm()V
  .line 237
    new-array v2, v0, [I
  .line 238
    nop
  .line 239
    const/4 v3, 0
    move-object v5, v1
    const/4 v4, 0
  :L2
    if-ge v4, v0, :L6
  .line 240
    invoke-interface { p0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Disc;->path(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v6
  .line 241
    invoke-static { v6 }, Lcom/innioasis/ipp/TrackCache;->get(Ljava/lang/String;)I
    move-result v7
  .line 242
    if-lez v7, :L3
    const v8, 2147483647
    if-eq v7, v8, :L3
    aput v7, v2, v4
    goto :L5
  :L3
  .line 243
    aput v3, v2, v4
  .line 246
    invoke-static { v6 }, Lcom/innioasis/ipp/DiscCache;->known(Ljava/lang/String;)Z
    move-result v7
    if-nez v7, :L5
  .line 247
    if-nez v5, :L4
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  :L4
  .line 248
    invoke-virtual { v5, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 239
    add-int/lit8 v4, v4, 1
    goto :L2
  :L6
  .line 251
    if-eqz v5, :L7
    invoke-static { v5 }, Lcom/innioasis/ipp/Disc;->warm(Ljava/util/List;)V
    return-object v1
  :L7
  .line 252
    nop
  :L8
    if-ge v3, v0, :L10
    aget p0, v2, v3
    if-eqz p0, :L9
    return-object v2
  :L9
    add-int/lit8 v3, v3, 1
    goto :L8
  :L10
  .line 253
    return-object v1
  :L11
  .line 233
    return-object v1
.end method

.method private static under(Landroid/widget/ListView;I)Z
  .registers 3
  .line 636
    invoke-virtual { p0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
    sub-int/2addr p1, v0
    invoke-virtual { p0, p1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object p1
  .line 637
    if-eqz p1, :L0
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result p1
    invoke-static { p0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result p0
    if-ge p1, p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static variableRows(Ljava/lang/Object;)Z
  .registers 1
  .line 450
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->discList(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    sget-boolean p0, Lcom/innioasis/ipp/Disc;->enabled:Z
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static warm(Ljava/util/List;)V
  .registers 3
  .line 267
    sget-object v0, Lcom/innioasis/ipp/Disc;->sig:Ljava/lang/String;
    if-eqz v0, :L1
    sget-object v1, Lcom/innioasis/ipp/Disc;->warmSig:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 268
    sget-object v0, Lcom/innioasis/ipp/Disc;->sig:Ljava/lang/String;
    sput-object v0, Lcom/innioasis/ipp/Disc;->warmSig:Ljava/lang/String;
  .line 269
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Disc$Warm;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/Disc$Warm;-><init>(Ljava/util/List;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 270
    return-void
  :L1
  .line 267
    return-void
.end method

.method private static widest(I)I
  .registers 5
  .line 356
    nop
  .line 357
    sget-object v0, Lcom/innioasis/ipp/Disc;->tagNums:[I
    const/4 v1, 0
    const/4 v2, 1
    if-eqz v0, :L5
  .line 358
    const/4 p0, 1
  :L0
    sget-object v0, Lcom/innioasis/ipp/Disc;->tagNums:[I
    array-length v3, v0
    if-ge v1, v3, :L4
  .line 359
    aget v0, v0, v1
    if-gtz v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->digits(I)I
    move-result v0
  :L2
  .line 360
    if-le v0, p0, :L3
    move p0, v0
  :L3
  .line 358
    add-int/lit8 v1, v1, 1
    goto :L0
  :L4
  .line 362
    return p0
  :L5
  .line 364
    sget-boolean v0, Lcom/innioasis/ipp/Disc;->enabled:Z
    if-eqz v0, :L10
    sget-object v0, Lcom/innioasis/ipp/Disc;->groupStart:[I
    if-eqz v0, :L10
    array-length v0, v0
    if-ge v0, p0, :L6
    goto :L10
  :L6
  .line 365
    const/4 v0, 1
  :L7
    if-ge v1, p0, :L9
  .line 366
    sget-object v3, Lcom/innioasis/ipp/Disc;->groupStart:[I
    aget v3, v3, v1
    sub-int v3, v1, v3
    add-int/2addr v3, v2
    invoke-static { v3 }, Lcom/innioasis/ipp/Disc;->digits(I)I
    move-result v3
  .line 367
    if-le v3, v0, :L8
    move v0, v3
  :L8
  .line 365
    add-int/lit8 v1, v1, 1
    goto :L7
  :L9
  .line 369
    return v0
  :L10
  .line 364
    invoke-static { p0 }, Lcom/innioasis/ipp/Disc;->digits(I)I
    move-result p0
    return p0
.end method

.method public static widestIndex(Ljava/util/List;Ljava/lang/Object;)I
  .registers 4
  .line 344
    if-nez p0, :L0
    const/4 p0, 1
    return p0
  :L0
  .line 345
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 346
    invoke-static { p1 }, Lcom/innioasis/ipp/Disc;->discList(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->digits(I)I
    move-result p0
    return p0
  :L1
  .line 347
    invoke-static { p1 }, Lcom/innioasis/ipp/Disc;->flatOf(Ljava/lang/Object;)Z
    move-result p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Disc;->ensure(Ljava/util/List;Z)V
  .line 348
    sget-object p0, Lcom/innioasis/ipp/Disc;->sig:Ljava/lang/String;
    if-eqz p0, :L2
    sget-object p1, Lcom/innioasis/ipp/Disc;->wideSig:Ljava/lang/String;
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L2
    sget p0, Lcom/innioasis/ipp/Disc;->wideDigits:I
    return p0
  :L2
  .line 349
    sget-object p0, Lcom/innioasis/ipp/Disc;->sig:Ljava/lang/String;
    sput-object p0, Lcom/innioasis/ipp/Disc;->wideSig:Ljava/lang/String;
  .line 350
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->widest(I)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Disc;->wideDigits:I
  .line 351
    return p0
.end method

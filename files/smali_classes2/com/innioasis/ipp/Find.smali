.class public final Lcom/innioasis/ipp/Find;
.super Ljava/lang/Object;
.source "Find.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Find$Info;,
    Lcom/innioasis/ipp/Find$AlbumRead;,
    Lcom/innioasis/ipp/Find$TrackRead;,
    Lcom/innioasis/ipp/Find$Paint;,
    Lcom/innioasis/ipp/Find$NameCmp;
  }
.end annotation

.field private final static NAME_CMP:Ljava/util/Comparator;

.field private final static OWN_MAX:I = 32

.field private final static SAME:Ljava/lang/Object;

.field private final static THUMB:I = 50

.field private final static infos:Ljava/util/Hashtable;

.field private static menuDlg:Lcom/innioasis/music/util/SubMenuDialog;

.field private final static own:Ljava/util/Hashtable;

.field private final static reading:Ljava/util/Hashtable;

.method static constructor <clinit>()V
  .registers 2
  .line 87
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Find;->infos:Ljava/util/Hashtable;
  .line 90
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Find;->reading:Ljava/util/Hashtable;
  .line 98
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Find;->own:Ljava/util/Hashtable;
  .line 99
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Find;->SAME:Ljava/lang/Object;
  .line 438
    new-instance v0, Lcom/innioasis/ipp/Find$NameCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Find$NameCmp;-><init>(Lcom/innioasis/ipp/Find$1;)V
    sput-object v0, Lcom/innioasis/ipp/Find;->NAME_CMP:Ljava/util/Comparator;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 49
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
  .registers 4
  .line 47
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Find;->post(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 1
  .line 47
    invoke-static { p0 }, Lcom/innioasis/ipp/Find;->trackArt(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$200()Ljava/util/Hashtable;
  .registers 1
  .line 47
    sget-object v0, Lcom/innioasis/ipp/Find;->own:Ljava/util/Hashtable;
    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/Object;
  .registers 1
  .line 47
    sget-object v0, Lcom/innioasis/ipp/Find;->SAME:Ljava/lang/Object;
    return-object v0
.end method

.method private static albumCover(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 6
  .line 144
    if-nez p0, :L0
    return-void
  :L0
  .line 145
    nop
  .line 146
    const/4 v0, 0
    if-eqz p1, :L4
  :L1
  .line 148
    invoke-static { p1 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L2
  .line 151
    goto :L4
  :L3
  .line 149
    move-exception v1
  .line 150
    nop
  :L4
  .line 153
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V
  .line 154
    if-eqz v0, :L5
    move-object v1, v0
    goto :L6
  :L5
    move-object v1, p3
  :L6
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 155
    if-nez v0, :L9
    if-eqz p1, :L9
    if-nez p2, :L7
    goto :L9
  :L7
  .line 156
    invoke-static { p1 }, Lcom/innioasis/ipp/Find;->start(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L8
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Find$AlbumRead;
    invoke-direct { v1, p0, p1, p2, p3 }, Lcom/innioasis/ipp/Find$AlbumRead;-><init>(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  :L8
  .line 157
    return-void
  :L9
  .line 155
    return-void
.end method

.method public static albumRow(Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/innioasis/music/data/Album;Landroid/graphics/Bitmap;)V
  .registers 7
  .line 125
    if-nez p3, :L0
    return-void
  :L0
  .line 126
    invoke-virtual { p3 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p3
  .line 131
    if-eqz p1, :L1
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-static { p3 }, Lcom/innioasis/ipp/Prefs;->albumLabel(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L1
  .line 132
    invoke-static { p3 }, Lcom/innioasis/ipp/Find;->infoOf(Ljava/lang/String;)Lcom/innioasis/ipp/Find$Info;
    move-result-object p1
  .line 133
    if-eqz p2, :L2
    invoke-virtual { p2 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Find;->label(Landroid/content/Context;Lcom/innioasis/ipp/Find$Info;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p2, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L2
  .line 134
    if-nez p1, :L3
    const/4 p1, 0
    goto :L4
  :L3
    iget-object p1, p1, Lcom/innioasis/ipp/Find$Info;->path:Ljava/lang/String;
  :L4
    invoke-static { p0, p3, p1, p4 }, Lcom/innioasis/ipp/Find;->albumCover(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .line 135
    return-void
.end method

.method public static clear()V
  .registers 1
  .line 104
    sget-object v0, Lcom/innioasis/ipp/Find;->infos:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 105
    sget-object v0, Lcom/innioasis/ipp/Find;->reading:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 106
    sget-object v0, Lcom/innioasis/ipp/Find;->own:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 107
    return-void
.end method

.method private static digit(C)Z
  .registers 2
  .line 429
    const/16 v0, 48
    if-lt p0, v0, :L0
    const/16 v0, 57
    if-gt p0, v0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static head(Lcom/innioasis/y1/databinding/ActivitySearchBinding;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 56
    if-nez p0, :L0
    return-void
  :L0
  .line 58
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivitySearchBinding;->iconBg:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Find;->menuPlate(Landroid/view/View;)V
  .line 59
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivitySearchBinding;->icon:Landroid/widget/ImageView;
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->menuText(Z)I
    move-result v0
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { p0, v0, v1 }, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  :L1
  .line 62
    goto :L3
  :L2
  .line 60
    move-exception p0
  :L3
  .line 63
    return-void
.end method

.method private static hit(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 4
  .line 433
    const/4 v0, 0
    if-eqz p0, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L0
    goto :L3
  :L0
  .line 434
    const-string v1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    return v0
  :L1
  .line 435
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0, p1 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result p0
    if-ltz p0, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 433
    return v0
.end method

.method private static infoOf(Ljava/lang/String;)Lcom/innioasis/ipp/Find$Info;
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 323
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 324
    sget-object v1, Lcom/innioasis/ipp/Find;->infos:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 325
    if-eqz v1, :L1
    check-cast v1, Lcom/innioasis/ipp/Find$Info;
    return-object v1
  :L1
  .line 328
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->songsOf(Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
  :L2
  .line 331
    goto :L4
  :L3
  .line 329
    move-exception v1
  .line 330
    move-object v1, v0
  :L4
  .line 332
    if-nez v1, :L5
    return-object v0
  :L5
  .line 333
    new-instance v2, Lcom/innioasis/ipp/Find$Info;
    invoke-direct { v2, v0 }, Lcom/innioasis/ipp/Find$Info;-><init>(Lcom/innioasis/ipp/Find$1;)V
  .line 334
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v0
    iput v0, v2, Lcom/innioasis/ipp/Find$Info;->n:I
  .line 335
    iget v0, v2, Lcom/innioasis/ipp/Find$Info;->n:I
    if-lez v0, :L6
  .line 336
    const/4 v0, 0
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 337
    if-eqz v0, :L6
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    iput-object v0, v2, Lcom/innioasis/ipp/Find$Info;->path:Ljava/lang/String;
  :L6
  .line 339
    sget-object v0, Lcom/innioasis/ipp/Find;->infos:Ljava/util/Hashtable;
    invoke-virtual { v0, p0, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 340
    return-object v2
.end method

.method private static label(Landroid/content/Context;Lcom/innioasis/ipp/Find$Info;)Ljava/lang/String;
  .registers 3
  .line 344
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 345
    const v0, 2131820851
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
  .line 348
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    if-nez p1, :L1
    const/4 p1, 0
    goto :L2
  :L1
    iget p1, p1, Lcom/innioasis/ipp/Find$Info;->n:I
  :L2
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string v0, " "
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static menu(Lcom/innioasis/music/util/SubMenuDialog;Landroid/app/Activity;Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .registers 5
  .line 464
    if-eqz p0, :L3
    if-nez p1, :L0
    goto :L3
  :L0
  .line 465
    sput-object p0, Lcom/innioasis/ipp/Find;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
  .line 466
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 467
    const v1, 2131820844
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 468
    const v1, 2131820584
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 469
    const v1, 2131820841
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 470
    const v1, 2131821047
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 473
    invoke-static { p2 }, Lcom/innioasis/ipp/Find;->songOf(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Artists;->of(Lcom/innioasis/y1/database/Song;)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :L1
    const v1, 2131821105
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 474
    invoke-static { p2 }, Lcom/innioasis/ipp/Find;->songOf(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object p2
    if-eqz p2, :L2
    const p2, 2131821071
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 475
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 476
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 477
    return-void
  :L3
  .line 464
    return-void
.end method

.method private static menuPlate(Landroid/view/View;)V
  .registers 4
  .line 76
    if-nez p0, :L0
    return-void
  :L0
  .line 77
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct { v0 }, Landroid/graphics/drawable/GradientDrawable;-><init>()V
  .line 78
    invoke-static { }, Lcom/innioasis/ipp/Icons;->menuBackground()I
    move-result v1
    invoke-virtual { v0, v1 }, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
  .line 79
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v2, 0x41000000
    mul-float v1, v1, v2
    invoke-virtual { v0, v1 }, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
  .line 80
    invoke-virtual { p0, v0 }, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 81
    return-void
.end method

.method public static openAlbum(Landroid/app/Activity;Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .registers 5
  .line 499
    invoke-static { p1 }, Lcom/innioasis/ipp/Find;->songOf(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 500
    if-nez v0, :L0
    return-void
  :L0
  .line 501
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v1
  .line 502
    if-eqz v1, :L1
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L1
  .line 503
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 504
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  :L1
  .line 506
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Albums;->openAlbumOfSong(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;)V
  .line 507
    return-void
.end method

.method public static openArtist(Landroid/app/Activity;Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Z
  .registers 5
  .line 487
    invoke-static { p1 }, Lcom/innioasis/ipp/Find;->songOf(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 488
    if-nez v0, :L0
    const/4 p0, 1
    return p0
  :L0
  .line 489
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v1
  .line 490
    if-eqz v1, :L1
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L1
  .line 491
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 492
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  :L1
  .line 494
    sget-object p1, Lcom/innioasis/ipp/Find;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Artists;->openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/y1/database/Song;)Z
    move-result p0
    return p0
.end method

.method public static plate(Landroid/view/View;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 2
  .line 67
    if-nez p0, :L0
    return-void
  :L0
  .line 69
    const v0, 2131362080
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Find;->menuPlate(Landroid/view/View;)V
  :L2
  .line 72
    goto :L4
  :L3
  .line 70
    move-exception p0
  :L4
  .line 73
    return-void
.end method

.method private static post(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 281
    new-instance v0, Lcom/innioasis/ipp/Find$Paint;
    invoke-direct { v0, p0, p1, p2, p3 }, Lcom/innioasis/ipp/Find$Paint;-><init>(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z
  :L1
  .line 284
    goto :L3
  :L2
  .line 282
    move-exception p0
  :L3
  .line 285
    return-void
.end method

.method private static songCover(Landroid/widget/ImageView;Lcom/innioasis/y1/database/Song;Landroid/graphics/Bitmap;)V
  .catchall { :L5 .. :L6 } :L7
  .registers 7
  .line 172
    if-nez p0, :L0
    return-void
  :L0
  .line 173
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 174
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
  .line 175
    const/4 v1, 0
    if-nez v0, :L1
    move-object v2, v1
    goto :L2
  :L1
    sget-object v2, Lcom/innioasis/ipp/Find;->own:Ljava/util/Hashtable;
    invoke-virtual { v2, v0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  :L2
  .line 176
    instance-of v3, v2, Landroid/graphics/Bitmap;
    if-eqz v3, :L3
    move-object v3, v2
    check-cast v3, Landroid/graphics/Bitmap;
    goto :L4
  :L3
    move-object v3, v1
  :L4
  .line 177
    if-nez v3, :L8
  :L5
  .line 179
    invoke-static { p1 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L6
  .line 182
    goto :L9
  :L7
  .line 180
    move-exception v3
  .line 181
    goto :L9
  :L8
  .line 177
    move-object v1, v3
  :L9
  .line 184
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V
  .line 185
    if-eqz v1, :L10
    goto :L11
  :L10
    move-object v1, p2
  :L11
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 186
    if-eqz v0, :L14
    if-eqz v2, :L12
    goto :L14
  :L12
  .line 187
    invoke-static { v0 }, Lcom/innioasis/ipp/Find;->start(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L13
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Find$TrackRead;
    invoke-direct { v2, p0, p1, v0, p2 }, Lcom/innioasis/ipp/Find$TrackRead;-><init>(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  :L13
  .line 188
    return-void
  :L14
  .line 186
    return-void
.end method

.method private static songOf(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Lcom/innioasis/y1/database/Song;
  .registers 3
  .line 511
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 512
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p0
  .line 513
    instance-of v1, p0, Lcom/innioasis/music/SearchActivity$Item;
    if-nez v1, :L1
    return-object v0
  :L1
  .line 514
    check-cast p0, Lcom/innioasis/music/SearchActivity$Item;
    invoke-virtual { p0 }, Lcom/innioasis/music/SearchActivity$Item;->getSong()Lcom/innioasis/y1/database/Song;
    move-result-object p0
    return-object p0
.end method

.method public static songRow(Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/innioasis/y1/database/Song;Landroid/graphics/Bitmap;)V
  .registers 8
  .line 112
    if-nez p3, :L0
    return-void
  :L0
  .line 113
    if-eqz p1, :L1
  .line 116
    invoke-virtual { p1 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Ipp;->songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 117
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L1
  .line 120
    if-eqz p2, :L2
    sget-object p1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L2
  .line 121
    invoke-static { p0, p3, p4 }, Lcom/innioasis/ipp/Find;->songCover(Landroid/widget/ImageView;Lcom/innioasis/y1/database/Song;Landroid/graphics/Bitmap;)V
  .line 122
    return-void
.end method

.method public static songs(Ljava/lang/String;)Ljava/util/List;
  .catchall { :L1 .. :L2 } :L3
  .registers 6
  .line 373
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 374
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 375
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 378
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  :L2
  .line 381
    goto :L4
  :L3
  .line 379
    move-exception v1
  .line 380
    move-object v1, v0
  :L4
  .line 382
    if-nez v1, :L5
    return-object v0
  :L5
  .line 383
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 384
    const/4 v2, 0
  :L6
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L10
  .line 385
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 386
    if-nez v3, :L7
    goto :L9
  :L7
  .line 387
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Find;->unnumbered(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, p0 }, Lcom/innioasis/ipp/Find;->hit(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L8
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, p0 }, Lcom/innioasis/ipp/Find;->hit(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L8
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, p0 }, Lcom/innioasis/ipp/Find;->hit(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L9
  :L8
  .line 388
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L9
  .line 384
    add-int/lit8 v2, v2, 1
    goto :L6
  :L10
  .line 391
    sget-object p0, Lcom/innioasis/ipp/Find;->NAME_CMP:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 392
    return-object v0
.end method

.method private static start(Ljava/lang/String;)Z
  .registers 3
  .line 192
    sget-object v0, Lcom/innioasis/ipp/Find;->reading:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 193
    invoke-virtual { v0, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 194
    const/4 p0, 1
    return p0
.end method

.method private static trackArt(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  .line 263
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    return-object v0
  :L1
  .line 264
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->needs(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L2
  .line 265
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->ownArt(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L3
    return-object v0
  :L3
  .line 266
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    const/16 v2, 50
    invoke-virtual { v1, p0, v2, v2 }, Lcom/innioasis/music/util/Other;->getAlbumCover(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 267
    if-nez p0, :L4
    return-object v0
  :L4
  .line 268
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  :L5
  .line 269
    if-eqz v0, :L6
    move-object p0, v0
  :L6
    return-object p0
  :L7
  .line 270
    move-exception p0
  .line 271
    return-object v0
.end method

.method private static unnumbered(Ljava/lang/String;)Ljava/lang/String;
  .registers 6
  .line 411
    if-eqz p0, :L11
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto/16 :L11
  :L0
  .line 412
    nop
  .line 413
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    const/16 v2, 40
    if-ne v1, v2, :L4
  .line 414
    const/4 v1, 1
    const/4 v2, 1
  :L1
  .line 415
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v3
    if-ge v2, v3, :L2
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Find;->digit(C)Z
    move-result v3
    if-eqz v3, :L2
    add-int/lit8 v2, v2, 1
    goto :L1
  :L2
  .line 416
    if-le v2, v1, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v3
    if-ge v2, v3, :L3
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v3
    const/16 v4, 41
    if-ne v3, v4, :L3
    add-int/lit8 v0, v2, 1
  :L3
  .line 417
    goto :L5
  :L4
  .line 418
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-ge v0, v1, :L5
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Find;->digit(C)Z
    move-result v1
    if-eqz v1, :L5
    add-int/lit8 v0, v0, 1
    goto :L4
  :L5
  .line 420
    if-nez v0, :L6
    return-object p0
  :L6
  .line 421
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-ge v0, v1, :L8
  .line 422
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v1
  .line 423
    const/16 v2, 32
    if-eq v1, v2, :L7
    const/16 v2, 46
    if-eq v1, v2, :L7
    const/16 v2, 45
    if-eq v1, v2, :L7
    const/16 v2, 95
    if-ne v1, v2, :L8
  :L7
    add-int/lit8 v0, v0, 1
  .line 424
    goto :L6
  :L8
  .line 425
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lt v0, v1, :L9
    goto :L10
  :L9
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  :L10
    return-object p0
  :L11
  .line 411
    return-object p0
.end method

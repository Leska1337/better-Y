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
  .line 52
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Find;->infos:Ljava/util/Hashtable;
  .line 55
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Find;->reading:Ljava/util/Hashtable;
  .line 63
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Find;->own:Ljava/util/Hashtable;
  .line 64
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Find;->SAME:Ljava/lang/Object;
  .line 403
    new-instance v0, Lcom/innioasis/ipp/Find$NameCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Find$NameCmp;-><init>(Lcom/innioasis/ipp/Find$1;)V
    sput-object v0, Lcom/innioasis/ipp/Find;->NAME_CMP:Ljava/util/Comparator;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 46
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
  .registers 4
  .line 44
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Find;->post(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Find;->trackArt(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$200()Ljava/util/Hashtable;
  .registers 1
  .line 44
    sget-object v0, Lcom/innioasis/ipp/Find;->own:Ljava/util/Hashtable;
    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/Object;
  .registers 1
  .line 44
    sget-object v0, Lcom/innioasis/ipp/Find;->SAME:Ljava/lang/Object;
    return-object v0
.end method

.method private static albumCover(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 6
  .line 109
    if-nez p0, :L0
    return-void
  :L0
  .line 110
    nop
  .line 111
    const/4 v0, 0
    if-eqz p1, :L4
  :L1
  .line 113
    invoke-static { p1 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L2
  .line 116
    goto :L4
  :L3
  .line 114
    move-exception v1
  .line 115
    nop
  :L4
  .line 118
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V
  .line 119
    if-eqz v0, :L5
    move-object v1, v0
    goto :L6
  :L5
    move-object v1, p3
  :L6
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 120
    if-nez v0, :L9
    if-eqz p1, :L9
    if-nez p2, :L7
    goto :L9
  :L7
  .line 121
    invoke-static { p1 }, Lcom/innioasis/ipp/Find;->start(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L8
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Find$AlbumRead;
    invoke-direct { v1, p0, p1, p2, p3 }, Lcom/innioasis/ipp/Find$AlbumRead;-><init>(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  :L8
  .line 122
    return-void
  :L9
  .line 120
    return-void
.end method

.method public static albumRow(Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/innioasis/music/data/Album;Landroid/graphics/Bitmap;)V
  .registers 7
  .line 90
    if-nez p3, :L0
    return-void
  :L0
  .line 91
    invoke-virtual { p3 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p3
  .line 96
    if-eqz p1, :L1
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-static { p3 }, Lcom/innioasis/ipp/Prefs;->albumLabel(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L1
  .line 97
    invoke-static { p3 }, Lcom/innioasis/ipp/Find;->infoOf(Ljava/lang/String;)Lcom/innioasis/ipp/Find$Info;
    move-result-object p1
  .line 98
    if-eqz p2, :L2
    invoke-virtual { p2 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Find;->label(Landroid/content/Context;Lcom/innioasis/ipp/Find$Info;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p2, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L2
  .line 99
    if-nez p1, :L3
    const/4 p1, 0
    goto :L4
  :L3
    iget-object p1, p1, Lcom/innioasis/ipp/Find$Info;->path:Ljava/lang/String;
  :L4
    invoke-static { p0, p3, p1, p4 }, Lcom/innioasis/ipp/Find;->albumCover(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .line 100
    return-void
.end method

.method public static clear()V
  .registers 1
  .line 69
    sget-object v0, Lcom/innioasis/ipp/Find;->infos:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 70
    sget-object v0, Lcom/innioasis/ipp/Find;->reading:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 71
    sget-object v0, Lcom/innioasis/ipp/Find;->own:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 72
    return-void
.end method

.method private static digit(C)Z
  .registers 2
  .line 394
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

.method private static hit(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 4
  .line 398
    const/4 v0, 0
    if-eqz p0, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L0
    goto :L3
  :L0
  .line 399
    const-string v1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    return v0
  :L1
  .line 400
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
  .line 398
    return v0
.end method

.method private static infoOf(Ljava/lang/String;)Lcom/innioasis/ipp/Find$Info;
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 288
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 289
    sget-object v1, Lcom/innioasis/ipp/Find;->infos:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 290
    if-eqz v1, :L1
    check-cast v1, Lcom/innioasis/ipp/Find$Info;
    return-object v1
  :L1
  .line 293
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->songsOf(Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
  :L2
  .line 296
    goto :L4
  :L3
  .line 294
    move-exception v1
  .line 295
    move-object v1, v0
  :L4
  .line 297
    if-nez v1, :L5
    return-object v0
  :L5
  .line 298
    new-instance v2, Lcom/innioasis/ipp/Find$Info;
    invoke-direct { v2, v0 }, Lcom/innioasis/ipp/Find$Info;-><init>(Lcom/innioasis/ipp/Find$1;)V
  .line 299
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v0
    iput v0, v2, Lcom/innioasis/ipp/Find$Info;->n:I
  .line 300
    iget v0, v2, Lcom/innioasis/ipp/Find$Info;->n:I
    if-lez v0, :L6
  .line 301
    const/4 v0, 0
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/database/Song;
  .line 302
    if-eqz v0, :L6
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    iput-object v0, v2, Lcom/innioasis/ipp/Find$Info;->path:Ljava/lang/String;
  :L6
  .line 304
    sget-object v0, Lcom/innioasis/ipp/Find;->infos:Ljava/util/Hashtable;
    invoke-virtual { v0, p0, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 305
    return-object v2
.end method

.method private static label(Landroid/content/Context;Lcom/innioasis/ipp/Find$Info;)Ljava/lang/String;
  .registers 3
  .line 309
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 310
    const v0, 2131820851
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
  .line 313
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
  .line 429
    if-eqz p0, :L3
    if-nez p1, :L0
    goto :L3
  :L0
  .line 430
    sput-object p0, Lcom/innioasis/ipp/Find;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
  .line 431
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 432
    const v1, 2131820844
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 433
    const v1, 2131820584
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 434
    const v1, 2131820841
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 435
    const v1, 2131821047
    invoke-virtual { p1, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 438
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
  .line 439
    invoke-static { p2 }, Lcom/innioasis/ipp/Find;->songOf(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object p2
    if-eqz p2, :L2
    const p2, 2131821071
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 440
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/util/SubMenuDialog;->setList(Ljava/util/List;)V
  .line 441
    invoke-virtual { p0 }, Lcom/innioasis/music/util/SubMenuDialog;->addPlaylistsToOptions()V
  .line 442
    return-void
  :L3
  .line 429
    return-void
.end method

.method public static openAlbum(Landroid/app/Activity;Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
  .registers 5
  .line 464
    invoke-static { p1 }, Lcom/innioasis/ipp/Find;->songOf(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 465
    if-nez v0, :L0
    return-void
  :L0
  .line 466
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v1
  .line 467
    if-eqz v1, :L1
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L1
  .line 468
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 469
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  :L1
  .line 471
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Albums;->openAlbumOfSong(Landroid/app/Activity;Lcom/innioasis/y1/database/Song;)V
  .line 472
    return-void
.end method

.method public static openArtist(Landroid/app/Activity;Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Z
  .registers 5
  .line 452
    invoke-static { p1 }, Lcom/innioasis/ipp/Find;->songOf(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 453
    if-nez v0, :L0
    const/4 p0, 1
    return p0
  :L0
  .line 454
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v1
  .line 455
    if-eqz v1, :L1
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L1
  .line 456
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  .line 457
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  :L1
  .line 459
    sget-object p1, Lcom/innioasis/ipp/Find;->menuDlg:Lcom/innioasis/music/util/SubMenuDialog;
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Artists;->openFrom(Landroid/app/Activity;Lcom/innioasis/music/util/SubMenuDialog;Lcom/innioasis/y1/database/Song;)Z
    move-result p0
    return p0
.end method

.method private static post(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 246
    new-instance v0, Lcom/innioasis/ipp/Find$Paint;
    invoke-direct { v0, p0, p1, p2, p3 }, Lcom/innioasis/ipp/Find$Paint;-><init>(Landroid/widget/ImageView;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z
  :L1
  .line 249
    goto :L3
  :L2
  .line 247
    move-exception p0
  :L3
  .line 250
    return-void
.end method

.method private static songCover(Landroid/widget/ImageView;Lcom/innioasis/y1/database/Song;Landroid/graphics/Bitmap;)V
  .catchall { :L5 .. :L6 } :L7
  .registers 7
  .line 137
    if-nez p0, :L0
    return-void
  :L0
  .line 138
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 139
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
  .line 140
    const/4 v1, 0
    if-nez v0, :L1
    move-object v2, v1
    goto :L2
  :L1
    sget-object v2, Lcom/innioasis/ipp/Find;->own:Ljava/util/Hashtable;
    invoke-virtual { v2, v0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  :L2
  .line 141
    instance-of v3, v2, Landroid/graphics/Bitmap;
    if-eqz v3, :L3
    move-object v3, v2
    check-cast v3, Landroid/graphics/Bitmap;
    goto :L4
  :L3
    move-object v3, v1
  :L4
  .line 142
    if-nez v3, :L8
  :L5
  .line 144
    invoke-static { p1 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L6
  .line 147
    goto :L9
  :L7
  .line 145
    move-exception v3
  .line 146
    goto :L9
  :L8
  .line 142
    move-object v1, v3
  :L9
  .line 149
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V
  .line 150
    if-eqz v1, :L10
    goto :L11
  :L10
    move-object v1, p2
  :L11
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 151
    if-eqz v0, :L14
    if-eqz v2, :L12
    goto :L14
  :L12
  .line 152
    invoke-static { v0 }, Lcom/innioasis/ipp/Find;->start(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L13
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Find$TrackRead;
    invoke-direct { v2, p0, p1, v0, p2 }, Lcom/innioasis/ipp/Find$TrackRead;-><init>(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  :L13
  .line 153
    return-void
  :L14
  .line 151
    return-void
.end method

.method private static songOf(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Lcom/innioasis/y1/database/Song;
  .registers 3
  .line 476
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 477
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p0
  .line 478
    instance-of v1, p0, Lcom/innioasis/music/SearchActivity$Item;
    if-nez v1, :L1
    return-object v0
  :L1
  .line 479
    check-cast p0, Lcom/innioasis/music/SearchActivity$Item;
    invoke-virtual { p0 }, Lcom/innioasis/music/SearchActivity$Item;->getSong()Lcom/innioasis/y1/database/Song;
    move-result-object p0
    return-object p0
.end method

.method public static songRow(Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/innioasis/y1/database/Song;Landroid/graphics/Bitmap;)V
  .registers 8
  .line 77
    if-nez p3, :L0
    return-void
  :L0
  .line 78
    if-eqz p1, :L1
  .line 81
    invoke-virtual { p1 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Ipp;->songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 82
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L1
  .line 85
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
  .line 86
    invoke-static { p0, p3, p4 }, Lcom/innioasis/ipp/Find;->songCover(Landroid/widget/ImageView;Lcom/innioasis/y1/database/Song;Landroid/graphics/Bitmap;)V
  .line 87
    return-void
.end method

.method public static songs(Ljava/lang/String;)Ljava/util/List;
  .catchall { :L1 .. :L2 } :L3
  .registers 6
  .line 338
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 339
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 340
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 343
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  :L2
  .line 346
    goto :L4
  :L3
  .line 344
    move-exception v1
  .line 345
    move-object v1, v0
  :L4
  .line 347
    if-nez v1, :L5
    return-object v0
  :L5
  .line 348
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 349
    const/4 v2, 0
  :L6
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L10
  .line 350
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 351
    if-nez v3, :L7
    goto :L9
  :L7
  .line 352
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
  .line 353
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L9
  .line 349
    add-int/lit8 v2, v2, 1
    goto :L6
  :L10
  .line 356
    sget-object p0, Lcom/innioasis/ipp/Find;->NAME_CMP:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 357
    return-object v0
.end method

.method private static start(Ljava/lang/String;)Z
  .registers 3
  .line 157
    sget-object v0, Lcom/innioasis/ipp/Find;->reading:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 158
    invoke-virtual { v0, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 159
    const/4 p0, 1
    return p0
.end method

.method private static trackArt(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  .line 228
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L1
    return-object v0
  :L1
  .line 229
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->needs(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
  :L2
  .line 230
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->ownArt(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L3
    return-object v0
  :L3
  .line 231
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    const/16 v2, 50
    invoke-virtual { v1, p0, v2, v2 }, Lcom/innioasis/music/util/Other;->getAlbumCover(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 232
    if-nez p0, :L4
    return-object v0
  :L4
  .line 233
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  :L5
  .line 234
    if-eqz v0, :L6
    move-object p0, v0
  :L6
    return-object p0
  :L7
  .line 235
    move-exception p0
  .line 236
    return-object v0
.end method

.method private static unnumbered(Ljava/lang/String;)Ljava/lang/String;
  .registers 6
  .line 376
    if-eqz p0, :L11
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto/16 :L11
  :L0
  .line 377
    nop
  .line 378
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v1
    const/16 v2, 40
    if-ne v1, v2, :L4
  .line 379
    const/4 v1, 1
    const/4 v2, 1
  :L1
  .line 380
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
  .line 381
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
  .line 382
    goto :L5
  :L4
  .line 383
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
  .line 385
    if-nez v0, :L6
    return-object p0
  :L6
  .line 386
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-ge v0, v1, :L8
  .line 387
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result v1
  .line 388
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
  .line 389
    goto :L6
  :L8
  .line 390
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
  .line 376
    return-object p0
.end method

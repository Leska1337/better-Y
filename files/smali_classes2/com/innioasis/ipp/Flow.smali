.class public final Lcom/innioasis/ipp/Flow;
.super Ljava/lang/Object;
.source "Flow.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Flow$Item;,
    Lcom/innioasis/ipp/Flow$ByName;,
    Lcom/innioasis/ipp/Flow$Loader;
  }
.end annotation

.field private final static BY_NAME:Ljava/util/Comparator;

.field private final static EXTRA_BACK:Ljava/lang/String; = "ipp_flip_back"

.field public final static EXTRA_FLIP:Ljava/lang/String; = "ipp_flip"

.field public final static FADE_MS:I = 250

.field public final static FLIP_MS:I = 90

.field private final static GEO_N:I = 11

.field private final static KEY_GEO:Ljava/lang/String; = "flow_geo_"

.field public final static PAD:I = 2

.field public final static REFL:I = 90

.field public final static S:I = 180

.field private static geoFlat:[F

.field private static geoTilt:[F

.field private static mask:Landroid/graphics/Bitmap;

.field private static returning:Z

.method static constructor <clinit>()V
  .registers 2
  .line 126
    new-instance v0, Lcom/innioasis/ipp/Flow$ByName;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Flow$ByName;-><init>(Lcom/innioasis/ipp/Flow$1;)V
    sput-object v0, Lcom/innioasis/ipp/Flow;->BY_NAME:Ljava/util/Comparator;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 51
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static albums()Ljava/util/List;
  .registers 9
  .line 106
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 107
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 108
    if-nez v1, :L0
    return-object v0
  :L0
  .line 109
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
  .line 110
    const/4 v3, 0
    const/4 v4, 0
  :L1
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L5
  .line 111
    invoke-interface { v1, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 112
    if-eqz v5, :L4
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    if-nez v6, :L2
    goto :L4
  :L2
  .line 113
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v6
  .line 114
    invoke-virtual { v2, v6 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
  .line 115
    if-eqz v7, :L3
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v8, v7 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v7
    if-gez v7, :L4
  :L3
    invoke-virtual { v2, v6, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 110
    add-int/lit8 v4, v4, 1
    goto :L1
  :L5
  .line 117
    invoke-virtual { v2 }, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v1
  .line 118
    nop
  :L6
    array-length v4, v1
    if-ge v3, v4, :L7
  .line 119
    aget-object v4, v1, v3
    check-cast v4, Ljava/lang/String;
  .line 120
    new-instance v5, Lcom/innioasis/ipp/Flow$Item;
    sget-object v6, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v6, v7 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v2, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
    invoke-direct { v5, v4, v6, v7 }, Lcom/innioasis/ipp/Flow$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/innioasis/y1/database/Song;)V
    invoke-virtual { v0, v5 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 118
    add-int/lit8 v3, v3, 1
    goto :L6
  :L7
  .line 122
    sget-object v1, Lcom/innioasis/ipp/Flow;->BY_NAME:Ljava/util/Comparator;
    invoke-static { v0, v1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 123
    return-object v0
.end method

.method static artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 101
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p1
    invoke-static { p2, p1 }, Lcom/innioasis/ipp/AlbumArtists;->of(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static cover(Lcom/innioasis/ipp/Flow$Item;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 165
    const/4 v0, 0
  :L0
    iget-object p0, p0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 166
    if-nez p0, :L1
    goto :L2
  :L1
    const/16 v1, 180
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 167
    move-exception p0
  .line 168
    return-object v0
.end method

.method private static face(Landroid/graphics/Bitmap;)[I
  .registers 10
  .line 174
    const/16 v0, 32400
    new-array v0, v0, [I
  .line 175
    if-eqz p0, :L0
  .line 176
    const/4 v3, 0
    const/16 v4, 180
    const/4 v5, 0
    const/4 v6, 0
    const/16 v7, 180
    const/16 v8, 180
    move-object v1, p0
    move-object v2, v0
    invoke-virtual/range { v1 .. v8 }, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V
  .line 177
    return-object v0
  :L0
  .line 179
    const/4 p0, 0
    const/4 v1, 0
  :L1
    const/16 v2, 180
    if-ge v1, v2, :L6
  .line 180
    const/4 v3, 0
  :L2
    if-ge v3, v2, :L5
  .line 181
    add-int v4, v3, v1
    mul-int/lit8 v4, v4, 48
    div-int/lit16 v4, v4, 360
    add-int/lit8 v4, v4, 48
  .line 182
    const/4 v5, 3
    if-lt v3, v5, :L3
    if-lt v1, v5, :L3
    const/16 v5, 177
    if-ge v3, v5, :L3
    if-lt v1, v5, :L4
  :L3
    const/16 v4, 96
  :L4
  .line 183
    mul-int/lit16 v5, v1, 180
    add-int/2addr v5, v3
    shl-int/lit8 v6, v4, 16
    const/high16 v7, 0xFF000000
    or-int/2addr v6, v7
    shl-int/lit8 v7, v4, 8
    or-int/2addr v6, v7
    or-int/2addr v4, v6
    aput v4, v0, v5
  .line 180
    add-int/lit8 v3, v3, 1
    goto :L2
  :L5
  .line 179
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 186
    return-object v0
.end method

.method private static fade(Landroid/view/View;)V
  .registers 3
  .line 460
    invoke-virtual { p0 }, Landroid/view/View;->getAlpha()F
    move-result v0
  .line 461
    const/4 v1, 0
    invoke-virtual { p0, v1 }, Landroid/view/View;->setAlpha(F)V
  .line 462
    invoke-virtual { p0 }, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;
    move-result-object p0
    const-wide/16 v0, 250
    invoke-virtual { p0, v0, v1 }, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;
  .line 463
    return-void
.end method

.method private static fadeIn(Landroid/app/Activity;)V
  .catchall { :L0 .. :L6 } :L10
  .registers 9
  .line 435
    const v0, 2131361957
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 436
    const v1, 2131361979
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 437
    const v2, 2131361980
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 438
    if-eqz v0, :L9
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    instance-of v2, v2, Landroid/view/ViewGroup;
    if-nez v2, :L1
    goto :L9
  :L1
  .line 439
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup;
  .line 440
    const/4 v3, 0
    const/4 v4, 0
  :L2
    invoke-virtual { v2 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v5
    if-ge v4, v5, :L8
  .line 441
    invoke-virtual { v2, v4 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v5
  .line 442
    invoke-virtual { v5 }, Landroid/view/View;->getId()I
    move-result v6
  .line 443
    const v7, 2131362297
    if-eq v6, v7, :L7
    const v7, 2131362191
    if-ne v6, v7, :L3
    goto :L7
  :L3
  .line 444
    if-eq v5, v0, :L4
  .line 445
    invoke-static { v5 }, Lcom/innioasis/ipp/Flow;->fade(Landroid/view/View;)V
  .line 446
    goto :L7
  :L4
  .line 448
    move-object v5, v0
    check-cast v5, Landroid/view/ViewGroup;
  .line 449
    const/4 v6, 0
  :L5
    invoke-virtual { v5 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v7
    if-ge v6, v7, :L7
  .line 450
    invoke-virtual { v5, v6 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v7
  .line 451
    if-eq v7, v1, :L6
    if-eq v7, p0, :L6
    invoke-static { v7 }, Lcom/innioasis/ipp/Flow;->fade(Landroid/view/View;)V
  :L6
  .line 449
    add-int/lit8 v6, v6, 1
    goto :L5
  :L7
  .line 440
    add-int/lit8 v4, v4, 1
    goto :L2
  :L8
  .line 456
    goto :L11
  :L9
  .line 438
    return-void
  :L10
  .line 454
    move-exception p0
  :L11
  .line 457
    return-void
.end method

.method public static flipBack(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L2 } :L4
  .registers 5
  .line 472
    const-string v0, "ipp_flip_back"
    const/4 v1, 0
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v2
  .line 473
    if-eqz v2, :L3
    invoke-virtual { v2, v0, v1 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v3
    if-nez v3, :L1
    goto :L3
  :L1
  .line 474
    invoke-virtual { v2, v0 }, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
  .line 475
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->measure(Landroid/app/Activity;)V
  .line 476
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 477
    invoke-virtual { p0 }, Landroid/app/Activity;->finish()V
  .line 478
    invoke-virtual { p0, v1, v1 }, Landroid/app/Activity;->overridePendingTransition(II)V
  :L2
  .line 479
    return v0
  :L3
  .line 473
    return v1
  :L4
  .line 480
    move-exception p0
  .line 481
    return v1
.end method

.method public static flipIn(Landroid/app/Activity;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 4
  .line 414
    const-string v0, "ipp_flip"
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
  .line 415
    if-eqz v1, :L6
    const/4 v2, 0
    invoke-virtual { v1, v0, v2 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v2
    if-nez v2, :L1
    goto :L6
  :L1
  .line 417
    invoke-virtual { v1, v0 }, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
  .line 418
    const-string v0, "ipp_flip_back"
    const/4 v2, 1
    invoke-virtual { v1, v0, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 421
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 422
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingMusic()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L3
  .line 423
    if-eqz v0, :L4
    instance-of v1, p0, Lcom/innioasis/y1/base/BasePlayerActivity;
    if-eqz v1, :L4
    move-object v1, p0
    check-cast v1, Lcom/innioasis/y1/base/BasePlayerActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Cover;->instantCover(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  :L4
  .line 424
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->fadeIn(Landroid/app/Activity;)V
  :L5
  .line 427
    goto :L8
  :L6
  .line 415
    return-void
  :L7
  .line 425
    move-exception p0
  :L8
  .line 428
    return-void
.end method

.method public static geo(Landroid/content/Context;)[F
  .catchall { :L3 .. :L9 } :L11
  .registers 6
  .line 353
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 354
    if-eqz v0, :L0
    sget-object v1, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L1
  :L0
    sget-object v1, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L1
  .line 355
    if-eqz v1, :L2
    return-object v1
  :L2
  .line 357
    const/16 v1, 11
  :L3
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "flow_geo_"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    if-eqz v0, :L4
    const-string v3, "flat"
    goto :L5
  :L4
    const-string v3, "tilt"
  :L5
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    const/4 v3, 0
    invoke-static { p0, v2, v3 }, Lcom/innioasis/ipp/Prefs;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 358
    if-eqz p0, :L10
  .line 359
    const-string v2, ","
    invoke-virtual { p0, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
  .line 360
    array-length v2, p0
    if-ne v2, v1, :L10
  .line 361
    new-array v2, v1, [F
  .line 362
    const/4 v3, 0
  :L6
    if-ge v3, v1, :L7
    aget-object v4, p0, v3
    invoke-static { v4 }, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    move-result v4
    aput v4, v2, v3
    add-int/lit8 v3, v3, 1
    goto :L6
  :L7
  .line 363
    if-eqz v0, :L8
    sput-object v2, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L9
  :L8
  .line 364
    sput-object v2, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L9
  .line 365
    return-object v2
  :L10
  .line 370
    goto :L12
  :L11
  .line 368
    move-exception p0
  :L12
  .line 371
    if-eqz v0, :L13
    new-array p0, v1, [F
    fill-array-data p0, :L15
    goto :L14
  :L13
  .line 372
    new-array p0, v1, [F
    fill-array-data p0, :L16
  :L14
  .line 371
    return-object p0
  :L15
  .array-data 4
      1092616192
      1112014848
      1130758144
      1135378432
      1122369536
      1126989824
      0
      0
      0
      1097859072
      0
  .end array-data
  :L16
  .array-data 4
      1092616192
      1112014848
      1132756992
      1137115136
      0
      1124379307
      1101004800
      0
      0
      0
      0
  .end array-data
.end method

.method static mask()Landroid/graphics/Bitmap;
  .registers 6
  .line 209
    sget-object v0, Lcom/innioasis/ipp/Flow;->mask:Landroid/graphics/Bitmap;
    if-nez v0, :L4
  .line 210
    nop
  .line 211
    nop
  .line 212
    const v0, 50048
    new-array v0, v0, [I
  .line 213
    const/4 v1, 2
    const/4 v2, 2
  :L0
    const/16 v3, 272
    if-ge v2, v3, :L3
  .line 214
    const/4 v3, 2
  :L1
    const/16 v4, 182
    if-ge v3, v4, :L2
    mul-int/lit16 v4, v2, 184
    add-int/2addr v4, v3
    const/high16 v5, 0xFF000000
    aput v5, v0, v4
    add-int/lit8 v3, v3, 1
    goto :L1
  :L2
  .line 213
    add-int/lit8 v2, v2, 1
    goto :L0
  :L3
  .line 216
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v2, 184
    invoke-static { v0, v2, v3, v1 }, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Flow;->mask:Landroid/graphics/Bitmap;
  :L4
  .line 218
    sget-object v0, Lcom/innioasis/ipp/Flow;->mask:Landroid/graphics/Bitmap;
    return-object v0
.end method

.method private static measure(Landroid/app/Activity;)V
  .registers 9
  .line 376
    const v0, 2131361979
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 377
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-eqz v1, :L1
  :L0
    const v0, 2131361980
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 378
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-nez v1, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v1
    if-gtz v1, :L2
    goto/16 :L10
  :L2
  .line 380
    const/4 v1, 2
    new-array v2, v1, [I
  .line 381
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3, v2 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 382
    const/16 v3, 11
    new-array v4, v3, [F
    const/4 v5, 0
    aget v6, v2, v5
    invoke-virtual { v0 }, Landroid/view/View;->getLeft()I
    move-result v7
    add-int/2addr v6, v7
    int-to-float v6, v6
    aput v6, v4, v5
    const/4 v6, 1
    aget v2, v2, v6
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v7
    add-int/2addr v2, v7
    int-to-float v2, v2
    aput v2, v4, v6
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v2
    int-to-float v2, v2
    aput v2, v4, v1
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v1
    int-to-float v1, v1
    const/4 v2, 3
    aput v1, v4, v2
  .line 383
    invoke-virtual { v0 }, Landroid/view/View;->getPivotX()F
    move-result v1
    const/4 v2, 4
    aput v1, v4, v2
    const/4 v1, 5
    invoke-virtual { v0 }, Landroid/view/View;->getPivotY()F
    move-result v2
    aput v2, v4, v1
    const/4 v1, 6
    invoke-virtual { v0 }, Landroid/view/View;->getRotationY()F
    move-result v2
    aput v2, v4, v1
  .line 384
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingLeft()I
    move-result v1
    int-to-float v1, v1
    const/4 v2, 7
    aput v1, v4, v2
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingTop()I
    move-result v1
    int-to-float v1, v1
    const/16 v2, 8
    aput v1, v4, v2
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingRight()I
    move-result v1
    int-to-float v1, v1
    const/16 v2, 9
    aput v1, v4, v2
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingBottom()I
    move-result v0
    int-to-float v0, v0
    const/16 v1, 10
    aput v0, v4, v1
  .line 385
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 386
    if-eqz v0, :L3
    sput-object v4, Lcom/innioasis/ipp/Flow;->geoFlat:[F
    goto :L4
  :L3
  .line 387
    sput-object v4, Lcom/innioasis/ipp/Flow;->geoTilt:[F
  :L4
  .line 388
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 389
    nop
  :L5
    if-ge v5, v3, :L7
  .line 390
    if-lez v5, :L6
    const/16 v2, 44
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L6
  .line 391
    aget v2, v4, v5
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;
  .line 389
    add-int/lit8 v5, v5, 1
    goto :L5
  :L7
  .line 393
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "flow_geo_"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    if-eqz v0, :L8
    const-string v0, "flat"
    goto :L9
  :L8
    const-string v0, "tilt"
  :L9
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Prefs;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
  .line 394
    return-void
  :L10
  .line 378
    return-void
.end method

.method public static musicMenu(Ljava/util/List;Landroid/content/Context;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 58
    const v0, 2131821167
  :L0
    invoke-virtual { p1, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
  .line 59
    invoke-interface { p0, p1 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const/4 v0, 0
    invoke-interface { p0, v0, p1 }, Ljava/util/List;->add(ILjava/lang/Object;)V
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

.method public static musicPick(Landroid/app/Activity;I)I
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 71
    if-gez p1, :L0
    return p1
  :L0
  .line 72
    sget-object v0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v0 }, Lcom/innioasis/music/objects/Constant;->getMainList()Ljava/util/List;
    move-result-object v0
  .line 73
    if-eqz v0, :L4
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :L4
    const v1, 2131821167
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    const/4 v2, 0
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    goto :L4
  :L1
  .line 74
    if-lez p1, :L2
    add-int/lit8 p1, p1, -1
    return p1
  :L2
  .line 75
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-direct { v0, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L3
  .line 76
    const/4 p0, -1
    return p0
  :L4
  .line 73
    return p1
  :L5
  .line 77
    move-exception p0
  .line 78
    return p1
.end method

.method static slide(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 14
  .line 191
    invoke-static { p0 }, Lcom/innioasis/ipp/Flow;->face(Landroid/graphics/Bitmap;)[I
    move-result-object p0
  .line 192
    nop
  .line 193
    nop
  .line 194
    const v0, 50048
    new-array v0, v0, [I
  .line 195
    const/4 v1, 0
    const/4 v2, 0
  :L0
    const/16 v3, 180
    const/16 v4, 184
    if-ge v2, v3, :L1
    mul-int/lit16 v5, v2, 180
    add-int/lit8 v6, v2, 2
    mul-int/lit16 v6, v6, 184
    add-int/lit8 v6, v6, 2
    invoke-static { p0, v5, v0, v6, v3 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    add-int/lit8 v2, v2, 1
    goto :L0
  :L1
  .line 196
    const/4 v2, 0
  :L2
    const/16 v5, 90
    if-ge v2, v5, :L5
  .line 197
    rsub-int/lit8 v6, v2, 90
    mul-int/lit16 v6, v6, 128
    div-int/2addr v6, v5
  .line 198
    rsub-int v5, v2, 179
    mul-int/lit16 v5, v5, 180
  .line 199
    add-int/lit16 v7, v2, 182
    mul-int/lit16 v7, v7, 184
    add-int/lit8 v7, v7, 2
  .line 200
    const/4 v8, 0
  :L3
    if-ge v8, v3, :L4
    add-int v9, v7, v8
    shl-int/lit8 v10, v6, 24
    add-int v11, v5, v8
    aget v11, p0, v11
    const v12, 16777215
    and-int/2addr v11, v12
    or-int/2addr v10, v11
    aput v10, v0, v9
    add-int/lit8 v8, v8, 1
    goto :L3
  :L4
  .line 196
    add-int/lit8 v2, v2, 1
    goto :L2
  :L5
  .line 202
    sget-object p0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v1, 272
    invoke-static { v0, v4, v1, p0 }, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method public static songs(Lcom/innioasis/ipp/Flow$Item;)Ljava/util/List;
  .registers 2
  .line 140
    iget-object p0, p0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->songsOf(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 141
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
  .line 142
    if-eqz v0, :L0
    move-object p0, v0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->byDisc(Ljava/util/List;)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method public static takeReturning()Z
  .registers 2
  .line 346
    sget-boolean v0, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 347
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/Flow;->returning:Z
  .line 348
    return v0
.end method

.method public static title(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 4
  .line 151
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getSongName()Ljava/lang/String;
    move-result-object v0
  .line 152
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v1
    if-eqz v1, :L1
    const-string v1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 155
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :L4
  :L1
  .line 153
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getName()Ljava/lang/String;
    move-result-object v1
    goto :L3
  :L2
    new-instance v1, Ljava/io/File;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v1
  :L3
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L4
  .line 157
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Feat;->title(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static trip(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 402
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
  .line 403
    if-nez p0, :L2
    if-eqz p1, :L2
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L2
  .line 404
    if-nez p0, :L3
    return-object v0
  :L3
  .line 405
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->reflect(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L4
    return-object p0
  :L5
  .line 406
    move-exception p0
  .line 407
    return-object v0
.end method

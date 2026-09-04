.class public final Lcom/innioasis/ipp/Folders;
.super Ljava/lang/Object;
.source "Folders.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Folders$PathCmp;
  }
.end annotation

.field private final static BIG:F = 1.3F

.field public final static EXTRA:Ljava/lang/String; = "ipp_all"

.field private final static MARK:Ljava/lang/String; = "\u0001ipp_show_all"

.field private final static PATH:Ljava/util/Comparator;

.field private final static SHUF:Ljava/lang/String; = "\u0001ipp_show_all_shuffle"

.method static constructor <clinit>()V
  .registers 2
  .line 289
    new-instance v0, Lcom/innioasis/ipp/Folders$PathCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Folders$PathCmp;-><init>(Lcom/innioasis/ipp/Folders$1;)V
    sput-object v0, Lcom/innioasis/ipp/Folders;->PATH:Ljava/util/Comparator;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 58
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static allMode(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 169
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-eqz v1, :L3
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_all"
    invoke-virtual { p0, v1, v0 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result p0
  :L1
    if-eqz p0, :L3
    const/4 v0, 1
    goto :L3
  :L2
  .line 170
    move-exception p0
  .line 171
    return v0
  :L3
  .line 169
    return v0
.end method

.method public static build(Landroid/app/Activity;Ljava/io/File;Ljava/util/List;Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L3 } :L4
  .registers 6
  .line 189
    const/4 v0, 0
    if-eqz p1, :L6
    if-nez p2, :L0
    goto :L6
  :L0
  .line 190
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->allMode(Landroid/app/Activity;)Z
    move-result v1
    if-eqz v1, :L2
  .line 191
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->songsUnder(Ljava/io/File;)Ljava/util/List;
    move-result-object p0
  .line 192
    invoke-interface { p2 }, Ljava/util/List;->clear()V
  .line 193
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result p3
    if-nez p3, :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->shufMark(Ljava/io/File;)Ljava/io/File;
    move-result-object p1
    invoke-interface { p2, p1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L1
  .line 194
    invoke-interface { p2, p0 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 198
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    return-object p1
  :L2
  .line 200
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Folders;->folderRow(Landroid/app/Activity;Ljava/io/File;Ljava/util/List;Ljava/util/List;)Ljava/io/File;
    move-result-object p0
  .line 201
    if-eqz p0, :L3
    const/4 p1, 0
    invoke-interface { p2, p1, p0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L3
  .line 204
    goto :L5
  :L4
  .line 202
    move-exception p0
  :L5
  .line 205
    return-object v0
  :L6
  .line 189
    return-object v0
.end method

.method public static dropMarks(Ljava/lang/Object;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 111
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    return-void
  :L0
  .line 113
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v0
  .line 114
    if-nez v0, :L1
    return-void
  :L1
  .line 115
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    add-int/lit8 v1, v1, -1
  :L2
    if-ltz v1, :L4
  .line 116
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 117
    instance-of v3, v2, Ljava/lang/Integer;
    if-eqz v3, :L3
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result v2
    if-eqz v2, :L3
    invoke-interface { v0, v1 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  :L3
  .line 115
    add-int/lit8 v1, v1, -1
    goto :L2
  :L4
  .line 121
    goto :L6
  :L5
  .line 119
    move-exception p0
  :L6
  .line 122
    return-void
.end method

.method private static folderRow(Landroid/app/Activity;Ljava/io/File;Ljava/util/List;Ljava/util/List;)Ljava/io/File;
  .registers 6
  .line 227
    invoke-interface { p2 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L0
    return-object v1
  :L0
  .line 228
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 229
    if-nez v0, :L1
    return-object v1
  :L1
  .line 230
    if-nez p0, :L2
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->defaultFolderPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
  .line 231
    if-eqz p0, :L12
    invoke-virtual { v0, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L3
    goto :L12
  :L3
  .line 232
    sget-object p0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/objects/Constant;->pathInAudiobook(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L4
    return-object v1
  :L4
  .line 236
    const/4 p0, 0
    if-nez p3, :L5
    const/4 p3, 0
    goto :L6
  :L5
    invoke-interface { p3 }, Ljava/util/List;->size()I
    move-result p3
  :L6
  .line 237
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result p2
    const/4 v0, 1
    if-le p2, p3, :L7
    const/4 p0, 1
  :L7
  .line 238
    if-eqz p0, :L10
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->songsUnder(Ljava/io/File;)Ljava/util/List;
    move-result-object p0
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result p0
    if-eqz p0, :L8
    goto :L9
  :L8
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->mark(Ljava/io/File;)Ljava/io/File;
    move-result-object v1
  :L9
    return-object v1
  :L10
  .line 239
    if-le p3, v0, :L11
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->shufMark(Ljava/io/File;)Ljava/io/File;
    move-result-object v1
  :L11
    return-object v1
  :L12
  .line 231
    return-object v1
.end method

.method private static isAnyMark(Ljava/io/File;)Z
  .registers 2
  .line 90
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->isMark(Ljava/io/File;)Z
    move-result v0
    if-nez v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->isShuffle(Ljava/io/File;)Z
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

.method public static isMark(Ljava/io/File;)Z
  .registers 2
  .line 83
    if-eqz p0, :L0
    const-string v0, "\u0001ipp_show_all"
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static isShuffle(Ljava/io/File;)Z
  .registers 2
  .line 87
    if-eqz p0, :L0
    const-string v0, "\u0001ipp_show_all_shuffle"
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static keepIcon(Landroid/widget/ImageView;)Z
  .catchall { :L1 .. :L3 } :L4
  .registers 4
  .line 446
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 447
    const v1, 2131362556
  :L1
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v1
  .line 448
    instance-of v2, v1, Ljava/lang/Integer;
    if-nez v2, :L2
    return v0
  :L2
  .line 449
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageResource(I)V
  :L3
  .line 450
    const/4 p0, 1
    return p0
  :L4
  .line 451
    move-exception p0
  .line 452
    return v0
.end method

.method private static mark(Ljava/io/File;)Ljava/io/File;
  .registers 3
  .line 79
    new-instance v0, Ljava/io/File;
    const-string v1, "\u0001ipp_show_all"
    invoke-direct { v0, p0, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method private static markAt(Ljava/lang/Object;I)Z
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  .line 156
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 158
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 159
    if-ltz p1, :L4
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L4
  :L1
  .line 160
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 161
    instance-of p1, p0, Ljava/io/File;
    if-eqz p1, :L3
    check-cast p0, Ljava/io/File;
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->isAnyMark(Ljava/io/File;)Z
    move-result p0
  :L2
    if-eqz p0, :L3
    const/4 v1, 1
  :L3
    return v1
  :L4
  .line 159
    return v1
  :L5
  .line 162
    move-exception p0
  .line 163
    return v1
.end method

.method public static noSelect(Ljava/lang/Object;I)Z
  .registers 2
  .line 106
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result p0
    return p0
.end method

.method public static onMark(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 126
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 128
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result p0
  :L1
    return p0
  :L2
  .line 129
    move-exception p0
  .line 130
    return v1
.end method

.method public static open(Landroid/app/Activity;Ljava/io/File;Ljava/lang/Object;)Z
  .catchall { :L2 .. :L3 } :L4
  .registers 5
  .line 302
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 303
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isShuffle(Ljava/io/File;)Z
    move-result v1
    if-eqz v1, :L1
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Folders;->shufflePlay(Landroid/app/Activity;Ljava/lang/Object;)Z
    move-result p0
    return p0
  :L1
  .line 304
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isMark(Ljava/io/File;)Z
    move-result p2
    if-nez p2, :L2
    return v0
  :L2
  .line 306
    new-instance p2, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/FilesActivity;
    invoke-direct { p2, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 307
    const-string v1, "now_path"
    invoke-virtual { p1 }, Ljava/io/File;->getParent()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 308
    const-string p1, "ipp_all"
    const/4 v1, 1
    invoke-virtual { p2, p1, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 309
    invoke-virtual { p0, p2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L3
  .line 312
    nop
  .line 313
    return v1
  :L4
  .line 310
    move-exception p0
  .line 311
    return v0
.end method

.method public static row(Landroid/view/View;ILjava/lang/Object;)V
  .catchall { :L0 .. :L1 } :L26
  .registers 10
  .line 384
    if-eqz p0, :L27
    instance-of v0, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    goto/16 :L27
  :L0
  .line 387
    check-cast p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p2, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p1
  :L1
  .line 390
    nop
  .line 391
    instance-of p2, p1, Ljava/io/File;
    const/4 v0, 0
    if-eqz p2, :L2
    check-cast p1, Ljava/io/File;
    goto :L3
  :L2
    move-object p1, v0
  :L3
  .line 392
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isAnyMark(Ljava/io/File;)Z
    move-result p2
  .line 393
    const v1, 2131362042
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 394
    const v2, 2131362159
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 395
    instance-of v3, v1, Landroid/widget/TextView;
    if-eqz v3, :L4
    check-cast v1, Landroid/widget/TextView;
    goto :L5
  :L4
    move-object v1, v0
  :L5
  .line 396
    instance-of v3, v2, Landroid/widget/ImageView;
    if-eqz v3, :L6
    check-cast v2, Landroid/widget/ImageView;
    goto :L7
  :L6
    move-object v2, v0
  :L7
  .line 401
    if-eqz v2, :L14
    invoke-virtual { v2 }, Landroid/widget/ImageView;->getScaleX()F
    move-result v3
    const v4, 1067869798
    const/high16 v5, 0x3F800000
    if-eqz p2, :L8
    const v6, 1067869798
    goto :L9
  :L8
    const/high16 v6, 0x3F800000
  :L9
    cmpl-float v3, v3, v6
    if-eqz v3, :L14
  .line 402
    if-eqz p2, :L10
    const v3, 1067869798
    goto :L11
  :L10
    const/high16 v3, 0x3F800000
  :L11
    invoke-virtual { v2, v3 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 403
    if-eqz p2, :L12
    goto :L13
  :L12
    const/high16 v4, 0x3F800000
  :L13
    invoke-virtual { v2, v4 }, Landroid/widget/ImageView;->setScaleY(F)V
  :L14
  .line 405
    const v3, 2131362556
    if-nez p2, :L16
  .line 411
    if-eqz v2, :L15
  .line 412
    invoke-static { v2 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 413
    invoke-virtual { v2, v3, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  :L15
  .line 415
    return-void
  :L16
  .line 418
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isShuffle(Ljava/io/File;)Z
    move-result p1
  .line 419
    if-eqz v1, :L19
  .line 420
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 421
    if-eqz p1, :L17
    const p2, 2131820900
    goto :L18
  :L17
    const p2, 2131821049
  :L18
  .line 420
    invoke-virtual { p0, p2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L19
  .line 423
    if-eqz v2, :L25
  .line 424
    const/4 p0, 0
    invoke-virtual { v2, p0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 425
    const p0, 2131623978
    const p2, 2131623994
    if-eqz p1, :L20
    const v0, 2131623978
    goto :L21
  :L20
    const v0, 2131623994
  :L21
    invoke-virtual { v2, v0 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 426
    if-eqz v1, :L22
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L22
  .line 428
    nop
  .line 429
    if-eqz p1, :L23
    goto :L24
  :L23
    const p0, 2131623994
  :L24
  .line 428
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v2, v3, p0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  :L25
  .line 431
    return-void
  :L26
  .line 388
    move-exception p0
  .line 389
    return-void
  :L27
  .line 384
    return-void
.end method

.method private static shufMark(Ljava/io/File;)Ljava/io/File;
  .registers 3
  .line 80
    new-instance v0, Ljava/io/File;
    const-string v1, "\u0001ipp_show_all_shuffle"
    invoke-direct { v0, p0, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method private static shufflePlay(Landroid/app/Activity;Ljava/lang/Object;)Z
  .catchall { :L0 .. :L8 } :L9
  .registers 9
  .line 339
    const/4 v0, 1
  :L0
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return v0
  :L1
  .line 340
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 341
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
  .line 342
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 343
    const/4 v3, 0
    const/4 v4, 0
  :L2
    if-ge v4, v1, :L5
  .line 344
    invoke-virtual { p1, v4 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v5
  .line 345
    instance-of v6, v5, Ljava/io/File;
    if-eqz v6, :L4
    move-object v6, v5
    check-cast v6, Ljava/io/File;
    invoke-static { v6 }, Lcom/innioasis/ipp/Folders;->isAnyMark(Ljava/io/File;)Z
    move-result v6
    if-eqz v6, :L3
    goto :L4
  :L3
  .line 346
    new-instance v6, Lcom/innioasis/y1/database/Song;
    invoke-direct { v6 }, Lcom/innioasis/y1/database/Song;-><init>()V
  .line 347
    check-cast v5, Ljava/io/File;
    invoke-virtual { v5 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/database/Song;->setPath(Ljava/lang/String;)V
  .line 348
    invoke-virtual { v2, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 343
    add-int/lit8 v4, v4, 1
    goto :L2
  :L5
  .line 350
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p1
    if-eqz p1, :L6
    return v0
  :L6
  .line 351
    invoke-static { v2 }, Ljava/util/Collections;->shuffle(Ljava/util/List;)V
  .line 352
    sget-object p1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p1
  .line 353
    if-eqz p1, :L7
    invoke-virtual { p1, v2, v3 }, Lcom/innioasis/y1/service/PlayerService;->setMusicPlaylist(Ljava/util/List;I)V
  :L7
  .line 354
    new-instance p1, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/MusicPlayerActivity;
    invoke-direct { p1, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L8
  .line 357
    goto :L10
  :L9
  .line 355
    move-exception p0
  :L10
  .line 358
    return v0
.end method

.method public static skipMark(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 141
    if-eqz p1, :L7
    instance-of p1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez p1, :L0
    goto :L7
  :L0
  .line 143
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 144
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p1
  .line 145
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 146
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 147
    add-int/lit8 p1, p1, 1
  :L2
  .line 148
    if-ge p1, v0, :L3
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result v1
    if-eqz v1, :L3
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 149
    if-ge p1, v0, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  :L4
  .line 152
    goto :L6
  :L5
  .line 150
    move-exception p0
  :L6
  .line 153
    return-void
  :L7
  .line 141
    return-void
.end method

.method private static songsUnder(Ljava/io/File;)Ljava/util/List;
  .registers 6
  .line 272
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 273
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 274
    if-nez v1, :L0
    return-object v0
  :L0
  .line 275
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 276
    if-nez p0, :L1
    return-object v0
  :L1
  .line 277
    const-string v2, "/"
    invoke-virtual { p0, v2 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L2
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L2
  .line 278
    const/4 v2, 0
  :L3
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 279
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 280
    if-nez v3, :L4
    const/4 v3, 0
    goto :L5
  :L4
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  :L5
  .line 281
    if-eqz v3, :L7
    invoke-virtual { v3, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L6
    goto :L7
  :L6
  .line 282
    new-instance v4, Ljava/io/File;
    invoke-direct { v4, v3 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 283
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result v3
    if-eqz v3, :L7
    invoke-virtual { v0, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 278
    add-int/lit8 v2, v2, 1
    goto :L3
  :L8
  .line 285
    sget-object p0, Lcom/innioasis/ipp/Folders;->PATH:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 286
    return-object v0
.end method

.method public static startRow(Ljava/lang/Object;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 251
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    return-void
  :L0
  .line 253
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 254
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    return-void
  :L1
  .line 255
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v0
  .line 256
    instance-of v1, v0, Ljava/io/File;
    if-eqz v1, :L2
    check-cast v0, Ljava/io/File;
    invoke-static { v0 }, Lcom/innioasis/ipp/Folders;->isAnyMark(Ljava/io/File;)Z
    move-result v0
    if-eqz v0, :L2
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  :L2
  .line 259
    goto :L4
  :L3
  .line 257
    move-exception p0
  :L4
  .line 260
    return-void
.end method

.method public static title(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 366
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->allMode(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :L4
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L0
    goto :L4
  :L0
  .line 368
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
    const v1, 2131821049
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/base/BaseActivity;->setStateBarLeftText(Ljava/lang/String;)V
  :L1
  .line 371
    goto :L3
  :L2
  .line 369
    move-exception p0
  :L3
  .line 372
    return-void
  :L4
  .line 366
    return-void
.end method

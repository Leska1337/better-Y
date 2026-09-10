.class public final Lcom/innioasis/ipp/Folders;
.super Ljava/lang/Object;
.source "Folders.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Folders$FileSort;,
    Lcom/innioasis/ipp/Folders$VideoSortPick;,
    Lcom/innioasis/ipp/Folders$RowSort;,
    Lcom/innioasis/ipp/Folders$SortPick;,
    Lcom/innioasis/ipp/Folders$PathCmp;
  }
.end annotation

.field private final static BIG:F = 1.3F

.field public final static EXTRA:Ljava/lang/String; = "ipp_all"

.field public final static KEY_SORT:Ljava/lang/String; = "folders_sort"

.field public final static KEY_SORT_BOOK:Ljava/lang/String; = "folders_sort_ab"

.field private final static MARK:Ljava/lang/String; = "\u0001ipp_show_all"

.field private final static PATH:Ljava/util/Comparator;

.field private final static SHUF:Ljava/lang/String; = "\u0001ipp_show_all_shuffle"

.field private final static SORT_A_Z:I = 0

.field private final static SORT_NEW:I = 3

.field private final static SORT_OLD:I = 2

.field private final static SORT_Z_A:I = 1

.method static constructor <clinit>()V
  .registers 2
  .line 298
    new-instance v0, Lcom/innioasis/ipp/Folders$PathCmp;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Folders$PathCmp;-><init>(Lcom/innioasis/ipp/Folders$1;)V
    sput-object v0, Lcom/innioasis/ipp/Folders;->PATH:Ljava/util/Comparator;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 67
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100(Landroid/app/Activity;)V
  .registers 1
  .line 65
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->resortVideoList(Landroid/app/Activity;)V
    return-void
.end method

.method static synthetic access$200(Ljava/lang/Object;)Ljava/io/File;
  .registers 1
  .line 65
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->rowFile(Ljava/lang/Object;)Ljava/io/File;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$300(Landroid/app/Activity;)Ljava/lang/String;
  .registers 1
  .line 65
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->currentPath(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$400(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 65
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->keyFor(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$500(Landroid/app/Activity;)V
  .registers 1
  .line 65
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->clearTicks(Landroid/app/Activity;)V
    return-void
.end method

.method static synthetic access$600(Landroid/app/Activity;)V
  .registers 1
  .line 65
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->relist(Landroid/app/Activity;)V
    return-void
.end method

.method private static allMode(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 178
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
  .line 179
    move-exception p0
  .line 180
    return v0
  :L3
  .line 178
    return v0
.end method

.method public static build(Landroid/app/Activity;Ljava/io/File;Ljava/util/List;Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L3 } :L4
  .registers 6
  .line 198
    const/4 v0, 0
    if-eqz p1, :L6
    if-nez p2, :L0
    goto :L6
  :L0
  .line 199
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->allMode(Landroid/app/Activity;)Z
    move-result v1
    if-eqz v1, :L2
  .line 200
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->songsUnder(Ljava/io/File;)Ljava/util/List;
    move-result-object p0
  .line 201
    invoke-interface { p2 }, Ljava/util/List;->clear()V
  .line 202
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result p3
    if-nez p3, :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->shufMark(Ljava/io/File;)Ljava/io/File;
    move-result-object p1
    invoke-interface { p2, p1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L1
  .line 203
    invoke-interface { p2, p0 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 207
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    return-object p1
  :L2
  .line 209
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Folders;->folderRow(Landroid/app/Activity;Ljava/io/File;Ljava/util/List;Ljava/util/List;)Ljava/io/File;
    move-result-object p0
  .line 210
    if-eqz p0, :L3
    const/4 p1, 0
    invoke-interface { p2, p1, p0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L3
  .line 213
    goto :L5
  :L4
  .line 211
    move-exception p0
  :L5
  .line 214
    return-object v0
  :L6
  .line 198
    return-object v0
.end method

.method private static clearTicks(Landroid/app/Activity;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 3
  .line 870
    const v0, 2131362180
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 871
    instance-of v0, p0, Landroid/widget/ListView;
    if-nez v0, :L1
    return-void
  :L1
  .line 872
    check-cast p0, Landroid/widget/ListView;
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object p0
  .line 873
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L2
    return-void
  :L2
  .line 874
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 875
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v0
  .line 876
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L3
    goto :L5
  :L3
  .line 877
    invoke-interface { v0 }, Ljava/util/List;->clear()V
  .line 878
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  :L4
  .line 881
    goto :L7
  :L5
  .line 876
    return-void
  :L6
  .line 879
    move-exception p0
  :L7
  .line 882
    return-void
.end method

.method private static currentPath(Landroid/app/Activity;)Ljava/lang/String;
  .registers 3
  .line 905
    nop
  .line 906
    if-eqz p0, :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v0
    if-eqz v0, :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v0
    const-string v1, "now_path"
    invoke-virtual { v0, v1 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :L1
  :L0
  .line 907
    const/4 v0, 0
  :L1
    if-nez v0, :L2
    if-eqz p0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->defaultFolderPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
  :L2
  .line 908
    return-object v0
.end method

.method public static dropMarks(Ljava/lang/Object;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 120
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    return-void
  :L0
  .line 122
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v0
  .line 123
    if-nez v0, :L1
    return-void
  :L1
  .line 124
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    add-int/lit8 v1, v1, -1
  :L2
    if-ltz v1, :L4
  .line 125
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 126
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
  .line 124
    add-int/lit8 v1, v1, -1
    goto :L2
  :L4
  .line 130
    goto :L6
  :L5
  .line 128
    move-exception p0
  :L6
  .line 131
    return-void
.end method

.method private static folderRow(Landroid/app/Activity;Ljava/io/File;Ljava/util/List;Ljava/util/List;)Ljava/io/File;
  .registers 6
  .line 236
    invoke-interface { p2 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L0
    return-object v1
  :L0
  .line 237
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 238
    if-nez v0, :L1
    return-object v1
  :L1
  .line 239
    if-nez p0, :L2
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->defaultFolderPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
  .line 240
    if-eqz p0, :L12
    invoke-virtual { v0, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L3
    goto :L12
  :L3
  .line 241
    sget-object p0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/objects/Constant;->pathInAudiobook(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L4
    return-object v1
  :L4
  .line 245
    const/4 p0, 0
    if-nez p3, :L5
    const/4 p3, 0
    goto :L6
  :L5
    invoke-interface { p3 }, Ljava/util/List;->size()I
    move-result p3
  :L6
  .line 246
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result p2
    const/4 v0, 1
    if-le p2, p3, :L7
    const/4 p0, 1
  :L7
  .line 247
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
  .line 248
    if-le p3, v0, :L11
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->shufMark(Ljava/io/File;)Ljava/io/File;
    move-result-object v1
  :L11
    return-object v1
  :L12
  .line 240
    return-object v1
.end method

.method private static isAnyMark(Ljava/io/File;)Z
  .registers 2
  .line 99
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
  .line 92
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
  .line 96
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
  .line 473
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 474
    const v1, 2131362556
  :L1
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v1
  .line 475
    instance-of v2, v1, Ljava/lang/Integer;
    if-nez v2, :L2
    return v0
  :L2
  .line 476
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageResource(I)V
  :L3
  .line 477
    const/4 p0, 1
    return p0
  :L4
  .line 478
    move-exception p0
  .line 479
    return v0
.end method

.method private static keyFor(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 570
    if-eqz p0, :L3
  :L0
    sget-object v0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/objects/Constant;->pathInAudiobook(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L3
    const-string p0, "folders_sort_ab"
  :L1
    return-object p0
  :L2
  .line 571
    move-exception p0
    goto :L4
  :L3
  .line 573
    nop
  :L4
  .line 574
    const-string p0, "folders_sort"
    return-object p0
.end method

.method private static mark(Ljava/io/File;)Ljava/io/File;
  .registers 3
  .line 88
    new-instance v0, Ljava/io/File;
    const-string v1, "\u0001ipp_show_all"
    invoke-direct { v0, p0, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method private static markAt(Ljava/lang/Object;I)Z
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  .line 165
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 167
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 168
    if-ltz p1, :L4
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L4
  :L1
  .line 169
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 170
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
  .line 168
    return v1
  :L5
  .line 171
    move-exception p0
  .line 172
    return v1
.end method

.method public static noSelect(Ljava/lang/Object;I)Z
  .registers 2
  .line 115
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result p0
    return p0
.end method

.method public static onMark(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 135
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 137
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result p0
  :L1
    return p0
  :L2
  .line 138
    move-exception p0
  .line 139
    return v1
.end method

.method public static open(Landroid/app/Activity;Ljava/io/File;Ljava/lang/Object;)Z
  .catchall { :L2 .. :L3 } :L4
  .registers 5
  .line 311
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 312
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isShuffle(Ljava/io/File;)Z
    move-result v1
    if-eqz v1, :L1
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Folders;->shufflePlay(Landroid/app/Activity;Ljava/lang/Object;)Z
    move-result p0
    return p0
  :L1
  .line 313
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isMark(Ljava/io/File;)Z
    move-result p2
    if-nez p2, :L2
    return v0
  :L2
  .line 315
    new-instance p2, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/FilesActivity;
    invoke-direct { p2, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 316
    const-string v1, "now_path"
    invoke-virtual { p1 }, Ljava/io/File;->getParent()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 317
    const-string p1, "ipp_all"
    const/4 v1, 1
    invoke-virtual { p2, p1, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 318
    invoke-virtual { p0, p2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L3
  .line 321
    nop
  .line 322
    return v1
  :L4
  .line 319
    move-exception p0
  .line 320
    return v0
.end method

.method private static pathOf(Ljava/io/File;)Ljava/lang/String;
  .registers 1
  .line 582
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method private static relist(Landroid/app/Activity;)V
  .registers 2
  .line 893
    instance-of v0, p0, Lcom/innioasis/music/FilesActivity;
    if-nez v0, :L0
    return-void
  :L0
  .line 894
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->currentPath(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v0
  .line 895
    if-nez v0, :L1
    return-void
  :L1
  .line 896
    check-cast p0, Lcom/innioasis/music/FilesActivity;
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/FilesActivity;->refresh(Ljava/lang/String;)V
  .line 897
    return-void
.end method

.method private static resortVideoList(Landroid/app/Activity;)V
  .catchall { :L0 .. :L10 } :L12
  .registers 7
  .line 780
    const v0, 2131362310
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 781
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v0, :L1
    return-void
  :L1
  .line 782
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 783
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 784
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-nez v0, :L2
    return-void
  :L2
  .line 785
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object v0
  .line 786
    if-eqz v0, :L11
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 2
    if-ge v1, v2, :L3
    goto :L11
  :L3
  .line 787
    sget-object v1, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v1 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getVideoSort()I
    move-result v1
  .line 788
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->None:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v2
    if-ne v1, v2, :L4
    return-void
  :L4
  .line 789
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v2
    const/4 v3, 0
    const/4 v4, 1
    if-eq v1, v2, :L6
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  .line 790
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v2
    if-ne v1, v2, :L5
    goto :L6
  :L5
    const/4 v2, 0
    goto :L7
  :L6
    const/4 v2, 1
  :L7
  .line 791
    sget-object v5, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v5
    if-eq v1, v5, :L8
    sget-object v5, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->CreateTime_Asc:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  .line 792
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v5
    if-ne v1, v5, :L9
  :L8
    const/4 v3, 1
  :L9
  .line 793
    new-instance v1, Lcom/innioasis/ipp/Folders$RowSort;
    invoke-direct { v1, v2, v3 }, Lcom/innioasis/ipp/Folders$RowSort;-><init>(ZZ)V
    invoke-static { v0, v1, v4 }, Lcom/innioasis/ipp/Folders;->splitSort(Ljava/util/List;Ljava/util/Comparator;Z)V
  .line 794
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L10
  .line 797
    goto :L13
  :L11
  .line 786
    return-void
  :L12
  .line 795
    move-exception p0
  :L13
  .line 798
    return-void
.end method

.method public static row(Landroid/view/View;ILjava/lang/Object;)V
  .catchall { :L0 .. :L1 } :L23
  .registers 9
  .line 398
    if-eqz p0, :L24
    instance-of v0, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    goto/16 :L24
  :L0
  .line 401
    check-cast p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p2, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p1
  :L1
  .line 404
    nop
  .line 405
    instance-of p2, p1, Ljava/io/File;
    const/4 v0, 0
    if-eqz p2, :L2
    check-cast p1, Ljava/io/File;
    goto :L3
  :L2
    move-object p1, v0
  :L3
  .line 406
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isAnyMark(Ljava/io/File;)Z
    move-result p2
  .line 407
    const v1, 2131362042
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 408
    const v2, 2131362159
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 409
    instance-of v3, v1, Landroid/widget/TextView;
    if-eqz v3, :L4
    check-cast v1, Landroid/widget/TextView;
    goto :L5
  :L4
    move-object v1, v0
  :L5
  .line 410
    instance-of v3, v2, Landroid/widget/ImageView;
    if-eqz v3, :L6
    check-cast v2, Landroid/widget/ImageView;
    goto :L7
  :L6
    move-object v2, v0
  :L7
  .line 412
    const v3, 1067869798
    const/4 v4, 0
    const v5, 2131362556
    if-nez p2, :L13
  .line 429
    if-eqz v2, :L12
  .line 430
    invoke-virtual { v2, v5, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 431
    if-eqz p1, :L8
    invoke-virtual { p1 }, Ljava/io/File;->isFile()Z
    move-result p0
    if-nez p0, :L8
    const/4 v4, 1
  :L8
  .line 432
    if-eqz v1, :L11
    if-eqz p1, :L11
    invoke-static { v4 }, Lcom/innioasis/ipp/Theme;->hasFileIcon(Z)Z
    move-result p0
    if-nez p0, :L11
  .line 433
    if-eqz v4, :L9
    const p0, 2131624020
    goto :L10
  :L9
    const p0, 2131624021
  :L10
    invoke-virtual { v2, p0 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 434
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 435
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Folders;->scale(Landroid/widget/ImageView;F)V
    goto :L12
  :L11
  .line 437
    invoke-static { v2 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 438
    const/high16 p0, 0x3F800000
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/Folders;->scale(Landroid/widget/ImageView;F)V
  :L12
  .line 441
    return-void
  :L13
  .line 444
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isShuffle(Ljava/io/File;)Z
    move-result p1
  .line 445
    if-eqz v1, :L16
  .line 446
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 447
    if-eqz p1, :L14
    const p2, 2131820900
    goto :L15
  :L14
    const p2, 2131821049
  :L15
  .line 446
    invoke-virtual { p0, p2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L16
  .line 449
    if-eqz v2, :L22
  .line 450
    invoke-virtual { v2, v4 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 451
    const p0, 2131623978
    const p2, 2131623994
    if-eqz p1, :L17
    const v0, 2131623978
    goto :L18
  :L17
    const v0, 2131623994
  :L18
    invoke-virtual { v2, v0 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 452
    if-eqz v1, :L19
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L19
  .line 453
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Folders;->scale(Landroid/widget/ImageView;F)V
  .line 455
    nop
  .line 456
    if-eqz p1, :L20
    goto :L21
  :L20
    const p0, 2131623994
  :L21
  .line 455
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v2, v5, p0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  :L22
  .line 458
    return-void
  :L23
  .line 402
    move-exception p0
  .line 403
    return-void
  :L24
  .line 398
    return-void
.end method

.method private static rowFile(Ljava/lang/Object;)Ljava/io/File;
  .registers 3
  .line 724
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 725
    check-cast p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 726
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->getTargetFile()Ljava/io/File;
    move-result-object v0
  .line 727
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 728
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->getVideoInfo()Lcom/innioasis/y1/database/video/VideoInfo;
    move-result-object p0
  .line 729
    if-nez p0, :L2
    move-object p0, v1
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/video/VideoInfo;->getFilePath()Ljava/lang/String;
    move-result-object p0
  :L3
  .line 730
    if-nez p0, :L4
    goto :L5
  :L4
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  :L5
    return-object v1
.end method

.method private static scale(Landroid/widget/ImageView;F)V
  .registers 3
  .line 499
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getScaleX()F
    move-result v0
    cmpl-float v0, v0, p1
    if-nez v0, :L0
    goto :L1
  :L0
  .line 500
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 501
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 502
    return-void
  :L1
  .line 499
    return-void
.end method

.method private static shufMark(Ljava/io/File;)Ljava/io/File;
  .registers 3
  .line 89
    new-instance v0, Ljava/io/File;
    const-string v1, "\u0001ipp_show_all_shuffle"
    invoke-direct { v0, p0, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method private static shufflePlay(Landroid/app/Activity;Ljava/lang/Object;)Z
  .catchall { :L0 .. :L8 } :L9
  .registers 9
  .line 348
    const/4 v0, 1
  :L0
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return v0
  :L1
  .line 349
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 350
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
  .line 351
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 352
    const/4 v3, 0
    const/4 v4, 0
  :L2
    if-ge v4, v1, :L5
  .line 353
    invoke-virtual { p1, v4 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v5
  .line 354
    instance-of v6, v5, Ljava/io/File;
    if-eqz v6, :L4
    move-object v6, v5
    check-cast v6, Ljava/io/File;
    invoke-static { v6 }, Lcom/innioasis/ipp/Folders;->isAnyMark(Ljava/io/File;)Z
    move-result v6
    if-eqz v6, :L3
    goto :L4
  :L3
  .line 355
    new-instance v6, Lcom/innioasis/y1/database/Song;
    invoke-direct { v6 }, Lcom/innioasis/y1/database/Song;-><init>()V
  .line 356
    check-cast v5, Ljava/io/File;
    invoke-virtual { v5 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/database/Song;->setPath(Ljava/lang/String;)V
  .line 357
    invoke-virtual { v2, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 352
    add-int/lit8 v4, v4, 1
    goto :L2
  :L5
  .line 359
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p1
    if-eqz p1, :L6
    return v0
  :L6
  .line 360
    invoke-static { v2 }, Ljava/util/Collections;->shuffle(Ljava/util/List;)V
  .line 361
    sget-object p1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p1
  .line 362
    if-eqz p1, :L7
    invoke-virtual { p1, v2, v3 }, Lcom/innioasis/y1/service/PlayerService;->setMusicPlaylist(Ljava/util/List;I)V
  :L7
  .line 363
    new-instance p1, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/MusicPlayerActivity;
    invoke-direct { p1, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L8
  .line 366
    goto :L10
  :L9
  .line 364
    move-exception p0
  :L10
  .line 367
    return v0
.end method

.method public static skipMark(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 150
    if-eqz p1, :L7
    instance-of p1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez p1, :L0
    goto :L7
  :L0
  .line 152
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 153
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p1
  .line 154
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 155
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 156
    add-int/lit8 p1, p1, 1
  :L2
  .line 157
    if-ge p1, v0, :L3
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result v1
    if-eqz v1, :L3
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 158
    if-ge p1, v0, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  :L4
  .line 161
    goto :L6
  :L5
  .line 159
    move-exception p0
  :L6
  .line 162
    return-void
  :L7
  .line 150
    return-void
.end method

.method private static songsUnder(Ljava/io/File;)Ljava/util/List;
  .registers 6
  .line 281
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 282
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 283
    if-nez v1, :L0
    return-object v0
  :L0
  .line 284
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 285
    if-nez p0, :L1
    return-object v0
  :L1
  .line 286
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
  .line 287
    const/4 v2, 0
  :L3
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 288
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 289
    if-nez v3, :L4
    const/4 v3, 0
    goto :L5
  :L4
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  :L5
  .line 290
    if-eqz v3, :L7
    invoke-virtual { v3, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L6
    goto :L7
  :L6
  .line 291
    new-instance v4, Ljava/io/File;
    invoke-direct { v4, v3 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 292
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result v3
    if-eqz v3, :L7
    invoke-virtual { v0, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 287
    add-int/lit8 v2, v2, 1
    goto :L3
  :L8
  .line 294
    sget-object p0, Lcom/innioasis/ipp/Folders;->PATH:Ljava/util/Comparator;
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 295
    return-object v0
.end method

.method public static sortAsc(Ljava/io/File;)Z
  .registers 2
  .line 593
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->pathOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->sortValue(Ljava/lang/String;)I
    move-result p0
  .line 594
    if-eqz p0, :L1
    const/4 v0, 2
    if-ne p0, v0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method public static sortByName(Ljava/io/File;)Z
  .registers 2
  .line 587
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->pathOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->sortValue(Ljava/lang/String;)I
    move-result p0
  .line 588
    const/4 v0, 1
    if-eqz p0, :L1
    if-ne p0, v0, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method public static sortFiles(Ljava/util/List;Ljava/io/File;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 610
    if-eqz p0, :L5
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L5
  :L1
  .line 611
    new-instance v0, Lcom/innioasis/ipp/Folders$FileSort;
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->sortByName(Ljava/io/File;)Z
    move-result v1
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->sortAsc(Ljava/io/File;)Z
    move-result p1
    invoke-direct { v0, v1, p1 }, Lcom/innioasis/ipp/Folders$FileSort;-><init>(ZZ)V
    invoke-static { p0, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L2
  .line 614
    goto :L4
  :L3
  .line 612
    move-exception p0
  :L4
  .line 615
    return-void
  :L5
  .line 610
    return-void
.end method

.method public static sortMenu(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 822
    if-nez p0, :L0
    return-void
  :L0
  .line 823
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 824
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 825
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 826
    const v1, 2131820969
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 827
    const v1, 2131820970
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 829
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Folders$SortPick;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/Folders$SortPick;-><init>(Landroid/app/Activity;)V
    const v3, 2131886360
    invoke-direct { v1, p0, v0, v2, v3 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L1
  .line 832
    goto :L3
  :L2
  .line 830
    move-exception p0
  :L3
  .line 833
    return-void
.end method

.method private static sortValue(Ljava/lang/String;)I
  .registers 2
  .line 578
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->keyFor(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method public static sortVideoFiles(Ljava/util/List;)V
  .catchall { :L0 .. :L12 } :L13
  .registers 7
  .line 665
    if-eqz p0, :L15
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L15
  :L1
  .line 666
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getVideoSort()I
    move-result v0
  .line 667
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v1
    const/4 v2, 1
    const/4 v3, 0
    if-eq v0, v1, :L3
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  .line 668
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v1
    if-ne v0, v1, :L2
    goto :L3
  :L2
    const/4 v1, 0
    goto :L4
  :L3
    const/4 v1, 1
  :L4
  .line 669
    sget-object v4, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v4
    if-eq v0, v4, :L6
    sget-object v4, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->CreateTime_Asc:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  .line 670
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v4
    if-ne v0, v4, :L5
    goto :L6
  :L5
    const/4 v4, 0
    goto :L7
  :L6
    const/4 v4, 1
  :L7
  .line 673
    sget-object v5, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->None:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v5
    if-ne v0, v5, :L8
    goto :L9
  :L8
    const/4 v2, 0
  :L9
  .line 674
    if-eqz v2, :L10
    const/4 v0, 0
    goto :L11
  :L10
    new-instance v0, Lcom/innioasis/ipp/Folders$FileSort;
    invoke-direct { v0, v1, v4 }, Lcom/innioasis/ipp/Folders$FileSort;-><init>(ZZ)V
  :L11
    invoke-static { p0, v0, v3 }, Lcom/innioasis/ipp/Folders;->splitSort(Ljava/util/List;Ljava/util/Comparator;Z)V
  :L12
  .line 677
    goto :L14
  :L13
  .line 675
    move-exception p0
  :L14
  .line 678
    return-void
  :L15
  .line 665
    return-void
.end method

.method private static splitSort(Ljava/util/List;Ljava/util/Comparator;Z)V
  .registers 8
  .line 697
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 698
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 699
    const/4 v2, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L6
  .line 700
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 701
    if-eqz p2, :L1
    invoke-static { v3 }, Lcom/innioasis/ipp/Folders;->rowFile(Ljava/lang/Object;)Ljava/io/File;
    move-result-object v4
    goto :L3
  :L1
    instance-of v4, v3, Ljava/io/File;
    if-eqz v4, :L2
    move-object v4, v3
    check-cast v4, Ljava/io/File;
    goto :L3
  :L2
    const/4 v4, 0
  :L3
  .line 702
    if-eqz v4, :L4
    invoke-virtual { v4 }, Ljava/io/File;->isDirectory()Z
    move-result v4
    if-eqz v4, :L4
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L5
  :L4
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 699
    add-int/lit8 v2, v2, 1
    goto :L0
  :L6
  .line 704
    if-eqz p1, :L7
  .line 705
    invoke-static { v0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 706
    invoke-static { v1, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L7
  .line 708
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p2
    if-nez p2, :L9
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p2
    if-eqz p2, :L8
    goto :L9
  :L8
  .line 713
    invoke-interface { p0 }, Ljava/util/List;->clear()V
  .line 714
    invoke-interface { p0, v0 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 715
    invoke-interface { p0, v1 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 716
    return-void
  :L9
  .line 710
    if-eqz p1, :L10
    invoke-static { p0, p1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L10
  .line 711
    return-void
.end method

.method public static startRow(Ljava/lang/Object;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 260
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    return-void
  :L0
  .line 262
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 263
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    return-void
  :L1
  .line 264
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v0
  .line 265
    instance-of v1, v0, Ljava/io/File;
    if-eqz v1, :L2
    check-cast v0, Ljava/io/File;
    invoke-static { v0 }, Lcom/innioasis/ipp/Folders;->isAnyMark(Ljava/io/File;)Z
    move-result v0
    if-eqz v0, :L2
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  :L2
  .line 268
    goto :L4
  :L3
  .line 266
    move-exception p0
  :L4
  .line 269
    return-void
.end method

.method public static title(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 375
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->allMode(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :L4
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L0
    goto :L4
  :L0
  .line 377
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
    const v1, 2131821049
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/base/BaseActivity;->setStateBarLeftText(Ljava/lang/String;)V
  :L1
  .line 380
    goto :L3
  :L2
  .line 378
    move-exception p0
  :L3
  .line 381
    return-void
  :L4
  .line 375
    return-void
.end method

.method public static videoFolder(Landroid/widget/ImageView;)V
  .registers 3
  .line 514
    if-nez p0, :L0
    return-void
  :L0
  .line 515
    const v0, 2131624020
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 516
    const v1, 2131362556
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    invoke-virtual { p0, v1, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 517
    return-void
.end method

.method public static videoIcon(Lcom/innioasis/y1/databinding/ItemVideoBinding;)V
  .registers 5
  .line 528
    if-nez p0, :L0
    return-void
  :L0
  .line 529
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemVideoBinding;->fileImg:Landroid/widget/ImageView;
  .line 530
    if-nez v0, :L1
    return-void
  :L1
  .line 531
    const v1, 2131362556
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v2
    instance-of v2, v2, Ljava/lang/Integer;
  .line 532
    const/4 v3, 0
    invoke-virtual { v0, v1, v3 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 533
    if-eqz v2, :L4
  .line 534
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ItemVideoBinding;->fileName:Landroid/widget/TextView;
    if-nez v1, :L2
    const/4 p0, 0
    goto :L3
  :L2
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ItemVideoBinding;->fileName:Landroid/widget/TextView;
    invoke-virtual { p0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
  :L3
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 535
    const p0, 1067869798
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Folders;->scale(Landroid/widget/ImageView;F)V
    goto :L5
  :L4
  .line 537
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 538
    const/high16 p0, 0x3F800000
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Folders;->scale(Landroid/widget/ImageView;F)V
  :L5
  .line 540
    return-void
.end method

.method public static videoSortMenu(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 736
    if-nez p0, :L0
    return-void
  :L0
  .line 737
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 738
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 739
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 740
    const v1, 2131820969
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 741
    const v1, 2131820970
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 742
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Folders$VideoSortPick;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/Folders$VideoSortPick;-><init>(Landroid/app/Activity;)V
    const v3, 2131886360
    invoke-direct { v1, p0, v0, v2, v3 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L1
  .line 745
    goto :L3
  :L2
  .line 743
    move-exception p0
  :L3
  .line 746
    return-void
.end method

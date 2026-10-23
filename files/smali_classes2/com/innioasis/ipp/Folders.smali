.class public final Lcom/innioasis/ipp/Folders;
.super Ljava/lang/Object;
.source "Folders.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Folders$Key;,
    Lcom/innioasis/ipp/Folders$KeySort;,
    Lcom/innioasis/ipp/Folders$VideoSortPick;,
    Lcom/innioasis/ipp/Folders$SortPick;
  }
.end annotation

.field private final static BIG:F = 1.3F

.field public final static EXTRA:Ljava/lang/String; = "ipp_all"

.field public final static KEY_SORT:Ljava/lang/String; = "folders_sort"

.field public final static KEY_SORT_BOOK:Ljava/lang/String; = "folders_sort_ab"

.field private final static MARK:Ljava/lang/String; = "\u0001ipp_show_all"

.field private final static SHUF:Ljava/lang/String; = "\u0001ipp_show_all_shuffle"

.field private final static SORT_A_Z:I = 0

.field private final static SORT_NEW:I = 3

.field private final static SORT_OLD:I = 2

.field private final static SORT_Z_A:I = 1

.method private constructor <init>()V
  .registers 1
  .line 43
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;)V
  .registers 1
  .line 41
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->resortVideoList(Landroid/app/Activity;)V
    return-void
.end method

.method static synthetic access$100(Landroid/app/Activity;)Ljava/lang/String;
  .registers 1
  .line 41
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->currentPath(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 41
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->keyFor(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$300(Landroid/app/Activity;)V
  .registers 1
  .line 41
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->clearTicks(Landroid/app/Activity;)V
    return-void
.end method

.method static synthetic access$400(Landroid/app/Activity;)V
  .registers 1
  .line 41
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->relist(Landroid/app/Activity;)V
    return-void
.end method

.method private static allMode(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 128
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
  .line 129
    move-exception p0
  .line 130
    return v0
  :L3
  .line 128
    return v0
.end method

.method private static anyUnder(Ljava/io/File;)Z
  .registers 6
  .line 180
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 181
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 182
    const/4 v1, 0
    if-eqz v0, :L7
    if-nez p0, :L0
    goto :L7
  :L0
  .line 183
    const-string v2, "/"
    invoke-virtual { p0, v2 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L1
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  :L1
  .line 184
    const/4 v2, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L6
  .line 185
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 186
    if-nez v3, :L3
    const/4 v3, 0
    goto :L4
  :L3
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  :L4
  .line 187
    if-eqz v3, :L5
    invoke-virtual { v3, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L5
    new-instance v4, Ljava/io/File;
    invoke-direct { v4, v3 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result v3
    if-eqz v3, :L5
    const/4 p0, 1
    return p0
  :L5
  .line 184
    add-int/lit8 v2, v2, 1
    goto :L2
  :L6
  .line 189
    return v1
  :L7
  .line 182
    return v1
.end method

.method public static build(Landroid/app/Activity;Ljava/io/File;Ljava/util/List;Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L3 } :L4
  .registers 6
  .line 143
    const/4 v0, 0
    if-eqz p1, :L6
    if-nez p2, :L0
    goto :L6
  :L0
  .line 144
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->allMode(Landroid/app/Activity;)Z
    move-result v1
    if-eqz v1, :L2
  .line 145
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->songsUnder(Ljava/io/File;)Ljava/util/List;
    move-result-object p0
  .line 146
    invoke-interface { p2 }, Ljava/util/List;->clear()V
  .line 147
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result p3
    if-nez p3, :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->shufMark(Ljava/io/File;)Ljava/io/File;
    move-result-object p1
    invoke-interface { p2, p1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L1
  .line 148
    invoke-interface { p2, p0 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 150
    new-instance p1, Ljava/util/ArrayList;
    invoke-direct { p1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    return-object p1
  :L2
  .line 152
    invoke-static { p0, p1, p2, p3 }, Lcom/innioasis/ipp/Folders;->folderRow(Landroid/app/Activity;Ljava/io/File;Ljava/util/List;Ljava/util/List;)Ljava/io/File;
    move-result-object p0
  .line 153
    if-eqz p0, :L3
    const/4 p1, 0
    invoke-interface { p2, p1, p0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L3
  .line 155
    goto :L5
  :L4
  .line 154
    move-exception p0
  :L5
  .line 156
    return-object v0
  :L6
  .line 143
    return-object v0
.end method

.method public static byParent(Lcom/innioasis/y1/database/Y1Repository;Ljava/lang/String;)Ljava/util/List;
  .catchall { :L0 .. :L4 } :L7
  .registers 11
  :L0
  .line 200
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loaded()Ljava/util/List;
    move-result-object v0
  .line 201
    if-eqz v0, :L6
    if-eqz p1, :L6
    sget-object v1, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v1, p1 }, Lcom/innioasis/music/objects/Constant;->pathInAudiobook(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L6
  .line 202
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 203
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v2
  .line 204
    const/4 v3, 0
  :L1
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L5
  .line 205
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 206
    if-nez v4, :L2
    const/4 v5, 0
    goto :L3
  :L2
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
  :L3
  .line 207
    if-eqz v5, :L4
    invoke-virtual { v5 }, Ljava/lang/String;->length()I
    move-result v6
    add-int/lit8 v7, v2, 1
    if-le v6, v7, :L4
    invoke-virtual { v5, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v6
    const/16 v8, 47
    if-ne v6, v8, :L4
  .line 208
    invoke-virtual { v5, p1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L4
    invoke-virtual { v5, v8, v7 }, Ljava/lang/String;->indexOf(II)I
    move-result v5
    if-gez v5, :L4
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 204
    add-int/lit8 v3, v3, 1
    goto :L1
  :L5
  .line 210
    return-object v1
  :L6
  .line 213
    goto :L8
  :L7
  .line 212
    move-exception v0
  :L8
  .line 214
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByParentPath(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
    return-object p0
.end method

.method private static clearTicks(Landroid/app/Activity;)V
  .catchall { :L0 .. :L5 } :L7
  .registers 3
  .line 670
    const v0, 2131362180
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 671
    if-nez p0, :L1
    const/4 p0, 0
    goto :L2
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  :L2
  .line 672
    if-nez p0, :L3
    return-void
  :L3
  .line 673
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v0
  .line 674
    if-eqz v0, :L6
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L4
    goto :L6
  :L4
  .line 675
    invoke-interface { v0 }, Ljava/util/List;->clear()V
  .line 676
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  :L5
  .line 678
    goto :L8
  :L6
  .line 674
    return-void
  :L7
  .line 677
    move-exception p0
  :L8
  .line 679
    return-void
.end method

.method private static currentPath(Landroid/app/Activity;)Ljava/lang/String;
  .registers 3
  .line 691
    nop
  .line 692
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
  .line 693
    const/4 v0, 0
  :L1
    if-nez v0, :L2
    if-eqz p0, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->defaultFolderPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
  :L2
  .line 694
    return-object v0
.end method

.method public static dropMarks(Ljava/lang/Object;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  .line 74
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    return-void
  :L0
  .line 76
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v0
  .line 77
    if-nez v0, :L1
    return-void
  :L1
  .line 78
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    add-int/lit8 v1, v1, -1
  :L2
    if-ltz v1, :L4
  .line 79
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 80
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
  .line 78
    add-int/lit8 v1, v1, -1
    goto :L2
  :L4
  .line 83
    goto :L6
  :L5
  .line 82
    move-exception p0
  :L6
  .line 84
    return-void
.end method

.method private static folderRow(Landroid/app/Activity;Ljava/io/File;Ljava/util/List;Ljava/util/List;)Ljava/io/File;
  .registers 6
  .line 164
    invoke-interface { p2 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L0
    return-object v1
  :L0
  .line 165
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 166
    if-nez v0, :L1
    return-object v1
  :L1
  .line 167
    if-nez p0, :L2
    sget-object p0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object p0
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Prefs;->defaultFolderPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
  .line 168
    if-eqz p0, :L11
    invoke-virtual { v0, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result p0
    if-nez p0, :L3
    goto :L11
  :L3
  .line 169
    sget-object p0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/objects/Constant;->pathInAudiobook(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L4
    return-object v1
  :L4
  .line 172
    const/4 p0, 0
    if-nez p3, :L5
    const/4 p3, 0
    goto :L6
  :L5
    invoke-interface { p3 }, Ljava/util/List;->size()I
    move-result p3
  :L6
  .line 173
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result p2
    const/4 v0, 1
    if-le p2, p3, :L7
    const/4 p0, 1
  :L7
  .line 174
    if-eqz p0, :L9
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->anyUnder(Ljava/io/File;)Z
    move-result p0
    if-eqz p0, :L8
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->mark(Ljava/io/File;)Ljava/io/File;
    move-result-object v1
  :L8
    return-object v1
  :L9
  .line 175
    if-le p3, v0, :L10
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->shufMark(Ljava/io/File;)Ljava/io/File;
    move-result-object v1
  :L10
    return-object v1
  :L11
  .line 168
    return-object v1
.end method

.method private static isAnyMark(Ljava/io/File;)Z
  .registers 2
  .line 65
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
  .line 58
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
  .line 62
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
  .line 375
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 376
    const v1, 2131362556
  :L1
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v1
  .line 377
    instance-of v2, v1, Ljava/lang/Integer;
    if-nez v2, :L2
    return v0
  :L2
  .line 378
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    invoke-virtual { p0, v1 }, Landroid/widget/ImageView;->setImageResource(I)V
  :L3
  .line 379
    const/4 p0, 1
    return p0
  :L4
  .line 380
    move-exception p0
  .line 381
    return v0
.end method

.method private static keyFor(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 443
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
  .line 444
    move-exception p0
    goto :L4
  :L3
  .line 445
    nop
  :L4
  .line 446
    const-string p0, "folders_sort"
    return-object p0
.end method

.method private static mark(Ljava/io/File;)Ljava/io/File;
  .registers 3
  .line 54
    new-instance v0, Ljava/io/File;
    const-string v1, "\u0001ipp_show_all"
    invoke-direct { v0, p0, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method private static markAt(Ljava/lang/Object;I)Z
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  .line 115
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 117
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 118
    if-ltz p1, :L4
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L4
  :L1
  .line 119
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 120
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
  .line 118
    return v1
  :L5
  .line 121
    move-exception p0
  .line 122
    return v1
.end method

.method public static noSelect(Ljava/lang/Object;I)Z
  .registers 2
  .line 69
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result p0
    return p0
.end method

.method public static onMark(Ljava/lang/Object;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 88
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 90
    move-object v0, p0
    check-cast v0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result p0
  :L1
    return p0
  :L2
  .line 91
    move-exception p0
  .line 92
    return v1
.end method

.method public static open(Landroid/app/Activity;Ljava/io/File;Ljava/lang/Object;)Z
  .catchall { :L2 .. :L3 } :L4
  .registers 5
  .line 263
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 264
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isShuffle(Ljava/io/File;)Z
    move-result v1
    if-eqz v1, :L1
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Folders;->shufflePlay(Landroid/app/Activity;Ljava/lang/Object;)Z
    move-result p0
    return p0
  :L1
  .line 265
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isMark(Ljava/io/File;)Z
    move-result p2
    if-nez p2, :L2
    return v0
  :L2
  .line 267
    new-instance p2, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/FilesActivity;
    invoke-direct { p2, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 268
    const-string v1, "now_path"
    invoke-virtual { p1 }, Ljava/io/File;->getParent()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2, v1, p1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
  .line 269
    const-string p1, "ipp_all"
    const/4 v1, 1
    invoke-virtual { p2, p1, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 270
    invoke-virtual { p0, p2 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L3
  .line 273
    nop
  .line 274
    return v1
  :L4
  .line 271
    move-exception p0
  .line 272
    return v0
.end method

.method private static order(Ljava/util/List;ZZZZZ)V
  .registers 23
  .line 488
    move-object/from16 v0, p0
    move/from16 v1, p1
    move/from16 v2, p2
    move/from16 v3, p4
    invoke-interface/range { p0 .. p0 }, Ljava/util/List;->size()I
    move-result v4
  .line 489
    new-array v5, v4, [Lcom/innioasis/ipp/Folders$Key;
  .line 490
    const/4 v6, 0
    const/4 v7, 0
  :L0
    if-ge v7, v4, :L11
  .line 491
    invoke-interface { v0, v7 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
  .line 492
    const/4 v8, 0
    if-eqz p5, :L1
    invoke-static { v9 }, Lcom/innioasis/ipp/Folders;->rowFile(Ljava/lang/Object;)Ljava/io/File;
    move-result-object v10
    goto :L3
  :L1
    instance-of v10, v9, Ljava/io/File;
    if-eqz v10, :L2
    move-object v10, v9
    check-cast v10, Ljava/io/File;
    goto :L3
  :L2
    move-object v10, v8
  :L3
  .line 493
    if-nez v10, :L4
    goto :L5
  :L4
    invoke-virtual { v10 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v8
  :L5
  .line 494
    new-instance v14, Lcom/innioasis/ipp/Folders$Key;
    if-eqz v3, :L6
    if-eqz v10, :L6
  .line 495
    invoke-virtual { v10 }, Ljava/io/File;->isDirectory()Z
    move-result v11
    if-eqz v11, :L6
    const/4 v11, 1
    goto :L7
  :L6
    const/4 v11, 0
  :L7
  .line 496
    if-nez v8, :L8
    const-string v8, ""
  :L8
    move-object v12, v8
  .line 497
    if-eqz v1, :L9
    if-nez v2, :L9
    if-eqz v10, :L9
    invoke-virtual { v10 }, Ljava/io/File;->lastModified()J
    move-result-wide v15
    goto :L10
  :L9
    const-wide/16 v15, 0
  :L10
    move-object v8, v14
    move v10, v11
    move-object v11, v12
    move-wide v12, v15
    invoke-direct/range { v8 .. v13 }, Lcom/innioasis/ipp/Folders$Key;-><init>(Ljava/lang/Object;ZLjava/lang/String;J)V
    aput-object v14, v5, v7
  .line 490
    add-int/lit8 v7, v7, 1
    goto :L0
  :L11
  .line 499
    new-instance v7, Lcom/innioasis/ipp/Folders$KeySort;
    move/from16 v8, p3
    invoke-direct { v7, v1, v2, v8, v3 }, Lcom/innioasis/ipp/Folders$KeySort;-><init>(ZZZZ)V
    invoke-static { v5, v7 }, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V
  .line 500
    nop
  :L12
    if-ge v6, v4, :L13
    aget-object v1, v5, v6
    iget-object v1, v1, Lcom/innioasis/ipp/Folders$Key;->item:Ljava/lang/Object;
    invoke-interface { v0, v6, v1 }, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    add-int/lit8 v6, v6, 1
    goto :L12
  :L13
  .line 501
    return-void
.end method

.method private static pathOf(Ljava/io/File;)Ljava/lang/String;
  .registers 1
  .line 454
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
  .line 683
    instance-of v0, p0, Lcom/innioasis/music/FilesActivity;
    if-nez v0, :L0
    return-void
  :L0
  .line 684
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->currentPath(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v0
  .line 685
    if-nez v0, :L1
    return-void
  :L1
  .line 686
    check-cast p0, Lcom/innioasis/music/FilesActivity;
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/FilesActivity;->refresh(Ljava/lang/String;)V
  .line 687
    return-void
.end method

.method private static resortVideoList(Landroid/app/Activity;)V
  .catchall { :L0 .. :L14 } :L16
  .registers 9
  .line 606
    const v0, 2131362310
  :L0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 607
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v0, :L1
    return-void
  :L1
  .line 608
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 609
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object p0
  .line 610
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-nez v0, :L2
    return-void
  :L2
  .line 611
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseBindingAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object v1
  .line 612
    if-eqz v1, :L15
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v2, 2
    if-ge v0, v2, :L3
    goto :L15
  :L3
  .line 613
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getVideoSort()I
    move-result v0
  .line 614
    sget-object v2, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->None:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v2
    const/4 v3, 1
    const/4 v4, 0
    if-ne v0, v2, :L4
    const/4 v2, 1
    goto :L5
  :L4
    const/4 v2, 0
  :L5
  .line 615
    sget-object v5, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v5
    if-eq v0, v5, :L7
    sget-object v5, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  .line 616
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v5
    if-ne v0, v5, :L6
    goto :L7
  :L6
    const/4 v5, 0
    goto :L8
  :L7
    const/4 v5, 1
  :L8
  .line 617
    sget-object v6, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v6
    if-eq v0, v6, :L10
    sget-object v6, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->CreateTime_Asc:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  .line 618
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v6
    if-ne v0, v6, :L9
    goto :L10
  :L9
    const/4 v0, 0
    goto :L11
  :L10
    const/4 v0, 1
  :L11
  .line 619
    if-nez v2, :L12
    const/4 v2, 1
    goto :L13
  :L12
    const/4 v2, 0
  :L13
    const/4 v6, 1
    const/4 v7, 1
    move v3, v5
    move v4, v0
    move v5, v6
    move v6, v7
    invoke-static/range { v1 .. v6 }, Lcom/innioasis/ipp/Folders;->order(Ljava/util/List;ZZZZZ)V
  .line 620
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L14
  .line 622
    goto :L17
  :L15
  .line 612
    return-void
  :L16
  .line 621
    move-exception p0
  :L17
  .line 623
    return-void
.end method

.method public static row(Landroid/view/View;ILjava/lang/Object;)V
  .catchall { :L0 .. :L1 } :L23
  .registers 9
  .line 320
    if-eqz p0, :L24
    instance-of v0, p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    goto/16 :L24
  :L0
  .line 323
    check-cast p2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p2, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p1
  :L1
  .line 326
    nop
  .line 327
    instance-of p2, p1, Ljava/io/File;
    const/4 v0, 0
    if-eqz p2, :L2
    check-cast p1, Ljava/io/File;
    goto :L3
  :L2
    move-object p1, v0
  :L3
  .line 328
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isAnyMark(Ljava/io/File;)Z
    move-result p2
  .line 329
    const v1, 2131362042
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 330
    const v2, 2131362159
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 331
    instance-of v3, v1, Landroid/widget/TextView;
    if-eqz v3, :L4
    check-cast v1, Landroid/widget/TextView;
    goto :L5
  :L4
    move-object v1, v0
  :L5
  .line 332
    instance-of v3, v2, Landroid/widget/ImageView;
    if-eqz v3, :L6
    check-cast v2, Landroid/widget/ImageView;
    goto :L7
  :L6
    move-object v2, v0
  :L7
  .line 334
    const v3, 1067869798
    const/4 v4, 0
    const v5, 2131362556
    if-nez p2, :L13
  .line 338
    if-eqz v2, :L12
  .line 339
    invoke-virtual { v2, v5, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 340
    if-eqz p1, :L8
    invoke-virtual { p1 }, Ljava/io/File;->isFile()Z
    move-result p0
    if-nez p0, :L8
    const/4 v4, 1
  :L8
  .line 341
    if-eqz v1, :L11
    if-eqz p1, :L11
    invoke-static { v4 }, Lcom/innioasis/ipp/Theme;->hasFileIcon(Z)Z
    move-result p0
    if-nez p0, :L11
  .line 342
    if-eqz v4, :L9
    const p0, 2131624020
    goto :L10
  :L9
    const p0, 2131624021
  :L10
    invoke-virtual { v2, p0 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 343
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  .line 344
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Folders;->scale(Landroid/widget/ImageView;F)V
    goto :L12
  :L11
  .line 346
    invoke-static { v2 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 347
    const/high16 p0, 0x3F800000
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/Folders;->scale(Landroid/widget/ImageView;F)V
  :L12
  .line 350
    return-void
  :L13
  .line 353
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->isShuffle(Ljava/io/File;)Z
    move-result p1
  .line 354
    if-eqz v1, :L16
  .line 355
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 356
    if-eqz p1, :L14
    const p2, 2131820900
    goto :L15
  :L14
    const p2, 2131821049
  :L15
  .line 355
    invoke-virtual { p0, p2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  :L16
  .line 358
    if-eqz v2, :L22
  .line 359
    invoke-virtual { v2, v4 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 360
    const p0, 2131623978
    const p2, 2131623994
    if-eqz p1, :L17
    const v0, 2131623978
    goto :L18
  :L17
    const v0, 2131623994
  :L18
    invoke-virtual { v2, v0 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 361
    if-eqz v1, :L19
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v0
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L19
  .line 362
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Folders;->scale(Landroid/widget/ImageView;F)V
  .line 364
    nop
  .line 365
    if-eqz p1, :L20
    goto :L21
  :L20
    const p0, 2131623994
  :L21
  .line 364
    invoke-static { p0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p0
    invoke-virtual { v2, v5, p0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  :L22
  .line 367
    return-void
  :L23
  .line 324
    move-exception p0
  .line 325
    return-void
  :L24
  .line 320
    return-void
.end method

.method private static rowFile(Ljava/lang/Object;)Ljava/io/File;
  .registers 3
  .line 560
    instance-of v0, p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 561
    check-cast p0, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 562
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->getTargetFile()Ljava/io/File;
    move-result-object v0
  .line 563
    if-eqz v0, :L1
    return-object v0
  :L1
  .line 564
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->getVideoInfo()Lcom/innioasis/y1/database/video/VideoInfo;
    move-result-object p0
  .line 565
    if-nez p0, :L2
    move-object p0, v1
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/video/VideoInfo;->getFilePath()Ljava/lang/String;
    move-result-object p0
  :L3
  .line 566
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
  .line 393
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroid/widget/ImageView;->getScaleX()F
    move-result v0
    cmpl-float v0, v0, p1
    if-nez v0, :L0
    goto :L1
  :L0
  .line 394
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setScaleX(F)V
  .line 395
    invoke-virtual { p0, p1 }, Landroid/widget/ImageView;->setScaleY(F)V
  .line 396
    return-void
  :L1
  .line 393
    return-void
.end method

.method private static shufMark(Ljava/io/File;)Ljava/io/File;
  .registers 3
  .line 55
    new-instance v0, Ljava/io/File;
    const-string v1, "\u0001ipp_show_all_shuffle"
    invoke-direct { v0, p0, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method private static shufflePlay(Landroid/app/Activity;Ljava/lang/Object;)Z
  .catchall { :L0 .. :L8 } :L9
  .registers 9
  .line 284
    const/4 v0, 1
  :L0
    instance-of v1, p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L1
    return v0
  :L1
  .line 285
    check-cast p1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 286
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
  .line 287
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 288
    const/4 v3, 0
    const/4 v4, 0
  :L2
    if-ge v4, v1, :L5
  .line 289
    invoke-virtual { p1, v4 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v5
  .line 290
    instance-of v6, v5, Ljava/io/File;
    if-eqz v6, :L4
    move-object v6, v5
    check-cast v6, Ljava/io/File;
    invoke-static { v6 }, Lcom/innioasis/ipp/Folders;->isAnyMark(Ljava/io/File;)Z
    move-result v6
    if-eqz v6, :L3
    goto :L4
  :L3
  .line 291
    new-instance v6, Lcom/innioasis/y1/database/Song;
    invoke-direct { v6 }, Lcom/innioasis/y1/database/Song;-><init>()V
  .line 292
    check-cast v5, Ljava/io/File;
    invoke-virtual { v5 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/database/Song;->setPath(Ljava/lang/String;)V
  .line 293
    invoke-virtual { v2, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 288
    add-int/lit8 v4, v4, 1
    goto :L2
  :L5
  .line 295
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p1
    if-eqz p1, :L6
    return v0
  :L6
  .line 296
    invoke-static { v2 }, Ljava/util/Collections;->shuffle(Ljava/util/List;)V
  .line 297
    sget-object p1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { p1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object p1
  .line 298
    if-eqz p1, :L7
    invoke-virtual { p1, v2, v3 }, Lcom/innioasis/y1/service/PlayerService;->setMusicPlaylist(Ljava/util/List;I)V
  :L7
  .line 299
    new-instance p1, Landroid/content/Intent;
    const-class v1, Lcom/innioasis/music/MusicPlayerActivity;
    invoke-direct { p1, p0, v1 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L8
  .line 302
    goto :L10
  :L9
  .line 300
    move-exception p0
  :L10
  .line 303
    return v0
.end method

.method public static skipMark(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 101
    if-eqz p1, :L7
    instance-of p1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez p1, :L0
    goto :L7
  :L0
  .line 103
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 104
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p1
  .line 105
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 106
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 107
    add-int/lit8 p1, p1, 1
  :L2
  .line 108
    if-ge p1, v0, :L3
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Folders;->markAt(Ljava/lang/Object;I)Z
    move-result v1
    if-eqz v1, :L3
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 109
    if-ge p1, v0, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  :L4
  .line 111
    goto :L6
  :L5
  .line 110
    move-exception p0
  :L6
  .line 112
    return-void
  :L7
  .line 101
    return-void
.end method

.method private static songsUnder(Ljava/io/File;)Ljava/util/List;
  .registers 13
  .line 237
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 238
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 239
    if-nez v1, :L0
    return-object v0
  :L0
  .line 240
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 241
    if-nez p0, :L1
    return-object v0
  :L1
  .line 242
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
  .line 243
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 244
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v4
    new-array v4, v4, [Ljava/lang/String;
  .line 245
    nop
  .line 246
    const/4 v5, 0
    const/4 v6, 0
    const/4 v7, 0
  :L3
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v8
    if-ge v6, v8, :L7
  .line 247
    invoke-interface { v1, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
  .line 248
    if-nez v8, :L4
    const/4 v8, 0
    goto :L5
  :L4
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
  :L5
  .line 249
    if-eqz v8, :L6
    invoke-virtual { v8, p0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v9
    if-eqz v9, :L6
    add-int/lit8 v9, v7, 1
    aput-object v8, v4, v7
    move v7, v9
  :L6
  .line 246
    add-int/lit8 v6, v6, 1
    goto :L3
  :L7
  .line 251
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v8
  .line 252
    invoke-static { v4, v5, v7 }, Ljava/util/Arrays;->sort([Ljava/lang/Object;II)V
  .line 253
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v10
  .line 254
    invoke-virtual { v0, v7 }, Ljava/util/ArrayList;->ensureCapacity(I)V
  .line 255
    nop
  :L8
    if-ge v5, v7, :L9
    new-instance p0, Ljava/io/File;
    aget-object v1, v4, v5
    invoke-direct { p0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v5, v5, 1
    goto :L8
  :L9
  .line 256
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "songsUnder "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v7 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " songs, filter "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sub-long v2, v8, v2
    invoke-virtual { p0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " ms, sort "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sub-long v1, v10, v8
    invoke-virtual { p0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " ms, files "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 257
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sub-long/2addr v1, v10
    invoke-virtual { p0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " ms"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  .line 256
    const-string v1, "ipplab"
    invoke-static { v1, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 258
    return-object v0
.end method

.method public static sortAsc(Ljava/io/File;)Z
  .registers 2
  .line 465
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->pathOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->sortValue(Ljava/lang/String;)I
    move-result p0
  .line 466
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
  .line 459
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->pathOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->sortValue(Ljava/lang/String;)I
    move-result p0
  .line 460
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
  .registers 10
  .line 475
    if-eqz p0, :L5
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L5
  :L1
  .line 476
    const/4 v3, 1
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->sortByName(Ljava/io/File;)Z
    move-result v4
    invoke-static { p1 }, Lcom/innioasis/ipp/Folders;->sortAsc(Ljava/io/File;)Z
    move-result v5
    const/4 v6, 0
    const/4 v7, 0
    move-object v2, p0
    invoke-static/range { v2 .. v7 }, Lcom/innioasis/ipp/Folders;->order(Ljava/util/List;ZZZZZ)V
  :L2
  .line 478
    goto :L4
  :L3
  .line 477
    move-exception p0
  :L4
  .line 479
    return-void
  :L5
  .line 475
    return-void
.end method

.method public static sortMenu(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 631
    if-nez p0, :L0
    return-void
  :L0
  .line 632
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 633
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 634
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 635
    const v1, 2131820969
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 636
    const v1, 2131820970
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 638
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Folders$SortPick;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/Folders$SortPick;-><init>(Landroid/app/Activity;)V
    const v3, 2131886360
    invoke-direct { v1, p0, v0, v2, v3 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L1
  .line 640
    goto :L3
  :L2
  .line 639
    move-exception p0
  :L3
  .line 641
    return-void
.end method

.method private static sortValue(Ljava/lang/String;)I
  .registers 2
  .line 450
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
  .registers 9
  .line 545
    if-eqz p0, :L15
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L15
  :L1
  .line 546
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getVideoSort()I
    move-result v0
  .line 547
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v1
    const/4 v2, 0
    const/4 v3, 1
    if-eq v0, v1, :L3
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  .line 548
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v1
    if-ne v0, v1, :L2
    goto :L3
  :L2
    const/4 v4, 0
    goto :L4
  :L3
    const/4 v4, 1
  :L4
  .line 549
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->A_Z:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v1
    if-eq v0, v1, :L6
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->CreateTime_Asc:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
  .line 550
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v1
    if-ne v0, v1, :L5
    goto :L6
  :L5
    const/4 v5, 0
    goto :L7
  :L6
    const/4 v5, 1
  :L7
  .line 552
    sget-object v1, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->None:Lcom/innioasis/y1/database/Y1Repository$SortVideoType;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Y1Repository$SortVideoType;->getType()I
    move-result v1
    if-ne v0, v1, :L8
    const/4 v0, 1
    goto :L9
  :L8
    const/4 v0, 0
  :L9
  .line 553
    if-nez v0, :L10
    const/4 v1, 1
    goto :L11
  :L10
    const/4 v1, 0
  :L11
    const/4 v6, 1
    const/4 v7, 0
    move-object v0, p0
    move v2, v4
    move v3, v5
    move v4, v6
    move v5, v7
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Folders;->order(Ljava/util/List;ZZZZZ)V
  :L12
  .line 555
    goto :L14
  :L13
  .line 554
    move-exception p0
  :L14
  .line 556
    return-void
  :L15
  .line 545
    return-void
.end method

.method public static startRow(Ljava/lang/Object;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 222
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L0
    return-void
  :L0
  .line 224
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 225
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    return-void
  :L1
  .line 226
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v0
  .line 227
    instance-of v1, v0, Ljava/io/File;
    if-eqz v1, :L2
    check-cast v0, Ljava/io/File;
    invoke-static { v0 }, Lcom/innioasis/ipp/Folders;->isAnyMark(Ljava/io/File;)Z
    move-result v0
    if-eqz v0, :L2
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  :L2
  .line 229
    goto :L4
  :L3
  .line 228
    move-exception p0
  :L4
  .line 230
    return-void
.end method

.method public static title(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 308
    invoke-static { p0 }, Lcom/innioasis/ipp/Folders;->allMode(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :L4
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-nez v0, :L0
    goto :L4
  :L0
  .line 310
    move-object v0, p0
    check-cast v0, Lcom/innioasis/y1/base/BaseActivity;
    const v1, 2131821049
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/base/BaseActivity;->setStateBarLeftText(Ljava/lang/String;)V
  :L1
  .line 312
    goto :L3
  :L2
  .line 311
    move-exception p0
  :L3
  .line 313
    return-void
  :L4
  .line 308
    return-void
.end method

.method public static videoFolder(Landroid/widget/ImageView;)V
  .registers 3
  .line 403
    if-nez p0, :L0
    return-void
  :L0
  .line 404
    const v0, 2131624020
    invoke-virtual { p0, v0 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 405
    const v1, 2131362556
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    invoke-virtual { p0, v1, v0 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 406
    return-void
.end method

.method public static videoIcon(Lcom/innioasis/y1/databinding/ItemVideoBinding;)V
  .registers 5
  .line 413
    if-nez p0, :L0
    return-void
  :L0
  .line 414
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ItemVideoBinding;->fileImg:Landroid/widget/ImageView;
  .line 415
    if-nez v0, :L1
    return-void
  :L1
  .line 416
    const v1, 2131362556
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v2
    instance-of v2, v2, Ljava/lang/Integer;
  .line 417
    const/4 v3, 0
    invoke-virtual { v0, v1, v3 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 418
    if-eqz v2, :L4
  .line 419
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
  .line 420
    const p0, 1067869798
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Folders;->scale(Landroid/widget/ImageView;F)V
    goto :L5
  :L4
  .line 422
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 423
    const/high16 p0, 0x3F800000
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Folders;->scale(Landroid/widget/ImageView;F)V
  :L5
  .line 425
    return-void
.end method

.method public static videoSortMenu(Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 572
    if-nez p0, :L0
    return-void
  :L0
  .line 573
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 574
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 575
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 576
    const v1, 2131820969
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 577
    const v1, 2131820970
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 578
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Folders$VideoSortPick;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/Folders$VideoSortPick;-><init>(Landroid/app/Activity;)V
    const v3, 2131886360
    invoke-direct { v1, p0, v0, v2, v3 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L1
  .line 580
    goto :L3
  :L2
  .line 579
    move-exception p0
  :L3
  .line 581
    return-void
.end method

.class public final Lcom/innioasis/ipp/Audiobooks;
.super Ljava/lang/Object;
.source "Audiobooks.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Audiobooks$SongSort;,
    Lcom/innioasis/ipp/Audiobooks$NameSort;,
    Lcom/innioasis/ipp/Audiobooks$SortPick;
  }
.end annotation

.field public final static KEY_ALBUMS:Ljava/lang/String; = "ab_album_sort"

.field public final static KEY_ARTISTS:Ljava/lang/String; = "ab_artist_sort"

.field public final static KEY_SONGS:Ljava/lang/String; = "ab_song_sort"

.field private final static SORT_A_Z:I = 0

.field private final static SORT_NEW:I = 3

.field private final static SORT_OLD:I = 2

.field private final static SORT_Z_A:I = 1

.method private constructor <init>()V
  .registers 1
  .line 31
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;)Ljava/lang/String;
  .registers 1
  .line 29
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->keyFor(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$100(Landroid/app/Activity;)V
  .registers 1
  .line 29
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->resort(Landroid/app/Activity;)V
    return-void
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 29
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->pinyin(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static asc(I)Z
  .registers 2
  .line 58
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

.method private static byName(I)Z
  .registers 2
  .line 56
    const/4 v0, 1
    if-eqz p0, :L1
    if-ne p0, v0, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static entry(Landroid/app/Activity;)I
  .registers 1
  .line 84
    instance-of p0, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-eqz p0, :L0
  .line 85
    const p0, 2131820963
    goto :L1
  :L0
  .line 86
    const p0, 2131820961
  :L1
  .line 84
    return p0
.end method

.method private static keyFor(Landroid/app/Activity;)Ljava/lang/String;
  .registers 2
  .line 46
    instance-of v0, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-eqz v0, :L0
    const-string p0, "ab_song_sort"
    return-object p0
  :L0
  .line 47
    nop
  .line 48
    if-eqz p0, :L1
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v0
    if-eqz v0, :L1
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v0, "title"
    invoke-virtual { p0, v0 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    goto :L2
  :L1
  .line 49
    const/4 p0, 0
  :L2
    const-string v0, "album"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L3
    const-string p0, "ab_album_sort"
    goto :L4
  :L3
    const-string p0, "ab_artist_sort"
  :L4
    return-object p0
.end method

.method public static menu(Ljava/util/List;Landroid/app/Activity;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 92
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 93
    invoke-static { p1 }, Lcom/innioasis/ipp/Audiobooks;->entry(Landroid/app/Activity;)I
    move-result v0
    invoke-virtual { p1, v0 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    const/4 v0, 0
    invoke-interface { p0, v0, p1 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L1
  .line 95
    goto :L3
  :L2
  .line 94
    move-exception p0
  :L3
  .line 96
    return-void
  :L4
  .line 92
    return-void
.end method

.method public static pick(Landroid/app/Activity;Lcom/innioasis/music/adapter/SubmenuAdapter$Item;I)I
  .catchall { :L0 .. :L2 } :L4
  .registers 4
  .line 104
    if-nez p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 105
    if-eqz p1, :L3
    if-eqz p0, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->entry(Landroid/app/Activity;)I
    move-result v0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L3
  .line 106
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->sortMenu(Landroid/app/Activity;)V
  :L2
  .line 107
    const/4 p0, -1
    return p0
  :L3
  .line 110
    goto :L5
  :L4
  .line 109
    move-exception p0
  :L5
  .line 111
    if-lez p2, :L6
    add-int/lit8 p2, p2, -1
  :L6
    return p2
.end method

.method private static pinyin(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  .line 172
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 174
    invoke-static { }, Lcom/innioasis/y1/utils/HanziToPinyin;->getInstance()Lcom/innioasis/y1/utils/HanziToPinyin;
    move-result-object v0
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L1
  .line 175
    if-eqz v0, :L2
    return-object v0
  :L2
  .line 177
    goto :L4
  :L3
  .line 176
    move-exception v0
  :L4
  .line 178
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static resort(Landroid/app/Activity;)V
  .registers 6
  .line 155
    const v0, 2131362181
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 156
    if-nez v0, :L0
    const/4 v1, 0
    goto :L1
  :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v1
  :L1
  .line 157
    if-nez v1, :L2
    return-void
  :L2
  .line 158
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v2
  .line 159
    if-eqz v2, :L7
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    const/4 v4, 2
    if-ge v3, v4, :L3
    goto :L7
  :L3
  .line 160
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 161
    instance-of v2, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-eqz v2, :L4
    invoke-static { v3 }, Lcom/innioasis/ipp/Audiobooks;->sortSongs(Ljava/util/List;)V
    goto :L5
  :L4
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Audiobooks;->sortNames(Landroid/app/Activity;Ljava/util/List;)V
  :L5
  .line 162
    invoke-virtual { v1, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setItems(Ljava/util/List;)V
  .line 163
    const/4 p0, 0
    invoke-virtual { v1, p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 164
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Lv;->select(Landroid/view/View;I)V
  .line 165
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  .line 166
    if-eqz p0, :L6
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L6
    invoke-interface { p0 }, Ljava/util/List;->clear()V
  :L6
  .line 167
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 168
    return-void
  :L7
  .line 159
    return-void
.end method

.method private static sortMenu(Landroid/app/Activity;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 116
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 117
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 118
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 119
    instance-of v1, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-eqz v1, :L1
  .line 120
    const v1, 2131820969
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 121
    const v1, 2131820970
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 124
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Audiobooks$SortPick;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/Audiobooks$SortPick;-><init>(Landroid/app/Activity;)V
    const v3, 2131886360
    invoke-direct { v1, p0, v0, v2, v3 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L2
  .line 126
    goto :L4
  :L3
  .line 125
    move-exception p0
  :L4
  .line 127
    return-void
.end method

.method public static sortNames(Landroid/app/Activity;Ljava/util/List;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 76
    if-eqz p1, :L7
  :L0
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L7
  :L1
  .line 77
    new-instance v0, Lcom/innioasis/ipp/Audiobooks$NameSort;
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->keyFor(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->value(Ljava/lang/String;)I
    move-result p0
    const/4 v1, 1
    if-ne p0, v1, :L2
    goto :L3
  :L2
    const/4 v1, 0
  :L3
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Audiobooks$NameSort;-><init>(Z)V
    invoke-static { p1, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L4
  .line 79
    goto :L6
  :L5
  .line 78
    move-exception p0
  :L6
  .line 80
    return-void
  :L7
  .line 76
    return-void
.end method

.method public static sortSongs(Ljava/util/List;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 66
    if-eqz p0, :L5
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L5
  :L1
  .line 67
    const-string v0, "ab_song_sort"
    invoke-static { v0 }, Lcom/innioasis/ipp/Audiobooks;->value(Ljava/lang/String;)I
    move-result v0
  .line 68
    new-instance v1, Lcom/innioasis/ipp/Audiobooks$SongSort;
    invoke-static { v0 }, Lcom/innioasis/ipp/Audiobooks;->byName(I)Z
    move-result v2
    invoke-static { v0 }, Lcom/innioasis/ipp/Audiobooks;->asc(I)Z
    move-result v0
    invoke-direct { v1, v2, v0 }, Lcom/innioasis/ipp/Audiobooks$SongSort;-><init>(ZZ)V
    invoke-static { p0, v1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L2
  .line 70
    goto :L4
  :L3
  .line 69
    move-exception p0
  :L4
  .line 71
    return-void
  :L5
  .line 66
    return-void
.end method

.method private static value(Ljava/lang/String;)I
  .registers 2
  .line 53
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

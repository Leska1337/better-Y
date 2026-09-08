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
  .line 46
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;)Ljava/lang/String;
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->keyFor(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$100(Landroid/app/Activity;)V
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->resort(Landroid/app/Activity;)V
    return-void
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 44
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->pinyin(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static asc(I)Z
  .registers 2
  .line 84
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
  .line 82
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
  .line 124
    instance-of p0, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-eqz p0, :L0
  .line 125
    const p0, 2131820963
    goto :L1
  :L0
  .line 126
    const p0, 2131820961
  :L1
  .line 124
    return p0
.end method

.method private static keyFor(Landroid/app/Activity;)Ljava/lang/String;
  .registers 2
  .line 71
    instance-of v0, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-eqz v0, :L0
    const-string p0, "ab_song_sort"
    return-object p0
  :L0
  .line 72
    nop
  .line 73
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
  .line 74
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
  .line 132
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 133
    invoke-static { p1 }, Lcom/innioasis/ipp/Audiobooks;->entry(Landroid/app/Activity;)I
    move-result v0
    invoke-virtual { p1, v0 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    const/4 v0, 0
    invoke-interface { p0, v0, p1 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L1
  .line 136
    goto :L3
  :L2
  .line 134
    move-exception p0
  :L3
  .line 137
    return-void
  :L4
  .line 132
    return-void
.end method

.method public static pick(Landroid/app/Activity;Lcom/innioasis/music/adapter/SubmenuAdapter$Item;I)I
  .catchall { :L0 .. :L2 } :L4
  .registers 4
  .line 149
    if-nez p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/SubmenuAdapter$Item;->getString()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 150
    if-eqz p1, :L3
    if-eqz p0, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->entry(Landroid/app/Activity;)I
    move-result v0
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L3
  .line 151
    invoke-static { p0 }, Lcom/innioasis/ipp/Audiobooks;->sortMenu(Landroid/app/Activity;)V
  :L2
  .line 152
    const/4 p0, -1
    return p0
  :L3
  .line 156
    goto :L5
  :L4
  .line 154
    move-exception p0
  :L5
  .line 157
    if-lez p2, :L6
    add-int/lit8 p2, p2, -1
  :L6
    return p2
.end method

.method private static pinyin(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  .line 242
    if-nez p0, :L0
    const-string p0, ""
    return-object p0
  :L0
  .line 244
    invoke-static { }, Lcom/innioasis/y1/utils/HanziToPinyin;->getInstance()Lcom/innioasis/y1/utils/HanziToPinyin;
    move-result-object v0
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L1
  .line 245
    if-eqz v0, :L2
    return-object v0
  :L2
  .line 248
    goto :L4
  :L3
  .line 246
    move-exception v0
  :L4
  .line 249
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static resort(Landroid/app/Activity;)V
  .registers 6
  .line 215
    const v0, 2131362181
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 216
    instance-of v1, v0, Landroid/widget/ListView;
    if-nez v1, :L0
    return-void
  :L0
  .line 217
    check-cast v0, Landroid/widget/ListView;
  .line 218
    invoke-virtual { v0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v1
  .line 219
    instance-of v2, v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v2, :L1
    return-void
  :L1
  .line 220
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 221
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItemList()Ljava/util/List;
    move-result-object v2
  .line 222
    if-eqz v2, :L6
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
    const/4 v4, 2
    if-ge v3, v4, :L2
    goto :L6
  :L2
  .line 223
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 224
    instance-of v2, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-eqz v2, :L3
    invoke-static { v3 }, Lcom/innioasis/ipp/Audiobooks;->sortSongs(Ljava/util/List;)V
    goto :L4
  :L3
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Audiobooks;->sortNames(Landroid/app/Activity;Ljava/util/List;)V
  :L4
  .line 225
    invoke-virtual { v1, v3 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setItems(Ljava/util/List;)V
  .line 226
    const/4 p0, 0
    invoke-virtual { v1, p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 227
    invoke-virtual { v0, p0 }, Landroid/widget/ListView;->setSelection(I)V
  .line 228
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object p0
  .line 229
    if-eqz p0, :L5
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L5
    invoke-interface { p0 }, Ljava/util/List;->clear()V
  :L5
  .line 230
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 231
    return-void
  :L6
  .line 222
    return-void
.end method

.method private static sortMenu(Landroid/app/Activity;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  :L0
  .line 163
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 164
    const v1, 2131820965
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 165
    const v1, 2131820971
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 166
    instance-of v1, p0, Lcom/innioasis/y1/activity/AllAudiobooksActivity;
    if-eqz v1, :L1
  .line 168
    const v1, 2131820969
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 169
    const v1, 2131820970
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 172
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/Audiobooks$SortPick;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/Audiobooks$SortPick;-><init>(Landroid/app/Activity;)V
    const v3, 2131886360
    invoke-direct { v1, p0, v0, v2, v3 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L2
  .line 175
    goto :L4
  :L3
  .line 173
    move-exception p0
  :L4
  .line 176
    return-void
.end method

.method public static sortNames(Landroid/app/Activity;Ljava/util/List;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 108
    if-eqz p1, :L7
  :L0
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L7
  :L1
  .line 109
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
  .line 112
    goto :L6
  :L5
  .line 110
    move-exception p0
  :L6
  .line 113
    return-void
  :L7
  .line 108
    return-void
.end method

.method public static sortSongs(Ljava/util/List;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 97
    if-eqz p0, :L5
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L1
    goto :L5
  :L1
  .line 98
    const-string v0, "ab_song_sort"
    invoke-static { v0 }, Lcom/innioasis/ipp/Audiobooks;->value(Ljava/lang/String;)I
    move-result v0
  .line 99
    new-instance v1, Lcom/innioasis/ipp/Audiobooks$SongSort;
    invoke-static { v0 }, Lcom/innioasis/ipp/Audiobooks;->byName(I)Z
    move-result v2
    invoke-static { v0 }, Lcom/innioasis/ipp/Audiobooks;->asc(I)Z
    move-result v0
    invoke-direct { v1, v2, v0 }, Lcom/innioasis/ipp/Audiobooks$SongSort;-><init>(ZZ)V
    invoke-static { p0, v1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L2
  .line 102
    goto :L4
  :L3
  .line 100
    move-exception p0
  :L4
  .line 103
    return-void
  :L5
  .line 97
    return-void
.end method

.method private static value(Ljava/lang/String;)I
  .registers 2
  .line 78
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

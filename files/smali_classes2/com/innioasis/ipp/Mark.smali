.class public final Lcom/innioasis/ipp/Mark;
.super Ljava/lang/Object;
.source "Mark.java"

.field private final static MARK_ROW_DIP:I = 60

.field private static genreObj:Lcom/innioasis/music/data/Genre;

.field private static pendingGenre:Ljava/lang/String;

.method private constructor <init>()V
  .registers 1
  .line 39
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static afterFill(Ljava/lang/Object;)V
  .registers 2
  .line 168
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Mark;->afterFill(Ljava/lang/Object;Landroid/widget/ListView;)V
  .line 169
    return-void
.end method

.method public static afterFill(Ljava/lang/Object;Landroid/widget/ListView;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  :L0
  .line 177
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L1
    return-void
  :L1
  .line 178
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 179
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    if-nez v0, :L5
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L2
    goto :L5
  :L2
  .line 180
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v1
    if-nez v1, :L3
    return-void
  :L3
  .line 181
    const/4 v1, 1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 182
    if-eqz p1, :L4
    invoke-virtual { p1, v0 }, Landroid/widget/ListView;->setSelection(I)V
  :L4
  .line 184
    goto :L7
  :L5
  .line 179
    return-void
  :L6
  .line 183
    move-exception p0
  :L7
  .line 185
    return-void
.end method

.method public static allAlbumsLabel()Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  :L0
  .line 293
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 294
    if-eqz v0, :L2
    const v1, 2131821092
    invoke-virtual { v0, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
  :L1
    return-object v0
  :L2
  .line 296
    goto :L4
  :L3
  .line 295
    move-exception v0
  :L4
  .line 297
    const-string v0, "Show all albums"
    return-object v0
.end method

.method public static artistAlbums(Lcom/innioasis/music/GenresActivity;Ljava/lang/String;)Z
  .catchall { :L0 .. :L12 } :L14
  .registers 11
  .line 77
    const/4 v0, 0
    if-eqz p0, :L15
    if-eqz p1, :L15
  :L0
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    goto/16 :L15
  :L1
  .line 78
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 80
    sget-object v3, Lcom/innioasis/ipp/Mark;->genreObj:Lcom/innioasis/music/data/Genre;
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/Artists;->forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v3
  .line 81
    const-string v4, "genre artist songs"
    invoke-static { v4, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 82
    if-eqz v3, :L13
    invoke-interface { v3 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-eqz v4, :L2
    goto/16 :L13
  :L2
  .line 84
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct { v4 }, Ljava/util/ArrayList;-><init>()V
  .line 85
    new-instance v5, Ljava/util/LinkedHashSet;
    invoke-direct { v5 }, Ljava/util/LinkedHashSet;-><init>()V
  .line 86
    const/4 v6, 0
  :L3
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v7
    if-ge v6, v7, :L6
  .line 87
    invoke-interface { v3, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
  .line 88
    instance-of v8, v7, Lcom/innioasis/y1/database/Song;
    if-nez v8, :L4
    goto :L5
  :L4
  .line 89
    check-cast v7, Lcom/innioasis/y1/database/Song;
  .line 90
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v8, v7 }, Lcom/innioasis/ipp/Albums;->albumKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
  .line 91
    invoke-virtual { v5, v7 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :L5
    invoke-virtual { v4, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 86
    add-int/lit8 v6, v6, 1
    goto :L3
  :L6
  .line 93
    invoke-virtual { v4 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v3
    if-eqz v3, :L7
    return v0
  :L7
  .line 95
    invoke-static { v4, p0 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;Lcom/innioasis/music/GenresActivity;)V
  .line 96
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->artistMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v4, v0, v3 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 98
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/GenresActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 99
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/GenresActivity;->showOrHideNone(I)V
  .line 101
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter3_1()Lcom/innioasis/music/adapter/AlbumListAdapter;
    move-result-object p1
  .line 102
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/AlbumListAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v3
  .line 103
    if-eqz v3, :L8
    invoke-interface { v3 }, Ljava/util/List;->clear()V
  :L8
  .line 104
    invoke-virtual { p1, v4 }, Lcom/innioasis/music/adapter/AlbumListAdapter;->setAlbums(Ljava/util/List;)V
  .line 106
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
  .line 107
    instance-of v3, p0, Lcom/innioasis/y1/databinding/ActivityGenresBinding;
    if-eqz v3, :L9
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityGenresBinding;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityGenresBinding;->lv:Landroid/widget/ListView;
    goto :L10
  :L9
    const/4 p0, 0
  :L10
  .line 108
    if-nez p0, :L11
    return v0
  :L11
  .line 109
    sget-object v3, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v3, p0, p1, v0 }, Lcom/innioasis/music/util/Other;->gotoAdapter(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 110
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Mark;->afterFill(Ljava/lang/Object;Landroid/widget/ListView;)V
  .line 111
    const-string p0, "genre artist albums"
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  :L12
  .line 112
    const/4 p0, 1
    return p0
  :L13
  .line 82
    return v0
  :L14
  .line 113
    move-exception p0
  .line 114
    return v0
  :L15
  .line 77
    return v0
.end method

.method public static blocked(Ljava/lang/Object;I)Z
  .registers 3
  .line 139
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mark;->isGenreAllAlbums(Ljava/lang/Object;I)Z
    move-result v0
    if-nez v0, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mark;->isAllSongsRow(Ljava/lang/Object;I)Z
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

.method public static blockedList(Landroid/widget/ListView;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 145
    const/4 v0, 0
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object p0
  :L1
  .line 146
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L2
    return v0
  :L2
  .line 147
    move-object v1, p0
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result p0
  :L3
    return p0
  :L4
  .line 148
    move-exception p0
  .line 149
    return v0
.end method

.method public static dropMarks(Ljava/lang/Object;Ljava/util/List;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  .line 156
    if-eqz p1, :L8
  :L0
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L1
    goto :L8
  :L1
  .line 157
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L2
    if-ltz v0, :L5
  .line 158
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 159
    instance-of v2, v1, Ljava/lang/Integer;
    if-nez v2, :L3
    goto :L4
  :L3
  .line 160
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v1
    if-eqz v1, :L4
    invoke-interface { p1, v0 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  :L4
  .line 157
    add-int/lit8 v0, v0, -1
    goto :L2
  :L5
  .line 163
    goto :L7
  :L6
  .line 162
    move-exception p0
  :L7
  .line 164
    return-void
  :L8
  .line 156
    return-void
.end method

.method public static genreAlbums(Ljava/util/List;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  :L0
  .line 124
    sget-object v0, Lcom/innioasis/ipp/Mark;->pendingGenre:Ljava/lang/String;
  .line 125
    if-eqz v0, :L4
    if-eqz p0, :L4
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L4
  :L1
  .line 126
    const/4 v1, 0
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 127
    instance-of v3, v2, Ljava/lang/String;
    if-eqz v3, :L2
    check-cast v2, Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L2
    return-void
  :L2
  .line 128
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->genreMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-interface { p0, v1, v0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L3
  .line 130
    goto :L6
  :L4
  .line 125
    return-void
  :L5
  .line 129
    move-exception p0
  :L6
  .line 131
    return-void
.end method

.method private static isAllAlbumsLabel(Ljava/lang/Object;Landroid/widget/TextView;)Z
  .registers 4
  .line 235
    const/4 v0, 0
    if-eqz p1, :L3
    instance-of v1, p0, Lcom/innioasis/music/adapter/MainAdapter;
    if-nez v1, :L0
    goto :L3
  :L0
  .line 236
    check-cast p0, Lcom/innioasis/music/adapter/MainAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MainAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 237
    instance-of p0, p0, Lcom/innioasis/music/GenresActivity;
    if-nez p0, :L1
    return v0
  :L1
  .line 238
    invoke-virtual { p1 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object p0
  .line 239
    if-eqz p0, :L2
    invoke-static { }, Lcom/innioasis/ipp/Mark;->allAlbumsLabel()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p1, p0 }, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z
    move-result p0
    if-eqz p0, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 235
    return v0
.end method

.method public static isAllSongsRow(Ljava/lang/Object;I)Z
  .catchall { :L0 .. :L3 } :L6
  .registers 4
  .line 50
    const/4 v0, 0
    if-ltz p1, :L7
  :L0
    instance-of v1, p0, Lcom/innioasis/music/adapter/AlbumListAdapter;
    if-nez v1, :L1
    goto :L7
  :L1
  .line 51
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 52
    instance-of p1, p0, Lcom/innioasis/music/data/Album;
    if-nez p1, :L2
    return v0
  :L2
  .line 53
    check-cast p0, Lcom/innioasis/music/data/Album;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
  .line 54
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result p1
    if-nez p1, :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result p0
  :L3
    if-eqz p0, :L5
  :L4
    const/4 v0, 1
  :L5
    return v0
  :L6
  .line 55
    move-exception p0
  .line 56
    return v0
  :L7
  .line 50
    return v0
.end method

.method public static isGenreAllAlbums(Ljava/lang/Object;I)Z
  .registers 2
  .line 43
    if-nez p1, :L1
    instance-of p1, p0, Lcom/innioasis/music/adapter/MainAdapter;
    if-nez p1, :L0
    goto :L1
  :L0
  .line 44
    check-cast p0, Lcom/innioasis/music/adapter/MainAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MainAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 45
    instance-of p0, p0, Lcom/innioasis/music/GenresActivity;
    return p0
  :L1
  .line 43
    const/4 p0, 0
    return p0
.end method

.method private static labelTop(Landroid/widget/TextView;Z)V
  .catchall { :L0 .. :L10 } :L11
  .registers 5
  .line 248
    if-nez p0, :L0
    return-void
  :L0
  .line 252
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131165518
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    move-result v0
  .line 253
    if-eqz p1, :L1
    move v1, v0
    goto :L2
  :L1
    add-int/lit8 v1, v0, 1
  :L2
  .line 254
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingTop()I
    move-result v2
    if-eq v2, v1, :L5
  .line 255
    if-eqz p1, :L3
    move v2, v0
    goto :L4
  :L3
    add-int/lit8 v2, v0, -1
  :L4
    invoke-virtual { p0, v0, v1, v0, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  :L5
  .line 258
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 259
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;
    if-nez v1, :L6
    return-void
  :L6
  .line 260
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;
  .line 261
    if-eqz p1, :L7
    const/16 p1, 48
    goto :L8
  :L7
    const/16 p1, 16
  :L8
  .line 262
    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
    if-ne v1, p1, :L9
    return-void
  :L9
  .line 263
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
  .line 264
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L10
  .line 266
    goto :L12
  :L11
  .line 265
    move-exception p0
  :L12
  .line 267
    return-void
.end method

.method public static mainRow(Landroid/view/View;Landroid/widget/TextView;Ljava/lang/Object;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 5
  .line 211
    if-nez p0, :L0
    return-void
  :L0
  .line 212
    const v0, 2131362556
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/ImageView;
  .line 213
    if-nez v0, :L2
    return-void
  :L2
  .line 214
    invoke-static { p2, p1 }, Lcom/innioasis/ipp/Mark;->isAllAlbumsLabel(Ljava/lang/Object;Landroid/widget/TextView;)Z
    move-result p2
    if-nez p2, :L4
  .line 215
    invoke-virtual { v0 }, Landroid/widget/ImageView;->getVisibility()I
    move-result p2
    const/16 v1, 8
    if-eq p2, v1, :L3
  .line 216
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 217
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L3
  .line 219
    const p2, 2131165516
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Mark;->rowHeight(Landroid/view/View;I)V
  .line 220
    const/4 p0, 1
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Mark;->labelTop(Landroid/widget/TextView;Z)V
  .line 221
    return-void
  :L4
  .line 224
    const/4 p2, 0
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Mark;->rowHeight(Landroid/view/View;I)V
  .line 225
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Mark;->labelTop(Landroid/widget/TextView;Z)V
  .line 226
    invoke-virtual { v0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 227
    const p0, 2131624018
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 228
    if-eqz p1, :L5
    invoke-virtual { p1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L5
  .line 230
    goto :L7
  :L6
  .line 229
    move-exception p0
  :L7
  .line 231
    return-void
.end method

.method public static noteGenre(Lcom/innioasis/music/data/Genre;)V
  .registers 2
  .line 66
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v0
  :L1
    sput-object v0, Lcom/innioasis/ipp/Mark;->pendingGenre:Ljava/lang/String;
  .line 67
    sput-object p0, Lcom/innioasis/ipp/Mark;->genreObj:Lcom/innioasis/music/data/Genre;
  .line 68
    return-void
.end method

.method private static rowHeight(Landroid/view/View;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 275
    if-eqz p1, :L1
  :L0
  .line 276
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, p1 }, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    move-result p1
    goto :L2
  :L1
  .line 277
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v0, 0x42700000
    mul-float p1, p1, v0
    const/high16 v0, 0x3F000000
    add-float/2addr p1, v0
    float-to-int p1, p1
  :L2
  .line 278
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 279
    if-nez v0, :L3
  .line 280
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;
    const/4 v1, -1
    invoke-direct { v0, v1, p1 }, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 282
    return-void
  :L3
  .line 284
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v1, p1, :L4
    return-void
  :L4
  .line 285
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 286
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L5
  .line 288
    goto :L7
  :L6
  .line 287
    move-exception p0
  :L7
  .line 289
    return-void
.end method

.method public static skip(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 192
    if-eqz p1, :L7
    instance-of p1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez p1, :L0
    goto :L7
  :L0
  .line 194
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 195
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p1
  .line 196
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 197
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 198
    add-int/lit8 p1, p1, 1
  :L2
  .line 199
    if-ge p1, v0, :L3
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v1
    if-eqz v1, :L3
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 200
    if-ge p1, v0, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  :L4
  .line 202
    goto :L6
  :L5
  .line 201
    move-exception p0
  :L6
  .line 203
    return-void
  :L7
  .line 192
    return-void
.end method

.method public static title(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 135
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.class public final Lcom/innioasis/ipp/Mark;
.super Ljava/lang/Object;
.source "Mark.java"

.field private final static MARK_ROW_DIP:I = 60

.field private static genreObj:Lcom/innioasis/music/data/Genre;

.field private static pendingGenre:Ljava/lang/String;

.method private constructor <init>()V
  .registers 1
  .line 35
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static afterFill(Ljava/lang/Object;)V
  .registers 3
  .line 163
    const/4 v0, 0
    move-object v1, v0
    check-cast v1, Landroid/view/View;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Mark;->afterFill(Ljava/lang/Object;Landroid/view/View;)V
  .line 164
    return-void
.end method

.method public static afterFill(Ljava/lang/Object;Landroid/view/View;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  :L0
  .line 172
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L1
    return-void
  :L1
  .line 173
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 174
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    if-nez v0, :L5
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L2
    goto :L5
  :L2
  .line 175
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v1
    if-nez v1, :L3
    return-void
  :L3
  .line 176
    const/4 v1, 1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 177
    if-eqz p1, :L4
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Lv;->select(Landroid/view/View;I)V
  :L4
  .line 179
    goto :L7
  :L5
  .line 174
    return-void
  :L6
  .line 178
    move-exception p0
  :L7
  .line 180
    return-void
.end method

.method public static allAlbumsLabel()Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  :L0
  .line 288
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 289
    if-eqz v0, :L2
    const v1, 2131821092
    invoke-virtual { v0, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
  :L1
    return-object v0
  :L2
  .line 291
    goto :L4
  :L3
  .line 290
    move-exception v0
  :L4
  .line 292
    const-string v0, "Show all albums"
    return-object v0
.end method

.method public static artistAlbums(Lcom/innioasis/music/GenresActivity;Ljava/lang/String;)Z
  .catchall { :L0 .. :L10 } :L12
  .registers 11
  .line 73
    const/4 v0, 0
    if-eqz p0, :L13
    if-eqz p1, :L13
  :L0
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    goto/16 :L13
  :L1
  .line 74
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 76
    sget-object v3, Lcom/innioasis/ipp/Mark;->genreObj:Lcom/innioasis/music/data/Genre;
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/Artists;->forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v3
  .line 77
    const-string v4, "genre artist songs"
    invoke-static { v4, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 78
    if-eqz v3, :L11
    invoke-interface { v3 }, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-eqz v4, :L2
    goto/16 :L11
  :L2
  .line 80
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct { v4 }, Ljava/util/ArrayList;-><init>()V
  .line 81
    new-instance v5, Ljava/util/LinkedHashSet;
    invoke-direct { v5 }, Ljava/util/LinkedHashSet;-><init>()V
  .line 82
    const/4 v6, 0
  :L3
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v7
    if-ge v6, v7, :L6
  .line 83
    invoke-interface { v3, v6 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
  .line 84
    instance-of v8, v7, Lcom/innioasis/y1/database/Song;
    if-nez v8, :L4
    goto :L5
  :L4
  .line 85
    check-cast v7, Lcom/innioasis/y1/database/Song;
  .line 86
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v8, v7 }, Lcom/innioasis/ipp/Albums;->albumKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
  .line 87
    invoke-virtual { v5, v7 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :L5
    invoke-virtual { v4, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 82
    add-int/lit8 v6, v6, 1
    goto :L3
  :L6
  .line 89
    invoke-virtual { v4 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v3
    if-eqz v3, :L7
    return v0
  :L7
  .line 91
    invoke-static { v4, p0 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;Lcom/innioasis/music/GenresActivity;)V
  .line 92
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->artistMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v4, v0, v3 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 94
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/GenresActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 95
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/GenresActivity;->showOrHideNone(I)V
  .line 97
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter3_1()Lcom/innioasis/music/adapter/AlbumListAdapter;
    move-result-object p1
  .line 98
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/AlbumListAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v3
  .line 99
    if-eqz v3, :L8
    invoke-interface { v3 }, Ljava/util/List;->clear()V
  :L8
  .line 100
    invoke-virtual { p1, v4 }, Lcom/innioasis/music/adapter/AlbumListAdapter;->setAlbums(Ljava/util/List;)V
  .line 102
    const v3, 2131362180
    invoke-virtual { p0, v3 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p0
  .line 103
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->is(Landroid/view/View;)Z
    move-result v3
    if-nez v3, :L9
    return v0
  :L9
  .line 104
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Lv;->go(Landroid/view/View;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 105
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Mark;->afterFill(Ljava/lang/Object;Landroid/view/View;)V
  .line 106
    const-string p0, "genre artist albums"
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  :L10
  .line 107
    const/4 p0, 1
    return p0
  :L11
  .line 78
    return v0
  :L12
  .line 108
    move-exception p0
  .line 109
    return v0
  :L13
  .line 73
    return v0
.end method

.method public static blocked(Ljava/lang/Object;I)Z
  .registers 3
  .line 134
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

.method public static blockedList(Landroid/view/View;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 140
    const/4 v0, 0
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Lv;->model(Landroid/view/View;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object p0
  :L1
  .line 141
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L2
    return v0
  :L2
  .line 142
    move-object v1, p0
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result p0
  :L3
    return p0
  :L4
  .line 143
    move-exception p0
  .line 144
    return v0
.end method

.method public static dropMarks(Ljava/lang/Object;Ljava/util/List;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  .line 151
    if-eqz p1, :L8
  :L0
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L1
    goto :L8
  :L1
  .line 152
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L2
    if-ltz v0, :L5
  .line 153
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 154
    instance-of v2, v1, Ljava/lang/Integer;
    if-nez v2, :L3
    goto :L4
  :L3
  .line 155
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v1
    if-eqz v1, :L4
    invoke-interface { p1, v0 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  :L4
  .line 152
    add-int/lit8 v0, v0, -1
    goto :L2
  :L5
  .line 158
    goto :L7
  :L6
  .line 157
    move-exception p0
  :L7
  .line 159
    return-void
  :L8
  .line 151
    return-void
.end method

.method public static genreAlbums(Ljava/util/List;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  :L0
  .line 119
    sget-object v0, Lcom/innioasis/ipp/Mark;->pendingGenre:Ljava/lang/String;
  .line 120
    if-eqz v0, :L4
    if-eqz p0, :L4
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L4
  :L1
  .line 121
    const/4 v1, 0
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 122
    instance-of v3, v2, Ljava/lang/String;
    if-eqz v3, :L2
    check-cast v2, Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L2
    return-void
  :L2
  .line 123
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->genreMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-interface { p0, v1, v0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L3
  .line 125
    goto :L6
  :L4
  .line 120
    return-void
  :L5
  .line 124
    move-exception p0
  :L6
  .line 126
    return-void
.end method

.method private static isAllAlbumsLabel(Ljava/lang/Object;Landroid/widget/TextView;)Z
  .registers 4
  .line 230
    const/4 v0, 0
    if-eqz p1, :L3
    instance-of v1, p0, Lcom/innioasis/music/adapter/MainAdapter;
    if-nez v1, :L0
    goto :L3
  :L0
  .line 231
    check-cast p0, Lcom/innioasis/music/adapter/MainAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MainAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 232
    instance-of p0, p0, Lcom/innioasis/music/GenresActivity;
    if-nez p0, :L1
    return v0
  :L1
  .line 233
    invoke-virtual { p1 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object p0
  .line 234
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
  .line 230
    return v0
.end method

.method public static isAllSongsRow(Ljava/lang/Object;I)Z
  .catchall { :L0 .. :L3 } :L6
  .registers 4
  .line 46
    const/4 v0, 0
    if-ltz p1, :L7
  :L0
    instance-of v1, p0, Lcom/innioasis/music/adapter/AlbumListAdapter;
    if-nez v1, :L1
    goto :L7
  :L1
  .line 47
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 48
    instance-of p1, p0, Lcom/innioasis/music/data/Album;
    if-nez p1, :L2
    return v0
  :L2
  .line 49
    check-cast p0, Lcom/innioasis/music/data/Album;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
  .line 50
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
  .line 51
    move-exception p0
  .line 52
    return v0
  :L7
  .line 46
    return v0
.end method

.method public static isGenreAllAlbums(Ljava/lang/Object;I)Z
  .registers 2
  .line 39
    if-nez p1, :L1
    instance-of p1, p0, Lcom/innioasis/music/adapter/MainAdapter;
    if-nez p1, :L0
    goto :L1
  :L0
  .line 40
    check-cast p0, Lcom/innioasis/music/adapter/MainAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MainAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 41
    instance-of p0, p0, Lcom/innioasis/music/GenresActivity;
    return p0
  :L1
  .line 39
    const/4 p0, 0
    return p0
.end method

.method private static labelTop(Landroid/widget/TextView;Z)V
  .catchall { :L0 .. :L10 } :L11
  .registers 5
  .line 243
    if-nez p0, :L0
    return-void
  :L0
  .line 247
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131165518
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    move-result v0
  .line 248
    if-eqz p1, :L1
    move v1, v0
    goto :L2
  :L1
    add-int/lit8 v1, v0, 1
  :L2
  .line 249
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingTop()I
    move-result v2
    if-eq v2, v1, :L5
  .line 250
    if-eqz p1, :L3
    move v2, v0
    goto :L4
  :L3
    add-int/lit8 v2, v0, -1
  :L4
    invoke-virtual { p0, v0, v1, v0, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  :L5
  .line 253
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 254
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;
    if-nez v1, :L6
    return-void
  :L6
  .line 255
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;
  .line 256
    if-eqz p1, :L7
    const/16 p1, 48
    goto :L8
  :L7
    const/16 p1, 16
  :L8
  .line 257
    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
    if-ne v1, p1, :L9
    return-void
  :L9
  .line 258
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
  .line 259
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L10
  .line 261
    goto :L12
  :L11
  .line 260
    move-exception p0
  :L12
  .line 262
    return-void
.end method

.method public static mainRow(Landroid/view/View;Landroid/widget/TextView;Ljava/lang/Object;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 5
  .line 206
    if-nez p0, :L0
    return-void
  :L0
  .line 207
    const v0, 2131362556
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/ImageView;
  .line 208
    if-nez v0, :L2
    return-void
  :L2
  .line 209
    invoke-static { p2, p1 }, Lcom/innioasis/ipp/Mark;->isAllAlbumsLabel(Ljava/lang/Object;Landroid/widget/TextView;)Z
    move-result p2
    if-nez p2, :L4
  .line 210
    invoke-virtual { v0 }, Landroid/widget/ImageView;->getVisibility()I
    move-result p2
    const/16 v1, 8
    if-eq p2, v1, :L3
  .line 211
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 212
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L3
  .line 214
    const p2, 2131165516
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Mark;->rowHeight(Landroid/view/View;I)V
  .line 215
    const/4 p0, 1
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Mark;->labelTop(Landroid/widget/TextView;Z)V
  .line 216
    return-void
  :L4
  .line 219
    const/4 p2, 0
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Mark;->rowHeight(Landroid/view/View;I)V
  .line 220
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Mark;->labelTop(Landroid/widget/TextView;Z)V
  .line 221
    invoke-virtual { v0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 222
    const p0, 2131624018
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 223
    if-eqz p1, :L5
    invoke-virtual { p1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L5
  .line 225
    goto :L7
  :L6
  .line 224
    move-exception p0
  :L7
  .line 226
    return-void
.end method

.method public static noteGenre(Lcom/innioasis/music/data/Genre;)V
  .registers 2
  .line 62
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v0
  :L1
    sput-object v0, Lcom/innioasis/ipp/Mark;->pendingGenre:Ljava/lang/String;
  .line 63
    sput-object p0, Lcom/innioasis/ipp/Mark;->genreObj:Lcom/innioasis/music/data/Genre;
  .line 64
    return-void
.end method

.method private static rowHeight(Landroid/view/View;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 270
    if-eqz p1, :L1
  :L0
  .line 271
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, p1 }, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    move-result p1
    goto :L2
  :L1
  .line 272
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
  .line 273
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 274
    if-nez v0, :L3
  .line 275
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    const/4 v1, -1
    invoke-direct { v0, v1, p1 }, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 277
    return-void
  :L3
  .line 279
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v1, p1, :L4
    return-void
  :L4
  .line 280
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 281
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L5
  .line 283
    goto :L7
  :L6
  .line 282
    move-exception p0
  :L7
  .line 284
    return-void
.end method

.method public static skip(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 187
    if-eqz p1, :L7
    instance-of p1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez p1, :L0
    goto :L7
  :L0
  .line 189
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 190
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p1
  .line 191
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 192
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 193
    add-int/lit8 p1, p1, 1
  :L2
  .line 194
    if-ge p1, v0, :L3
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v1
    if-eqz v1, :L3
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 195
    if-ge p1, v0, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  :L4
  .line 197
    goto :L6
  :L5
  .line 196
    move-exception p0
  :L6
  .line 198
    return-void
  :L7
  .line 187
    return-void
.end method

.method public static title(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 130
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

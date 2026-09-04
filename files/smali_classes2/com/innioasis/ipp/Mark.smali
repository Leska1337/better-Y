.class public final Lcom/innioasis/ipp/Mark;
.super Ljava/lang/Object;
.source "Mark.java"

.field private final static MARK_ROW_DIP:I = 60

.field private static genreObj:Lcom/innioasis/music/data/Genre;

.field private static pendingGenre:Ljava/lang/String;

.method private constructor <init>()V
  .registers 1
  .line 51
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static afterFill(Ljava/lang/Object;)V
  .registers 2
  .line 233
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Mark;->afterFill(Ljava/lang/Object;Landroid/widget/ListView;)V
  .line 234
    return-void
.end method

.method public static afterFill(Ljava/lang/Object;Landroid/widget/ListView;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  :L0
  .line 244
    instance-of v0, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v0, :L1
    return-void
  :L1
  .line 245
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 246
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v0
    if-nez v0, :L5
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
    const/4 v1, 2
    if-ge v0, v1, :L2
    goto :L5
  :L2
  .line 247
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v1
    if-nez v1, :L3
    return-void
  :L3
  .line 248
    const/4 v1, 1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  .line 249
    if-eqz p1, :L4
    invoke-virtual { p1, v0 }, Landroid/widget/ListView;->setSelection(I)V
  :L4
  .line 252
    goto :L7
  :L5
  .line 246
    return-void
  :L6
  .line 250
    move-exception p0
  :L7
  .line 253
    return-void
.end method

.method public static allAlbumsLabel()Ljava/lang/String;
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  :L0
  .line 387
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 388
    if-eqz v0, :L2
    const v1, 2131821092
    invoke-virtual { v0, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
  :L1
    return-object v0
  :L2
  .line 391
    goto :L4
  :L3
  .line 389
    move-exception v0
  :L4
  .line 392
    const-string v0, "Show all albums"
    return-object v0
.end method

.method public static artistAlbums(Lcom/innioasis/music/GenresActivity;Ljava/lang/String;)Z
  .catchall { :L0 .. :L12 } :L14
  .registers 9
  .line 106
    const/4 v0, 0
    if-eqz p0, :L15
    if-eqz p1, :L15
  :L0
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    goto/16 :L15
  :L1
  .line 111
    sget-object v1, Lcom/innioasis/ipp/Mark;->genreObj:Lcom/innioasis/music/data/Genre;
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Artists;->forMenu(Ljava/lang/String;Lcom/innioasis/music/data/Genre;)Ljava/util/List;
    move-result-object v1
  .line 112
    if-eqz v1, :L13
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L2
    goto/16 :L13
  :L2
  .line 114
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 115
    new-instance v3, Ljava/util/LinkedHashSet;
    invoke-direct { v3 }, Ljava/util/LinkedHashSet;-><init>()V
  .line 116
    const/4 v4, 0
  :L3
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L6
  .line 117
    invoke-interface { v1, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 118
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-nez v6, :L4
    goto :L5
  :L4
  .line 119
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 120
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v6, v5 }, Lcom/innioasis/ipp/Albums;->albumKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
  .line 121
    invoke-virtual { v3, v5 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :L5
    invoke-virtual { v2, v5 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 116
    add-int/lit8 v4, v4, 1
    goto :L3
  :L6
  .line 123
    invoke-virtual { v2 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L7
    return v0
  :L7
  .line 127
    invoke-static { v2, p0 }, Lcom/innioasis/ipp/Genres;->albums(Ljava/util/List;Lcom/innioasis/music/GenresActivity;)V
  .line 128
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->artistMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v2, v0, v1 }, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
  .line 130
    invoke-static { p1 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/GenresActivity;->setStateBarLeftText(Ljava/lang/String;)V
  .line 131
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/GenresActivity;->showOrHideNone(I)V
  .line 133
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getAdapter3_1()Lcom/innioasis/music/adapter/AlbumListAdapter;
    move-result-object p1
  .line 134
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/AlbumListAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 135
    if-eqz v1, :L8
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L8
  .line 136
    invoke-virtual { p1, v2 }, Lcom/innioasis/music/adapter/AlbumListAdapter;->setAlbums(Ljava/util/List;)V
  .line 138
    invoke-virtual { p0 }, Lcom/innioasis/music/GenresActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
  .line 139
    instance-of v1, p0, Lcom/innioasis/y1/databinding/ActivityGenresBinding;
    if-eqz v1, :L9
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityGenresBinding;
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityGenresBinding;->lv:Landroid/widget/ListView;
    goto :L10
  :L9
    const/4 p0, 0
  :L10
  .line 140
    if-nez p0, :L11
    return v0
  :L11
  .line 141
    sget-object v1, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v1, p0, p1, v0 }, Lcom/innioasis/music/util/Other;->gotoAdapter(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;I)V
  .line 142
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Mark;->afterFill(Ljava/lang/Object;Landroid/widget/ListView;)V
  :L12
  .line 143
    const/4 p0, 1
    return p0
  :L13
  .line 112
    return v0
  :L14
  .line 144
    move-exception p0
  .line 145
    return v0
  :L15
  .line 106
    return v0
.end method

.method public static blocked(Ljava/lang/Object;I)Z
  .registers 3
  .line 190
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
  .line 201
    const/4 v0, 0
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object p0
  :L1
  .line 202
    instance-of v1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v1, :L2
    return v0
  :L2
  .line 203
    move-object v1, p0
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result p0
  :L3
    return p0
  :L4
  .line 204
    move-exception p0
  .line 205
    return v0
.end method

.method public static dropMarks(Ljava/lang/Object;Ljava/util/List;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  .line 215
    if-eqz p1, :L8
  :L0
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L1
    goto :L8
  :L1
  .line 216
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
  :L2
    if-ltz v0, :L5
  .line 217
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 218
    instance-of v2, v1, Ljava/lang/Integer;
    if-nez v2, :L3
    goto :L4
  :L3
  .line 219
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v1
    if-eqz v1, :L4
    invoke-interface { p1, v0 }, Ljava/util/List;->remove(I)Ljava/lang/Object;
  :L4
  .line 216
    add-int/lit8 v0, v0, -1
    goto :L2
  :L5
  .line 223
    goto :L7
  :L6
  .line 221
    move-exception p0
  :L7
  .line 224
    return-void
  :L8
  .line 215
    return-void
.end method

.method public static genreAlbums(Ljava/util/List;)V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  :L0
  .line 161
    sget-object v0, Lcom/innioasis/ipp/Mark;->pendingGenre:Ljava/lang/String;
  .line 162
    if-eqz v0, :L4
    if-eqz p0, :L4
    invoke-interface { p0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L4
  :L1
  .line 163
    const/4 v1, 0
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 164
    instance-of v3, v2, Ljava/lang/String;
    if-eqz v3, :L2
    check-cast v2, Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->isGenreAll(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L2
    return-void
  :L2
  .line 165
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->genreMark(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-interface { p0, v1, v0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L3
  .line 168
    goto :L6
  :L4
  .line 162
    return-void
  :L5
  .line 166
    move-exception p0
  :L6
  .line 169
    return-void
.end method

.method private static isAllAlbumsLabel(Ljava/lang/Object;Landroid/widget/TextView;)Z
  .registers 4
  .line 318
    const/4 v0, 0
    if-eqz p1, :L3
    instance-of v1, p0, Lcom/innioasis/music/adapter/MainAdapter;
    if-nez v1, :L0
    goto :L3
  :L0
  .line 319
    check-cast p0, Lcom/innioasis/music/adapter/MainAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MainAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 320
    instance-of p0, p0, Lcom/innioasis/music/GenresActivity;
    if-nez p0, :L1
    return v0
  :L1
  .line 321
    invoke-virtual { p1 }, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object p0
  .line 322
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
  .line 318
    return v0
.end method

.method public static isAllSongsRow(Ljava/lang/Object;I)Z
  .catchall { :L0 .. :L3 } :L6
  .registers 4
  .line 63
    const/4 v0, 0
    if-ltz p1, :L7
  :L0
    instance-of v1, p0, Lcom/innioasis/music/adapter/AlbumListAdapter;
    if-nez v1, :L1
    goto :L7
  :L1
  .line 64
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 65
    instance-of p1, p0, Lcom/innioasis/music/data/Album;
    if-nez p1, :L2
    return v0
  :L2
  .line 66
    check-cast p0, Lcom/innioasis/music/data/Album;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
  .line 67
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
  .line 68
    move-exception p0
  .line 69
    return v0
  :L7
  .line 63
    return v0
.end method

.method public static isGenreAllAlbums(Ljava/lang/Object;I)Z
  .registers 2
  .line 55
    if-nez p1, :L1
    instance-of p1, p0, Lcom/innioasis/music/adapter/MainAdapter;
    if-nez p1, :L0
    goto :L1
  :L0
  .line 56
    check-cast p0, Lcom/innioasis/music/adapter/MainAdapter;
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MainAdapter;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 57
    instance-of p0, p0, Lcom/innioasis/music/GenresActivity;
    return p0
  :L1
  .line 55
    const/4 p0, 0
    return p0
.end method

.method private static labelTop(Landroid/widget/TextView;Z)V
  .catchall { :L0 .. :L10 } :L11
  .registers 5
  .line 334
    if-nez p0, :L0
    return-void
  :L0
  .line 343
    invoke-virtual { p0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    const v1, 2131165518
    invoke-virtual { v0, v1 }, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    move-result v0
  .line 344
    if-eqz p1, :L1
    move v1, v0
    goto :L2
  :L1
    add-int/lit8 v1, v0, 1
  :L2
  .line 345
    invoke-virtual { p0 }, Landroid/widget/TextView;->getPaddingTop()I
    move-result v2
    if-eq v2, v1, :L5
  .line 346
    if-eqz p1, :L3
    move v2, v0
    goto :L4
  :L3
    add-int/lit8 v2, v0, -1
  :L4
    invoke-virtual { p0, v0, v1, v0, v2 }, Landroid/widget/TextView;->setPadding(IIII)V
  :L5
  .line 349
    invoke-virtual { p0 }, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 350
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;
    if-nez v1, :L6
    return-void
  :L6
  .line 351
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;
  .line 352
    if-eqz p1, :L7
    const/16 p1, 48
    goto :L8
  :L7
    const/16 p1, 16
  :L8
  .line 353
    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
    if-ne v1, p1, :L9
    return-void
  :L9
  .line 354
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I
  .line 355
    invoke-virtual { p0, v0 }, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L10
  .line 358
    goto :L12
  :L11
  .line 356
    move-exception p0
  :L12
  .line 359
    return-void
.end method

.method public static mainRow(Landroid/view/View;Landroid/widget/TextView;Ljava/lang/Object;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 5
  .line 286
    if-nez p0, :L0
    return-void
  :L0
  .line 287
    const v0, 2131362556
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/ImageView;
  .line 288
    if-nez v0, :L2
    return-void
  :L2
  .line 289
    invoke-static { p2, p1 }, Lcom/innioasis/ipp/Mark;->isAllAlbumsLabel(Ljava/lang/Object;Landroid/widget/TextView;)Z
    move-result p2
    if-nez p2, :L4
  .line 290
    invoke-virtual { v0 }, Landroid/widget/ImageView;->getVisibility()I
    move-result p2
    const/16 v1, 8
    if-eq p2, v1, :L3
  .line 291
    invoke-static { v0 }, Lcom/innioasis/ipp/Icons;->reset(Landroid/widget/ImageView;)V
  .line 292
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L3
  .line 294
    const p2, 2131165516
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Mark;->rowHeight(Landroid/view/View;I)V
  .line 295
    const/4 p0, 1
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Mark;->labelTop(Landroid/widget/TextView;Z)V
  .line 296
    return-void
  :L4
  .line 301
    const/4 p2, 0
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Mark;->rowHeight(Landroid/view/View;I)V
  .line 302
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Mark;->labelTop(Landroid/widget/TextView;Z)V
  .line 303
    invoke-virtual { v0, p2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 304
    const p0, 2131624018
    invoke-virtual { v0, p0 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 305
    if-eqz p1, :L5
    invoke-virtual { p1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Icons;->menu(Landroid/widget/ImageView;I)V
  :L5
  .line 308
    goto :L7
  :L6
  .line 306
    move-exception p0
  :L7
  .line 309
    return-void
.end method

.method public static noteGenre(Lcom/innioasis/music/data/Genre;)V
  .registers 2
  .line 84
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v0
  :L1
    sput-object v0, Lcom/innioasis/ipp/Mark;->pendingGenre:Ljava/lang/String;
  .line 85
    sput-object p0, Lcom/innioasis/ipp/Mark;->genreObj:Lcom/innioasis/music/data/Genre;
  .line 86
    return-void
.end method

.method private static rowHeight(Landroid/view/View;I)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 367
    if-eqz p1, :L1
  :L0
  .line 368
    invoke-virtual { p0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0, p1 }, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    move-result p1
    goto :L2
  :L1
  .line 369
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
  .line 370
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
  .line 371
    if-nez v0, :L3
  .line 372
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;
    const/4 v1, -1
    invoke-direct { v0, v1, p1 }, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 374
    return-void
  :L3
  .line 376
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v1, p1, :L4
    return-void
  :L4
  .line 377
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 378
    invoke-virtual { p0, v0 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L5
  .line 381
    goto :L7
  :L6
  .line 379
    move-exception p0
  :L7
  .line 382
    return-void
.end method

.method public static skip(Ljava/lang/Object;Z)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 262
    if-eqz p1, :L7
    instance-of p1, p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez p1, :L0
    goto :L7
  :L0
  .line 264
    check-cast p0, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 265
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result p1
  .line 266
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 267
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v0
  .line 268
    add-int/lit8 p1, p1, 1
  :L2
  .line 269
    if-ge p1, v0, :L3
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Mark;->blocked(Ljava/lang/Object;I)Z
    move-result v1
    if-eqz v1, :L3
    add-int/lit8 p1, p1, 1
    goto :L2
  :L3
  .line 270
    if-ge p1, v0, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->setPosition(I)V
  :L4
  .line 273
    goto :L6
  :L5
  .line 271
    move-exception p0
  :L6
  .line 274
    return-void
  :L7
  .line 262
    return-void
.end method

.method public static title(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 185
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->realName(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

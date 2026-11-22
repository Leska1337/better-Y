.class public final Lcom/innioasis/ipp/MainMenu;
.super Ljava/lang/Object;
.source "MainMenu.java"

.field private final static BOOKS:[I

.field private final static BOOK_KEYS:[Ljava/lang/String;

.field public final static DEFAULT_ON:[Ljava/lang/String;

.field public final static KEY_BOOKS:Ljava/lang/String; = "mm_audiobooks"

.field public final static KEY_MUSIC:Ljava/lang/String; = "mm_music"

.field public final static KEY_VIDEOS:Ljava/lang/String; = "mm_videos"

.field private final static MAIN:[I

.field private final static MAIN_KEYS:[Ljava/lang/String;

.field private final static MUSIC:[I

.field private final static MUSIC_KEYS:[Ljava/lang/String;

.field private final static MUSIC_STOCK:[I

.field private final static VIDEOS:[I

.field private final static VIDEO_KEYS:[Ljava/lang/String;

.field private static bookFull:Ljava/util/List;

.field private static bookShown:Ljava/util/List;

.field private static mainFull:Ljava/util/List;

.field private static videoShown:Ljava/util/List;

.method static constructor <clinit>()V
  .registers 14
  .line 29
    const/16 v0, 8
    new-array v1, v0, [I
    fill-array-data v1, :L0
    sput-object v1, Lcom/innioasis/ipp/MainMenu;->MAIN:[I
  .line 33
    new-array v1, v0, [Ljava/lang/String;
    const-string v2, "mm_now"
    const/4 v3, 0
    aput-object v2, v1, v3
    const-string v2, "mm_music"
    const/4 v4, 1
    aput-object v2, v1, v4
    const-string v2, "mm_videos"
    const/4 v5, 2
    aput-object v2, v1, v5
    const-string v2, "mm_audiobooks"
    const/4 v6, 3
    aput-object v2, v1, v6
    const-string v2, "mm_ebook"
    const/4 v7, 4
    aput-object v2, v1, v7
    const-string v2, "mm_photos"
    const/4 v8, 5
    aput-object v2, v1, v8
    const-string v2, "mm_fm"
    const/4 v9, 6
    aput-object v2, v1, v9
    const-string v2, "mm_bluetooth"
    const/4 v10, 7
    aput-object v2, v1, v10
    sput-object v1, Lcom/innioasis/ipp/MainMenu;->MAIN_KEYS:[Ljava/lang/String;
  .line 37
    const/16 v2, 9
    new-array v11, v2, [I
    fill-array-data v11, :L1
    sput-object v11, Lcom/innioasis/ipp/MainMenu;->MUSIC:[I
  .line 42
    new-array v2, v2, [Ljava/lang/String;
    const-string v11, "mm_coverflow"
    aput-object v11, v2, v3
    const-string v11, "mm_songs"
    aput-object v11, v2, v4
    const-string v11, "mm_playlists"
    aput-object v11, v2, v5
    const-string v11, "mm_artists"
    aput-object v11, v2, v6
    const-string v11, "album_artists"
    aput-object v11, v2, v7
    const-string v11, "mm_albums"
    aput-object v11, v2, v8
    const-string v11, "mm_genres"
    aput-object v11, v2, v9
    const-string v9, "mm_folders"
    aput-object v9, v2, v10
    const-string v9, "mm_search"
    aput-object v9, v2, v0
    sput-object v2, Lcom/innioasis/ipp/MainMenu;->MUSIC_KEYS:[Ljava/lang/String;
  .line 47
    new-array v0, v10, [I
    fill-array-data v0, :L2
    sput-object v0, Lcom/innioasis/ipp/MainMenu;->MUSIC_STOCK:[I
  .line 53
    const v0, 2131821003
    const v9, 2131821005
    const v10, 2131821002
    const v11, 2131821004
    filled-new-array { v10, v11, v0, v9 }, [I
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/MainMenu;->VIDEOS:[I
  .line 57
    new-array v0, v7, [Ljava/lang/String;
    const-string v9, "mm_video_all"
    aput-object v9, v0, v3
    const-string v9, "mm_video_playlist"
    aput-object v9, v0, v4
    const-string v9, "mm_video_folders"
    aput-object v9, v0, v5
    const-string v9, "mm_video_search"
    aput-object v9, v0, v6
    sput-object v0, Lcom/innioasis/ipp/MainMenu;->VIDEO_KEYS:[Ljava/lang/String;
  .line 61
    const v9, 2131820842
    const v10, 2131820840
    const v11, 2131820837
    const v12, 2131820839
    const v13, 2131820835
    filled-new-array { v11, v12, v13, v9, v10 }, [I
    move-result-object v9
    sput-object v9, Lcom/innioasis/ipp/MainMenu;->BOOKS:[I
  .line 65
    new-array v8, v8, [Ljava/lang/String;
    const-string v9, "mm_book_all"
    aput-object v9, v8, v3
    const-string v9, "mm_book_artists"
    aput-object v9, v8, v4
    const-string v9, "mm_book_albums"
    aput-object v9, v8, v5
    const-string v9, "mm_book_folders"
    aput-object v9, v8, v6
    const-string v9, "mm_bookmarks"
    aput-object v9, v8, v7
    sput-object v8, Lcom/innioasis/ipp/MainMenu;->BOOK_KEYS:[Ljava/lang/String;
  .line 70
    new-array v7, v7, [[Ljava/lang/String;
    aput-object v1, v7, v3
    aput-object v2, v7, v4
    aput-object v0, v7, v5
    aput-object v8, v7, v6
    invoke-static { v7 }, Lcom/innioasis/ipp/MainMenu;->join([[Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/MainMenu;->DEFAULT_ON:[Ljava/lang/String;
    return-void
  :L0
  .array-data 4
      2131820769
      2131820768
      2131820773
      2131820762
      2131820764
      2131820770
      2131820767
      2131820763
  .end array-data
  :L1
  .array-data 4
      2131821167
      2131820838
      2131820848
      2131820839
      2131821161
      2131820835
      2131820843
      2131820842
      2131820850
  .end array-data
  :L2
  .array-data 4
      2131820838
      2131820848
      2131820839
      2131820835
      2131820843
      2131820842
      2131820850
  .end array-data
.end method

.method private constructor <init>()V
  .registers 1
  .line 78
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static bookPick(I)I
  .catchall { :L0 .. :L2 } :L4
  .registers 3
  :L0
  .line 228
    sget-object v0, Lcom/innioasis/ipp/MainMenu;->bookShown:Ljava/util/List;
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->bookFull:Ljava/util/List;
    if-eqz v1, :L3
    if-ltz p0, :L3
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p0, v0, :L1
    goto :L3
  :L1
  .line 229
    sget-object v0, Lcom/innioasis/ipp/MainMenu;->bookFull:Ljava/util/List;
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->bookShown:Ljava/util/List;
    invoke-interface { v1, p0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->indexOf(Ljava/lang/Object;)I
    move-result p0
  :L2
    return p0
  :L3
  .line 228
    return p0
  :L4
  .line 230
    move-exception v0
  .line 231
    return p0
.end method

.method public static books(Ljava/util/List;Landroid/content/Context;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 216
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/MainMenu;->bookFull:Ljava/util/List;
  .line 217
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->BOOKS:[I
    sget-object v2, Lcom/innioasis/ipp/MainMenu;->BOOK_KEYS:[Ljava/lang/String;
    invoke-static { p1, v0, v1, v2 }, Lcom/innioasis/ipp/MainMenu;->shown(Landroid/content/Context;Ljava/util/List;[I[Ljava/lang/String;)Ljava/util/List;
    move-result-object p1
  .line 218
    invoke-interface { p0 }, Ljava/util/List;->clear()V
  .line 219
    invoke-interface { p0, p1 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 220
    sput-object p0, Lcom/innioasis/ipp/MainMenu;->bookShown:Ljava/util/List;
  :L1
  .line 222
    goto :L3
  :L2
  .line 221
    move-exception p0
  :L3
  .line 223
    return-void
.end method

.method private static indexOf(Landroid/content/Context;Ljava/lang/Object;[I)I
  .registers 6
  .line 108
    const/4 v0, -1
    if-nez p1, :L0
    return v0
  :L0
  .line 109
    const/4 v1, 0
  :L1
    array-length v2, p2
    if-ge v1, v2, :L3
  .line 110
    aget v2, p2, v1
    invoke-virtual { p0, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
    return v1
  :L2
  .line 109
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 112
    return v0
.end method

.method private static join([[Ljava/lang/String;)[Ljava/lang/String;
  .registers 7
  .line 81
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 82
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, p0
    if-ge v2, v3, :L3
  .line 83
    const/4 v3, 0
  :L1
    aget-object v4, p0, v2
    array-length v5, v4
    if-ge v3, v5, :L2
    aget-object v4, v4, v3
    invoke-virtual { v0, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 v3, v3, 1
    goto :L1
  :L2
  .line 82
    add-int/lit8 v2, v2, 1
    goto :L0
  :L3
  .line 85
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array p0, p0, [Ljava/lang/String;
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
    return-object p0
.end method

.method private static keyOf(Landroid/content/Context;Ljava/lang/Object;[I[Ljava/lang/String;)Ljava/lang/String;
  .registers 7
  .line 90
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 91
    const/4 v1, 0
  :L1
    array-length v2, p2
    if-ge v1, v2, :L3
  .line 92
    aget v2, p2, v1
    invoke-virtual { p0, v2 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
    aget-object p0, p3, v1
    return-object p0
  :L2
  .line 91
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 94
    return-object v0
.end method

.method public static main(Ljava/util/List;Landroid/content/Context;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 141
    invoke-static { p1 }, Lcom/innioasis/ipp/MainMenu;->settle(Landroid/content/Context;)V
  .line 142
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/MainMenu;->mainFull:Ljava/util/List;
  .line 143
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->MAIN:[I
    sget-object v2, Lcom/innioasis/ipp/MainMenu;->MAIN_KEYS:[Ljava/lang/String;
    invoke-static { p1, v0, v1, v2 }, Lcom/innioasis/ipp/MainMenu;->shown(Landroid/content/Context;Ljava/util/List;[I[Ljava/lang/String;)Ljava/util/List;
    move-result-object p1
  .line 144
    invoke-interface { p0 }, Ljava/util/List;->clear()V
  .line 145
    invoke-interface { p0, p1 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  :L1
  .line 147
    goto :L3
  :L2
  .line 146
    move-exception p0
  :L3
  .line 148
    return-void
.end method

.method public static mainResume(Lcom/innioasis/y1/base/BaseActivity;)V
  .catchall { :L0 .. :L9 } :L11
  .registers 7
  :L0
  .line 156
    sget-object v0, Lcom/innioasis/ipp/MainMenu;->mainFull:Ljava/util/List;
    if-nez v0, :L1
    return-void
  :L1
  .line 157
    invoke-static { p0 }, Lcom/innioasis/ipp/MainMenu;->settle(Landroid/content/Context;)V
  .line 158
    const v0, 2131362308
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 159
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
    instance-of v1, v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
    if-nez v1, :L2
    goto :L10
  :L2
  .line 160
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/base/BaseBindingAdapter;
  .line 161
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->getData()Ljava/util/List;
    move-result-object v2
  .line 162
    sget-object v3, Lcom/innioasis/ipp/MainMenu;->mainFull:Ljava/util/List;
    sget-object v4, Lcom/innioasis/ipp/MainMenu;->MAIN:[I
    sget-object v5, Lcom/innioasis/ipp/MainMenu;->MAIN_KEYS:[Ljava/lang/String;
    invoke-static { p0, v3, v4, v5 }, Lcom/innioasis/ipp/MainMenu;->shown(Landroid/content/Context;Ljava/util/List;[I[Ljava/lang/String;)Ljava/util/List;
    move-result-object v3
  .line 163
    invoke-interface { v3, v2 }, Ljava/util/List;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L3
    return-void
  :L3
  .line 164
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v4
  .line 165
    if-ltz v4, :L4
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L4
    invoke-interface { v2, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    goto :L5
  :L4
    const/4 v5, 0
  :L5
  .line 166
    invoke-interface { v2 }, Ljava/util/List;->clear()V
  .line 167
    invoke-interface { v2, v3 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  .line 168
    if-nez v5, :L6
    const/4 v3, -1
    goto :L7
  :L6
    invoke-interface { v2, v5 }, Ljava/util/List;->indexOf(Ljava/lang/Object;)I
    move-result v3
  :L7
  .line 169
    if-gez v3, :L8
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    add-int/lit8 v2, v2, -1
    invoke-static { v4, v2 }, Ljava/lang/Math;->min(II)I
    move-result v2
    const/4 v3, 0
    invoke-static { v3, v2 }, Ljava/lang/Math;->max(II)I
    move-result v3
  :L8
  .line 170
    invoke-virtual { p0, v3 }, Lcom/innioasis/y1/base/BaseActivity;->setMark(I)V
  .line 171
    invoke-virtual { v1 }, Lcom/innioasis/y1/base/BaseBindingAdapter;->notifyDataSetChanged()V
  .line 172
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
  .line 173
    invoke-virtual { v0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  .line 174
    invoke-static { p0 }, Lcom/innioasis/ipp/MenuStyle;->mainPreview(Landroid/app/Activity;)V
  :L9
  .line 176
    goto :L12
  :L10
  .line 159
    return-void
  :L11
  .line 175
    move-exception p0
  :L12
  .line 177
    return-void
.end method

.method public static music(Ljava/util/List;Landroid/content/Context;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 184
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->MUSIC:[I
    sget-object v2, Lcom/innioasis/ipp/MainMenu;->MUSIC_KEYS:[Ljava/lang/String;
    invoke-static { p1, v0, v1, v2 }, Lcom/innioasis/ipp/MainMenu;->shown(Landroid/content/Context;Ljava/util/List;[I[Ljava/lang/String;)Ljava/util/List;
    move-result-object p1
  .line 185
    invoke-interface { p0 }, Ljava/util/List;->clear()V
  .line 186
    invoke-interface { p0, p1 }, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
  :L1
  .line 188
    goto :L3
  :L2
  .line 187
    move-exception p0
  :L3
  .line 189
    return-void
.end method

.method public static musicPick(Landroid/app/Activity;I)I
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  :L0
  .line 194
    sget-object v0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v0 }, Lcom/innioasis/music/objects/Constant;->getMainList()Ljava/util/List;
    move-result-object v0
  .line 195
    const/4 v1, -1
    if-eqz v0, :L5
    if-ltz p1, :L5
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    if-lt p1, v2, :L1
    goto :L5
  :L1
  .line 196
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
  .line 197
    const v2, 2131821167
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
  .line 198
    new-instance v0, Landroid/content/Intent;
    const-class v2, Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-direct { v0, p0, v2 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  .line 199
    return v1
  :L2
  .line 201
    const v2, 2131821161
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
  .line 202
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->open(Landroid/app/Activity;)V
  .line 203
    return v1
  :L3
  .line 205
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->MUSIC_STOCK:[I
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/MainMenu;->indexOf(Landroid/content/Context;Ljava/lang/Object;[I)I
    move-result p0
  :L4
    return p0
  :L5
  .line 195
    return v1
  :L6
  .line 206
    move-exception p0
  .line 207
    return p1
.end method

.method public static settle(Landroid/content/Context;)V
  .registers 3
  .line 120
    const-string v0, "mm_music"
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->MUSIC_KEYS:[Ljava/lang/String;
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/MainMenu;->settle(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V
  .line 121
    const-string v0, "mm_videos"
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->VIDEO_KEYS:[Ljava/lang/String;
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/MainMenu;->settle(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V
  .line 122
    const-string v0, "mm_audiobooks"
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->BOOK_KEYS:[Ljava/lang/String;
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/MainMenu;->settle(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V
  .line 123
    return-void
.end method

.method private static settle(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 6
  :L0
  .line 127
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 128
    const/4 v0, 0
    const/4 v1, 0
  :L2
    array-length v2, p2
    if-ge v1, v2, :L4
  .line 129
    aget-object v2, p2, v1
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L3
    return-void
  :L3
  .line 128
    add-int/lit8 v1, v1, 1
    goto :L2
  :L4
  .line 131
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Prefs;->setBool(Landroid/content/Context;Ljava/lang/String;Z)V
  :L5
  .line 133
    goto :L7
  :L6
  .line 132
    move-exception p0
  :L7
  .line 134
    return-void
.end method

.method private static shown(Landroid/content/Context;Ljava/util/List;[I[Ljava/lang/String;)Ljava/util/List;
  .registers 8
  .line 98
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 99
    const/4 v1, 0
  :L0
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L3
  .line 100
    invoke-interface { p1, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 101
    invoke-static { p0, v2, p2, p3 }, Lcom/innioasis/ipp/MainMenu;->keyOf(Landroid/content/Context;Ljava/lang/Object;[I[Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
  .line 102
    if-eqz v3, :L1
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L2
  :L1
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 99
    add-int/lit8 v1, v1, 1
    goto :L0
  :L3
  .line 104
    return-object v0
.end method

.method public static videoPick(Lcom/innioasis/y1/base/BaseActivity;)I
  .catchall { :L0 .. :L2 } :L6
  .registers 4
  .line 255
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result v0
  :L0
  .line 257
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->videoShown:Ljava/util/List;
    if-eqz v1, :L5
    if-ltz v0, :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-lt v0, v1, :L1
    goto :L5
  :L1
  .line 258
    sget-object v1, Lcom/innioasis/ipp/MainMenu;->videoShown:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 259
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->getDisplayName()Ljava/lang/String;
    move-result-object v1
    sget-object v2, Lcom/innioasis/ipp/MainMenu;->VIDEOS:[I
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/MainMenu;->indexOf(Landroid/content/Context;Ljava/lang/Object;[I)I
    move-result p0
  :L2
  .line 260
    if-gez p0, :L3
    goto :L4
  :L3
    move v0, p0
  :L4
    return v0
  :L5
  .line 257
    return v0
  :L6
  .line 261
    move-exception p0
  .line 262
    return v0
.end method

.method public static videos(Ljava/util/List;Landroid/content/Context;)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L6
  .registers 8
  :L0
  .line 240
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 241
    const/4 v1, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L4
  .line 242
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;
  .line 243
    invoke-virtual { v2 }, Lcom/innioasis/y1/activity/video/VideoListActivity$BrowseItem;->getDisplayName()Ljava/lang/String;
    move-result-object v3
    sget-object v4, Lcom/innioasis/ipp/MainMenu;->VIDEOS:[I
    sget-object v5, Lcom/innioasis/ipp/MainMenu;->VIDEO_KEYS:[Ljava/lang/String;
    invoke-static { p1, v3, v4, v5 }, Lcom/innioasis/ipp/MainMenu;->keyOf(Landroid/content/Context;Ljava/lang/Object;[I[Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
  .line 244
    if-eqz v3, :L2
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L3
  :L2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 241
    add-int/lit8 v1, v1, 1
    goto :L1
  :L4
  .line 246
    sput-object v0, Lcom/innioasis/ipp/MainMenu;->videoShown:Ljava/util/List;
  :L5
  .line 247
    return-object v0
  :L6
  .line 248
    move-exception p1
  .line 249
    return-object p0
.end method

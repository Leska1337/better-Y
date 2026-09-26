.class public final Lcom/innioasis/ipp/PlGrid;
.super Ljava/lang/Object;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/PlGrid$Sweep;,
    Lcom/innioasis/ipp/PlGrid$First;,
    Lcom/innioasis/ipp/PlGrid$FromSong;,
    Lcom/innioasis/ipp/PlGrid$PhotoPick;,
    Lcom/innioasis/ipp/PlGrid$FromPhoto;,
    Lcom/innioasis/ipp/PlGrid$Say;,
    Lcom/innioasis/ipp/PlGrid$Repaint;
  }
.end annotation

.field private final static EDGE_ALPHA:I = 855638016

.field private final static GRID:I = 1

.field public final static KEY:Ljava/lang/String; = "playlists_view"

.field private final static MENU_BG:I = -7564110

.field private final static QUALITY:I = 85

.field private final static SIDE:I = 200

.field private final static SQL_COUNT:Ljava/lang/String; = "select count(*) from songCatPlaylist where playlistId = ?"

.field private final static SQL_FIRST:Ljava/lang/String; = "select songId from songCatPlaylist where playlistId = ? order by date limit 1"

.field private static dbField:Ljava/lang/reflect/Field;

.field private static heart:Landroid/graphics/Bitmap;

.field private static heartColor:I

.field private static heartDrawable:Landroid/graphics/drawable/BitmapDrawable;

.field private final static mem:Ljava/util/HashMap;

.field private static multiField:Ljava/lang/reflect/Field;

.field private final static tried:Ljava/util/HashSet;

.method static constructor <clinit>()V
  .registers 1
  .line 284
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/HashMap;
  .line 345
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->tried:Ljava/util/HashSet;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 65
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Ljava/util/UUID;)Ljava/lang/String;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 1
  .line 63
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->firstSong(Ljava/util/UUID;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$100()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 63
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$200(Ljava/util/UUID;)Ljava/io/File;
  .registers 1
  .line 63
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p0
    return-object p0
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;ZZ)Z
  .catchall { :L1 .. :L12 } :L13
  .registers 13
  .line 119
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 120
    const v1, 2131362091
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 121
    instance-of v2, v1, Landroidx/cardview/widget/CardView;
    if-nez v2, :L1
  .line 124
    const p2, 2131362561
    invoke-virtual { p0, p2, p1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 125
    return v0
  :L1
  .line 128
    check-cast v1, Landroidx/cardview/widget/CardView;
  .line 129
    const v2, 2131361934
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
    move-object v4, v2
    check-cast v4, Landroidx/cardview/widget/CardView;
  .line 130
    const v2, 2131362087
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
    move-object v5, v2
    check-cast v5, Landroid/widget/ImageView;
  .line 131
    const v2, 2131362437
    invoke-virtual { p0, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
    check-cast v2, Landroid/widget/TextView;
  .line 132
    const v3, 2131362090
    invoke-virtual { p0, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v3
    check-cast v3, Landroid/widget/ImageView;
  .line 133
    instance-of v6, p1, Lcom/innioasis/y1/database/Playlist;
    if-eqz v6, :L2
    check-cast p1, Lcom/innioasis/y1/database/Playlist;
    goto :L3
  :L2
    const/4 p1, 0
  :L3
    move-object v6, p1
  .line 135
    if-nez v6, :L4
    const-string p1, ""
    goto :L5
  :L4
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object p1
  :L5
    invoke-virtual { v2, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 136
    invoke-static { v2 }, Lcom/innioasis/ipp/Theme;->tileName(Landroid/widget/TextView;)V
  .line 137
    invoke-static { v1, v4, v2 }, Lcom/innioasis/ipp/Theme;->tileFit(Landroid/view/View;Landroid/view/View;Landroid/widget/TextView;)V
  .line 138
    if-eqz p2, :L6
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileFrame()I
    move-result p1
    goto :L7
  :L6
    const/4 p1, 0
  :L7
    invoke-virtual { v1, p1 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 142
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/PlGrid;->multiMode(Landroid/content/Context;)Z
    move-result p1
    if-eqz p1, :L10
    if-eqz v6, :L10
    invoke-static { v6 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L10
  .line 143
    invoke-virtual { v3, v0 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 144
    if-eqz p3, :L8
  .line 145
    const p1, 2131231034
    goto :L9
  :L8
    const p1, 2131231033
  :L9
  .line 144
    invoke-virtual { v3, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
    goto :L11
  :L10
  .line 147
    const/16 p1, 8
    invoke-virtual { v3, p1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L11
  .line 149
    invoke-virtual { v2 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v8
    move-object v3, p0
    move v7, p2
    invoke-static/range { v3 .. v8 }, Lcom/innioasis/ipp/PlGrid;->paint(Landroid/view/View;Landroidx/cardview/widget/CardView;Landroid/widget/ImageView;Lcom/innioasis/y1/database/Playlist;ZI)V
  :L12
  .line 152
    goto :L14
  :L13
  .line 150
    move-exception p0
  :L14
  .line 153
    const/4 p0, 1
    return p0
.end method

.method private static count(Ljava/util/UUID;)I
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 444
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v0
    const/4 v1, 1
    new-array v1, v1, [Ljava/lang/Object;
    invoke-static { p0 }, Landroidx/room/util/UUIDUtil;->convertUUIDToByte(Ljava/util/UUID;)[B
    move-result-object p0
    const/4 v2, 0
    aput-object p0, v1, v2
    const-string p0, "select count(*) from songCatPlaylist where playlistId = ?"
    invoke-virtual { v0, p0, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object p0
  :L0
  .line 446
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v0
    if-eqz v0, :L1
    invoke-interface { p0, v2 }, Landroid/database/Cursor;->getInt(I)I
    move-result v2
  :L1
  .line 448
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 446
    return v2
  :L2
  .line 448
    move-exception v0
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 449
    throw v0
.end method

.method private static cover(Ljava/util/UUID;)Landroid/graphics/Bitmap;
  .registers 11
  .line 287
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
  .line 288
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v1
    if-nez v1, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 289
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v1
  .line 290
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/HashMap;
    invoke-virtual { v3, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, [Ljava/lang/Object;
  .line 291
    const/4 v5, 1
    const/4 v6, 0
    if-eqz v4, :L1
    aget-object v7, v4, v6
    check-cast v7, Ljava/lang/Long;
    invoke-virtual { v7 }, Ljava/lang/Long;->longValue()J
    move-result-wide v7
    cmp-long v9, v7, v1
    if-nez v9, :L1
    aget-object p0, v4, v5
    check-cast p0, Landroid/graphics/Bitmap;
    return-object p0
  :L1
  .line 292
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 293
    if-eqz v0, :L2
    const/4 v4, 2
    new-array v4, v4, [Ljava/lang/Object;
    invoke-static { v1, v2 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v1
    aput-object v1, v4, v6
    aput-object v0, v4, v5
    invoke-virtual { v3, p0, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 294
    return-object v0
.end method

.method private static db()Landroidx/room/RoomDatabase;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 2
  .line 426
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->dbField:Ljava/lang/reflect/Field;
    if-nez v0, :L0
  .line 427
    const-class v0, Lcom/innioasis/y1/database/Y1Repository;
    const-string v1, "database"
    invoke-virtual { v0, v1 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v0
  .line 428
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 429
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->dbField:Ljava/lang/reflect/Field;
  :L0
  .line 431
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->dbField:Ljava/lang/reflect/Field;
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/room/RoomDatabase;
    return-object v0
.end method

.method static dir()Ljava/io/File;
  .registers 3
  .line 272
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
    const-string v2, "playlists"
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method private static first(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L2 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 4
  .line 348
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->tried:Ljava/util/HashSet;
    monitor-enter v0
  :L0
  .line 349
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 350
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 351
    monitor-exit v0
  :L2
  .line 352
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L3
    return-void
  :L3
  .line 353
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/PlGrid$First;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/ipp/PlGrid$First;-><init>(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 354
    return-void
  :L4
  .line 351
    move-exception p0
  :L5
    monitor-exit v0
  :L6
    throw p0
.end method

.method private static firstSong(Ljava/util/UUID;)Ljava/lang/String;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L0 .. :L1 } :L4
  .registers 4
  .line 435
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v0
    const/4 v1, 1
    new-array v1, v1, [Ljava/lang/Object;
    invoke-static { p0 }, Landroidx/room/util/UUIDUtil;->convertUUIDToByte(Ljava/util/UUID;)[B
    move-result-object p0
    const/4 v2, 0
    aput-object p0, v1, v2
    const-string p0, "select songId from songCatPlaylist where playlistId = ? order by date limit 1"
    invoke-virtual { v0, p0, v1 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object p0
  :L0
  .line 437
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v0
    if-eqz v0, :L2
    invoke-interface { p0, v2 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v0
    if-nez v0, :L2
    invoke-interface { p0, v2 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v0
  :L1
    goto :L3
  :L2
    const/4 v0, 0
  :L3
  .line 439
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 437
    return-object v0
  :L4
  .line 439
    move-exception v0
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 440
    throw v0
.end method

.method public static fromPhoto(Landroid/app/Activity;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 6
  .line 578
    if-eqz p0, :L8
    if-nez p1, :L0
    goto :L8
  :L0
  .line 579
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  .line 580
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L5
  :L1
  .line 581
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 582
    const/4 v2, 0
  :L2
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-interface { v1, v3 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
    add-int/lit8 v2, v2, 1
    goto :L2
  :L3
  .line 584
    new-instance v2, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v3, Lcom/innioasis/ipp/PlGrid$PhotoPick;
    invoke-direct { v3, p0, v0, p1 }, Lcom/innioasis/ipp/PlGrid$PhotoPick;-><init>(Landroid/app/Activity;Ljava/util/List;Ljava/lang/String;)V
    const p1, 2131886360
    invoke-direct { v2, p0, v1, v3, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v2 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L4
  .line 587
    goto :L7
  :L5
  .line 580
    return-void
  :L6
  .line 585
    move-exception p0
  :L7
  .line 588
    return-void
  :L8
  .line 578
    return-void
.end method

.method public static hasCover(Ljava/lang/Object;)Z
  .registers 2
  .line 298
    instance-of v0, p0, Lcom/innioasis/y1/database/Playlist;
    if-eqz v0, :L0
    check-cast p0, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static hidden(Ljava/io/File;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 242
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
  :L1
    if-eqz p0, :L3
    const/4 v0, 1
    goto :L3
  :L2
  .line 243
    move-exception p0
  .line 244
    return v0
  :L3
  .line 242
    return v0
.end method

.method private static jpg(Ljava/util/UUID;)Ljava/io/File;
  .registers 4
  .line 276
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, ".jpg"
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-direct { v0, v1, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method public static layout(Landroid/view/ViewGroup;I)I
  .registers 3
  .line 107
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 108
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
    instance-of p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;
    if-eqz p0, :L0
  .line 109
    const p0, 2131558529
    return p0
  :L0
  .line 111
    return p1
.end method

.method public static listRow(Landroid/view/View;)V
  .catchall { :L1 .. :L9 } :L10
  .registers 7
  .line 207
    if-nez p0, :L0
    return-void
  :L0
  .line 208
    const v0, 2131362491
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 209
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L2
    return-void
  :L2
  .line 210
    check-cast v0, Landroid/widget/TextView;
  .line 213
    const v1, 2131362561
    invoke-virtual { p0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result p0
    const/4 v1, 0
    const/4 v2, 0
    if-nez p0, :L4
  .line 214
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    move-result-object p0
    aget-object p0, p0, v1
    if-eqz p0, :L3
    invoke-virtual { v0, v2, v2, v2, v2 }, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 215
    return-void
  :L4
  .line 217
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
  .line 218
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v3, :L5
    sget v3, Lcom/innioasis/ipp/PlGrid;->heartColor:I
    if-eq p0, v3, :L8
  :L5
  .line 219
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
    if-nez v3, :L6
  .line 220
    invoke-virtual { v0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131623988
    invoke-static { v3, v4 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object v3
    sput-object v3, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
  :L6
  .line 222
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
    if-nez v3, :L7
    return-void
  :L7
  .line 223
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    sget-object v5, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
    invoke-direct { v3, v4, v5 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
  .line 224
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { v3, p0, v4 }, Landroid/graphics/drawable/BitmapDrawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  .line 225
    sput-object v3, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
  .line 226
    sput p0, Lcom/innioasis/ipp/PlGrid;->heartColor:I
  :L8
  .line 228
    invoke-virtual { v0 }, Landroid/widget/TextView;->getTextSize()F
    move-result p0
    invoke-static { p0 }, Ljava/lang/Math;->round(F)I
    move-result p0
  .line 229
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v3, v1, v1, p0, p0 }, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V
  .line 230
    div-int/lit8 p0, p0, 4
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V
  .line 231
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    move-result-object p0
    aget-object p0, p0, v1
    sget-object v1, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
    if-eq p0, v1, :L9
  .line 232
    invoke-virtual { v0, v1, v2, v2, v2 }, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
  :L9
  .line 236
    goto :L11
  :L10
  .line 234
    move-exception p0
  :L11
  .line 237
    return-void
.end method

.method public static menu(Ljava/util/List;Ljava/lang/Object;Landroid/content/Context;)V
  .catchall { :L0 .. :L2 } :L4
  .registers 4
  :L0
  .line 482
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-eqz v0, :L3
    instance-of v0, p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez v0, :L1
    goto :L3
  :L1
  .line 483
    check-cast p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 484
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/PlGrid;->hasCover(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L2
    const p1, 2131821137
    invoke-virtual { p2, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-interface { p0, p1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L2
  .line 487
    goto :L5
  :L3
  .line 482
    return-void
  :L4
  .line 485
    move-exception p0
  :L5
  .line 488
    return-void
.end method

.method private static menuBg()I
  .registers 1
  .line 249
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 250
    if-nez v0, :L0
    const v0, -7564110
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result v0
  :L1
    return v0
.end method

.method public static menuPick(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)Z
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 493
    const/4 v0, 0
    if-eqz p0, :L7
    if-eqz p2, :L7
    const v1, 2131821137
    const/4 v2, 1
  :L0
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p2, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :L1
    goto :L7
  :L1
  .line 496
    instance-of p2, p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez p2, :L2
    return v2
  :L2
  .line 497
    check-cast p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 498
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p2
  .line 499
    instance-of v1, p2, Lcom/innioasis/y1/database/Playlist;
    if-nez v1, :L3
    return v2
  :L3
  .line 500
    check-cast p2, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p2
    invoke-static { p2 }, Lcom/innioasis/ipp/PlGrid;->reset(Ljava/util/UUID;)V
  .line 501
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p2
    invoke-virtual { p1, p2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyItemChanged(I)V
  .line 502
    const p1, 2131821139
    invoke-static { p0, p1, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L4
  .line 505
    goto :L6
  :L5
  .line 503
    move-exception p0
  :L6
  .line 506
    return v2
  :L7
  .line 494
    return v0
.end method

.method private static multiMode(Landroid/content/Context;)Z
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 258
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->multiField:Ljava/lang/reflect/Field;
    if-nez v0, :L1
  .line 259
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    const-string v1, "isMultiSelect"
    invoke-virtual { v0, v1 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v0
  .line 260
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 261
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->multiField:Ljava/lang/reflect/Field;
  :L1
  .line 263
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->multiField:Ljava/lang/reflect/Field;
    invoke-virtual { v0, p0 }, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z
    move-result p0
  :L2
    return p0
  :L3
  .line 264
    move-exception p0
  .line 265
    const/4 p0, 0
    return p0
.end method

.method private static none(Ljava/util/UUID;)Ljava/io/File;
  .registers 4
  .line 280
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, ".none"
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-direct { v0, v1, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method public static noteAdd(Ljava/util/UUID;)V
  .catchall { :L0 .. :L3 } :L6
  .catchall { :L3 .. :L5 } :L4
  .catchall { :L5 .. :L6 } :L6
  .registers 2
  .line 406
    if-eqz p0, :L8
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v0
    if-eqz v0, :L1
    goto :L8
  :L1
  .line 407
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->count(Ljava/util/UUID;)I
    move-result v0
    if-eqz v0, :L2
    return-void
  :L2
  .line 408
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  .line 410
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->tried:Ljava/util/HashSet;
    monitor-enter v0
  :L3
  .line 411
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
  .line 412
    monitor-exit v0
  .line 415
    goto :L7
  :L4
  .line 412
    move-exception p0
    monitor-exit v0
  :L5
    throw p0
  :L6
  .line 413
    move-exception p0
  :L7
  .line 416
    return-void
  :L8
  .line 406
    return-void
.end method

.method public static on()Z
  .registers 2
  .line 84
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "playlists_view"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    const/4 v1, 1
    if-ne v0, v1, :L0
    goto :L1
  :L0
    const/4 v1, 0
  :L1
    return v1
.end method

.method private static paint(Landroid/view/View;Landroidx/cardview/widget/CardView;Landroid/widget/ImageView;Lcom/innioasis/y1/database/Playlist;ZI)V
  .registers 9
  .line 163
    const v0, 2131362561
    invoke-virtual { p2, v0 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    const/4 v2, 0
    if-nez v1, :L0
  .line 166
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p2, v0, v1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 167
    invoke-virtual { p2, v2 }, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V
  .line 168
    const v0, 2147483647
    invoke-virtual { p2, v0 }, Landroid/widget/ImageView;->setMaxWidth(I)V
  .line 169
    invoke-virtual { p2, v0 }, Landroid/widget/ImageView;->setMaxHeight(I)V
  :L0
  .line 171
    const/high16 v0, 0xFF000000
    if-eqz p4, :L1
    const/high16 p5, 0xFF000000
  :L1
    const p4, 16777215
    and-int/2addr p4, p5
    const/high16 p5, 0x33000000
    or-int/2addr p4, p5
    invoke-virtual { p1, p4 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 172
    if-nez p3, :L2
    const/4 p4, 0
    goto :L3
  :L2
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p4
    invoke-static { p4 }, Lcom/innioasis/ipp/PlGrid;->cover(Ljava/util/UUID;)Landroid/graphics/Bitmap;
    move-result-object p4
  :L3
  .line 173
    if-eqz p4, :L4
  .line 174
    invoke-virtual { p2, v2 }, Landroid/widget/ImageView;->setBackgroundColor(I)V
  .line 175
    invoke-virtual { p2 }, Landroid/widget/ImageView;->clearColorFilter()V
  .line 176
    invoke-virtual { p2, v2, v2, v2, v2 }, Landroid/widget/ImageView;->setPadding(IIII)V
  .line 177
    sget-object p0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { p2, p0 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 178
    invoke-virtual { p2, p4 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 179
    return-void
  :L4
  .line 182
    if-eqz p3, :L5
    invoke-static { p3 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result p4
    if-eqz p4, :L5
    const/4 p4, 1
    goto :L6
  :L5
    const/4 p4, 0
  :L6
  .line 183
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->menuBg()I
    move-result p5
    or-int/2addr p5, v0
    invoke-virtual { p2, p5 }, Landroid/widget/ImageView;->setBackgroundColor(I)V
  .line 184
    invoke-virtual { p1 }, Landroidx/cardview/widget/CardView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
  .line 185
    if-nez p1, :L7
    goto :L8
  :L7
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I
    div-int/lit8 v2, p1, 4
  :L8
  .line 186
    invoke-virtual { p2, v2, v2, v2, v2 }, Landroid/widget/ImageView;->setPadding(IIII)V
  .line 187
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { p2, p1 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 188
    if-eqz p4, :L9
    const p1, 2131623988
    goto :L10
  :L9
    const p1, 2131623994
  :L10
    invoke-virtual { p2, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 189
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result p1
  .line 190
    if-nez p1, :L11
    const/4 p1, -1
  :L11
    sget-object p5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { p2, p1, p5 }, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  .line 191
    if-eqz p3, :L12
    if-nez p4, :L12
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p1
    instance-of p1, p1, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz p1, :L12
  .line 192
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/PlGrid;->first(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)V
  :L12
  .line 194
    return-void
.end method

.method private static repo()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 419
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    return-object v0
.end method

.method static reset(Ljava/util/UUID;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 333
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  .line 334
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 335
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v0
  .line 336
    invoke-virtual { v0 }, Ljava/io/File;->isDirectory()Z
    move-result v1
    if-nez v1, :L1
    invoke-virtual { v0 }, Ljava/io/File;->mkdirs()Z
    move-result v0
    if-eqz v0, :L2
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/io/File;->createNewFile()Z
  :L2
  .line 339
    goto :L4
  :L3
  .line 337
    move-exception p0
  :L4
  .line 340
    return-void
.end method

.method public static setup(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 91
    if-eqz p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-nez v0, :L0
    goto :L4
  :L0
  .line 93
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v1
    const/4 v2, 3
    invoke-direct { v0, v1, v2 }, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 94
    invoke-static { p0 }, Lcom/innioasis/ipp/Theme;->tileGrid(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 95
    new-instance p0, Ljava/lang/Thread;
    new-instance v0, Lcom/innioasis/ipp/PlGrid$Sweep;
    invoke-direct { v0 }, Lcom/innioasis/ipp/PlGrid$Sweep;-><init>()V
    invoke-direct { p0, v0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L1
  .line 98
    goto :L3
  :L2
  .line 96
    move-exception p0
  :L3
  .line 99
    return-void
  :L4
  .line 91
    return-void
.end method

.method public static songPick(Landroid/app/Activity;Ljava/lang/String;)Z
  .catchall { :L0 .. :L5 } :L8
  .registers 6
  .line 515
    const/4 v0, 1
  :L0
    instance-of v1, p0, Lcom/innioasis/music/PlayListActivity;
    if-eqz v1, :L7
    if-eqz p1, :L7
  .line 516
    const v1, 2131821136
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L1
    goto :L7
  :L1
  .line 519
    move-object p1, p0
    check-cast p1, Lcom/innioasis/music/PlayListActivity;
  .line 520
    invoke-virtual { p1 }, Lcom/innioasis/music/PlayListActivity;->getAdapter()Lcom/innioasis/music/adapter/SongListAdapter;
    move-result-object v1
  .line 521
    if-nez v1, :L2
    const/4 v1, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/SongListAdapter;->getPosition()I
    move-result v2
    invoke-virtual { v1, v2 }, Lcom/innioasis/music/adapter/SongListAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  :L3
  .line 522
    invoke-virtual { p1 }, Lcom/innioasis/music/PlayListActivity;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p1
  .line 523
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L6
    if-nez p1, :L4
    goto :L6
  :L4
  .line 524
    new-instance v2, Ljava/lang/Thread;
    new-instance v3, Lcom/innioasis/ipp/PlGrid$FromSong;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-direct { v3, p0, p1, v1 }, Lcom/innioasis/ipp/PlGrid$FromSong;-><init>(Landroid/app/Activity;Ljava/util/UUID;Ljava/lang/String;)V
    invoke-direct { v2, v3 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v2 }, Ljava/lang/Thread;->start()V
  :L5
  .line 527
    goto :L9
  :L6
  .line 523
    return v0
  :L7
  .line 517
    const/4 p0, 0
    return p0
  :L8
  .line 525
    move-exception p0
  :L9
  .line 528
    return v0
.end method

.method static write(Ljava/util/UUID;Landroid/graphics/Bitmap;)Z
  .catchall { :L1 .. :L4 } :L17
  .catchall { :L4 .. :L5 } :L16
  .catchall { :L5 .. :L6 } :L15
  .catchall { :L7 .. :L11 } :L16
  .catchall { :L19 .. :L20 } :L21
  .registers 9
  .line 303
    const/4 v0, 0
    if-eqz p0, :L24
    if-nez p1, :L0
    goto/16 :L24
  :L0
  .line 304
    nop
  .line 305
    nop
  .line 307
    const/4 v1, 0
  :L1
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
    invoke-virtual { p1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    invoke-static { v2, v3 }, Ljava/lang/Math;->min(II)I
    move-result v2
    const/16 v3, 200
    invoke-static { v3, v2 }, Ljava/lang/Math;->min(II)I
    move-result v2
  .line 308
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 309
    if-nez v2, :L2
  .line 325
    nop
  .line 326
    nop
  .line 309
    return v0
  :L2
  .line 310
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v3
  .line 311
    invoke-virtual { v3 }, Ljava/io/File;->isDirectory()Z
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v3 }, Ljava/io/File;->mkdirs()Z
    move-result v4
    if-nez v4, :L3
  .line 325
    nop
  .line 326
    nop
  .line 311
    return v0
  :L3
  .line 312
    new-instance v4, Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v5, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v6, ".tmp"
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    invoke-direct { v4, v3, v5 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L4
  .line 313
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v4 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L5
  .line 314
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    const/16 v6, 85
    invoke-virtual { v2, v5, v6, v3 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    move-result v5
  .line 315
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  :L6
  .line 316
    nop
  .line 317
    if-eq v2, p1, :L8
  :L7
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->recycle()V
  :L8
  .line 318
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p1
  .line 319
    if-eqz v5, :L13
    invoke-virtual { p1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L9
    invoke-virtual { p1 }, Ljava/io/File;->delete()Z
    move-result v2
    if-eqz v2, :L13
  :L9
    invoke-virtual { v4, p1 }, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    move-result p1
    if-nez p1, :L10
    goto :L13
  :L10
  .line 320
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L11
  .line 321
    nop
  .line 325
    nop
  .line 326
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L12
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L12
  .line 321
    const/4 p0, 1
    return p0
  :L13
  .line 325
    nop
  .line 326
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L14
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L14
  .line 319
    return v0
  :L15
  .line 322
    move-exception p0
    move-object v1, v3
    goto :L18
  :L16
    move-exception p0
    goto :L18
  :L17
    move-exception p0
    move-object v4, v1
  :L18
  .line 323
    nop
  .line 325
    if-eqz v1, :L22
  :L19
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L20
    goto :L22
  :L21
    move-exception p0
  :L22
  .line 326
    if-eqz v4, :L23
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L23
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L23
  .line 323
    return v0
  :L24
  .line 303
    return v0
.end method

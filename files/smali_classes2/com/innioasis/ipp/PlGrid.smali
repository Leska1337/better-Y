.class public final Lcom/innioasis/ipp/PlGrid;
.super Ljava/lang/Object;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/PlGrid$ViewPick;,
    Lcom/innioasis/ipp/PlGrid$Decoder;,
    Lcom/innioasis/ipp/PlGrid$Prepare;,
    Lcom/innioasis/ipp/PlGrid$Mover;,
    Lcom/innioasis/ipp/PlGrid$Warm;,
    Lcom/innioasis/ipp/PlGrid$First;,
    Lcom/innioasis/ipp/PlGrid$Rebind;,
    Lcom/innioasis/ipp/PlGrid$FromSong;,
    Lcom/innioasis/ipp/PlGrid$PhotoPick;,
    Lcom/innioasis/ipp/PlGrid$FromPhoto;,
    Lcom/innioasis/ipp/PlGrid$Say;,
    Lcom/innioasis/ipp/PlGrid$Sweep;,
    Lcom/innioasis/ipp/PlGrid$Repaint;,
    Lcom/innioasis/ipp/PlGrid$Snap;,
    Lcom/innioasis/ipp/PlGrid$Tidy;
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

.field private final static TILE_SLOW_MS:J = 40L

.field private final static UI:Landroid/os/Handler;

.field private final static WARM_MS:J = 400L

.field private final static WARM_TILES:I = 12

.field private static adapterField:Ljava/lang/reflect/Field;

.field private static dbField:Ljava/lang/reflect/Field;

.field private static heart:Landroid/graphics/Bitmap;

.field private static heartColor:I

.field private static heartDrawable:Landroid/graphics/drawable/BitmapDrawable;

.field private static lastMulti:Z

.field private static loading:Z

.field private final static mem:Ljava/util/Hashtable;

.field private static menuMulti:Z

.field private final static movers:Ljava/util/WeakHashMap;

.field private final static multiFields:Ljava/util/HashMap;

.field private final static tried:Ljava/util/HashSet;

.method static constructor <clinit>()V
  .registers 2
  .line 311
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->movers:Ljava/util/WeakHashMap;
  .line 886
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->UI:Landroid/os/Handler;
  .line 918
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->multiFields:Ljava/util/HashMap;
  .line 948
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/Hashtable;
  .line 1156
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->tried:Ljava/util/HashSet;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 58
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;)Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->adapter(Landroid/content/Context;)Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$100(Landroid/app/Activity;Z)V
  .registers 2
  .line 56
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/PlGrid;->setView(Landroid/app/Activity;Z)V
    return-void
.end method

.method static synthetic access$1000(Landroid/graphics/Bitmap;)Z
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->oversized(Landroid/graphics/Bitmap;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$1300(Ljava/util/UUID;)Ljava/lang/String;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->firstSong(Ljava/util/UUID;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$1400(Ljava/util/UUID;)Ljava/io/File;
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$1500(Ljava/util/UUID;)V
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->fresh(Ljava/util/UUID;)V
    return-void
.end method

.method static synthetic access$200()Landroid/os/Handler;
  .registers 1
  .line 56
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->UI:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$300(I)I
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->overEdge(I)I
    move-result p0
    return p0
.end method

.method static synthetic access$400(Landroid/content/Context;)Z
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->multiMode(Landroid/content/Context;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$500()Z
  .registers 1
  .line 56
    sget-boolean v0, Lcom/innioasis/ipp/PlGrid;->menuMulti:Z
    return v0
.end method

.method static synthetic access$600(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->firsts(Landroidx/recyclerview/widget/RecyclerView;)V
    return-void
.end method

.method static synthetic access$700()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 56
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$800(Ljava/util/UUID;)Ljava/io/File;
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$900()Ljava/util/Hashtable;
  .registers 1
  .line 56
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/Hashtable;
    return-object v0
.end method

.method private static adapter(Landroid/content/Context;)Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 904
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/PlGrid;->adapterField:Ljava/lang/reflect/Field;
    if-nez v1, :L1
  .line 905
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    const-string v2, "adapter$delegate"
    invoke-virtual { v1, v2 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 906
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 907
    sput-object v1, Lcom/innioasis/ipp/PlGrid;->adapterField:Ljava/lang/reflect/Field;
  :L1
  .line 909
    sget-object v1, Lcom/innioasis/ipp/PlGrid;->adapterField:Ljava/lang/reflect/Field;
    invoke-virtual { v1, p0 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 910
    instance-of v1, p0, Lkotlin/Lazy;
    if-eqz v1, :L2
    check-cast p0, Lkotlin/Lazy;
    invoke-interface { p0 }, Lkotlin/Lazy;->getValue()Ljava/lang/Object;
    move-result-object p0
  :L2
  .line 911
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L4
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  :L3
    move-object v0, p0
  :L4
    return-object v0
  :L5
  .line 912
    move-exception p0
  .line 913
    return-object v0
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;ZZ)Z
  .catchall { :L2 .. :L29 } :L30
  .registers 19
  .line 687
    move-object v0, p0
    move-object/from16 v1, p1
    const/4 v2, 0
    if-nez v0, :L0
    return v2
  :L0
  .line 688
    const v3, 2131362091
    invoke-virtual { p0, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v3
  .line 689
    instance-of v4, v3, Landroidx/cardview/widget/CardView;
    if-nez v4, :L1
  .line 692
    const v3, 2131362561
    invoke-virtual { p0, v3, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 693
    return v2
  :L1
  .line 695
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
  .line 697
    const/4 v9, 1
  :L2
    check-cast v3, Landroidx/cardview/widget/CardView;
  .line 698
    const v4, 2131361934
    invoke-virtual { p0, v4 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroidx/cardview/widget/CardView;
  .line 699
    const v5, 2131362087
    invoke-virtual { p0, v5 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v5
    check-cast v5, Landroid/widget/ImageView;
  .line 700
    const v6, 2131362437
    invoke-virtual { p0, v6 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v6
    check-cast v6, Landroid/widget/TextView;
  .line 701
    const v10, 2131362090
    invoke-virtual { p0, v10 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v10
    check-cast v10, Landroid/widget/ImageView;
  .line 702
    instance-of v11, v1, Lcom/innioasis/y1/database/Playlist;
    const/4 v12, 0
    if-eqz v11, :L3
    check-cast v1, Lcom/innioasis/y1/database/Playlist;
    move-object v11, v1
    goto :L4
  :L3
    move-object v11, v12
  :L4
  .line 704
    if-nez v11, :L5
    const-string v1, ""
    goto :L6
  :L5
    invoke-virtual { v11 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v1
  :L6
    invoke-virtual { v6, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 705
    invoke-static { v6 }, Lcom/innioasis/ipp/Theme;->tileName(Landroid/widget/TextView;)V
  .line 706
    invoke-static { v3, v4, v6 }, Lcom/innioasis/ipp/Theme;->tileFit(Landroid/view/View;Landroid/view/View;Landroid/widget/TextView;)V
  .line 710
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
  .line 711
    invoke-static { v1 }, Lcom/innioasis/ipp/PlGrid;->adapter(Landroid/content/Context;)Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object v13
  .line 714
    if-nez v13, :L7
    goto :L8
  :L7
    invoke-virtual { v13 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v12
  :L8
  .line 715
    if-eqz v12, :L9
    invoke-interface { v12 }, Ljava/util/List;->isEmpty()Z
    move-result v12
    if-eqz v12, :L10
  :L9
    sput-boolean v2, Lcom/innioasis/ipp/PlGrid;->menuMulti:Z
  :L10
  .line 716
    invoke-static { v1 }, Lcom/innioasis/ipp/PlGrid;->multiMode(Landroid/content/Context;)Z
    move-result v1
    if-nez v1, :L12
    sget-boolean v1, Lcom/innioasis/ipp/PlGrid;->menuMulti:Z
    if-eqz v1, :L11
    goto :L12
  :L11
    const/4 v1, 0
    goto :L13
  :L12
    const/4 v1, 1
  :L13
  .line 717
    sget-boolean v12, Lcom/innioasis/ipp/PlGrid;->lastMulti:Z
    if-eq v1, v12, :L14
  .line 719
    sput-boolean v1, Lcom/innioasis/ipp/PlGrid;->lastMulti:Z
  .line 720
    if-eqz v13, :L14
    sget-object v12, Lcom/innioasis/ipp/PlGrid;->UI:Landroid/os/Handler;
    new-instance v14, Lcom/innioasis/ipp/PlGrid$Rebind;
    invoke-direct { v14, v13 }, Lcom/innioasis/ipp/PlGrid$Rebind;-><init>(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
    invoke-virtual { v12, v14 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L14
  .line 724
    if-nez v1, :L16
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v12
    if-nez v12, :L15
    goto :L16
  :L15
    const/4 v12, 0
    goto :L17
  :L16
    const/4 v12, 1
  :L17
  .line 725
    if-eqz p2, :L18
    if-eqz v12, :L18
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileFrame()I
    move-result v14
    goto :L19
  :L18
    const/4 v14, 0
  :L19
    invoke-virtual { v3, v14 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 726
    if-eqz p2, :L20
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    instance-of v3, v3, Landroid/view/View;
    if-eqz v3, :L20
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3 }, Landroid/view/View;->invalidate()V
  :L20
  .line 728
    if-eqz p2, :L21
    if-nez p3, :L21
    if-eqz v13, :L21
    invoke-virtual { v13 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v3
    if-eqz v3, :L21
  .line 729
    invoke-virtual { v13 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v3
    invoke-virtual { v13 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result v13
    invoke-static { v13 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v13
    invoke-interface { v3, v13 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v3
    goto :L22
  :L21
  .line 731
    move/from16 v3, p3
  :L22
    if-eqz v1, :L25
    if-eqz v11, :L25
    invoke-static { v11 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L25
  .line 732
    invoke-virtual { v10, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 733
    if-eqz v3, :L23
  .line 734
    const v1, 2131231034
    goto :L24
  :L23
    const v1, 2131231033
  :L24
  .line 733
    invoke-virtual { v10, v1 }, Landroid/widget/ImageView;->setImageResource(I)V
    goto :L26
  :L25
  .line 736
    const/16 v1, 8
    invoke-virtual { v10, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L26
  .line 739
    if-eqz p2, :L27
    if-eqz v12, :L27
    const/4 v10, 1
    goto :L28
  :L27
    const/4 v10, 0
  :L28
    invoke-virtual { v6 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result v6
    move-object v1, p0
    move-object v2, v4
    move-object v3, v5
    move-object v4, v11
    move v5, v10
    invoke-static/range { v1 .. v6 }, Lcom/innioasis/ipp/PlGrid;->paint(Landroid/view/View;Landroidx/cardview/widget/CardView;Landroid/widget/ImageView;Lcom/innioasis/y1/database/Playlist;ZI)V
  :L29
  .line 741
    goto :L31
  :L30
  .line 740
    move-exception v0
  :L31
  .line 742
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sub-long/2addr v0, v7
  .line 743
    const-wide/16 v2, 3
    cmp-long v4, v0, v2
    if-ltz v4, :L32
    const-string v2, "tile"
    invoke-static { v2, v7, v8 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L32
  .line 744
    const-wide/16 v2, 40
    cmp-long v4, v0, v2
    if-ltz v4, :L33
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "slow: playlist tile "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L33
  .line 745
    return v9
.end method

.method public static blinkEdge(Landroid/view/View;Z)V
  .registers 4
  .line 803
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    const v1, 2131361934
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  :L1
  .line 804
    if-nez p0, :L2
    goto :L3
  :L2
    const v0, 2131362561
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v0
  :L3
  .line 805
    instance-of v1, p0, Landroidx/cardview/widget/CardView;
    if-eqz v1, :L7
    instance-of v1, v0, Ljava/lang/Integer;
    if-nez v1, :L4
    goto :L7
  :L4
  .line 806
    check-cast p0, Landroidx/cardview/widget/CardView;
    if-eqz p1, :L5
    const/high16 p1, 0xFF000000
    invoke-static { p1 }, Lcom/innioasis/ipp/PlGrid;->edge(I)I
    move-result p1
    goto :L6
  :L5
    check-cast v0, Ljava/lang/Integer;
    invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
    move-result p1
  :L6
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/PlGrid;->cardColor(Landroidx/cardview/widget/CardView;I)V
  .line 807
    return-void
  :L7
  .line 805
    return-void
.end method

.method private static cardColor(Landroidx/cardview/widget/CardView;I)V
  .registers 5
  .line 811
    const v0, 2131361934
    invoke-virtual { p0, v0 }, Landroidx/cardview/widget/CardView;->getTag(I)Ljava/lang/Object;
    move-result-object v1
  .line 812
    instance-of v2, v1, Ljava/lang/Integer;
    if-eqz v2, :L0
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    if-ne v1, p1, :L0
    return-void
  :L0
  .line 813
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { p0, v0, v1 }, Landroidx/cardview/widget/CardView;->setTag(ILjava/lang/Object;)V
  .line 814
    invoke-virtual { p0, p1 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 815
    return-void
.end method

.method private static count(Ljava/util/UUID;)I
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 1251
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
  .line 1253
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v0
    if-eqz v0, :L1
    invoke-interface { p0, v2 }, Landroid/database/Cursor;->getInt(I)I
    move-result v2
  :L1
  .line 1255
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 1253
    return v2
  :L2
  .line 1255
    move-exception v0
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 1256
    throw v0
.end method

.method private static cover(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)Landroid/graphics/Bitmap;
  .registers 11
  .line 963
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/PlGrid;->loading:Z
  .line 964
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/io/File;->lastModified()J
    move-result-wide v1
  .line 965
    const-wide/16 v3, 0
    const/4 v5, 0
    cmp-long v6, v1, v3
    if-nez v6, :L0
    return-object v5
  :L0
  .line 966
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/Hashtable;
    invoke-virtual { v3, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, [Ljava/lang/Object;
  .line 967
    const/4 v4, 1
    if-eqz v3, :L2
    aget-object v6, v3, v0
    check-cast v6, Ljava/lang/Long;
    invoke-virtual { v6 }, Ljava/lang/Long;->longValue()J
    move-result-wide v6
    cmp-long v8, v6, v1
    if-nez v8, :L2
  .line 969
    aget-object v1, v3, v4
    check-cast v1, Landroid/graphics/Bitmap;
    invoke-static { v1 }, Lcom/innioasis/ipp/PlGrid;->oversized(Landroid/graphics/Bitmap;)Z
    move-result v1
    if-eqz v1, :L1
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/PlGrid$Decoder;->want(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;Z)V
  :L1
  .line 970
    aget-object p0, v3, v4
    check-cast p0, Landroid/graphics/Bitmap;
    return-object p0
  :L2
  .line 972
    sput-boolean v4, Lcom/innioasis/ipp/PlGrid;->loading:Z
  .line 973
    invoke-static { p0, p1, v4 }, Lcom/innioasis/ipp/PlGrid$Decoder;->want(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 974
    if-nez v3, :L3
    goto :L4
  :L3
    aget-object p0, v3, v4
    move-object v5, p0
    check-cast v5, Landroid/graphics/Bitmap;
  :L4
    return-object v5
.end method

.method public static cursor(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 169
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/PlGrid;->cursor(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 170
    return-void
.end method

.method private static cursor(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .registers 4
  .line 179
    if-eqz p0, :L2
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v0
    if-nez v0, :L0
    goto :L2
  :L0
  .line 180
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Wheel;->glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 181
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->movers:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    if-nez v1, :L1
  .line 182
    new-instance v1, Lcom/innioasis/ipp/PlGrid$Mover;
    invoke-direct { v1, p1 }, Lcom/innioasis/ipp/PlGrid$Mover;-><init>(Z)V
  .line 183
    invoke-virtual { v0, p0, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 184
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  :L1
  .line 186
    new-instance p1, Lcom/innioasis/ipp/PlGrid$Warm;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/PlGrid$Warm;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    const-wide/16 v0, 400
    invoke-virtual { p0, p1, v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 187
    return-void
  :L2
  .line 179
    return-void
.end method

.method static cursorAt(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 3
  .line 214
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  .line 215
    instance-of v1, v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L0
    check-cast v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p0
    return p0
  :L0
  .line 216
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 217
    instance-of v0, p0, Lcom/innioasis/y1/base/BaseActivity;
    if-eqz v0, :L1
    check-cast p0, Lcom/innioasis/y1/base/BaseActivity;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BaseActivity;->getMark()I
    move-result p0
    goto :L2
  :L1
    const/4 p0, -1
  :L2
    return p0
.end method

.method public static cursorFrame(Landroid/view/View;)I
  .registers 4
  .line 222
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 224
    move-object v1, p0
  :L1
    if-eqz v1, :L4
  .line 225
    instance-of v2, v1, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v2, :L2
  .line 226
    invoke-virtual { v1 }, Landroid/view/View;->invalidate()V
  .line 227
    goto :L4
  :L2
  .line 224
    invoke-virtual { v1 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    instance-of v2, v2, Landroid/view/View;
    if-eqz v2, :L3
    invoke-virtual { v1 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v1
    check-cast v1, Landroid/view/View;
    goto :L1
  :L3
    const/4 v1, 0
    goto :L1
  :L4
  .line 230
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->multiMode(Landroid/content/Context;)Z
    move-result p0
    if-nez p0, :L5
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result p0
    if-nez p0, :L6
  :L5
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileFrame()I
    move-result v0
  :L6
    return v0
.end method

.method static db()Landroidx/room/RoomDatabase;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .registers 2
  .line 1233
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->dbField:Ljava/lang/reflect/Field;
    if-nez v0, :L0
  .line 1234
    const-class v0, Lcom/innioasis/y1/database/Y1Repository;
    const-string v1, "database"
    invoke-virtual { v0, v1 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v0
  .line 1235
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 1236
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->dbField:Ljava/lang/reflect/Field;
  :L0
  .line 1238
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
  .line 936
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
    const-string v2, "playlists"
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method private static edge(I)I
  .registers 2
  .line 818
    const v0, 16777215
    and-int/2addr p0, v0
    const/high16 v0, 0x33000000
    or-int/2addr p0, v0
    return p0
.end method

.method private static first(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L2 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 4
  .line 1159
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->tried:Ljava/util/HashSet;
    monitor-enter v0
  :L0
  .line 1160
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1161
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 1162
    monitor-exit v0
  :L2
  .line 1163
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L3
    return-void
  :L3
  .line 1164
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/PlGrid$First;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/ipp/PlGrid$First;-><init>(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 1165
    return-void
  :L4
  .line 1162
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
  .line 1242
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
  .line 1244
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
  .line 1246
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 1244
    return-object v0
  :L4
  .line 1246
    move-exception v0
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 1247
    throw v0
.end method

.method private static firsts(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L6 } :L15
  .catchall { :L6 .. :L8 } :L10
  .catchall { :L8 .. :L9 } :L15
  .catchall { :L11 .. :L12 } :L10
  .catchall { :L12 .. :L13 } :L15
  .registers 6
  :L0
  .line 655
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 656
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  .line 657
    if-nez v0, :L2
    return-void
  :L2
  .line 658
    const/4 v1, 0
  :L3
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L14
  .line 659
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 660
    instance-of v3, v2, Lcom/innioasis/y1/database/Playlist;
    if-eqz v3, :L13
    invoke-static { v2 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L4
    goto :L13
  :L4
  .line 661
    check-cast v2, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v2
  .line 662
    if-eqz v2, :L13
    invoke-static { v2 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L5
    goto :L13
  :L5
  .line 663
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->tried:Ljava/util/HashSet;
    monitor-enter v3
  :L6
  .line 664
    invoke-virtual { v3, v2 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L7
    monitor-exit v3
    goto :L13
  :L7
  .line 665
    invoke-virtual { v3, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 666
    monitor-exit v3
  :L8
  .line 667
    invoke-static { v2 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :L13
    new-instance v3, Lcom/innioasis/ipp/PlGrid$First;
    invoke-direct { v3, v2, p0 }, Lcom/innioasis/ipp/PlGrid$First;-><init>(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-virtual { v3 }, Lcom/innioasis/ipp/PlGrid$First;->run()V
  :L9
    goto :L13
  :L10
  .line 666
    move-exception p0
  :L11
    monitor-exit v3
  :L12
    throw p0
  :L13
  .line 658
    add-int/lit8 v1, v1, 1
    goto :L3
  :L14
  .line 670
    goto :L16
  :L15
  .line 669
    move-exception p0
  :L16
  .line 671
    return-void
.end method

.method private static fresh(Ljava/util/UUID;)V
  .registers 3
  .line 1108
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-eqz v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid$Decoder;->grid()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object v0
    if-eqz v0, :L0
    const/4 v0, 0
    const/4 v1, 1
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/PlGrid$Decoder;->want(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;Z)V
  :L0
  .line 1109
    return-void
.end method

.method public static fromPhoto(Landroid/app/Activity;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 6
  .line 1411
    if-eqz p0, :L8
    if-nez p1, :L0
    goto :L8
  :L0
  .line 1412
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  .line 1413
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L5
  :L1
  .line 1414
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1415
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
  .line 1417
    new-instance v2, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v3, Lcom/innioasis/ipp/PlGrid$PhotoPick;
    invoke-direct { v3, p0, v0, p1 }, Lcom/innioasis/ipp/PlGrid$PhotoPick;-><init>(Landroid/app/Activity;Ljava/util/List;Ljava/lang/String;)V
    const p1, 2131886360
    invoke-direct { v2, p0, v1, v3, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v2 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L4
  .line 1419
    goto :L7
  :L5
  .line 1413
    return-void
  :L6
  .line 1418
    move-exception p0
  :L7
  .line 1420
    return-void
  :L8
  .line 1411
    return-void
.end method

.method public static hasCover(Ljava/lang/Object;)Z
  .registers 2
  .line 1112
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
  .line 868
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
  .line 869
    move-exception p0
  .line 870
    return v0
  :L3
  .line 868
    return v0
.end method

.method static holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 208
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->movers:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 209
    if-eqz p0, :L0
    check-cast p0, Lcom/innioasis/ipp/PlGrid$Mover;
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/PlGrid$Mover;->along(I)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static jpg(Ljava/util/UUID;)Ljava/io/File;
  .registers 4
  .line 940
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
  .line 675
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 676
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
    instance-of p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;
    if-eqz p0, :L0
  .line 677
    const p0, 2131558622
    return p0
  :L0
  .line 679
    return p1
.end method

.method public static listRow(Landroid/view/View;)V
  .catchall { :L1 .. :L9 } :L10
  .registers 7
  .line 835
    if-nez p0, :L0
    return-void
  :L0
  .line 836
    const v0, 2131362491
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 837
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L2
    return-void
  :L2
  .line 838
    check-cast v0, Landroid/widget/TextView;
  .line 840
    const v1, 2131362561
    invoke-virtual { p0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result p0
    const/4 v1, 0
    const/4 v2, 0
    if-nez p0, :L4
  .line 841
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    move-result-object p0
    aget-object p0, p0, v1
    if-eqz p0, :L3
    invoke-virtual { v0, v2, v2, v2, v2 }, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 842
    return-void
  :L4
  .line 844
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
  .line 845
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v3, :L5
    sget v3, Lcom/innioasis/ipp/PlGrid;->heartColor:I
    if-eq p0, v3, :L8
  :L5
  .line 846
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
    if-nez v3, :L6
  .line 847
    invoke-virtual { v0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131623988
    invoke-static { v3, v4 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object v3
    sput-object v3, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
  :L6
  .line 849
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
    if-nez v3, :L7
    return-void
  :L7
  .line 850
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    sget-object v5, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
    invoke-direct { v3, v4, v5 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
  .line 851
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { v3, p0, v4 }, Landroid/graphics/drawable/BitmapDrawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  .line 852
    sput-object v3, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
  .line 853
    sput p0, Lcom/innioasis/ipp/PlGrid;->heartColor:I
  :L8
  .line 855
    invoke-virtual { v0 }, Landroid/widget/TextView;->getTextSize()F
    move-result p0
    invoke-static { p0 }, Ljava/lang/Math;->round(F)I
    move-result p0
  .line 856
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v3, v1, v1, p0, p0 }, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V
  .line 857
    div-int/lit8 p0, p0, 4
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V
  .line 858
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    move-result-object p0
    aget-object p0, p0, v1
    sget-object v1, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
    if-eq p0, v1, :L9
  .line 859
    invoke-virtual { v0, v1, v2, v2, v2 }, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
  :L9
  .line 862
    goto :L11
  :L10
  .line 861
    move-exception p0
  :L11
  .line 863
    return-void
.end method

.method static memBytes()J
  .registers 2
  .line 951
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/Hashtable;
    invoke-virtual { v1 }, Ljava/util/Hashtable;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->bitmapBytes(Ljava/util/Collection;)J
    move-result-wide v0
    return-wide v0
.end method

.method public static menu(Ljava/util/List;Ljava/lang/Object;Landroid/content/Context;)V
  .catchall { :L0 .. :L3 } :L7
  .registers 5
  :L0
  .line 1286
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-eqz v0, :L6
    instance-of v0, p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez v0, :L1
    goto :L6
  :L1
  .line 1287
    check-cast p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-static { p1 }, Lcom/innioasis/ipp/PlGrid;->targets(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Ljava/util/List;
    move-result-object p1
  .line 1288
    const/4 v0, 0
  :L2
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L5
  .line 1289
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/PlGrid;->hasCover(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L4
  .line 1290
    const p1, 2131821137
    invoke-virtual { p2, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-interface { p0, p1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L3
  .line 1291
    return-void
  :L4
  .line 1288
    add-int/lit8 v0, v0, 1
    goto :L2
  :L5
  .line 1295
    goto :L8
  :L6
  .line 1286
    return-void
  :L7
  .line 1294
    move-exception p0
  :L8
  .line 1296
    return-void
.end method

.method private static menuBg()I
  .registers 1
  .line 875
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 876
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
  .catchall { :L1 .. :L2 } :L3
  .catchall { :L6 .. :L14 } :L15
  .registers 9
  .line 1315
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/M3u;->menuPick(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
    return v1
  :L0
  .line 1316
    if-eqz p0, :L5
    if-eqz p2, :L5
    const v0, 2131821158
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p2, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L5
  :L1
  .line 1318
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->viewDialog(Landroid/app/Activity;)V
  :L2
  .line 1320
    goto :L4
  :L3
  .line 1319
    move-exception p0
  :L4
  .line 1321
    return v1
  :L5
  .line 1324
    const/4 v0, 0
    if-eqz p0, :L17
    if-eqz p2, :L17
    const v2, 2131821137
  :L6
    invoke-virtual { p0, v2 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p2, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :L7
    goto :L17
  :L7
  .line 1327
    instance-of p2, p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez p2, :L8
    return v1
  :L8
  .line 1328
    check-cast p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 1329
    invoke-static { p1 }, Lcom/innioasis/ipp/PlGrid;->targets(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Ljava/util/List;
    move-result-object p2
  .line 1330
    nop
  .line 1331
    const/4 v2, 0
    const/4 v3, 0
  :L9
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v2, v4, :L12
  .line 1332
    invoke-interface { p2, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 1333
    invoke-static { v4 }, Lcom/innioasis/ipp/PlGrid;->hasCover(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L10
    goto :L11
  :L10
  .line 1334
    check-cast v4, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/PlGrid;->reset(Ljava/util/UUID;)V
  .line 1335
    const/4 v3, 1
  :L11
  .line 1331
    add-int/lit8 v2, v2, 1
    goto :L9
  :L12
  .line 1337
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p2
    if-eqz p2, :L13
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p2
    invoke-interface { p2 }, Ljava/util/List;->clear()V
  :L13
  .line 1338
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  .line 1339
    if-eqz v3, :L14
    const p1, 2131821139
    invoke-static { p0, p1, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L14
  .line 1341
    goto :L16
  :L15
  .line 1340
    move-exception p0
  :L16
  .line 1342
    return v1
  :L17
  .line 1325
    return v0
.end method

.method private static multiMode(Landroid/content/Context;)Z
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  :L0
  .line 923
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->multiFields:Ljava/util/HashMap;
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/reflect/Field;
  .line 924
    if-nez v1, :L1
  .line 925
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    const-string v2, "isMultiSelect"
    invoke-virtual { v1, v2 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 926
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 927
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
    invoke-virtual { v0, v2, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 929
    invoke-virtual { v1, p0 }, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z
    move-result p0
  :L2
    return p0
  :L3
  .line 930
    move-exception p0
  .line 931
    const/4 p0, 0
    return p0
.end method

.method private static none(Ljava/util/UUID;)Ljava/io/File;
  .registers 4
  .line 944
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
  .line 1214
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
  .line 1215
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->count(Ljava/util/UUID;)I
    move-result v0
    if-eqz v0, :L2
    return-void
  :L2
  .line 1216
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  .line 1218
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->tried:Ljava/util/HashSet;
    monitor-enter v0
  :L3
  .line 1219
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
  .line 1220
    monitor-exit v0
  .line 1222
    goto :L7
  :L4
  .line 1220
    move-exception p0
    monitor-exit v0
  :L5
    throw p0
  :L6
  .line 1221
    move-exception p0
  :L7
  .line 1223
    return-void
  :L8
  .line 1214
    return-void
.end method

.method static noteMenu(Landroid/content/Context;)V
  .registers 1
  .line 884
    if-eqz p0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->multiMode(Landroid/content/Context;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    sput-boolean p0, Lcom/innioasis/ipp/PlGrid;->menuMulti:Z
  .line 885
    return-void
.end method

.method public static on()Z
  .registers 3
  .line 78
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 79
    const/4 v1, 0
    if-eqz v0, :L0
    const-string v2, "playlists_view"
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Prefs;->getInt(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    const/4 v2, 1
    if-ne v0, v2, :L0
    const/4 v1, 1
  :L0
    return v1
.end method

.method private static overEdge(I)I
  .registers 4
  .line 823
    nop
  .line 824
    invoke-static { p0 }, Landroid/graphics/Color;->red(I)I
    move-result v0
    mul-int/lit16 v0, v0, 204
    const/16 v1, 255
    div-int/2addr v0, v1
    invoke-static { p0 }, Landroid/graphics/Color;->green(I)I
    move-result v2
    mul-int/lit16 v2, v2, 204
    div-int/2addr v2, v1
  .line 825
    invoke-static { p0 }, Landroid/graphics/Color;->blue(I)I
    move-result p0
    mul-int/lit16 p0, p0, 204
    div-int/2addr p0, v1
  .line 824
    invoke-static { v1, v0, v2, p0 }, Landroid/graphics/Color;->argb(IIII)I
    move-result p0
    return p0
.end method

.method private static oversized(Landroid/graphics/Bitmap;)Z
  .registers 2
  .line 978
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileCardSide()I
    move-result v0
  .line 979
    if-eqz p0, :L0
    if-lez v0, :L0
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p0
    if-le p0, v0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static paint(Landroid/view/View;Landroidx/cardview/widget/CardView;Landroid/widget/ImageView;Lcom/innioasis/y1/database/Playlist;ZI)V
  .registers 9
  .line 754
    const v0, 2131362561
    invoke-virtual { p2, v0 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    const/4 v2, 0
    if-nez v1, :L0
  .line 757
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p2, v0, v1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 758
    invoke-virtual { p2, v2 }, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V
  .line 759
    const v1, 2147483647
    invoke-virtual { p2, v1 }, Landroid/widget/ImageView;->setMaxWidth(I)V
  .line 760
    invoke-virtual { p2, v1 }, Landroid/widget/ImageView;->setMaxHeight(I)V
  :L0
  .line 762
    invoke-static { p5 }, Lcom/innioasis/ipp/PlGrid;->edge(I)I
    move-result v1
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { p1, v0, v1 }, Landroidx/cardview/widget/CardView;->setTag(ILjava/lang/Object;)V
  .line 763
    const/high16 v0, 0xFF000000
    if-eqz p4, :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->edge(I)I
    move-result p4
    goto :L2
  :L1
    invoke-static { p5 }, Lcom/innioasis/ipp/PlGrid;->edge(I)I
    move-result p4
  :L2
    invoke-static { p1, p4 }, Lcom/innioasis/ipp/PlGrid;->cardColor(Landroidx/cardview/widget/CardView;I)V
  .line 764
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p4
    instance-of p4, p4, Landroidx/recyclerview/widget/RecyclerView;
    const/4 p5, 0
    if-eqz p4, :L3
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
    goto :L4
  :L3
    move-object p0, p5
  :L4
  .line 765
    if-nez p3, :L5
    move-object p4, p5
    goto :L6
  :L5
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p4
    invoke-static { p4, p0 }, Lcom/innioasis/ipp/PlGrid;->cover(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)Landroid/graphics/Bitmap;
    move-result-object p4
  :L6
  .line 766
    if-eqz p4, :L9
  .line 767
    invoke-virtual { p2, v2 }, Landroid/widget/ImageView;->setBackgroundColor(I)V
  .line 768
    invoke-virtual { p2 }, Landroid/widget/ImageView;->clearColorFilter()V
  .line 769
    invoke-virtual { p2, v2, v2, v2, v2 }, Landroid/widget/ImageView;->setPadding(IIII)V
  .line 770
    sget-object p0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { p2, p0 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 772
    invoke-virtual { p2 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p0
    instance-of p0, p0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz p0, :L7
  .line 773
    invoke-virtual { p2 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p0
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object p0
    if-eq p0, p4, :L8
  :L7
  .line 774
    invoke-virtual { p2, p4 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L8
  .line 776
    return-void
  :L9
  .line 779
    if-eqz p3, :L10
    invoke-static { p3 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result p4
    if-eqz p4, :L10
    const/4 p4, 1
    goto :L11
  :L10
    const/4 p4, 0
  :L11
  .line 780
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->menuBg()I
    move-result v1
    or-int/2addr v0, v1
    invoke-virtual { p2, v0 }, Landroid/widget/ImageView;->setBackgroundColor(I)V
  .line 781
    sget-boolean v0, Lcom/innioasis/ipp/PlGrid;->loading:Z
    if-eqz v0, :L12
  .line 783
    invoke-virtual { p2, p5 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 784
    return-void
  :L12
  .line 786
    invoke-virtual { p1 }, Landroidx/cardview/widget/CardView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
  .line 787
    if-nez p1, :L13
    goto :L14
  :L13
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I
    div-int/lit8 v2, p1, 4
  :L14
  .line 788
    invoke-virtual { p2, v2, v2, v2, v2 }, Landroid/widget/ImageView;->setPadding(IIII)V
  .line 789
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { p2, p1 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 790
    if-eqz p4, :L15
    const p1, 2131623988
    goto :L16
  :L15
    const p1, 2131623994
  :L16
    invoke-virtual { p2, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 791
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result p1
  .line 792
    if-nez p1, :L17
    const/4 p1, -1
  :L17
    sget-object p5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { p2, p1, p5 }, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  .line 794
    if-eqz p0, :L18
    goto :L19
  :L18
    invoke-static { }, Lcom/innioasis/ipp/PlGrid$Decoder;->grid()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object p0
  :L19
  .line 795
    if-eqz p3, :L20
    if-nez p4, :L20
    if-eqz p0, :L20
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/PlGrid;->first(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)V
  :L20
  .line 796
    return-void
.end method

.method public static photoFocus(Landroidx/cardview/widget/CardView;)V
  .registers 2
  .line 191
    if-nez p0, :L0
    return-void
  :L0
  .line 192
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v0
    if-eqz v0, :L6
    invoke-virtual { p0 }, Landroidx/cardview/widget/CardView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->multiMode(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :L1
    goto :L6
  :L1
  .line 196
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  :L2
  .line 198
    if-eqz p0, :L5
  .line 199
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L3
  .line 200
    invoke-virtual { p0 }, Landroid/view/View;->invalidate()V
  .line 201
    goto :L5
  :L3
  .line 198
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v0, v0, Landroid/view/View;
    if-eqz v0, :L4
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroid/view/View;
    goto :L2
  :L4
    const/4 p0, 0
    goto :L2
  :L5
  .line 204
    return-void
  :L6
  .line 193
    invoke-static { p0 }, Lcom/innioasis/ipp/Theme;->focusCard(Landroidx/cardview/widget/CardView;)V
  .line 194
    return-void
.end method

.method public static photos(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 174
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/PlGrid;->cursor(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 175
    return-void
.end method

.method private static prepare(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 159
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->cursor(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 160
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid$Decoder;->attach(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 161
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/PlGrid$Prepare;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/PlGrid$Prepare;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    const-string p0, "ipp-pl-prepare"
    invoke-direct { v0, v1, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 162
    return-void
.end method

.method private static repo()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 1226
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    return-object v0
.end method

.method static reset(Ljava/util/UUID;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 1147
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  .line 1148
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 1149
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v0
  .line 1150
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
  .line 1152
    goto :L4
  :L3
  .line 1151
    move-exception p0
  :L4
  .line 1153
    return-void
.end method

.method private static setView(Landroid/app/Activity;Z)V
  .catchall { :L0 .. :L9 } :L10
  .registers 6
  :L0
  .line 118
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-ne p1, v0, :L1
    return-void
  :L1
  .line 119
    const-string v0, "playlists_view"
    const/4 v1, 0
    if-eqz p1, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/Prefs;->setInt(Landroid/content/Context;Ljava/lang/String;I)V
  .line 120
    const v0, 2131362298
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 121
    instance-of v2, v0, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v2, :L4
    return-void
  :L4
  .line 122
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 123
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->adapter(Landroid/content/Context;)Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object v2
  .line 124
    if-nez v2, :L5
    return-void
  :L5
  .line 125
    const/4 v3, 0
    invoke-virtual { v0, v3 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 126
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getRecycledViewPool()Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;
    move-result-object v3
    invoke-virtual { v3 }, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->clear()V
  .line 127
    if-eqz p1, :L6
  .line 128
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;
    const/4 v3, 3
    invoke-direct { p1, p0, v3 }, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 129
    invoke-static { v0 }, Lcom/innioasis/ipp/Theme;->tileGrid(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 130
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->prepare(Landroidx/recyclerview/widget/RecyclerView;)V
    goto :L8
  :L6
  .line 132
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-direct { p1, p0 }, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V
    invoke-virtual { v0, p1 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 133
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Wheel;->glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 134
    sget-object p0, Lcom/innioasis/ipp/PlGrid;->movers:Ljava/util/WeakHashMap;
    invoke-virtual { p0, v0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 135
    if-eqz p0, :L7
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
    invoke-virtual { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  :L7
  .line 136
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingLeft()I
    move-result p0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingRight()I
    move-result p1
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v3
    invoke-virtual { v0, p0, v1, p1, v3 }, Landroidx/recyclerview/widget/RecyclerView;->setPadding(IIII)V
  :L8
  .line 138
    sput-boolean v1, Lcom/innioasis/ipp/PlGrid;->lastMulti:Z
  .line 139
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 140
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p0
  .line 141
    if-ltz p0, :L9
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemCount()I
    move-result p1
    if-ge p0, p1, :L9
    invoke-virtual { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  :L9
  .line 143
    goto :L11
  :L10
  .line 142
    move-exception p0
  :L11
  .line 144
    return-void
.end method

.method public static setup(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 148
    if-eqz p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-nez v0, :L0
    goto :L4
  :L0
  .line 150
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v1
    const/4 v2, 3
    invoke-direct { v0, v1, v2 }, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 151
    invoke-static { p0 }, Lcom/innioasis/ipp/Theme;->tileGrid(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 152
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->prepare(Landroidx/recyclerview/widget/RecyclerView;)V
  :L1
  .line 154
    goto :L3
  :L2
  .line 153
    move-exception p0
  :L3
  .line 155
    return-void
  :L4
  .line 148
    return-void
.end method

.method public static songPick(Landroid/app/Activity;Ljava/lang/String;)Z
  .catchall { :L0 .. :L5 } :L8
  .registers 6
  .line 1351
    const/4 v0, 1
  :L0
    instance-of v1, p0, Lcom/innioasis/music/PlayListActivity;
    if-eqz v1, :L7
    if-eqz p1, :L7
  .line 1352
    const v1, 2131821136
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L1
    goto :L7
  :L1
  .line 1355
    move-object p1, p0
    check-cast p1, Lcom/innioasis/music/PlayListActivity;
  .line 1356
    invoke-virtual { p1 }, Lcom/innioasis/music/PlayListActivity;->getAdapter()Lcom/innioasis/music/adapter/SongListAdapter;
    move-result-object v1
  .line 1357
    if-nez v1, :L2
    const/4 v1, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/SongListAdapter;->getPosition()I
    move-result v2
    invoke-virtual { v1, v2 }, Lcom/innioasis/music/adapter/SongListAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  :L3
  .line 1358
    invoke-virtual { p1 }, Lcom/innioasis/music/PlayListActivity;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p1
  .line 1359
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L6
    if-nez p1, :L4
    goto :L6
  :L4
  .line 1360
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
  .line 1362
    goto :L9
  :L6
  .line 1359
    return v0
  :L7
  .line 1353
    const/4 p0, 0
    return p0
  :L8
  .line 1361
    move-exception p0
  :L9
  .line 1363
    return v0
.end method

.method private static targets(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Ljava/util/List;
  .registers 5
  .line 1300
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1301
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v1
  .line 1302
    if-eqz v1, :L2
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
    const/4 v3, 1
    if-le v2, v3, :L2
  .line 1303
    const/4 v2, 0
  :L0
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 1304
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v3
  .line 1305
    if-eqz v3, :L1
    invoke-interface { v0, v3 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L1
  .line 1303
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 1307
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L3
  .line 1308
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p0
    invoke-interface { v0, p0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L3
  .line 1310
    return-object v0
.end method

.method private static viewDialog(Landroid/app/Activity;)V
  .registers 5
  .line 89
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 90
    const v1, 2131821159
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 91
    const v1, 2131821160
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  .line 93
    new-instance v1, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v2, Lcom/innioasis/ipp/PlGrid$ViewPick;
    invoke-direct { v2, p0 }, Lcom/innioasis/ipp/PlGrid$ViewPick;-><init>(Landroid/app/Activity;)V
    const v3, 2131886360
    invoke-direct { v1, p0, v0, v2, v3 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v1 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  .line 94
    return-void
.end method

.method public static viewEntry(Ljava/util/List;Landroid/content/Context;)V
  .registers 3
  .line 84
    const v0, 2131821158
    invoke-virtual { p1, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    const/4 v0, 0
    invoke-interface { p0, v0, p1 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  .line 85
    return-void
.end method

.method static write(Ljava/util/UUID;Landroid/graphics/Bitmap;)Z
  .catchall { :L1 .. :L4 } :L17
  .catchall { :L4 .. :L5 } :L16
  .catchall { :L5 .. :L6 } :L15
  .catchall { :L7 .. :L11 } :L16
  .catchall { :L19 .. :L20 } :L21
  .registers 9
  .line 1117
    const/4 v0, 0
    if-eqz p0, :L24
    if-nez p1, :L0
    goto/16 :L24
  :L0
  .line 1118
    nop
  .line 1119
    nop
  .line 1121
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
  .line 1122
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 1123
    if-nez v2, :L2
  .line 1139
    nop
  .line 1140
    nop
  .line 1123
    return v0
  :L2
  .line 1124
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v3
  .line 1125
    invoke-virtual { v3 }, Ljava/io/File;->isDirectory()Z
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v3 }, Ljava/io/File;->mkdirs()Z
    move-result v4
    if-nez v4, :L3
  .line 1139
    nop
  .line 1140
    nop
  .line 1125
    return v0
  :L3
  .line 1126
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
  .line 1127
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v4 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L5
  .line 1128
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    const/16 v6, 85
    invoke-virtual { v2, v5, v6, v3 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    move-result v5
  .line 1129
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  :L6
  .line 1130
    nop
  .line 1131
    if-eq v2, p1, :L8
  :L7
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->recycle()V
  :L8
  .line 1132
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p1
  .line 1133
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
  .line 1134
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L11
  .line 1135
    nop
  .line 1139
    nop
  .line 1140
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L12
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L12
  .line 1135
    const/4 p0, 1
    return p0
  :L13
  .line 1139
    nop
  .line 1140
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L14
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L14
  .line 1133
    return v0
  :L15
  .line 1136
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
  .line 1137
    nop
  .line 1139
    if-eqz v1, :L22
  :L19
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L20
    goto :L22
  :L21
    move-exception p0
  :L22
  .line 1140
    if-eqz v4, :L23
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L23
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L23
  .line 1137
    return v0
  :L24
  .line 1117
    return v0
.end method

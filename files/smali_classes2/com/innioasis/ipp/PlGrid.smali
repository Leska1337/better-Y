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
    Lcom/innioasis/ipp/PlGrid$Repaint;,
    Lcom/innioasis/ipp/PlGrid$Snap;,
    Lcom/innioasis/ipp/PlGrid$Tidy;
  }
.end annotation

.field private final static BUSY_MAX_MS:J = 800L

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
  .line 312
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->movers:Ljava/util/WeakHashMap;
  .line 946
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->UI:Landroid/os/Handler;
  .line 978
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->multiFields:Ljava/util/HashMap;
  .line 1008
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/Hashtable;
  .line 1233
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

.method static synthetic access$1000()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 56
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$1100(Ljava/util/UUID;)Ljava/io/File;
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$1200()Ljava/util/Hashtable;
  .registers 1
  .line 56
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/Hashtable;
    return-object v0
.end method

.method static synthetic access$1300(Landroid/graphics/Bitmap;)Z
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->oversized(Landroid/graphics/Bitmap;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$1600(Ljava/util/UUID;)Ljava/lang/String;
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

.method static synthetic access$1700(Ljava/util/UUID;)Ljava/io/File;
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p0
    return-object p0
.end method

.method static synthetic access$1800(Ljava/util/UUID;)V
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

.method static synthetic access$600(I)I
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->overEdge(I)I
    move-result p0
    return p0
.end method

.method static synthetic access$700(Landroid/content/Context;)Z
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->multiMode(Landroid/content/Context;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$800()Z
  .registers 1
  .line 56
    sget-boolean v0, Lcom/innioasis/ipp/PlGrid;->menuMulti:Z
    return v0
.end method

.method static synthetic access$900(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 1
  .line 56
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->firsts(Landroidx/recyclerview/widget/RecyclerView;)V
    return-void
.end method

.method private static adapter(Landroid/content/Context;)Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .catchall { :L0 .. :L3 } :L5
  .registers 4
  .line 964
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/PlGrid;->adapterField:Ljava/lang/reflect/Field;
    if-nez v1, :L1
  .line 965
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    const-string v2, "adapter$delegate"
    invoke-virtual { v1, v2 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 966
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 967
    sput-object v1, Lcom/innioasis/ipp/PlGrid;->adapterField:Ljava/lang/reflect/Field;
  :L1
  .line 969
    sget-object v1, Lcom/innioasis/ipp/PlGrid;->adapterField:Ljava/lang/reflect/Field;
    invoke-virtual { v1, p0 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 970
    instance-of v1, p0, Lkotlin/Lazy;
    if-eqz v1, :L2
    check-cast p0, Lkotlin/Lazy;
    invoke-interface { p0 }, Lkotlin/Lazy;->getValue()Ljava/lang/Object;
    move-result-object p0
  :L2
  .line 971
    instance-of v1, p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L4
    check-cast p0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  :L3
    move-object v0, p0
  :L4
    return-object v0
  :L5
  .line 972
    move-exception p0
  .line 973
    return-object v0
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;ZZ)Z
  .catchall { :L2 .. :L29 } :L30
  .registers 19
  .line 747
    move-object v0, p0
    move-object/from16 v1, p1
    const/4 v2, 0
    if-nez v0, :L0
    return v2
  :L0
  .line 748
    const v3, 2131362091
    invoke-virtual { p0, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v3
  .line 749
    instance-of v4, v3, Landroidx/cardview/widget/CardView;
    if-nez v4, :L1
  .line 752
    const v3, 2131362561
    invoke-virtual { p0, v3, v1 }, Landroid/view/View;->setTag(ILjava/lang/Object;)V
  .line 753
    return v2
  :L1
  .line 755
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
  .line 757
    const/4 v9, 1
  :L2
    check-cast v3, Landroidx/cardview/widget/CardView;
  .line 758
    const v4, 2131361934
    invoke-virtual { p0, v4 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroidx/cardview/widget/CardView;
  .line 759
    const v5, 2131362087
    invoke-virtual { p0, v5 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v5
    check-cast v5, Landroid/widget/ImageView;
  .line 760
    const v6, 2131362437
    invoke-virtual { p0, v6 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v6
    check-cast v6, Landroid/widget/TextView;
  .line 761
    const v10, 2131362090
    invoke-virtual { p0, v10 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v10
    check-cast v10, Landroid/widget/ImageView;
  .line 762
    instance-of v11, v1, Lcom/innioasis/y1/database/Playlist;
    const/4 v12, 0
    if-eqz v11, :L3
    check-cast v1, Lcom/innioasis/y1/database/Playlist;
    move-object v11, v1
    goto :L4
  :L3
    move-object v11, v12
  :L4
  .line 764
    if-nez v11, :L5
    const-string v1, ""
    goto :L6
  :L5
    invoke-virtual { v11 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v1
  :L6
    invoke-virtual { v6, v1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 765
    invoke-static { v6 }, Lcom/innioasis/ipp/Theme;->tileName(Landroid/widget/TextView;)V
  .line 766
    invoke-static { v3, v4, v6 }, Lcom/innioasis/ipp/Theme;->tileFit(Landroid/view/View;Landroid/view/View;Landroid/widget/TextView;)V
  .line 770
    invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
  .line 771
    invoke-static { v1 }, Lcom/innioasis/ipp/PlGrid;->adapter(Landroid/content/Context;)Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    move-result-object v13
  .line 774
    if-nez v13, :L7
    goto :L8
  :L7
    invoke-virtual { v13 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v12
  :L8
  .line 775
    if-eqz v12, :L9
    invoke-interface { v12 }, Ljava/util/List;->isEmpty()Z
    move-result v12
    if-eqz v12, :L10
  :L9
    sput-boolean v2, Lcom/innioasis/ipp/PlGrid;->menuMulti:Z
  :L10
  .line 776
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
  .line 777
    sget-boolean v12, Lcom/innioasis/ipp/PlGrid;->lastMulti:Z
    if-eq v1, v12, :L14
  .line 779
    sput-boolean v1, Lcom/innioasis/ipp/PlGrid;->lastMulti:Z
  .line 780
    if-eqz v13, :L14
    sget-object v12, Lcom/innioasis/ipp/PlGrid;->UI:Landroid/os/Handler;
    new-instance v14, Lcom/innioasis/ipp/PlGrid$Rebind;
    invoke-direct { v14, v13 }, Lcom/innioasis/ipp/PlGrid$Rebind;-><init>(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)V
    invoke-virtual { v12, v14 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L14
  .line 784
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
  .line 785
    if-eqz p2, :L18
    if-eqz v12, :L18
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileFrame()I
    move-result v14
    goto :L19
  :L18
    const/4 v14, 0
  :L19
    invoke-virtual { v3, v14 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 786
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
  .line 788
    if-eqz p2, :L21
    if-nez p3, :L21
    if-eqz v13, :L21
    invoke-virtual { v13 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v3
    if-eqz v3, :L21
  .line 789
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
  .line 791
    move/from16 v3, p3
  :L22
    if-eqz v1, :L25
    if-eqz v11, :L25
    invoke-static { v11 }, Lcom/innioasis/ipp/Playlists;->locked(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L25
  .line 792
    invoke-virtual { v10, v2 }, Landroid/widget/ImageView;->setVisibility(I)V
  .line 793
    if-eqz v3, :L23
  .line 794
    const v1, 2131231034
    goto :L24
  :L23
    const v1, 2131231033
  :L24
  .line 793
    invoke-virtual { v10, v1 }, Landroid/widget/ImageView;->setImageResource(I)V
    goto :L26
  :L25
  .line 796
    const/16 v1, 8
    invoke-virtual { v10, v1 }, Landroid/widget/ImageView;->setVisibility(I)V
  :L26
  .line 799
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
  .line 801
    goto :L31
  :L30
  .line 800
    move-exception v0
  :L31
  .line 802
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sub-long/2addr v0, v7
  .line 803
    const-wide/16 v2, 3
    cmp-long v4, v0, v2
    if-ltz v4, :L32
    const-string v2, "tile"
    invoke-static { v2, v7, v8 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L32
  .line 804
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
  .line 805
    return v9
.end method

.method public static blinkEdge(Landroid/view/View;Z)V
  .registers 4
  .line 863
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    const v1, 2131361934
    invoke-virtual { p0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object p0
  :L1
  .line 864
    if-nez p0, :L2
    goto :L3
  :L2
    const v0, 2131362561
    invoke-virtual { p0, v0 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v0
  :L3
  .line 865
    instance-of v1, p0, Landroidx/cardview/widget/CardView;
    if-eqz v1, :L7
    instance-of v1, v0, Ljava/lang/Integer;
    if-nez v1, :L4
    goto :L7
  :L4
  .line 866
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
  .line 867
    return-void
  :L7
  .line 865
    return-void
.end method

.method public static busy(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L3 } :L6
  .registers 11
  .line 324
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/ipp/PlGrid;->movers:Ljava/util/WeakHashMap;
    invoke-virtual { v1 }, Ljava/util/WeakHashMap;->isEmpty()Z
    move-result v2
    if-eqz v2, :L1
    return v0
  :L1
  .line 325
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 326
    invoke-virtual { v1 }, Ljava/util/WeakHashMap;->entrySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L2
  .line 327
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L5
  .line 328
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 329
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Landroidx/recyclerview/widget/RecyclerView;
  .line 330
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/ipp/PlGrid$Mover;
  .line 331
    if-eqz v5, :L4
    if-eqz v4, :L4
    invoke-static { v4 }, Lcom/innioasis/ipp/PlGrid$Mover;->access$300(Lcom/innioasis/ipp/PlGrid$Mover;)Z
    move-result v6
    if-eqz v6, :L4
    invoke-static { v4 }, Lcom/innioasis/ipp/PlGrid$Mover;->access$400(Lcom/innioasis/ipp/PlGrid$Mover;)Z
    move-result v6
    if-eqz v6, :L4
    invoke-static { v4 }, Lcom/innioasis/ipp/PlGrid$Mover;->access$500(Lcom/innioasis/ipp/PlGrid$Mover;)J
    move-result-wide v6
    sub-long v6, v2, v6
    const-wide/16 v8, 800
    cmp-long v4, v6, v8
    if-gez v4, :L4
  .line 332
    invoke-virtual { v5 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v4
    if-ne v4, p0, :L4
    invoke-virtual { v5 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v4
  :L3
    if-eqz v4, :L4
    const/4 p0, 1
    return p0
  :L4
  .line 333
    goto :L2
  :L5
  .line 335
    goto :L7
  :L6
  .line 334
    move-exception p0
  :L7
  .line 336
    return v0
.end method

.method private static cardColor(Landroidx/cardview/widget/CardView;I)V
  .registers 5
  .line 871
    const v0, 2131361934
    invoke-virtual { p0, v0 }, Landroidx/cardview/widget/CardView;->getTag(I)Ljava/lang/Object;
    move-result-object v1
  .line 872
    instance-of v2, v1, Ljava/lang/Integer;
    if-eqz v2, :L0
    check-cast v1, Ljava/lang/Integer;
    invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
    move-result v1
    if-ne v1, p1, :L0
    return-void
  :L0
  .line 873
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { p0, v0, v1 }, Landroidx/cardview/widget/CardView;->setTag(ILjava/lang/Object;)V
  .line 874
    invoke-virtual { p0, p1 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 875
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
  .line 1328
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
  .line 1330
    invoke-interface { p0 }, Landroid/database/Cursor;->moveToFirst()Z
    move-result v0
    if-eqz v0, :L1
    invoke-interface { p0, v2 }, Landroid/database/Cursor;->getInt(I)I
    move-result v2
  :L1
  .line 1332
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 1330
    return v2
  :L2
  .line 1332
    move-exception v0
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 1333
    throw v0
.end method

.method private static cover(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)Landroid/graphics/Bitmap;
  .registers 11
  .line 1023
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/PlGrid;->loading:Z
  .line 1024
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/io/File;->lastModified()J
    move-result-wide v1
  .line 1025
    const-wide/16 v3, 0
    const/4 v5, 0
    cmp-long v6, v1, v3
    if-nez v6, :L0
    return-object v5
  :L0
  .line 1026
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/Hashtable;
    invoke-virtual { v3, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, [Ljava/lang/Object;
  .line 1027
    const/4 v4, 1
    if-eqz v3, :L2
    aget-object v6, v3, v0
    check-cast v6, Ljava/lang/Long;
    invoke-virtual { v6 }, Ljava/lang/Long;->longValue()J
    move-result-wide v6
    cmp-long v8, v6, v1
    if-nez v8, :L2
  .line 1029
    aget-object v1, v3, v4
    check-cast v1, Landroid/graphics/Bitmap;
    invoke-static { v1 }, Lcom/innioasis/ipp/PlGrid;->oversized(Landroid/graphics/Bitmap;)Z
    move-result v1
    if-eqz v1, :L1
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/PlGrid$Decoder;->want(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;Z)V
  :L1
  .line 1030
    aget-object p0, v3, v4
    check-cast p0, Landroid/graphics/Bitmap;
    return-object p0
  :L2
  .line 1032
    sput-boolean v4, Lcom/innioasis/ipp/PlGrid;->loading:Z
  .line 1033
    invoke-static { p0, p1, v4 }, Lcom/innioasis/ipp/PlGrid$Decoder;->want(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 1034
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
  .line 170
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/PlGrid;->cursor(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 171
    return-void
.end method

.method private static cursor(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .registers 4
  .line 180
    if-eqz p0, :L2
    invoke-static { }, Lcom/innioasis/ipp/Anim;->on()Z
    move-result v0
    if-nez v0, :L0
    goto :L2
  :L0
  .line 181
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Wheel;->glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 182
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->movers:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    if-nez v1, :L1
  .line 183
    new-instance v1, Lcom/innioasis/ipp/PlGrid$Mover;
    invoke-direct { v1, p1 }, Lcom/innioasis/ipp/PlGrid$Mover;-><init>(Z)V
  .line 184
    invoke-virtual { v0, p0, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 185
    invoke-virtual { p0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  :L1
  .line 187
    new-instance p1, Lcom/innioasis/ipp/PlGrid$Warm;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/PlGrid$Warm;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    const-wide/16 v0, 400
    invoke-virtual { p0, p1, v0, v1 }, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 188
    return-void
  :L2
  .line 180
    return-void
.end method

.method static cursorAt(Landroidx/recyclerview/widget/RecyclerView;)I
  .registers 3
  .line 215
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  .line 216
    instance-of v1, v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v1, :L0
    check-cast v0, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-virtual { v0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p0
    return p0
  :L0
  .line 217
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object p0
  .line 218
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
  .line 223
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 225
    move-object v1, p0
  :L1
    if-eqz v1, :L4
  .line 226
    instance-of v2, v1, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v2, :L2
  .line 227
    invoke-virtual { v1 }, Landroid/view/View;->invalidate()V
  .line 228
    goto :L4
  :L2
  .line 225
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
  .line 231
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
  .line 1310
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->dbField:Ljava/lang/reflect/Field;
    if-nez v0, :L0
  .line 1311
    const-class v0, Lcom/innioasis/y1/database/Y1Repository;
    const-string v1, "database"
    invoke-virtual { v0, v1 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v0
  .line 1312
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 1313
    sput-object v0, Lcom/innioasis/ipp/PlGrid;->dbField:Ljava/lang/reflect/Field;
  :L0
  .line 1315
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->dbField:Ljava/lang/reflect/Field;
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/room/RoomDatabase;
    return-object v0
.end method

.method public static deleted(Ljava/lang/Object;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 2
  :L0
  .line 1211
    instance-of v0, p0, Lcom/innioasis/y1/database/Playlist;
    if-nez v0, :L1
    return-void
  :L1
  .line 1212
    check-cast p0, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p0
  .line 1213
    if-nez p0, :L2
    return-void
  :L2
  .line 1214
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  .line 1215
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  .line 1216
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 1218
    goto :L5
  :L4
  .line 1217
    move-exception p0
  :L5
  .line 1219
    return-void
.end method

.method static dir()Ljava/io/File;
  .registers 3
  .line 996
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
    const-string v2, "playlists"
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v0
.end method

.method private static edge(I)I
  .registers 2
  .line 878
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
  .line 1236
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->tried:Ljava/util/HashSet;
    monitor-enter v0
  :L0
  .line 1237
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1238
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 1239
    monitor-exit v0
  :L2
  .line 1240
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L3
    return-void
  :L3
  .line 1241
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/PlGrid$First;
    invoke-direct { v1, p0, p1 }, Lcom/innioasis/ipp/PlGrid$First;-><init>(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 1242
    return-void
  :L4
  .line 1239
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
  .line 1319
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
  .line 1321
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
  .line 1323
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 1321
    return-object v0
  :L4
  .line 1323
    move-exception v0
    invoke-interface { p0 }, Landroid/database/Cursor;->close()V
  .line 1324
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
  .line 715
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 716
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  .line 717
    if-nez v0, :L2
    return-void
  :L2
  .line 718
    const/4 v1, 0
  :L3
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L14
  .line 719
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
  .line 720
    instance-of v3, v2, Lcom/innioasis/y1/database/Playlist;
    if-eqz v3, :L13
    invoke-static { v2 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L4
    goto :L13
  :L4
  .line 721
    check-cast v2, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v2
  .line 722
    if-eqz v2, :L13
    invoke-static { v2 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L5
    goto :L13
  :L5
  .line 723
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->tried:Ljava/util/HashSet;
    monitor-enter v3
  :L6
  .line 724
    invoke-virtual { v3, v2 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L7
    monitor-exit v3
    goto :L13
  :L7
  .line 725
    invoke-virtual { v3, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 726
    monitor-exit v3
  :L8
  .line 727
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
  .line 726
    move-exception p0
  :L11
    monitor-exit v3
  :L12
    throw p0
  :L13
  .line 718
    add-int/lit8 v1, v1, 1
    goto :L3
  :L14
  .line 730
    goto :L16
  :L15
  .line 729
    move-exception p0
  :L16
  .line 731
    return-void
.end method

.method private static fresh(Ljava/util/UUID;)V
  .registers 3
  .line 1168
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
  .line 1169
    return-void
.end method

.method public static fromPhoto(Landroid/app/Activity;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 6
  .line 1464
    if-eqz p0, :L8
    if-nez p1, :L0
    goto :L8
  :L0
  .line 1465
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v0
  .line 1466
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
    goto :L5
  :L1
  .line 1467
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1468
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
  .line 1470
    new-instance v2, Lcom/innioasis/music/util/SubMenuDialog;
    new-instance v3, Lcom/innioasis/ipp/PlGrid$PhotoPick;
    invoke-direct { v3, p0, v0, p1 }, Lcom/innioasis/ipp/PlGrid$PhotoPick;-><init>(Landroid/app/Activity;Ljava/util/List;Ljava/lang/String;)V
    const p1, 2131886360
    invoke-direct { v2, p0, v1, v3, p1 }, Lcom/innioasis/music/util/SubMenuDialog;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/innioasis/music/util/SubMenuDialog$Callback;I)V
    invoke-virtual { v2 }, Lcom/innioasis/music/util/SubMenuDialog;->show()V
  :L4
  .line 1472
    goto :L7
  :L5
  .line 1466
    return-void
  :L6
  .line 1471
    move-exception p0
  :L7
  .line 1473
    return-void
  :L8
  .line 1464
    return-void
.end method

.method public static hasCover(Ljava/lang/Object;)Z
  .registers 2
  .line 1172
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
  .line 928
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
  .line 929
    move-exception p0
  .line 930
    return v0
  :L3
  .line 928
    return v0
.end method

.method static holds(Landroidx/recyclerview/widget/RecyclerView;I)Z
  .registers 3
  .line 209
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->movers:Ljava/util/WeakHashMap;
    invoke-virtual { v0, p0 }, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 210
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
  .line 1000
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
  .line 735
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L0
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;
  .line 736
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p0
    instance-of p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;
    if-eqz p0, :L0
  .line 737
    const p0, 2131558622
    return p0
  :L0
  .line 739
    return p1
.end method

.method public static listRow(Landroid/view/View;)V
  .catchall { :L1 .. :L9 } :L10
  .registers 7
  .line 895
    if-nez p0, :L0
    return-void
  :L0
  .line 896
    const v0, 2131362491
  :L1
    invoke-virtual { p0, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 897
    instance-of v1, v0, Landroid/widget/TextView;
    if-nez v1, :L2
    return-void
  :L2
  .line 898
    check-cast v0, Landroid/widget/TextView;
  .line 900
    const v1, 2131362561
    invoke-virtual { p0, v1 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result p0
    const/4 v1, 0
    const/4 v2, 0
    if-nez p0, :L4
  .line 901
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    move-result-object p0
    aget-object p0, p0, v1
    if-eqz p0, :L3
    invoke-virtual { v0, v2, v2, v2, v2 }, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 902
    return-void
  :L4
  .line 904
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
  .line 905
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v3, :L5
    sget v3, Lcom/innioasis/ipp/PlGrid;->heartColor:I
    if-eq p0, v3, :L8
  :L5
  .line 906
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
    if-nez v3, :L6
  .line 907
    invoke-virtual { v0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const v4, 2131623988
    invoke-static { v3, v4 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    move-result-object v3
    sput-object v3, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
  :L6
  .line 909
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
    if-nez v3, :L7
    return-void
  :L7
  .line 910
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;
    move-result-object v4
    sget-object v5, Lcom/innioasis/ipp/PlGrid;->heart:Landroid/graphics/Bitmap;
    invoke-direct { v3, v4, v5 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
  .line 911
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { v3, p0, v4 }, Landroid/graphics/drawable/BitmapDrawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  .line 912
    sput-object v3, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
  .line 913
    sput p0, Lcom/innioasis/ipp/PlGrid;->heartColor:I
  :L8
  .line 915
    invoke-virtual { v0 }, Landroid/widget/TextView;->getTextSize()F
    move-result p0
    invoke-static { p0 }, Ljava/lang/Math;->round(F)I
    move-result p0
  .line 916
    sget-object v3, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v3, v1, v1, p0, p0 }, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V
  .line 917
    div-int/lit8 p0, p0, 4
    invoke-virtual { v0, p0 }, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V
  .line 918
    invoke-virtual { v0 }, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    move-result-object p0
    aget-object p0, p0, v1
    sget-object v1, Lcom/innioasis/ipp/PlGrid;->heartDrawable:Landroid/graphics/drawable/BitmapDrawable;
    if-eq p0, v1, :L9
  .line 919
    invoke-virtual { v0, v1, v2, v2, v2 }, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
  :L9
  .line 922
    goto :L11
  :L10
  .line 921
    move-exception p0
  :L11
  .line 923
    return-void
.end method

.method static memBytes()J
  .registers 2
  .line 1011
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
  .line 1339
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-eqz v0, :L6
    instance-of v0, p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez v0, :L1
    goto :L6
  :L1
  .line 1340
    check-cast p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    invoke-static { p1 }, Lcom/innioasis/ipp/PlGrid;->targets(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Ljava/util/List;
    move-result-object p1
  .line 1341
    const/4 v0, 0
  :L2
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L5
  .line 1342
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/PlGrid;->hasCover(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L4
  .line 1343
    const p1, 2131821137
    invoke-virtual { p2, p1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-interface { p0, p1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L3
  .line 1344
    return-void
  :L4
  .line 1341
    add-int/lit8 v0, v0, 1
    goto :L2
  :L5
  .line 1348
    goto :L8
  :L6
  .line 1339
    return-void
  :L7
  .line 1347
    move-exception p0
  :L8
  .line 1349
    return-void
.end method

.method private static menuBg()I
  .registers 1
  .line 935
    sget-object v0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    invoke-virtual { v0 }, Lcom/innioasis/y1/theme/ThemeManager;->menuBGColor()Ljava/lang/Integer;
    move-result-object v0
  .line 936
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
  .line 1368
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/M3u;->menuPick(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
    return v1
  :L0
  .line 1369
    if-eqz p0, :L5
    if-eqz p2, :L5
    const v0, 2131821158
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p2, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L5
  :L1
  .line 1371
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->viewDialog(Landroid/app/Activity;)V
  :L2
  .line 1373
    goto :L4
  :L3
  .line 1372
    move-exception p0
  :L4
  .line 1374
    return v1
  :L5
  .line 1377
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
  .line 1380
    instance-of p2, p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-nez p2, :L8
    return v1
  :L8
  .line 1381
    check-cast p1, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
  .line 1382
    invoke-static { p1 }, Lcom/innioasis/ipp/PlGrid;->targets(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Ljava/util/List;
    move-result-object p2
  .line 1383
    nop
  .line 1384
    const/4 v2, 0
    const/4 v3, 0
  :L9
    invoke-interface { p2 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v2, v4, :L12
  .line 1385
    invoke-interface { p2, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 1386
    invoke-static { v4 }, Lcom/innioasis/ipp/PlGrid;->hasCover(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L10
    goto :L11
  :L10
  .line 1387
    check-cast v4, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/PlGrid;->reset(Ljava/util/UUID;)V
  .line 1388
    const/4 v3, 1
  :L11
  .line 1384
    add-int/lit8 v2, v2, 1
    goto :L9
  :L12
  .line 1390
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p2
    if-eqz p2, :L13
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object p2
    invoke-interface { p2 }, Ljava/util/List;->clear()V
  :L13
  .line 1391
    invoke-virtual { p1 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->notifyDataSetChanged()V
  .line 1392
    if-eqz v3, :L14
    const p1, 2131821139
    invoke-static { p0, p1, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L14
  .line 1394
    goto :L16
  :L15
  .line 1393
    move-exception p0
  :L16
  .line 1395
    return v1
  :L17
  .line 1378
    return v0
.end method

.method private static multiMode(Landroid/content/Context;)Z
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  :L0
  .line 983
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->multiFields:Ljava/util/HashMap;
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/reflect/Field;
  .line 984
    if-nez v1, :L1
  .line 985
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    const-string v2, "isMultiSelect"
    invoke-virtual { v1, v2 }, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
  .line 986
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Ljava/lang/reflect/Field;->setAccessible(Z)V
  .line 987
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
    invoke-virtual { v0, v2, v1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 989
    invoke-virtual { v1, p0 }, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z
    move-result p0
  :L2
    return p0
  :L3
  .line 990
    move-exception p0
  .line 991
    const/4 p0, 0
    return p0
.end method

.method private static none(Ljava/util/UUID;)Ljava/io/File;
  .registers 4
  .line 1004
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
  .line 1291
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
  .line 1292
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->count(Ljava/util/UUID;)I
    move-result v0
    if-eqz v0, :L2
    return-void
  :L2
  .line 1293
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  .line 1295
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->tried:Ljava/util/HashSet;
    monitor-enter v0
  :L3
  .line 1296
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
  .line 1297
    monitor-exit v0
  .line 1299
    goto :L7
  :L4
  .line 1297
    move-exception p0
    monitor-exit v0
  :L5
    throw p0
  :L6
  .line 1298
    move-exception p0
  :L7
  .line 1300
    return-void
  :L8
  .line 1291
    return-void
.end method

.method static noteMenu(Landroid/content/Context;)V
  .registers 1
  .line 944
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
  .line 945
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
  .line 883
    nop
  .line 884
    invoke-static { p0 }, Landroid/graphics/Color;->red(I)I
    move-result v0
    mul-int/lit16 v0, v0, 204
    const/16 v1, 255
    div-int/2addr v0, v1
    invoke-static { p0 }, Landroid/graphics/Color;->green(I)I
    move-result v2
    mul-int/lit16 v2, v2, 204
    div-int/2addr v2, v1
  .line 885
    invoke-static { p0 }, Landroid/graphics/Color;->blue(I)I
    move-result p0
    mul-int/lit16 p0, p0, 204
    div-int/2addr p0, v1
  .line 884
    invoke-static { v1, v0, v2, p0 }, Landroid/graphics/Color;->argb(IIII)I
    move-result p0
    return p0
.end method

.method private static oversized(Landroid/graphics/Bitmap;)Z
  .registers 2
  .line 1038
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileCardSide()I
    move-result v0
  .line 1039
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
  .line 814
    const v0, 2131362561
    invoke-virtual { p2, v0 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v1
    const/4 v2, 0
    if-nez v1, :L0
  .line 817
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual { p2, v0, v1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 818
    invoke-virtual { p2, v2 }, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V
  .line 819
    const v1, 2147483647
    invoke-virtual { p2, v1 }, Landroid/widget/ImageView;->setMaxWidth(I)V
  .line 820
    invoke-virtual { p2, v1 }, Landroid/widget/ImageView;->setMaxHeight(I)V
  :L0
  .line 822
    invoke-static { p5 }, Lcom/innioasis/ipp/PlGrid;->edge(I)I
    move-result v1
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { p1, v0, v1 }, Landroidx/cardview/widget/CardView;->setTag(ILjava/lang/Object;)V
  .line 823
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
  .line 824
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
  .line 825
    if-nez p3, :L5
    move-object p4, p5
    goto :L6
  :L5
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p4
    invoke-static { p4, p0 }, Lcom/innioasis/ipp/PlGrid;->cover(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)Landroid/graphics/Bitmap;
    move-result-object p4
  :L6
  .line 826
    if-eqz p4, :L9
  .line 827
    invoke-virtual { p2, v2 }, Landroid/widget/ImageView;->setBackgroundColor(I)V
  .line 828
    invoke-virtual { p2 }, Landroid/widget/ImageView;->clearColorFilter()V
  .line 829
    invoke-virtual { p2, v2, v2, v2, v2 }, Landroid/widget/ImageView;->setPadding(IIII)V
  .line 830
    sget-object p0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { p2, p0 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 832
    invoke-virtual { p2 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p0
    instance-of p0, p0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz p0, :L7
  .line 833
    invoke-virtual { p2 }, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object p0
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object p0
    if-eq p0, p4, :L8
  :L7
  .line 834
    invoke-virtual { p2, p4 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L8
  .line 836
    return-void
  :L9
  .line 839
    if-eqz p3, :L10
    invoke-static { p3 }, Lcom/innioasis/ipp/Playlists;->isFav(Ljava/lang/Object;)Z
    move-result p4
    if-eqz p4, :L10
    const/4 p4, 1
    goto :L11
  :L10
    const/4 p4, 0
  :L11
  .line 840
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->menuBg()I
    move-result v1
    or-int/2addr v0, v1
    invoke-virtual { p2, v0 }, Landroid/widget/ImageView;->setBackgroundColor(I)V
  .line 841
    sget-boolean v0, Lcom/innioasis/ipp/PlGrid;->loading:Z
    if-eqz v0, :L12
  .line 843
    invoke-virtual { p2, p5 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 844
    return-void
  :L12
  .line 846
    invoke-virtual { p1 }, Landroidx/cardview/widget/CardView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
  .line 847
    if-nez p1, :L13
    goto :L14
  :L13
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I
    div-int/lit8 v2, p1, 4
  :L14
  .line 848
    invoke-virtual { p2, v2, v2, v2, v2 }, Landroid/widget/ImageView;->setPadding(IIII)V
  .line 849
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { p2, p1 }, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 850
    if-eqz p4, :L15
    const p1, 2131623988
    goto :L16
  :L15
    const p1, 2131623994
  :L16
    invoke-virtual { p2, p1 }, Landroid/widget/ImageView;->setImageResource(I)V
  .line 851
    invoke-static { }, Lcom/innioasis/ipp/Icons;->progressColor()I
    move-result p1
  .line 852
    if-nez p1, :L17
    const/4 p1, -1
  :L17
    sget-object p5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { p2, p1, p5 }, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
  .line 854
    if-eqz p0, :L18
    goto :L19
  :L18
    invoke-static { }, Lcom/innioasis/ipp/PlGrid$Decoder;->grid()Landroidx/recyclerview/widget/RecyclerView;
    move-result-object p0
  :L19
  .line 855
    if-eqz p3, :L20
    if-nez p4, :L20
    if-eqz p0, :L20
    invoke-virtual { p3 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object p1
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/PlGrid;->first(Ljava/util/UUID;Landroidx/recyclerview/widget/RecyclerView;)V
  :L20
  .line 856
    return-void
.end method

.method public static photoFocus(Landroidx/cardview/widget/CardView;)V
  .registers 2
  .line 192
    if-nez p0, :L0
    return-void
  :L0
  .line 193
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
  .line 197
    const/4 v0, 0
    invoke-virtual { p0, v0 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  :L2
  .line 199
    if-eqz p0, :L5
  .line 200
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :L3
  .line 201
    invoke-virtual { p0 }, Landroid/view/View;->invalidate()V
  .line 202
    goto :L5
  :L3
  .line 199
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
  .line 205
    return-void
  :L6
  .line 194
    invoke-virtual { p0 }, Landroidx/cardview/widget/CardView;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Photos;->focus(Landroid/content/Context;)I
    move-result v0
    invoke-virtual { p0, v0 }, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V
  .line 195
    return-void
.end method

.method public static photos(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 175
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/PlGrid;->cursor(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 176
    return-void
.end method

.method private static prepare(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 160
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->cursor(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 161
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid$Decoder;->attach(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 162
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/PlGrid$Prepare;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/PlGrid$Prepare;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V
    const-string p0, "ipp-pl-prepare"
    invoke-direct { v0, v1, p0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 163
    return-void
.end method

.method private static repo()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 1303
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    return-object v0
.end method

.method static reset(Ljava/util/UUID;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  :L0
  .line 1224
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  .line 1225
    sget-object v0, Lcom/innioasis/ipp/PlGrid;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 1226
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v0
  .line 1227
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
  .line 1229
    goto :L4
  :L3
  .line 1228
    move-exception p0
  :L4
  .line 1230
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
  .line 134
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->relist(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result p0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Wheel;->glides(Landroidx/recyclerview/widget/RecyclerView;Z)V
  .line 135
    sget-object p0, Lcom/innioasis/ipp/PlGrid;->movers:Ljava/util/WeakHashMap;
    invoke-virtual { p0, v0 }, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 136
    if-eqz p0, :L7
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
    invoke-virtual { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V
  :L7
  .line 137
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingLeft()I
    move-result p0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingRight()I
    move-result p1
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v3
    invoke-virtual { v0, p0, v1, p1, v3 }, Landroidx/recyclerview/widget/RecyclerView;->setPadding(IIII)V
  :L8
  .line 139
    sput-boolean v1, Lcom/innioasis/ipp/PlGrid;->lastMulti:Z
  .line 140
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 141
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectPosition()I
    move-result p0
  .line 142
    if-ltz p0, :L9
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemCount()I
    move-result p1
    if-ge p0, p1, :L9
    invoke-virtual { v0, p0 }, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V
  :L9
  .line 144
    goto :L11
  :L10
  .line 143
    move-exception p0
  :L11
  .line 145
    return-void
.end method

.method public static setup(Landroidx/recyclerview/widget/RecyclerView;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 149
    if-eqz p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->on()Z
    move-result v0
    if-nez v0, :L0
    goto :L4
  :L0
  .line 151
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v1
    const/4 v2, 3
    invoke-direct { v0, v1, v2 }, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V
    invoke-virtual { p0, v0 }, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
  .line 152
    invoke-static { p0 }, Lcom/innioasis/ipp/Theme;->tileGrid(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 153
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->prepare(Landroidx/recyclerview/widget/RecyclerView;)V
  :L1
  .line 155
    goto :L3
  :L2
  .line 154
    move-exception p0
  :L3
  .line 156
    return-void
  :L4
  .line 149
    return-void
.end method

.method public static songPick(Landroid/app/Activity;Ljava/lang/String;)Z
  .catchall { :L0 .. :L5 } :L8
  .registers 6
  .line 1404
    const/4 v0, 1
  :L0
    instance-of v1, p0, Lcom/innioasis/music/PlayListActivity;
    if-eqz v1, :L7
    if-eqz p1, :L7
  .line 1405
    const v1, 2131821136
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L1
    goto :L7
  :L1
  .line 1408
    move-object p1, p0
    check-cast p1, Lcom/innioasis/music/PlayListActivity;
  .line 1409
    invoke-virtual { p1 }, Lcom/innioasis/music/PlayListActivity;->getAdapter()Lcom/innioasis/music/adapter/SongListAdapter;
    move-result-object v1
  .line 1410
    if-nez v1, :L2
    const/4 v1, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/SongListAdapter;->getPosition()I
    move-result v2
    invoke-virtual { v1, v2 }, Lcom/innioasis/music/adapter/SongListAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  :L3
  .line 1411
    invoke-virtual { p1 }, Lcom/innioasis/music/PlayListActivity;->getPlaylist()Lcom/innioasis/y1/database/Playlist;
    move-result-object p1
  .line 1412
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-eqz v2, :L6
    if-nez p1, :L4
    goto :L6
  :L4
  .line 1413
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
  .line 1415
    goto :L9
  :L6
  .line 1412
    return v0
  :L7
  .line 1406
    const/4 p0, 0
    return p0
  :L8
  .line 1414
    move-exception p0
  :L9
  .line 1416
    return v0
.end method

.method private static targets(Lcom/innioasis/music/adapter/rv/RVBaseAdapter;)Ljava/util/List;
  .registers 5
  .line 1353
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1354
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getMultiSelectIndexes()Ljava/util/List;
    move-result-object v1
  .line 1355
    if-eqz v1, :L2
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v2
    const/4 v3, 1
    if-le v2, v3, :L2
  .line 1356
    const/4 v2, 0
  :L0
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L3
  .line 1357
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { p0, v3 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getItemByPosition(I)Ljava/lang/Object;
    move-result-object v3
  .line 1358
    if-eqz v3, :L1
    invoke-interface { v0, v3 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L1
  .line 1356
    add-int/lit8 v2, v2, 1
    goto :L0
  :L2
  .line 1360
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object v1
    if-eqz v1, :L3
  .line 1361
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;->getSelectItem()Ljava/lang/Object;
    move-result-object p0
    invoke-interface { v0, p0 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
  :L3
  .line 1363
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
  .line 1177
    const/4 v0, 0
    if-eqz p0, :L24
    if-nez p1, :L0
    goto/16 :L24
  :L0
  .line 1178
    nop
  .line 1179
    nop
  .line 1181
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
  .line 1182
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 1183
    if-nez v2, :L2
  .line 1199
    nop
  .line 1200
    nop
  .line 1183
    return v0
  :L2
  .line 1184
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v3
  .line 1185
    invoke-virtual { v3 }, Ljava/io/File;->isDirectory()Z
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v3 }, Ljava/io/File;->mkdirs()Z
    move-result v4
    if-nez v4, :L3
  .line 1199
    nop
  .line 1200
    nop
  .line 1185
    return v0
  :L3
  .line 1186
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
  .line 1187
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v4 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L5
  .line 1188
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    const/16 v6, 85
    invoke-virtual { v2, v5, v6, v3 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    move-result v5
  .line 1189
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  :L6
  .line 1190
    nop
  .line 1191
    if-eq v2, p1, :L8
  :L7
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->recycle()V
  :L8
  .line 1192
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->jpg(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p1
  .line 1193
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
  .line 1194
    invoke-static { p0 }, Lcom/innioasis/ipp/PlGrid;->none(Ljava/util/UUID;)Ljava/io/File;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L11
  .line 1195
    nop
  .line 1199
    nop
  .line 1200
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L12
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L12
  .line 1195
    const/4 p0, 1
    return p0
  :L13
  .line 1199
    nop
  .line 1200
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L14
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L14
  .line 1193
    return v0
  :L15
  .line 1196
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
  .line 1197
    nop
  .line 1199
    if-eqz v1, :L22
  :L19
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  :L20
    goto :L22
  :L21
    move-exception p0
  :L22
  .line 1200
    if-eqz v4, :L23
    invoke-virtual { v4 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L23
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L23
  .line 1197
    return v0
  :L24
  .line 1177
    return v0
.end method

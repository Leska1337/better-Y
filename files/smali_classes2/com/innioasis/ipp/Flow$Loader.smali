.class public final Lcom/innioasis/ipp/Flow$Loader;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Flow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Flow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Loader"
.end annotation

.field public final static AHEAD:I = 7

.field public final static FIRST:I = 3

.field public final static KEEP:I = 16

.field private final static SLIDES:I = 34

.field private final static SPARE:Ljava/util/ArrayList;

.field private static volatile reserve:[B

.field private final all:Landroid/graphics/Rect;

.field private blank:Landroid/graphics/Bitmap;

.field private final born:Ljava/util/Hashtable;

.field public volatile busy:Z

.field private final canvas:Landroid/graphics/Canvas;

.field private decoded:Landroid/graphics/Bitmap;

.field public volatile doneAt:J

.field public volatile doneHow:Ljava/lang/String;

.field private file:[B

.field private final filter:Landroid/graphics/Paint;

.field private volatile first:Z

.field private final flowBuf:Landroid/graphics/Bitmap;

.field private final flowCanvas:Landroid/graphics/Canvas;

.field private final from:Landroid/graphics/Rect;

.field private volatile held:Z

.field public volatile how:Ljava/lang/String;

.field private final items:Ljava/util/List;

.field private final mirrorPaint:Landroid/graphics/Paint;

.field private final onSlide:Ljava/lang/Runnable;

.field private final opts:Landroid/graphics/BitmapFactory$Options;

.field private final pool:Ljava/util/ArrayList;

.field private readArtist:Z

.field private volatile renewAt:I

.field private final scratch:[B

.field public final slides:Ljava/util/Hashtable;

.field private volatile stop:Z

.field private volatile target:I

.field private final to:Landroid/graphics/Rect;

.field private final ui:Landroid/os/Handler;

.field private final wake:Ljava/lang/Object;

.method static constructor <clinit>()V
  .registers 1
  .line 657
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroid/os/Handler;Ljava/lang/Runnable;)V
  .registers 7
  .line 591
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 567
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
  .line 569
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
  .line 574
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
  .line 575
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->doneHow:Ljava/lang/String;
  .line 579
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
  .line 583
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
  .line 585
    new-instance v0, Landroid/graphics/Canvas;
    invoke-direct { v0 }, Landroid/graphics/Canvas;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
  .line 586
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 6
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
  .line 587
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mirrorPaint()Landroid/graphics/Paint;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->mirrorPaint:Landroid/graphics/Paint;
  .line 588
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0 }, Landroid/graphics/Rect;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->from:Landroid/graphics/Rect;
  .line 589
    new-instance v0, Landroid/graphics/Rect;
    const/4 v1, 2
    const/16 v2, 182
    invoke-direct { v0, v1, v1, v2, v2 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
  .line 780
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Flow$Loader;->renewAt:I
  .line 834
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v1, 180
    invoke-static { v1, v1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->flowBuf:Landroid/graphics/Bitmap;
  .line 835
    new-instance v2, Landroid/graphics/Canvas;
    invoke-direct { v2, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    iput-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->flowCanvas:Landroid/graphics/Canvas;
  .line 836
    new-instance v0, Landroid/graphics/Rect;
    const/4 v2, 0
    invoke-direct { v0, v2, v2, v1, v1 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->all:Landroid/graphics/Rect;
  .line 891
    const/high16 v0, 0x00010000
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
  .line 892
    const/16 v0, 16384
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
  .line 893
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 592
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
  .line 593
    iput-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->ui:Landroid/os/Handler;
  .line 594
    iput-object p3, p0, Lcom/innioasis/ipp/Flow$Loader;->onSlide:Ljava/lang/Runnable;
  .line 595
    return-void
.end method

.method private build(I)V
  .registers 5
  .line 758
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Flow$Item;
  .line 763
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L0
    invoke-static { }, Lcom/innioasis/ipp/Flow;->newSlide()Landroid/graphics/Bitmap;
    move-result-object v1
    goto :L1
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v2
    add-int/lit8 v2, v2, -1
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/graphics/Bitmap;
  :L1
  .line 764
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->cover(Lcom/innioasis/ipp/Flow$Item;Landroid/graphics/Bitmap;)Z
    move-result v0
    if-eqz v0, :L2
  .line 765
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->mirrorPaint:Landroid/graphics/Paint;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Flow;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
    goto :L4
  :L2
  .line 767
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 768
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-nez v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Flow;->blank()Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
  :L3
  .line 769
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
  :L4
  .line 771
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1, v1 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 777
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->ui:Landroid/os/Handler;
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->onSlide:Ljava/lang/Runnable;
    invoke-virtual { p1, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 778
    return-void
.end method

.method private built()I
  .registers 6
  .line 670
    nop
  .line 671
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Collection;->toArray()[Ljava/lang/Object;
    move-result-object v0
  .line 672
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, v0
    if-ge v1, v3, :L2
    aget-object v3, v0, v1
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-eq v3, v4, :L1
    add-int/lit8 v2, v2, 1
  :L1
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 673
    return v2
.end method

.method private cover(Lcom/innioasis/ipp/Flow$Item;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 9
  .line 812
    const/4 v0, 0
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Flow;->coverOf(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/y1/database/Song;
    move-result-object p1
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 813
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 814
    const/4 v2, 1
    const/4 v3, 0
    if-eqz v1, :L1
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v4
    if-eqz v4, :L1
  .line 815
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->decodeSlide(Ljava/io/File;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 816
    if-eqz v1, :L1
  .line 817
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    invoke-virtual { p1, p2 }, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
  .line 818
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    const/high16 p2, 0x40000000
    invoke-virtual { p1, v1, p2, p2, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 819
    return v2
  :L1
  .line 823
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Flow$Loader;->slideSize(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    move-result v1
    if-nez v1, :L2
    return v0
  :L2
  .line 825
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->flowCanvas:Landroid/graphics/Canvas;
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
    iget-object v5, p0, Lcom/innioasis/ipp/Flow$Loader;->all:Landroid/graphics/Rect;
    invoke-virtual { v1, p2, v4, v5, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 826
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->flowBuf:Landroid/graphics/Bitmap;
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/FlowCache;->write(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
  :L3
  .line 827
    return v2
  :L4
  .line 828
    move-exception p1
  .line 829
    return v0
.end method

.method private decode(Ljava/io/File;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/IllegalArgumentException; { :L2 .. :L3 } :L4
  .registers 9
  .line 918
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->read(Ljava/io/File;)I
    move-result p1
  .line 919
    const/4 v0, 0
    if-gtz p1, :L0
    return-object v0
  :L0
  .line 920
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 921
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B
  .line 922
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 923
    const/4 v2, 1
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 924
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 925
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    const/4 v4, 0
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 926
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v3, :L7
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v3, :L1
    goto :L7
  :L1
  .line 927
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v6, 180
    invoke-static { v3, v5, v6, v6 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v3
    iput v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 928
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 929
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 931
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    if-ne v3, v2, :L2
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    if-eqz v3, :L2
  .line 932
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v3
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-ne v3, v5, :L2
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-ne v3, v5, :L2
  .line 933
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    iput-object v3, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  :L2
  .line 937
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L3
  .line 941
    goto :L5
  :L4
  .line 938
    move-exception v3
  .line 939
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 940
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v0, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L5
  .line 942
    if-eqz p1, :L6
    iget v0, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    if-ne v0, v2, :L6
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
  :L6
  .line 943
    return-object p1
  :L7
  .line 926
    return-object v0
.end method

.method private decodeSlide(Ljava/io/File;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/IllegalArgumentException; { :L2 .. :L3 } :L5
  .catchall { :L2 .. :L3 } :L4
  .registers 8
  .line 840
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->read(Ljava/io/File;)I
    move-result p1
  .line 841
    const/4 v0, 0
    if-gtz p1, :L0
    return-object v0
  :L0
  .line 842
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 843
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B
  .line 844
    const/4 v2, 1
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 845
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 846
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 847
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    const/4 v4, 0
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 848
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    const/16 v5, 180
    if-ne v3, v5, :L6
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-eq v3, v5, :L1
    goto :L6
  :L1
  .line 849
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 850
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 851
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->flowBuf:Landroid/graphics/Bitmap;
    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  :L2
  .line 853
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v2, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L3
  .line 857
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 853
    return-object p1
  :L4
  .line 857
    move-exception p1
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 858
    throw p1
  :L5
  .line 854
    move-exception p1
  .line 855
    nop
  .line 857
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 855
    return-object v0
  :L6
  .line 848
    return-object v0
.end method

.method private evict(I)V
  .registers 7
  .line 793
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->keySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v0
  .line 794
    const/4 v1, 0
  :L0
    array-length v2, v0
    if-ge v1, v2, :L2
  .line 795
    aget-object v2, v0, v1
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 796
    sub-int/2addr v2, p1
    invoke-static { v2 }, Ljava/lang/Math;->abs(I)I
    move-result v2
    const/16 v3, 16
    if-le v2, v3, :L1
  .line 797
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    aget-object v3, v0, v1
    invoke-virtual { v2, v3 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 798
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    aget-object v4, v0, v1
    invoke-virtual { v3, v4 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 799
    if-eqz v2, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-eq v2, v3, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 794
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 802
    return-void
.end method

.method private giveBack()V
  .catchall { :L0 .. :L8 } :L7
  .registers 8
  .line 677
    sget-object v0, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    monitor-enter v0
  :L0
  .line 678
    new-instance v1, Ljava/util/ArrayList;
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 679
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-virtual { v2 }, Ljava/util/Hashtable;->values()Ljava/util/Collection;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Collection;->toArray()[Ljava/lang/Object;
    move-result-object v2
  .line 680
    const/4 v3, 0
    const/4 v4, 0
  :L1
    array-length v5, v2
    if-ge v4, v5, :L3
    aget-object v5, v2, v4
    iget-object v6, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-eq v5, v6, :L2
    invoke-virtual { v1, v5 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
    add-int/lit8 v4, v4, 1
    goto :L1
  :L3
  .line 681
    nop
  :L4
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v3, v2, :L6
    sget-object v2, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v4
    const/16 v5, 34
    if-ge v4, v5, :L6
  .line 682
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L5
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 681
    add-int/lit8 v3, v3, 1
    goto :L4
  :L6
  .line 684
    monitor-exit v0
  .line 685
    return-void
  :L7
  .line 684
    move-exception v1
    monitor-exit v0
  :L8
    goto :L10
  :L9
    throw v1
  :L10
    goto :L9
.end method

.method private has(I)Z
  .registers 3
  .line 789
    if-ltz p1, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-ge p1, v0, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L0
    const/4 p1, 1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method

.method private loop()V
  .catchall { :L1 .. :L2 } :L8
  .catch Ljava/lang/InterruptedException; { :L3 .. :L4 } :L5
  .catchall { :L3 .. :L4 } :L8
  .catchall { :L6 .. :L9 } :L8
  .catchall { :L12 .. :L13 } :L19
  .catch Ljava/lang/InterruptedException; { :L14 .. :L15 } :L16
  .catchall { :L14 .. :L15 } :L19
  .catchall { :L17 .. :L20 } :L19
  .registers 4
  .line 703
    nop
  :L0
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
    if-nez v0, :L22
  .line 704
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
    if-eqz v0, :L10
  .line 705
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v0
  :L1
  .line 706
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
    if-eqz v1, :L7
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  :L2
    if-nez v1, :L7
  :L3
  .line 707
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v1 }, Ljava/lang/Object;->wait()V
  :L4
    goto :L1
  :L5
    move-exception v1
  :L6
    monitor-exit v0
    return-void
  :L7
  .line 709
    monitor-exit v0
  .line 710
    goto :L0
  :L8
  .line 709
    move-exception v1
    monitor-exit v0
  :L9
    throw v1
  :L10
  .line 712
    iget v0, p0, Lcom/innioasis/ipp/Flow$Loader;->renewAt:I
  .line 713
    if-ltz v0, :L11
  .line 714
    const/4 v1, -1
    iput v1, p0, Lcom/innioasis/ipp/Flow$Loader;->renewAt:I
  .line 715
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 716
    if-eqz v1, :L0
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v0, v2, :L0
  .line 718
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Flow$Loader;->build(I)V
  .line 719
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-eq v1, v2, :L0
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    if-eq v1, v0, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L0
  :L11
  .line 723
    iget v0, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  .line 724
    const/4 v1, 7
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->next(II)Z
    move-result v1
    if-nez v1, :L21
  .line 725
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v1
  :L12
  .line 726
    iget v2, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
    if-ne v2, v0, :L18
    iget v0, p0, Lcom/innioasis/ipp/Flow$Loader;->renewAt:I
    if-gez v0, :L18
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  :L13
    if-nez v0, :L18
  :L14
  .line 727
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->wait()V
  :L15
    goto :L18
  :L16
    move-exception v0
  :L17
    monitor-exit v1
    return-void
  :L18
  .line 729
    monitor-exit v1
    goto :L21
  :L19
    move-exception v0
    monitor-exit v1
  :L20
    throw v0
  :L21
  .line 731
    goto :L0
  :L22
  .line 732
    return-void
.end method

.method private next(II)Z
  .registers 8
  .line 737
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->evict(I)V
  .line 738
    nop
  .line 739
    const/4 v0, -1
    const/4 v1, 0
    const/4 v2, 0
  :L0
    if-gt v2, p2, :L3
    if-gez v0, :L3
  .line 740
    add-int v3, p1, v2
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/Flow$Loader;->has(I)Z
    move-result v4
    if-eqz v4, :L1
    move v0, v3
    goto :L2
  :L1
  .line 741
    sub-int v3, p1, v2
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/Flow$Loader;->has(I)Z
    move-result v4
    if-eqz v4, :L2
    move v0, v3
  :L2
  .line 739
    add-int/lit8 v2, v2, 1
    goto :L0
  :L3
  .line 743
    if-gez v0, :L4
    return v1
  :L4
  .line 744
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/ipp/Flow$Item;
  .line 745
    iget-object p2, p1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { p2 }, Lcom/innioasis/ipp/AlbumArtist;->needsRead(Ljava/lang/String;)Z
    move-result p2
    const/4 v1, 1
    if-nez p2, :L5
    iget-object p2, p1, Lcom/innioasis/ipp/Flow$Item;->year:Ljava/lang/String;
    if-nez p2, :L6
  :L5
  .line 746
    iget-object p2, p1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v2, p1, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { p2, v2 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .line 747
    iget-object p2, p1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v2, p1, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { p2, v2 }, Lcom/innioasis/ipp/Flow;->artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p2
    iput-object p2, p1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
  .line 748
    iget-object p2, p1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v2, p1, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { p2, v2 }, Lcom/innioasis/ipp/Flow;->yearOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p2
    iput-object p2, p1, Lcom/innioasis/ipp/Flow$Item;->year:Ljava/lang/String;
  .line 749
    iput-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
  :L6
  .line 751
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { p1 }, Lcom/innioasis/ipp/AlbumTags;->shown(Ljava/lang/String;)V
  .line 752
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p2
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    invoke-static { v2, v3 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v2
    invoke-virtual { p1, p2, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 753
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Flow$Loader;->build(I)V
  .line 754
    return v1
.end method

.method private read(Ljava/io/File;)I
  .catchall { :L0 .. :L3 } :L15
  .catchall { :L5 .. :L6 } :L8
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L17 .. :L18 } :L19
  .registers 9
  .line 897
    nop
  .line 899
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p1 }, Ljava/io/File;->length()J
    move-result-wide v2
  .line 900
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-lez v6, :L14
    const-wide/32 v4, 8388608
    cmp-long v6, v2, v4
    if-lez v6, :L1
    goto :L14
  :L1
  .line 901
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    array-length v4, v4
    int-to-long v4, v4
    cmp-long v6, v4, v2
    if-gez v6, :L2
    long-to-int v4, v2
    add-int/lit16 v4, v4, 16384
    new-array v4, v4, [B
    iput-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
  :L2
  .line 902
    new-instance v4, Ljava/io/FileInputStream;
    invoke-direct { v4, p1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  :L3
  .line 903
    const/4 p1, 0
  :L4
  .line 904
    int-to-long v5, p1
    cmp-long v1, v5, v2
    if-gez v1, :L9
  :L5
  .line 905
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    long-to-int v5, v2
    sub-int/2addr v5, p1
    invoke-virtual { v4, v1, p1, v5 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v1
  :L6
  .line 906
    if-gez v1, :L7
    goto :L9
  :L7
  .line 907
    add-int/2addr p1, v1
  .line 908
    goto :L4
  :L8
  .line 910
    move-exception p1
    move-object v1, v4
    goto :L16
  :L9
  .line 909
    nop
  :L10
  .line 913
    invoke-virtual { v4 }, Ljava/io/FileInputStream;->close()V
  :L11
    goto :L13
  :L12
    move-exception v0
  :L13
  .line 909
    return p1
  :L14
  .line 913
    nop
  .line 900
    return v0
  :L15
  .line 910
    move-exception p1
  :L16
  .line 911
    nop
  .line 913
    if-eqz v1, :L20
  :L17
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  :L18
    goto :L20
  :L19
    move-exception p1
  :L20
  .line 911
    return v0
.end method

.method private static room()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 696
    const/high16 v0, 0x00800000
  :L0
    new-array v0, v0, [B
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->reserve:[B
  :L1
  .line 698
    goto :L3
  :L2
  .line 697
    move-exception v0
  :L3
  .line 699
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->reserve:[B
  .line 700
    return-void
.end method

.method private slideSize(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L6 } :L7
  .registers 10
  .line 864
    nop
  .line 865
    const/4 v0, 0
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->cachedFile(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 866
    if-eqz v1, :L1
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->decode(Ljava/io/File;)Landroid/graphics/Bitmap;
    move-result-object v1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 867
    if-nez v1, :L3
  .line 869
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->trackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L3
  .line 871
    if-nez v1, :L4
    return v0
  :L4
  .line 872
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p1
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v2
  .line 874
    invoke-static { p1, v2 }, Ljava/lang/Math;->min(II)I
    move-result v3
  .line 875
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    invoke-virtual { v4, p2 }, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
  .line 876
    const/16 p2, 360
    const/4 v4, 1
    if-le v3, p2, :L5
  .line 878
    const/16 p1, 180
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 879
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
    const/high16 v2, 0x40000000
    invoke-virtual { p2, p1, v2, v2, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 880
    return v4
  :L5
  .line 882
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->from:Landroid/graphics/Rect;
    sub-int/2addr p1, v3
    div-int/lit8 v5, p1, 2
    sub-int/2addr v2, v3
    div-int/lit8 v6, v2, 2
    div-int/lit8 p1, p1, 2
    add-int/2addr p1, v3
    div-int/lit8 v2, v2, 2
    add-int/2addr v2, v3
    invoke-virtual { p2, v5, v6, p1, v2 }, Landroid/graphics/Rect;->set(IIII)V
  .line 883
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->from:Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
    invoke-virtual { p1, v1, p2, v2, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  :L6
  .line 884
    return v4
  :L7
  .line 885
    move-exception p1
  .line 886
    return v0
.end method

.method public age(I)J
  .registers 6
  .line 625
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 626
    if-nez p1, :L0
    const-wide v0, 9223372036854775807L
    goto :L1
  :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    check-cast p1, Ljava/lang/Long;
    invoke-virtual { p1 }, Ljava/lang/Long;->longValue()J
    move-result-wide v2
    sub-long/2addr v0, v2
  :L1
    return-wide v0
.end method

.method public aim(I)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 598
    iput p1, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  .line 599
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter p1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit p1
  .line 600
    return-void
  :L1
  .line 599
    move-exception v0
    monitor-exit p1
  :L2
    throw v0
.end method

.method public firstReady()Z
  .registers 2
  .line 666
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->first:Z
    return v0
.end method

.method public get(I)Landroid/graphics/Bitmap;
  .registers 3
  .line 619
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 620
    if-nez p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    check-cast p1, Landroid/graphics/Bitmap;
  :L1
    return-object p1
.end method

.method public hold(Z)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 614
    iput-boolean p1, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
  .line 615
    if-nez p1, :L3
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter p1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit p1
    goto :L3
  :L1
    move-exception v0
    monitor-exit p1
  :L2
    throw v0
  :L3
  .line 616
    return-void
.end method

.method public quit()V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 603
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  .line 604
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit v0
  .line 605
    return-void
  :L1
  .line 604
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method public renew(I)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 784
    iput p1, p0, Lcom/innioasis/ipp/Flow$Loader;->renewAt:I
  .line 785
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter p1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit p1
  .line 786
    return-void
  :L1
  .line 785
    move-exception v0
    monitor-exit p1
  :L2
    throw v0
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L14
  .catchall { :L1 .. :L3 } :L11
  .catchall { :L3 .. :L9 } :L14
  .catchall { :L12 .. :L13 } :L11
  .catchall { :L13 .. :L14 } :L14
  .registers 6
  :L0
  .line 631
    sget-object v0, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    monitor-enter v0
  :L1
  .line 632
    sget-object v1, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
    const/4 v3, 1
    const/16 v4, 34
    if-nez v2, :L2
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v2, v4, :L2
  .line 633
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v4
    sub-int/2addr v4, v3
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L1
  :L2
  .line 635
    monitor-exit v0
  :L3
  .line 636
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    if-ge v0, v4, :L4
    invoke-static { }, Lcom/innioasis/ipp/Flow$Loader;->room()V
  :L4
  .line 639
    iget v0, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  :L5
  .line 640
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
    if-nez v1, :L6
    const/4 v1, 3
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->next(II)Z
    move-result v1
    if-eqz v1, :L6
    goto :L5
  :L6
  .line 641
    iput-boolean v3, p0, Lcom/innioasis/ipp/Flow$Loader;->first:Z
  .line 642
    const/16 v0, 10
    invoke-static { v0 }, Landroid/os/Process;->setThreadPriority(I)V
  :L7
  .line 643
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->built()I
    move-result v1
    add-int/2addr v0, v1
    if-ge v0, v4, :L8
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
    if-nez v0, :L8
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-static { }, Lcom/innioasis/ipp/Flow;->newSlide()Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L7
  :L8
  .line 644
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->loop()V
  :L9
  .line 646
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
    if-eqz v0, :L10
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  :L10
  .line 647
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->giveBack()V
  .line 648
    nop
  .line 649
    return-void
  :L11
  .line 635
    move-exception v1
  :L12
    monitor-exit v0
  :L13
    throw v1
  :L14
  .line 646
    move-exception v0
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
    if-eqz v1, :L15
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  :L15
  .line 647
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->giveBack()V
  .line 648
    goto :L17
  :L16
    throw v0
  :L17
    goto :L16
.end method

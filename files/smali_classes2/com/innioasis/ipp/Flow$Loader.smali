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

.field public final static KEEP:I = 16

.field private final static SLIDES:I = 34

.field private final static SPARE:Ljava/util/ArrayList;

.field private static volatile reserve:[B

.field private final all:Landroid/graphics/Rect;

.field private blank:Landroid/graphics/Bitmap;

.field private final born:Ljava/util/Hashtable;

.field private final canvas:Landroid/graphics/Canvas;

.field private decoded:Landroid/graphics/Bitmap;

.field private file:[B

.field private final filter:Landroid/graphics/Paint;

.field private final flowBuf:Landroid/graphics/Bitmap;

.field private final flowCanvas:Landroid/graphics/Canvas;

.field private final from:Landroid/graphics/Rect;

.field private volatile held:Z

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
  .line 663
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroid/os/Handler;Ljava/lang/Runnable;)V
  .registers 7
  .line 602
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 583
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
  .line 585
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
  .line 590
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
  .line 594
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
  .line 596
    new-instance v0, Landroid/graphics/Canvas;
    invoke-direct { v0 }, Landroid/graphics/Canvas;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
  .line 597
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 6
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
  .line 598
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mirrorPaint()Landroid/graphics/Paint;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->mirrorPaint:Landroid/graphics/Paint;
  .line 599
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0 }, Landroid/graphics/Rect;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->from:Landroid/graphics/Rect;
  .line 600
    new-instance v0, Landroid/graphics/Rect;
    const/4 v1, 2
    const/16 v2, 182
    invoke-direct { v0, v1, v1, v2, v2 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
  .line 755
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Flow$Loader;->renewAt:I
  .line 808
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v1, 180
    invoke-static { v1, v1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->flowBuf:Landroid/graphics/Bitmap;
  .line 809
    new-instance v2, Landroid/graphics/Canvas;
    invoke-direct { v2, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    iput-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->flowCanvas:Landroid/graphics/Canvas;
  .line 810
    new-instance v0, Landroid/graphics/Rect;
    const/4 v2, 0
    invoke-direct { v0, v2, v2, v1, v1 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->all:Landroid/graphics/Rect;
  .line 861
    const/high16 v0, 0x00010000
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
  .line 862
    const/16 v0, 16384
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
  .line 863
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 603
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
  .line 604
    iput-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->ui:Landroid/os/Handler;
  .line 605
    iput-object p3, p0, Lcom/innioasis/ipp/Flow$Loader;->onSlide:Ljava/lang/Runnable;
  .line 606
    return-void
.end method

.method private build(I)V
  .registers 5
  .line 742
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { v0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Flow$Item;
  .line 743
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
  .line 744
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->cover(Lcom/innioasis/ipp/Flow$Item;Landroid/graphics/Bitmap;)Z
    move-result v0
    if-eqz v0, :L2
  .line 745
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->mirrorPaint:Landroid/graphics/Paint;
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Flow;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
    goto :L4
  :L2
  .line 747
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 748
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-nez v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Flow;->blank()Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
  :L3
  .line 749
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
  :L4
  .line 751
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1, v1 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 752
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->ui:Landroid/os/Handler;
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->onSlide:Ljava/lang/Runnable;
    invoke-virtual { p1, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 753
    return-void
.end method

.method private cover(Lcom/innioasis/ipp/Flow$Item;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 9
  .line 787
    const/4 v0, 0
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Flow;->coverOf(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/y1/database/Song;
    move-result-object p1
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 788
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 789
    const/4 v2, 1
    const/4 v3, 0
    if-eqz v1, :L1
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v4
    if-eqz v4, :L1
  .line 790
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->decodeSlide(Ljava/io/File;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 791
    if-eqz v1, :L1
  .line 792
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    invoke-virtual { p1, p2 }, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
  .line 793
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    const/high16 p2, 0x40000000
    invoke-virtual { p1, v1, p2, p2, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 794
    return v2
  :L1
  .line 797
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Flow$Loader;->slideSize(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    move-result v1
    if-nez v1, :L2
    return v0
  :L2
  .line 799
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->flowCanvas:Landroid/graphics/Canvas;
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
    iget-object v5, p0, Lcom/innioasis/ipp/Flow$Loader;->all:Landroid/graphics/Rect;
    invoke-virtual { v1, p2, v4, v5, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 800
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->flowBuf:Landroid/graphics/Bitmap;
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/FlowCache;->write(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
  :L3
  .line 801
    return v2
  :L4
  .line 802
    move-exception p1
  .line 803
    return v0
.end method

.method private decode(Ljava/io/File;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/IllegalArgumentException; { :L2 .. :L3 } :L4
  .registers 9
  .line 888
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->read(Ljava/io/File;)I
    move-result p1
  .line 889
    const/4 v0, 0
    if-gtz p1, :L0
    return-object v0
  :L0
  .line 890
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 891
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B
  .line 892
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 893
    const/4 v2, 1
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 894
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 895
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    const/4 v4, 0
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 896
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v3, :L7
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v3, :L1
    goto :L7
  :L1
  .line 897
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v6, 180
    invoke-static { v3, v5, v6, v6 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v3
    iput v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 898
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 899
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 901
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    if-ne v3, v2, :L2
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    if-eqz v3, :L2
  .line 902
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v3
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-ne v3, v5, :L2
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-ne v3, v5, :L2
  .line 903
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    iput-object v3, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  :L2
  .line 907
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L3
  .line 911
    goto :L5
  :L4
  .line 908
    move-exception v3
  .line 909
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 910
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v0, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L5
  .line 912
    if-eqz p1, :L6
    iget v0, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    if-ne v0, v2, :L6
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
  :L6
  .line 913
    return-object p1
  :L7
  .line 896
    return-object v0
.end method

.method private decodeSlide(Ljava/io/File;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/IllegalArgumentException; { :L2 .. :L3 } :L5
  .catchall { :L2 .. :L3 } :L4
  .registers 8
  .line 814
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->read(Ljava/io/File;)I
    move-result p1
  .line 815
    const/4 v0, 0
    if-gtz p1, :L0
    return-object v0
  :L0
  .line 816
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 817
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B
  .line 818
    const/4 v2, 1
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 819
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 820
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 821
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    const/4 v4, 0
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 822
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    const/16 v5, 180
    if-ne v3, v5, :L6
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-eq v3, v5, :L1
    goto :L6
  :L1
  .line 823
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 824
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 825
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->flowBuf:Landroid/graphics/Bitmap;
    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  :L2
  .line 827
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v2, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L3
  .line 831
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 827
    return-object p1
  :L4
  .line 831
    move-exception p1
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 832
    throw p1
  :L5
  .line 828
    move-exception p1
  .line 829
    nop
  .line 831
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 829
    return-object v0
  :L6
  .line 822
    return-object v0
.end method

.method private evict(I)V
  .registers 7
  .line 768
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->keySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v0
  .line 769
    const/4 v1, 0
  :L0
    array-length v2, v0
    if-ge v1, v2, :L2
  .line 770
    aget-object v2, v0, v1
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 771
    sub-int/2addr v2, p1
    invoke-static { v2 }, Ljava/lang/Math;->abs(I)I
    move-result v2
    const/16 v3, 16
    if-le v2, v3, :L1
  .line 772
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    aget-object v3, v0, v1
    invoke-virtual { v2, v3 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 773
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    aget-object v4, v0, v1
    invoke-virtual { v3, v4 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 774
    if-eqz v2, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-eq v2, v3, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 769
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 777
    return-void
.end method

.method private giveBack()V
  .catchall { :L0 .. :L8 } :L7
  .registers 8
  .line 666
    sget-object v0, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    monitor-enter v0
  :L0
  .line 667
    new-instance v1, Ljava/util/ArrayList;
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 668
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-virtual { v2 }, Ljava/util/Hashtable;->values()Ljava/util/Collection;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Collection;->toArray()[Ljava/lang/Object;
    move-result-object v2
  .line 669
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
  .line 670
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
  .line 671
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L5
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 670
    add-int/lit8 v3, v3, 1
    goto :L4
  :L6
  .line 673
    monitor-exit v0
  .line 674
    return-void
  :L7
  .line 673
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
  .line 764
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
  .catchall { :L16 .. :L17 } :L23
  .catch Ljava/lang/InterruptedException; { :L18 .. :L19 } :L20
  .catchall { :L18 .. :L19 } :L23
  .catchall { :L21 .. :L24 } :L23
  .registers 6
  .line 692
    nop
  :L0
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
    if-nez v0, :L28
  .line 693
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
    if-eqz v0, :L10
  .line 694
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v0
  :L1
  .line 695
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
    if-eqz v1, :L7
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  :L2
    if-nez v1, :L7
  :L3
  .line 696
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
  .line 698
    monitor-exit v0
  .line 699
    goto :L0
  :L8
  .line 698
    move-exception v1
    monitor-exit v0
  :L9
    throw v1
  :L10
  .line 701
    iget v0, p0, Lcom/innioasis/ipp/Flow$Loader;->renewAt:I
  .line 702
    const/4 v1, -1
    if-ltz v0, :L11
  .line 703
    iput v1, p0, Lcom/innioasis/ipp/Flow$Loader;->renewAt:I
  .line 704
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 705
    if-eqz v1, :L0
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v0, v2, :L0
  .line 707
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Flow$Loader;->build(I)V
  .line 708
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
  .line 712
    iget v0, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  .line 714
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Flow$Loader;->evict(I)V
  .line 715
    nop
  .line 716
    const/4 v2, 0
  :L12
    const/4 v3, 7
    if-gt v2, v3, :L15
    if-gez v1, :L15
  .line 717
    add-int v3, v0, v2
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/Flow$Loader;->has(I)Z
    move-result v4
    if-eqz v4, :L13
    move v1, v3
    goto :L14
  :L13
  .line 718
    sub-int v3, v0, v2
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/Flow$Loader;->has(I)Z
    move-result v4
    if-eqz v4, :L14
    move v1, v3
  :L14
  .line 716
    add-int/lit8 v2, v2, 1
    goto :L12
  :L15
  .line 720
    if-gez v1, :L25
  .line 721
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v2
  :L16
  .line 722
    iget v1, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
    if-ne v1, v0, :L22
    iget v0, p0, Lcom/innioasis/ipp/Flow$Loader;->renewAt:I
    if-gez v0, :L22
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  :L17
    if-nez v0, :L22
  :L18
  .line 723
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->wait()V
  :L19
    goto :L22
  :L20
    move-exception v0
  :L21
    monitor-exit v2
    return-void
  :L22
  .line 725
    monitor-exit v2
  .line 726
    goto/16 :L0
  :L23
  .line 725
    move-exception v0
    monitor-exit v2
  :L24
    throw v0
  :L25
  .line 728
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Flow$Item;
  .line 729
    iget-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumArtist;->needsRead(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L26
    iget-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->year:Ljava/lang/String;
    if-nez v2, :L27
  :L26
  .line 730
    iget-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v3, v0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .line 731
    iget-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v3, v0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Flow;->artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v2
    iput-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
  .line 732
    iget-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v3, v0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Flow;->yearOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v2
    iput-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->year:Ljava/lang/String;
  .line 733
    const/4 v2, 1
    iput-boolean v2, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
  :L27
  .line 735
    iget-object v0, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumTags;->shown(Ljava/lang/String;)V
  .line 736
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    invoke-static { v3, v4 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v3
    invoke-virtual { v0, v2, v3 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 737
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->build(I)V
  .line 738
    goto/16 :L0
  :L28
  .line 739
    return-void
.end method

.method private read(Ljava/io/File;)I
  .catchall { :L0 .. :L3 } :L15
  .catchall { :L5 .. :L6 } :L8
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L17 .. :L18 } :L19
  .registers 9
  .line 867
    nop
  .line 869
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p1 }, Ljava/io/File;->length()J
    move-result-wide v2
  .line 870
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-lez v6, :L14
    const-wide/32 v4, 8388608
    cmp-long v6, v2, v4
    if-lez v6, :L1
    goto :L14
  :L1
  .line 871
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
  .line 872
    new-instance v4, Ljava/io/FileInputStream;
    invoke-direct { v4, p1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  :L3
  .line 873
    const/4 p1, 0
  :L4
  .line 874
    int-to-long v5, p1
    cmp-long v1, v5, v2
    if-gez v1, :L9
  :L5
  .line 875
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    long-to-int v5, v2
    sub-int/2addr v5, p1
    invoke-virtual { v4, v1, p1, v5 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v1
  :L6
  .line 876
    if-gez v1, :L7
    goto :L9
  :L7
  .line 877
    add-int/2addr p1, v1
  .line 878
    goto :L4
  :L8
  .line 880
    move-exception p1
    move-object v1, v4
    goto :L16
  :L9
  .line 879
    nop
  :L10
  .line 883
    invoke-virtual { v4 }, Ljava/io/FileInputStream;->close()V
  :L11
    goto :L13
  :L12
    move-exception v0
  :L13
  .line 879
    return p1
  :L14
  .line 883
    nop
  .line 870
    return v0
  :L15
  .line 880
    move-exception p1
  :L16
  .line 881
    nop
  .line 883
    if-eqz v1, :L20
  :L17
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  :L18
    goto :L20
  :L19
    move-exception p1
  :L20
  .line 881
    return v0
.end method

.method private static room()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 685
    const/high16 v0, 0x00800000
  :L0
    new-array v0, v0, [B
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->reserve:[B
  :L1
  .line 687
    goto :L3
  :L2
  .line 686
    move-exception v0
  :L3
  .line 688
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->reserve:[B
  .line 689
    return-void
.end method

.method private slideSize(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L6 } :L7
  .registers 10
  .line 838
    nop
  .line 839
    const/4 v0, 0
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->cachedFile(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 840
    if-eqz v1, :L1
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->decode(Ljava/io/File;)Landroid/graphics/Bitmap;
    move-result-object v1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 841
    if-nez v1, :L3
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->trackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L3
  .line 842
    if-nez v1, :L4
    return v0
  :L4
  .line 843
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p1
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v2
  .line 844
    invoke-static { p1, v2 }, Ljava/lang/Math;->min(II)I
    move-result v3
  .line 845
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    invoke-virtual { v4, p2 }, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
  .line 846
    const/16 p2, 360
    const/4 v4, 1
    if-le v3, p2, :L5
  .line 848
    const/16 p1, 180
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 849
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
    const/high16 v2, 0x40000000
    invoke-virtual { p2, p1, v2, v2, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 850
    return v4
  :L5
  .line 852
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
  .line 853
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->from:Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
    invoke-virtual { p1, v1, p2, v2, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  :L6
  .line 854
    return v4
  :L7
  .line 855
    move-exception p1
  .line 856
    return v0
.end method

.method public age(I)J
  .registers 6
  .line 636
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 637
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
  .line 609
    iput p1, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  .line 610
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter p1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit p1
  .line 611
    return-void
  :L1
  .line 610
    move-exception v0
    monitor-exit p1
  :L2
    throw v0
.end method

.method public get(I)Landroid/graphics/Bitmap;
  .registers 3
  .line 630
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 631
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
  .line 625
    iput-boolean p1, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
  .line 626
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
  .line 627
    return-void
.end method

.method public quit()V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 614
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  .line 615
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit v0
  .line 616
    return-void
  :L1
  .line 615
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method public renew(I)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 759
    iput p1, p0, Lcom/innioasis/ipp/Flow$Loader;->renewAt:I
  .line 760
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter p1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit p1
  .line 761
    return-void
  :L1
  .line 760
    move-exception v0
    monitor-exit p1
  :L2
    throw v0
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L1 .. :L3 } :L8
  .catchall { :L3 .. :L6 } :L11
  .catchall { :L9 .. :L10 } :L8
  .catchall { :L10 .. :L11 } :L11
  .registers 5
  .line 641
    const/16 v0, 10
    invoke-static { v0 }, Landroid/os/Process;->setThreadPriority(I)V
  :L0
  .line 643
    sget-object v0, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    monitor-enter v0
  :L1
  .line 644
    sget-object v1, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
    const/16 v3, 34
    if-nez v2, :L2
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v2, v3, :L2
  .line 645
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    add-int/lit8 v3, v3, -1
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L1
  :L2
  .line 647
    monitor-exit v0
  :L3
  .line 648
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    if-ge v0, v3, :L4
    invoke-static { }, Lcom/innioasis/ipp/Flow$Loader;->room()V
  :L4
  .line 649
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    if-ge v0, v3, :L5
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
    if-nez v0, :L5
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-static { }, Lcom/innioasis/ipp/Flow;->newSlide()Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L4
  :L5
  .line 650
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->loop()V
  :L6
  .line 652
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
    if-eqz v0, :L7
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  :L7
  .line 653
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->giveBack()V
  .line 654
    nop
  .line 655
    return-void
  :L8
  .line 647
    move-exception v1
  :L9
    monitor-exit v0
  :L10
    throw v1
  :L11
  .line 652
    move-exception v0
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
    if-eqz v1, :L12
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  :L12
  .line 653
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->giveBack()V
  .line 654
    goto :L14
  :L13
    throw v0
  :L14
    goto :L13
.end method

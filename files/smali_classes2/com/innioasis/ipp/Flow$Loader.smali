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

.field public volatile busy:Z

.field private final canvas:Landroid/graphics/Canvas;

.field private decoded:Landroid/graphics/Bitmap;

.field public volatile doneAt:J

.field public volatile doneHow:Ljava/lang/String;

.field private file:[B

.field private final filter:Landroid/graphics/Paint;

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

.field private final scratch:[B

.field public final slides:Ljava/util/Hashtable;

.field private volatile stop:Z

.field private volatile target:I

.field private final to:Landroid/graphics/Rect;

.field private final ui:Landroid/os/Handler;

.field private final wake:Ljava/lang/Object;

.method static constructor <clinit>()V
  .registers 1
  .line 544
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroid/os/Handler;Ljava/lang/Runnable;)V
  .registers 7
  .line 478
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 459
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
  .line 461
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
  .line 466
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
  .line 470
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
  .line 472
    new-instance v0, Landroid/graphics/Canvas;
    invoke-direct { v0 }, Landroid/graphics/Canvas;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
  .line 473
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 6
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
  .line 474
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mirrorPaint()Landroid/graphics/Paint;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->mirrorPaint:Landroid/graphics/Paint;
  .line 475
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0 }, Landroid/graphics/Rect;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->from:Landroid/graphics/Rect;
  .line 476
    new-instance v0, Landroid/graphics/Rect;
    const/4 v1, 2
    const/16 v2, 182
    invoke-direct { v0, v1, v1, v2, v2 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
  .line 497
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
  .line 498
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->doneHow:Ljava/lang/String;
  .line 667
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v1, 180
    invoke-static { v1, v1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->flowBuf:Landroid/graphics/Bitmap;
  .line 668
    new-instance v2, Landroid/graphics/Canvas;
    invoke-direct { v2, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    iput-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->flowCanvas:Landroid/graphics/Canvas;
  .line 669
    new-instance v0, Landroid/graphics/Rect;
    const/4 v2, 0
    invoke-direct { v0, v2, v2, v1, v1 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->all:Landroid/graphics/Rect;
  .line 728
    const/high16 v0, 0x00010000
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
  .line 729
    const/16 v0, 16384
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
  .line 730
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 479
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
  .line 480
    iput-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->ui:Landroid/os/Handler;
  .line 481
    iput-object p3, p0, Lcom/innioasis/ipp/Flow$Loader;->onSlide:Ljava/lang/Runnable;
  .line 482
    return-void
.end method

.method private cover(Lcom/innioasis/ipp/Flow$Item;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L3 } :L4
  .registers 9
  .line 646
    const/4 v0, 0
  :L0
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 647
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 648
    const/4 v2, 1
    const/4 v3, 0
    if-eqz v1, :L1
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v4
    if-eqz v4, :L1
  .line 649
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->decodeSlide(Ljava/io/File;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 650
    if-eqz v1, :L1
  .line 651
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    invoke-virtual { p1, p2 }, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
  .line 652
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    const/high16 p2, 0x40000000
    invoke-virtual { p1, v1, p2, p2, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 653
    return v2
  :L1
  .line 656
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/Flow$Loader;->slideSize(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    move-result v1
    if-nez v1, :L2
    return v0
  :L2
  .line 658
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->flowCanvas:Landroid/graphics/Canvas;
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
    iget-object v5, p0, Lcom/innioasis/ipp/Flow$Loader;->all:Landroid/graphics/Rect;
    invoke-virtual { v1, p2, v4, v5, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 659
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->flowBuf:Landroid/graphics/Bitmap;
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/FlowCache;->write(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
  :L3
  .line 660
    return v2
  :L4
  .line 661
    move-exception p1
  .line 662
    return v0
.end method

.method private decode(Ljava/io/File;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/IllegalArgumentException; { :L2 .. :L3 } :L4
  .registers 9
  .line 755
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->read(Ljava/io/File;)I
    move-result p1
  .line 756
    const/4 v0, 0
    if-gtz p1, :L0
    return-object v0
  :L0
  .line 757
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 758
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B
  .line 759
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 760
    const/4 v2, 1
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 761
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 762
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    const/4 v4, 0
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 763
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v3, :L8
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v3, :L1
    goto :L8
  :L1
  .line 764
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v6, 180
    invoke-static { v3, v5, v6, v6 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v3
    iput v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 765
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 766
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 768
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    if-ne v3, v2, :L2
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    if-eqz v3, :L2
  .line 769
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v3
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-ne v3, v5, :L2
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-ne v3, v5, :L2
  .line 770
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    iput-object v3, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  :L2
  .line 774
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L3
  .line 778
    goto :L5
  :L4
  .line 775
    move-exception v3
  .line 776
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 777
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v0, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L5
  .line 779
    if-eqz p1, :L6
    iget-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
    if-eq p1, v0, :L6
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, " new-decode"
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
  :L6
  .line 780
    if-eqz p1, :L7
    iget v0, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    if-ne v0, v2, :L7
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
  :L7
  .line 781
    return-object p1
  :L8
  .line 763
    return-object v0
.end method

.method private decodeSlide(Ljava/io/File;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/IllegalArgumentException; { :L2 .. :L3 } :L5
  .catchall { :L2 .. :L3 } :L4
  .registers 8
  .line 673
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->read(Ljava/io/File;)I
    move-result p1
  .line 674
    const/4 v0, 0
    if-gtz p1, :L0
    return-object v0
  :L0
  .line 675
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 676
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B
  .line 677
    const/4 v2, 1
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 678
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 679
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 680
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    const/4 v4, 0
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 681
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    const/16 v5, 180
    if-ne v3, v5, :L6
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-eq v3, v5, :L1
    goto :L6
  :L1
  .line 682
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 683
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 684
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->flowBuf:Landroid/graphics/Bitmap;
    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  :L2
  .line 686
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v2, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 687
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->flowBuf:Landroid/graphics/Bitmap;
    if-eq p1, v2, :L3
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " new-flow"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    iput-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
  :L3
  .line 688
    nop
  .line 692
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 688
    return-object p1
  :L4
  .line 692
    move-exception p1
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 693
    throw p1
  :L5
  .line 689
    move-exception p1
  .line 690
    nop
  .line 692
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 690
    return-object v0
  :L6
  .line 681
    return-object v0
.end method

.method private evict(I)V
  .registers 7
  .line 627
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->keySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v0
  .line 628
    const/4 v1, 0
  :L0
    array-length v2, v0
    if-ge v1, v2, :L2
  .line 629
    aget-object v2, v0, v1
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 630
    sub-int/2addr v2, p1
    invoke-static { v2 }, Ljava/lang/Math;->abs(I)I
    move-result v2
    const/16 v3, 16
    if-le v2, v3, :L1
  .line 631
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    aget-object v3, v0, v1
    invoke-virtual { v2, v3 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 632
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    aget-object v4, v0, v1
    invoke-virtual { v3, v4 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 633
    if-eqz v2, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-eq v2, v3, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 628
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 636
    return-void
.end method

.method private giveBack()V
  .catchall { :L0 .. :L8 } :L7
  .registers 8
  .line 547
    sget-object v0, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    monitor-enter v0
  :L0
  .line 548
    new-instance v1, Ljava/util/ArrayList;
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 549
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-virtual { v2 }, Ljava/util/Hashtable;->values()Ljava/util/Collection;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Collection;->toArray()[Ljava/lang/Object;
    move-result-object v2
  .line 550
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
  .line 551
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
  .line 552
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L5
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 551
    add-int/lit8 v3, v3, 1
    goto :L4
  :L6
  .line 554
    monitor-exit v0
  .line 555
    return-void
  :L7
  .line 554
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
  .line 623
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
  .catchall { :L15 .. :L16 } :L22
  .catch Ljava/lang/InterruptedException; { :L17 .. :L18 } :L19
  .catchall { :L17 .. :L18 } :L22
  .catchall { :L20 .. :L23 } :L22
  .registers 9
  .line 573
    nop
  :L0
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
    if-nez v0, :L33
  .line 574
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
    if-eqz v0, :L10
  .line 575
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v0
  :L1
  .line 576
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
    if-eqz v1, :L7
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  :L2
    if-nez v1, :L7
  :L3
  .line 577
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
  .line 579
    monitor-exit v0
  .line 580
    goto :L0
  :L8
  .line 579
    move-exception v1
    monitor-exit v0
  :L9
    throw v1
  :L10
  .line 582
    iget v0, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  .line 584
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Flow$Loader;->evict(I)V
  .line 585
    nop
  .line 586
    const/4 v1, 0
    const/4 v2, -1
    const/4 v3, 0
  :L11
    const/4 v4, 7
    if-gt v3, v4, :L14
    if-gez v2, :L14
  .line 587
    add-int v4, v0, v3
    invoke-direct { p0, v4 }, Lcom/innioasis/ipp/Flow$Loader;->has(I)Z
    move-result v5
    if-eqz v5, :L12
    move v2, v4
    goto :L13
  :L12
  .line 588
    sub-int v4, v0, v3
    invoke-direct { p0, v4 }, Lcom/innioasis/ipp/Flow$Loader;->has(I)Z
    move-result v5
    if-eqz v5, :L13
    move v2, v4
  :L13
  .line 586
    add-int/lit8 v3, v3, 1
    goto :L11
  :L14
  .line 590
    if-gez v2, :L24
  .line 591
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v3
  :L15
  .line 592
    iget v1, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
    if-ne v1, v0, :L21
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  :L16
    if-nez v0, :L21
  :L17
  .line 593
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->wait()V
  :L18
    goto :L21
  :L19
    move-exception v0
  :L20
    monitor-exit v3
    return-void
  :L21
  .line 595
    monitor-exit v3
  .line 596
    goto :L0
  :L22
  .line 595
    move-exception v0
    monitor-exit v3
  :L23
    throw v0
  :L24
  .line 598
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L25
    const-string v0, " new-slide"
    goto :L26
  :L25
    const-string v0, ""
  :L26
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
  .line 599
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->busy:Z
  .line 600
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/ipp/Flow$Item;
  .line 601
    iget-object v4, v3, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v4 }, Lcom/innioasis/ipp/AlbumArtist;->needsRead(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L27
  .line 602
    iget-object v4, v3, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v5, v3, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    iget-object v6, v3, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v7, v3, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v6, v7 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-static { v4, v5, v6 }, Lcom/innioasis/ipp/Flow;->artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    iput-object v4, v3, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
  .line 603
    iput-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
  :L27
  .line 605
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v4 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v4
    if-eqz v4, :L28
    invoke-static { }, Lcom/innioasis/ipp/Flow;->newSlide()Landroid/graphics/Bitmap;
    move-result-object v0
    goto :L29
  :L28
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v4 }, Ljava/util/ArrayList;->size()I
    move-result v5
    sub-int/2addr v5, v0
    invoke-virtual { v4, v5 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/graphics/Bitmap;
  :L29
  .line 606
    invoke-direct { p0, v3, v0 }, Lcom/innioasis/ipp/Flow$Loader;->cover(Lcom/innioasis/ipp/Flow$Item;Landroid/graphics/Bitmap;)Z
    move-result v3
    if-eqz v3, :L30
  .line 607
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->mirrorPaint:Landroid/graphics/Paint;
    invoke-static { v3, v0, v4 }, Lcom/innioasis/ipp/Flow;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Paint;)V
    goto :L32
  :L30
  .line 609
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v3, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 610
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-nez v0, :L31
    invoke-static { }, Lcom/innioasis/ipp/Flow;->blank()Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
  :L31
  .line 611
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
  :L32
  .line 613
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    invoke-static { v5, v6 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v5
    invoke-virtual { v3, v4, v5 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 614
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v3, v2, v0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 615
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->doneHow:Ljava/lang/String;
  .line 616
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    iput-wide v2, p0, Lcom/innioasis/ipp/Flow$Loader;->doneAt:J
  .line 617
    iput-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->busy:Z
  .line 618
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->onSlide:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 619
    goto/16 :L0
  :L33
  .line 620
    return-void
.end method

.method private read(Ljava/io/File;)I
  .catchall { :L0 .. :L3 } :L15
  .catchall { :L5 .. :L6 } :L8
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L17 .. :L18 } :L19
  .registers 9
  .line 734
    nop
  .line 736
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p1 }, Ljava/io/File;->length()J
    move-result-wide v2
  .line 737
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-lez v6, :L14
    const-wide/32 v4, 8388608
    cmp-long v6, v2, v4
    if-lez v6, :L1
    goto :L14
  :L1
  .line 738
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
  .line 739
    new-instance v4, Ljava/io/FileInputStream;
    invoke-direct { v4, p1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  :L3
  .line 740
    const/4 p1, 0
  :L4
  .line 741
    int-to-long v5, p1
    cmp-long v1, v5, v2
    if-gez v1, :L9
  :L5
  .line 742
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    long-to-int v5, v2
    sub-int/2addr v5, p1
    invoke-virtual { v4, v1, p1, v5 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v1
  :L6
  .line 743
    if-gez v1, :L7
    goto :L9
  :L7
  .line 744
    add-int/2addr p1, v1
  .line 745
    goto :L4
  :L8
  .line 747
    move-exception p1
    move-object v1, v4
    goto :L16
  :L9
  .line 746
    nop
  :L10
  .line 750
    invoke-virtual { v4 }, Ljava/io/FileInputStream;->close()V
  :L11
    goto :L13
  :L12
    move-exception v0
  :L13
  .line 746
    return p1
  :L14
  .line 750
    nop
  .line 737
    return v0
  :L15
  .line 747
    move-exception p1
  :L16
  .line 748
    nop
  .line 750
    if-eqz v1, :L20
  :L17
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  :L18
    goto :L20
  :L19
    move-exception p1
  :L20
  .line 748
    return v0
.end method

.method private static room()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 566
    const/high16 v0, 0x00800000
  :L0
    new-array v0, v0, [B
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->reserve:[B
  :L1
  .line 568
    goto :L3
  :L2
  .line 567
    move-exception v0
  :L3
  .line 569
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->reserve:[B
  .line 570
    return-void
.end method

.method private slideSize(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L8 } :L9
  .registers 10
  .line 699
    const/4 v0, 0
  :L0
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " no-flow"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    iput-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
  .line 700
    nop
  .line 701
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->cachedFile(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 702
    if-eqz v1, :L1
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->decode(Ljava/io/File;)Landroid/graphics/Bitmap;
    move-result-object v1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 703
    if-nez v1, :L3
  .line 704
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " uncached"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    iput-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
  .line 705
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->trackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L3
  .line 707
    if-nez v1, :L4
    return v0
  :L4
  .line 708
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p1
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v2
  .line 709
    invoke-static { p1, v2 }, Ljava/lang/Math;->min(II)I
    move-result v3
  .line 710
    const/16 v4, 300
    if-ne p1, v4, :L5
    if-eq v2, v4, :L6
  :L5
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v5, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, "x"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    iput-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
  :L6
  .line 711
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    invoke-virtual { v4, p2 }, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
  .line 712
    const/16 p2, 360
    const/4 v4, 1
    if-le v3, p2, :L7
  .line 713
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string p2, " square"
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->how:Ljava/lang/String;
  .line 715
    const/16 p1, 180
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 716
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
    const/high16 v2, 0x40000000
    invoke-virtual { p2, p1, v2, v2, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 717
    return v4
  :L7
  .line 719
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
  .line 720
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->canvas:Landroid/graphics/Canvas;
    iget-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->from:Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
    invoke-virtual { p1, v1, p2, v2, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  :L8
  .line 721
    return v4
  :L9
  .line 722
    move-exception p1
  .line 723
    return v0
.end method

.method public age(I)J
  .registers 6
  .line 517
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 518
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
  .line 485
    iput p1, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  .line 486
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter p1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit p1
  .line 487
    return-void
  :L1
  .line 486
    move-exception v0
    monitor-exit p1
  :L2
    throw v0
.end method

.method public get(I)Landroid/graphics/Bitmap;
  .registers 3
  .line 511
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 512
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
  .line 506
    iput-boolean p1, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
  .line 507
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
  .line 508
    return-void
.end method

.method public quit()V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 490
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  .line 491
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit v0
  .line 492
    return-void
  :L1
  .line 491
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L1 .. :L3 } :L8
  .catchall { :L3 .. :L6 } :L11
  .catchall { :L9 .. :L10 } :L8
  .catchall { :L10 .. :L11 } :L11
  .registers 5
  .line 522
    const/16 v0, 10
    invoke-static { v0 }, Landroid/os/Process;->setThreadPriority(I)V
  :L0
  .line 524
    sget-object v0, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    monitor-enter v0
  :L1
  .line 525
    sget-object v1, Lcom/innioasis/ipp/Flow$Loader;->SPARE:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
    const/16 v3, 34
    if-nez v2, :L2
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v2, v3, :L2
  .line 526
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    add-int/lit8 v3, v3, -1
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L1
  :L2
  .line 528
    monitor-exit v0
  :L3
  .line 529
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    if-ge v0, v3, :L4
    invoke-static { }, Lcom/innioasis/ipp/Flow$Loader;->room()V
  :L4
  .line 530
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
  .line 531
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->loop()V
  :L6
  .line 533
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
    if-eqz v0, :L7
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  :L7
  .line 534
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->giveBack()V
  .line 535
    nop
  .line 536
    return-void
  :L8
  .line 528
    move-exception v1
  :L9
    monitor-exit v0
  :L10
    throw v1
  :L11
  .line 533
    move-exception v0
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
    if-eqz v1, :L12
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  :L12
  .line 534
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->giveBack()V
  .line 535
    goto :L14
  :L13
    throw v0
  :L14
    goto :L13
.end method

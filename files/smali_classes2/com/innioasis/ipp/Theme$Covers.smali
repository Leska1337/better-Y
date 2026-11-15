.class final Lcom/innioasis/ipp/Theme$Covers;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Theme.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Theme;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Covers"
.end annotation

.field private final todo:Ljava/util/List;

.method constructor <init>(Ljava/util/List;)V
  .registers 2
  .line 699
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Theme$Covers;->todo:Ljava/util/List;
    return-void
.end method

.method public run()V
  .catchall { :L1 .. :L7 } :L8
  .registers 10
  .line 701
    const/4 v0, 0
    const/4 v1, 0
  :L0
    iget-object v2, p0, Lcom/innioasis/ipp/Theme$Covers;->todo:Ljava/util/List;
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L10
  .line 702
    iget-object v2, p0, Lcom/innioasis/ipp/Theme$Covers;->todo:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [Ljava/lang/String;
  :L1
  .line 704
    new-instance v3, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v3 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 705
    const/4 v4, 1
    iput-boolean v4, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 706
    aget-object v5, v2, v4
    invoke-static { v5, v3 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 707
    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v5, :L9
    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v5, :L2
    goto :L9
  :L2
  .line 708
    const/4 v5, 1
  :L3
  .line 709
    iget v6, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    mul-int/lit8 v7, v5, 2
    div-int/2addr v6, v7
    const/16 v8, 80
    if-lt v6, v8, :L4
    iget v6, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    div-int/2addr v6, v7
    const/16 v8, 60
    if-lt v6, v8, :L4
    move v5, v7
    goto :L3
  :L4
  .line 710
    new-instance v3, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v3 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 711
    iput v5, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 712
    aget-object v5, v2, v4
    invoke-static { v5, v3 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 713
    if-nez v3, :L5
    goto :L9
  :L5
  .line 715
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v5
    int-to-float v5, v5
    const/high16 v6, 0x42A00000
    div-float/2addr v6, v5
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v5
    int-to-float v5, v5
    const/high16 v7, 0x42700000
    div-float/2addr v7, v5
    invoke-static { v6, v7 }, Ljava/lang/Math;->max(FF)F
    move-result v5
  .line 716
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v6
    int-to-float v6, v6
    mul-float v6, v6, v5
    invoke-static { v6 }, Ljava/lang/Math;->round(F)I
    move-result v6
    invoke-static { v4, v6 }, Ljava/lang/Math;->max(II)I
    move-result v6
  .line 717
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v7
    int-to-float v7, v7
    mul-float v7, v7, v5
    invoke-static { v7 }, Ljava/lang/Math;->round(F)I
    move-result v5
    invoke-static { v4, v5 }, Ljava/lang/Math;->max(II)I
    move-result v5
  .line 718
    invoke-static { v3, v6, v5, v4 }, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 719
    if-eq v4, v3, :L6
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->recycle()V
  :L6
  .line 720
    invoke-static { }, Lcom/innioasis/ipp/Theme;->access$000()Ljava/util/Hashtable;
    move-result-object v3
    aget-object v2, v2, v0
    invoke-virtual { v3, v2, v4 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 722
    goto :L9
  :L8
  .line 721
    move-exception v2
  :L9
  .line 701
    add-int/lit8 v1, v1, 1
    goto/16 :L0
  :L10
  .line 724
    return-void
.end method

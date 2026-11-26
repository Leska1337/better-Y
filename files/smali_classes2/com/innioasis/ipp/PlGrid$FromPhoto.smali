.class final Lcom/innioasis/ipp/PlGrid$FromPhoto;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "FromPhoto"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final id:Ljava/util/UUID;

.field private final path:Ljava/lang/String;

.method constructor <init>(Landroid/app/Activity;Ljava/util/UUID;Ljava/lang/String;)V
  .registers 4
  .line 1536
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1537
    iput-object p1, p0, Lcom/innioasis/ipp/PlGrid$FromPhoto;->a:Landroid/app/Activity;
  .line 1538
    iput-object p2, p0, Lcom/innioasis/ipp/PlGrid$FromPhoto;->id:Ljava/util/UUID;
  .line 1539
    iput-object p3, p0, Lcom/innioasis/ipp/PlGrid$FromPhoto;->path:Ljava/lang/String;
  .line 1540
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L4
  .registers 7
  .line 1543
    nop
  .line 1545
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 1546
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 1547
    iget-object v3, p0, Lcom/innioasis/ipp/PlGrid$FromPhoto;->path:Ljava/lang/String;
    invoke-static { v3, v1 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 1548
    nop
  :L1
  .line 1550
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    invoke-static { v3, v4 }, Ljava/lang/Math;->min(II)I
    move-result v3
    mul-int/lit8 v4, v2, 2
    div-int/2addr v3, v4
    const/16 v5, 200
    if-lt v3, v5, :L2
    move v2, v4
    goto :L1
  :L2
  .line 1551
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 1552
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 1553
    iget-object v2, p0, Lcom/innioasis/ipp/PlGrid$FromPhoto;->path:Ljava/lang/String;
    invoke-static { v2, v1 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 1554
    iget-object v2, p0, Lcom/innioasis/ipp/PlGrid$FromPhoto;->id:Ljava/util/UUID;
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/PlGrid;->write(Ljava/util/UUID;Landroid/graphics/Bitmap;)Z
    move-result v0
  .line 1555
    if-eqz v1, :L3
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->recycle()V
  :L3
  .line 1557
    goto :L5
  :L4
  .line 1556
    move-exception v1
  :L5
  .line 1558
    if-eqz v0, :L6
  .line 1559
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$FromPhoto;->id:Ljava/util/UUID;
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->access$2100(Ljava/util/UUID;)V
  .line 1560
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$FromPhoto;->a:Landroid/app/Activity;
    new-instance v1, Lcom/innioasis/ipp/PlGrid$Say;
    const v2, 2131821138
    invoke-direct { v1, v0, v2 }, Lcom/innioasis/ipp/PlGrid$Say;-><init>(Landroid/content/Context;I)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L6
  .line 1562
    return-void
.end method

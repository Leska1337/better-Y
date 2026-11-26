.class final Lcom/innioasis/ipp/PlGrid$FromSong;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "FromSong"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final id:Ljava/util/UUID;

.field private final path:Ljava/lang/String;

.method constructor <init>(Landroid/app/Activity;Ljava/util/UUID;Ljava/lang/String;)V
  .registers 4
  .line 1424
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1425
    iput-object p1, p0, Lcom/innioasis/ipp/PlGrid$FromSong;->a:Landroid/app/Activity;
  .line 1426
    iput-object p2, p0, Lcom/innioasis/ipp/PlGrid$FromSong;->id:Ljava/util/UUID;
  .line 1427
    iput-object p3, p0, Lcom/innioasis/ipp/PlGrid$FromSong;->path:Ljava/lang/String;
  .line 1428
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 1431
    nop
  .line 1432
    nop
  .line 1434
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$FromSong;->path:Ljava/lang/String;
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 1435
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$FromSong;->id:Ljava/util/UUID;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/PlGrid;->write(Ljava/util/UUID;Landroid/graphics/Bitmap;)Z
    move-result v1
  :L1
  .line 1437
    goto :L3
  :L2
  .line 1436
    move-exception v1
    const/4 v1, 0
  :L3
  .line 1438
    if-eqz v1, :L4
  .line 1439
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$FromSong;->id:Ljava/util/UUID;
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->access$1800(Ljava/util/UUID;)V
  .line 1440
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$FromSong;->a:Landroid/app/Activity;
    new-instance v1, Lcom/innioasis/ipp/PlGrid$Say;
    const v2, 2131821138
    invoke-direct { v1, v0, v2 }, Lcom/innioasis/ipp/PlGrid$Say;-><init>(Landroid/content/Context;I)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    goto :L5
  :L4
  .line 1441
    if-nez v0, :L5
  .line 1442
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$FromSong;->a:Landroid/app/Activity;
    new-instance v1, Lcom/innioasis/ipp/PlGrid$Say;
    const v2, 2131821140
    invoke-direct { v1, v0, v2 }, Lcom/innioasis/ipp/PlGrid$Say;-><init>(Landroid/content/Context;I)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L5
  .line 1444
    return-void
.end method

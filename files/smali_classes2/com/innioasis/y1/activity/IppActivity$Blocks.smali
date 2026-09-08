.class final Lcom/innioasis/y1/activity/IppActivity$Blocks;
.super Ljava/lang/Object;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Blocks"
.end annotation

.field private final from:[I

.field private next:I

.field private final to:[I

.method private constructor <init>([I[I)V
  .registers 3
  .line 1369
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1370
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from:[I
  .line 1371
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to:[I
  .line 1372
    return-void
.end method

.method static each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .registers 5
  .line 1376
    new-array v0, p0, [I
  .line 1377
    new-array v1, p0, [I
  .line 1378
    const/4 v2, 0
  :L0
    if-ge v2, p0, :L1
  .line 1379
    aput v2, v0, v2
  .line 1380
    add-int/lit8 v3, v2, 1
    aput v3, v1, v2
  .line 1378
    move v2, v3
    goto :L0
  :L1
  .line 1382
    new-instance p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;-><init>([I[I)V
    return-object p0
.end method

.method static folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .registers 12
  .line 1387
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 1388
    new-array v1, v0, [I
  .line 1389
    new-array v2, v0, [I
  .line 1390
    nop
  .line 1391
    nop
  .line 1392
    nop
  .line 1393
    const/4 v3, 0
    const/4 v4, 0
    move-object v8, v4
    const/4 v5, 0
    const/4 v6, 0
    const/4 v7, 0
  :L0
    if-ge v5, v0, :L7
  .line 1394
    invoke-interface { p0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
  .line 1395
    instance-of v10, v9, Lcom/innioasis/y1/database/Song;
    if-eqz v10, :L1
    check-cast v9, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v9 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    goto :L2
  :L1
    move-object v9, v4
  :L2
  .line 1396
    if-nez v9, :L3
    const-string v9, ""
    goto :L4
  :L3
    invoke-static { v9 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
  :L4
  .line 1397
    if-nez v8, :L5
  .line 1398
    move-object v8, v9
    goto :L6
  :L5
  .line 1399
    invoke-virtual { v8, v9 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v10
    if-nez v10, :L6
  .line 1400
    aput v7, v1, v6
  .line 1401
    aput v5, v2, v6
  .line 1402
    add-int/lit8 v6, v6, 1
  .line 1403
    nop
  .line 1404
    move v7, v5
    move-object v8, v9
  :L6
  .line 1393
    add-int/lit8 v5, v5, 1
    goto :L0
  :L7
  .line 1407
    if-lez v0, :L8
  .line 1408
    aput v7, v1, v6
  .line 1409
    aput v0, v2, v6
  .line 1410
    add-int/lit8 v6, v6, 1
  :L8
  .line 1412
    new-array p0, v6, [I
  .line 1413
    new-array v0, v6, [I
  .line 1414
    invoke-static { v1, v3, p0, v3, v6 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 1415
    invoke-static { v2, v3, v0, v3, v6 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 1416
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-direct { v1, p0, v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;-><init>([I[I)V
    return-object v1
.end method

.method from(I)I
  .registers 3
  .line 1423
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from:[I
    aget p1, v0, p1
    return p1
.end method

.method declared-synchronized take()I
  .catchall { :L0 .. :L1 } :L4
  .registers 3
    monitor-enter p0
  :L0
  .line 1420
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->next:I
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from:[I
    array-length v1, v1
    if-ge v0, v1, :L2
    add-int/lit8 v1, v0, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->next:I
  :L1
    goto :L3
  :L2
    const/4 v0, -1
  :L3
    monitor-exit p0
    return v0
  :L4
  .line 1420
    move-exception v0
    monitor-exit p0
    throw v0
.end method

.method to(I)I
  .registers 3
  .line 1425
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to:[I
    aget p1, v0, p1
    return p1
.end method

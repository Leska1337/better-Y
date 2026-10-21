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
  .line 1499
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1500
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from:[I
  .line 1501
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to:[I
  .line 1502
    return-void
.end method

.method static each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .registers 5
  .line 1506
    new-array v0, p0, [I
  .line 1507
    new-array v1, p0, [I
  .line 1508
    const/4 v2, 0
  :L0
    if-ge v2, p0, :L1
  .line 1509
    aput v2, v0, v2
  .line 1510
    add-int/lit8 v3, v2, 1
    aput v3, v1, v2
  .line 1508
    move v2, v3
    goto :L0
  :L1
  .line 1512
    new-instance p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;-><init>([I[I)V
    return-object p0
.end method

.method static folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .registers 12
  .line 1517
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 1518
    new-array v1, v0, [I
  .line 1519
    new-array v2, v0, [I
  .line 1520
    nop
  .line 1521
    nop
  .line 1522
    nop
  .line 1523
    const/4 v3, 0
    const/4 v4, 0
    move-object v8, v4
    const/4 v5, 0
    const/4 v6, 0
    const/4 v7, 0
  :L0
    if-ge v5, v0, :L7
  .line 1524
    invoke-interface { p0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
  .line 1525
    instance-of v10, v9, Lcom/innioasis/y1/database/Song;
    if-eqz v10, :L1
    check-cast v9, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v9 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    goto :L2
  :L1
    move-object v9, v4
  :L2
  .line 1526
    if-nez v9, :L3
    const-string v9, ""
    goto :L4
  :L3
    invoke-static { v9 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
  :L4
  .line 1527
    if-nez v8, :L5
  .line 1528
    move-object v8, v9
    goto :L6
  :L5
  .line 1529
    invoke-virtual { v8, v9 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v10
    if-nez v10, :L6
  .line 1530
    aput v7, v1, v6
  .line 1531
    aput v5, v2, v6
  .line 1532
    add-int/lit8 v6, v6, 1
  .line 1533
    nop
  .line 1534
    move v7, v5
    move-object v8, v9
  :L6
  .line 1523
    add-int/lit8 v5, v5, 1
    goto :L0
  :L7
  .line 1537
    if-lez v0, :L8
  .line 1538
    aput v7, v1, v6
  .line 1539
    aput v0, v2, v6
  .line 1540
    add-int/lit8 v6, v6, 1
  :L8
  .line 1542
    new-array p0, v6, [I
  .line 1543
    new-array v0, v6, [I
  .line 1544
    invoke-static { v1, v3, p0, v3, v6 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 1545
    invoke-static { v2, v3, v0, v3, v6 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 1546
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-direct { v1, p0, v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;-><init>([I[I)V
    return-object v1
.end method

.method from(I)I
  .registers 3
  .line 1553
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from:[I
    aget p1, v0, p1
    return p1
.end method

.method declared-synchronized take()I
  .catchall { :L0 .. :L1 } :L4
  .registers 3
    monitor-enter p0
  :L0
  .line 1550
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
  .line 1550
    move-exception v0
    monitor-exit p0
    throw v0
.end method

.method to(I)I
  .registers 3
  .line 1555
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to:[I
    aget p1, v0, p1
    return p1
.end method

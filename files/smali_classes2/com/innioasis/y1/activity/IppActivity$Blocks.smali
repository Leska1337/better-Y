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
  .line 1277
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1278
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from:[I
  .line 1279
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to:[I
  .line 1280
    return-void
.end method

.method static each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .registers 5
  .line 1284
    new-array v0, p0, [I
  .line 1285
    new-array v1, p0, [I
  .line 1286
    const/4 v2, 0
  :L0
    if-ge v2, p0, :L1
  .line 1287
    aput v2, v0, v2
  .line 1288
    add-int/lit8 v3, v2, 1
    aput v3, v1, v2
  .line 1286
    move v2, v3
    goto :L0
  :L1
  .line 1290
    new-instance p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;-><init>([I[I)V
    return-object p0
.end method

.method static folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .registers 12
  .line 1295
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 1296
    new-array v1, v0, [I
  .line 1297
    new-array v2, v0, [I
  .line 1298
    nop
  .line 1299
    nop
  .line 1300
    nop
  .line 1301
    const/4 v3, 0
    const/4 v4, 0
    move-object v8, v4
    const/4 v5, 0
    const/4 v6, 0
    const/4 v7, 0
  :L0
    if-ge v5, v0, :L7
  .line 1302
    invoke-interface { p0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
  .line 1303
    instance-of v10, v9, Lcom/innioasis/y1/database/Song;
    if-eqz v10, :L1
    check-cast v9, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v9 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    goto :L2
  :L1
    move-object v9, v4
  :L2
  .line 1304
    if-nez v9, :L3
    const-string v9, ""
    goto :L4
  :L3
    invoke-static { v9 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
  :L4
  .line 1305
    if-nez v8, :L5
  .line 1306
    move-object v8, v9
    goto :L6
  :L5
  .line 1307
    invoke-virtual { v8, v9 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v10
    if-nez v10, :L6
  .line 1308
    aput v7, v1, v6
  .line 1309
    aput v5, v2, v6
  .line 1310
    add-int/lit8 v6, v6, 1
  .line 1311
    nop
  .line 1312
    move v7, v5
    move-object v8, v9
  :L6
  .line 1301
    add-int/lit8 v5, v5, 1
    goto :L0
  :L7
  .line 1315
    if-lez v0, :L8
  .line 1316
    aput v7, v1, v6
  .line 1317
    aput v0, v2, v6
  .line 1318
    add-int/lit8 v6, v6, 1
  :L8
  .line 1320
    new-array p0, v6, [I
  .line 1321
    new-array v0, v6, [I
  .line 1322
    invoke-static { v1, v3, p0, v3, v6 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 1323
    invoke-static { v2, v3, v0, v3, v6 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 1324
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-direct { v1, p0, v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;-><init>([I[I)V
    return-object v1
.end method

.method from(I)I
  .registers 3
  .line 1331
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from:[I
    aget p1, v0, p1
    return p1
.end method

.method declared-synchronized take()I
  .catchall { :L0 .. :L1 } :L4
  .registers 3
    monitor-enter p0
  :L0
  .line 1328
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
  .line 1328
    move-exception v0
    monitor-exit p0
    throw v0
.end method

.method to(I)I
  .registers 3
  .line 1333
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to:[I
    aget p1, v0, p1
    return p1
.end method

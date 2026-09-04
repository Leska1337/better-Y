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
  .line 1222
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1223
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from:[I
  .line 1224
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to:[I
  .line 1225
    return-void
.end method

.method static each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .registers 5
  .line 1229
    new-array v0, p0, [I
  .line 1230
    new-array v1, p0, [I
  .line 1231
    const/4 v2, 0
  :L0
    if-ge v2, p0, :L1
  .line 1232
    aput v2, v0, v2
  .line 1233
    add-int/lit8 v3, v2, 1
    aput v3, v1, v2
  .line 1231
    move v2, v3
    goto :L0
  :L1
  .line 1235
    new-instance p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-direct { p0, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;-><init>([I[I)V
    return-object p0
.end method

.method static folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .registers 12
  .line 1240
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 1241
    new-array v1, v0, [I
  .line 1242
    new-array v2, v0, [I
  .line 1243
    nop
  .line 1244
    nop
  .line 1245
    nop
  .line 1246
    const/4 v3, 0
    const/4 v4, 0
    move-object v8, v4
    const/4 v5, 0
    const/4 v6, 0
    const/4 v7, 0
  :L0
    if-ge v5, v0, :L7
  .line 1247
    invoke-interface { p0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v9
  .line 1248
    instance-of v10, v9, Lcom/innioasis/y1/database/Song;
    if-eqz v10, :L1
    check-cast v9, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v9 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    goto :L2
  :L1
    move-object v9, v4
  :L2
  .line 1249
    if-nez v9, :L3
    const-string v9, ""
    goto :L4
  :L3
    invoke-static { v9 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
  :L4
  .line 1250
    if-nez v8, :L5
  .line 1251
    move-object v8, v9
    goto :L6
  :L5
  .line 1252
    invoke-virtual { v8, v9 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v10
    if-nez v10, :L6
  .line 1253
    aput v7, v1, v6
  .line 1254
    aput v5, v2, v6
  .line 1255
    add-int/lit8 v6, v6, 1
  .line 1256
    nop
  .line 1257
    move v7, v5
    move-object v8, v9
  :L6
  .line 1246
    add-int/lit8 v5, v5, 1
    goto :L0
  :L7
  .line 1260
    if-lez v0, :L8
  .line 1261
    aput v7, v1, v6
  .line 1262
    aput v0, v2, v6
  .line 1263
    add-int/lit8 v6, v6, 1
  :L8
  .line 1265
    new-array p0, v6, [I
  .line 1266
    new-array v0, v6, [I
  .line 1267
    invoke-static { v1, v3, p0, v3, v6 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 1268
    invoke-static { v2, v3, v0, v3, v6 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 1269
    new-instance v1, Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-direct { v1, p0, v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;-><init>([I[I)V
    return-object v1
.end method

.method from(I)I
  .registers 3
  .line 1276
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from:[I
    aget p1, v0, p1
    return p1
.end method

.method declared-synchronized take()I
  .catchall { :L0 .. :L1 } :L4
  .registers 3
    monitor-enter p0
  :L0
  .line 1273
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
  .line 1273
    move-exception v0
    monitor-exit p0
    throw v0
.end method

.method to(I)I
  .registers 3
  .line 1278
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to:[I
    aget p1, v0, p1
    return p1
.end method

.class final Lcom/innioasis/ipp/Saver$Decide;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Saver.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Saver;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Decide"
.end annotation

.field private final r:[J

.method constructor <init>([J)V
  .registers 2
  .line 218
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 219
    iput-object p1, p0, Lcom/innioasis/ipp/Saver$Decide;->r:[J
  .line 220
    return-void
.end method

.method public run()V
  .registers 20
  .line 224
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Saver;->access$602(Z)Z
  .line 225
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$400()Z
    move-result v1
    if-nez v1, :L9
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v1
    if-nez v1, :L0
    move-object/from16 v1, p0
    goto/16 :L10
  :L0
  .line 226
    move-object/from16 v1, p0
    iget-object v2, v1, Lcom/innioasis/ipp/Saver$Decide;->r:[J
    const-wide/32 v3, 60000
    if-nez v2, :L1
  .line 227
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Saver;->access$300(J)V
  .line 228
    return-void
  :L1
  .line 230
    aget-wide v5, v2, v0
    const/4 v0, 1
    aget-wide v7, v2, v0
    const/4 v0, 2
    aget-wide v9, v2, v0
    const/4 v0, 3
    aget-wide v11, v2, v0
    const/4 v0, 4
    aget-wide v13, v2, v0
  .line 231
    const-wide/16 v15, 0
    cmp-long v0, v7, v15
    if-lez v0, :L8
    const-wide/32 v17, 86400000
    cmp-long v0, v7, v17
    if-lez v0, :L2
    goto :L8
  :L2
  .line 235
    add-long/2addr v5, v7
    sub-long/2addr v5, v9
    const-wide/16 v2, 500
    sub-long/2addr v5, v2
  .line 236
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v17
  .line 237
    sub-long v5, v5, v17
    const-wide/16 v17, 100
    cmp-long v0, v5, v17
    if-lez v0, :L3
  .line 238
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Saver;->access$300(J)V
  .line 239
    return-void
  :L3
  .line 243
    invoke-static { }, Lcom/innioasis/ipp/Loading;->up()Z
    move-result v0
    if-nez v0, :L7
    invoke-static { }, Lcom/innioasis/ipp/Scan;->busy()Z
    move-result v0
    if-eqz v0, :L4
    goto :L7
  :L4
  .line 249
    const-wide/16 v4, 6
    and-long/2addr v4, v11
    cmp-long v0, v4, v15
    if-nez v0, :L6
    cmp-long v0, v13, v15
    if-eqz v0, :L6
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$1000()Z
    move-result v0
    if-nez v0, :L5
    goto :L6
  :L5
  .line 253
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$1100()V
  .line 254
    return-void
  :L6
  .line 250
    sub-long/2addr v7, v9
    sub-long/2addr v7, v2
    const-wide/16 v2, 15000
    invoke-static { v2, v3, v7, v8 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v2
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Saver;->access$300(J)V
  .line 251
    return-void
  :L7
  .line 245
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$900()V
  .line 246
    sub-long/2addr v7, v9
    sub-long/2addr v7, v2
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/Saver;->access$300(J)V
  .line 247
    return-void
  :L8
  .line 232
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Saver;->access$300(J)V
  .line 233
    return-void
  :L9
  .line 225
    move-object/from16 v1, p0
  :L10
    return-void
.end method

.class final Lcom/innioasis/ipp/Albums$Warm;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Albums.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Albums;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Warm"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 229
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L27
  .catchall { :L2 .. :L3 } :L27
  .catchall { :L4 .. :L5 } :L27
  .catchall { :L6 .. :L7 } :L27
  .catchall { :L8 .. :L9 } :L27
  .catchall { :L9 .. :L10 } :L24
  .catchall { :L10 .. :L11 } :L27
  .catchall { :L12 .. :L13 } :L27
  .catchall { :L13 .. :L14 } :L21
  .catchall { :L16 .. :L18 } :L21
  .catchall { :L19 .. :L20 } :L27
  .catchall { :L22 .. :L23 } :L21
  .catchall { :L23 .. :L24 } :L27
  .catchall { :L25 .. :L26 } :L24
  .catchall { :L26 .. :L27 } :L27
  .registers 8
  .line 232
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    invoke-virtual { v1 }, Lcom/innioasis/music/objects/Global;->getRefreshDatabaseState()Z
    move-result v1
    if-eqz v1, :L2
  .line 233
    const-wide/16 v1, 2000
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Albums;->access$000(J)V
  :L1
  .line 259
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$602(Z)Z
  .line 234
    return-void
  :L2
  .line 236
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$100()Ljava/util/List;
    move-result-object v1
  .line 237
    if-nez v1, :L4
  .line 238
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$200()Ljava/util/List;
  .line 239
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->warm()V
  .line 240
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->warm()V
  :L3
  .line 259
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$602(Z)Z
  .line 241
    return-void
  :L4
  .line 243
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v2
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$300()J
    move-result-wide v4
  :L5
    sub-long/2addr v2, v4
    const-wide/32 v4, 600000
    cmp-long v6, v2, v4
    if-gez v6, :L6
  .line 259
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$602(Z)Z
  .line 243
    return-void
  :L6
  .line 244
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v2
  :L7
  .line 245
    if-nez v2, :L8
  .line 259
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$602(Z)Z
  .line 245
    return-void
  :L8
  .line 247
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$400()Ljava/lang/Object;
    move-result-object v3
    monitor-enter v3
  :L9
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$500()I
    move-result v4
    monitor-exit v3
  :L10
  .line 248
    invoke-virtual { v2, v0 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v2
  :L11
  .line 249
    if-nez v2, :L12
  .line 259
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$602(Z)Z
  .line 249
    return-void
  :L12
  .line 250
    invoke-interface { v2, v1 }, Ljava/util/List;->equals(Ljava/lang/Object;)Z
    move-result v1
  .line 251
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$400()Ljava/lang/Object;
    move-result-object v2
    monitor-enter v2
  :L13
  .line 252
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$500()I
    move-result v3
    if-eq v4, v3, :L15
    monitor-exit v2
  :L14
  .line 259
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$602(Z)Z
  .line 252
    return-void
  :L15
  .line 253
    if-eqz v1, :L17
  :L16
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v3
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Albums;->access$302(J)J
  :L17
  .line 254
    monitor-exit v2
  :L18
  .line 256
    if-nez v1, :L28
  :L19
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L20
    goto :L28
  :L21
  .line 254
    move-exception v1
  :L22
    monitor-exit v2
  :L23
    throw v1
  :L24
  .line 247
    move-exception v1
  :L25
    monitor-exit v3
  :L26
    throw v1
  :L27
  .line 257
    move-exception v1
  :L28
  .line 259
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$602(Z)Z
  .line 260
    nop
  .line 261
    return-void
.end method

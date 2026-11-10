.class final Lcom/innioasis/ipp/AlbumTags$Fill;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "AlbumTags.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/AlbumTags;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Fill"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 217
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/AlbumTags$1;)V
  .registers 2
  .line 217
    invoke-direct { p0 }, Lcom/innioasis/ipp/AlbumTags$Fill;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L1 .. :L2 } :L22
  .catchall { :L4 .. :L5 } :L22
  .catchall { :L5 .. :L9 } :L19
  .catchall { :L9 .. :L11 } :L13
  .catchall { :L11 .. :L12 } :L19
  .catchall { :L14 .. :L15 } :L13
  .catchall { :L15 .. :L18 } :L19
  .catchall { :L23 .. :L24 } :L22
  .registers 13
  .line 219
    nop
  .line 220
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    const/4 v2, 0
    const/4 v3, 0
  :L0
  .line 223
    invoke-static { }, Lcom/innioasis/ipp/AlbumTags;->access$200()Ljava/util/LinkedHashSet;
    move-result-object v4
    monitor-enter v4
  :L1
  .line 224
    invoke-static { }, Lcom/innioasis/ipp/AlbumTags;->access$200()Ljava/util/LinkedHashSet;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/util/LinkedHashSet;->isEmpty()Z
    move-result v5
    const/4 v6, 0
    if-eqz v5, :L4
  .line 225
    invoke-static { v6 }, Lcom/innioasis/ipp/AlbumTags;->access$302(Ljava/lang/Thread;)Ljava/lang/Thread;
  .line 226
    monitor-exit v4
  :L2
  .line 254
    if-eqz v3, :L3
    invoke-static { }, Lcom/innioasis/ipp/AlbumTags;->access$600()Landroid/os/Handler;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/AlbumTags$Repaint;
    invoke-direct { v1, v6 }, Lcom/innioasis/ipp/AlbumTags$Repaint;-><init>(Lcom/innioasis/ipp/AlbumTags$1;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L3
  .line 255
    return-void
  :L4
  .line 228
    invoke-static { }, Lcom/innioasis/ipp/AlbumTags;->access$200()Ljava/util/LinkedHashSet;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;
    move-result-object v5
    invoke-interface { v5 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 229
    invoke-static { }, Lcom/innioasis/ipp/AlbumTags;->access$200()Ljava/util/LinkedHashSet;
    move-result-object v7
    invoke-virtual { v7, v5 }, Ljava/util/LinkedHashSet;->remove(Ljava/lang/Object;)Z
  .line 230
    monitor-exit v4
  :L5
  .line 232
    invoke-static { v5 }, Lcom/innioasis/ipp/AlbumTags;->of(Ljava/lang/String;)Lcom/innioasis/ipp/AlbumTags$Sum;
    move-result-object v4
  .line 233
    if-nez v4, :L6
    goto :L0
  :L6
  .line 234
    const/4 v5, 0
  :L7
    iget-object v7, v4, Lcom/innioasis/ipp/AlbumTags$Sum;->songs:Ljava/util/List;
    invoke-interface { v7 }, Ljava/util/List;->size()I
    move-result v7
    if-ge v5, v7, :L17
  .line 235
    iget-object v7, v4, Lcom/innioasis/ipp/AlbumTags$Sum;->songs:Ljava/util/List;
    invoke-interface { v7, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
  .line 236
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
  .line 237
    if-eqz v8, :L16
    invoke-static { v7 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v7
    if-nez v7, :L8
    goto :L16
  :L8
  .line 238
    invoke-static { }, Lcom/innioasis/ipp/AlbumTags;->access$400()Ljava/util/HashSet;
    move-result-object v7
    monitor-enter v7
  :L9
  .line 239
    invoke-static { }, Lcom/innioasis/ipp/AlbumTags;->access$400()Ljava/util/HashSet;
    move-result-object v9
    invoke-virtual { v9, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    move-result v9
    if-nez v9, :L10
    monitor-exit v7
    goto :L16
  :L10
  .line 240
    monitor-exit v7
  :L11
  .line 241
    invoke-static { v8, v2 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v7
    invoke-static { v8, v7 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  :L12
    goto :L16
  :L13
  .line 240
    move-exception v4
  :L14
    monitor-exit v7
  :L15
    throw v4
  :L16
  .line 234
    add-int/lit8 v5, v5, 1
    goto :L7
  :L17
  .line 243
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  :L18
  .line 244
    nop
  .line 246
    const/4 v3, 1
    goto :L20
  :L19
  .line 245
    move-exception v4
  :L20
  .line 247
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 248
    if-eqz v3, :L21
    sub-long v7, v4, v0
    const-wide/16 v9, 1000
    cmp-long v11, v7, v9
    if-ltz v11, :L21
  .line 249
    nop
  .line 250
    nop
  .line 251
    invoke-static { }, Lcom/innioasis/ipp/AlbumTags;->access$600()Landroid/os/Handler;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/AlbumTags$Repaint;
    invoke-direct { v1, v6 }, Lcom/innioasis/ipp/AlbumTags$Repaint;-><init>(Lcom/innioasis/ipp/AlbumTags$1;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    move-wide v0, v4
    const/4 v3, 0
  :L21
  .line 253
    goto/16 :L0
  :L22
  .line 230
    move-exception v0
  :L23
    monitor-exit v4
  :L24
    goto :L26
  :L25
    throw v0
  :L26
    goto :L25
.end method

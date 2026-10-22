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
  .line 723
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L27
  .catchall { :L2 .. :L3 } :L27
  .catchall { :L4 .. :L5 } :L27
  .catchall { :L6 .. :L7 } :L27
  .catchall { :L7 .. :L8 } :L24
  .catchall { :L8 .. :L9 } :L27
  .catchall { :L10 .. :L11 } :L27
  .catchall { :L11 .. :L12 } :L21
  .catchall { :L13 .. :L18 } :L21
  .catchall { :L19 .. :L20 } :L27
  .catchall { :L22 .. :L23 } :L21
  .catchall { :L23 .. :L24 } :L27
  .catchall { :L25 .. :L26 } :L24
  .catchall { :L26 .. :L27 } :L27
  .registers 7
  .line 726
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    invoke-virtual { v1 }, Lcom/innioasis/music/objects/Global;->getRefreshDatabaseState()Z
    move-result v1
    if-eqz v1, :L2
  .line 727
    const-wide/16 v1, 2000
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Albums;->access$000(J)V
  :L1
  .line 755
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 728
    return-void
  :L2
  .line 730
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$100()Ljava/util/List;
    move-result-object v1
  .line 731
    if-nez v1, :L4
  .line 732
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$200()V
  .line 733
    invoke-static { }, Lcom/innioasis/ipp/Schema;->backfill()V
  :L3
  .line 755
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 734
    return-void
  :L4
  .line 736
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$300()J
    move-result-wide v3
  :L5
    sub-long/2addr v1, v3
    const-wide/32 v3, 600000
    cmp-long v5, v1, v3
    if-gez v5, :L6
  .line 755
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 736
    return-void
  :L6
  .line 738
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$400()Ljava/lang/Object;
    move-result-object v1
    monitor-enter v1
  :L7
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$500()I
    move-result v2
    monitor-exit v1
  :L8
  .line 739
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$600()Ljava/lang/String;
    move-result-object v1
  :L9
  .line 740
    if-nez v1, :L10
  .line 755
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 740
    return-void
  :L10
  .line 742
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$400()Ljava/lang/Object;
    move-result-object v3
    monitor-enter v3
  :L11
  .line 743
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$500()I
    move-result v4
    if-eq v2, v4, :L13
    monitor-exit v3
  :L12
  .line 755
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 743
    return-void
  :L13
  .line 745
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$700()Ljava/lang/String;
    move-result-object v2
    if-eqz v2, :L15
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$700()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L14
    goto :L15
  :L14
    const/4 v2, 0
    goto :L16
  :L15
    const/4 v2, 1
  :L16
  .line 746
    if-eqz v2, :L17
  .line 747
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->access$702(Ljava/lang/String;)Ljava/lang/String;
  .line 748
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v4
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/Albums;->access$302(J)J
  :L17
  .line 750
    monitor-exit v3
  :L18
  .line 752
    if-nez v2, :L28
  :L19
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L20
    goto :L28
  :L21
  .line 750
    move-exception v1
  :L22
    monitor-exit v3
  :L23
    throw v1
  :L24
  .line 738
    move-exception v2
  :L25
    monitor-exit v1
  :L26
    throw v2
  :L27
  .line 753
    move-exception v1
  :L28
  .line 755
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 756
    nop
  .line 757
    return-void
.end method

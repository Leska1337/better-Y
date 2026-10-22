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
  .line 742
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
  .line 745
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    invoke-virtual { v1 }, Lcom/innioasis/music/objects/Global;->getRefreshDatabaseState()Z
    move-result v1
    if-eqz v1, :L2
  .line 746
    const-wide/16 v1, 2000
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Albums;->access$000(J)V
  :L1
  .line 774
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 747
    return-void
  :L2
  .line 749
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$100()Ljava/util/List;
    move-result-object v1
  .line 750
    if-nez v1, :L4
  .line 751
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$200()V
  .line 752
    invoke-static { }, Lcom/innioasis/ipp/Schema;->backfill()V
  :L3
  .line 774
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 753
    return-void
  :L4
  .line 755
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$300()J
    move-result-wide v3
  :L5
    sub-long/2addr v1, v3
    const-wide/32 v3, 600000
    cmp-long v5, v1, v3
    if-gez v5, :L6
  .line 774
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 755
    return-void
  :L6
  .line 757
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$400()Ljava/lang/Object;
    move-result-object v1
    monitor-enter v1
  :L7
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$500()I
    move-result v2
    monitor-exit v1
  :L8
  .line 758
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$600()Ljava/lang/String;
    move-result-object v1
  :L9
  .line 759
    if-nez v1, :L10
  .line 774
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 759
    return-void
  :L10
  .line 761
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$400()Ljava/lang/Object;
    move-result-object v3
    monitor-enter v3
  :L11
  .line 762
    invoke-static { }, Lcom/innioasis/ipp/Albums;->access$500()I
    move-result v4
    if-eq v2, v4, :L13
    monitor-exit v3
  :L12
  .line 774
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 762
    return-void
  :L13
  .line 764
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
  .line 765
    if-eqz v2, :L17
  .line 766
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->access$702(Ljava/lang/String;)Ljava/lang/String;
  .line 767
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v4
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/Albums;->access$302(J)J
  :L17
  .line 769
    monitor-exit v3
  :L18
  .line 771
    if-nez v2, :L28
  :L19
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L20
    goto :L28
  :L21
  .line 769
    move-exception v1
  :L22
    monitor-exit v3
  :L23
    throw v1
  :L24
  .line 757
    move-exception v2
  :L25
    monitor-exit v1
  :L26
    throw v2
  :L27
  .line 772
    move-exception v1
  :L28
  .line 774
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->access$802(Z)Z
  .line 775
    nop
  .line 776
    return-void
.end method

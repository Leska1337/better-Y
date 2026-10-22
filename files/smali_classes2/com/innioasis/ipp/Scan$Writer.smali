.class final Lcom/innioasis/ipp/Scan$Writer;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Scan.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Scan;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Writer"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 139
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L1 .. :L2 } :L20
  .catchall { :L2 .. :L6 } :L17
  .catchall { :L6 .. :L7 } :L11
  .catchall { :L7 .. :L8 } :L20
  .catchall { :L8 .. :L10 } :L9
  .catchall { :L10 .. :L12 } :L20
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L13 .. :L14 } :L20
  .catchall { :L15 .. :L16 } :L14
  .catchall { :L16 .. :L17 } :L20
  .catchall { :L18 .. :L19 } :L17
  .catchall { :L19 .. :L20 } :L20
  .catchall { :L21 .. :L23 } :L22
  .registers 10
  .line 144
    nop
  :L0
    const/4 v0, 0
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/util/LinkedList;
    move-result-object v1
    monitor-enter v1
  :L2
  .line 145
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    const-wide/16 v4, 5000
    add-long/2addr v2, v4
  :L3
  .line 146
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/util/LinkedList;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v4
    if-eqz v4, :L5
  .line 147
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    sub-long v4, v2, v4
  .line 148
    const-wide/16 v6, 0
    cmp-long v8, v4, v6
    if-gtz v8, :L4
  .line 149
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->access$102(Z)Z
  .line 150
    monitor-exit v1
    return-void
  :L4
  .line 152
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/util/LinkedList;
    move-result-object v6
    invoke-virtual { v6, v4, v5 }, Ljava/lang/Object;->wait(J)V
  .line 153
    goto :L3
  :L5
  .line 154
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/util/LinkedList;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [Ljava/lang/Object;
  .line 155
    const/4 v3, 1
    invoke-static { v3 }, Lcom/innioasis/ipp/Scan;->access$202(Z)Z
  .line 156
    monitor-exit v1
  :L6
  .line 158
    aget-object v1, v2, v0
    check-cast v1, Lcom/innioasis/y1/database/SongDao;
    aget-object v2, v2, v3
    check-cast v2, [Lcom/innioasis/y1/database/Song;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Scan;->access$300(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  :L7
  .line 160
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/util/LinkedList;
    move-result-object v1
    monitor-enter v1
  :L8
  .line 161
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->access$202(Z)Z
  .line 162
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/util/LinkedList;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 163
    monitor-exit v1
  .line 164
    nop
  .line 165
    goto :L0
  :L9
  .line 163
    move-exception v2
    monitor-exit v1
  :L10
    throw v2
  :L11
  .line 160
    move-exception v1
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/util/LinkedList;
    move-result-object v2
    monitor-enter v2
  :L12
  .line 161
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->access$202(Z)Z
  .line 162
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/util/LinkedList;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/Object;->notifyAll()V
  .line 163
    monitor-exit v2
  :L13
  .line 164
    throw v1
  :L14
  .line 163
    move-exception v1
  :L15
    monitor-exit v2
  :L16
    throw v1
  :L17
  .line 156
    move-exception v2
  :L18
    monitor-exit v1
  :L19
    throw v2
  :L20
  .line 166
    move-exception v1
  .line 167
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/util/LinkedList;
    move-result-object v1
    monitor-enter v1
  :L21
  .line 168
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->access$102(Z)Z
  .line 169
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->access$202(Z)Z
  .line 170
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/util/LinkedList;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 171
    monitor-exit v1
  .line 173
    return-void
  :L22
  .line 171
    move-exception v0
    monitor-exit v1
  :L23
    goto :L25
  :L24
    throw v0
  :L25
    goto :L24
.end method

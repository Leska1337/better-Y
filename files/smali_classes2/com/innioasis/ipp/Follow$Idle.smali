.class final Lcom/innioasis/ipp/Follow$Idle;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Follow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Follow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Idle"
.end annotation

.field private final aRef:Ljava/lang/ref/WeakReference;

.field alive:Z

.field private final lvRef:Ljava/lang/ref/WeakReference;

.method constructor <init>(Ljava/lang/Object;Landroid/widget/ListView;)V
  .registers 4
  .line 266
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 264
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Follow$Idle;->alive:Z
  .line 267
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Follow$Idle;->aRef:Ljava/lang/ref/WeakReference;
  .line 268
    new-instance p1, Ljava/lang/ref/WeakReference;
    invoke-direct { p1, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Follow$Idle;->lvRef:Ljava/lang/ref/WeakReference;
  .line 269
    return-void
.end method

.method adapter()Ljava/lang/Object;
  .registers 2
  .line 272
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Idle;->aRef:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    return-object v0
.end method

.method public run()V
  .catchall { :L0 .. :L5 } :L6
  .registers 9
  .line 278
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Idle;->aRef:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  .line 279
    iget-object v2, p0, Lcom/innioasis/ipp/Follow$Idle;->lvRef:Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
  .line 280
    instance-of v3, v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eqz v3, :L4
    instance-of v3, v2, Landroid/widget/ListView;
    if-nez v3, :L1
    goto :L4
  :L1
  .line 284
    invoke-static { v1 }, Lcom/innioasis/ipp/Follow;->access$000(Ljava/lang/Object;)J
    move-result-wide v3
  .line 285
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-lez v7, :L2
  .line 286
    check-cast v2, Landroid/widget/ListView;
    invoke-virtual { v2, p0, v3, v4 }, Landroid/widget/ListView;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 287
    return-void
  :L2
  .line 289
    iput-boolean v0, p0, Lcom/innioasis/ipp/Follow$Idle;->alive:Z
  .line 292
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v3
    if-eq v3, v1, :L3
    return-void
  :L3
  .line 293
    check-cast v1, Lcom/innioasis/music/adapter/MyBaseAdapter;
    check-cast v2, Landroid/widget/ListView;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Follow;->access$100(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;)V
  .line 296
    goto :L7
  :L4
  .line 281
    iput-boolean v0, p0, Lcom/innioasis/ipp/Follow$Idle;->alive:Z
  :L5
  .line 282
    return-void
  :L6
  .line 294
    move-exception v1
  .line 295
    iput-boolean v0, p0, Lcom/innioasis/ipp/Follow$Idle;->alive:Z
  :L7
  .line 297
    return-void
.end method

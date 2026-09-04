.class final Lcom/innioasis/ipp/Disc$Warm;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Disc.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Disc;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Warm"
.end annotation

.field private final paths:Ljava/util/List;

.method constructor <init>(Ljava/util/List;)V
  .registers 2
  .line 275
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Disc$Warm;->paths:Ljava/util/List;
    return-void
.end method

.method public run()V
  .registers 6
  .line 278
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 279
    const/4 v1, 0
    const/4 v2, 0
  :L0
    iget-object v3, p0, Lcom/innioasis/ipp/Disc$Warm;->paths:Ljava/util/List;
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L1
  .line 280
    iget-object v3, p0, Lcom/innioasis/ipp/Disc$Warm;->paths:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    const/4 v4, 1
    invoke-static { v3, v4, v1 }, Lcom/innioasis/ipp/DiscCache;->read(Ljava/lang/String;ZZ)Lcom/innioasis/ipp/DiscCache$Tags;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 279
    add-int/lit8 v2, v2, 1
    goto :L0
  :L1
  .line 282
    new-instance v1, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct { v1, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v2, Lcom/innioasis/ipp/Disc$Commit;
    iget-object v3, p0, Lcom/innioasis/ipp/Disc$Warm;->paths:Ljava/util/List;
    invoke-direct { v2, v3, v0 }, Lcom/innioasis/ipp/Disc$Commit;-><init>(Ljava/util/List;Ljava/util/List;)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 283
    return-void
.end method

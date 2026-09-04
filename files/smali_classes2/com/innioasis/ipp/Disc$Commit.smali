.class final Lcom/innioasis/ipp/Disc$Commit;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Disc.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Disc;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Commit"
.end annotation

.field private final paths:Ljava/util/List;

.field private final tags:Ljava/util/List;

.method constructor <init>(Ljava/util/List;Ljava/util/List;)V
  .registers 3
  .line 293
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Disc$Commit;->paths:Ljava/util/List;
    iput-object p2, p0, Lcom/innioasis/ipp/Disc$Commit;->tags:Ljava/util/List;
    return-void
.end method

.method public run()V
  .registers 4
  .line 296
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Disc$Commit;->paths:Ljava/util/List;
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L1
  .line 297
    iget-object v1, p0, Lcom/innioasis/ipp/Disc$Commit;->paths:Ljava/util/List;
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
    iget-object v2, p0, Lcom/innioasis/ipp/Disc$Commit;->tags:Ljava/util/List;
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/DiscCache$Tags;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/DiscCache;->commit(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .line 296
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 299
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  .line 300
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->access$002(Ljava/lang/String;)Ljava/lang/String;
  .line 301
    invoke-static { }, Lcom/innioasis/ipp/Lists;->refresh()V
  .line 302
    return-void
.end method

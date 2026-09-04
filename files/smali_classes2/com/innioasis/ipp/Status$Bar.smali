.class final Lcom/innioasis/ipp/Status$Bar;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Status.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Status;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Bar"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 186
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L6 } :L7
  .registers 6
  .line 188
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Status;->access$502(Z)Z
  :L0
  .line 190
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/widget/ListView;
    move-result-object v1
  .line 191
    if-nez v1, :L1
    return-void
  :L1
  .line 192
    invoke-virtual { v1 }, Landroid/widget/ListView;->getContext()Landroid/content/Context;
    move-result-object v2
  .line 193
    instance-of v3, v2, Landroid/app/Activity;
    if-nez v3, :L2
    return-void
  :L2
  .line 194
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v3
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/Status;->access$600(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result v1
    if-eqz v1, :L5
  .line 195
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$700()Z
    move-result v1
    const/4 v3, 1
    if-nez v1, :L3
  .line 196
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$900()Landroid/os/Handler;
    move-result-object v1
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$800()Lcom/innioasis/ipp/Status$Hide;
    move-result-object v4
    invoke-virtual { v1, v4 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 197
    invoke-static { v0 }, Lcom/innioasis/ipp/Status;->access$1002(Z)Z
  .line 198
    invoke-static { v3 }, Lcom/innioasis/ipp/Status;->access$1102(Z)Z
  .line 199
    check-cast v2, Landroid/app/Activity;
    const/16 v0, 8
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/Status;->access$1200(Landroid/app/Activity;I)V
  .line 200
    return-void
  :L3
  .line 202
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$1000()Z
    move-result v0
    if-eqz v0, :L4
    return-void
  :L4
  .line 203
    invoke-static { v3 }, Lcom/innioasis/ipp/Status;->access$1002(Z)Z
  .line 204
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$900()Landroid/os/Handler;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$800()Lcom/innioasis/ipp/Status$Hide;
    move-result-object v1
    const-wide/16 v2, 700
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    goto :L6
  :L5
  .line 206
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$900()Landroid/os/Handler;
    move-result-object v1
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$800()Lcom/innioasis/ipp/Status$Hide;
    move-result-object v3
    invoke-virtual { v1, v3 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 207
    invoke-static { v0 }, Lcom/innioasis/ipp/Status;->access$1002(Z)Z
  .line 208
    invoke-static { v0 }, Lcom/innioasis/ipp/Status;->access$1102(Z)Z
  .line 209
    check-cast v2, Landroid/app/Activity;
    invoke-static { }, Lcom/innioasis/ipp/Status;->access$1300()I
    move-result v0
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/Status;->access$1200(Landroid/app/Activity;I)V
  :L6
  .line 213
    goto :L8
  :L7
  .line 211
    move-exception v0
  :L8
  .line 214
    return-void
.end method

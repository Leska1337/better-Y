.class final Lcom/innioasis/ipp/Status$Hide;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Status.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Status;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Hide"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 218
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 220
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Status;->access$1002(Z)Z
  :L0
  .line 222
    invoke-static { }, Lcom/innioasis/ipp/Follow;->list()Landroid/widget/ListView;
    move-result-object v0
  .line 223
    if-nez v0, :L1
    return-void
  :L1
  .line 224
    invoke-virtual { v0 }, Landroid/widget/ListView;->getContext()Landroid/content/Context;
    move-result-object v1
  .line 225
    instance-of v2, v1, Landroid/app/Activity;
    if-nez v2, :L2
    return-void
  :L2
  .line 226
    invoke-static { }, Lcom/innioasis/ipp/Follow;->adapter()Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v2
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Status;->access$600(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
    move-result v0
    if-nez v0, :L3
    return-void
  :L3
  .line 227
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Status;->access$1102(Z)Z
  .line 228
    check-cast v1, Landroid/app/Activity;
    const/16 v0, 8
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Status;->access$1200(Landroid/app/Activity;I)V
  :L4
  .line 231
    goto :L6
  :L5
  .line 229
    move-exception v0
  :L6
  .line 232
    return-void
.end method

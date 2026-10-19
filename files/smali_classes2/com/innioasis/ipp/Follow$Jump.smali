.class final Lcom/innioasis/ipp/Follow$Jump;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Follow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Follow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Jump"
.end annotation

.field private final a:Lcom/innioasis/music/adapter/MyBaseAdapter;

.field private final lv:Landroid/view/View;

.method constructor <init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;)V
  .registers 3
  .line 549
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 550
    iput-object p1, p0, Lcom/innioasis/ipp/Follow$Jump;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 551
    iput-object p2, p0, Lcom/innioasis/ipp/Follow$Jump;->lv:Landroid/view/View;
  .line 552
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  :L0
  .line 557
    invoke-static { }, Lcom/innioasis/ipp/Follow;->access$300()Ljava/lang/String;
    move-result-object v0
  .line 558
    if-nez v0, :L1
    return-void
  :L1
  .line 559
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Jump;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Follow;->access$400(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;)I
    move-result v0
  .line 560
    if-gez v0, :L2
    return-void
  :L2
  .line 561
    const-wide/16 v1, 0
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Follow;->access$502(J)J
  .line 562
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Jump;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    if-ne v0, v1, :L3
    return-void
  :L3
  .line 563
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Jump;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
    iget-object v2, p0, Lcom/innioasis/ipp/Follow$Jump;->lv:Landroid/view/View;
    invoke-static { v1, v2, v0 }, Lcom/innioasis/ipp/Follow;->land(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/view/View;I)V
  :L4
  .line 565
    goto :L6
  :L5
  .line 564
    move-exception v0
  :L6
  .line 566
    return-void
.end method

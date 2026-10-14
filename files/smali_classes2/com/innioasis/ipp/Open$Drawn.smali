.class final Lcom/innioasis/ipp/Open$Drawn;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Ljava/lang/Runnable;
.source "Open.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Open;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Drawn"
.end annotation

.field private final a:Landroid/app/Activity;

.field private final decor:Landroid/view/View;

.method constructor <init>(Landroid/view/View;Landroid/app/Activity;)V
  .registers 3
  .line 75
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 76
    iput-object p1, p0, Lcom/innioasis/ipp/Open$Drawn;->decor:Landroid/view/View;
  .line 77
    iput-object p2, p0, Lcom/innioasis/ipp/Open$Drawn;->a:Landroid/app/Activity;
  .line 78
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 82
    iget-object v0, p0, Lcom/innioasis/ipp/Open$Drawn;->decor:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
  .line 83
    invoke-virtual { v0 }, Landroid/view/ViewTreeObserver;->isAlive()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 84
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$000()Landroid/app/Activity;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Open$Drawn;->a:Landroid/app/Activity;
    if-ne v0, v1, :L2
    const-string v0, "layout"
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->step(Ljava/lang/String;)V
  :L2
  .line 85
    iget-object v0, p0, Lcom/innioasis/ipp/Open$Drawn;->decor:Landroid/view/View;
    invoke-virtual { v0, p0 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
  :L3
  .line 87
    goto :L5
  :L4
  .line 86
    move-exception v0
  :L5
  .line 88
    const/4 v0, 1
    return v0
.end method

.method public run()V
  .catchall { :L0 .. :L6 } :L8
  .registers 10
  :L0
  .line 93
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$000()Landroid/app/Activity;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Open$Drawn;->a:Landroid/app/Activity;
    if-ne v0, v1, :L7
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$100()Ljava/lang/StringBuilder;
    move-result-object v0
    if-nez v0, :L1
    goto/16 :L7
  :L1
  .line 94
    const-string v0, "draw"
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->step(Ljava/lang/String;)V
  .line 95
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 96
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$200()J
    move-result-wide v2
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-lez v6, :L2
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$300()J
    move-result-wide v2
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$200()J
    move-result-wide v4
    sub-long/2addr v2, v4
    const-wide/16 v4, 5000
    cmp-long v6, v2, v4
    if-gez v6, :L2
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$200()J
    move-result-wide v2
    goto :L3
  :L2
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$300()J
    move-result-wide v2
  :L3
  .line 97
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$300()J
    move-result-wide v4
    sub-long v4, v0, v4
    const-wide/16 v6, 400
    cmp-long v8, v4, v6
    if-gez v8, :L4
    sub-long v4, v0, v2
    const-wide/16 v6, 1000
    cmp-long v8, v4, v6
    if-ltz v8, :L5
  :L4
  .line 98
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "slow: open "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    iget-object v5, p0, Lcom/innioasis/ipp/Open$Drawn;->a:Landroid/app/Activity;
    invoke-virtual { v5 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const/16 v5, 32
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v4
    sub-long/2addr v0, v2
    invoke-virtual { v4, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 99
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$100()Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, ", "
    const-string v3, ": "
    invoke-virtual { v1, v2, v3 }, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 98
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L5
  .line 101
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->access$002(Landroid/app/Activity;)Landroid/app/Activity;
  .line 102
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->access$102(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
  :L6
  .line 104
    goto :L9
  :L7
  .line 93
    return-void
  :L8
  .line 103
    move-exception v0
  :L9
  .line 105
    return-void
.end method

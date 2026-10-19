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
  .line 90
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 91
    iput-object p1, p0, Lcom/innioasis/ipp/Open$Drawn;->decor:Landroid/view/View;
  .line 92
    iput-object p2, p0, Lcom/innioasis/ipp/Open$Drawn;->a:Landroid/app/Activity;
  .line 93
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 97
    iget-object v0, p0, Lcom/innioasis/ipp/Open$Drawn;->decor:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
  .line 98
    invoke-virtual { v0 }, Landroid/view/ViewTreeObserver;->isAlive()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 99
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$000()Landroid/app/Activity;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Open$Drawn;->a:Landroid/app/Activity;
    if-ne v0, v1, :L2
    const-string v0, "layout"
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->step(Ljava/lang/String;)V
  :L2
  .line 100
    iget-object v0, p0, Lcom/innioasis/ipp/Open$Drawn;->decor:Landroid/view/View;
    invoke-virtual { v0, p0 }, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
  :L3
  .line 102
    goto :L5
  :L4
  .line 101
    move-exception v0
  :L5
  .line 103
    const/4 v0, 1
    return v0
.end method

.method public run()V
  .catchall { :L0 .. :L4 } :L6
  .registers 8
  :L0
  .line 108
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$000()Landroid/app/Activity;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Open$Drawn;->a:Landroid/app/Activity;
    if-ne v0, v1, :L5
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$100()Ljava/lang/StringBuilder;
    move-result-object v0
    if-nez v0, :L1
    goto :L5
  :L1
  .line 109
    const-string v0, "draw"
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->step(Ljava/lang/String;)V
  .line 110
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 111
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$200()J
    move-result-wide v2
    sub-long v2, v0, v2
    const-wide/16 v4, 400
    cmp-long v6, v2, v4
    if-gez v6, :L2
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$300()J
    move-result-wide v2
    sub-long v2, v0, v2
    const-wide/16 v4, 1000
    cmp-long v6, v2, v4
    if-ltz v6, :L3
  :L2
  .line 112
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "slow: open "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    iget-object v3, p0, Lcom/innioasis/ipp/Open$Drawn;->a:Landroid/app/Activity;
    invoke-virtual { v3 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v3, 32
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 113
    invoke-static { }, Lcom/innioasis/ipp/Open;->access$300()J
    move-result-wide v3
    sub-long/2addr v0, v3
    invoke-virtual { v2, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
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
  .line 112
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L3
  .line 115
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->access$002(Landroid/app/Activity;)Landroid/app/Activity;
  .line 116
    invoke-static { v0 }, Lcom/innioasis/ipp/Open;->access$102(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
  :L4
  .line 118
    goto :L7
  :L5
  .line 108
    return-void
  :L6
  .line 117
    move-exception v0
  :L7
  .line 119
    return-void
.end method

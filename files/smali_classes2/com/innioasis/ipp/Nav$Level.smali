.class final Lcom/innioasis/ipp/Nav$Level;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Nav.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Nav;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Level"
.end annotation

.field private final act:Ljava/lang/ref/WeakReference;

.field private final back:Z

.method constructor <init>(Landroid/app/Activity;Z)V
  .registers 4
  .line 304
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 305
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Level;->act:Ljava/lang/ref/WeakReference;
  .line 306
    iput-boolean p2, p0, Lcom/innioasis/ipp/Nav$Level;->back:Z
  .line 307
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L8 } :L10
  .registers 10
  .line 311
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Level;->act:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    move-object v3, v0
    check-cast v3, Landroid/app/Activity;
  .line 313
    const/4 v0, 1
    if-nez v3, :L0
    return v0
  :L0
  .line 314
    invoke-virtual { v3 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v1
    invoke-virtual { v1, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 315
    invoke-static { v3 }, Lcom/innioasis/ipp/Nav;->access$000(Landroid/app/Activity;)Z
    move-result v1
    if-eqz v1, :L9
    invoke-virtual { v3 }, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :L9
    sget-object v1, Lcom/innioasis/ipp/Nav;->current:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L9
    sget-object v1, Lcom/innioasis/ipp/Nav;->current:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, v3, :L1
    goto/16 :L9
  :L1
  .line 316
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$500()Ljava/lang/String;
    move-result-object v1
    invoke-static { v3 }, Lcom/innioasis/ipp/Nav;->access$400(Landroid/app/Activity;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return v0
  :L2
  .line 317
    const/4 v1, 0
    invoke-static { v1 }, Lcom/innioasis/ipp/Nav;->access$102(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 318
    invoke-static { v3 }, Lcom/innioasis/ipp/MenuStyle;->half(Landroid/app/Activity;)Landroid/view/View;
    move-result-object v7
  .line 319
    nop
  .line 320
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$600()Z
    move-result v2
    if-eqz v2, :L3
    if-nez v7, :L3
    iget-boolean v2, p0, Lcom/innioasis/ipp/Nav$Level;->back:Z
    if-nez v2, :L3
    invoke-static { v3 }, Lcom/innioasis/ipp/Nav;->access$200(Landroid/app/Activity;)Z
    move-result v2
    if-eqz v2, :L3
  .line 321
    new-instance v8, Lcom/innioasis/ipp/Nav$Run;
    const/4 v4, 0
    const/4 v5, 1
    const/4 v6, 0
    const/4 v7, 0
    move-object v1, v8
    move-object v2, v3
    invoke-direct/range { v1 .. v7 }, Lcom/innioasis/ipp/Nav$Run;-><init>(Landroid/app/Activity;Landroid/app/Activity;ZILandroid/view/View;Landroid/view/View;)V
  .line 322
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$700()I
    move-result v1
    iput v1, v8, Lcom/innioasis/ipp/Nav$Run;->oldEdge:I
    move-object v1, v8
    goto :L5
  :L3
  .line 323
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$600()Z
    move-result v2
    if-nez v2, :L4
    if-eqz v7, :L4
    iget-boolean v2, p0, Lcom/innioasis/ipp/Nav$Level;->back:Z
    if-eqz v2, :L4
  .line 324
    new-instance v8, Lcom/innioasis/ipp/Nav$Run;
    const/4 v4, 1
    const/4 v5, 1
    const/4 v6, 0
    move-object v1, v8
    move-object v2, v3
    invoke-direct/range { v1 .. v7 }, Lcom/innioasis/ipp/Nav$Run;-><init>(Landroid/app/Activity;Landroid/app/Activity;ZILandroid/view/View;Landroid/view/View;)V
    move-object v1, v8
    goto :L5
  :L4
  .line 325
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$800()Z
    move-result v2
    if-eqz v2, :L5
    if-nez v7, :L5
    invoke-static { v3 }, Lcom/innioasis/ipp/Nav;->access$200(Landroid/app/Activity;)Z
    move-result v2
    if-eqz v2, :L5
  .line 326
    new-instance v8, Lcom/innioasis/ipp/Nav$Run;
    iget-boolean v4, p0, Lcom/innioasis/ipp/Nav$Level;->back:Z
    const/4 v5, 2
    const/4 v6, 0
    const/4 v7, 0
    move-object v1, v8
    move-object v2, v3
    invoke-direct/range { v1 .. v7 }, Lcom/innioasis/ipp/Nav$Run;-><init>(Landroid/app/Activity;Landroid/app/Activity;ZILandroid/view/View;Landroid/view/View;)V
    move-object v1, v8
  :L5
  .line 328
    if-nez v1, :L6
    return v0
  :L6
  .line 329
    const/4 v2, 0
    invoke-virtual { v1, v2 }, Lcom/innioasis/ipp/Nav$Run;->preShot(Z)V
  .line 330
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Nav$Run;->begin()Z
    move-result v2
    if-nez v2, :L7
    return v0
  :L7
  .line 331
    sput-object v1, Lcom/innioasis/ipp/Nav;->running:Lcom/innioasis/ipp/Nav$Run;
  :L8
  .line 333
    goto :L11
  :L9
  .line 315
    return v0
  :L10
  .line 332
    move-exception v1
  :L11
  .line 334
    return v0
.end method

.class final Lcom/innioasis/ipp/Nav$Start;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Nav.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Nav;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Start"
.end annotation

.field private final act:Ljava/lang/ref/WeakReference;

.field private final back:Z

.field private final from:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroid/app/Activity;Landroid/app/Activity;Z)V
  .registers 5
  .line 258
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 259
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Start;->act:Ljava/lang/ref/WeakReference;
  .line 260
    new-instance p1, Ljava/lang/ref/WeakReference;
    invoke-direct { p1, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Nav$Start;->from:Ljava/lang/ref/WeakReference;
  .line 261
    iput-boolean p3, p0, Lcom/innioasis/ipp/Nav$Start;->back:Z
  .line 262
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L14 } :L16
  .registers 12
  .line 266
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Start;->act:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    move-object v2, v0
    check-cast v2, Landroid/app/Activity;
  .line 268
    const/4 v0, 1
    if-eqz v2, :L1
  :L0
    invoke-virtual { v2 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    invoke-virtual { v1 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v1
    invoke-virtual { v1, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 269
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Start;->from:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    move-object v3, v1
    check-cast v3, Landroid/app/Activity;
  .line 270
    if-eqz v2, :L15
    if-eqz v3, :L15
    sget-object v1, Lcom/innioasis/ipp/Nav;->current:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L15
    sget-object v1, Lcom/innioasis/ipp/Nav;->current:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, v2, :L2
    goto/16 :L15
  :L2
  .line 271
    invoke-static { v3 }, Lcom/innioasis/ipp/Nav;->access$000(Landroid/app/Activity;)Z
    move-result v8
  .line 272
    const/4 v1, 0
    invoke-static { v1 }, Lcom/innioasis/ipp/Nav;->access$102(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 273
    invoke-static { v3 }, Lcom/innioasis/ipp/MenuStyle;->half(Landroid/app/Activity;)Landroid/view/View;
    move-result-object v6
  .line 274
    invoke-static { v2 }, Lcom/innioasis/ipp/MenuStyle;->half(Landroid/app/Activity;)Landroid/view/View;
    move-result-object v7
  .line 275
    nop
  .line 276
    if-eqz v6, :L3
    if-eqz v7, :L3
  .line 277
    new-instance v9, Lcom/innioasis/ipp/Nav$Run;
    iget-boolean v4, p0, Lcom/innioasis/ipp/Nav$Start;->back:Z
    const/4 v5, 0
    move-object v1, v9
    invoke-direct/range { v1 .. v7 }, Lcom/innioasis/ipp/Nav$Run;-><init>(Landroid/app/Activity;Landroid/app/Activity;ZILandroid/view/View;Landroid/view/View;)V
    move-object v1, v9
    goto :L10
  :L3
  .line 278
    const/4 v4, 3
    if-eqz v6, :L6
  .line 279
    iget-boolean v5, p0, Lcom/innioasis/ipp/Nav$Start;->back:Z
    if-nez v5, :L10
    new-instance v9, Lcom/innioasis/ipp/Nav$Run;
    const/4 v5, 0
    invoke-static { v2 }, Lcom/innioasis/ipp/Nav;->access$200(Landroid/app/Activity;)Z
    move-result v1
    if-eqz v1, :L4
    const/4 v7, 1
    goto :L5
  :L4
    const/4 v7, 3
  :L5
    const/4 v10, 0
    move-object v1, v9
    move v4, v5
    move v5, v7
    move-object v7, v10
    invoke-direct/range { v1 .. v7 }, Lcom/innioasis/ipp/Nav$Run;-><init>(Landroid/app/Activity;Landroid/app/Activity;ZILandroid/view/View;Landroid/view/View;)V
    move-object v1, v9
    goto :L10
  :L6
  .line 280
    if-eqz v7, :L9
  .line 281
    iget-boolean v5, p0, Lcom/innioasis/ipp/Nav$Start;->back:Z
    if-eqz v5, :L10
    new-instance v9, Lcom/innioasis/ipp/Nav$Run;
    const/4 v5, 1
    invoke-static { v3 }, Lcom/innioasis/ipp/Nav;->access$200(Landroid/app/Activity;)Z
    move-result v1
    if-eqz v1, :L7
    const/4 v6, 1
    goto :L8
  :L7
    const/4 v6, 3
  :L8
    const/4 v10, 0
    move-object v1, v9
    move v4, v5
    move v5, v6
    move-object v6, v10
    invoke-direct/range { v1 .. v7 }, Lcom/innioasis/ipp/Nav$Run;-><init>(Landroid/app/Activity;Landroid/app/Activity;ZILandroid/view/View;Landroid/view/View;)V
    move-object v1, v9
    goto :L10
  :L9
  .line 282
    invoke-static { v2 }, Lcom/innioasis/ipp/Nav;->access$200(Landroid/app/Activity;)Z
    move-result v4
    if-eqz v4, :L10
    invoke-static { v3 }, Lcom/innioasis/ipp/Nav;->access$200(Landroid/app/Activity;)Z
    move-result v4
    if-eqz v4, :L10
  .line 283
    new-instance v9, Lcom/innioasis/ipp/Nav$Run;
    iget-boolean v4, p0, Lcom/innioasis/ipp/Nav$Start;->back:Z
    const/4 v5, 2
    const/4 v6, 0
    const/4 v7, 0
    move-object v1, v9
    invoke-direct/range { v1 .. v7 }, Lcom/innioasis/ipp/Nav$Run;-><init>(Landroid/app/Activity;Landroid/app/Activity;ZILandroid/view/View;Landroid/view/View;)V
    move-object v1, v9
  :L10
  .line 285
    if-eqz v1, :L11
    if-eqz v8, :L11
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$300()Z
    move-result v2
    invoke-virtual { v1, v2 }, Lcom/innioasis/ipp/Nav$Run;->preShot(Z)V
  :L11
  .line 286
    if-eqz v1, :L13
    invoke-virtual { v1 }, Lcom/innioasis/ipp/Nav$Run;->begin()Z
    move-result v2
    if-nez v2, :L12
    goto :L13
  :L12
  .line 290
    sput-object v1, Lcom/innioasis/ipp/Nav;->running:Lcom/innioasis/ipp/Nav$Run;
  .line 291
    return v0
  :L13
  .line 287
    invoke-static { }, Lcom/innioasis/ipp/Nav$Popups;->restore()V
  :L14
  .line 288
    return v0
  :L15
  .line 270
    return v0
  :L16
  .line 292
    move-exception v1
  .line 293
    invoke-static { }, Lcom/innioasis/ipp/Nav$Popups;->restore()V
  .line 294
    return v0
.end method

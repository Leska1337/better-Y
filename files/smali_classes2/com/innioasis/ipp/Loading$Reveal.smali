.class final Lcom/innioasis/ipp/Loading$Reveal;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Loading.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Loading;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Reveal"
.end annotation

.field private final bg:Landroid/graphics/drawable/Drawable;

.field private final d:Landroid/app/ProgressDialog;

.field private final dimmed:Z

.method constructor <init>(Landroid/app/ProgressDialog;Landroid/graphics/drawable/Drawable;Z)V
  .registers 4
  .line 395
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 396
    iput-object p1, p0, Lcom/innioasis/ipp/Loading$Reveal;->d:Landroid/app/ProgressDialog;
  .line 397
    iput-object p2, p0, Lcom/innioasis/ipp/Loading$Reveal;->bg:Landroid/graphics/drawable/Drawable;
  .line 398
    iput-boolean p3, p0, Lcom/innioasis/ipp/Loading$Reveal;->dimmed:Z
  .line 399
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L5 } :L6
  .registers 3
  :L0
  .line 403
    iget-object v0, p0, Lcom/innioasis/ipp/Loading$Reveal;->d:Landroid/app/ProgressDialog;
    invoke-virtual { v0 }, Landroid/app/ProgressDialog;->isShowing()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 404
    iget-object v0, p0, Lcom/innioasis/ipp/Loading$Reveal;->d:Landroid/app/ProgressDialog;
    invoke-virtual { v0 }, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;
    move-result-object v0
  .line 405
    if-nez v0, :L2
    return-void
  :L2
  .line 406
    iget-object v1, p0, Lcom/innioasis/ipp/Loading$Reveal;->bg:Landroid/graphics/drawable/Drawable;
    if-eqz v1, :L3
    invoke-virtual { v0, v1 }, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
  :L3
  .line 407
    iget-boolean v1, p0, Lcom/innioasis/ipp/Loading$Reveal;->dimmed:Z
    if-eqz v1, :L4
    const/4 v1, 2
    invoke-virtual { v0, v1 }, Landroid/view/Window;->addFlags(I)V
  :L4
  .line 408
    invoke-virtual { v0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    const/4 v1, 1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Loading;->access$000(Landroid/view/View;Z)V
  :L5
  .line 410
    goto :L7
  :L6
  .line 409
    move-exception v0
  :L7
  .line 411
    return-void
.end method

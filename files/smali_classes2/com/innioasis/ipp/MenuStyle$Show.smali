.class final Lcom/innioasis/ipp/MenuStyle$Show;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "MenuStyle.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/MenuStyle;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Show"
.end annotation

.field private final d:Landroid/graphics/drawable/Drawable;

.field private final id:I

.field private final view:Ljava/lang/ref/WeakReference;

.method constructor <init>(Ljava/lang/ref/WeakReference;ILandroid/graphics/drawable/Drawable;)V
  .registers 4
  .line 675
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 676
    iput-object p1, p0, Lcom/innioasis/ipp/MenuStyle$Show;->view:Ljava/lang/ref/WeakReference;
  .line 677
    iput p2, p0, Lcom/innioasis/ipp/MenuStyle$Show;->id:I
  .line 678
    iput-object p3, p0, Lcom/innioasis/ipp/MenuStyle$Show;->d:Landroid/graphics/drawable/Drawable;
  .line 679
    return-void
.end method

.method public run()V
  .registers 5
  .line 682
    iget-object v0, p0, Lcom/innioasis/ipp/MenuStyle$Show;->view:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/widget/ImageView;
  .line 683
    if-eqz v0, :L1
    iget v1, p0, Lcom/innioasis/ipp/MenuStyle$Show;->id:I
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    const v2, 2131362147
    invoke-virtual { v0, v2 }, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L0
    goto :L1
  :L0
  .line 684
    const/4 v1, 0
    invoke-virtual { v0, v2, v1 }, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V
  .line 685
    iget-object v1, p0, Lcom/innioasis/ipp/MenuStyle$Show;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  .line 686
    return-void
  :L1
  .line 683
    return-void
.end method

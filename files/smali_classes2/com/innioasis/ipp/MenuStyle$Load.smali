.class final Lcom/innioasis/ipp/MenuStyle$Load;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "MenuStyle.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/MenuStyle;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Load"
.end annotation

.field private final id:I

.field private final r:Landroid/content/res/Resources;

.field private final show:Ljava/lang/ref/WeakReference;

.field private final w:I

.method constructor <init>(Landroid/content/res/Resources;IILandroid/widget/ImageView;)V
  .registers 5
  .line 651
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 652
    iput-object p1, p0, Lcom/innioasis/ipp/MenuStyle$Load;->r:Landroid/content/res/Resources;
  .line 653
    iput p2, p0, Lcom/innioasis/ipp/MenuStyle$Load;->id:I
  .line 654
    iput p3, p0, Lcom/innioasis/ipp/MenuStyle$Load;->w:I
  .line 655
    if-nez p4, :L0
    const/4 p1, 0
    goto :L1
  :L0
    new-instance p1, Ljava/lang/ref/WeakReference;
    invoke-direct { p1, p4 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L1
    iput-object p1, p0, Lcom/innioasis/ipp/MenuStyle$Load;->show:Ljava/lang/ref/WeakReference;
  .line 656
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L9
  .catchall { :L1 .. :L2 } :L6
  .catchall { :L3 .. :L5 } :L9
  .catchall { :L7 .. :L8 } :L6
  .catchall { :L8 .. :L9 } :L9
  .registers 6
  :L0
  .line 661
    invoke-static { }, Lcom/innioasis/ipp/MenuStyle;->access$200()Ljava/util/HashMap;
    move-result-object v0
    monitor-enter v0
  :L1
    invoke-static { }, Lcom/innioasis/ipp/MenuStyle;->access$200()Ljava/util/HashMap;
    move-result-object v1
    iget v2, p0, Lcom/innioasis/ipp/MenuStyle$Load;->id:I
    iget v3, p0, Lcom/innioasis/ipp/MenuStyle$Load;->w:I
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/MenuStyle;->access$300(II)Ljava/lang/Long;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/graphics/drawable/Drawable;
    monitor-exit v0
  :L2
  .line 662
    if-nez v1, :L4
  :L3
    iget-object v0, p0, Lcom/innioasis/ipp/MenuStyle$Load;->r:Landroid/content/res/Resources;
    iget v1, p0, Lcom/innioasis/ipp/MenuStyle$Load;->id:I
    iget v2, p0, Lcom/innioasis/ipp/MenuStyle$Load;->w:I
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/MenuStyle;->access$400(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
    move-result-object v1
  :L4
  .line 663
    if-eqz v1, :L5
    iget-object v0, p0, Lcom/innioasis/ipp/MenuStyle$Load;->show:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L5
    invoke-static { }, Lcom/innioasis/ipp/MenuStyle;->access$500()Landroid/os/Handler;
    move-result-object v0
    new-instance v2, Lcom/innioasis/ipp/MenuStyle$Show;
    iget-object v3, p0, Lcom/innioasis/ipp/MenuStyle$Load;->show:Ljava/lang/ref/WeakReference;
    iget v4, p0, Lcom/innioasis/ipp/MenuStyle$Load;->id:I
    invoke-direct { v2, v3, v4, v1 }, Lcom/innioasis/ipp/MenuStyle$Show;-><init>(Ljava/lang/ref/WeakReference;ILandroid/graphics/drawable/Drawable;)V
    invoke-virtual { v0, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L5
  .line 665
    goto :L10
  :L6
  .line 661
    move-exception v1
  :L7
    monitor-exit v0
  :L8
    throw v1
  :L9
  .line 664
    move-exception v0
  :L10
  .line 666
    return-void
.end method

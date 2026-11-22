.class final Lcom/innioasis/ipp/MenuStyle$VideoLevel;
.super Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;
.source "MenuStyle.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/MenuStyle;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "VideoLevel"
.end annotation

.field private final act:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroid/app/Activity;)V
  .registers 3
  .line 361
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;-><init>()V
  .line 362
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/MenuStyle$VideoLevel;->act:Ljava/lang/ref/WeakReference;
  .line 363
    return-void
.end method

.method public onChanged()V
  .registers 2
  .line 367
    iget-object v0, p0, Lcom/innioasis/ipp/MenuStyle$VideoLevel;->act:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/app/Activity;
  .line 368
    if-eqz v0, :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/MenuStyle;->section(Landroid/app/Activity;)V
  :L0
  .line 369
    return-void
.end method

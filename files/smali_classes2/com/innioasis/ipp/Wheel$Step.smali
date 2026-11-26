.class final Lcom/innioasis/ipp/Wheel$Step;
.super Ljava/lang/Object;
.implements Landroid/view/Choreographer$FrameCallback;
.source "Wheel.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wheel;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Step"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 266
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public doFrame(J)V
  .registers 5
  .line 268
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$300()Z
    move-result p1
    if-nez p1, :L0
    return-void
  :L0
  .line 269
    const/4 p1, 0
    invoke-static { p1 }, Lcom/innioasis/ipp/Wheel;->access$302(Z)Z
  .line 270
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$400()Ljava/lang/ref/WeakReference;
    move-result-object p1
    const/4 p2, 0
    if-nez p1, :L1
    move-object p1, p2
    goto :L2
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$400()Ljava/lang/ref/WeakReference;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;
  :L2
  .line 271
    invoke-static { p2 }, Lcom/innioasis/ipp/Wheel;->access$402(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 272
    invoke-static { p1 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object p2
  .line 273
    if-nez p2, :L3
    return-void
  :L3
  .line 274
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$500()I
    move-result v0
    invoke-virtual { p2 }, Lcom/innioasis/ipp/SongRows;->cursor()I
    move-result v1
    invoke-static { p1, v0, v1, p2 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;IILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .line 275
    return-void
.end method

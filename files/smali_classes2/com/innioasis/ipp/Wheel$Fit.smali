.class final Lcom/innioasis/ipp/Wheel$Fit;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Wheel.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wheel;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Fit"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 214
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L7 } :L9
  .registers 8
  :L0
  .line 217
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$000()Ljava/lang/ref/WeakReference;
    move-result-object v0
    const/4 v1, 0
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$000()Ljava/lang/ref/WeakReference;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L2
  .line 218
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$100()I
    move-result v2
  .line 219
    invoke-static { v1 }, Lcom/innioasis/ipp/Wheel;->access$002(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 220
    const/4 v1, -1
    invoke-static { v1 }, Lcom/innioasis/ipp/Wheel;->access$102(I)I
  .line 221
    instance-of v1, v0, Landroid/widget/ListView;
    if-eqz v1, :L8
    if-gez v2, :L3
    goto :L8
  :L3
  .line 222
    check-cast v0, Landroid/widget/ListView;
  .line 223
    invoke-virtual { v0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v1
    sub-int v1, v2, v1
    invoke-virtual { v0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 224
    if-nez v1, :L4
    return-void
  :L4
  .line 225
    invoke-static { v0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result v3
  .line 226
    invoke-virtual { v0 }, Landroid/widget/ListView;->getHeight()I
    move-result v4
    invoke-virtual { v0 }, Landroid/widget/ListView;->getPaddingBottom()I
    move-result v5
    sub-int/2addr v4, v5
  .line 227
    invoke-virtual { v1 }, Landroid/view/View;->getHeight()I
    move-result v5
    sub-int v6, v4, v3
    if-le v5, v6, :L5
    return-void
  :L5
  .line 228
    invoke-virtual { v1 }, Landroid/view/View;->getBottom()I
    move-result v5
    if-le v5, v4, :L6
  .line 229
    invoke-virtual { v1 }, Landroid/view/View;->getHeight()I
    move-result v1
    sub-int/2addr v4, v1
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
    goto :L7
  :L6
  .line 230
    invoke-virtual { v1 }, Landroid/view/View;->getTop()I
    move-result v1
    if-ge v1, v3, :L7
  .line 231
    invoke-static { v0, v2, v3 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
  :L7
  .line 234
    goto :L10
  :L8
  .line 221
    return-void
  :L9
  .line 233
    move-exception v0
  :L10
  .line 235
    return-void
.end method

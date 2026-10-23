.class final Lcom/innioasis/ipp/Fixed$Heal;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Fixed.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Fixed;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Heal"
.end annotation

.field private final rv:Lcom/innioasis/ipp/Fixed;

.method constructor <init>(Lcom/innioasis/ipp/Fixed;)V
  .registers 2
  .line 144
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed$Heal;->rv:Lcom/innioasis/ipp/Fixed;
    return-void
.end method

.method private static force(Landroid/view/View;)V
  .registers 3
  .line 164
    if-eqz p0, :L3
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v0
    const/16 v1, 8
    if-ne v0, v1, :L0
    goto :L3
  :L0
  .line 165
    invoke-virtual { p0 }, Landroid/view/View;->forceLayout()V
  .line 166
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :L2
  .line 167
    check-cast p0, Landroid/view/ViewGroup;
  .line 168
    const/4 v0, 0
  :L1
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L2
    invoke-virtual { p0, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Fixed$Heal;->force(Landroid/view/View;)V
    add-int/lit8 v0, v0, 1
    goto :L1
  :L2
  .line 170
    return-void
  :L3
  .line 164
    return-void
.end method

.method public onPreDraw()Z
  .registers 10
  .line 147
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Heal;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-static { v0 }, Lcom/innioasis/ipp/Fixed;->access$400(Lcom/innioasis/ipp/Fixed;)Z
    move-result v0
    const/4 v1, 1
    if-nez v0, :L0
    return v1
  :L0
  .line 148
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Heal;->rv:Lcom/innioasis/ipp/Fixed;
    const/4 v2, 0
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Fixed;->access$402(Lcom/innioasis/ipp/Fixed;Z)Z
  .line 150
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 151
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Heal;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-static { v0 }, Lcom/innioasis/ipp/Fixed;->access$500(Lcom/innioasis/ipp/Fixed;)J
    move-result-wide v5
    sub-long v5, v3, v5
    const-wide/16 v7, 300
    cmp-long v0, v5, v7
    if-gez v0, :L1
    return v1
  :L1
  .line 152
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Heal;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-static { v0, v3, v4 }, Lcom/innioasis/ipp/Fixed;->access$502(Lcom/innioasis/ipp/Fixed;J)J
  .line 153
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Heal;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v0, v0, Landroid/view/ViewGroup;
    if-nez v0, :L2
    return v1
  :L2
  .line 154
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Heal;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 155
    const/4 v1, 0
  :L3
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v1, v3, :L5
  .line 156
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 157
    iget-object v4, p0, Lcom/innioasis/ipp/Fixed$Heal;->rv:Lcom/innioasis/ipp/Fixed;
    if-eq v3, v4, :L4
    invoke-static { v3 }, Lcom/innioasis/ipp/Fixed$Heal;->force(Landroid/view/View;)V
  :L4
  .line 155
    add-int/lit8 v1, v1, 1
    goto :L3
  :L5
  .line 159
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->requestLayout()V
  .line 160
    return v2
.end method

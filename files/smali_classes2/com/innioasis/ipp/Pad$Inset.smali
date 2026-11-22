.class final Lcom/innioasis/ipp/Pad$Inset;
.super Ljava/lang/Object;
.implements Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;
.source "Pad.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Pad;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Inset"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 109
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public onChildViewAttachedToWindow(Landroid/view/View;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  :L0
  .line 113
    invoke-virtual { p1 }, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "fixed_menu_pad"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Pad;->access$000(Landroid/view/View;Z)V
  :L3
  .line 115
    goto :L5
  :L4
  .line 114
    move-exception p1
  :L5
  .line 116
    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
  .registers 2
  .line 119
    return-void
.end method

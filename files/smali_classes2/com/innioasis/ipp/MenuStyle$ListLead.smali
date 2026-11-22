.class final Lcom/innioasis/ipp/MenuStyle$ListLead;
.super Ljava/lang/Object;
.implements Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;
.source "MenuStyle.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/MenuStyle;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "ListLead"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 804
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public onChildViewAttachedToWindow(Landroid/view/View;)V
  .registers 2
  .line 807
    invoke-static { p1 }, Lcom/innioasis/ipp/MenuStyle;->access$600(Landroid/view/View;)V
  .line 808
    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
  .registers 2
  .line 811
    return-void
.end method

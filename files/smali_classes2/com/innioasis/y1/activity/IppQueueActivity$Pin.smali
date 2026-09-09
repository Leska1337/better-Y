.class final Lcom/innioasis/y1/activity/IppQueueActivity$Pin;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Pin"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppQueueActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .registers 2
  .line 891
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 892
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Pin;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
  .line 893
    return-void
.end method

.method public onPreDraw()Z
  .registers 2
  .line 900
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Pin;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repin()V
  .line 903
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Pin;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->stretch()Z
    move-result v0
    xor-int/lit8 v0, v0, 1
    return v0
.end method

.method public onScrollChanged()V
  .registers 2
  .line 896
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Pin;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->repin()V
  .line 897
    return-void
.end method

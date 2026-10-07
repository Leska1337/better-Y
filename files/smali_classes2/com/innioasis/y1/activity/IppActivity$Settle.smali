.class final Lcom/innioasis/y1/activity/IppActivity$Settle;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Settle"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 2
  .line 451
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Settle;->a:Lcom/innioasis/y1/activity/IppActivity;
    return-void
.end method

.method public onPreDraw()Z
  .registers 3
  .line 454
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Settle;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->access$000(Lcom/innioasis/y1/activity/IppActivity;)Landroid/widget/ScrollView;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 455
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Settle;->a:Lcom/innioasis/y1/activity/IppActivity;
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->access$100(Lcom/innioasis/y1/activity/IppActivity;Z)V
  .line 456
    const/4 v0, 1
    return v0
.end method

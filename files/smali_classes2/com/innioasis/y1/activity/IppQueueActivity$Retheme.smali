.class final Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Retheme"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppQueueActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .registers 2
  .line 1597
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    return-void
.end method

.method public run()V
  .registers 4
  .line 1599
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->isFinishing()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 1600
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$000(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/widget/LinearLayout;
    move-result-object v0
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$000(Lcom/innioasis/y1/activity/IppQueueActivity;)Landroid/widget/LinearLayout;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->access$100(Lcom/innioasis/y1/activity/IppQueueActivity;)I
    move-result v1
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->bandAlpha()I
    move-result v2
    or-int/2addr v1, v2
    invoke-virtual { v0, v1 }, Landroid/widget/LinearLayout;->setBackgroundColor(I)V
  :L1
  .line 1601
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Retheme;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->render()V
  .line 1602
    return-void
.end method

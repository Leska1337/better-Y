.class final Lcom/innioasis/y1/activity/IppActivity$Scroll;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Scroll"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 2
  .line 523
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Scroll;->a:Lcom/innioasis/y1/activity/IppActivity;
    return-void
.end method

.method public run()V
  .registers 3
  .line 525
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Scroll;->a:Lcom/innioasis/y1/activity/IppActivity;
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->access$002(Lcom/innioasis/y1/activity/IppActivity;Z)Z
  .line 526
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Scroll;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->access$100(Lcom/innioasis/y1/activity/IppActivity;)V
  .line 527
    return-void
.end method

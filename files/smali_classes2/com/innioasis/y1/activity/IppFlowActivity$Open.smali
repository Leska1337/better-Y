.class final Lcom/innioasis/y1/activity/IppFlowActivity$Open;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Open"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 2
  .line 2170
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Open;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    return-void
.end method

.method public run()V
  .registers 2
  .line 2172
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Open;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->openPlayer()V
    return-void
.end method

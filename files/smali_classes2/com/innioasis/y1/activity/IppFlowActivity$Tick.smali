.class final Lcom/innioasis/y1/activity/IppFlowActivity$Tick;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Tick"
.end annotation

.field private final p:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity$Panel;)V
  .registers 2
  .line 2154
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tick;->p:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    return-void
.end method

.method public run()V
  .registers 2
  .line 2156
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tick;->p:Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->tick()V
    return-void
.end method

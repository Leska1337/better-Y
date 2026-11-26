.class final Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "BackDone"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final b:Lcom/innioasis/ipp/Flow$Back;

.field private final it:Lcom/innioasis/ipp/Flow$Item;

.field private final t0:J

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
  .registers 6
  .line 1810
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1811
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;->it:Lcom/innioasis/ipp/Flow$Item;
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;->b:Lcom/innioasis/ipp/Flow$Back;
    iput-wide p4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;->t0:J
  .line 1812
    return-void
.end method

.method public run()V
  .registers 6
  .line 1814
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;->it:Lcom/innioasis/ipp/Flow$Item;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;->b:Lcom/innioasis/ipp/Flow$Back;
    iget-wide v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;->t0:J
    invoke-virtual { v0, v1, v2, v3, v4 }, Lcom/innioasis/y1/activity/IppFlowActivity;->backDone(Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
    return-void
.end method

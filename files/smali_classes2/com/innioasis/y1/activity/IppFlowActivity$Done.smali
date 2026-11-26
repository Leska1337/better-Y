.class final Lcom/innioasis/y1/activity/IppFlowActivity$Done;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Done"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final s:I

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;I)V
  .registers 3
  .line 1883
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Done;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Done;->s:I
    return-void
.end method

.method public run()V
  .registers 3
  .line 1885
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Done;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Done;->s:I
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->done(I)V
    return-void
.end method

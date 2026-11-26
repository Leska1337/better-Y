.class final Lcom/innioasis/y1/activity/IppFlowActivity$Opts$Look;
.super Lcom/innioasis/ipp/Column$Painter;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Look"
.end annotation

.field private final o:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity$Opts;)V
  .registers 2
  .line 1055
    invoke-direct { p0 }, Lcom/innioasis/ipp/Column$Painter;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts$Look;->o:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    return-void
.end method

.method public paint(I)V
  .registers 3
  .line 1057
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Opts$Look;->o:Lcom/innioasis/y1/activity/IppFlowActivity$Opts;
    invoke-static { v0, p1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Opts;->access$000(Lcom/innioasis/y1/activity/IppFlowActivity$Opts;I)V
    return-void
.end method

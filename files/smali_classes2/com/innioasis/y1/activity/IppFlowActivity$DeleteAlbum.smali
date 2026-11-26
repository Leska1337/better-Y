.class final Lcom/innioasis/y1/activity/IppFlowActivity$DeleteAlbum;
.super Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "DeleteAlbum"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final it:Lcom/innioasis/ipp/Flow$Item;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
  .registers 3
  .line 1987
    invoke-direct { p0 }, Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteAlbum;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteAlbum;->it:Lcom/innioasis/ipp/Flow$Item;
    return-void
.end method

.method public cancel()V
  .registers 1
  .line 1994
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 1990
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteAlbum;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteAlbum;->it:Lcom/innioasis/ipp/Flow$Item;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->delete(Lcom/innioasis/ipp/Flow$Item;)V
    return-void
.end method

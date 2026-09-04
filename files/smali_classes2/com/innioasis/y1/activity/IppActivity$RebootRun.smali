.class final Lcom/innioasis/y1/activity/IppActivity$RebootRun;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "RebootRun"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 2
  .line 881
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 882
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$RebootRun;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 883
    return-void
.end method

.method public run()V
  .registers 3
  .line 888
    invoke-static { }, Lcom/innioasis/ipp/Force;->saveState()V
  .line 889
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$RebootRun;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppActivity;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/music/util/Other;->reboot(Landroid/content/Context;)V
  .line 890
    return-void
.end method

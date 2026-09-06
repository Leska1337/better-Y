.class final Lcom/innioasis/y1/activity/IppActivity$SfRun;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "SfRun"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 2
  .line 837
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 838
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SfRun;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 839
    return-void
.end method

.method public run()V
  .catch Ljava/lang/InterruptedException; { :L2 .. :L3 } :L4
  .registers 4
  .line 842
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SfRun;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Panel;->report(Landroid/content/Context;)Ljava/io/File;
    move-result-object v0
  .line 843
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$SfRun;->a:Lcom/innioasis/y1/activity/IppActivity;
    new-instance v2, Lcom/innioasis/y1/activity/IppActivity$SfToast;
    if-nez v0, :L0
    const-string v0, "?"
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v0
  :L1
    invoke-direct { v2, v1, v0 }, Lcom/innioasis/y1/activity/IppActivity$SfToast;-><init>(Lcom/innioasis/y1/activity/IppActivity;Ljava/lang/String;)V
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 845
    const-wide/16 v0, 2500
  :L2
    invoke-static { v0, v1 }, Ljava/lang/Thread;->sleep(J)V
  :L3
  .line 848
    goto :L5
  :L4
  .line 846
    move-exception v0
  .line 847
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Thread;->interrupt()V
  :L5
  .line 849
    invoke-static { }, Lcom/innioasis/ipp/Panel;->restart()V
  .line 850
    return-void
.end method

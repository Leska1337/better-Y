.class final Lcom/innioasis/y1/activity/IppActivity$Tick;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Tick"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.field private final text:Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;Ljava/lang/String;)V
  .registers 3
  .line 1550
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1551
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Tick;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1552
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Tick;->text:Ljava/lang/String;
  .line 1553
    return-void
.end method

.method public run()V
  .registers 3
  .line 1557
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Tick;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->access$900(Lcom/innioasis/y1/activity/IppActivity;)Lcom/innioasis/y1/utils/LoadingDialog;
    move-result-object v0
  .line 1558
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/LoadingDialog;->isShowing()Z
    move-result v1
    if-eqz v1, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$Tick;->text:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/utils/LoadingDialog;->show(Ljava/lang/String;)V
  :L0
  .line 1559
    return-void
.end method

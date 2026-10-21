.class final Lcom/innioasis/ipp/Pick$ClearTask;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Pick.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Pick;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "ClearTask"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/SettingActivity;

.field private final dialog:Lcom/innioasis/y1/utils/LoadingDialog;

.field private final mask:I

.method constructor <init>(Lcom/innioasis/y1/activity/SettingActivity;ILcom/innioasis/y1/utils/LoadingDialog;)V
  .registers 4
  .line 98
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 99
    iput-object p1, p0, Lcom/innioasis/ipp/Pick$ClearTask;->a:Lcom/innioasis/y1/activity/SettingActivity;
  .line 100
    iput p2, p0, Lcom/innioasis/ipp/Pick$ClearTask;->mask:I
  .line 101
    iput-object p3, p0, Lcom/innioasis/ipp/Pick$ClearTask;->dialog:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 102
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  :L0
  .line 106
    iget v0, p0, Lcom/innioasis/ipp/Pick$ClearTask;->mask:I
    invoke-static { v0 }, Lcom/innioasis/ipp/Pick;->clear(I)V
  :L1
  .line 108
    goto :L3
  :L2
  .line 107
    move-exception v0
  :L3
  .line 110
    iget-object v0, p0, Lcom/innioasis/ipp/Pick$ClearTask;->a:Lcom/innioasis/y1/activity/SettingActivity;
    new-instance v1, Lcom/innioasis/ipp/Pick$Done;
    iget-object v2, p0, Lcom/innioasis/ipp/Pick$ClearTask;->dialog:Lcom/innioasis/y1/utils/LoadingDialog;
    invoke-direct { v1, v0, v2 }, Lcom/innioasis/ipp/Pick$Done;-><init>(Lcom/innioasis/y1/activity/SettingActivity;Lcom/innioasis/y1/utils/LoadingDialog;)V
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L4
  .line 112
    goto :L6
  :L5
  .line 111
    move-exception v0
  :L6
  .line 113
    return-void
.end method

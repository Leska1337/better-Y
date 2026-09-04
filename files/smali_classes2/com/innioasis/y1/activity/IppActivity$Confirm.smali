.class final Lcom/innioasis/y1/activity/IppActivity$Confirm;
.super Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Confirm"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.field private final action:I

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;I)V
  .registers 3
  .line 897
    invoke-direct { p0 }, Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;-><init>()V
  .line 898
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 899
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->action:I
  .line 900
    return-void
.end method

.method public cancel()V
  .registers 1
  .line 917
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 904
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->action:I
    if-nez v0, :L0
  .line 905
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity;->postReboot()V
    goto :L3
  :L0
  .line 906
    const/4 v1, 2
    if-ne v0, v1, :L1
  .line 907
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity;->startSfRestart()V
    goto :L3
  :L1
  .line 908
    const/4 v1, 3
    if-ne v0, v1, :L2
  .line 909
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->save(Landroid/app/Activity;)V
    goto :L3
  :L2
  .line 911
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity;->runFullRescan()V
  :L3
  .line 913
    return-void
.end method

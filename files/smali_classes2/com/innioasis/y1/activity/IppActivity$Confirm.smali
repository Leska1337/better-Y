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
  .line 1079
    invoke-direct { p0 }, Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;-><init>()V
  .line 1080
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1081
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->action:I
  .line 1082
    return-void
.end method

.method public cancel()V
  .registers 1
  .line 1095
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 1086
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->action:I
    const/4 v1, 2
    if-ne v0, v1, :L0
  .line 1087
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->save(Landroid/app/Activity;)V
    goto :L1
  :L0
  .line 1089
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Confirm;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity;->runFullRescan()V
  :L1
  .line 1091
    return-void
.end method

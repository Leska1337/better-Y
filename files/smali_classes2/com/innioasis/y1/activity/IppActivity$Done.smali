.class final Lcom/innioasis/y1/activity/IppActivity$Done;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Done"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.field private final updated:I

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;I)V
  .registers 3
  .line 1637
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1638
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Done;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1639
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$Done;->updated:I
  .line 1640
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  .line 1644
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Done;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->access$900(Lcom/innioasis/y1/activity/IppActivity;)Lcom/innioasis/y1/utils/LoadingDialog;
    move-result-object v0
  .line 1645
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$Done;->a:Lcom/innioasis/y1/activity/IppActivity;
    const/4 v2, 0
    invoke-static { v1, v2 }, Lcom/innioasis/y1/activity/IppActivity;->access$902(Lcom/innioasis/y1/activity/IppActivity;Lcom/innioasis/y1/utils/LoadingDialog;)Lcom/innioasis/y1/utils/LoadingDialog;
  .line 1646
    if-eqz v0, :L3
  :L0
  .line 1647
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/LoadingDialog;->dismiss()V
  :L1
    goto :L3
  :L2
    move-exception v0
  :L3
  .line 1649
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "update library finished: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$Done;->updated:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " song(s) re-read"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1650
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity$Done;->updated:I
    const/4 v1, 1
    if-nez v0, :L4
  .line 1651
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Done;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v2, 2131821051
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    goto :L5
  :L4
  .line 1652
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$Done;->a:Lcom/innioasis/y1/activity/IppActivity;
    new-array v3, v1, [Ljava/lang/Object;
    const/4 v4, 0
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    aput-object v0, v3, v4
    const v0, 2131821052
    invoke-virtual { v2, v0, v3 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
  :L5
  .line 1653
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$Done;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v2 }, Lcom/innioasis/y1/activity/IppActivity;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-static { v2, v0, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/widget/Toast;->show()V
  .line 1654
    return-void
.end method

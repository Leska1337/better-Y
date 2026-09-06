.class final Lcom/innioasis/y1/activity/IppActivity$CacheDone;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "CacheDone"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.field private final albums:I

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;I)V
  .registers 3
  .line 1541
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1542
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1543
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;->albums:I
  .line 1544
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  .line 1548
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity;->access$700(Lcom/innioasis/y1/activity/IppActivity;)Lcom/innioasis/y1/utils/LoadingDialog;
    move-result-object v0
  .line 1549
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;->a:Lcom/innioasis/y1/activity/IppActivity;
    const/4 v2, 0
    invoke-static { v1, v2 }, Lcom/innioasis/y1/activity/IppActivity;->access$702(Lcom/innioasis/y1/activity/IppActivity;Lcom/innioasis/y1/utils/LoadingDialog;)Lcom/innioasis/y1/utils/LoadingDialog;
  .line 1550
    if-eqz v0, :L3
  :L0
  .line 1551
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/LoadingDialog;->dismiss()V
  :L1
    goto :L3
  :L2
    move-exception v0
  :L3
  .line 1553
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "cache library finished: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;->albums:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " album(s) cached"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1554
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;->albums:I
    const/4 v1, 1
    if-gtz v0, :L4
  .line 1555
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v2, 2131821075
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    goto :L5
  :L4
  .line 1556
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;->a:Lcom/innioasis/y1/activity/IppActivity;
    new-array v3, v1, [Ljava/lang/Object;
    const/4 v4, 0
    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    aput-object v0, v3, v4
    const v0, 2131821076
    invoke-virtual { v2, v0, v3 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
  :L5
  .line 1557
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheDone;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v2 }, Lcom/innioasis/y1/activity/IppActivity;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-static { v2, v0, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/widget/Toast;->show()V
  .line 1558
    return-void
.end method

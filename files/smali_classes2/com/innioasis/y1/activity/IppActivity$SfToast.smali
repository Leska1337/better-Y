.class final Lcom/innioasis/y1/activity/IppActivity$SfToast;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "SfToast"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.field private final path:Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;Ljava/lang/String;)V
  .registers 3
  .line 819
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 820
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SfToast;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 821
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$SfToast;->path:Ljava/lang/String;
  .line 822
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 826
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SfToast;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity;->getContext()Landroid/content/Context;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$SfToast;->path:Ljava/lang/String;
    const/4 v2, 1
    invoke-static { v0, v1, v2 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/widget/Toast;->show()V
  :L1
  .line 829
    goto :L3
  :L2
  .line 827
    move-exception v0
  :L3
  .line 830
    return-void
.end method

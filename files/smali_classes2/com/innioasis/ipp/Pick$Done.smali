.class final Lcom/innioasis/ipp/Pick$Done;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Pick.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Pick;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Done"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/SettingActivity;

.field private final dialog:Lcom/innioasis/y1/utils/LoadingDialog;

.method constructor <init>(Lcom/innioasis/y1/activity/SettingActivity;Lcom/innioasis/y1/utils/LoadingDialog;)V
  .registers 3
  .line 203
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 204
    iput-object p1, p0, Lcom/innioasis/ipp/Pick$Done;->a:Lcom/innioasis/y1/activity/SettingActivity;
  .line 205
    iput-object p2, p0, Lcom/innioasis/ipp/Pick$Done;->dialog:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 206
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  .line 209
    iget-object v0, p0, Lcom/innioasis/ipp/Pick$Done;->dialog:Lcom/innioasis/y1/utils/LoadingDialog;
    if-eqz v0, :L3
  :L0
  .line 210
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/LoadingDialog;->dismiss()V
  :L1
    goto :L3
  :L2
    move-exception v0
  :L3
  .line 214
    iget-object v0, p0, Lcom/innioasis/ipp/Pick$Done;->a:Lcom/innioasis/y1/activity/SettingActivity;
    const v1, 2131820575
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/SettingActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    const/4 v2, 0
    invoke-static { v0, v1, v2 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
  .line 215
    invoke-virtual { v0 }, Landroid/widget/Toast;->show()V
  :L4
  .line 217
    goto :L6
  :L5
  .line 216
    move-exception v0
  :L6
  .line 218
    iget-object v0, p0, Lcom/innioasis/ipp/Pick$Done;->a:Lcom/innioasis/y1/activity/SettingActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/CacheSize;->refresh(Lcom/innioasis/y1/activity/SettingActivity;)V
  .line 219
    return-void
.end method

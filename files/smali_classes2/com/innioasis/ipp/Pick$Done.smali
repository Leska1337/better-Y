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
  .line 108
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 109
    iput-object p1, p0, Lcom/innioasis/ipp/Pick$Done;->a:Lcom/innioasis/y1/activity/SettingActivity;
  .line 110
    iput-object p2, p0, Lcom/innioasis/ipp/Pick$Done;->dialog:Lcom/innioasis/y1/utils/LoadingDialog;
  .line 111
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 114
    iget-object v0, p0, Lcom/innioasis/ipp/Pick$Done;->dialog:Lcom/innioasis/y1/utils/LoadingDialog;
    if-eqz v0, :L3
  :L0
  .line 115
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/LoadingDialog;->dismiss()V
  :L1
    goto :L3
  :L2
    move-exception v0
  :L3
  .line 117
    iget-object v0, p0, Lcom/innioasis/ipp/Pick$Done;->a:Lcom/innioasis/y1/activity/SettingActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/CacheSize;->refresh(Lcom/innioasis/y1/activity/SettingActivity;)V
  .line 118
    return-void
.end method

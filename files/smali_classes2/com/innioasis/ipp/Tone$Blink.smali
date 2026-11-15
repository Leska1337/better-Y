.class final Lcom/innioasis/ipp/Tone$Blink;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Tone.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Tone;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Blink"
.end annotation

.field private final tv:Landroid/widget/TextView;

.method constructor <init>(Landroid/widget/TextView;)V
  .registers 2
  .line 670
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Tone$Blink;->tv:Landroid/widget/TextView;
    return-void
.end method

.method public run()V
  .registers 4
  .line 672
    invoke-static { }, Lcom/innioasis/ipp/Tone;->access$600()Lcom/innioasis/y1/activity/SettingActivity;
    move-result-object v0
    if-nez v0, :L0
    return-void
  :L0
  .line 673
    iget-object v0, p0, Lcom/innioasis/ipp/Tone$Blink;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v0
    if-nez v0, :L1
  .line 674
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Tone;->access$602(Lcom/innioasis/y1/activity/SettingActivity;)Lcom/innioasis/y1/activity/SettingActivity;
  .line 675
    return-void
  :L1
  .line 677
    iget-object v0, p0, Lcom/innioasis/ipp/Tone$Blink;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getVisibility()I
    move-result v1
    if-nez v1, :L2
    const/4 v1, 4
    goto :L3
  :L2
    const/4 v1, 0
  :L3
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 678
    invoke-static { }, Lcom/innioasis/ipp/Tone;->access$700()Landroid/os/Handler;
    move-result-object v0
    const-wide/16 v1, 400
    invoke-virtual { v0, p0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 679
    return-void
.end method

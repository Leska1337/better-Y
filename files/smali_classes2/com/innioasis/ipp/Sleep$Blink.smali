.class final Lcom/innioasis/ipp/Sleep$Blink;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Sleep.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Sleep;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Blink"
.end annotation

.field private final tv:Landroid/widget/TextView;

.method constructor <init>(Landroid/widget/TextView;)V
  .registers 2
  .line 131
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Sleep$Blink;->tv:Landroid/widget/TextView;
    return-void
.end method

.method public run()V
  .registers 4
  .line 133
    invoke-static { }, Lcom/innioasis/ipp/Sleep;->access$000()Lcom/innioasis/y1/activity/SettingActivity;
    move-result-object v0
    if-nez v0, :L0
    return-void
  :L0
  .line 134
    iget-object v0, p0, Lcom/innioasis/ipp/Sleep$Blink;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v0
    if-nez v0, :L1
  .line 135
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Sleep;->access$002(Lcom/innioasis/y1/activity/SettingActivity;)Lcom/innioasis/y1/activity/SettingActivity;
  .line 136
    return-void
  :L1
  .line 138
    iget-object v0, p0, Lcom/innioasis/ipp/Sleep$Blink;->tv:Landroid/widget/TextView;
    invoke-virtual { v0 }, Landroid/widget/TextView;->getVisibility()I
    move-result v1
    if-nez v1, :L2
    const/4 v1, 4
    goto :L3
  :L2
    const/4 v1, 0
  :L3
    invoke-virtual { v0, v1 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 139
    invoke-static { }, Lcom/innioasis/ipp/Sleep;->access$100()Landroid/os/Handler;
    move-result-object v0
    const-wide/16 v1, 400
    invoke-virtual { v0, p0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 140
    return-void
.end method

.class final Lcom/innioasis/y1/activity/IppSaverActivity$Rearm;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppSaverActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppSaverActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Rearm"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppSaverActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppSaverActivity;)V
  .registers 2
  .line 699
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 700
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Rearm;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
  .line 701
    return-void
.end method

.method public run()V
  .registers 2
  .line 705
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Rearm;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->isFinishing()Z
    move-result v0
    if-nez v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Rearm;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$500(Lcom/innioasis/y1/activity/IppSaverActivity;)V
  :L0
  .line 706
    return-void
.end method

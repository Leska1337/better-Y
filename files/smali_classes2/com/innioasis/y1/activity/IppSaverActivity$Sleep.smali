.class final Lcom/innioasis/y1/activity/IppSaverActivity$Sleep;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppSaverActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppSaverActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Sleep"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppSaverActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppSaverActivity;)V
  .registers 2
  .line 662
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 663
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Sleep;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
  .line 664
    return-void
.end method

.method public run()V
  .registers 2
  .line 668
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Sleep;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$100(Lcom/innioasis/y1/activity/IppSaverActivity;)V
  .line 669
    return-void
.end method

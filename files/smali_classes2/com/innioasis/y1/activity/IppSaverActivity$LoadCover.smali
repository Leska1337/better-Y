.class final Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppSaverActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppSaverActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "LoadCover"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppSaverActivity;

.field private final path:Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/activity/IppSaverActivity;Ljava/lang/String;)V
  .registers 3
  .line 713
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 714
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
  .line 715
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;->path:Ljava/lang/String;
  .line 716
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  .line 720
    nop
  :L0
  .line 722
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;->path:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L1
  .line 724
    goto :L3
  :L2
  .line 723
    move-exception v0
    const/4 v0, 0
  :L3
  .line 725
    if-eqz v0, :L4
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$200(Lcom/innioasis/y1/activity/IppSaverActivity;)Landroid/os/Handler;
    move-result-object v1
    new-instance v2, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadCover;->path:Ljava/lang/String;
    invoke-direct { v2, v3, v4, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L4
  .line 726
    return-void
.end method

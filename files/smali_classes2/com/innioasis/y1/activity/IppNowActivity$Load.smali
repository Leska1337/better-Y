.class final Lcom/innioasis/y1/activity/IppNowActivity$Load;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppNowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppNowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Load"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppNowActivity;

.field private final p:Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/activity/IppNowActivity;Ljava/lang/String;)V
  .registers 3
  .line 307
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 308
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppNowActivity$Load;->a:Lcom/innioasis/y1/activity/IppNowActivity;
  .line 309
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppNowActivity$Load;->p:Ljava/lang/String;
  .line 310
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
  .line 314
    nop
  :L0
  .line 316
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity$Load;->p:Ljava/lang/String;
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L1
  .line 318
    goto :L3
  :L2
  .line 317
    move-exception v0
    const/4 v0, 0
  :L3
  .line 319
    if-eqz v0, :L4
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppNowActivity$Load;->a:Lcom/innioasis/y1/activity/IppNowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppNowActivity;->access$000(Lcom/innioasis/y1/activity/IppNowActivity;)Landroid/os/Handler;
    move-result-object v1
    new-instance v2, Lcom/innioasis/y1/activity/IppNowActivity$Got;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppNowActivity$Load;->a:Lcom/innioasis/y1/activity/IppNowActivity;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppNowActivity$Load;->p:Ljava/lang/String;
    invoke-direct { v2, v3, v4, v0 }, Lcom/innioasis/y1/activity/IppNowActivity$Got;-><init>(Lcom/innioasis/y1/activity/IppNowActivity;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L4
  .line 320
    return-void
.end method

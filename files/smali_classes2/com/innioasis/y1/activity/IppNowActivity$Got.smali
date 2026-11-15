.class final Lcom/innioasis/y1/activity/IppNowActivity$Got;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppNowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppNowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Got"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppNowActivity;

.field private final b:Landroid/graphics/Bitmap;

.field private final p:Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/activity/IppNowActivity;Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .registers 4
  .line 328
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 329
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppNowActivity$Got;->a:Lcom/innioasis/y1/activity/IppNowActivity;
  .line 330
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppNowActivity$Got;->p:Ljava/lang/String;
  .line 331
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppNowActivity$Got;->b:Landroid/graphics/Bitmap;
  .line 332
    return-void
.end method

.method public run()V
  .registers 3
  .line 336
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity$Got;->a:Lcom/innioasis/y1/activity/IppNowActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppNowActivity;->isFinishing()Z
    move-result v0
    if-nez v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity$Got;->p:Ljava/lang/String;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppNowActivity$Got;->a:Lcom/innioasis/y1/activity/IppNowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppNowActivity;->access$100(Lcom/innioasis/y1/activity/IppNowActivity;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 337
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity$Got;->a:Lcom/innioasis/y1/activity/IppNowActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppNowActivity$Got;->b:Landroid/graphics/Bitmap;
    invoke-static { v0, v1 }, Lcom/innioasis/y1/activity/IppNowActivity;->access$202(Lcom/innioasis/y1/activity/IppNowActivity;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 338
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppNowActivity$Got;->a:Lcom/innioasis/y1/activity/IppNowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppNowActivity;->access$300(Lcom/innioasis/y1/activity/IppNowActivity;)V
  .line 339
    return-void
  :L1
  .line 336
    return-void
.end method

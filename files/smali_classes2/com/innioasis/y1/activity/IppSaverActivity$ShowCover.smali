.class final Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppSaverActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppSaverActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "ShowCover"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppSaverActivity;

.field private final b:Landroid/graphics/Bitmap;

.field private final path:Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/activity/IppSaverActivity;Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .registers 4
  .line 734
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 735
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
  .line 736
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->path:Ljava/lang/String;
  .line 737
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->b:Landroid/graphics/Bitmap;
  .line 738
    return-void
.end method

.method public run()V
  .registers 3
  .line 742
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->path:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$602(Lcom/innioasis/y1/activity/IppSaverActivity;Ljava/lang/String;)Ljava/lang/String;
  .line 743
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->b:Landroid/graphics/Bitmap;
    invoke-static { v0, v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$702(Lcom/innioasis/y1/activity/IppSaverActivity;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 744
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$800(Lcom/innioasis/y1/activity/IppSaverActivity;)Landroid/widget/ImageView;
    move-result-object v0
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->path:Ljava/lang/String;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$900(Lcom/innioasis/y1/activity/IppSaverActivity;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$800(Lcom/innioasis/y1/activity/IppSaverActivity;)Landroid/widget/ImageView;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowCover;->b:Landroid/graphics/Bitmap;
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  :L0
  .line 745
    return-void
.end method

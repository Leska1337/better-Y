.class final Lcom/innioasis/y1/activity/IppSaverActivity$ShowWall;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppSaverActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppSaverActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "ShowWall"
.end annotation

.field private final b:Landroid/graphics/Bitmap;

.field private final v:Landroid/widget/ImageView;

.method constructor <init>(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
  .registers 3
  .line 670
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 671
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowWall;->v:Landroid/widget/ImageView;
  .line 672
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowWall;->b:Landroid/graphics/Bitmap;
  .line 673
    return-void
.end method

.method public run()V
  .registers 3
  .line 677
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowWall;->v:Landroid/widget/ImageView;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$ShowWall;->b:Landroid/graphics/Bitmap;
    invoke-virtual { v0, v1 }, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 678
    return-void
.end method

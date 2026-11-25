.class final Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppSaverActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppSaverActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "LoadWall"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppSaverActivity;

.field private final path:Ljava/lang/String;

.field private final v:Landroid/widget/ImageView;

.method constructor <init>(Lcom/innioasis/y1/activity/IppSaverActivity;Landroid/widget/ImageView;Ljava/lang/String;)V
  .registers 4
  .line 753
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 754
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
  .line 755
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;->v:Landroid/widget/ImageView;
  .line 756
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;->path:Ljava/lang/String;
  .line 757
    return-void
.end method

.method public run()V
  .registers 5
  .line 761
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;->path:Ljava/lang/String;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Saver;->loadWall(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 762
    if-nez v0, :L0
    sget-object v0, Lcom/innioasis/y1/utils/WallpaperUtils;->INSTANCE:Lcom/innioasis/y1/utils/WallpaperUtils;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/WallpaperUtils;->getGlobalBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
  :L0
  .line 763
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$200(Lcom/innioasis/y1/activity/IppSaverActivity;)Landroid/os/Handler;
    move-result-object v1
    new-instance v2, Lcom/innioasis/y1/activity/IppSaverActivity$ShowWall;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppSaverActivity$LoadWall;->v:Landroid/widget/ImageView;
    invoke-direct { v2, v3, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity$ShowWall;-><init>(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L1
  .line 764
    return-void
.end method

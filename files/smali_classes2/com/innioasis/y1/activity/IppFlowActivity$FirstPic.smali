.class final Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "FirstPic"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final b:Landroid/graphics/Bitmap;

.field private final path:Ljava/lang/String;

.field private final src:[Ljava/lang/Object;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/lang/String;Landroid/graphics/Bitmap;[Ljava/lang/Object;)V
  .registers 5
  .line 883
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 884
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;->path:Ljava/lang/String;
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;->b:Landroid/graphics/Bitmap;
    iput-object p4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;->src:[Ljava/lang/Object;
  .line 885
    return-void
.end method

.method public run()V
  .registers 5
  .line 887
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;->path:Ljava/lang/String;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;->b:Landroid/graphics/Bitmap;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;->src:[Ljava/lang/Object;
    invoke-virtual { v0, v1, v2, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity;->aheadFirst(Ljava/lang/String;Landroid/graphics/Bitmap;[Ljava/lang/Object;)V
    return-void
.end method

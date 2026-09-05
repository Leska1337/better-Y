.class final Lcom/innioasis/y1/activity/IppActivity$CachePick;
.super Lcom/innioasis/ipp/PickDialog$Go;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "CachePick"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 2
  .line 792
    invoke-direct { p0 }, Lcom/innioasis/ipp/PickDialog$Go;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CachePick;->a:Lcom/innioasis/y1/activity/IppActivity;
    return-void
.end method

.method public go(I)V
  .registers 3
  .line 796
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CachePick;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->runCacheLibrary(I)V
  .line 797
    return-void
.end method
